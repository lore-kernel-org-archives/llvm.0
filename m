Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84CF229B18;
	Fri, 10 Jul 2026 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691574; cv=none; b=up+5iMo1mN3wDj8PEn9gSzq8rt0bGxe2T2XwODhlDxv66wICRYMFC+9ssbgG2z0vIMlTMnZl+C9PtqtqJj4lxN25gpkZ2xnF9aCP2vxI3R89YU3BYvyiG3EkrWeXrKhD8BgSFSSur8KTN8eQTR/YuKRDhz070Vpyd1zSqZS6cgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691574; c=relaxed/simple;
	bh=6vyJPeh/vhz5GZ1KM/8N8l5B2AaVxU9M5qT5lD73yRA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MsYV3p0OOhwST03EZhEIy5ukjLn9184HygoRW1eMrMV+tUEiH6kHuwHwYj7GT71eaSuqU3IdNJT3JNWv6d78yrxYHRtvVcP9GyPOCctGNygEQqDQInugsDcdL8R4meUd4ZPlJCdz3aFDNzctmkmnwl342wD0+V9xUT/3rGe4ShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cs6Q4/js; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cs6Q4/js"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783691569; x=1815227569;
  h=date:from:to:cc:subject:message-id;
  bh=6vyJPeh/vhz5GZ1KM/8N8l5B2AaVxU9M5qT5lD73yRA=;
  b=Cs6Q4/jsEOXQosvcKCJVjpHTyuGVquuVs+2S4t3eia4ib31INtTxUKc9
   qKdgwSePxVM7UhYwTvBAx1h+IKzgLEGaORSBv9LywC7PPuT2yh+pstouB
   FolzoeCF8H2IqOJaIcVFXI+Eq41cclBsXZI2wiWDSsTOipkwVU/mFjRli
   1Pki1a9PfxXdJQTT9F45HHCDJb64ffrEkFCKW6xLH8KrcWOicf54mxnmz
   aej0TZQ12StL/yuuKfJMAKCSu43pFxAVNoI2xzAxr5CcieWMD+1wP5fk0
   NZa+f9ls4uPzMu8/aWzUmZoNwL8rzulingBWhLZ3obfYzI+FihdEoNisP
   Q==;
X-CSE-ConnectionGUID: W9ZD0VluS8WkMR3oLNJZwg==
X-CSE-MsgGUID: gZSEUaFlS7y31Yajdt87yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95033378"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95033378"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 06:52:46 -0700
X-CSE-ConnectionGUID: A6vMkCXETremf+cWiDGDrA==
X-CSE-MsgGUID: KRjGN+TlRmy6LaFJCXLgXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="284993226"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Jul 2026 06:52:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiBeg-00000000IzP-1L4b;
	Fri, 10 Jul 2026 13:52:39 +0000
Date: Fri, 10 Jul 2026 21:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v7.2_fixes 27/31]
 lib/test_maple_tree.c:356:29: error: call to undeclared function
 'mt_slot_count'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607102143.a8ULhyOo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2_fixes
