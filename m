Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6831FC0
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 14:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650551850; x=1682087850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hb/PwdhqxjwBx8LMrby4ubXd6WAreKf8NPHfhjKA0Gk=;
  b=O5EfERk+DwZORPw0UJqnjpiuAR0y/OKIIYWyX1JFsV3Au5bb87879h0J
   CmYKZU0LZOqPeRsZ3g/yQr08ufNc07bmbLfastpewSiLQDwh50TXkKLS1
   GQBRSwt7ZYRIB8LXCicLZY81Ia+DYetGm2VbF5TSHSmvA26Uy+ndhWCkT
   lCDKAOTCpZHdoQDh85eQOPIU4+Cpjj+5i/6Zx3fwx1u218EqZvt/QJlET
   R1tMjJ3FR+da4rZ6KwPk2wiuNNktATSKbIcUHQaQAJ8gejXTo9OtGYiiE
   q1xM6pfaxrBHAutcDxxbP3kyjJjb8iXGNfd56yeHnAtL2wJVHeai5V4ow
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289479863"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="289479863"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 07:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="703106679"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2022 07:37:20 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhXvs-0008U8-4p;
	Thu, 21 Apr 2022 14:37:20 +0000
Date: Thu, 21 Apr 2022 22:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2150/2579]
 kernel/trace/trace_hwlat.c:175:6: warning: no previous prototype for
 function 'trace_hwlat_callback'
Message-ID: <202204212231.wBlI8L8G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: b0a0ce86322929677661f28bec305c68815c387d [2150/2579] headers/deps: Remove <linux/hardirq.h> inclusions from headers that don't need it anymore
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220421/202204212231.wBlI8L8G-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=b0a0ce86322929677661f28bec305c68815c387d
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout b0a0ce86322929677661f28bec305c68815c387d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/crypto/ arch/x86/entry/vdso/ arch/x86/events/amd/ arch/x86/kernel/ arch/x86/pci/ kernel/bpf/ kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_hwlat.c:175:6: warning: no previous prototype for function 'trace_hwlat_callback' [-Wmissing-prototypes]
   void trace_hwlat_callback(bool enter)
        ^
   kernel/trace/trace_hwlat.c:175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void trace_hwlat_callback(bool enter)
   ^
   static 
   1 warning generated.


vim +/trace_hwlat_callback +175 kernel/trace/trace_hwlat.c

e7c15cd8a11333 Steven Rostedt (Red Hat    2016-06-23  174) 
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04 @175) void trace_hwlat_callback(bool enter)
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  176) {
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  177  	struct hwlat_kthread_data *kdata = get_cpu_data();
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  178  
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  179  	if (!kdata->kthread)
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  180) 		return;
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  181) 
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  182) 	/*
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  183) 	 * Currently trace_clock_local() calls sched_clock() and the
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  184) 	 * generic version is not NMI safe.
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  185) 	 */
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  186) 	if (!IS_ENABLED(CONFIG_GENERIC_SCHED_CLOCK)) {
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  187) 		if (enter)
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  188  			kdata->nmi_ts_start = time_get();
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  189) 		else
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  190  			kdata->nmi_total_ts += time_get() - kdata->nmi_ts_start;
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  191) 	}
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  192) 
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  193) 	if (enter)
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  194  		kdata->nmi_count++;
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  195) }
7b2c86250122de Steven Rostedt (Red Hat    2016-08-04  196) 

:::::: The code at line 175 was first introduced by commit
:::::: 7b2c86250122de316cbab8754050622ead04af39 tracing: Add NMI tracing in hwlat detector

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
