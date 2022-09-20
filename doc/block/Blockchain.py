import dbm
from email import message
import json
from time import *
import hashlib
from uuid import uuid4
from webbrowser import get
from flask import Flask, jsonify, request, flash
from textwrap import dedent
from urllib.parse import urlparse
from flask_sqlalchemy import SQLAlchemy
import requests
from werkzeug.security import generate_password_hash
from werkzeug.security import check_password_hash
import Dao


class Blockchain(object):

    def __init__(self):
        self.chain = []  # 存储区块链
        self.nodes = set()  # 我们使用了set()保存节点列表。这是确保添加新节点是幂等的一种廉价方法——这意味着无论我们添加多少次特定节点，它都只会出现一次。

        self.current_transactions = []  # 用来存储交易

        # 创建创世区块
    def genesis_Block(self):
        self.new_block(previous_hash='1', proof=100)
        """ 区块格式
         block = {
            'index': 1,
            'timestamp': time(),
            'transactions': [],
            'proof': 100,
            'previous_hash': 1, 
            } """

   # 将入库交易添加到区块的current_transactions
    def new_transaction(self, in_num, operator, product_number):
        self.current_transactions.append({
            'id': self.last_block['index']*100+len(self.current_transactions),
            'in_num': in_num,
            'operator': operator,
            'product_number': product_number,
        })

        return self.last_block['index'] + 1  # 返回新块的index

    # 将出交易添加到区块的current_transactions
    def new_transaction1(self, out_num, operator, product_number, consumer_id):
        self.current_transactions.append({
            'consumer_id': consumer_id,
            'id': self.last_block['index']*100+len(self.current_transactions),
            'operator': operator,
            'out_num': out_num,
            'product_number': product_number,
        })

        return self.last_block['index'] + 1  # 返回新块的index

    # 创建区块Block将区块添加到链中
    def new_block(self, proof, previous_hash=None):
        a = None
        if len(self.chain) == 0:
            a = 0
        else:
            a = self.last_block['index']

        block = {
            'index': a + 1,
            # 表达式从左至右运算，若 or 的左侧逻辑值为 True ，则短路 or 后所有的表达式（不管是 and 还是 or），直接输出 or 左侧表达式 。
            'previous_hash': previous_hash or self.hash(self.chain[-1]),
            'proof': proof,
            'timestamp': str(time()),
            'transactions': self.current_transactions,
        }

        # Reset the current list of transactions
        self.current_transactions = []

        self.chain.append(block)
        return block

    # 哈希算法
    @staticmethod  # 静态方法
    def hash(block):

        # We must make sure that the Dictionary is Ordered, or we'll have inconsistent hashes
        block_string = json.dumps(block, sort_keys=True).encode()
        return hashlib.sha256(block_string).hexdigest()

    #  查询返回最新块

    @property
    def last_block(self):
        return self.chain[-1]

    # 查询current_transactions中的交易数量
    @property
    def long_current_transactions(self):
        return len(self.current_transactions)

    # 工作量证明

    def proof_of_work(self, last_block):
        proof = 0
        while self.valid_proof(self.hash(last_block), proof) is False:
            proof += 1

        return proof

    # 工作量证明算法
    @staticmethod
    def valid_proof(previous_hash, proof):
        guess = f'{previous_hash}{proof}'.encode()
        guess_hash = hashlib.sha256(guess).hexdigest()
        return guess_hash[:4] == "0000"

    # 注册新的节点

    def register_node(self, address):
        parsed_url = urlparse(address)
        self.nodes.add(parsed_url.netloc)

    # 负责通过循环遍历每个块并验证哈希和证明来检查链是否有效。
    def valid_chain(self, chain):
        last_block = chain[0]
        current_index = 1

        while current_index < len(chain):
            block = chain[current_index]
            print(f'{last_block}')
            print(f'{block}')
            print("\n-----------\n")
            # Check that the hash of the block is correct 检查块的哈希是否正确
            if block['previous_hash'] != self.hash(last_block):
                return False

            # Check that the Proof of Work is correct 检查工作证明是否正确
            if not self.valid_proof(self.hash(last_block), block['proof']):
                return False

            last_block = block
            current_index += 1

        return True


class Users():
    def __init__(self, user):
        self.username = user.get("username")
        self.password = user.get("password")
        self.node_identifier = user.get("node_identifier")

    def verify_password(self, password):
        """密码验证"""
        if self.password is None:
            return False
        return check_password_hash(self.password, password)


