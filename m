Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6252C80
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641564302; x=1673100302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7eWu09XADEqxLJDJVmQpenOapTBEM9BgCiub39ILhco=;
  b=b/eJgZxRo+uYW23TVm8SznSjz5CI9kEEimM3N4ZAlEPbhSbHURr/Kr5n
   wbdKcolEw/PC5yY55h9UxcHROXKw/STxBwlvSqI94navRjbG0c2y6vlWu
   V0E1N1diYLc/C4mzF3fsIr8Wxo73Zob3s8dF7v+4/pR9bwaJaCC0GJRIf
   bVsfRfXAcCCUKj5wF9mtBSU0ZQI3BiyMuwmwY5CHBY2RAvupmBzCwDPwP
   9/1/L2bNZuMd7rWihye8wZ10QnYaHv6KowxiahKtYu9S0Nc3LCcPRdY9/
   2VN2oSnW5vqRFmoL5mVbALwQJOfPf6h1tGOkWZ8sfhNrA3V42Je4WVTrf
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="223566994"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="223566994"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 06:05:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="473327120"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jan 2022 06:04:59 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5prW-000IkS-Rk; Fri, 07 Jan 2022 14:04:58 +0000
Date: Fri, 7 Jan 2022 22:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Pei <huangpei@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 10655/11234] lib/test_printf.c:247:9: warning:
 'PTR' macro redefined
Message-ID: <202201072233.KPabxSoa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3770333b3f8cb7c9110889853afaa49777c26ea7
commit: f0b7ddbd794bdffade370f22bb7a774002208ef4 [10655/11234] MIPS: retire "asm/llsc.h"
config: mips-randconfig-r021-20220106 (https://download.01.org/0day-ci/archive/20220107/202201072233.KPabxSoa-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f0b7ddbd794bdffade370f22bb7a774002208ef4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f0b7ddbd794bdffade370f22bb7a774002208ef4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   lib/test_printf.c:157:52: warning: format specifies type 'unsigned char' but the argument has type 'int' [-Wformat]
           test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
                                  ~~~~                       ^
                                  %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:157:55: warning: format specifies type 'unsigned char' but the argument has type 'int' [-Wformat]
           test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
                                       ~~~~                     ^
                                       %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:157:58: warning: format specifies type 'unsigned char' but the argument has type 'int' [-Wformat]
           test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
                                            ~~~~                   ^~~
                                            %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:157:63: warning: format specifies type 'unsigned char' but the argument has type 'int' [-Wformat]
           test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
                                                 ~~~~                   ^~~
                                                 %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:157:68: warning: format specifies type 'unsigned char' but the argument has type 'int' [-Wformat]
           test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
                                                      ~~~~                   ^~
                                                      %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:158:52: warning: format specifies type 'char' but the argument has type 'int' [-Wformat]
           test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
                                  ~~~~                       ^
                                  %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:158:55: warning: format specifies type 'char' but the argument has type 'int' [-Wformat]
           test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
                                       ~~~~                     ^
                                       %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:158:58: warning: format specifies type 'char' but the argument has type 'int' [-Wformat]
           test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
                                            ~~~~                   ^~~
                                            %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:158:63: warning: format specifies type 'char' but the argument has type 'int' [-Wformat]
           test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
                                                 ~~~~                   ^~~
                                                 %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:158:68: warning: format specifies type 'char' but the argument has type 'int' [-Wformat]
           test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
                                                      ~~~~                   ^~
                                                      %d
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:159:41: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
           test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
                                     ~~~          ^~~~
                                     %o
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:159:47: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
           test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
                                        ~~~             ^~~~
                                        %o
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
   lib/test_printf.c:159:53: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
           test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
                                           ~~~~               ^~~~~~
                                           %#o
   lib/test_printf.c:137:40: note: expanded from macro 'test'
           __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
                                          ~~~    ^~~~~~~~~~~
>> lib/test_printf.c:247:9: warning: 'PTR' macro redefined [-Wmacro-redefined]
   #define PTR ((void *)0x456789ab)
           ^
   arch/mips/include/asm/asm.h:288:9: note: previous definition is here
   #define PTR             .word
           ^
   14 warnings generated.


vim +/PTR +247 lib/test_printf.c

ad67b74d2469d9 Tobin C. Harding 2017-11-01  245  
ad67b74d2469d9 Tobin C. Harding 2017-11-01  246  #define PTR_WIDTH 8
ad67b74d2469d9 Tobin C. Harding 2017-11-01 @247  #define PTR ((void *)0x456789ab)
ad67b74d2469d9 Tobin C. Harding 2017-11-01  248  #define PTR_STR "456789ab"
ce041c43f22298 Thierry Escande  2018-06-13  249  #define PTR_VAL_NO_CRNG "(ptrval)"
3e5903eb9cff70 Petr Mladek      2019-04-17  250  #define ZEROS ""
7bd57fbc4a4dde Ilya Dryomov     2020-05-19  251  #define ONES ""
ad67b74d2469d9 Tobin C. Harding 2017-11-01  252  

:::::: The code at line 247 was first introduced by commit
:::::: ad67b74d2469d9b82aaa572d76474c95bc484d57 printk: hash addresses printed with %p

:::::: TO: Tobin C. Harding <me@tobin.cc>
:::::: CC: Tobin C. Harding <me@tobin.cc>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
