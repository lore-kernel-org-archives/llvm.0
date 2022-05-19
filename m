Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5B2904
	for <llvm@lists.linux.dev>; Thu, 19 May 2022 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652984702; x=1684520702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oBIrVVWUdJDUev+0u2qBxfjdigQp2+Whjv4adFD09P8=;
  b=WUFEcGxS7LsJVpcwtq7Si/FHkP9wNMbCA1vAmZkhnJV6hTDRFHrJRJa4
   OXa35RFbae+ehfHeoodrbNxDihyItONYy7gqGusnEX79aGiTtCFxuMZgL
   9pO0M2YBmeYK5kux1cP/WkUrmWWgHC4ZDdShiiQuoIwdRq12eTx5nuAfy
   lmYcXkxegMgs2xDhm5uJ4TihxOMxfDcMwlnn+u5vCe0sJNn+H2PDRnf+y
   /EnI75vG2AelNhnv6mYqbDF0G06Y/h7CgEhufU70pyh/ZIK3pdSVqJ5nb
   Y8duFcRZLEbmYbQy0tjFK7bOytgu/z4N5M/a7lbU1ukApq3e4VobQgPA9
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="259894751"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="259894751"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 11:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="524218352"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 May 2022 11:24:58 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrkpW-0003qD-8L;
	Thu, 19 May 2022 18:24:58 +0000
Date: Fri, 20 May 2022 02:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12308/12886] arch/x86/kvm/hyperv.c:1983:22:
 error: shift count >= width of type
Message-ID: <202205200219.llzx7zfy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21498d01d045c5b95b93e0a0625ae965b4330ebe
commit: 81db71a60292e9a40ae8f6ef137b17f2aaa15a52 [12308/12886] KVM: x86: hyper-v: replace bitmap_weight() with hweight64()
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220520/202205200219.llzx7zfy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=81db71a60292e9a40ae8f6ef137b17f2aaa15a52
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 81db71a60292e9a40ae8f6ef137b17f2aaa15a52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/hyperv.c:21:
   In file included from arch/x86/kvm/x86.h:5:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:5:
   In file included from include/linux/context_tracking_state.h:5:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/mmdebug.h:5:
   In file included from include/linux/bug.h:5:
   In file included from arch/x86/include/asm/bug.h:87:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:8:
   In file included from include/linux/linkage.h:7:
   In file included from include/linux/export.h:123:
   ./include/generated/autoksyms.h:456:20: error: ISO C99 requires whitespace after the macro name [-Werror,-Wc99-extensions]
   #define __KSYM_arch/x86/kvm/vmx/vmenter.o 1
                      ^
   ./include/generated/autoksyms.h:1308:23: error: ISO C99 requires whitespace after the macro name [-Werror,-Wc99-extensions]
   #define __KSYM_drivers/gpu/drm/display/drm_dp_dual_mode_helper.o 1
                         ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:48: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                  ^
   include/asm-generic/bitops/const_hweight.h:10:9: note: expanded from macro '__const_hweight8'
            ((!!((w) & (1ULL << 0))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:48: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                  ^
   include/asm-generic/bitops/const_hweight.h:11:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 1))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:48: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                  ^
   include/asm-generic/bitops/const_hweight.h:12:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 2))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:48: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                  ^
   include/asm-generic/bitops/const_hweight.h:13:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 3))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:48: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                  ^
   include/asm-generic/bitops/const_hweight.h:14:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 4))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:48: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                  ^
   include/asm-generic/bitops/const_hweight.h:15:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 5))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:48: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                  ^
   include/asm-generic/bitops/const_hweight.h:16:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 6))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:48: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                  ^
   include/asm-generic/bitops/const_hweight.h:17:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 7)))))
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:72: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                                          ^
   include/asm-generic/bitops/const_hweight.h:10:9: note: expanded from macro '__const_hweight8'
            ((!!((w) & (1ULL << 0))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:72: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                                          ^
   include/asm-generic/bitops/const_hweight.h:11:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 1))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:72: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                                          ^
   include/asm-generic/bitops/const_hweight.h:12:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 2))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:72: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                                          ^
   include/asm-generic/bitops/const_hweight.h:13:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 3))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:72: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                                          ^
   include/asm-generic/bitops/const_hweight.h:14:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 4))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:72: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                                          ^
   include/asm-generic/bitops/const_hweight.h:15:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 5))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:72: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                                          ^
   include/asm-generic/bitops/const_hweight.h:16:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 6))) +     \
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:49: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                   ^
   include/asm-generic/bitops/const_hweight.h:19:72: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                                          ^
   include/asm-generic/bitops/const_hweight.h:17:9: note: expanded from macro '__const_hweight8'
             (!!((w) & (1ULL << 7)))))
                  ^
