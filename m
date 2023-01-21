Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F03462F;
	Sat, 21 Jan 2023 06:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674281160; x=1705817160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCnIXJqc0dNBNByKMEnfA0k3PqxJw9w09uv4gphtF5U=;
  b=ezbbS7BakHUFE8gsLAbGqoCfz9ZoymCQ7GLiWBfH2StDpOpMs1JuztCB
   CoTz7lt2u6r+1aZPFqx1s/GxRUeM0qEMfERnLMg8Rm5Oo3RixiEqp9x2F
   lQNcz8RGq8EqNWAE0S5q8BhfRtsVz/Vmh2WIjZsVLHESO1tkJv47rZJTE
   7p4p1m+Ap7oM94rD6cgTUKVwzHRsXHRjvEQttSc8hwZBSy1XXuGr8Rjn6
   7wn0nkmOEVclliJHx65TaJuagXZDhgXYsHaT+JLiYei0hDygBkD+QzTot
   RGQ6yUhp8C5UXMSRiGIuFEHRpmXBn/7FCGFosp5A1hvJuwDrNc/OagAHS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327033887"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="327033887"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 22:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="610712913"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="610712913"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2023 22:05:58 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ70n-0003dO-2s;
	Sat, 21 Jan 2023 06:05:57 +0000
Date: Sat, 21 Jan 2023 14:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/wip 2/2] arch/powerpc/decode.c:17:15: error:
 conflicting types for 'arch_dest_reloc_offset'
Message-ID: <202301211303.krMOYlCM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/wip
head:   eddf6a5419f48591bf1901929c2b1c892b7abc9f
commit: eddf6a5419f48591bf1901929c2b1c892b7abc9f [2/2] objtool: Rework arch_dest_reloc_offset()
config: powerpc-randconfig-r013-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211303.krMOYlCM-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=eddf6a5419f48591bf1901929c2b1c892b7abc9f
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/wip
        git checkout eddf6a5419f48591bf1901929c2b1c892b7abc9f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/decode.c:17:15: error: conflicting types for 'arch_dest_reloc_offset'
   unsigned long arch_dest_reloc_offset(int addend)
                 ^
   tools/objtool/include/objtool/arch.h:86:15: note: previous declaration is here
   unsigned long arch_dest_reloc_offset(struct reloc *reloc);
                 ^
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:97: tools/objtool/arch/powerpc/decode.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [tools/build/Makefile.build:139: arch/powerpc] Error 2
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile:54: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1439: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
