Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C24216E00;
	Mon,  9 Dec 2024 10:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741170; cv=none; b=UXHVuXMfZdgBmcdv4yjG8xj6xbH/1gPa3a4mOgaP5uOv5EcdNSBb2Qs9zm4Q/TiN9PXmO1HiOtjpJGNrE1yEw/8610BVUUCSJpS7P0VCmSb2WKdyhYqRzT7xZh9Ukx8aaozyXknaNhtta4AGvLhLz+l7R1rp0uEdgKQxj71vctY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741170; c=relaxed/simple;
	bh=VyC2AO2ptJifB2t9y0d5AOOCdBn1ufw2ssCA/Q9f7kI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hTmudWZ9gQ18WttQ2s7aHzIDgLOmsyOGUr1XN+yvzoNP0pMNJOnjrbFMzMHxuRTadeJ4s5P21TXwqspAlWJ42lsSFkCyksNfOViJDaTOACg4U1D1vXfysgRRvo/nQYJRCsqanHtltGetfWEKvtpaBdwLmrjGgOxd+boc4fKyUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A24zO1u2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A24zO1u2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733741168; x=1765277168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VyC2AO2ptJifB2t9y0d5AOOCdBn1ufw2ssCA/Q9f7kI=;
  b=A24zO1u23lu1vlJm+1N0/PQ7ENfSSBC/esMHiiF3KzZ2SDjOpgWhA4OG
   0swZ0VK0WqVsYNm5FMI6wS/i85nYs285ZQS1J481Vwn8B27ANWJpWWVOT
   6UAWzvBLm4cfvvwEa/KaN72lnOyojouPfppAJe9QLfn9jMHUIgOk3deAO
   E1gvp3RUREeCz/UhmBp5Wwwhh1CMnC2xs1dCRIVyscpYqK8iLViX18oHo
   hMjlNJOUpYWeUWLe5+FqyyOPugEJzYlloM5hDUGAld9NXEtRDM83MJgva
   BZA++BQClnrONzpoWno2p99es5jGJuwzkeIOOZhm8rzrbtTbB+8X6yw0g
   g==;
X-CSE-ConnectionGUID: Lh+nw+KoQE2OUAHqcsh15A==
X-CSE-MsgGUID: OeFEQYIjTlanMc1IG9qirg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34166708"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="34166708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 02:46:08 -0800
X-CSE-ConnectionGUID: jYibagg4RlmRb+b4qukIcg==
X-CSE-MsgGUID: rp031/jmR+yr0CWRKa+EXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="95236333"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2024 02:46:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKbHA-0004E5-00;
	Mon, 09 Dec 2024 10:46:04 +0000
Date: Mon, 9 Dec 2024 18:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 204/205] fs/bcachefs/str_hash.c:164:2:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202412091807.8PJParb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   48016afd37223fa670a84272ebc9fa0d3122e207
commit: 5ec57ef85d8cb570263a0b01befcd39377a82ade [204/205] bcachefs: bch2_str_hash_check_key() now checks inode hash info
config: arm-randconfig-002-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091807.8PJParb1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091807.8PJParb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091807.8PJParb1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/str_hash.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/bcachefs/str_hash.c:164:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     164 |         struct bch_inode_unpacked inode;
         |         ^
   2 warnings generated.


vim +164 fs/bcachefs/str_hash.c

   140	
   141	/*
   142	 * All versions of the same inode in different snapshots must have the same hash
   143	 * seed/type: verify that the hash info we're using matches the root
   144	 */
   145	static int check_inode_hash_info_matches_root(struct btree_trans *trans, u64 inum,
   146						      struct bch_hash_info *hash_info)
   147	{
   148		struct bch_fs *c = trans->c;
   149		struct btree_iter iter;
   150		struct bkey_s_c k;
   151		int ret = 0;
   152	
   153		for_each_btree_key_reverse_norestart(trans, iter, BTREE_ID_inodes, SPOS(0, inum, U32_MAX),
   154						     BTREE_ITER_all_snapshots, k, ret) {
   155			if (k.k->p.offset != inum)
   156				break;
   157			if (bkey_is_inode(k.k))
   158				goto found;
   159		}
   160		bch_err(c, "%s(): inum %llu not found", __func__, inum);
   161		ret = -BCH_ERR_fsck_repair_unimplemented;
   162		goto err;
   163	found:
 > 164		struct bch_inode_unpacked inode;
   165		ret = bch2_inode_unpack(k, &inode);
   166		if (ret)
   167			goto err;
   168	
   169		struct bch_hash_info hash2 = bch2_hash_info_init(c, &inode);
   170		if (memcmp(hash_info, &hash2, sizeof(hash2))) {
   171			ret = repair_inode_hash_info(trans, &inode);
   172			if (!ret) {
   173				bch_err(c, "inode hash info mismatch with root, but mismatch not found");
   174				ret = -BCH_ERR_fsck_repair_unimplemented;
   175			}
   176		}
   177	err:
   178		bch2_trans_iter_exit(trans, &iter);
   179		return ret;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
