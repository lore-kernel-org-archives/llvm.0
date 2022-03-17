Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8A2F3A
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 03:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647489395; x=1679025395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WGhJMzZc2HYnPLmjxmaobimefIA9Fki1N64J2jd5h84=;
  b=WHpdVBoXx0CB/7Clmmg+CbxfI+XVjXwY7Fn+je+fZBEdAgLzgA24QzB9
   W2/JxWUU7uNIbprt8mCBdRR502eQyOYXXgS3fhdvLJNfwETIkCiUGNHuC
   ze/Vel1rH6dZIFVJ0yFaOdVFMRNlW3/j6C367OBqD6Be9un7asTig2GQa
   7o80ytadIQiK8cZC94qvr+1h6YeXVEgbwUlt/VrJ0V+oLpVU0k37VUFc+
   MYBN5TMuiu1loeHTZW68O1Q+zrnW3CV98NHze5Tl/vS9/P7Ic0WptfNn7
   xPUVCASJW7IuLittaLe2yKKiWVBe56CMnn/ApTAG4RvmVeDOVYL+vtQ3R
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="319986712"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="319986712"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 20:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="557753811"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2022 20:56:33 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUhFY-000DGi-V6; Thu, 17 Mar 2022 03:56:32 +0000
Date: Thu, 17 Mar 2022 11:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 2009/2335] kernel/trace/trace_hwlat.c:174:6:
 warning: no previous prototype for function 'trace_hwlat_callback'
Message-ID: <202203171104.4wcK0cRh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: f3c1d292f157b79c05590971f8ae4b297bd60830 [2009/2335] headers/deps: Remove <linux/hardirq.h> inclusions from headers that don't need it anymore
config: x86_64-randconfig-a011-20220314 (https://download.01.org/0day-ci/archive/20220317/202203171104.4wcK0cRh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=f3c1d292f157b79c05590971f8ae4b297bd60830
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout f3c1d292f157b79c05590971f8ae4b297bd60830
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_hwlat.c:174:6: warning: no previous prototype for function 'trace_hwlat_callback' [-Wmissing-prototypes]
   void trace_hwlat_callback(bool enter)
        ^
   kernel/trace/trace_hwlat.c:174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void trace_hwlat_callback(bool enter)
   ^
   static 
   1 warning generated.


vim +/trace_hwlat_callback +174 kernel/trace/trace_hwlat.c

e7c15cd8a113335 Steven Rostedt (Red Hat    2016-06-23  173) 
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04 @174) void trace_hwlat_callback(bool enter)
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  175) {
f46b16520a087e8 Daniel Bristot de Oliveira 2021-06-22  176  	struct hwlat_kthread_data *kdata = get_cpu_data();
f46b16520a087e8 Daniel Bristot de Oliveira 2021-06-22  177  
f46b16520a087e8 Daniel Bristot de Oliveira 2021-06-22  178  	if (!kdata->kthread)
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  179) 		return;
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  180) 
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  181) 	/*
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  182) 	 * Currently trace_clock_local() calls sched_clock() and the
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  183) 	 * generic version is not NMI safe.
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  184) 	 */
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  185) 	if (!IS_ENABLED(CONFIG_GENERIC_SCHED_CLOCK)) {
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  186) 		if (enter)
f46b16520a087e8 Daniel Bristot de Oliveira 2021-06-22  187  			kdata->nmi_ts_start = time_get();
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  188) 		else
f46b16520a087e8 Daniel Bristot de Oliveira 2021-06-22  189  			kdata->nmi_total_ts += time_get() - kdata->nmi_ts_start;
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  190) 	}
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  191) 
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  192) 	if (enter)
f46b16520a087e8 Daniel Bristot de Oliveira 2021-06-22  193  		kdata->nmi_count++;
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  194) }
7b2c86250122de3 Steven Rostedt (Red Hat    2016-08-04  195) 

:::::: The code at line 174 was first introduced by commit
:::::: 7b2c86250122de316cbab8754050622ead04af39 tracing: Add NMI tracing in hwlat detector

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
