Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571803C3789;
	Fri, 26 Jun 2026 22:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782512409; cv=none; b=Dyn68dQNsK/TiHRAm5E2o+l2dlHr9Bnp5tTqb97v3Cbaq71D/nu9223qaB2mcOJsL9S3JqT7ga/nVMOV06QOvUMOFHD4Hfh8jbfsVf46vc6araCJxETJaCbds/8kIg96UBfqGlcGNNzNO5NuJTxS+CRHVA7YlXnC1TOv4e4ZkSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782512409; c=relaxed/simple;
	bh=x9ORSppIlODyqz7J3WGxcuE1SGSS80ZypeOH+rbTc+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kmRAwLdCbrQDWAHhTQ66juyBlR4tFGT4XKBDWcrKfI0ND5i+epTPG1JldAhQATUDfqNwAThD7Zx8Rm+7vompy+VfFtza1HOTqj9JOygpPpDuGiTJ7VEcitZlhvR1cltpAvk7Nxy2ODUvxmiw/0IqQmpY6TdulakRRZ/qZKs7Qug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xj35uSwR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xj35uSwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782512408; x=1814048408;
  h=date:from:to:cc:subject:message-id;
  bh=x9ORSppIlODyqz7J3WGxcuE1SGSS80ZypeOH+rbTc+Y=;
  b=Xj35uSwRUJn55KbTDm5X6+11e23fLfhzIboNY4Xo9k5L6hxFWJr9ffTF
   t3Xt3RAtW+l1iI9/F1qG1uPoKav/zqqmW16o6dh1RpiQxA2/CMCgdMRzS
   Q45r/ft+HrJdCEnFql1LZP3/oWyZpOBPywZT3ZiheL8gRz7CVNuM0ti+8
   CqxKPOh5KxAXDCpIu6feRIQtdoN8YOYq9mP66DNH4sPU+/E6SJzWV71qK
   JJrCZrrnPTXK7zDV0H+l01GX2blPpOSNgGYIHedEcticpgzXMhdSurDWi
   KapVquHVEe0+IRiRG63MM4sY+ArKZkfyTtbZwoDry1ra0O/rDXKrqj1GW
   A==;
X-CSE-ConnectionGUID: tQ6mp7DqQeadIGC9gCWnQw==
X-CSE-MsgGUID: 9ngxtjMcTU6XcziZBzXHwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="100743415"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="100743415"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 15:20:04 -0700
X-CSE-ConnectionGUID: yW20SBaGRja5xDmwK+iZXA==
X-CSE-MsgGUID: ZEwctVhJSM679ddXnf0D+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="251578888"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Jun 2026 15:20:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdEtz-000000005TF-22Ct;
	Fri, 26 Jun 2026 22:19:59 +0000
Date: Sat, 27 Jun 2026 06:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v7.2 28/31] lib/test_maple_tree.c:299:3:
 error: call to undeclared function 'mas_next_slot'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202606270603.0Tyj0cBH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2
head:   be119ad50e9c87a4a975871d84614f7c6aeaf0de
commit: d4eb0ef8b516c8492a60a066c467f580ae9c0074 [28/31] maple_tree: Testing code update for triple split
config: x86_64-buildonly-randconfig-005-20260627 (https://download.01.org/0day-ci/archive/20260627/202606270603.0Tyj0cBH-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270603.0Tyj0cBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270603.0Tyj0cBH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_maple_tree.c:299:3: error: call to undeclared function 'mas_next_slot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     299 |                 mas_next_slot(mas, ULONG_MAX, true);
         |                 ^
>> lib/test_maple_tree.c:314:3: error: call to undeclared function 'mas_prev_slot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     314 |                 mas_prev_slot(mas, 0, true);
         |                 ^
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
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/mas_next_slot +299 lib/test_maple_tree.c

   289	
   290	static noinline void __init test_mas_next_node(struct ma_state *mas)
   291	{
   292		struct maple_enode *this_node;
   293	
   294		MT_BUG_ON(mas->tree, !mas_is_active(mas));
   295	
   296		this_node = mas->node;
   297	
   298		while(this_node == mas->node) {
 > 299			mas_next_slot(mas, ULONG_MAX, true);
   300			MT_BUG_ON(mas->tree, !mas_is_active(mas));
   301		}
   302	
   303	}
   304	
   305	static noinline void __init test_mas_prev_node(struct ma_state *mas)
   306	{
   307		struct maple_enode *this_node;
   308	
   309		MT_BUG_ON(mas->tree, !mas_is_active(mas));
   310	
   311		this_node = mas->node;
   312	
   313		while(this_node == mas->node) {
 > 314			mas_prev_slot(mas, 0, true);
   315			MT_BUG_ON(mas->tree, !mas_is_active(mas));
   316		}
   317	
   318	}
   319	
   320	static noinline void __init __maybe_unused test_mas_node_last_slot(struct ma_state *mas)
   321	{
   322		test_mas_next_node(mas);
   323		mas_prev_range(mas, 0);
   324	}
   325	
   326	
   327	static noinline bool __init mas_node_first_split_offset(struct ma_state *mas)
   328	{
   329		struct maple_enode *node = mas->node;
   330		unsigned long high = mas->max;
   331	
   332		while (mas_is_active(mas) && node == mas->node) {
   333			if (mas->index != mas->last)
   334				return true;
   335	
   336			if (mas->last >= high)
   337				break;
   338			mas_next_range(mas, high);
   339		}
   340	
   341		return false;
   342	}
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
