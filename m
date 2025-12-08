Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6363023D7E6;
	Mon,  8 Dec 2025 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765208438; cv=none; b=DFJY3zniQhiw/D/aQxEcxlqvyIj0OVGggy8mkl83eY1o0NtM6tOL2Scu8vFxpM0i1jA0apNgjbHFRjLYQRR5bRfhbnA/IuyiMQEvNG+/B7n5EoRoJjUVvm/0wrm1SGAqlNmIW/hNk73UKOucfwmHNDiKNnudbm1HGXG0Jel/HUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765208438; c=relaxed/simple;
	bh=CX2p1NRuct87yOj9BEW4rDcCKf/p3LMfne+22RQrH4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D89RxIIXFHIoM+PlDpnDIYdqz+9LuEWUSQYTKXWBDWT/frIDLSOVCKMi/GW0H36Xfzwf7hzF0w1OePT//M/TzWJREytIt03UrmDEU32lUbtqHU7cHBRHjUCJYFZmOocUWA3DGAhX04v0366p1tFUxv0jBkYEgVxEqroNFuvMw48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZnvAiMv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZnvAiMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765208436; x=1796744436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CX2p1NRuct87yOj9BEW4rDcCKf/p3LMfne+22RQrH4Y=;
  b=SZnvAiMvO6arJYnFyrqrie0sQO9RRicKY4UUgSFNQBlMtT3Cde8OcU8t
   htyhIO27zYKha+Oyy4zqiXIuddsqIu/rvKKXyObMUc7+pgkS9aFWF7ErZ
   RwH+RS6p2sLn4GipBEnzo9Yab4qqua5je6vaizZQOZfbnFxcNiBO8SDxk
   lQ1LXAhp3lE+pEoTMG07R6v4lGalw9iCZLeQ8HQJkIzSeFlXwZoWXJPPW
   Ov/UE6Oj+8aUvF75CAkOybVXX1QAc/1jFs5Tgi8bzy7VVi3DHBbfZ7w0M
   s9ybEZYAp+cQwjkv+iGfae3kt9/nzL5+AtiQuRxDeeHA58vyrJ/u6pjqK
   g==;
X-CSE-ConnectionGUID: jbbu+IZrRmuRMfKcYzoSDA==
X-CSE-MsgGUID: KfSBMEwmR7eLhb+GkziawA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="71004203"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="71004203"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 07:40:36 -0800
X-CSE-ConnectionGUID: f3nc2LZZT0anYMMczQamag==
X-CSE-MsgGUID: 5mpz2td+TmaJEjtqdBD2iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195023003"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2025 07:40:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSdLk-000000000WT-0eIa;
	Mon, 08 Dec 2025 15:40:32 +0000
Date: Mon, 8 Dec 2025 23:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 459/1104]
 fs/bcachefs/alloc/backpointers.c:986:4: error: call to undeclared function
 '__WARN'; ISO C99 and later do not support implicit function declarations
