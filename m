Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE61FF7C7;
	Wed, 18 Feb 2026 02:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771381352; cv=none; b=ncHsYEXakP9WiTaCXmA6UmPmHRtLZcoL4txWgkBbUbZ+UtxbaKzc4VuuPxk8UVmNft6Q1wEyyNxrnqLRNH4JKe8ZMsYhrXx3rCiDOVB3NR0A5nIZqk6KS1ArgWppHvnHzI7/XWOLLhmhAYQKVmW28sEtLB/Xs5uPC3+YK9JE+Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771381352; c=relaxed/simple;
	bh=gjekzyv017HkC8dltOomfJMrgz+qs6P8g8/ivFYMVNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUQ6hGUzWQjA+5EJCj2ZuPemqJoO/BuGBztOVklsapkvnRM4w9lg0E7x2VKRhy8AikLS8Dx+L7gjz5AU9R9zJza9dY5RfCIpjhzRf2y0F0PPT2f3VLfzCXypi8xtdrXLC7rylvUbBftrWwo4E1V2i8p0z4is4HaB5G1/hOamOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0dVzC1J; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0dVzC1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771381351; x=1802917351;
  h=date:from:to:cc:subject:message-id;
  bh=gjekzyv017HkC8dltOomfJMrgz+qs6P8g8/ivFYMVNA=;
  b=m0dVzC1JLUe6ThkJSmN/kKKl7lf9XhaGBkn9wvKRND8Q6il249VSth6X
   +KKllrxzA4BMjc6NpyacOF4kesI5R4NTxjqjhuYZGpOqGxTmqZkCvBxCM
   rPUJVbbHijCF19nva+CvOoHpOPlynFRpLB5tpzN3DSqgZk/2hMgNB/6v3
   VJ+0jamaC6bkidNjR+yXHkKp8ct282fyz4TqdnnZ4XSwEQJQBQDxgY/za
   5wmKMu5nJAzt43IYqWu8iSUTsnW7ink9rzxGIoDuBDUUkHlS5eA+8MdvS
   VV+yrToNNZGqt368o/+duBbS20uztemjiskq47b5y77DngCfDPKxSbvIE
   A==;
X-CSE-ConnectionGUID: BPfyffVsQ5OSENla7HUOhQ==
X-CSE-MsgGUID: pakQVzGQRlGOuXfcwPdzXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83083176"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83083176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 18:22:30 -0800
X-CSE-ConnectionGUID: WW/WivXmR/y7d4QCW80jwA==
X-CSE-MsgGUID: RGbOyng8QOOCbG5x//C96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="251752802"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2026 18:22:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsXCs-000000011wm-1a3N;
	Wed, 18 Feb 2026 02:22:26 +0000
Date: Wed, 18 Feb 2026 10:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jul Lang <jullanggit@proton.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1059 2/3]
 fs/bcachefs/sb/members.c:173:21: warning: variable 'first_bucket' is
 uninitialized when used within its own initialization
Message-ID: <202602181006.rLTgu86r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1059
head:   b099347f62903a9a0a75f788e823066f10596d0f
commit: b6aa2c934cb9d7bb0ada1345188237f32e24107d [2/3] bcachefs: validate_member(): extract variables
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260218/202602181006.rLTgu86r-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181006.rLTgu86r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181006.rLTgu86r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/sb/members.c:173:21: warning: variable 'first_bucket' is uninitialized when used within its own initialization [-Wuninitialized]
     173 |         u16 first_bucket = first_bucket;
         |             ~~~~~~~~~~~~   ^~~~~~~~~~~~
   1 warning generated.


vim +/first_bucket +173 fs/bcachefs/sb/members.c

   159	
   160	static int validate_member(struct printbuf *err,
   161				   struct bch_member m,
   162				   struct bch_sb *sb,
   163				   int i)
   164	{
   165		u64 nbuckets = le64_to_cpu(m.nbuckets);
   166	
   167		if (nbuckets > BCH_MEMBER_NBUCKETS_MAX) {
   168			prt_printf(err, "device %u: too many buckets (got %llu, max %u)",
   169				   i, nbuckets, BCH_MEMBER_NBUCKETS_MAX);
   170			return -BCH_ERR_invalid_sb_members;
   171		}
   172	
 > 173		u16 first_bucket = first_bucket;
   174	
   175		if (nbuckets - first_bucket < BCH_MIN_NR_NBUCKETS) {
   176			prt_printf(err, "device %u: not enough buckets (got %llu, min %u)",
   177				   i, le64_to_cpu(m.nbuckets), BCH_MIN_NR_NBUCKETS);
   178			return -BCH_ERR_invalid_sb_members;
   179		}
   180	
   181		u16 bucket_size = le16_to_cpu(m.bucket_size);
   182		u16 block_size = le16_to_cpu(sb->block_size);
   183	
   184		if (bucket_size < block_size) {
   185			prt_printf(err, "device %u: bucket size %u smaller than block size %u",
   186				   i, bucket_size, block_size);
   187			return -BCH_ERR_invalid_sb_members;
   188		}
   189	
   190		if (bucket_size < BCH_SB_BTREE_NODE_SIZE(sb)) {
   191			prt_printf(err, "device %u: bucket size %u smaller than btree node size %llu",
   192				   i, bucket_size, BCH_SB_BTREE_NODE_SIZE(sb));
   193			return -BCH_ERR_invalid_sb_members;
   194		}
   195	
   196		if (m.btree_bitmap_shift >= BCH_MI_BTREE_BITMAP_SHIFT_MAX) {
   197			prt_printf(err, "device %u: invalid btree_bitmap_shift %u", i, m.btree_bitmap_shift);
   198			return -BCH_ERR_invalid_sb_members;
   199		}
   200	
   201		if (BCH_MEMBER_FREESPACE_INITIALIZED(&m) &&
   202		    sb->features[0] & cpu_to_le64(BIT_ULL(BCH_FEATURE_no_alloc_info))) {
   203			prt_printf(err, "device %u: freespace initialized but fs has no alloc info", i);
   204			return -BCH_ERR_invalid_sb_members;
   205		}
   206	
   207		return 0;
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
