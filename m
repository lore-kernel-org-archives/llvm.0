Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8883320690;
	Thu, 22 Jun 2023 22:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687471849; x=1719007849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tMCdOecJ6kaSDao+sC1xyRJf86ppTCRtmGd3WMAKh28=;
  b=I1rsDz+31wuz/0GIKm3Za9Uz3M6DTLX0CnwYhhUDL4VoiGS3JZRFuyvP
   UHDtHgublEX8c8rpj43QxeGEHDk4BKYMerda8B7KIeF3ZSQ2iwFmY++uI
   G+eQiIB+7FMDLx229MkqpmURbcFzmVSD0IWbdReFmjv6MqFwaVt0tHKZc
   2EZqqa8b4d+skd7i1+1KFhs5de61zGuZ7cNvy1TKyXgQKxXVy8LHIHwxN
   a8HMPenHAESyVogVT/0zAtR+8chTgea963MkfvMoHZVCCP1nfw5mV5Q0C
   C6lH4mbw1EUegp6FNhscpdrU9PRgbiFngGy7nPKeB6pXJIPTbEmUMyEhF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350388252"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="350388252"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 15:10:48 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="749508754"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="749508754"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Jun 2023 15:10:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCSVr-0007mz-0F;
	Thu, 22 Jun 2023 22:10:47 +0000
Date: Fri, 23 Jun 2023 06:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 21/75] drivers/tty/serial/serial_core.c:3511:3:
 error: initializer element is not a compile-time constant
Message-ID: <202306230617.8edLg1Rf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   48bbb2920f04e3004c9ea9bce4ea600d9c17c599
commit: 4d452b7101d5c1df0477776fdc0ad38d3e4034a5 [21/75] serial: make strlen of sysrq_toggle_seq[] a global constant
config: i386-randconfig-i002-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230617.8edLg1Rf-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230617.8edLg1Rf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230617.8edLg1Rf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:3511:3: error: initializer element is not a compile-time constant
                   strlen(CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +3511 drivers/tty/serial/serial_core.c

  3506	
  3507	#ifdef CONFIG_MAGIC_SYSRQ_SERIAL
  3508	static const u8 sysrq_toggle_seq[] = CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE;
  3509	/* Ideally, this would be strlen(sysrq_toggle_seq), but clang disagrees. */
  3510	static const unsigned int sysrq_toggle_seq_len =
> 3511			strlen(CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE);
  3512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
