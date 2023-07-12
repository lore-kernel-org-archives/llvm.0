Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4FE1C29;
	Wed, 12 Jul 2023 06:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689144289; x=1720680289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WzkLO8cfZwewsemOSimk0/LyXCwtgh0N0w1jk2glmWk=;
  b=WkHyvZJR8BUJM3WWKOS+WecIRSI0RnEg2OE2jSgOgxHguzVtcUMjXnoe
   tt9BL+2GFfCca92tvTCwvdnLsQonH6rX1GPd/wvjhmlLqQGDli9te960z
   /9iQWrZZEgjoB7VkvcaUkO2qF5afHdJNrTod81Vc24nfIbBmOKpfMue4a
   484puqKROuaEDoPddHoX7yMVspM/+2W+avW5+ZPfYbbULWRrOwmnC+I+/
   oe8T34OqjK8RJMwWYs0Q126KbSlxRr13dOHYuIGPB2f2t5jvONDTgYw4f
   pQ6UgsorwOY8QUPPMidRBfuOtn5mHdKUo3YEF1VKfUHO+8r3pbB8WnBhw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="364852484"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="364852484"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 23:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="751047206"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="751047206"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Jul 2023 23:44:44 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJTad-0005TF-0p;
	Wed, 12 Jul 2023 06:44:43 +0000
Date: Wed, 12 Jul 2023 14:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/core 21/22] include/linux/ftrace.h:47:47: error:
 declaration of 'struct fgraph_ret_regs' will not be visible outside of this
 function
Message-ID: <202307121439.7H6fiDNa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
head:   46b77ea28faeed56f1d1b63f9049c40b9eb3cbf5
commit: 55803539764e831c4e642de1c6634f8f645a10aa [21/22] tracing: arm64: Avoid missing-prototype warnings
config: i386-randconfig-r021-20230712 (https://download.01.org/0day-ci/archive/20230712/202307121439.7H6fiDNa-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121439.7H6fiDNa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121439.7H6fiDNa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/ioapic.c:31:
   In file included from include/linux/kvm_host.h:32:
>> include/linux/ftrace.h:47:47: error: declaration of 'struct fgraph_ret_regs' will not be visible outside of this function [-Werror,-Wvisibility]
   unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs);
                                                 ^
   1 error generated.


vim +47 include/linux/ftrace.h

    45	
    46	#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
  > 47	unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs);
    48	#else
    49	unsigned long ftrace_return_to_handler(unsigned long frame_pointer);
    50	#endif
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
