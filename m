Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A863B6;
	Fri, 10 Feb 2023 16:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676047906; x=1707583906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQBhbw0cm1THr6nu+h0edK5ou6uL+/OIyFSZlykm/AY=;
  b=Ou4L1jxHTvGywl6C3EDalHWIf8w4jl9hOgjMT1mlf+3/OJmqaO95R/Rg
   6SwvUbFvVkwM2VLEIKEywknKGmon2Jsgg+rK8qPOt9rQNzVwbFgrt0OCD
   krZpYvfp+rkJZOm6BWT+8wEUQt6zT3sP8U+cDXUgSJe2cCBUDfo5R1rFy
   Edj4jtzBtEVrPrsEGAEo9LAhjWKwRwQiA8R56CLu+Kn7WtNUXGCFrGB7g
   rgzQ/GHVhvWyokx0354QhCgrTGBvi85+jHa2bHGMizfKjuDHx0KkONzyh
   mtXBf380Xb7VqaHs52DayyDfCvaus3mQIHdZXGpuF3gWdieQFvW3DdddG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310095080"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="310095080"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 08:51:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="645678465"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="645678465"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Feb 2023 08:51:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQWce-0005ul-0U;
	Fri, 10 Feb 2023 16:51:40 +0000
Date: Sat, 11 Feb 2023 00:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/shrink-reloc 6/9]
 tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no
 message is a C2x extension
Message-ID: <202302110008.pUtcZnVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/shrink-reloc
head:   6aedb7889b9dbd5094ff15b388ac2d2f6663148c
commit: 371de6c485805b337819a1a5f4a2f37ec739f328 [6/9] objtool: Remove reloc::offset
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230211/202302110008.pUtcZnVo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=371de6c485805b337819a1a5f4a2f37ec739f328
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/shrink-reloc
        git checkout 371de6c485805b337819a1a5f4a2f37ec739f328
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110008.pUtcZnVo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from weak.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/weak.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   In file included from elf.c:22:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
   In file included from orc_dump.c:9:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
   In file included from check.c:14:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/elf.o] Error 1
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/orc_dump.o] Error 1
   In file included from arch/x86/special.c:4:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
   In file included from special.c:16:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
   1 error generated.
   1In file included from builtin-check.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
   make[5]: *** [tools/build/Makefile.build:97: tools/objtool/arch/x86/special.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   1 error generated.
   In file included from objtool.c:16:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
    errormake[4]: *** [tools/build/Makefile.build:97: tools/objtool/builtin-check.o] Error 1
    generated.
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/special.o] Error 1
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/objtool.o] Error 1
   In file included from arch/x86/decode.c:18:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
   In file included from orc_gen.c:12:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
   static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
                                                                                              ^
                                                                                              , ""
   1 error generated.
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/check.o] Error 1
   1 error generated.
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:97: tools/objtool/arch/x86/decode.o] Error 1
   make[4]: *** [tools/build/Makefile.build:139: arch/x86] Error 2
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/orc_gen.o] Error 1
   make[3]: *** [Makefile:66: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1451: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/_Static_assert +85 tools/objtool/include/objtool/elf.h

    84	
  > 85	static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
