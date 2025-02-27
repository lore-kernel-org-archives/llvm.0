Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31E189F57;
	Thu, 27 Feb 2025 04:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740629385; cv=none; b=jdp+G9VC1GoBLWbwGdDsOz0qFPpG3Y7vKN+Hncasf20hWhL38wsynlFbbIHerenoLCZiRZv8jC9Q9ZV7+xKImvf8gWAYC+bcxzlYg+NQOBqYOZl/f/njkripEVZbBAcIYrSkxoXWtxY+yaG4YCjTOsoR+GvxBjx8u3JaxXGQ1K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740629385; c=relaxed/simple;
	bh=18P8pM1UXEaH7+Bj3hADkd+I+7nEBiD0/wNZBgoZWyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNhbp8UWo4tKIa2pfe6Y34/k+IS99DS4TYTM6DOs0wwezWrBP110byCTwS6jNtIz+DQWgzPRUxJvoMWiZ5N0QFQoj3YKJWrKw3+sSOSrw1mLRXMrZLRtsNT5YfFOcGvqvw+WguOW6VI4Raz5zd9GPeI3W55y//10CVnMBgHGe44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsYozpOl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsYozpOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740629383; x=1772165383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18P8pM1UXEaH7+Bj3hADkd+I+7nEBiD0/wNZBgoZWyY=;
  b=fsYozpOlW4lB875/MqeUGyoI5/jyOFkK48jPxvjRJ27tZKjps0znsgWn
   Vjkfkst4hTOacRQVBC+VycT9n1QU0DMzUyx4lVJucQZeQwM62v+iYKwHe
   HeCQiyVGyVclDY4TXfwbhS22lelgo1yt5wRliY/2eMi2BRbSD/i0R89xS
   ha1E7Ll1p2Ybyku+Qb4Dttt3thkmcygMd/5vVLQyE7RHOQCmkl5laZ56z
   mTkUTEH0r5DwCiWLA7+982JgN+6pWuyLdGFNol0THdKeOg1gwfjdQaU3F
   UxUj+18d17dVtQ0RhJBNv9IJcEob1Gkhyxv5U3IrkvDA7/z/PllcK8kYp
   Q==;
X-CSE-ConnectionGUID: CnYKmxLiQyWkjApxlGDphw==
X-CSE-MsgGUID: u3tibEMWTUCx7p3tR2vhlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52141711"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="52141711"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 20:09:40 -0800
X-CSE-ConnectionGUID: tNe30W6pRL6xLHmUS1ts/g==
X-CSE-MsgGUID: cy9WGmTvSQ26zSazyOfoAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="147728651"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Feb 2025 20:09:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnVDM-000CpM-1R;
	Thu, 27 Feb 2025 04:09:36 +0000
Date: Thu, 27 Feb 2025 12:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-dir-i-size 123/123]
 fs/bcachefs/fs-ioctl.c:72:40: error: use of undeclared identifier
 'bcachefs_metadata_version_casefolding'
Message-ID: <202502271256.bF2uoveR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-dir-i-size
head:   559ae9ec988de991142b6a067c313aeb530c2b11
commit: 559ae9ec988de991142b6a067c313aeb530c2b11 [123/123] bcachefs: bcachefs_metadata_version_directory_size_v2
config: s390-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271256.bF2uoveR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271256.bF2uoveR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271256.bF2uoveR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/fs-ioctl.c:4:
   In file included from fs/bcachefs/bcachefs.h:208:
   In file included from fs/bcachefs/bcachefs_format.h:502:
   fs/bcachefs/extents_format.h:219:10: error: width of bit-field 'flags' (76 bits) exceeds the width of its type (64 bits)
     219 |         __u64                   flags:76
         |                                 ^
   fs/bcachefs/extents_format.h:219:18: error: expected ';' at end of declaration list
     219 |         __u64                   flags:76
         |                                         ^
         |                                         ;
>> fs/bcachefs/fs-ioctl.c:72:40: error: use of undeclared identifier 'bcachefs_metadata_version_casefolding'
      72 |                 if (!bch2_request_incompat_feature(c,bcachefs_metadata_version_casefolding))
         |                                                      ^
   3 errors generated.


