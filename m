Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61D2CA5
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 04:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643603167; x=1675139167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rHKPuiZER/l/4Go0b0/obffXmu7V7tLzhAYGZpqsKE8=;
  b=mnq8y9JSQmOBT9g8ywr4PSE3kwvMsc2LTDfcDvMlx0mLQzYkuimy7fPN
   bH5as74zIrhKKFKKxCkjWQJQkO9V7H89XtgGxIEW6ZY1/x/tySv8BvQKV
   c1j3lLckJYjqyWcjR35+ulTzCL1P4yNtn5nc2Tne2GYdbD26Gfa2QylM5
   VFHaDdSV9GzzkUDP64eu9r7PtZjQYkGJyOV5Y7ljNm5h9QAvvPOU4ZJvQ
   OWfRTc2Ekt1USjWT5NzjC56baCixlkcpkR+AJ4Llxo7/2oqqIRBuzGIUM
   PAa8VKQ2v/6YtTTTS24pBAkvWIVimIKyMisZ0yZZoCMRjs8EhQNZiGByV
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247616740"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="247616740"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 20:26:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="536970244"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jan 2022 20:26:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEOGS-000RNB-Lu; Mon, 31 Jan 2022 04:26:04 +0000
Date: Mon, 31 Jan 2022 12:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 3/5] powerpc/vdso: Merge vdso64 and vdso32 into a
 single directory
Message-ID: <202201311250.d9Np2olE-lkp@intel.com>
References: <4dbe05cc130f6a0858d09ac72e436c373cb08b70.1642782130.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dbe05cc130f6a0858d09ac72e436c373cb08b70.1642782130.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.17-rc2 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-vdso-augment-VDSO32-functions-to-support-64-bits-build/20220122-003111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-microwatt_defconfig (https://download.01.org/0day-ci/archive/20220131/202201311250.d9Np2olE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18acb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/6ac6c11c0a56c29cc3935fb9a633bad4e5d552b7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-vdso-augment-VDSO32-functions-to-support-64-bits-build/20220122-003111
        git checkout 6ac6c11c0a56c29cc3935fb9a633bad4e5d552b7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/vdso/gettimeofday.S:75:8: error: unsupported directive '.stabs'
   .stabs "_restgpr_31_x:F-1",36,0,0,_restgpr_31_x; .globl _restgpr_31_x; _restgpr_31_x:
          ^
   arch/powerpc/kernel/vdso/gettimeofday.S:76:8: error: unsupported directive '.stabs'
   .stabs "_rest32gpr_31_x:F-1",36,0,0,_rest32gpr_31_x; .globl _rest32gpr_31_x; _rest32gpr_31_x:
          ^
   make[2]: *** [arch/powerpc/kernel/vdso/Makefile:71: arch/powerpc/kernel/vdso/gettimeofday-32.o] Error 1
   make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:423: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +75 arch/powerpc/kernel/vdso/gettimeofday.S

08c18b63d9656e0 arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09  70  
08c18b63d9656e0 arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09  71  /* Routines for restoring integer registers, called by the compiler.  */
08c18b63d9656e0 arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09  72  /* Called with r11 pointing to the stack header word of the caller of the */
08c18b63d9656e0 arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09  73  /* function, just beyond the end of the integer restore area.  */
193dd6092bb80db arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2022-01-21  74  #ifndef __powerpc64__
08c18b63d9656e0 arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09 @75  _GLOBAL(_restgpr_31_x)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
