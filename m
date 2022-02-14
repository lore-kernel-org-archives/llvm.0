Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E13A2C
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644861077; x=1676397077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EykiRRFTIBWspQ0iHz9Svz3vTbHpf+77utafI35eB9o=;
  b=KbeVIgFvumJcE9EMQtniVljuP6NMCmogiLvzwOpOllN4LBgDaGxwI1vu
   eQl142gsIgo+WuYYiXnZA7E5beLxWr+jz52JqfAYyW28vKrZUWMaHYkNz
   4G8BGgMcQXFUugfqN3il5fT4mlQdMMyfgwRMJMj8oRSKjttcMvQSW8J+B
   YQF1LYDD+g+ctxJTQag4JrXXOOajreajDbKJ866OOfowT34q0StbI52yn
   kqZqqCoqI7lxwSAJcNcGqzFE/qVq0BGDfpaPrnePORPhR633BTsxDd5RF
   MRZnSK2DX15uqRnz7PJTifi6C/aEfybaVbnbZL2K6pO9NLWmOIub20Unw
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="248980413"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="248980413"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 09:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="543781249"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2022 09:51:15 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJfVK-0008oP-HY; Mon, 14 Feb 2022 17:51:14 +0000
Date: Tue, 15 Feb 2022 01:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC V2 01/21] rv: Add Runtime Verification (RV) interface
Message-ID: <202202150143.3BpCqVdF-lkp@intel.com>
References: <87606fc180e4551b19dc61609907b555214c41a1.1644830251.git.bristot@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87606fc180e4551b19dc61609907b555214c41a1.1644830251.git.bristot@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on lwn/docs-next linus/master v5.17-rc4 next-20220214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220214-193144
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220215/202202150143.3BpCqVdF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f99370d1c81f0a3b56d6630ff62631f6ecfdf8d8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220214-193144
        git checkout f99370d1c81f0a3b56d6630ff62631f6ecfdf8d8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/trace/rv/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/rv/rv.c:189:6: warning: no previous prototype for function 'disable_monitor' [-Wmissing-prototypes]
   void disable_monitor(struct rv_monitor_def *mdef)
        ^
   kernel/trace/rv/rv.c:189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void disable_monitor(struct rv_monitor_def *mdef)
   ^
   static 
>> kernel/trace/rv/rv.c:202:6: warning: no previous prototype for function 'enable_monitor' [-Wmissing-prototypes]
   void enable_monitor(struct rv_monitor_def *mdef)
        ^
   kernel/trace/rv/rv.c:202:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void enable_monitor(struct rv_monitor_def *mdef)
   ^
   static 
   2 warnings generated.


vim +/disable_monitor +189 kernel/trace/rv/rv.c

   185	
   186	/*
   187	 * Disable a given runtime monitor.
   188	 */
 > 189	void disable_monitor(struct rv_monitor_def *mdef)
   190	{
   191		if (mdef->monitor->enabled) {
   192			mdef->monitor->enabled = 0;
   193			mdef->monitor->stop();
   194		}
   195	
   196		mdef->enabled = 0;
   197	}
   198	
   199	/*
   200	 * Enable a given monitor.
   201	 */
 > 202	void enable_monitor(struct rv_monitor_def *mdef)
   203	{
   204		/*
   205		 * Reset all internal monitors before starting.
   206		 */
   207		mdef->monitor->reset();
   208		if (!mdef->monitor->enabled)
   209			mdef->monitor->start();
   210	
   211		mdef->monitor->enabled = 1;
   212		mdef->enabled = 1;
   213	}
   214	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