Message-ID: <202512082321.2kku0DpK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   2f94f2e080a961cd6401d4bea5c31ff03516d30e
commit: 3fdc7b4035515f784e1d442bcca383f5c0267e53 [459/1104] bcachefs: move alloc files to subdir
config: arm-randconfig-004-20251208 (https://download.01.org/0day-ci/archive/20251208/202512082321.2kku0DpK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 000e46219ba1ee53fc42d35e00c314c2807e8b14)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512082321.2kku0DpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512082321.2kku0DpK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/alloc/backpointers.c:986:4: error: call to undeclared function '__WARN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     986 |                         __WARN();
         |                         ^
   1 error generated.


vim +/__WARN +986 fs/bcachefs/alloc/backpointers.c

c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   883  
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   884  static int check_bucket_backpointers_to_extents(struct btree_trans *, struct bch_dev *, struct bpos,
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   885  						struct bkey_buf *last_flushed);
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   886  
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   887  static int check_bucket_backpointer_mismatch(struct btree_trans *trans, struct bkey_s_c alloc_k,
39cea302f13a0a9 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09   888  					     bool *had_mismatch,
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   889  					     struct bkey_buf *last_flushed,
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   890  					     struct bpos *last_pos,
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   891  					     unsigned *nr_iters)
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   892  {
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   893  	struct bch_fs *c = trans->c;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   894  	struct bch_alloc_v4 a_convert;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   895  	const struct bch_alloc_v4 *a = bch2_alloc_to_v4(alloc_k, &a_convert);
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   896  	bool need_commit = false;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   897  
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   898  	if (!bpos_eq(*last_pos, alloc_k.k->p))
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   899  		*nr_iters = 0;
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   900  
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   901  	*last_pos = alloc_k.k->p;
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   902  
39cea302f13a0a9 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09   903  	*had_mismatch = false;
39cea302f13a0a9 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09   904  
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   905  	if (a->data_type == BCH_DATA_sb ||
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   906  	    a->data_type == BCH_DATA_journal ||
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   907  	    a->data_type == BCH_DATA_parity)
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   908  		return 0;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   909  
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   910  	u32 sectors[ALLOC_SECTORS_NR];
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   911  	memset(sectors, 0, sizeof(sectors));
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   912  
6bf809fcd4197b5 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14   913  	CLASS(bch2_dev_bucket_tryget_noerror, ca)(trans->c, alloc_k.k->p);
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   914  	if (!ca)
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   915  		return 0;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   916  
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   917  	struct bkey_s_c bp_k;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   918  	int ret = 0;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   919  	for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   920  				bucket_pos_to_bp_start(ca, alloc_k.k->p),
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   921  				bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   922  		if (bp_k.k->type != KEY_TYPE_backpointer)
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   923  			continue;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   924  
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   925  		struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   926  
2b67b72da5a0347 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08   927  		if (c->sb.version_upgrade_complete < bcachefs_metadata_version_backpointer_bucket_gen &&
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   928  		    (bp.v->bucket_gen != a->gen ||
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   929  		     bp.v->pad)) {
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   930  			ret = bch2_backpointer_del(trans, bp_k.k->p);
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   931  			if (ret)
f6ecd9850b5e0be fs/bcachefs/backpointers.c Kent Overstreet 2025-07-30   932  				return ret;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   933  
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   934  			need_commit = true;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   935  			continue;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   936  		}
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   937  
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   938  		if (bp.v->bucket_gen != a->gen)
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   939  			continue;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   940  
962322475bb5ceb fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   941  		int alloc_counter = data_type_to_alloc_counter(bp.v->data_type);
962322475bb5ceb fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   942  		if (alloc_counter < 0)
962322475bb5ceb fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   943  			continue;
962322475bb5ceb fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   944  
962322475bb5ceb fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   945  		sectors[alloc_counter] += bp.v->bucket_len;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   946  	};
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   947  	if (ret)
6bf809fcd4197b5 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14   948  		return ret;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   949  
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   950  	if (need_commit) {
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   951  		ret = bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   952  		if (ret)
6bf809fcd4197b5 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14   953  			return ret;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   954  	}
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   955  
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   956  	if (sectors[ALLOC_dirty]  > a->dirty_sectors ||
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   957  	    sectors[ALLOC_cached] > a->cached_sectors ||
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   958  	    sectors[ALLOC_stripe] > a->stripe_sectors) {
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   959  		if (*nr_iters) {
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   960  			CLASS(printbuf, buf)();
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   961  			bch2_log_msg_start(c, &buf);
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   962  
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   963  			prt_printf(&buf, "backpointer sectors > bucket sectors, but found no bad backpointers\n"
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   964  				   "bucket %llu:%llu data type %s, counters\n",
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   965  				   alloc_k.k->p.inode,
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   966  				   alloc_k.k->p.offset,
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   967  				   __bch2_data_types[a->data_type]);
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   968  			if (sectors[ALLOC_dirty]  > a->dirty_sectors)
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   969  				prt_printf(&buf, "dirty: %u > %u\n",
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   970  					   sectors[ALLOC_dirty], a->dirty_sectors);
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   971  			if (sectors[ALLOC_cached] > a->cached_sectors)
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   972  				prt_printf(&buf, "cached: %u > %u\n",
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   973  					   sectors[ALLOC_cached], a->cached_sectors);
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   974  			if (sectors[ALLOC_stripe] > a->stripe_sectors)
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   975  				prt_printf(&buf, "stripe: %u > %u\n",
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   976  					   sectors[ALLOC_stripe], a->stripe_sectors);
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   977  
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   978  			for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   979  						bucket_pos_to_bp_start(ca, alloc_k.k->p),
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   980  						bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   981  				bch2_bkey_val_to_text(&buf, c, bp_k);
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   982  				prt_newline(&buf);
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   983  			}
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   984  
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   985  			bch2_print_str(c, KERN_ERR, buf.buf);
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04  @986  			__WARN();
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   987  			return ret;
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   988  		}
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   989  
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   990  		*nr_iters += 1;
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   991  
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   992  		return check_bucket_backpointers_to_extents(trans, ca, alloc_k.k->p, last_flushed) ?:
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   993  			bch_err_throw(c, transaction_restart_nested);
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   994  	}
8317017fbfa0824 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   995  
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   996  	if (sectors[ALLOC_dirty]  != a->dirty_sectors ||
15800f3d4b0134a fs/bcachefs/backpointers.c Kent Overstreet 2025-02-07   997  	    sectors[ALLOC_cached] != a->cached_sectors ||
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   998  	    sectors[ALLOC_stripe] != a->stripe_sectors) {
0fb08f59ed996c9 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08   999  		/*
0fb08f59ed996c9 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1000  		 * Post 1.14 upgrade, we assume that backpointers are mostly
0fb08f59ed996c9 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1001  		 * correct and a sector count mismatch is probably due to a
0fb08f59ed996c9 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1002  		 * write buffer race
0fb08f59ed996c9 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1003  		 *
0fb08f59ed996c9 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1004  		 * Pre upgrade, we expect all the buckets to be wrong, a write
0fb08f59ed996c9 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1005  		 * buffer flush is pointless:
0fb08f59ed996c9 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1006  		 */
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1007  		if (c->sb.version_upgrade_complete >= bcachefs_metadata_version_backpointer_bucket_gen) {
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1008  			ret = bch2_backpointers_maybe_flush(trans, alloc_k, last_flushed);
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1009  			if (ret)
6bf809fcd4197b5 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14  1010  				return ret;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1011  		}
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1012  
13ffcbae86dadbf fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1013  		bool empty = (sectors[ALLOC_dirty] +
13ffcbae86dadbf fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1014  			      sectors[ALLOC_stripe] +
13ffcbae86dadbf fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1015  			      sectors[ALLOC_cached]) == 0;
13ffcbae86dadbf fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1016  
15f969326ee296f fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1017  		ret = bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_mismatch,
15f969326ee296f fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1018  					     alloc_k.k->p.offset) ?:
15f969326ee296f fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1019  			(empty
15f969326ee296f fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1020  			 ? bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_empty,
15f969326ee296f fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1021  						  alloc_k.k->p.offset)
15f969326ee296f fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1022  			 : 0);
39cea302f13a0a9 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1023  
39cea302f13a0a9 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1024  		*had_mismatch = true;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1025  	}
6bf809fcd4197b5 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14  1026  
6bf809fcd4197b5 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14  1027  	return 0;
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1028  }
c738866e47ef2e4 fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1029  

:::::: The code at line 986 was first introduced by commit
:::::: 8317017fbfa0824392813fddcf136bc764c16d66 bcachefs: Fix infinite loop in backpointers fsck on upgrade

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
