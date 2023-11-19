Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA111CB2;
	Sun, 19 Nov 2023 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeQ3M+0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700422216; x=1731958216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=balMDgboI1oOR13h+FlvlJEtyAC42Z+ONAYX4moG600=;
  b=JeQ3M+0D/Qk1TW6j2c1jCawFMRkqMRVm4nitIR7xEpRpsdRAXEBTzMSz
   i616EwMxU2ZlzX3Gzg5/ZjRrklOuFMP/guEzwc8SvFaStGOFsV5ucTWzc
   My4cJyf5ZoKA/YfWEFipuhjPvtjFyEkSF51t2EwnbFD3WjQZmAvC5ci9U
   RzNb0UdwEqoXDiOfvdMaoAo8miePXorYabKgsVOoKoK4sFF/R0d6Cghbx
   4xrQDCsggGmJ1U2e1l1T5yb1qJnJv+wbXEU0ruVbbiKpvKom2wbnXtP+N
   NdzAHYvFqSXZp4b2/CGLRUF/M8YlKIG9qb0XhNmvV4spkf0QNR9FfpHxi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="10182783"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="10182783"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 11:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1097567135"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="1097567135"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Nov 2023 11:30:09 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4nUd-0005Tl-2g;
	Sun, 19 Nov 2023 19:30:07 +0000
Date: Mon, 20 Nov 2023 03:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 6/15] drivers/soc/apple/rtkit.c:639:25:
 error: no member named 'mbox_chan' in 'struct apple_rtkit'
Message-ID: <202311200303.Togq7Iny-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   3d3347e62feacf57f15c7f20c0309c8dac65da44
commit: 2f3f8c1dbebdd39a9f1acec017c1e802b16fa36c [6/15] soc: apple: rtkit: Port to the internal mailbox driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231120/202311200303.Togq7Iny-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200303.Togq7Iny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200303.Togq7Iny-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/apple/rtkit.c:639:25: error: no member named 'mbox_chan' in 'struct apple_rtkit'
                   ret = mbox_flush(rtk->mbox_chan, timeout);
                                    ~~~  ^
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