""" 创建接口：

/transactions/new 创建一个交易并添加到区块
/mine 告诉服务器去挖掘新的区块
/chain 返回整个区块链 
/nodes/register接受 URL 形式的新节点列表。
/nodes/resolve实施我们的共识算法，解决任何冲突——确保节点具有正确的链。
"""
# （实例化我们的节点）
app = Flask(__name__)


session = {}


# （实例化 Blockchain类）
blockchain = Blockchain()


def mine():
    # 我们运行工作量证明算法以获得下一个证明...
    last_block = blockchain.last_block

    proof = blockchain.proof_of_work(last_block)

    # 通过将其添加到链中来伪造新区块
    previous_hash = blockchain.hash(last_block)
    block = blockchain.new_block(proof, previous_hash)

    response = {
        'mine_message': "新块锻造",
        'index': block['index'],
        'transactions': block['transactions'],
        'proof': block['proof'],
        'previous_hash': block['previous_hash'],
    }
    return response


# 一种遍历我们所有相邻节点，下载它们的链并使用上述方法验证它们的方法。如果找到一个有效链，其长度大于我们的，我们替换我们的。
def resolve_conflicts():
    neighbours = blockchain.nodes
    new_chain = None
    full_chain = get_full_chain()
    # 我们只是在寻找比我们更长的链条
    max_length = len(full_chain)

    # 从我们网络中的所有节点抓取并验证链
    for node in neighbours:
        try:
            response = requests.get(f'http://{node}/fullchain')
        except Exception as e:
            print(e)
        else:
            if response.status_code == 200:
                length = response.json()['length']
                chain = response.json()['chain']

                # Check if the length is longer and the chain is valid 检查长度是否更长且链是否有效
                if length > max_length and blockchain.valid_chain(chain):
                    max_length = length
                    new_chain = chain
            if response.status_code == 201:
                print('我们的节点并未在对方处注册！')
    # 如果我们发现一个新的有效链比我们的链长，请替换我们的链
    if new_chain:
        # 清空数据库链
        Dao.record_clear()
        # 清空当前链
        blockchain.chain = []
        # 把前面的n-1个块存进数据库
        a = new_chain[0:-1]
        blockchain.chain.append(new_chain[-1])
        Dao.save_full_chain(a)
        return True
    return False


# 共识算法，判断区块的长度
def consensus():
    replaced = resolve_conflicts()

    if replaced:

        # 通知前端
        response = {
            'consensus_message': '我们的链条被更换了'
        }
    else:
        response = {
            'consensus_message': '我们的链条是权威的'
        }
    return response


# 合并两个字典的内容
def merge_dict(x, y):
    for k, v in x.items():
        if k in y.keys():
            y[k] += v
        else:
            y[k] = v


# 把两个区块相加//当前前台区块链只保存1个区块，保存第二个区块的时候就存储第一个区块
def get_full_chain():
    db_chain = Dao.get_db_allchain()
    db_chain = list(reversed(db_chain))
    return db_chain+blockchain.chain


# 新用户注册，单用户多次注册无效，注册时会为用户生成起始区块
@app.route('/register', methods=['POST'])
def register():
    username = request.form.get('username')
    password = request.form.get('password')
    password2 = request.form.get('password2')

    if not all([username, password, password2]):
        return {'message': "参数不完整"}
    elif password != password2:
        return {'message': "两次密码不一致"}
    else:
        #global user
        # Generate a globally unique address for this node（为这个节点生成一个全球唯一的地址）
        node_identifier = str(uuid4()).replace('-', '')
        #user = Users(username=username, password=password,node_identifier=node_identifier)
        Dao.save_user(username, generate_password_hash(
            password), node_identifier)
        blockchain.genesis_Block()  # 创建创世块
        return {'message': "注册成功！"}


# 用户登录
@app.route('/login', methods=['POST'])
def login():
    if 'username' in session:
        response = {
            'message': '已登录',
            'session_id': session['session_id']
        }
    else:
        values = request.get_json()
        # 检查必填字段是否在 POST 的数据中
        required = ['username', 'password']
        if values['username'] == None or values['password'] == None:
            return{'message': "账号或者密码为空"}
        user = Dao.get_db_users()
        if not all(k in values for k in required):
            return 'Missing values', 400
        user = Users(user)
        if user.verify_password(values['password']):
            session['username'] = values['username']
            session['session_id'] = str(uuid4()).replace('-', '')
            if len(blockchain.chain) == 0:
                # 提取数据库最后一个块，存入内存链中
                blockchain.chain.append(Dao.get_db_lastblock())
                last_block = Dao.get_db_lastblock()
                Dao.del_db_lastblock(last_block['index'])
                # 从数据库提取为写入块的交易
                blockchain.current_transactions = Dao.get_db_current_traintions()
                # 删除数据库中未成块的交易
                Dao.current_traintions_clear()
                # 从数据库读取节点记录
                nodes = Dao.get_db_nodes()
                Dao.current_netloc_clear()

                for node in nodes:
                    blockchain.register_node('http://'+node)
            response = {
                'message': '登陆成功',
                'session_id': session['session_id']
            }
        else:
            response = {
                'message': '密码错误'
            }
    return response


