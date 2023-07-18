Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B417AAD;
	Tue, 18 Jul 2023 23:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689722869; x=1721258869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bt4A1sXUMSnOXpxuBtknmnEHvOyHwq7p1AILGWEl5AU=;
  b=lg8llFjfH7v3tP+90q9O4u1bcuST1TCsfHuBdm9lTwVuITS1KR7MjQJJ
   hxoyRH1QGX/t4UJ5Ihw2DSwIbEHf6nMR3daFzQp0Qaaz1s2klYPq8sJQh
   mHsFLThVd6f5SUKISP9lGI+8z0KSLwSnO4aWM2IKB7a8GmjPEWiMvPG4Q
   5nqH8wyMtD9+fD1YZt1qHcBgg99JZfj3L2CGGr/C0Fpo8AdE0XhEHCdWr
   4WrxBoMDpOOTVKHqV3no05tgYayJtpaVDpT4HBE2wG/Ugbes4+AN4IdGN
   bugVONkNdXo3dTUkYeukkKpXV5UQ3TqxhnvcHkCXm/mODv5YbZsF1vDmA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="356281634"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="356281634"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 16:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="897717333"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="897717333"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Jul 2023 16:27:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLu6d-0003x7-1i;
	Tue, 18 Jul 2023 23:27:47 +0000
Date: Wed, 19 Jul 2023 07:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 7/12] drivers/soc/apple/rtkit.c:639:25:
 error: no member named 'mbox_chan' in 'struct apple_rtkit'
Message-ID: <202307190748.NieHgp8R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   4e398443bc8954189feef7690a142d4cdfa2ec8c
commit: 33e58c87bbd34917ba153a3f8357f19cf4c15d08 [7/12] mailbox: apple: Delete driver
config: arm64-randconfig-r026-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190748.NieHgp8R-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190748.NieHgp8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190748.NieHgp8R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/apple/rtkit.c:639:25: error: no member named 'mbox_chan' in 'struct apple_rtkit'
     639 |                 ret = mbox_flush(rtk->mbox_chan, timeout);
         |                                  ~~~  ^
   1 error generated.


vim +639 drivers/soc/apple/rtkit.c

9bd1d9a0d8bb1a Sven Peter 2022-05-01  626  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  627  int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  628  				  unsigned long timeout, bool atomic)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  629  {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  630  	DECLARE_COMPLETION_ONSTACK(completion);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  631  	int ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  632  	long t;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  633  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  634  	ret = apple_rtkit_send_message(rtk, ep, message, &completion, atomic);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  635  	if (ret < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  636  		return ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  637  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  638  	if (atomic) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01 @639  		ret = mbox_flush(rtk->mbox_chan, timeout);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  640  		if (ret < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  641  			return ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  642  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  643  		if (try_wait_for_completion(&completion))
9bd1d9a0d8bb1a Sven Peter 2022-05-01  644  			return 0;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  645  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  646  		return -ETIME;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  647  	} else {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  648  		t = wait_for_completion_interruptible_timeout(
9bd1d9a0d8bb1a Sven Peter 2022-05-01  649  			&completion, msecs_to_jiffies(timeout));
9bd1d9a0d8bb1a Sven Peter 2022-05-01  650  		if (t < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  651  			return t;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  652  		else if (t == 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  653  			return -ETIME;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  654  		return 0;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  655  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  656  }
9bd1d9a0d8bb1a Sven Peter 2022-05-01  657  EXPORT_SYMBOL_GPL(apple_rtkit_send_message_wait);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  658  

:::::: The code at line 639 was first introduced by commit
:::::: 9bd1d9a0d8bb1a549831fd98fcc3105960f7068b soc: apple: Add RTKit IPC library

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Sven Peter <sven@svenpeter.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
