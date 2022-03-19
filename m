Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870118D
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 01:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647654360; x=1679190360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JuKeCT6OVU0saKuGmEL6gheW8exVvYykodJyQ+KjhXs=;
  b=dl0MQpLr6h9maq3nnOz6mUsP7AQySU/+Ehp214EjuEyxKrwY9Xinx+Mt
   o6UvWX52VNl0OV8K4VWcy3udyfLhhVWkuZM720gFlnr6Fal1o/rHqrBx+
   Xv87ZQo3CCT6PL/nxH7bA71R5Mrt2gaDfEsxWlOmLwNo02BZlw2uH1vKW
   rVM39CVWmjSKlwn4NGZlCAqx62Dl+B6raP2go2o2TlWQLo7JKJ1yFDs2H
   8ZQUM/lqaawCMDzn0m1PQRxMW8uscE83BrhT9hLbfHvBJGs11JO50gVrI
   30R3wFabmdgXvnERJaQxlLVqz45XPP+Kq5IA1ZR2soDwFzaJEG+lrmRPZ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="257458502"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="257458502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 18:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="647725029"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Mar 2022 18:45:56 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVOAG-000FOe-1J; Sat, 19 Mar 2022 01:45:56 +0000
Date: Sat, 19 Mar 2022 09:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Masahiro Yamada <masahiroy@kernel.org>, Alex Shi <alexs@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 11627/13576] lib/raid6/neon1.c:39:9: warning:
 mixing declarations and code is incompatible with standards before C99
