Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB67E;
	Thu,  2 Feb 2023 03:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675307468; x=1706843468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3e8Isb4vWVXgvFaxaLbN4A1gf1BZQZHYLEzf2y9wVI=;
  b=Oya6+3rEwn4FXMgxWceUn3fxBP7/N5J5Hd0lmyrsXHJuxW2hulKIr1kG
   N/0ElkPkyDNiP6/o24/JF0JPxYuzSMxdP8q6cD6+QR4lusRH+KBPgXpP6
   YybzLMtswlvsVRQiwHgyM9vuS51cMMModoNxx5Ivskskk9FO9pf4Ilhle
   FtCjoZsoS/kxSog8Dv2/5qYr31zyo1G6XayU92xCFIu8ICd7EZ+X6GHsh
   GRdWcvKw5stxECnTN2OZ4bJP/+h9Xcc/CU3NWfVqejx32Xm5NwehDvnjd
   65p7YUs/BIz5A1ukKx4BhS2UdBPpviOn0YJKOXvaK72PMyH1tHSc/sbcx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="328351506"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="328351506"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 19:11:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="789124029"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="789124029"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2023 19:11:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNQ08-000644-1H;
	Thu, 02 Feb 2023 03:11:04 +0000
Date: Thu, 2 Feb 2023 11:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/paronl.2023.02.01a 7/9]
 arch/x86/kernel/smpboot.c:1361:24: warning: incompatible integer to pointer
 conversion passing 'int' to parameter of type 'struct task_struct *'
Message-ID: <202302021103.5o9vwutp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/paronl.2023.02.01a
head:   05792727280c094a8dcd1aa4950a61a2d214ddb8
commit: 5d245bcd0107a551fe69545ae757526932f9738a [7/9] x86/smpboot: Send INIT/SIPI/SIPI to secondary CPUs in parallel
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230202/202302021103.5o9vwutp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/5d245bcd0107a551fe69545ae757526932f9738a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/paronl.2023.02.01a
        git checkout 5d245bcd0107a551fe69545ae757526932f9738a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kernel/smpboot.c:1266:5: warning: no previous prototype for function 'do_cpu_up' [-Wmissing-prototypes]
   int do_cpu_up(unsigned int cpu, struct task_struct *tidle)
       ^
   arch/x86/kernel/smpboot.c:1266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int do_cpu_up(unsigned int cpu, struct task_struct *tidle)
   ^
   static 
   arch/x86/kernel/smpboot.c:1361:24: error: implicit declaration of function 'idle_thread_get' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return do_cpu_up(cpu, idle_thread_get(cpu));
                                 ^
>> arch/x86/kernel/smpboot.c:1361:24: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct task_struct *' [-Wint-conversion]
           return do_cpu_up(cpu, idle_thread_get(cpu));
                                 ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/smpboot.c:1266:53: note: passing argument to parameter 'tidle' here
   int do_cpu_up(unsigned int cpu, struct task_struct *tidle)
                                                       ^
   2 warnings and 1 error generated.


vim +1361 arch/x86/kernel/smpboot.c

  1357	
  1358	/* Bringup step one: Send INIT/SIPI to the target AP */
  1359	static int native_cpu_kick(unsigned int cpu)
  1360	{
> 1361		return do_cpu_up(cpu, idle_thread_get(cpu));
  1362	}
  1363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
