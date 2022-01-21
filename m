Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DAB29CA
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642753185; x=1674289185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMiHjvl84QjMhHNHxc4MDB2pjg1jVB5PbjyIBBA0x0o=;
  b=W31IHBWv5lLFWrAzr1XYWSdujHd4Iar/FbgIpJ364j5kzt9NcGVVRkFe
   6gZK7+x+Op/fkYl4OyEBCgwOT9ogN5Ogm01ZTTaD5oLeKLXhWJK/u8KmS
   XnaUzgMjxVa9n8LlUQMQiY10GIMeYGb3hZrdLTlsTi1vd6xbC4pGDN3VI
   Dc6UgA+drtKa/rysbxYYvGHsvGStVv+HukMzPHWBdSHRjtiomqHUuMhdC
   DdCLxPiJpvMVnSbuuu0EdsyhlVDa29KI3+Qakv//mz8amxhsEYOnorQQN
   RwaVOoG4ZXhyqWd1PZuDpt9Vbl9fXoG4t7yIX5Dzh2cIUnMcb8+RK4fBq
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="232957366"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="232957366"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 00:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="478165440"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jan 2022 00:19:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAp90-000F6R-Fu; Fri, 21 Jan 2022 08:19:38 +0000
Date: Fri, 21 Jan 2022 16:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [bvanassche:scsi-move-scsi-pointer 25/45]
 drivers/scsi/megaraid.c:1075:9: warning: variable 'scb' is uninitialized
 when used here
Message-ID: <202201211656.z3YanySW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/bvanassche/linux scsi-move-scsi-pointer
head:   1f9cda056e9fc3b2f08455c8ab1a2d85b52df093
commit: 7f5c4ca6df22ad432a2631b6cdd374f40a249746 [25/45] megaraid: Stop using the SCSI pointer
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220121/202201211656.z3YanySW-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/7f5c4ca6df22ad432a2631b6cdd374f40a249746
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche scsi-move-scsi-pointer
        git checkout 7f5c4ca6df22ad432a2631b6cdd374f40a249746
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/scsi/megaraid.c:1075:9: warning: variable 'scb' is uninitialized when used here [-Wuninitialized]
                   if (!(scb->state & SCB_ISSUED) && issue_scb(adapter, scb) != 0)
                         ^~~
   drivers/scsi/megaraid.c:1073:13: note: initialize the variable 'scb' to silence this warning
                   scb_t *scb;
                             ^
                              = NULL
   1 warning generated.


vim +/scb +1075 drivers/scsi/megaraid.c

  1065	
  1066	static void
  1067	__mega_runpendq(adapter_t *adapter)
  1068	{
  1069		struct megaraid_cmd_priv *pos, *next;
  1070	
  1071		/* Issue all pending commands to the card */
  1072		list_for_each_entry_safe(pos, next, &adapter->pending_list, entry) {
  1073			scb_t *scb;
  1074	
> 1075			if (!(scb->state & SCB_ISSUED) && issue_scb(adapter, scb) != 0)
  1076				return;
  1077		}
  1078	}
  1079	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