head:   bad7721b2ef18bd6c1361bff214b8323cef1296f
commit: 5dc6e2040f47d163de17af84a26609cee99f962e [27/31] maple_tree: Testing code update for triple split
config: hexagon-randconfig-001-20260710 (https://download.01.org/0day-ci/archive/20260710/202607102143.a8ULhyOo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607102143.a8ULhyOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607102143.a8ULhyOo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_maple_tree.c:356:29: error: call to undeclared function 'mt_slot_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     356 |         if (mas->max - mas->min <= mt_slot_count(mas->node))
         |                                    ^
>> lib/test_maple_tree.c:359:8: error: call to undeclared function 'mas_data_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     359 |         val = mas_data_end(mas) + 1;
         |               ^
>> lib/test_maple_tree.c:420:2: error: call to undeclared function 'mas_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     420 |         mas_start(mas);
         |         ^
   lib/test_maple_tree.c:420:2: note: did you mean 'mas_store'?
   include/linux/maple_tree.h:640:7: note: 'mas_store' declared here
     640 | void *mas_store(struct ma_state *mas, void *entry);
         |       ^
   lib/test_maple_tree.c:425:11: error: call to undeclared function 'mas_data_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     425 |                 count = mas_data_end(mas);
         |                         ^
>> lib/test_maple_tree.c:426:9: error: call to undeclared function 'ma_pivots'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                       ^
>> lib/test_maple_tree.c:426:19: error: call to undeclared function 'mas_mn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                                 ^
>> lib/test_maple_tree.c:426:32: error: call to undeclared function 'mte_node_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                                              ^
>> lib/test_maple_tree.c:426:7: error: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'int' [-Wint-conversion]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/test_maple_tree.c:432:3: error: call to undeclared function 'mas_descend'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     432 |                 mas_descend(mas);
         |                 ^
>> lib/test_maple_tree.c:443:23: error: call to undeclared function 'mte_is_leaf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     443 |         MT_BUG_ON(mas->tree, mte_is_leaf(mas->node));
         |                              ^
   lib/test_maple_tree.c:444:8: error: call to undeclared function 'mas_data_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     444 |         val = mas_data_end(mas) + 1;
         |               ^
   lib/test_maple_tree.c:445:11: error: call to undeclared function 'mt_slot_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     445 |         target = mt_slot_count(mas->node);
         |                  ^
   lib/test_maple_tree.c:1522:2: error: call to undeclared function 'mas_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1522 |         mas_start(&mas);
         |         ^
   lib/test_maple_tree.c:1528:10: error: call to undeclared function 'ma_pivots'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1528 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[7] + 1;
         |                 ^
   lib/test_maple_tree.c:1528:20: error: call to undeclared function 'mas_mn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1528 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[7] + 1;
         |                           ^
   lib/test_maple_tree.c:1528:34: error: call to undeclared function 'mte_node_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1528 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[7] + 1;
         |                                         ^
>> lib/test_maple_tree.c:1528:58: error: subscripted value is not an array, pointer, or vector
    1528 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[7] + 1;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   lib/test_maple_tree.c:1535:58: error: subscripted value is not an array, pointer, or vector
    1535 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[8] + 1;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   18 errors generated.


vim +/mt_slot_count +356 lib/test_maple_tree.c

   343	
   344	static noinline bool __init mas_node_fill(struct ma_state *mas)
   345	{
   346		int target, val;
   347		void *fill = (void*)0x11111111;
   348		unsigned long high;
   349	
   350		if (!mas_is_active(mas))
   351			mas_walk(mas);
   352	
   353		if (!mas_is_active(mas))
   354			return false;
   355	
 > 356		if (mas->max - mas->min <= mt_slot_count(mas->node))
   357			goto done;
   358	
 > 359		val = mas_data_end(mas) + 1;
   360		target = mt_slot_count(mas->node);
   361		if (val == target)
   362			goto full;
   363	
   364		mas_walk(mas);
   365		high = mas->max;
   366		while (target > val && mas_is_active(mas)) {
   367			unsigned long old_last = mas->last;
   368			unsigned long new_last;
   369	
   370			if (old_last > mas->index) {
   371				new_last = mas->index + 1;
   372				if (new_last <= mas->index || new_last > old_last)
   373					new_last = old_last;
   374				mas->last = new_last;
   375				mas_store(mas, fill);
   376				val = mas_data_end(mas) + 1;
   377				if (target <= val)
   378					break;
   379			}
   380			mas_next_range(mas, high);
   381			if (!mas_is_active(mas))
   382				break;
   383		}
   384		return mas_node_first_split_offset(mas);
   385	
   386	full:
   387		if (mas->max - mas->min > mt_slot_count(mas->node))
   388			return mas_node_first_split_offset(mas);
   389	done:
   390		mas_set(mas, mas->max);
   391		mas_walk(mas);
   392		return false;
   393	}
   394	
   395	static noinline bool __init mas_node_split(struct ma_state *mas)
   396	{
   397		void *fill = (void*)0x22222222;
   398		unsigned long old_last, new_last;
   399	
   400		if (mas_node_fill(mas)) {
   401			old_last = mas->last;
   402			if (old_last <= mas->index)
   403				return false;
   404	
   405			new_last = mas->index + 1;
   406			if (new_last <= mas->index || new_last > old_last)
   407				new_last = old_last;
   408			mas->last = new_last;
   409			mas_store(mas, fill);
   410			return true;
   411		}
   412	
   413		return false;
   414	}
   415	
   416	static noinline void __init test_mas_node_depth(struct ma_state *mas,
   417			int depth)
   418	{
   419		mas_reset(mas);
 > 420		mas_start(mas);
   421		while (mas->depth < depth) {
   422			unsigned long *piv;
   423			int count, offset;
   424	
   425			count = mas_data_end(mas);
 > 426			piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
   427			offset = 0;
   428			while (offset < count && mas->index > piv[offset]) {
   429				offset++;
   430			}
   431			mas->offset = offset;
 > 432			mas_descend(mas);
   433			mas->depth++;
   434		}
   435	
   436	}
   437	
   438	static noinline void __init mas_internal_node_fill(struct ma_state *mas)
   439	{
   440		int val, target, depth;
   441		unsigned long high, next;
   442	
 > 443		MT_BUG_ON(mas->tree, mte_is_leaf(mas->node));
   444		val = mas_data_end(mas) + 1;
   445		target = mt_slot_count(mas->node);
   446		if (val == target)
   447			return;
   448	
   449		high = mas->max;
   450		depth = mas->depth;
   451		while (mas_data_end(mas) + 1 < target) {
   452			mas_walk(mas);
   453			if (mas_node_split(mas)) {
   454				next = mas->last + 1;
   455			} else {
   456				next = mas->max + 1;
   457			}
   458			if (!next || next > high)
   459				return;
   460	
   461			mas->index = next;
   462			test_mas_node_depth(mas, depth);
   463		}
   464	
   465	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
