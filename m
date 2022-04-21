Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD891876
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650522771; x=1682058771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKPg+tpiSpX9Wpw4vkgYV22QaJbqsuKkT3aScwSSehU=;
  b=fIv1QHs2B51hguSZyPBq3zeNgwmzI2LRjNpmcNtLinEa8kePzYOOYBTF
   +FnY+v9Gl1p0UZEcN+ZSNIXh7d+I+x9TjImTuPbkOviC6PMO8BIQC9/tI
   PCPodU+mkOoZin/i4F2XX6vvZIVujwT2DS8owIMPJ7c0skSskeJCeBmpi
   bJI114mChygYVn0wDxafGuTrV0rxaNb+JAZcqtZZsjhdCm9KJ2QOXJkXF
   BjxQG4COu/OuEF7MS1qXi5qeQvyyrlT9G+sxWcffv8g5GS5ZprmhgqDRe
   B4B3C72nciym4FqVGbNSCc5G7MsXJdgcR8Dta+czrotkMUBGIWxRUpL8Q
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="264020395"
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; 
   d="scan'208";a="264020395"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; 
   d="scan'208";a="658389108"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2022 23:32:49 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQMy-0007wk-De;
	Thu, 21 Apr 2022 06:32:48 +0000
Date: Thu, 21 Apr 2022 14:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2352/2579]
 arch/powerpc/include/asm/cmpxchg.h:80:1: error: use of undeclared identifier
 'BITS_PER_BYTE'
Message-ID: <202204201949.xIif2NO7-lkp@intel.com>
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
commit: 021ec7b4f3ec8280761a254fd8241779fd7b5bfb [2352/2579] headers/deps: bvec: Reduce <linux/bvec.h> dependencies, remove <linux/bvec_api.h> inclusion
config: powerpc64-randconfig-r015-20220420 (https://download.01.org/0day-ci/archive/20220420/202204201949.xIif2NO7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=021ec7b4f3ec8280761a254fd8241779fd7b5bfb
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 021ec7b4f3ec8280761a254fd8241779fd7b5bfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:12:
   In file included from include/linux/page-flags.h:9:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic_api.h:8:
   In file included from arch/powerpc/include/asm/atomic.h:11:
>> arch/powerpc/include/asm/cmpxchg.h:80:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   XCHG_GEN(u8, _local, "memory");
   ^
   arch/powerpc/include/asm/cmpxchg.h:22:11: note: expanded from macro 'XCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:81:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   XCHG_GEN(u8, _relaxed, "cc");
   ^
   arch/powerpc/include/asm/cmpxchg.h:22:11: note: expanded from macro 'XCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:82:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   XCHG_GEN(u16, _local, "memory");
   ^
   arch/powerpc/include/asm/cmpxchg.h:22:11: note: expanded from macro 'XCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:83:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   XCHG_GEN(u16, _relaxed, "cc");
   ^
   arch/powerpc/include/asm/cmpxchg.h:22:11: note: expanded from macro 'XCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:206:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   CMPXCHG_GEN(u8, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
   ^
   arch/powerpc/include/asm/cmpxchg.h:47:11: note: expanded from macro 'CMPXCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:207:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   CMPXCHG_GEN(u8, _local, , , "memory");
   ^
   arch/powerpc/include/asm/cmpxchg.h:47:11: note: expanded from macro 'CMPXCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:208:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   CMPXCHG_GEN(u8, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
   ^
   arch/powerpc/include/asm/cmpxchg.h:47:11: note: expanded from macro 'CMPXCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:209:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   CMPXCHG_GEN(u8, _relaxed, , , "cc");
   ^
   arch/powerpc/include/asm/cmpxchg.h:47:11: note: expanded from macro 'CMPXCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:210:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   CMPXCHG_GEN(u16, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
   ^
   arch/powerpc/include/asm/cmpxchg.h:47:11: note: expanded from macro 'CMPXCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:211:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   CMPXCHG_GEN(u16, _local, , , "memory");
   ^
   arch/powerpc/include/asm/cmpxchg.h:47:11: note: expanded from macro 'CMPXCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:212:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   CMPXCHG_GEN(u16, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
   ^
   arch/powerpc/include/asm/cmpxchg.h:47:11: note: expanded from macro 'CMPXCHG_GEN'
           bitoff = BITOFF_CAL(sizeof(type), off);                 \
                    ^
   arch/powerpc/include/asm/cmpxchg.h:11:61: note: expanded from macro 'BITOFF_CAL'
   #define BITOFF_CAL(size, off)   ((sizeof(u32) - size - off) * BITS_PER_BYTE)
                                                                 ^
   arch/powerpc/include/asm/cmpxchg.h:213:1: error: use of undeclared identifier 'BITS_PER_BYTE'
   CMPXCHG_GEN(u16, _relaxed, , , "cc");


vim +/BITS_PER_BYTE +80 arch/powerpc/include/asm/cmpxchg.h

d0563a1297e234 Pan Xinhui    2016-04-27  72  
ae3a197e3d0bfe David Howells 2012-03-28  73  /*
ae3a197e3d0bfe David Howells 2012-03-28  74   * Atomic exchange
ae3a197e3d0bfe David Howells 2012-03-28  75   *
26760fc19a7e66 Boqun Feng    2015-12-15  76   * Changes the memory location '*p' to be val and returns
ae3a197e3d0bfe David Howells 2012-03-28  77   * the previous value stored there.
ae3a197e3d0bfe David Howells 2012-03-28  78   */
26760fc19a7e66 Boqun Feng    2015-12-15  79  
d0563a1297e234 Pan Xinhui    2016-04-27 @80  XCHG_GEN(u8, _local, "memory");
d0563a1297e234 Pan Xinhui    2016-04-27  81  XCHG_GEN(u8, _relaxed, "cc");
d0563a1297e234 Pan Xinhui    2016-04-27  82  XCHG_GEN(u16, _local, "memory");
d0563a1297e234 Pan Xinhui    2016-04-27  83  XCHG_GEN(u16, _relaxed, "cc");
d0563a1297e234 Pan Xinhui    2016-04-27  84  

:::::: The code at line 80 was first introduced by commit
:::::: d0563a1297e234ed37f6b51c2e9321accebd1839 powerpc: Implement {cmp}xchg for u8 and u16

:::::: TO: Pan Xinhui <xinhui.pan@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
