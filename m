Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBB3ECC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658145044; x=1689681044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5FOrLIjTNrMgP5wev/cI/BFIYR4iejo/Cv0ax9sgFdE=;
  b=nAUJtuFO7xg9Za/lbivE106E5ZcZ9AehueDlad3YSaUe3eFt94zZ7zv7
   U/tZ1qfv5O12qOPSxXJxeykciFMz6glLMfe0zobefSpRc06aOEbyYAQ+z
   d+UWOqFLLV5+773wRy2DgpmDs/UDoFlJwu/TNuldacQVh2QtKE3Ds+lGX
   xCHvsbmyPRlq/k0Mjoe4Z1ZM6TUUbuHIqQ+9/faM6AZS7hBb6MgfWPB09
   YG+4mQ0MoYBzUvoenBV1oPrthXOI6Tezq2mZ8+eOQ7Qwf22gpmf3Gg+sE
   cwDdxhbpBJFLeGq0oiVHLmJlxyEMzgG7+UHgtRSaaC9Efjvxd/3tnIYvZ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="273030028"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="273030028"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 04:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="843246864"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2022 04:50:38 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDPGn-0004JW-W6;
	Mon, 18 Jul 2022 11:50:37 +0000
Date: Mon, 18 Jul 2022 19:50:04 +0800
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
Subject: Re: [PATCH V5 16/16] rv/reactor: Add the panic reactor
Message-ID: <202207181929.M7O6FDon-lkp@intel.com>
References: <5b3233ed8c7bd06895cc177da8a4299d764d6f9a.1657745645.git.bristot@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b3233ed8c7bd06895cc177da8a4299d764d6f9a.1657745645.git.bristot@kernel.org>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220714-052220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220718/202207181929.M7O6FDon-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f83faf07d0dad6cfd8fb22ff38b752dd7619bfc0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220714-052220
        git checkout f83faf07d0dad6cfd8fb22ff38b752dd7619bfc0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/pcs/ kernel/trace/rv/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/rv/reactor_panic.c:27:5: warning: no previous prototype for function 'register_react_panic' [-Wmissing-prototypes]
   int register_react_panic(void)
       ^
   kernel/trace/rv/reactor_panic.c:27:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int register_react_panic(void)
   ^
   static 
>> kernel/trace/rv/reactor_panic.c:33:6: warning: no previous prototype for function 'unregister_react_panic' [-Wmissing-prototypes]
   void unregister_react_panic(void)
        ^
   kernel/trace/rv/reactor_panic.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_react_panic(void)
   ^
   static 
   2 warnings generated.


vim +/register_react_panic +27 kernel/trace/rv/reactor_panic.c

    26	
  > 27	int register_react_panic(void)
    28	{
    29		rv_register_reactor(&rv_panic);
    30		return 0;
    31	}
    32	
  > 33	void unregister_react_panic(void)
    34	{
    35		rv_unregister_reactor(&rv_panic);
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