Message-ID: <202203190931.X8NH0dPv-lkp@intel.com>
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
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 [11627/13576] Kbuild: move to -std=gnu11
config: arm64-randconfig-r033-20220319 (https://download.01.org/0day-ci/archive/20220319/202203190931.X8NH0dPv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash lib/raid6/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/raid6/neon1.c:39:9: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           return vshlq_n_u8(v, 1);
                  ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon1.c:48:20: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           return (unative_t)vshrq_n_s8((int8x16_t)v, 7);
                             ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25303:13: note: expanded from macro 'vshrq_n_s8'
     int8x16_t __ret; \
               ^
   lib/raid6/neon1.c:56:6: warning: no previous prototype for function 'raid6_neon1_gen_syndrome_real' [-Wmissing-prototypes]
   void raid6_neon1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
        ^
   lib/raid6/neon1.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void raid6_neon1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
   ^
   static 
   lib/raid6/neon1.c:117:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w20 = vshrq_n_u8(wq0, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon1.c:118:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w10 = vshlq_n_u8(wq0, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon1.c:126:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w20 = vshrq_n_u8(wq0, 5);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon1.c:127:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w10 = vshlq_n_u8(wq0, 3);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon1.c:133:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w20 = vshrq_n_u8(wq0, 6);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon1.c:134:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w10 = vshlq_n_u8(wq0, 2);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon1.c:86:6: warning: no previous prototype for function 'raid6_neon1_xor_syndrome_real' [-Wmissing-prototypes]
   void raid6_neon1_xor_syndrome_real(int disks, int start, int stop,
        ^
   lib/raid6/neon1.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void raid6_neon1_xor_syndrome_real(int disks, int start, int stop,
   ^
   static 
   10 warnings generated.
--
>> lib/raid6/neon2.c:39:9: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           return vshlq_n_u8(v, 1);
                  ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:48:20: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           return (unative_t)vshrq_n_s8((int8x16_t)v, 7);
                             ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25303:13: note: expanded from macro 'vshrq_n_s8'
     int8x16_t __ret; \
               ^
   lib/raid6/neon2.c:56:6: warning: no previous prototype for function 'raid6_neon2_gen_syndrome_real' [-Wmissing-prototypes]
   void raid6_neon2_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
        ^
   lib/raid6/neon2.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void raid6_neon2_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
   ^
   static 
   lib/raid6/neon2.c:138:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w20 = vshrq_n_u8(wq0, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:139:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w21 = vshrq_n_u8(wq1, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:140:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w10 = vshlq_n_u8(wq0, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:141:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w11 = vshlq_n_u8(wq1, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:151:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w20 = vshrq_n_u8(wq0, 5);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:152:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w21 = vshrq_n_u8(wq1, 5);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:153:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w10 = vshlq_n_u8(wq0, 3);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:154:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w11 = vshlq_n_u8(wq1, 3);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:162:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w20 = vshrq_n_u8(wq0, 6);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:163:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w21 = vshrq_n_u8(wq1, 6);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:164:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w10 = vshlq_n_u8(wq0, 2);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:165:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w11 = vshlq_n_u8(wq1, 2);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon2.c:97:6: warning: no previous prototype for function 'raid6_neon2_xor_syndrome_real' [-Wmissing-prototypes]
   void raid6_neon2_xor_syndrome_real(int disks, int start, int stop,
        ^
   lib/raid6/neon2.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void raid6_neon2_xor_syndrome_real(int disks, int start, int stop,
   ^
   static 
   16 warnings generated.
--
>> lib/raid6/neon4.c:39:9: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           return vshlq_n_u8(v, 1);
                  ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:48:20: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           return (unative_t)vshrq_n_s8((int8x16_t)v, 7);
                             ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25303:13: note: expanded from macro 'vshrq_n_s8'
     int8x16_t __ret; \
               ^
   lib/raid6/neon4.c:56:6: warning: no previous prototype for function 'raid6_neon4_gen_syndrome_real' [-Wmissing-prototypes]
   void raid6_neon4_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
        ^
   lib/raid6/neon4.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void raid6_neon4_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
   ^
   static 
   lib/raid6/neon4.c:180:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w20 = vshrq_n_u8(wq0, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:181:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w21 = vshrq_n_u8(wq1, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:182:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w22 = vshrq_n_u8(wq2, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:183:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w23 = vshrq_n_u8(wq3, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:184:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w10 = vshlq_n_u8(wq0, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:185:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w11 = vshlq_n_u8(wq1, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:186:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w12 = vshlq_n_u8(wq2, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:187:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w13 = vshlq_n_u8(wq3, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:201:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w20 = vshrq_n_u8(wq0, 5);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:202:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w21 = vshrq_n_u8(wq1, 5);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:203:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w22 = vshrq_n_u8(wq2, 5);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:204:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w23 = vshrq_n_u8(wq3, 5);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:205:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w10 = vshlq_n_u8(wq0, 3);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon4.c:206:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w11 = vshlq_n_u8(wq1, 3);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
--
>> lib/raid6/neon8.c:39:9: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           return vshlq_n_u8(v, 1);
                  ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:48:20: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           return (unative_t)vshrq_n_s8((int8x16_t)v, 7);
                             ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25303:13: note: expanded from macro 'vshrq_n_s8'
     int8x16_t __ret; \
               ^
   lib/raid6/neon8.c:56:6: warning: no previous prototype for function 'raid6_neon8_gen_syndrome_real' [-Wmissing-prototypes]
   void raid6_neon8_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
        ^
   lib/raid6/neon8.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void raid6_neon8_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
   ^
   static 
   lib/raid6/neon8.c:264:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w20 = vshrq_n_u8(wq0, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:265:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w21 = vshrq_n_u8(wq1, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:266:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w22 = vshrq_n_u8(wq2, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:267:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w23 = vshrq_n_u8(wq3, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:268:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w24 = vshrq_n_u8(wq4, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:269:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w25 = vshrq_n_u8(wq5, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:270:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w26 = vshrq_n_u8(wq6, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:271:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w27 = vshrq_n_u8(wq7, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:25231:14: note: expanded from macro 'vshrq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:272:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w10 = vshlq_n_u8(wq0, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:273:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w11 = vshlq_n_u8(wq1, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:274:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w12 = vshlq_n_u8(wq2, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:275:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w13 = vshlq_n_u8(wq3, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:276:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w14 = vshlq_n_u8(wq4, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
     uint8x16_t __ret; \
                ^
   lib/raid6/neon8.c:277:10: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                           w15 = vshlq_n_u8(wq5, 4);
                                 ^
   /opt/cross/clang-a6e70e4056/lib/clang/15.0.0/include/arm_neon.h:24823:14: note: expanded from macro 'vshlq_n_u8'
..

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
