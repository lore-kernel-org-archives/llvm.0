Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE336233139;
	Mon,  9 Dec 2024 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759931; cv=none; b=o6QwNF+J+PndvOmWqU5cMO9rwMX55aTs9zh1PVCypkhI9K4BEYTYdjekWcO74yAC/14hFx6h2WJIG4a/tcv60FcA4XesXXUJK54gzFEX6HottdchPdWvSxL0Mh4q+JoSCkGaYmxVrYcBoGyAQ7CAfDsNdIn6MATQbEJI55GVcac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759931; c=relaxed/simple;
	bh=tRjyEATjYe+2D6uqY55D559UaOzGfKgVdiw0kzsC368=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RBiM4VHvTMgeVBxabGvl4oEsYctyVKOXIjEGoUtszXAHrfV4DEAttPGaV6cVWxrW83T9vFEEhru/yWzmYD5ZQlmH/RwOwDHC4yB/duw6/zhv8dEkrjtPVtPpu8kHrJe5v1g3lb8siDtuLYbDb198IBOmzHqA3HnBLWQMKmGBzfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eH3ZVnyW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eH3ZVnyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733759930; x=1765295930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRjyEATjYe+2D6uqY55D559UaOzGfKgVdiw0kzsC368=;
  b=eH3ZVnyW/yHa0R294U4bZnocf/1ZLba5PxTrFlhGLvpa3GhBo2Ljq8ht
   BnEARbNuNWdxOfjcKIwaVz7pwQlarKQi1Equ9pN2Vr14dyyIIz2fquj5t
   VUXjP40spP9vfdpWOrTIS7OpxJogiuU0ZgmDwA3bC/WhrxmaoTtoCD0qd
   IazRtzBtsfa0+TgISCyYqVZ1htNk1tChdjhJBtzzoa2zYaLfQhmu5OFDU
   9Yrc4zgMxcVsXQ60L0jVWzcHF7g9fVP7/YBZLdmPGMrxFQOcaf5Sywoqy
   PfY/zJxtwOqxxMx6Q76IcNN3oAa9AQ44iNfPeX92NMVmorMh0oRWD6m1A
   Q==;
X-CSE-ConnectionGUID: 6DQkFeGuR5KgM0SbJ9ubJg==
X-CSE-MsgGUID: i5z/CAnpQ7yEtbEjQR6VoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51598445"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="51598445"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 07:58:49 -0800
X-CSE-ConnectionGUID: Vp8ksGHUT+mvNihRA4oqAQ==
X-CSE-MsgGUID: gdGP4vglScS53gYEzcyZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="126010511"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 07:58:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKg9l-0004Yq-2z;
	Mon, 09 Dec 2024 15:58:45 +0000
Date: Mon, 9 Dec 2024 23:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 204/207]
 fs/bcachefs/str_hash.c:164:2: error: expected expression
Message-ID: <202412092339.QB7hffGC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   49f6359f9883c937742e95cef8eb3cb0e5aa2bb8
commit: 41df8115fe32fe3911ea5c1d7cb6d182abd689a7 [204/207] bcachefs: bch2_str_hash_check_key() now checks inode hash info
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241209/202412092339.QB7hffGC-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412092339.QB7hffGC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412092339.QB7hffGC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/str_hash.c:164:2: error: expected expression
           struct bch_inode_unpacked inode;
           ^
>> fs/bcachefs/str_hash.c:165:30: error: use of undeclared identifier 'inode'
           ret = bch2_inode_unpack(k, &inode);
                                       ^
   fs/bcachefs/str_hash.c:169:55: error: use of undeclared identifier 'inode'
           struct bch_hash_info hash2 = bch2_hash_info_init(c, &inode);
                                                                ^
   fs/bcachefs/str_hash.c:171:40: error: use of undeclared identifier 'inode'
                   ret = repair_inode_hash_info(trans, &inode);
                                                        ^
   4 errors generated.


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
 > 165		ret = bch2_inode_unpack(k, &inode);
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