>> arch/x86/kvm/hyperv.c:1983:22: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
                   if (hc->var_cnt != hweight64(valid_bank_mask))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
   #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
                                                   ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: note: expanded from macro '__const_hweight64'
   #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
                                                                              ^  ~~
   include/asm-generic/bitops/const_hweight.h:20:73: note: expanded from macro '__const_hweight32'
   #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
                                                                           ^
   include/asm-generic/bitops/const_hweight.h:19:48: note: expanded from macro '__const_hweight16'
   #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
                                                  ^
   include/asm-generic/bitops/const_hweight.h:10:9: note: expanded from macro '__const_hweight8'
            ((!!((w) & (1ULL << 0))) +     \
                  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +1983 arch/x86/kvm/hyperv.c

  1934	
  1935	static u64 kvm_hv_send_ipi(struct kvm_vcpu *vcpu, struct kvm_hv_hcall *hc)
  1936	{
  1937		struct kvm *kvm = vcpu->kvm;
  1938		struct hv_send_ipi_ex send_ipi_ex;
  1939		struct hv_send_ipi send_ipi;
  1940		DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
  1941		unsigned long valid_bank_mask;
  1942		u64 sparse_banks[KVM_HV_MAX_SPARSE_VCPU_SET_BITS];
  1943		u32 vector;
  1944		bool all_cpus;
  1945	
  1946		if (hc->code == HVCALL_SEND_IPI) {
  1947			if (!hc->fast) {
  1948				if (unlikely(kvm_read_guest(kvm, hc->ingpa, &send_ipi,
  1949							    sizeof(send_ipi))))
  1950					return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1951				sparse_banks[0] = send_ipi.cpu_mask;
  1952				vector = send_ipi.vector;
  1953			} else {
  1954				/* 'reserved' part of hv_send_ipi should be 0 */
  1955				if (unlikely(hc->ingpa >> 32 != 0))
  1956					return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1957				sparse_banks[0] = hc->outgpa;
  1958				vector = (u32)hc->ingpa;
  1959			}
  1960			all_cpus = false;
  1961			valid_bank_mask = BIT_ULL(0);
  1962	
  1963			trace_kvm_hv_send_ipi(vector, sparse_banks[0]);
  1964		} else {
  1965			if (!hc->fast) {
  1966				if (unlikely(kvm_read_guest(kvm, hc->ingpa, &send_ipi_ex,
  1967							    sizeof(send_ipi_ex))))
  1968					return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1969			} else {
  1970				send_ipi_ex.vector = (u32)hc->ingpa;
  1971				send_ipi_ex.vp_set.format = hc->outgpa;
  1972				send_ipi_ex.vp_set.valid_bank_mask = sse128_lo(hc->xmm[0]);
  1973			}
  1974	
  1975			trace_kvm_hv_send_ipi_ex(send_ipi_ex.vector,
  1976						 send_ipi_ex.vp_set.format,
  1977						 send_ipi_ex.vp_set.valid_bank_mask);
  1978	
  1979			vector = send_ipi_ex.vector;
  1980			valid_bank_mask = send_ipi_ex.vp_set.valid_bank_mask;
  1981			all_cpus = send_ipi_ex.vp_set.format == HV_GENERIC_SET_ALL;
  1982	
> 1983			if (hc->var_cnt != hweight64(valid_bank_mask))
  1984				return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1985	
  1986			if (all_cpus)
  1987				goto check_and_send_ipi;
  1988	
  1989			if (!hc->var_cnt)
  1990				goto ret_success;
  1991	
  1992			if (kvm_get_sparse_vp_set(kvm, hc, 1, sparse_banks,
  1993						  offsetof(struct hv_send_ipi_ex,
  1994							   vp_set.bank_contents)))
  1995				return HV_STATUS_INVALID_HYPERCALL_INPUT;
  1996		}
  1997	
  1998	check_and_send_ipi:
  1999		if ((vector < HV_IPI_LOW_VECTOR) || (vector > HV_IPI_HIGH_VECTOR))
  2000			return HV_STATUS_INVALID_HYPERCALL_INPUT;
  2001	
  2002		if (all_cpus) {
  2003			kvm_send_ipi_to_many(kvm, vector, NULL);
  2004		} else {
  2005			sparse_set_to_vcpu_mask(kvm, sparse_banks, valid_bank_mask, vcpu_mask);
  2006	
  2007			kvm_send_ipi_to_many(kvm, vector, vcpu_mask);
  2008		}
  2009	
  2010	ret_success:
  2011		return HV_STATUS_SUCCESS;
  2012	}
  2013	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
