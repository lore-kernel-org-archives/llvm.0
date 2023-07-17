Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9393810977;
	Mon, 17 Jul 2023 23:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689635113; x=1721171113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cG/9IU/AzV99qjHBZAPYESS5Fs1PxstCltYpNHUgFDU=;
  b=VBsOrVfd341zwSHf4aWW4OTVHDKUjaiDJuWPmV8+I0uwVVIeEn/3djX7
   Z10co3xe8O1tYoe349qt5muAxzseD+IFqbfd2M0CsL8iiLeqpkWv+whcR
   Sl4yS2GR28qTcFqpjffKFwQ3GjYiXA4WCb8CiwFONHklJzLLREbeOXpMM
   KPs+LCOJBIef2ojLYdf8wACUuN6O2G25ENFHjk2q21ZW4T/GX989knLNh
   li448Nc772aS3N4Q+K4cf2AwB0mRh3i9euYtgnh1iPY1d8U0h1eHezJnq
   NsGBnlRGghljWXT32umBCgTFy+B2nE8Id/aRcN/v129/vw1u+gt7HaJRh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432237209"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432237209"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 16:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="717387827"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="717387827"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Jul 2023 16:05:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLXHD-0009z6-0D;
	Mon, 17 Jul 2023 23:05:11 +0000
Date: Tue, 18 Jul 2023 07:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rw-misc:embedded_go_prog 1/1]
 drivers/misc/embedded_prog/eprog_kern.c:46:62: warning: format specifies
 type 'long' but the argument has type 'ssize_t' (aka 'int')
Message-ID: <202307180709.3Ai1PdBI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git embedded_go_prog
head:   58a51666e0ed2b23253048b0616ee5879361cc4a
commit: 58a51666e0ed2b23253048b0616ee5879361cc4a [1/1] misc: Add demo driver for user mode driver usage
config: powerpc-randconfig-r036-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180709.3Ai1PdBI-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180709.3Ai1PdBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180709.3Ai1PdBI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/embedded_prog/eprog_kern.c:46:62: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
                           pr_err("Fatal error while reading from userspace: %ld\n", nread);
                                                                             ~~~     ^~~~~
                                                                             %zd
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +46 drivers/misc/embedded_prog/eprog_kern.c

    23	
    24	static int eprog_thread(void *data)
    25	{
    26		struct umd_info *eprog_ctx = data;
    27		loff_t pos = 0;
    28		ssize_t nread;
    29	
    30		set_freezable();
    31	
    32		for (;;) {
    33			if (kthread_should_stop())
    34				break;
    35	
    36			if (try_to_freeze())
    37				continue;
    38	
    39			nread = kernel_read(eprog_ctx->pipe_from_umh, read_buf, READ_BUFSZ - 1, &pos);
    40			if (nread > 0) {
    41				read_buf[nread] = '\0';
    42				pr_info("From userspace: %s", read_buf);
    43			} else if (nread == -ERESTARTSYS) {
    44				break;
    45			} else {
  > 46				pr_err("Fatal error while reading from userspace: %ld\n", nread);
    47				/*
    48				 * Suspend ourself and wait for termination.
    49				 */
    50				set_current_state(TASK_INTERRUPTIBLE);
    51				schedule();
    52			}
    53		}
    54	
    55		return 0;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
