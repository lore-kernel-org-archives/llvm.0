Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4642040AB;
	Thu, 13 Feb 2025 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739415625; cv=none; b=YlGOWTivNTuhep/mxZbRmKo/h9fT5E5L+Ejq1CxNu5wiut/xp1Z98Zb8nXMbOx/3KbFTOXaAaUgXS3dqhAY30VUG23kVOs1+CA191WkjedKDSsUJQVefg2Lp/2J8/+kOZzdm92k/Xff+o7lrFfpbBIPaoHRCfIAq6Po2mdNEEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739415625; c=relaxed/simple;
	bh=skGfQlyRETK+FLwyEmqInSXe2c+JRAniBC2eWix9dH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ms3Tl/nZ6TSQk/XCWc3bvJe9G2u1tDl6pAzwD0vZ2B64HYbRploPMl1H8HluVJeG6nGTeZ9nBD6x7eR+GCKiafuTbwNwzc3DsSpAIh0CHkkZIMCkPhRyI4rIQgGI5Uy9dLFh3tfLWmLR1oGL7gwlQCw2UsklW8r/bNPeEQD0ih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdvVLdXZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdvVLdXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739415623; x=1770951623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=skGfQlyRETK+FLwyEmqInSXe2c+JRAniBC2eWix9dH0=;
  b=PdvVLdXZargQCInlHQ5UcMHtZN+3vDPeSi7CXejySkGmzX8lJQ1k/jON
   D6WzkWZT9NN7pukzgMI0zC0yZ/qX4c0hxE3IhX6YH+Dp8XY5zlqsh04lo
   oZaD2PCuYRnc06ii1poqbQV4Eg4TZONAlj5CQVAL99kexoDPkO5mjHJ2Y
   NHBdQDMXzBI+PKgxE6KIK0UDFe7VR+cyi00KnYQH6igT403B4KQFDdu0A
   s3qNtpDrwwB5QNWiQlWCq75jEiUhshw+RdyArMeym+r3sq2REZwpuHhla
   /0nSSJfPMX+sEfSlrAVdHAhvansJW8ZCQPEMZlo82YbjTfvcpfjPSgBy0
   w==;
X-CSE-ConnectionGUID: zkDDU2CcSZ29FL9s5XwAhQ==
X-CSE-MsgGUID: S4rWpM1ISp+3FSgcItlS9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51496750"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="51496750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 19:00:19 -0800
X-CSE-ConnectionGUID: jxLb8CQvSru7/xg4BWiIhQ==
X-CSE-MsgGUID: DTheJyLWSmGUA+ewWSRWuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136256335"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Feb 2025 19:00:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiPSa-0016Qv-24;
	Thu, 13 Feb 2025 03:00:16 +0000
Date: Thu, 13 Feb 2025 10:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 106/106] fs/bcachefs/ec.c:1837:11:
 warning: variable 'blocks_nonempty' set but not used
Message-ID: <202502131041.A8x1cgzA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   f79dc3219ea36504f761271c5fdefd239bdbb89c
commit: f79dc3219ea36504f761271c5fdefd239bdbb89c [106/106] fixup! bcachefs: get_existing_stripe() uses new stripe lru
config: i386-buildonly-randconfig-006-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131041.A8x1cgzA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131041.A8x1cgzA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131041.A8x1cgzA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/ec.c:1837:11: warning: variable 'blocks_nonempty' set but not used [-Wunused-but-set-variable]
    1837 |         unsigned blocks_nonempty = 0;
         |                  ^
   fs/bcachefs/ec.c:382:20: warning: unused function 'stripe_to_mem' [-Wunused-function]
     382 | static inline void stripe_to_mem(struct stripe *m, const struct bch_stripe *s)
         |                    ^~~~~~~~~~~~~
   2 warnings generated.


vim +/blocks_nonempty +1837 fs/bcachefs/ec.c

