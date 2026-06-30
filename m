Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0759D337BA4;
	Tue, 30 Jun 2026 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786524; cv=none; b=QvE+j38GXBi4WnjKCROX/QEnkPIILnKdhfPf9bDtm8ZPdikjgALgxdjgJiFxc7i1e5nCYLCwDQZx2/nquN0g8gGzBb6Hmf5L8EMyohk4OhA5a05Q7Su6He5afj9Txx4Xl7MgHu42kABMd2xhnkHe9j5VeaX+3oe4j1f7f7r81O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786524; c=relaxed/simple;
	bh=mf2AN3KVRptSDp0/pSnZyekVBMDKlS5cnAoU2Qraoq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fxz2znz/6uqwlWJRAefHxRhCRte/AeD0t1F0iVRQPnb+akEjeLME/HaLW4dLQDtkQ9PEYLAGP0jE45NB0Mg7XEu35ZfLs352QFXYB6OlGYFm5RPPYafIU9qEJhj2VOAu7SMvmEu/gqiVPs+CqBHQKIDo+tbA1POBR2UZ09pWUQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUiTNbXR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUiTNbXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782786523; x=1814322523;
  h=date:from:to:cc:subject:message-id;
  bh=mf2AN3KVRptSDp0/pSnZyekVBMDKlS5cnAoU2Qraoq8=;
  b=XUiTNbXRsNW6QDQDxFQ835toMiNxHpqLAtdbVY4vs4ywTMNRlXz36HEs
   HfCHQsToH1Fu5xrbCxmGNXCa39Au7EE09nNQSUWRzomXmh5j7splHdl1p
   thru6xhByshUefljhCGdy6U7d5NzcWbUqm0MfwFheXuFjarrg4HrzoRoW
   29L9KiCKDiWD8nR2IlWcBv5DdDfClxQpAkf4MxkS7qpG9kf5hzFu8/Hb/
   W4O/6M5aoL07sZ6WkZXBBqzhoaOkFUvCqIBq6ZbTAzW/Vv6XUfkh73WdU
   e1zvNAriMxtCUK5k5L/ceCE3Xcun7+w/h5kHrxYNVl1FoqUAuA6CitAUx
   A==;
X-CSE-ConnectionGUID: 7DEqTu4OQf2A25E33pgKiw==
X-CSE-MsgGUID: 6ptD25bNS5qTRt1/gYbARA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="109042369"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="109042369"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 19:28:41 -0700
X-CSE-ConnectionGUID: vs3P80ygQMChvNXTl5UiDQ==
X-CSE-MsgGUID: lUHT+h+wTviOsFNGRzLsvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="247674480"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 19:28:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weODE-000000007xX-1am8;
	Tue, 30 Jun 2026 02:28:36 +0000
Date: Tue, 30 Jun 2026 10:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Oracle)" <liam@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v7.2_fixes 13/33] lib/maple_tree.c:531:14:
 error: call to undeclared function 'mt_locked'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202606301010.g1T3FOX8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2_fixes
head:   1536d2bf9195cbde5a1dd7fa78fd6995a29b004f
commit: 6f34957a13773332ff09b7cd43aa9486f0adb285 [13/33] maple_tree: Fix dereference of rcu type
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260630/202606301010.g1T3FOX8-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301010.g1T3FOX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301010.g1T3FOX8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/maple_tree.c:531:14: error: call to undeclared function 'mt_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     531 |                                                        mt_locked(mas->tree)));
         |                                                        ^
>> lib/maple_tree.c:744:29: error: static declaration of 'mt_locked' follows non-static declaration
     744 | static __always_inline bool mt_locked(const struct maple_tree *mt)
         |                             ^
   lib/maple_tree.c:531:14: note: previous implicit declaration is here
     531 |                                                        mt_locked(mas->tree)));
         |                                                        ^
   2 errors generated.


vim +/mt_locked +531 lib/maple_tree.c

   498	
   499	/*
   500	 * mas_set_parent_slots() - Bulk operation to set many slot parent pointers
   501	 * @mas: The maple state
   502	 * @parent: The encoded maple node that is the parent of @enode.
   503	 * @slot: The slot that of the @enode.
   504	 * @start_slot: The offset into @slot
   505	 * @count: The number of slots to set (eg: exclusive)
   506	 */
   507	static inline
   508	void mas_set_parent_slots(struct ma_state *mas, struct maple_enode *parent,
   509		void __rcu **slots, unsigned char start_slot, unsigned char count)
   510	{
   511		unsigned long val;
   512		unsigned long shift;
   513		unsigned long type;
   514		enum maple_type p_type = mte_node_type(parent);
   515		unsigned char i;
   516	
   517		MAS_BUG_ON(mas, p_type != maple_range_64 &&
   518				p_type != maple_arange_64);
   519	
   520		shift = MAPLE_PARENT_SLOT_SHIFT;
   521		type = MAPLE_PARENT_RANGE64;
   522	
   523		val = (unsigned long)parent;
   524		val &= ~MAPLE_NODE_MASK;
   525	
   526		for (i = 0; i < count; i++) {
   527			unsigned long pval = val | ((start_slot + i) << shift) | type;
   528			struct maple_enode *child;
   529	
   530			child = ma_enode_ptr(rcu_dereference_protected(slots[i],
 > 531							       mt_locked(mas->tree)));
   532			mte_to_node(child)->parent = ma_parent_ptr(pval);
   533		}
   534	}
   535	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
