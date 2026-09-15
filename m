Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB83D9058;
	Tue, 15 Sep 2026 03:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442155; cv=none; b=B4WBwSCZFLIXqOPE3un/275x0dlmGrUoHXx8oe9JWmjA7eHKaXgHeH/PeCcerOT9LQX3R67xHb+aA/Iih8yFcUzG3tSOlB/RknO/dwdbNsE91vRL3/V3ebdplHwj5tqQr8H1ubY/wQ7mVVsrVKQj+ovKyOQdIXDQL/3t0DSR6SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442155; c=relaxed/simple;
	bh=fKJ9xixeVPENq0xBXdcfN1Ejxzdet6yJFKgRJvPXhxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FQ3JLOJBHSnUA/wu0GxnYYdT/q9IKmiRXB4Pql6NAN6hZu3dpB0dmICAMLR5CmrUnRarF1U2Z9IxpSglayvidAOxLA4mmssulz+AL1V4oM0SmkGfkvE1BOR4JurUwHSFTWjob3QzTkIF0spxx9e8xS9QZMrYhFByVCHOuQCpTZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctdpwKOl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctdpwKOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789442154; x=1820978154;
  h=date:from:to:cc:subject:message-id;
  bh=fKJ9xixeVPENq0xBXdcfN1Ejxzdet6yJFKgRJvPXhxc=;
  b=ctdpwKOlFy6BzbwSd3milfCGdGr7V4JBQuuTe5dnNHGrKj809gIgDvQF
   cnbHHTNa1MJRTrAcrYw/OOa/uvqGDT8S8pwM3ACU9owE+DBOx+uAEOXfh
   jfZ2GUIuMJtYqthehUyLgMgcJVBNExyKFwpwPmS2KUIXKnz8swLA36v3f
   Lnr+R7TbOwpL0n96AtwgEfb8gt22RxprEognYyjaTdGBYtTDLWbpsFNHY
   b4yEHB2GuJ29RA/w0aWEcks7eFBrqQjW1u5Gzqf3ktokMH99tADCyitJB
   rScsn/uvuH+SR3hLDn64gL2WAVWZx5G+yglIuy7EiK27tbRK9ZfcOisvk
   g==;
X-CSE-ConnectionGUID: vH3tBw0sRASGTTqRwU1QRA==
X-CSE-MsgGUID: s0iLNULDTG67rVnoyP3gHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90004754"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90004754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 20:15:53 -0700
X-CSE-ConnectionGUID: A0lD1HwURtGlR06lVDeC1w==
X-CSE-MsgGUID: V3Z1BTkXQE+Q8GXEqK4leQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278090797"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2026 20:15:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Je9-000000003uT-25vR;
	Tue, 15 Sep 2026 03:15:49 +0000
Date: Tue, 15 Sep 2026 11:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v4 9/16] lib/test_maple_tree.c:356:29:
 error: call to undeclared function 'mt_slot_count'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202609151101.OpmICSIY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v4
head:   de1ab7ba20a1402fb09d82f56c37732e65e1b0f7
commit: 59685a5ddca1208bbdcbb990f5cacabb224b369f [9/16] maple_tree: Testing code update for triple split
config: x86_64-randconfig-016-20260914 (https://download.01.org/0day-ci/archive/20260915/202609151101.OpmICSIY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151101.OpmICSIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151101.OpmICSIY-lkp@intel.com/

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
   include/linux/maple_tree.h:639:7: note: 'mas_store' declared here
     639 | void *mas_store(struct ma_state *mas, void *entry);
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
 > 425			count = mas_data_end(mas);
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
