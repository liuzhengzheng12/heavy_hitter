import pd_base_tests

from ptf import config

from res_pd_rpc.ttypes import *
from ptf.testutils import *
from ptf.thriftutils import *
from heavy_hitter.p4_pd_rpc.ttypes import *

INSTANCE_NAME = 'heavy_hitter'

class Test(pd_base_tests.ThriftInterfaceDataPlane):
    def __init__(self):
        pd_base_tests.ThriftInterfaceDataPlane.__init__(self,
                                                        [INSTANCE_NAME])
        self.instance_name = INSTANCE_NAME

   def setUp(self):
       pass

   def runTest(self):
       pass
