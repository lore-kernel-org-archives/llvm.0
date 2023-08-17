Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03EFD518;
	Thu, 17 Aug 2023 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692267463; x=1723803463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2TdxTFvAxEcugLZVQ4zi6NYTIp4xHNfdQbFm3caGkAc=;
  b=k6olKfYeTk6nyd09PFSIWlbpDu/xFkfkEJgjwq1LRTE6QVftZcHAN6SO
   gwxIS/B+hWD4lv1HqQXgZxLyFDQBGV9X1b3Gxv0Ta4VXYyTzudAqHuSs6
   NSNj9gQ6Bys8X7o6jeEEKq3CgGIlsggiRQDumeBVTgSNLDXpdlBkTD+eB
   Z2RXA+ld8wTltvrj44pVmaMqyDR2pQnqpFwuBcpe/2o6jRatAfkKiN5dD
   QIpFDGMlQ45SH90bouOj44CY+a8PvoKSwj0es0uCg/MrsZlA9DbGiWcLi
   oaMUx6sYl8UX0npeX05XMyNJ28g74pWLyyAhpClD4FdQyzkRrXb4JCyaC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357734466"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="357734466"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 03:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769588775"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="769588775"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 03:17:36 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWa4N-000125-2v;
	Thu, 17 Aug 2023 10:17:35 +0000
Date: Thu, 17 Aug 2023 18:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lew <quic_clew@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Deepak Kumar Singh <quic_deesin@quicinc.com>,
	Sarannya S <quic_sarannya@quicinc.com>
Subject: [linux-next:master 1976/10848] drivers/rpmsg/rpmsg_char.c:75:
 warning: Function parameter or member 'remote_flow_restricted' not described
 in 'rpmsg_eptdev'
Message-ID: <202308171801.P2Rd8yeL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
commit: 5550201c0fe26a76c53983bd36a58d4c4395ec22 [1976/10848] rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support
config: riscv-randconfig-r036-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171801.P2Rd8yeL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171801.P2Rd8yeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171801.P2Rd8yeL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or member 'remote_flow_restricted' not described in 'rpmsg_eptdev'
>> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or member 'remote_flow_updated' not described in 'rpmsg_eptdev'


vim +75 drivers/rpmsg/rpmsg_char.c

c0cdc19f84a471 Bjorn Andersson  2017-01-11  41  
c0cdc19f84a471 Bjorn Andersson  2017-01-11  42  /**
c0cdc19f84a471 Bjorn Andersson  2017-01-11  43   * struct rpmsg_eptdev - endpoint device context
c0cdc19f84a471 Bjorn Andersson  2017-01-11  44   * @dev:	endpoint device
c0cdc19f84a471 Bjorn Andersson  2017-01-11  45   * @cdev:	cdev for the endpoint device
c0cdc19f84a471 Bjorn Andersson  2017-01-11  46   * @rpdev:	underlaying rpmsg device
c0cdc19f84a471 Bjorn Andersson  2017-01-11  47   * @chinfo:	info used to open the endpoint
c0cdc19f84a471 Bjorn Andersson  2017-01-11  48   * @ept_lock:	synchronization of @ept modifications
c0cdc19f84a471 Bjorn Andersson  2017-01-11  49   * @ept:	rpmsg endpoint reference, when open
c0cdc19f84a471 Bjorn Andersson  2017-01-11  50   * @queue_lock:	synchronization of @queue operations
c0cdc19f84a471 Bjorn Andersson  2017-01-11  51   * @queue:	incoming message queue
c0cdc19f84a471 Bjorn Andersson  2017-01-11  52   * @readq:	wait object for incoming queue
bea9b79c2d10fe Arnaud Pouliquen 2022-01-24  53   * @default_ept: set to channel default endpoint if the default endpoint should be re-used
bea9b79c2d10fe Arnaud Pouliquen 2022-01-24  54   *              on device open to prevent endpoint address update.
5550201c0fe26a Chris Lew        2023-07-07  55   * remote_flow_restricted: to indicate if the remote has requested for flow to be limited
5550201c0fe26a Chris Lew        2023-07-07  56   * remote_flow_updated: to indicate if the flow control has been requested
c0cdc19f84a471 Bjorn Andersson  2017-01-11  57   */
c0cdc19f84a471 Bjorn Andersson  2017-01-11  58  struct rpmsg_eptdev {
c0cdc19f84a471 Bjorn Andersson  2017-01-11  59  	struct device dev;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  60  	struct cdev cdev;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  61  
c0cdc19f84a471 Bjorn Andersson  2017-01-11  62  	struct rpmsg_device *rpdev;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  63  	struct rpmsg_channel_info chinfo;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  64  
c0cdc19f84a471 Bjorn Andersson  2017-01-11  65  	struct mutex ept_lock;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  66  	struct rpmsg_endpoint *ept;
bea9b79c2d10fe Arnaud Pouliquen 2022-01-24  67  	struct rpmsg_endpoint *default_ept;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  68  
c0cdc19f84a471 Bjorn Andersson  2017-01-11  69  	spinlock_t queue_lock;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  70  	struct sk_buff_head queue;
c0cdc19f84a471 Bjorn Andersson  2017-01-11  71  	wait_queue_head_t readq;
bea9b79c2d10fe Arnaud Pouliquen 2022-01-24  72  
5550201c0fe26a Chris Lew        2023-07-07  73  	bool remote_flow_restricted;
5550201c0fe26a Chris Lew        2023-07-07  74  	bool remote_flow_updated;
c0cdc19f84a471 Bjorn Andersson  2017-01-11 @75  };
c0cdc19f84a471 Bjorn Andersson  2017-01-11  76  

:::::: The code at line 75 was first introduced by commit
:::::: c0cdc19f84a4712cf74888f83af286e3c2e14efd rpmsg: Driver for user space endpoint interface

:::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