vim +/bcachefs_metadata_version_casefolding +72 fs/bcachefs/fs-ioctl.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  33  
791236b85c2dfd Joshua Ashton   2023-08-12  34  static int bch2_inode_flags_set(struct btree_trans *trans,
791236b85c2dfd Joshua Ashton   2023-08-12  35  				struct bch_inode_info *inode,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  36  				struct bch_inode_unpacked *bi,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  37  				void *p)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  38  {
2ea9004864b918 Kent Overstreet 2018-07-17  39  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  40  	/*
1c6fdbd8f2465d Kent Overstreet 2017-03-16  41  	 * We're relying on btree locking here for exclusion with other ioctl
1c6fdbd8f2465d Kent Overstreet 2017-03-16  42  	 * calls - use the flags in the btree (@bi), not inode->i_flags:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  43  	 */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  44  	struct flags_set *s = p;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  45  	unsigned newflags = s->flags;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  46  	unsigned oldflags = bi->bi_flags & s->mask;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  47  
103ffe9aaf8566 Kent Overstreet 2023-11-02  48  	if (((newflags ^ oldflags) & (BCH_INODE_append|BCH_INODE_immutable)) &&
1c6fdbd8f2465d Kent Overstreet 2017-03-16  49  	    !capable(CAP_LINUX_IMMUTABLE))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  50  		return -EPERM;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  51  
2ea9004864b918 Kent Overstreet 2018-07-17  52  	if (!S_ISREG(bi->bi_mode) &&
2ea9004864b918 Kent Overstreet 2018-07-17  53  	    !S_ISDIR(bi->bi_mode) &&
103ffe9aaf8566 Kent Overstreet 2023-11-02  54  	    (newflags & (BCH_INODE_nodump|BCH_INODE_noatime)) != newflags)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  55  		return -EINVAL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  56  
88969fa28d041c Joshua Ashton   2023-08-13  57  	if ((newflags ^ oldflags) & BCH_INODE_casefolded) {
88969fa28d041c Joshua Ashton   2023-08-13  58  #ifdef CONFIG_UNICODE
88969fa28d041c Joshua Ashton   2023-08-13  59  		int ret = 0;
88969fa28d041c Joshua Ashton   2023-08-13  60  		/* Not supported on individual files. */
88969fa28d041c Joshua Ashton   2023-08-13  61  		if (!S_ISDIR(bi->bi_mode))
88969fa28d041c Joshua Ashton   2023-08-13  62  			return -EOPNOTSUPP;
88969fa28d041c Joshua Ashton   2023-08-13  63  
88969fa28d041c Joshua Ashton   2023-08-13  64  		/*
88969fa28d041c Joshua Ashton   2023-08-13  65  		 * Make sure the dir is empty, as otherwise we'd need to
88969fa28d041c Joshua Ashton   2023-08-13  66  		 * rehash everything and update the dirent keys.
88969fa28d041c Joshua Ashton   2023-08-13  67  		 */
88969fa28d041c Joshua Ashton   2023-08-13  68  		ret = bch2_empty_dir_trans(trans, inode_inum(inode));
88969fa28d041c Joshua Ashton   2023-08-13  69  		if (ret < 0)
88969fa28d041c Joshua Ashton   2023-08-13  70  			return ret;
88969fa28d041c Joshua Ashton   2023-08-13  71  
88969fa28d041c Joshua Ashton   2023-08-13 @72  		if (!bch2_request_incompat_feature(c,bcachefs_metadata_version_casefolding))
88969fa28d041c Joshua Ashton   2023-08-13  73  			return -EOPNOTSUPP;
88969fa28d041c Joshua Ashton   2023-08-13  74  
88969fa28d041c Joshua Ashton   2023-08-13  75  		bch2_check_set_feature(c, BCH_FEATURE_casefolding);
88969fa28d041c Joshua Ashton   2023-08-13  76  #else
88969fa28d041c Joshua Ashton   2023-08-13  77  		printk(KERN_ERR "Cannot use casefolding on a kernel without CONFIG_UNICODE\n");
88969fa28d041c Joshua Ashton   2023-08-13  78  		return -EOPNOTSUPP;
88969fa28d041c Joshua Ashton   2023-08-13  79  #endif
88969fa28d041c Joshua Ashton   2023-08-13  80  	}
88969fa28d041c Joshua Ashton   2023-08-13  81  
65ff2d3a7abb9f Kent Overstreet 2022-10-12  82  	if (s->set_projinherit) {
65ff2d3a7abb9f Kent Overstreet 2022-10-12  83  		bi->bi_fields_set &= ~(1 << Inode_opt_project);
65ff2d3a7abb9f Kent Overstreet 2022-10-12  84  		bi->bi_fields_set |= ((int) s->projinherit << Inode_opt_project);
65ff2d3a7abb9f Kent Overstreet 2022-10-12  85  	}
65ff2d3a7abb9f Kent Overstreet 2022-10-12  86  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  87  	bi->bi_flags &= ~s->mask;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  88  	bi->bi_flags |= newflags;
2ea9004864b918 Kent Overstreet 2018-07-17  89  
2ea9004864b918 Kent Overstreet 2018-07-17  90  	bi->bi_ctime = timespec_to_bch2_time(c, current_time(&inode->v));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  91  	return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  92  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  93  

:::::: The code at line 72 was first introduced by commit
:::::: 88969fa28d041c0f6fadb3d3460603648b760db0 bcachefs: bcachefs_metadata_version_casefolding

:::::: TO: Joshua Ashton <joshua@froggi.es>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