f25d8215f49941 Kent Overstreet 2022-01-09  1814  
79ca90cb378374 Kent Overstreet 2025-02-10  1815  static int __get_existing_stripe(struct btree_trans *trans,
79ca90cb378374 Kent Overstreet 2025-02-10  1816  				 struct ec_stripe_head *head,
79ca90cb378374 Kent Overstreet 2025-02-10  1817  				 struct ec_stripe_buf *stripe,
79ca90cb378374 Kent Overstreet 2025-02-10  1818  				 u64 idx)
0ba95acc4499c8 Kent Overstreet 2020-06-30  1819  {
79ca90cb378374 Kent Overstreet 2025-02-10  1820  	struct bch_fs *c = trans->c;
0ba95acc4499c8 Kent Overstreet 2020-06-30  1821  
79ca90cb378374 Kent Overstreet 2025-02-10  1822  	struct btree_iter iter;
79ca90cb378374 Kent Overstreet 2025-02-10  1823  	struct bkey_s_c k = bch2_bkey_get_iter(trans, &iter,
79ca90cb378374 Kent Overstreet 2025-02-10  1824  					  BTREE_ID_stripes, POS(0, idx), 0);
79ca90cb378374 Kent Overstreet 2025-02-10  1825  	int ret = bkey_err(k);
79ca90cb378374 Kent Overstreet 2025-02-10  1826  	if (ret)
79ca90cb378374 Kent Overstreet 2025-02-10  1827  		goto err;
0ba95acc4499c8 Kent Overstreet 2020-06-30  1828  
79ca90cb378374 Kent Overstreet 2025-02-10  1829  	/* We expect write buffer races here */
79ca90cb378374 Kent Overstreet 2025-02-10  1830  	if (k.k->type != KEY_TYPE_stripe)
79ca90cb378374 Kent Overstreet 2025-02-10  1831  		goto out;
0ba95acc4499c8 Kent Overstreet 2020-06-30  1832  
79ca90cb378374 Kent Overstreet 2025-02-10  1833  	struct bkey_s_c_stripe s = bkey_s_c_to_stripe(k);
79ca90cb378374 Kent Overstreet 2025-02-10  1834  	if (stripe_lru_pos(s.v) == 1)
79ca90cb378374 Kent Overstreet 2025-02-10  1835  		goto out;
4b1e669995a6c1 Kent Overstreet 2023-02-18  1836  
79ca90cb378374 Kent Overstreet 2025-02-10 @1837  	unsigned blocks_nonempty = 0;
79ca90cb378374 Kent Overstreet 2025-02-10  1838  	for (unsigned i = 0; i < s.v->nr_blocks; i++)
79ca90cb378374 Kent Overstreet 2025-02-10  1839  		blocks_nonempty	+= !!stripe_blockcount_get(s.v, i);
0ba95acc4499c8 Kent Overstreet 2020-06-30  1840  
79ca90cb378374 Kent Overstreet 2025-02-10  1841  	if (s.v->disk_label	== head->disk_label &&
79ca90cb378374 Kent Overstreet 2025-02-10  1842  	    s.v->algorithm	== head->algo &&
79ca90cb378374 Kent Overstreet 2025-02-10  1843  	    s.v->nr_redundant	== head->redundancy &&
79ca90cb378374 Kent Overstreet 2025-02-10  1844  	    s.v->sectors	== head->blocksize &&
79ca90cb378374 Kent Overstreet 2025-02-10  1845  	    bch2_try_open_stripe(c, head->s, idx)) {
79ca90cb378374 Kent Overstreet 2025-02-10  1846  		bkey_reassemble(&stripe->key, k);
79ca90cb378374 Kent Overstreet 2025-02-10  1847  		ret = 1;
79ca90cb378374 Kent Overstreet 2025-02-10  1848  	}
79ca90cb378374 Kent Overstreet 2025-02-10  1849  out:
79ca90cb378374 Kent Overstreet 2025-02-10  1850  	bch2_set_btree_iter_dontneed(&iter);
79ca90cb378374 Kent Overstreet 2025-02-10  1851  err:
79ca90cb378374 Kent Overstreet 2025-02-10  1852  	bch2_trans_iter_exit(trans, &iter);
79ca90cb378374 Kent Overstreet 2025-02-10  1853  	return ret;
0ba95acc4499c8 Kent Overstreet 2020-06-30  1854  }
79ca90cb378374 Kent Overstreet 2025-02-10  1855  

:::::: The code at line 1837 was first introduced by commit
:::::: 79ca90cb378374f1cb989e9dbd669849bcc5db5f bcachefs: get_existing_stripe() uses new stripe lru

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
