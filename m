Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0717B1A239D;
	Thu,  4 Sep 2025 01:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950985; cv=none; b=kqAHUHQtQ1dwgqngvT1zljhf4LJRhwG0+lLNBBXqT7si47X6QnFQOY3j32QEDUpYVrhUIdBEXZ4EBaDMjLwId88PeAxui09IINVjGD+J34+HT0cao0+vcLS32aYx7aC5RPkNBzYT2r1TKA470WH69paU7ci+Kn9Kk45PFk08iSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950985; c=relaxed/simple;
	bh=Bhk+XvSd6SUJL+TJWmrhapBH0viraxUMrMNhFqMleRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOopfmRKO1qz75SEbhkt51x/Uts0gXBKkjCZQ++bAxyhLjVXy5VGakkFKwImOVNnvdUANfqze31i9ByydHATSlC5MRdmD3sXU29AfztgF4S43RqLOmIMTllxXfsrvbyh9ymiudpEipPVLLMDHgV41UOpbxW8HYUGwby22sWzlxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnReapsM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnReapsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756950984; x=1788486984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bhk+XvSd6SUJL+TJWmrhapBH0viraxUMrMNhFqMleRY=;
  b=PnReapsM2d9yblT7Y9+EfrSYnK32qFZC63WpCEVYf5DDZPeK5SIWzai0
   KdQKYGqSQI/WhCs43yopzXfBqhCwArbWxKczcgcEZpoV3wP87oP3a/VoD
   qRgn9lMkUW9F/AnuDuX71xyVk+FOyT77ggi5s2BnEtUCpj4pssmy2qG0q
   92R1aGLsWma9BztqWM8qos0GBjtvg3GBp6RCOWJdcI0c4HbS/OrEDR7YB
   n4VfnFZvZx6emkhJZD9ec1fjJdCb1djuxhmSUTKcvN1t+ai8hS1HyivRs
   X2n9P9ciqgY/jLSkL4vG8hgQ2rXm/s29B1ETuf2jU5HQJ8hhWxcvbBW0k
   g==;
X-CSE-ConnectionGUID: 1pURCK76RxOpLD23CGrnvA==
X-CSE-MsgGUID: MgEyhtyWTvOXgauJZm8wgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59426176"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="59426176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:56:23 -0700
X-CSE-ConnectionGUID: 0WVjAwxiQT+hsDuEQ+Ub7w==
X-CSE-MsgGUID: BlAeTP+dTKOhUW5Sm8F3WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="172583573"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2025 18:56:22 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utzBw-0004an-0m;
	Thu, 04 Sep 2025 01:55:28 +0000
Date: Thu, 4 Sep 2025 09:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 325/330]
 fs/bcachefs/btree_iter.c:196:2: warning: label followed by a declaration is
 a C23 extension
Message-ID: <202509040924.OaOsaL1n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   bfa840548738b8b2e3dc14c850b98878335bbfcc
commit: 39e3fc7603211022b72480fecf34c9fe9dfc7429 [325/330] bcachefs: Fix __bch2_btree_path_verify_level() for interior nodes
config: i386-buildonly-randconfig-005-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040924.OaOsaL1n-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040924.OaOsaL1n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040924.OaOsaL1n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_iter.c:196:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     196 |         CLASS(printbuf, buf)();
         |         ^
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:5:1: note: expanded from here
       5 | class_printbuf_t
         | ^
   1 warning generated.


vim +196 fs/bcachefs/btree_iter.c

   136	
   137	static void __bch2_btree_path_verify_level(struct btree_trans *trans,
   138					struct btree_path *path, unsigned level)
   139	{
   140		struct btree_path_level *l = &path->l[level];
   141		bool locked = btree_node_locked(path, level);
   142	
   143		if (path->cached) {
   144			if (!level)
   145				__bch2_btree_path_verify_cached(trans, path);
   146			return;
   147		}
   148	
   149		if (!btree_path_node(path, level))
   150			return;
   151	
   152		if (!bch2_btree_node_relock_notrace(trans, path, level))
   153			return;
   154	
   155		BUG_ON(!btree_path_pos_in_node(path, l->b));
   156	
   157		bch2_btree_node_iter_verify(&l->iter, l->b);
   158	
   159		/* For interior nodes, the iterator may have skipped past deleted keys: */
   160		struct btree_node_iter tmp = l->iter;
   161		const struct bkey_packed *p = level
   162			? bch2_btree_node_iter_prev(&tmp, l->b)
   163			: bch2_btree_node_iter_prev_all(&tmp, l->b);
   164		tmp = l->iter;
   165		const struct bkey_packed *k = level
   166			? bch2_btree_node_iter_peek(&tmp, l->b)
   167			: bch2_btree_node_iter_peek_all(&tmp, l->b);
   168	
   169		const char *msg;
   170		if (!(level > path->level && trans->journal_replay_not_finished)) {
   171			/*
   172			 * We can't run these checks for interior nodes when we're still
   173			 * using the journal overlay because there might be a key in
   174			 * the interior node that points midway through the current leaf
   175			 * node - which is deleted in the journal overlay, but set_pos()
   176			 * will skip past it and cause the interior node iterators to be
   177			 * inconsistent in a way that doesn't matter and it can't check
   178			 * for.
   179			 */
   180	
   181			if (p && bkey_iter_pos_cmp(l->b, p, &path->pos) >= 0) {
   182				msg = "before";
   183				goto err;
   184			}
   185	
   186			if (k && bkey_iter_pos_cmp(l->b, k, &path->pos) < 0) {
   187				msg = "after";
   188				goto err;
   189			}
   190		}
   191	
   192		if (!locked)
   193			btree_node_unlock(trans, path, level);
   194		return;
   195	err:
 > 196		CLASS(printbuf, buf)();
   197		prt_printf(&buf, "path should be %s key at level %u", msg, level);
   198	
   199		prt_str(&buf, "\npath pos ");
   200		bch2_bpos_to_text(&buf, path->pos);
   201	
   202		prt_str(&buf, "\nprev key ");
   203		if (p) {
   204			struct bkey uk = bkey_unpack_key(l->b, p);
   205			bch2_bkey_to_text(&buf, &uk);
   206		} else {
   207			prt_printf(&buf, "(none)");
   208		}
   209	
   210		prt_str(&buf, "\ncur  key ");
   211		if (k) {
   212			struct bkey uk = bkey_unpack_key(l->b, k);
   213			bch2_bkey_to_text(&buf, &uk);
   214		} else {
   215			prt_printf(&buf, "(none)");
   216		}
   217	
   218		panic("%s\n", buf.buf);
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
