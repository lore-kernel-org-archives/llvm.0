Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6708B3239;
	Thu,  2 Feb 2023 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675340852; x=1706876852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5GgOIf9gH76s8qzC5dBZpdcHe+ywXzG0g9ZF/UoaZk=;
  b=NjI+6+NzidMiqUkl0jiUpSZjyyt+LwM6PDxDGPg7D1CwiJ0OCBexdRGC
   liLdMyldzaFUHGESLlIuboAXcXyTYUFrGOmRzq3An3GsLbDuQnVF0O8JR
   /852IUF/soDKC4jryzpHEJq6zUzUbC6a7XA/bVX9XBKOdBqrO8VfQpVVF
   tG18ddt7hlzCUofGKpzss9TmVndCf459aWI9Kn9mxvWhtt2NRMARdNlAg
   CY9f0TXmyuY1rtyRaw5A07b1KtLvi1k0IDIJJ07Sso/ZPXCusYN5PH6et
   CMwQI7drUX7lKlrgBiniyUxT6hl+7wM5O08aPPY/FTYSWng/vHI9rZjXH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="328448089"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="328448089"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 04:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="733915994"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="733915994"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 04:27:30 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNYgb-0006Uq-1P;
	Thu, 02 Feb 2023 12:27:29 +0000
Date: Thu, 2 Feb 2023 20:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/peterz.2023.01.26a 64/68]
 kernel/trace/trace_preemptirq.c:122:2: error: call to undeclared function
 'trace'; ISO C99 and later do not support implicit function declarations
Message-ID: <202302022036.e3TYkFbH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/peterz.2023.01.26a
head:   f9588508f16615daf50ae4e3e16f40b6be874154
commit: 29847e5e64b9a99e8e55c70229733f1a30bd4143 [64/68] tracing, preempt: Squash _rcuidle tracing
config: arm64-randconfig-r016-20230130 (https://download.01.org/0day-ci/archive/20230202/202302022036.e3TYkFbH-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/29847e5e64b9a99e8e55c70229733f1a30bd4143
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/peterz.2023.01.26a
        git checkout 29847e5e64b9a99e8e55c70229733f1a30bd4143
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/iommu/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/trace/trace_preemptirq.c:88:16: warning: no previous prototype for function 'trace_hardirqs_on_caller' [-Wmissing-prototypes]
   __visible void trace_hardirqs_on_caller(unsigned long caller_addr)
                  ^
   kernel/trace/trace_preemptirq.c:88:11: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __visible void trace_hardirqs_on_caller(unsigned long caller_addr)
             ^
             static 
   kernel/trace/trace_preemptirq.c:103:16: warning: no previous prototype for function 'trace_hardirqs_off_caller' [-Wmissing-prototypes]
   __visible void trace_hardirqs_off_caller(unsigned long caller_addr)
                  ^
   kernel/trace/trace_preemptirq.c:103:11: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __visible void trace_hardirqs_off_caller(unsigned long caller_addr)
             ^
             static 
>> kernel/trace/trace_preemptirq.c:122:2: error: call to undeclared function 'trace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           trace(preempt_enable)(a0, a1);
           ^
>> kernel/trace/trace_preemptirq.c:122:8: error: use of undeclared identifier 'preempt_enable'
           trace(preempt_enable)(a0, a1);
                 ^
   kernel/trace/trace_preemptirq.c:128:2: error: call to undeclared function 'trace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           trace(preempt_disable)(a0, a1);
           ^
>> kernel/trace/trace_preemptirq.c:128:8: error: use of undeclared identifier 'preempt_disable'
           trace(preempt_disable)(a0, a1);
                 ^
   2 warnings and 4 errors generated.


vim +/trace +122 kernel/trace/trace_preemptirq.c

   102	
 > 103	__visible void trace_hardirqs_off_caller(unsigned long caller_addr)
   104	{
   105		lockdep_hardirqs_off(caller_addr);
   106	
   107		if (!this_cpu_read(tracing_irq_cpu)) {
   108			this_cpu_write(tracing_irq_cpu, 1);
   109			tracer_hardirqs_off(CALLER_ADDR0, caller_addr);
   110			if (!in_nmi())
   111				trace_irq_disable_rcuidle(CALLER_ADDR0, caller_addr);
   112		}
   113	}
   114	EXPORT_SYMBOL(trace_hardirqs_off_caller);
   115	NOKPROBE_SYMBOL(trace_hardirqs_off_caller);
   116	#endif /* CONFIG_TRACE_IRQFLAGS */
   117	
   118	#ifdef CONFIG_TRACE_PREEMPT_TOGGLE
   119	
   120	void trace_preempt_on(unsigned long a0, unsigned long a1)
   121	{
 > 122		trace(preempt_enable)(a0, a1);
   123		tracer_preempt_on(a0, a1);
   124	}
   125	
   126	void trace_preempt_off(unsigned long a0, unsigned long a1)
   127	{
 > 128		trace(preempt_disable)(a0, a1);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
