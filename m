Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B02CA0
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 23:06:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="299491937"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="299491937"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 15:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="676564290"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Nov 2021 15:06:23 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mrpj5-000CTV-3O; Mon, 29 Nov 2021 23:06:23 +0000
Date: Tue, 30 Nov 2021 07:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Xie <xiehuan09@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC][PATCH v6 1/5] trace: Add trace any kernel object
Message-ID: <202111300652.yLaNuuKr-lkp@intel.com>
References: <20211129164951.220511-2-xiehuan09@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129164951.220511-2-xiehuan09@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jeff,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on linux/master linus/master v5.16-rc3 next-20211129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jeff-Xie/trace-Introduce-objtrace-trigger-to-trace-the-kernel-object/20211130-041958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: i386-buildonly-randconfig-r003-20211128 (https://download.01.org/0day-ci/archive/20211130/202111300652.yLaNuuKr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/88ea43d691b0980bf49b4e579c39303cf3c9cd72
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeff-Xie/trace-Introduce-objtrace-trigger-to-trace-the-kernel-object/20211130-041958
        git checkout 88ea43d691b0980bf49b4e579c39303cf3c9cd72
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_object.c:518:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (WARN_ON_ONCE(atomic_read(&trace_object_ref) <= 0))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:179:33: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:165:28: note: expanded from macro 'WARN_ON'
   #define WARN_ON(condition) ({                                           \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_object.c:533:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   kernel/trace/trace_object.c:518:2: note: remove the 'if' if its condition is always false
           if (WARN_ON_ONCE(atomic_read(&trace_object_ref) <= 0))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_object.c:516:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +518 kernel/trace/trace_object.c

   513	
   514	static int exit_trace_object(void)
   515	{
   516		int ret;
   517	
 > 518		if (WARN_ON_ONCE(atomic_read(&trace_object_ref) <= 0))

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
