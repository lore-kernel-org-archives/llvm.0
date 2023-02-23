Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188F17E;
	Thu, 23 Feb 2023 19:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677181402; x=1708717402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dCd8Cz3MvNSwf9UrnwZkbIN6V1919aJ3bnnzKHQAf/0=;
  b=lenxQNkDj65sor8PE+pv8AAp+fEoF98iaaURW7CnBKtb0bsTmiQqZFf2
   f7q4cJE8PDWjgWTQs+rwwYmpe4InA1pyAJLX8rrbJEpsJKAxh6E0zyh+O
   LE57/1Mm3bkh2/WFyCGihHx8voDag0x5Ycnin7pJ4iDfK+JME4NPRMRuj
   N+ebYh3sVTeJndpJwyIs80YBa4KqLl2aXhegvUYa7VYS5ZK1ryleJm9u0
   HIgH8Li0uhaexRaooV5W13Vdtkcq5l2iu7rBA+6P861ymsbnoIE2xJ5f+
   EY4Noe/2y1eX8LvCvxVIMvowgJgWfWCQavq/x6xKkBhGDRRsB17PEr6jp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="395811922"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="395811922"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 11:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="796454850"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="796454850"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Feb 2023 11:43:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVHUq-0001gT-1I;
	Thu, 23 Feb 2023 19:43:16 +0000
Date: Fri, 24 Feb 2023 03:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.15.y 1485/9999] <instantiation>:5:8: error: expected
 relocatable expression
Message-ID: <202302240321.cPoxUIMw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   60b502b3ffea07de3d741d79a22da1092b7a8657
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [1485/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: s390-randconfig-r013-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240321.cPoxUIMw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=33db9912ff7c491f839c89a08e98f755aa09598f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 33db9912ff7c491f839c89a08e98f755aa09598f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240321.cPoxUIMw-lkp@intel.com/

All errors (new ones prefixed by >>):

                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   lib/raid6/s390vx8.c:73:16: note: while in macro instantiation
           asm volatile ("VSTM %2,%3,0,1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VSTM 0,7,0,1
           ^
   <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   lib/raid6/s390vx8.c:73:16: note: while in macro instantiation
           asm volatile ("VSTM %2,%3,0,1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VSTM 8,15,0,1
           ^
   <instantiation>:3:21: error: too many positional arguments
           GR_NUM  b2, %r1     /* Base register */
                               ^
   lib/raid6/s390vx8.c:63:16: note: while in macro instantiation
           asm volatile ("VLM %2,%3,0,%1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VLM 0,7,0,%r1
           ^
   <instantiation>:3:21: error: too many positional arguments
           GR_NUM  b2, %r1     /* Base register */
                               ^
   lib/raid6/s390vx8.c:63:16: note: while in macro instantiation
           asm volatile ("VLM %2,%3,0,%1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VLM 16,23,0,%r1
           ^
   <instantiation>:3:21: error: too many positional arguments
           GR_NUM  b2, %r1     /* Base register */
                               ^
   lib/raid6/s390vx8.c:63:16: note: while in macro instantiation
           asm volatile ("VLM %2,%3,0,%1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VLM 16,23,0,%r1
           ^
   <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   lib/raid6/s390vx8.c:73:16: note: while in macro instantiation
           asm volatile ("VSTM %2,%3,0,1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VSTM 16,23,0,1
           ^
   <instantiation>:3:21: error: too many positional arguments
           GR_NUM  b2, %r1     /* Base register */
                               ^
   lib/raid6/s390vx8.c:63:16: note: while in macro instantiation
           asm volatile ("VLM %2,%3,0,%1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VLM 16,23,0,%r1
           ^
   <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   lib/raid6/s390vx8.c:73:16: note: while in macro instantiation
           asm volatile ("VSTM %2,%3,0,1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VSTM 16,23,0,1
           ^
   <instantiation>:3:21: error: too many positional arguments
           GR_NUM  b2, %r1     /* Base register */
                               ^
   lib/raid6/s390vx8.c:63:16: note: while in macro instantiation
           asm volatile ("VLM %2,%3,0,%1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VLM 0,7,0,%r1
           ^
   <instantiation>:3:21: error: too many positional arguments
           GR_NUM  b2, %r1     /* Base register */
                               ^
   lib/raid6/s390vx8.c:63:16: note: while in macro instantiation
           asm volatile ("VLM %2,%3,0,%1"
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           VLM 16,23,0,%r1
           ^
>> <instantiation>:5:8: error: expected relocatable expression
           .word   (b2 << 12) | (0)
                   ^
>> <instantiation>:5:8: error: expected relocatable expression
           .word   (b2 << 12) | (0)
                   ^
>> <instantiation>:5:8: error: expected relocatable expression
           .word   (b2 << 12) | (0)
                   ^
>> <instantiation>:5:8: error: expected relocatable expression
           .word   (b2 << 12) | (0)
                   ^
>> <instantiation>:5:8: error: expected relocatable expression
           .word   (b2 << 12) | (0)
                   ^
>> <instantiation>:5:8: error: expected relocatable expression
           .word   (b2 << 12) | (0)
                   ^
>> <instantiation>:5:8: error: expected relocatable expression
           .word   (b2 << 12) | (0)
                   ^
>> <instantiation>:5:8: error: expected relocatable expression
           .word   (b2 << 12) | (0)
                   ^
>> <instantiation>:5:8: error: expected relocatable expression
           .word   (b2 << 12) | (0)
                   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   12 warnings and 20 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
