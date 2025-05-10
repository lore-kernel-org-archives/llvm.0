Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96121448E3;
	Sat, 10 May 2025 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746920678; cv=none; b=X36uWgLoeFr/CIMxJH4vzKRYPETNrihWEVuXFRCPZt9PG/jDg+fM1rv+sB251V2dYZnqr06n5KjO+cswR0ZduPy+lV32zOkRg/UX8PLXFbNEItNg4enpQt0N6fx3YLgB5WXfrc0YBh26Gyp6bwNqcy1bINDXzcVLo1gb07Xxu5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746920678; c=relaxed/simple;
	bh=cvEHe8JGWKcZ22ujHaFNXXKyReGpW/Cw7NGKMfpR9jA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UBZdoH/N8Oh8s4rNm4Fs+uA0Zf9cbkyIzMxS4OOsyBW+uF/XGLGu24iR4GZ9OKyd1vKiGmDj6cGeUfwI1rh0vw2ZHXbQSJk392nbBEPuRo8iGRLk/Byq5Ouh3ssK+sN84tllbXCx4tVqXHi6FwxMHB4FvBGDVgXNLQuRhrG+8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHriDfbo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHriDfbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746920677; x=1778456677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cvEHe8JGWKcZ22ujHaFNXXKyReGpW/Cw7NGKMfpR9jA=;
  b=iHriDfboqn5eVcE8wJapOzxgQJ0nEdvsfNpEQJFqifPUvnKWhGkz4n6b
   1cTIzm65J/Gyzni+W29OEpmIXnENoEcqi+viNXf1a29gGT7FVejyMMc4n
   rSV+3xx2j20lbY/kol41PTLfKWBre+fT+cTDoqnathXbZeEjs57QwkSEO
   gv8Jfb1hAw3R4ptidxh7f067ZbImIPOjI5R//kt1vdksIP+6Nnxyxw39Q
   SdsG9Z3AxnuNl+L9HkzaP9Zx3PKPEBa1c02xkN0Evkpb6sMTn03mEnwaW
   LiNOQgRN19MlQd5NmDNQKYztovVCUGhegOc7HdEFjmWQrzmtfQzr3Cx1j
   w==;
X-CSE-ConnectionGUID: SGUdF+1kTA2l+k17yge1XQ==
X-CSE-MsgGUID: 6unPcXVfR8KKNxEaSVoouQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="51394158"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="51394158"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 16:44:36 -0700
X-CSE-ConnectionGUID: h7Y9uRFlRLWKF70E9ghlbA==
X-CSE-MsgGUID: jSb26hQ2QOSf1JvRd2GsFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="136858500"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 May 2025 16:44:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDtrs-000DTd-26;
	Sat, 10 May 2025 23:44:32 +0000
Date: Sun, 11 May 2025 07:43:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 198/199]
 fs/bcachefs/bset.c:535:3: error: call to undeclared function
 '__bch2_bset_verify_rw_aux_tree'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202505110711.TyfjEvFi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   d815fb1b379fb43f7a33d1bede6efea16b6405e6
commit: e8a89a1d80edd0d477f297b75cbc2dce8ce4da11 [198/199] bcachefs: debug_check_bset_lookups
config: i386-buildonly-randconfig-004-20250511 (https://download.01.org/0day-ci/archive/20250511/202505110711.TyfjEvFi-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110711.TyfjEvFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110711.TyfjEvFi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/bcachefs/bset.c:531:8: warning: attribute declaration must precede definition [-Wignored-attributes]
     531 | static inline void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |        ^
   include/linux/compiler_types.h:236:23: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                       ^
   include/linux/compiler_attributes.h:165:56: note: expanded from macro '__gnu_inline'
     165 | #define __gnu_inline                    __attribute__((__gnu_inline__))
         |                                                        ^
   fs/bcachefs/bset.c:499:13: note: previous definition is here
     499 | static void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |             ^
>> fs/bcachefs/bset.c:531:8: warning: attribute declaration must precede definition [-Wignored-attributes]
     531 | static inline void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |        ^
   include/linux/compiler_types.h:236:58: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                                          ^
   arch/x86/include/asm/linkage.h:9:32: note: expanded from macro 'notrace'
       9 | #define notrace __attribute__((no_instrument_function))
         |                                ^
   fs/bcachefs/bset.c:499:13: note: previous definition is here
     499 | static void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |             ^
   fs/bcachefs/bset.c:531:20: error: redefinition of 'bch2_bset_verify_rw_aux_tree'
     531 | static inline void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |                    ^
   fs/bcachefs/bset.c:499:13: note: previous definition is here
     499 | static void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |             ^
>> fs/bcachefs/bset.c:535:3: error: call to undeclared function '__bch2_bset_verify_rw_aux_tree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     535 |                 __bch2_bset_verify_rw_aux_tree(b, t);
         |                 ^
   fs/bcachefs/bset.c:535:3: note: did you mean 'bch2_bset_verify_rw_aux_tree'?
   fs/bcachefs/bset.c:531:20: note: 'bch2_bset_verify_rw_aux_tree' declared here
     531 | static inline void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |                    ^
     532 |                                          struct bset_tree *t)
     533 | {
     534 |         if (static_branch_unlikely(&bch2_debug_check_bset_lookups))
     535 |                 __bch2_bset_verify_rw_aux_tree(b, t);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 bch2_bset_verify_rw_aux_tree
   2 warnings and 2 errors generated.


vim +/__bch2_bset_verify_rw_aux_tree +535 fs/bcachefs/bset.c

   498	
 > 499	static void bch2_bset_verify_rw_aux_tree(struct btree *b,
   500						 struct bset_tree *t)
   501	{
   502		struct bkey_packed *k = btree_bkey_first(b, t);
   503		unsigned j = 0;
   504	
   505		BUG_ON(bset_has_ro_aux_tree(t));
   506	
   507		if (!bset_has_rw_aux_tree(t))
   508			return;
   509	
   510		BUG_ON(t->size < 1);
   511		BUG_ON(rw_aux_to_bkey(b, t, j) != k);
   512	
   513		goto start;
   514		while (1) {
   515			if (rw_aux_to_bkey(b, t, j) == k) {
   516				BUG_ON(!bpos_eq(rw_aux_tree(b, t)[j].k,
   517						bkey_unpack_pos(b, k)));
   518	start:
   519				if (++j == t->size)
   520					break;
   521	
   522				BUG_ON(rw_aux_tree(b, t)[j].offset <=
   523				       rw_aux_tree(b, t)[j - 1].offset);
   524			}
   525	
   526			k = bkey_p_next(k);
   527			BUG_ON(k >= btree_bkey_last(b, t));
   528		}
   529	}
   530	
 > 531	static inline void bch2_bset_verify_rw_aux_tree(struct btree *b,
   532						 struct bset_tree *t)
   533	{
   534		if (static_branch_unlikely(&bch2_debug_check_bset_lookups))
 > 535			__bch2_bset_verify_rw_aux_tree(b, t);
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
