Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793151377;
	b=S4aqgaGzkgsYI7MgQUyaGOXthidWWPuZkVvu8jJY9ECrJFZXtKIBSPP2ykLBmAmgTrrH
	 +UqOu8Pcl0a2/UgP0zbUkWD2dT0q7VospAGXUu8hyFOJtZQhCf2mcxxyhM1NISOeAOdk0
	 JGcZX0j3ozzw9BREgCfJUT6aBTwbNBYbAlZPtOvvnd/XJmC4DQWUFstXWvujKwOSakN27
	 m2+0JPv2+DW7r5EXzdCjxz8cL3CJfqU2GVCKwfdctSG4XbiJcJHXHcYJakpBGSh3fAJKg
	 4XAU+1j6APMuZGqbQtl3U+vC8BqbwIm/LKGzLvkIMXAadBDz7axZbwDs+ZRl17JI63g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793151377;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=foIWdIFCVeEvKuCrgMdTi+UOKStAwo/+12DlezF8dnY=;
	b=c7DT+rf+eQ1ArahQJ7kYUwXjrAw3gpwbXkR8YcnrDu5DV/GyupUS9OhzQ1/+l/3q1V79
	 fzu5l3enH7h89OeE7/TxRalQQ28VL2A1JekFBstiGiTYrFXh3naio9V/w7mLu9tjaaR8T
	 LnnVlxa9Nvx84KL8FLq06KA0RvDz2Zf2+0E0rbDIRa4kGvFpDqYpwDURBcLzWuuhlQtRh
	 7Sh2BeZNl+km2XNCsUJOKUyVYb1rNiqrgUNQ2WErkNeJVjg7ZROYjJprncIsTICFCrDbB
	 ZO8YbCD+fkvJ8k3vVEVcB8VEB3SncVr6cCFgMINRTJsnZshJf1e4OCR1QQg5fsRMw5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Afh3p+dh;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F50606A31D;
	Wed, 28 Oct 2026 01:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F50606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Afh3p+dh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793151377; x=1824687377;
  h=date:from:to:cc:subject:message-id;
  bh=omuej56tXSFNyfPIhq7K1EV4izX3LpK0fILsZXjlfDI=;
  b=Afh3p+dhdue2nkTNcW+cHXxMOeV0xdnkm9pVFEtH0hoRFq8PkBK0KHLZ
   cObgZPKGCJ9a1AnkI6pFgpBsSKZxderPjj6YYrTSRtT9WyneWKmTowprF
   LM55+jDobSYZiRrZbS+cH6aRBIxzmzIz56IPpTUnE2SMJt/c0+VEf1bpy
   JHi9elljLBqUVaE4H5LoPHqqxqHUkJnIOonaQPbQ0ZcLT8dl50oUjKoMQ
   n1MJ5m3p+S/bW8EefiUsbxgy102yyr37pMDdfIcH1W6N0aPYbvmv1Ou19
   2K8lCizWa8Fu9yjDVbF/zg27P00S2L8CbrS9GgobzZxywZRDZ05Dd3itO
   g==;
X-CSE-ConnectionGUID: KJsouvSURSC0Bk7hZT3zoA==
X-CSE-MsgGUID: L6ejHw3dQvWiWyrn+F205A==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1890636"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1890636"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 18:36:16 -0700
X-CSE-ConnectionGUID: 6HPhCVmnQtG3NTbbLA6nlg==
X-CSE-MsgGUID: +R8CLTJ9THaLOPd2qvLWyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6531562"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 27 Oct 2026 18:36:13 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLsaH-000000004il-49nP;
	Wed, 28 Oct 2026 01:36:09 +0000
Date: Wed, 28 Oct 2026 02:35:09 +0100
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [liam:dense_ulong 75/78] lib/maple_tree.c:7216:13: error:
 redefinition of 'mas_wr_span_walk'
Message-ID: <202610280229.nc2IHXJN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git dense_ulong
head:   263600ba8fac7176cac2ef7eed0a831c9acaa814
commit: 39694f20b7d4c01b5039b9193bc478448cb0d880 [75/78] maple_tree: Use 32 bit nodes for any node that spans 4G or below
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261028/202610280229.nc2IHXJN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280229.nc2IHXJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280229.nc2IHXJN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/maple_tree.c:7216:13: error: redefinition of 'mas_wr_span_walk'
    7216 | static bool mas_wr_span_walk(struct ma_wr_state *l_wr, struct ma_wr_state *r_wr)
         |             ^
   lib/maple_tree.c:6054:13: note: previous definition is here
    6054 | static bool mas_wr_span_walk(struct ma_wr_state *l_wr, struct ma_wr_state *r_wr)
         |             ^
>> lib/maple_tree.c:7250:13: error: redefinition of 'mas_wr_span_setup'
    7250 | static void mas_wr_span_setup(struct ma_wr_state *wr_mas)
         |             ^
   lib/maple_tree.c:6089:13: note: previous definition is here
    6089 | static void mas_wr_span_setup(struct ma_wr_state *wr_mas)
         |             ^
   2 errors generated.


vim +/mas_wr_span_walk +7216 lib/maple_tree.c

