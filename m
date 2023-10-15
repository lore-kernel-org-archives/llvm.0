Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67615D4;
	Sun, 15 Oct 2023 03:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgA8g90L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697340930; x=1728876930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8b09t44QvGcHI0fs/XmChyo1CVEs+5NK0eZdgA5Z3Jk=;
  b=IgA8g90LxB8/ge835qbBFbIEUDzoVL+FamqPbQo14CDp/MFa8p3avWpm
   g+2cZmTiQLyiLkmgx1wc9PSSG+nvBA5MiMN77eyMAbT9agV/C4labczQ5
   1l9OTriZaSCcNt60CoDBV3VkKr049JDQ0Yg3dgYL2gub3YSYK+jNSUBRB
   yLX5RNPgAbwFJIbU1u0Qe0A8dyGYB00FCpHa+jdPRHRnWstLiihAxPVjD
   BwxcK39xLFua/GjYw3Iq6WA5ZhNVxe+s0LD/He4FgaDkMkkg6VROPbwJV
   /Kwn82f128jRDDOKct8NWBkw5k6XpaNoedhCpoKNsVJ9Ck0cGkZgkXkXe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416426922"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="416426922"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 20:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821147896"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="821147896"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Oct 2023 20:35:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrruX-0006zh-21;
	Sun, 15 Oct 2023 03:35:25 +0000
Date: Sun, 15 Oct 2023 11:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/insn/rework 28/38] arch/arm64/lib/test_insn.c:2436:6:
 warning: no previous prototype for function 'test_insn_add_imm'
