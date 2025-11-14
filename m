Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877A242D7B;
	Fri, 14 Nov 2025 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107391; cv=none; b=S6TLuZf6PjxtwTI4Gy5G0LBszaJrE5WVbEE9t3PvEV6NxeJJ4f5lPk78z182afbphausnUp+mYPjYjcAqI4wvX+2IXeMkqq4MwVel3CyLuEijm4hTRGEo+chpYbarftfbCms46S1hQ2xyhYPtP4xIiMWIxzfx2Zr3q5lyA6fmOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107391; c=relaxed/simple;
	bh=zM0BLwwhy9q1Q5GQUWLSaVxHfu7tfupMwf3Y+8YpT7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qS7sitTnl4z7cQiSEL7Mt5I3UcdbYFqZJsbkKo8z+aA5+05V5wWZfAcKWbwL1uF8D0Qzytf1SPsMp+gV/dnLO4OZof/zlZ1z516feL9b3YgqjM37dNqq2KGutIljd9/WWQn+t4HpeCaSEdM92E/xW/SbzsJiyA2l1nibbs2SYnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoFqayGV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoFqayGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763107390; x=1794643390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zM0BLwwhy9q1Q5GQUWLSaVxHfu7tfupMwf3Y+8YpT7A=;
  b=NoFqayGVRcTZhaspgmGToCtzuh+SeXS3pMcM14X5LanombFj2ey8ZCJn
   NQrpglePM6VK1meEGXWb1+t0ad7Jyjgnu1uFN9dakK0kiFy7xdHNpT5H5
   ARUSaa6c0oGraQKJMrpMQKX10XkF6KxUeefp5SWeepEbArDkrwQG4oAbZ
   H2vOsz20+ukQOTxUt9oVifhkpsHU0tzGUN5mc164lWbk1t+gTtGkmD7ou
   9RgExBVPnILALHPtFQD1+HxEY/J/+K0LVjK4gdlXfhJOjZlp+s+BRn0wn
   DCOE6oRsoKGeBKaLJ8UcmsLhN9S9X9lkuY3S8UG+am2LdWdJiZqSU81Zt
   w==;
X-CSE-ConnectionGUID: hSquSA/GRDaZnZDFY2G9LQ==
X-CSE-MsgGUID: qCANWuf2Q/GikFmboKuyHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65233208"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="65233208"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 00:03:09 -0800
X-CSE-ConnectionGUID: ozkUyCblTV6bRPxO0D7wyQ==
X-CSE-MsgGUID: plS5uRL4R22DnwgCv0Hn8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190499349"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2025 00:03:07 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJolt-0006KR-1U;
	Fri, 14 Nov 2025 08:03:05 +0000
Date: Fri, 14 Nov 2025 16:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 851/875]
 fs/bcachefs/data/reconcile.c:317:6: error: cannot jump from this goto
 statement to its label
Message-ID: <202511141510.PFNhwbDi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ab3c04679170b0e63c55680f725ceb4218b2b04c
commit: 08209c1a245fe1ca0b78b31747565a552670f76e [851/875] bcachefs: bch_extent_rebalance_bp
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251114/202511141510.PFNhwbDi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141510.PFNhwbDi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141510.PFNhwbDi-lkp@intel.com/

Note: the koverstreet-bcachefs/bcachefs-testing HEAD ab3c04679170b0e63c55680f725ceb4218b2b04c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/bcachefs/data/reconcile.c:317:6: error: cannot jump from this goto statement to its label
     317 |         if (fsck_err_on(!bp.v->level,
         |             ^
   fs/bcachefs/init/error.h:143:2: note: expanded from macro 'fsck_err_on'
     143 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/init/error.h:130:20: note: expanded from macro '__fsck_err_on'
     130 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                           ^
   fs/bcachefs/init/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/init/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/data/reconcile.c:342:25: note: jump bypasses initialization of variable with __attribute__((cleanup))
     342 |         CLASS(btree_node_iter, iter2)(trans, bp.v->btree_id, bp.v->pos, 0, bp.v->level - 1, 0);
         |                                ^
   1 error generated.


vim +317 fs/bcachefs/data/reconcile.c

   307	
   308	static struct bkey_s_c rebalance_bp_get_key(struct btree_trans *trans,
   309						    struct btree_iter *iter,
   310						    struct bkey_s_c_backpointer bp)
   311	{
   312		struct bch_fs *c = trans->c;
   313		int ret = 0;
   314		CLASS(printbuf, buf)();
   315	
   316		/* don't allow bps to non btree nodes: */
 > 317		if (fsck_err_on(!bp.v->level,
   318				trans, reconcile_bp_to_leaf_node_key,
   319				"reconcile bp to leaf node key\n%s",
   320				(bch2_bkey_val_to_text(&buf, c, bp.s_c), buf.buf))) {
   321			ret =   bch2_btree_delete(trans, BTREE_ID_reconcile_scan, bp.k->p, 0) ?:
   322				bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
   323			return ret ? bkey_s_c_err(ret) : bkey_s_c_null;
   324		}
   325	
   326		bch2_trans_node_iter_init(trans, iter, bp.v->btree_id, bp.v->pos, 0, bp.v->level, 0);
   327		struct bkey_s_c k = bch2_btree_iter_peek_slot(iter);
   328		if (bkey_err(k))
   329			return k;
   330	
   331		/*
   332		 * peek_slot() doesn't normally return NULL - except when we ask for a
   333		 * key at a btree level that doesn't exist.
   334		 *
   335		 * We may want to revisit this and change peek_slot():
   336		 */
   337		if (k.k && bch2_bkey_get_rebalance_bp(c, k) == bp.k->p.offset)
   338			return k;
   339	
   340		/* walk down a level, check for btree_node_will_make_reachable(b)) */
   341	
   342		CLASS(btree_node_iter, iter2)(trans, bp.v->btree_id, bp.v->pos, 0, bp.v->level - 1, 0);
   343		struct btree *b = bch2_btree_iter_peek_node(&iter2);
   344		if (IS_ERR(b))
   345			return bkey_s_c_err(PTR_ERR(b));
   346	
   347		if (b) {
   348			if (btree_node_will_make_reachable(b))
   349				return bkey_s_c_null;
   350	
   351			k = bkey_i_to_s_c(&b->key);
   352			if (bch2_bkey_get_rebalance_bp(c, k) == bp.k->p.offset)
   353				return k;
   354		}
   355	
   356		prt_printf(&buf, "reconcile backpointer to missing/incorrect btree ptr\n");
   357		bch2_bkey_val_to_text(&buf, c, bp.s_c);
   358		prt_newline(&buf);
   359		if (k.k)
   360			bch2_bkey_val_to_text(&buf, c, k);
   361		else
   362			prt_str(&buf, "(no key)");
   363	
   364		if (b) {
   365			prt_newline(&buf);
   366			bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(&b->key));
   367		}
   368	
   369		if (fsck_err(trans, reconcile_bp_to_missing_btree_ptr, "%s", buf.buf))
   370			ret =   bch2_btree_delete(trans, BTREE_ID_reconcile_scan, bp.k->p, 0) ?:
   371				bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
   372	fsck_err:
   373		return ret ? bkey_s_c_err(ret) : bkey_s_c_null;
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