5d659bbb52a24f Sidhartha Kumar          2024-08-14  7204  
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7205) /*
39694f20b7d4c0 Liam R. Howlett (Google  2026-10-18  7206) <<<<<<< HEAD
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7207)  * mas_wr_span_walk() - Walk both sides of a spanning store in step.
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7208)  * @l_wr: The left write state, at the node the write spans
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7209)  * @r_wr: The right write state, at the same node with the right index
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7210)  *
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7211)  * Return: true if a level pairs a 32-bit left node with a 64-bit right node.
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7212)  * Only such a level can hold more than two 64-bit nodes of data without both
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7213)  * sides being full; a 32-bit right node means every entry fits 32-bit and the
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7214)  * data is sized to that.
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7215)  */
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02 @7216) static bool mas_wr_span_walk(struct ma_wr_state *l_wr, struct ma_wr_state *r_wr)
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7217) {
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7218) 	struct ma_state *l_mas = l_wr->mas;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7219) 	struct ma_state *r_mas = r_wr->mas;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7220) 	bool mixed = false;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7221) 
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7222) 	while (true) {
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7223) 		mas_wr_walk_descend(l_wr);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7224) 		mas_wr_walk_descend(r_wr);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7225) 		if (node_is_32b(l_wr->type) && !node_is_32b(r_wr->type))
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7226) 			mixed = true;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7227) 
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7228) 		l_wr->content = mas_slot_locked(l_mas, l_wr->slots, l_mas->offset);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7229) 		r_wr->content = mas_slot_locked(r_mas, r_wr->slots, r_mas->offset);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7230) 		if (ma_is_leaf(l_wr->type))
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7231) 			return mixed;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7232) 
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7233) 		mas_wr_walk_traverse(l_wr);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7234) 		mas_wr_walk_traverse(r_wr);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7235) 	}
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7236) }
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7237) 
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7238) /*
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7239)  * mas_wr_span_setup() - Settle the range and path of a spanning store.
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7240)  * @wr_mas: The maple write state, stopped at the node the write spans
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7241)  *
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7242)  * The store takes the node holding last + 1 as its right side, to join a NULL
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7243)  * there and to replace a node the write ends on; a NULL also grows over a NULL
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7244)  * ending the previous node.  Do the same here so the heights recorded by the
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7245)  * walk, and the nodes per level, are those the store will use.  Only a write
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7246)  * into the last slot of a full left leaf whose right side starts a full node
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7247)  * can 3-way split; a level mixing widths at the 4G seam is treated as if it
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7248)  * could.
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7249)  */
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02 @7250) static void mas_wr_span_setup(struct ma_wr_state *wr_mas)
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7251) {
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7252) 	struct ma_state *mas = wr_mas->mas;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7253) 	struct ma_state l_mas, r_mas;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7254) 	MA_WR_STATE(l_wr, &l_mas, wr_mas->entry);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7255) 	MA_WR_STATE(r_wr, &r_mas, wr_mas->entry);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7256) 	u64 last = mas->last;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7257) 	bool mixed;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7258) 
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7259) 	if (mas->last < mas_tree_max(mas))
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7260) 		mas->last++;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7261) 
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7262) walk:
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7263) 	/* Walk to the right side the store will use for the true heights. */
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7264) 	mas_reset(mas);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7265) 	wr_mas->sufficient_height = 0;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7266) 	wr_mas->vacant_height = 0;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7267) 	wr_mas->content = mas_start_wr(mas);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7268) 	mas_wr_walk(wr_mas);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7269) 	l_mas = *mas;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7270) 	r_mas = *mas;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7271) 	r_mas.index = r_mas.last;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7272) 	mixed = mas_wr_span_walk(&l_wr, &r_wr);
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7273) 
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7274) 	if (!wr_mas->entry) {
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7275) 		if (!r_wr.content && r_wr.r_max > last) {
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7276) 			last = r_wr.r_max;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7277) 			/*
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7278) 			 * The NULL ends the node, so the store's right side is the
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7279) 			 * node after it: size from there.
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7280) 			 */
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7281) 			if (last == r_mas.max && last < mas_tree_max(mas)) {
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7282) 				mas->last = last + 1;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7283) 				goto walk;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7284) 			}
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7285) 		}
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7286) 
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7287) 		/* Growing left into the previous node may move the span up. */
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7288) 		if (l_wr.content && !l_mas.offset &&
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7289) 		    l_mas.index == l_wr.r_min && l_mas.index &&
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7290) 		    mas_prev_is_null(&l_mas)) {
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7291) 			mas->index = l_mas.index;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7292) 			goto walk;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7293) 		}
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7294) 	}
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7295) 	mas->last = last;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7296) 
cb9b231377c7bf Liam R. Howlett (Oracle  2026-10-05  7297) 	/* A dense leaf can hold three range leaves of entries. */
cb9b231377c7bf Liam R. Howlett (Oracle  2026-10-05  7298) 	if (mixed || ma_is_dense(l_wr.type) || ma_is_dense(r_wr.type))
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7299) 		wr_mas->span_nodes = 3;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7300) 	else if (l_mas.offset == l_mas.end &&
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7301) 		 l_mas.end == mt_slots[l_wr.type] - 1 &&
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7302) 		 !r_mas.offset && r_mas.end == mt_slots[r_wr.type] - 1 &&
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7303) 		 l_wr.r_min < mas->index &&
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7304) 		 (wr_mas->entry || (l_wr.content && r_wr.content)))
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7305) 		wr_mas->span_nodes = 3;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7306) 	else
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7307) 		wr_mas->span_nodes = 2;
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7308) }
d607b00c1eae3c Liam R. Howlett (Oracle  2026-10-02  7309) 

:::::: The code at line 7216 was first introduced by commit
:::::: d607b00c1eae3c2aafc21d47d7eaea046870a748 maple_tree: Reduce spanning store preallocations

:::::: TO: Liam R. Howlett (Oracle) <liam@infradead.org>
:::::: CC: Liam R. Howlett (Google) <liam@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
