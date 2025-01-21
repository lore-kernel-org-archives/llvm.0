Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5B1B4237;
	Tue, 21 Jan 2025 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737470020; cv=none; b=K3valTJR+G7MqoEoxAxk34YK8vxnvWrT3Ygzme80VAn4Vx2+05ai1pi1tcNtRHx8Pi/yC2jNHYz/WcMuF0L0ftPNXMtd8V1ewlbS/3ozYqyFzNrvmElF2yyy5y+MvfKrSnE63+ecNis5t/L54sWbnnZgNg4qrzOE+QhCz5WAfEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737470020; c=relaxed/simple;
	bh=PCs8c/xVul7zXlog0wVzwNEI1mrGxfbepPRJZl/KFmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g08pbz8uVs+fTtAIIo0MjGxZXNjn3Edt8uh+IaBgqHXKaK194iG5jcM6ZJGmlM7syaQ3CZHPjJwUTFmZNjOu/XF+44YopTxMO9FHhJPugeFj3XC/IjFKnEN8eJrtQq9TBcSIhWYDvBWjCoegSVzOnAxMcmzWHQv9jewj6HmLzqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgVg5AH5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgVg5AH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737470019; x=1769006019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PCs8c/xVul7zXlog0wVzwNEI1mrGxfbepPRJZl/KFmU=;
  b=SgVg5AH5dRfUp5dZnQQmVv1ZooxO0QaUdNlm9f6hUm+PWzHBthZbVw17
   ufoeDT9Nc8O59o+EqxBIoKcjgZN7TsqokIgP+izeupD5LExE1fiMqL0od
   Rc3jEOWnMgUHhKWamgEsTqEUBMHKyZeLeAC122e8AeD+dhhpxcrUKdgBU
   u69GEuyg9Rn4hzN9tsqMHlmfysqaD+SuVH4GYPPw6vCLEulBKuAh6w+OL
   aIoIviTNc9z0ExoGc/JzMFK5naKrrO9vQEE+yDnp4aJTJQdgrKUZzQ75V
   ju+sb8BRuookef9l5EcoDVXotrirVMuoAhlzVwliqT9xWGxQh5XO/XU5/
   Q==;
X-CSE-ConnectionGUID: /dzvkYLBTT+fh+FIW2v3Cg==
X-CSE-MsgGUID: 24Qc8eTKSlWqz4qPYEV+Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55434314"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="55434314"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 06:33:38 -0800
X-CSE-ConnectionGUID: 9BgW86MJQzO7lePDjZuiPQ==
X-CSE-MsgGUID: VHS+zA1cRgqEPR4EIH7YRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="111828652"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2025 06:33:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taFJu-000Y8Z-1H;
	Tue, 21 Jan 2025 14:33:34 +0000
Date: Tue, 21 Jan 2025 22:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crc-x86 5/11] fs/bcachefs/str_hash.h:84:29: error:
 incompatible pointer types passing 'const __le64 *' (aka 'const unsigned
 long long *') to parameter of type 'const u8 *' (aka 'const unsigned char
 *')
Message-ID: <202501212223.iaD7YIOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-x86
head:   f31bd31f442cdda8a269eca5bf673a3066d40233
commit: c69f70b203923feb6910ff7850fb445acbd0e50a [5/11] lib/crc64: add support for arch-optimized implementations
config: x86_64-buildonly-randconfig-004-20250121 (https://download.01.org/0day-ci/archive/20250121/202501212223.iaD7YIOo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501212223.iaD7YIOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501212223.iaD7YIOo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/fs-common.c:6:
   In file included from fs/bcachefs/dirent.h:5:
>> fs/bcachefs/str_hash.h:84:29: error: incompatible pointer types passing 'const __le64 *' (aka 'const unsigned long long *') to parameter of type 'const u8 *' (aka 'const unsigned char *') [-Werror,-Wincompatible-pointer-types]
      84 |                 ctx->crc64 = crc64_be(~0, &info->siphash_key.k0,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/crc64.h:22:54: note: passing argument to parameter 'p' here
      22 | static inline u64 __pure crc64_be(u64 crc, const u8 *p, size_t len)
         |                                                      ^
   1 error generated.
--
   In file included from fs/bcachefs/recovery.c:12:
   In file included from fs/bcachefs/dirent.h:5:
>> fs/bcachefs/str_hash.h:84:29: error: incompatible pointer types passing 'const __le64 *' (aka 'const unsigned long long *') to parameter of type 'const u8 *' (aka 'const unsigned char *') [-Werror,-Wincompatible-pointer-types]
      84 |                 ctx->crc64 = crc64_be(~0, &info->siphash_key.k0,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/crc64.h:22:54: note: passing argument to parameter 'p' here
      22 | static inline u64 __pure crc64_be(u64 crc, const u8 *p, size_t len)
         |                                                      ^
   fs/bcachefs/recovery.c:411:39: warning: bitwise operation between different enumeration types ('enum bch_trans_commit_flags' and 'enum bch_watermark') [-Wenum-enum-conversion]
     411 |                                  ? BCH_TRANS_COMMIT_no_journal_res|BCH_WATERMARK_reclaim
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:188:23: note: expanded from macro 'commit_do'
     188 |                                         (_journal_seq), (_flags)))
         |                                                          ^~~~~~
   fs/bcachefs/btree_iter.h:710:11: note: expanded from macro 'lockrestart_do'
     710 |         _ret2 = (_do);                                                  \
         |                  ^~~
   1 warning and 1 error generated.


vim +84 fs/bcachefs/str_hash.h

1c6fdbd8f2465d Kent Overstreet 2017-03-16  74  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  75  static inline void bch2_str_hash_init(struct bch_str_hash_ctx *ctx,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  76  				     const struct bch_hash_info *info)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  77  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  78  	switch (info->type) {
6404dcc9c246c1 Kent Overstreet 2021-11-11  79  	case BCH_STR_HASH_crc32c:
d125615a4e2219 Dan Robertson   2021-05-14  80  		ctx->crc32c = crc32c(~0, &info->siphash_key.k0,
d125615a4e2219 Dan Robertson   2021-05-14  81  				     sizeof(info->siphash_key.k0));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  82  		break;
6404dcc9c246c1 Kent Overstreet 2021-11-11  83  	case BCH_STR_HASH_crc64:
d125615a4e2219 Dan Robertson   2021-05-14 @84  		ctx->crc64 = crc64_be(~0, &info->siphash_key.k0,
d125615a4e2219 Dan Robertson   2021-05-14  85  				      sizeof(info->siphash_key.k0));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  86  		break;
6404dcc9c246c1 Kent Overstreet 2021-11-11  87  	case BCH_STR_HASH_siphash_old:
6404dcc9c246c1 Kent Overstreet 2021-11-11  88  	case BCH_STR_HASH_siphash:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  89  		SipHash24_Init(&ctx->siphash, &info->siphash_key);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  90  		break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  91  	default:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  92  		BUG();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  93  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  94  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  95  

:::::: The code at line 84 was first introduced by commit
:::::: d125615a4e22194dff9cecd12ec5a608f8c0f920 bcachefs: properly initialize used values

:::::: TO: Dan Robertson <dan@dlrobertson.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
