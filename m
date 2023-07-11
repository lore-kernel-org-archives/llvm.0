Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A751EA7B;
	Tue, 11 Jul 2023 21:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689109586; x=1720645586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqFAcjQXKEjwNrVSwBz4T1LNm1cfRpWhiMX5CWL8oEo=;
  b=Duil6rkLj8yPOt3b/S0C+3mfwUNNCAjakGBmCA70mEJt4AJlsURxGFvW
   ODreulXs4XN0WJ1Nzh2aW2zYpPuoaNArYZLxtlxsI72FzpGM58x0Ui4Is
   IB7aF/7VNUvVV19N9cPUMFUa883noMLYqZNaVF1mRTooNvaQj6w21ZEaF
   RKejQRLclgOfArDJjH7ok+dAxTg6Ql2vFobUu4Vju3ToRl8VIDwUTnUVG
   yUrKdTh4XHctXJF/BxQq3BbcDxfV1XD/AAnHOHEoMljqzyvx0Y9e2oflo
   eBKdTKl3tX9tx9NbRORFJ7CEK+dppATss1FBxMiRj7GWWrtz4BJexg60z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362203762"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="362203762"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 14:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="865857272"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="865857272"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2023 14:06:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJKYu-00057j-2j;
	Tue, 11 Jul 2023 21:06:20 +0000
Date: Wed, 12 Jul 2023 05:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/core 21/22] include/linux/ftrace.h:47:47: warning:
 declaration of 'struct fgraph_ret_regs' will not be visible outside of this
 function
Message-ID: <202307120418.wmSazUy7-lkp@intel.com>
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
config: i386-randconfig-i012-20230710 (https://download.01.org/0day-ci/archive/20230712/202307120418.wmSazUy7-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120418.wmSazUy7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120418.wmSazUy7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/power/process.c:15:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:47:47: warning: declaration of 'struct fgraph_ret_regs' will not be visible outside of this function [-Wvisibility]
   unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs);
                                                 ^
   1 warning generated.


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