# 添加交易，每添加十次交易创建一个区块，并创建前对链路进行共识检测，之后保存区块[-2]
@app.route('/transactions/new', methods=['POST'])
def new_transaction():  # 创建新的交易
    if 'username' in session:
        values = request.get_json()

        # 检查必填字段是否在 POST 的数据中
        required = ['in_num', 'operator', 'product_number', 'session_id']
        required1 = ['out_num', 'operator',
                     'product_number', 'consumer_id', 'session_id']
        index = None

        if 'username' in session and session['session_id'] == values['session_id'] and 'session_id' in values:
            # if 1:
            if all(k in values for k in required):
                index = blockchain.new_transaction(
                    values['in_num'], values['operator'], values['product_number'])
            elif all(k in values for k in required1):
                index = blockchain.new_transaction1(
                    values['out_num'], values['operator'], values['product_number'], values['consumer_id'])
            else:
                return 'Missing values', 400
            # 检测交易current_transactions中交易的数量
            if blockchain.long_current_transactions == 10:
                response2 = consensus()
                response1 = mine()

                # 把前一个块保存进数据库
                if len(blockchain.chain) == 2:
                    zero_block = blockchain.chain.pop(0)
                    Dao.save_block(zero_block)
                else:
                    return {'message': "error"}

                response = {'message': f'交易被加入区块 {index}'}
                merge_dict(response1, response)
                merge_dict(response2, response)
            else:
                response = {'message': f'交易将会被加入区块 {index}'}

            return jsonify(response), 201
        else:
            return {'message': "会话id错误"}
    else:
        return {'message': "您还没有登录！"}


# 获取完整区块链，用于反馈其他节点请求
@app.route('/fullchain', methods=['GET'])
def show_fullchain():
    ip = request.remote_addr
    ip_registered = []
    for ip1 in blockchain.nodes:
        a = ip1.split(':')
        ip_registered.append(a[0])

    if ip in ip_registered:
        full_chain = get_full_chain()
        # print(full_chain)
        response = {
            'chain': full_chain,
            'length': len(full_chain)
        }
        return jsonify(response), 200
    else:
        return jsonify('该ip不在白名单中'), 201


# 获取完整区块链，用于应对用户请求
@app.route('/getfullchain', methods=['POST'])
def show_user_fullchain():
    values = request.get_json()
    required = ['session_id']
    if all(k in values for k in required):
        # 判断是否登录
        if 'username' in session and session['session_id'] == values['session_id']:
            response2 = consensus()
            full_chain = get_full_chain()
            # print(full_chain)
            response = {
                'chain': full_chain,
                'length': len(full_chain)
            }
            return jsonify(response), 200
        else:
            return {'message': "您还没有登录！或者会话id错误"}
    else:
        return 'Missing values', 400


# 停止登录状态，保存临时内容
@app.route('/halt', methods=['GET'])
def halt():
    Dao.save_current_traintions(blockchain.current_transactions)
    blockchain.current_transactions = []

    Dao.save_nodes(blockchain.nodes)
    # 保存最后一个块，并清空当前链
    Dao.save_block(blockchain.chain[-1])
    blockchain.chain = []

    session.clear()

    response = {
        'message': '登出成功',
    }
    return jsonify(response), 201
    # 将current_traintions存入数据库


# 用于节点注册
@app.route('/nodes/register', methods=['POST'])
def register_nodes():
    values = request.get_json()
    required = ['session_id', 'nodes']
    if all(k in values for k in required):
        if 'username' in session and session['session_id'] == values['session_id']:
            nodes = values.get('nodes')
            if nodes is None:
                response = {
                    'message': '该节点无效',
                }
            else:
                for node in nodes:
                    blockchain.register_node(node)
                response = {
                    'message': '已添加新节点',
                    'total_nodes': list(blockchain.nodes),
                }
        else:
            return {'message': "您还没有登录！或者会话id错误"}
    else:
        return 'Missing values', 400

    return jsonify(response), 201


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