Message-ID: <202310151101.ruKVXjfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/insn/rework
head:   37bd99f160dd83ccdfd3f50c685259ae62a81e68
commit: d2212d582b02f2d0b6aca087a101e7b163eed6fd [28/38] arm64: insn: rework ADD / SUB (immediate)
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151101.ruKVXjfK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151101.ruKVXjfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151101.ruKVXjfK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/lib/test_insn.c:1779:6: warning: no previous prototype for function 'test_insn_ldp_pre' [-Wmissing-prototypes]
    1779 | void test_insn_ldp_pre(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:1779:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1779 | void test_insn_ldp_pre(struct kunit *test)
         | ^
         | static 
   arch/arm64/lib/test_insn.c:1848:6: warning: no previous prototype for function 'test_insn_stp_pre' [-Wmissing-prototypes]
    1848 | void test_insn_stp_pre(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:1848:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1848 | void test_insn_stp_pre(struct kunit *test)
         | ^
         | static 
   arch/arm64/lib/test_insn.c:1949:6: warning: no previous prototype for function 'test_insn_ldp_post' [-Wmissing-prototypes]
    1949 | void test_insn_ldp_post(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:1949:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1949 | void test_insn_ldp_post(struct kunit *test)
         | ^
         | static 
   arch/arm64/lib/test_insn.c:2012:6: warning: no previous prototype for function 'test_insn_stp_post' [-Wmissing-prototypes]
    2012 | void test_insn_stp_post(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:2012:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2012 | void test_insn_stp_post(struct kunit *test)
         | ^
         | static 
>> arch/arm64/lib/test_insn.c:2436:6: warning: no previous prototype for function 'test_insn_add_imm' [-Wmissing-prototypes]
    2436 | void test_insn_add_imm(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:2436:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2436 | void test_insn_add_imm(struct kunit *test)
         | ^
         | static 
>> arch/arm64/lib/test_insn.c:2444:6: warning: no previous prototype for function 'test_insn_adds_imm' [-Wmissing-prototypes]
    2444 | void test_insn_adds_imm(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:2444:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2444 | void test_insn_adds_imm(struct kunit *test)
         | ^
         | static 
>> arch/arm64/lib/test_insn.c:2452:6: warning: no previous prototype for function 'test_insn_sub_imm' [-Wmissing-prototypes]
    2452 | void test_insn_sub_imm(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:2452:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2452 | void test_insn_sub_imm(struct kunit *test)
         | ^
         | static 
>> arch/arm64/lib/test_insn.c:2460:6: warning: no previous prototype for function 'test_insn_subs_imm' [-Wmissing-prototypes]
    2460 | void test_insn_subs_imm(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:2460:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2460 | void test_insn_subs_imm(struct kunit *test)
         | ^
         | static 
   arch/arm64/lib/test_insn.c:2260:2: error: instruction requires: lse
    2260 |         TEST_LSE_LD_CASES(test, ldadd, AARCH64_INSN_MEM_ATOMIC_ADD);
         |         ^
   arch/arm64/lib/test_insn.c:2251:2: note: expanded from macro 'TEST_LSE_LD_CASES'
    2251 |         TEST_LSE_LD_ORDER_CASES(test, insn, x, AARCH64_INSN_SIZE_64, op);               \
         |         ^
   arch/arm64/lib/test_insn.c:2232:2: note: expanded from macro 'TEST_LSE_LD_ORDER_CASES'
    2232 |         TEST_LSE_LD_CASE(test, insn,                                                    \
         |         ^
   arch/arm64/lib/test_insn.c:2213:25: note: expanded from macro 'TEST_LSE_LD_CASE'
    2213 |         u32 obj_insn = ASM_U32(#insn " " #arg_rs ", " #arg_rt ", [" #arg_rn "]");       \
         |                                ^
   <scratch space>:29:2: note: expanded from here
      29 | "ldadd"
         |  ^
   <inline asm>:4:1: note: instantiated into assembly here
       4 | ldadd x0, x1, [x2]
         | ^
   arch/arm64/lib/test_insn.c:2260:2: error: instruction requires: lse
    2260 |         TEST_LSE_LD_CASES(test, ldadd, AARCH64_INSN_MEM_ATOMIC_ADD);
         |         ^
   arch/arm64/lib/test_insn.c:2251:2: note: expanded from macro 'TEST_LSE_LD_CASES'
    2251 |         TEST_LSE_LD_ORDER_CASES(test, insn, x, AARCH64_INSN_SIZE_64, op);               \
         |         ^
   arch/arm64/lib/test_insn.c:2236:2: note: expanded from macro 'TEST_LSE_LD_ORDER_CASES'
    2236 |         TEST_LSE_LD_CASE(test, insn,                                                    \
         |         ^
   arch/arm64/lib/test_insn.c:2213:25: note: expanded from macro 'TEST_LSE_LD_CASE'
    2213 |         u32 obj_insn = ASM_U32(#insn " " #arg_rs ", " #arg_rt ", [" #arg_rn "]");       \
         |                                ^
   <scratch space>:101:2: note: expanded from here
     101 | "ldadda"
         |  ^
   <inline asm>:4:1: note: instantiated into assembly here
       4 | ldadda x3, x4, [x5]
         | ^
   arch/arm64/lib/test_insn.c:2260:2: error: instruction requires: lse
    2260 |         TEST_LSE_LD_CASES(test, ldadd, AARCH64_INSN_MEM_ATOMIC_ADD);
         |         ^
   arch/arm64/lib/test_insn.c:2251:2: note: expanded from macro 'TEST_LSE_LD_CASES'
    2251 |         TEST_LSE_LD_ORDER_CASES(test, insn, x, AARCH64_INSN_SIZE_64, op);               \
         |         ^
   arch/arm64/lib/test_insn.c:2240:2: note: expanded from macro 'TEST_LSE_LD_ORDER_CASES'
    2240 |         TEST_LSE_LD_CASE(test, insn,                                                    \
         |         ^
   arch/arm64/lib/test_insn.c:2213:25: note: expanded from macro 'TEST_LSE_LD_CASE'
    2213 |         u32 obj_insn = ASM_U32(#insn " " #arg_rs ", " #arg_rt ", [" #arg_rn "]");       \
         |                                ^
   <scratch space>:173:2: note: expanded from here
     173 | "ldaddl"
         |  ^
   <inline asm>:4:1: note: instantiated into assembly here
       4 | ldaddl x6, x7, [x8]
         | ^
   arch/arm64/lib/test_insn.c:2260:2: error: instruction requires: lse
    2260 |         TEST_LSE_LD_CASES(test, ldadd, AARCH64_INSN_MEM_ATOMIC_ADD);
         |         ^
   arch/arm64/lib/test_insn.c:2251:2: note: expanded from macro 'TEST_LSE_LD_CASES'
    2251 |         TEST_LSE_LD_ORDER_CASES(test, insn, x, AARCH64_INSN_SIZE_64, op);               \
         |         ^
   arch/arm64/lib/test_insn.c:2244:2: note: expanded from macro 'TEST_LSE_LD_ORDER_CASES'
    2244 |         TEST_LSE_LD_CASE(test, insn,                                                    \
         |         ^
   arch/arm64/lib/test_insn.c:2213:25: note: expanded from macro 'TEST_LSE_LD_CASE'
    2213 |         u32 obj_insn = ASM_U32(#insn " " #arg_rs ", " #arg_rt ", [" #arg_rn "]");       \
         |                                ^
   <scratch space>:16:2: note: expanded from here
      16 | "ldaddal"
         |  ^
   <inline asm>:4:1: note: instantiated into assembly here
       4 | ldaddal x9, x10, [x11]
         | ^
   arch/arm64/lib/test_insn.c:2260:2: error: instruction requires: lse
    2260 |         TEST_LSE_LD_CASES(test, ldadd, AARCH64_INSN_MEM_ATOMIC_ADD);
         |         ^
   arch/arm64/lib/test_insn.c:2252:2: note: expanded from macro 'TEST_LSE_LD_CASES'
    2252 |         TEST_LSE_LD_ORDER_CASES(test, insn, w, AARCH64_INSN_SIZE_32, op);               \
         |         ^
   arch/arm64/lib/test_insn.c:2232:2: note: expanded from macro 'TEST_LSE_LD_ORDER_CASES'
    2232 |         TEST_LSE_LD_CASE(test, insn,                                                    \
         |         ^
   arch/arm64/lib/test_insn.c:2213:25: note: expanded from macro 'TEST_LSE_LD_CASE'
    2213 |         u32 obj_insn = ASM_U32(#insn " " #arg_rs ", " #arg_rt ", [" #arg_rn "]");       \
         |                                ^
   <scratch space>:87:2: note: expanded from here
      87 | "ldadd"
         |  ^
   <inline asm>:4:1: note: instantiated into assembly here
       4 | ldadd w0, w1, [x2]
         | ^
   arch/arm64/lib/test_insn.c:2260:2: error: instruction requires: lse
    2260 |         TEST_LSE_LD_CASES(test, ldadd, AARCH64_INSN_MEM_ATOMIC_ADD);
         |         ^
   arch/arm64/lib/test_insn.c:2252:2: note: expanded from macro 'TEST_LSE_LD_CASES'


vim +/test_insn_add_imm +2436 arch/arm64/lib/test_insn.c

  2435	
> 2436	void test_insn_add_imm(struct kunit *test)
  2437	{
  2438		TEST_ADSB_IMM_CASES(test,
  2439				    add,
  2440				    AARCH64_INSN_VARIANT_64BIT,
  2441				    AARCH64_INSN_ADSB_ADD);
  2442	}
  2443	
> 2444	void test_insn_adds_imm(struct kunit *test)
  2445	{
  2446		TEST_ADSB_IMM_CASES(test,
  2447				    adds,
  2448				    AARCH64_INSN_VARIANT_64BIT,
  2449				    AARCH64_INSN_ADSB_ADD_SETFLAGS);
  2450	}
  2451	
> 2452	void test_insn_sub_imm(struct kunit *test)
  2453	{
  2454		TEST_ADSB_IMM_CASES(test,
  2455				    sub,
  2456				    AARCH64_INSN_VARIANT_64BIT,
  2457				    AARCH64_INSN_ADSB_SUB);
  2458	}
  2459	
> 2460	void test_insn_subs_imm(struct kunit *test)
  2461	{
  2462		TEST_ADSB_IMM_CASES(test,
  2463				    subs,
  2464				    AARCH64_INSN_VARIANT_64BIT,
  2465				    AARCH64_INSN_ADSB_SUB_SETFLAGS);
  2466	}
  2467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
