Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5885B7EC
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 08:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660380136; x=1691916136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dje4Bwu5WhwsdCPS9deeYtrDdGTX8BgieA63nTu7tK8=;
  b=ejXvU2QlIJ1lGlxHzmUbE2PQCb2Ay1YWgQsNL2H9cS/3CLcEYnJ9QBbN
   DS7MUooU+HLT5WOK8RsDoapHJGoq8THkhOdZ950FplyXarKXMFbMoIPfG
   kkQO6DW100ywC+4fYeOzxTBKEOxhA8KVHH6KYpSrRTH0C2bjlKccdANcr
   4HTCuhK53lvsFJFN51wFMaAzaD+69/nMBcYLKU+S/gjyElqZtEJoOtcuw
   nMxCgEj5r1fipolh9SOTf4qP/4e85jLc09FUo4JfBDVsP65ayBIgXe1WT
   JeETCJzVwHfa1xd4hjtdFxkvR8D3Xr88WZCtIiUnTVX0q6GRKXLEQRY36
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="353481520"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="353481520"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 01:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="602725412"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Aug 2022 01:42:13 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMmij-0001VH-09;
	Sat, 13 Aug 2022 08:42:13 +0000
Date: Sat, 13 Aug 2022 16:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.15.y 5773/9027] <instantiation>:5:8: error: expected
 relocatable expression
Message-ID: <202208131620.5cpNx6DK-lkp@intel.com>
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
head:   7217df81279835a7aee62a07aabb7b8fb8c766f2
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [5773/9027] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: s390-randconfig-r031-20220812 (https://download.01.org/0day-ci/archive/20220813/202208131620.5cpNx6DK-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 3329cec2f79185bafd678f310fafadba2a8c76d2)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

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
https://01.org/lkp
