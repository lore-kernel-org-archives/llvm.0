Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779117481;
	Sat, 28 Jan 2023 20:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674937253; x=1706473253;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dYi/KGzX7zrmeuOySKTsXyC56y+bQOhiQfNJQ1YdHww=;
  b=OF0gDK8gsmx7Smd1bfbcqgwEw0yQO4erP2HfUXebXdVW4Uo4dE9WulQg
   KPg5mhcUH0rfbp2EVq0OKCUo2FETlVcI3zEz9Nn1Es/cDH9n7X/N4+Eqf
   bVRqNodx2ytbECNibnq+W6uGIrsUFWLspHTJABkSJSzavRWCVtvkUoHVP
   wfmg8uBnEog9BVXFhqU+B4dFl4I4FiFl+hXEzLMM/oFpPFnBJPvj04ZS1
   fn+bTgGIdZyXS0fobiRsWYz/et++hdYccEtmApambMrjfle8D2qylEJI6
   nF43KhCTm8lbcN9KMVHnqWTyUuDMZ6dp0d/dds5RqFB7QhGMaY33ySp6I
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325024478"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="325024478"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 12:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="656987233"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="656987233"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Jan 2023 12:20:51 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLrgw-00014c-1R;
	Sat, 28 Jan 2023 20:20:50 +0000
Date: Sun, 29 Jan 2023 04:19:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Message-ID: <202301290419.dQs7GOB5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
References: <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.2-rc5 next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-boot-Don-t-always-pass-mcpu-powerpc-when-building-32-bit-uImage/20230125-154021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
config: powerpc-xes_mpc85xx_defconfig (https://download.01.org/0day-ci/archive/20230129/202301290419.dQs7GOB5-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/1e2fdbde0affc94f36013e1a2ff5fbeb20457b69
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-boot-Don-t-always-pass-mcpu-powerpc-when-building-32-bit-uImage/20230125-154021
        git checkout 1e2fdbde0affc94f36013e1a2ff5fbeb20457b69
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   clang-16: error: unsupported argument '-me500' to option '-Wa,'
>> error: unknown target CPU '8540'
   note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1285: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
