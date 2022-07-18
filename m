Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18348EA6
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658134022; x=1689670022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OBECoidjbs/b4gjb4vh7yiE3zSs/3k3t1WbIVAmKqjU=;
  b=k39ng7BQpueGey0f8yVJcAp6BoRAaElyMa1OoVqmMgQZrHw1+I+zq5pZ
   16k5bXm+e+KJtCLbhpHEeCYanjBK+8iC/SlqlvjrQlvrXLbXBRqxrVefo
   VUnBWXvpa6FIdTsIhZLmtF8V//m+u00sbPLQ0FCBfdA6vJ4gykxVMGLyy
   2jSlNuxl6O84USa9Lrt5RIB6Ml5QRpyMqVTjRc+HDfJuaYIG2JGG2RAUg
   YJTYjv7itlO3eVvFtYYAemTfuhaLkvi4IuMaCe119LfS0d3eNByyX6+ZK
   zVFgYOoC9932zsfqcTYAdwIhjkS7kEPPrHL/8uvkAAZhSHHLAGG9jX+rp
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="287316356"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="287316356"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 01:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="723785806"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Jul 2022 01:46:56 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDMP1-0004Cw-KJ;
	Mon, 18 Jul 2022 08:46:55 +0000
Date: Mon, 18 Jul 2022 16:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Gabriele Paoloni <gpaoloni@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>, Tao Zhou <tao.zhou@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-devel@vger.kernel.org
Subject: Re: [PATCH V5 15/16] rv/reactor: Add the printk reactor
Message-ID: <202207181646.sRRbkyru-lkp@intel.com>
References: <5fcf3d21b51bc4c1a6d2968cfd0c60fdbc1d471b.1657745645.git.bristot@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fcf3d21b51bc4c1a6d2968cfd0c60fdbc1d471b.1657745645.git.bristot@kernel.org>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220714-052220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220718/202207181646.sRRbkyru-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d1746223447deb1d1646f968512a065a1cd63a9c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220714-052220
        git checkout d1746223447deb1d1646f968512a065a1cd63a9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/pcs/ kernel/trace/rv/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/rv/reactor_printk.c:26:5: warning: no previous prototype for function 'register_react_printk' [-Wmissing-prototypes]
   int register_react_printk(void)
       ^
   kernel/trace/rv/reactor_printk.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int register_react_printk(void)
   ^
   static 
>> kernel/trace/rv/reactor_printk.c:32:6: warning: no previous prototype for function 'unregister_react_printk' [-Wmissing-prototypes]
   void unregister_react_printk(void)
        ^
   kernel/trace/rv/reactor_printk.c:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_react_printk(void)
   ^
   static 
   2 warnings generated.


vim +/register_react_printk +26 kernel/trace/rv/reactor_printk.c

    25	
  > 26	int register_react_printk(void)
    27	{
    28		rv_register_reactor(&rv_printk);
    29		return 0;
    30	}
    31	
  > 32	void unregister_react_printk(void)
    33	{
    34		rv_unregister_reactor(&rv_printk);
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
