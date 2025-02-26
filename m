Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E61898FB;
	Wed, 26 Feb 2025 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740556152; cv=none; b=F0tMa5bGx2oJ7NiGC0sQ/fyRzehZT2hkfGi0iw3WxiN8wSOXpwuAzeAFaJQPOWbo5ciuLqVRKX6FrwX8K7vTeKl/AMjBysa4Hn6UqcVDR8wONrUuysY1cc+GG+Z9ZMxaw830p1NZnA+po2oNSWQ6HSnK9fn5K91JyM1dSVrN/es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740556152; c=relaxed/simple;
	bh=5cQoD7Xj2iZryYy9aBsI41+A76x5ySkRxVxY7EVlfSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rxjtwl8mXmmHmNhfcZx9feg7658k2vOw8lxCoHg1gTjiISTMQI8Pqoq0jN9BcMKBaQiyFS9atGIywLyz6zymNEi8kkIuimsdrNTjrY1gk7WH9DP5O8XL/Kk4IJucC8ohzxz4FjwWiECfikYM216mFLNzbqUgc72mN7Ol8oPk4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nK4oVuip; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nK4oVuip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740556150; x=1772092150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5cQoD7Xj2iZryYy9aBsI41+A76x5ySkRxVxY7EVlfSg=;
  b=nK4oVuip5fceu+OnFwN5/JemBpr5MKtkTmarAcroJM7fTYZAiQbMcN9N
   26nTzWPO5Z/wkmE1wkQvTlEo9eA/cDISFJzuub4O2ydnzEY9eNkAq6/0Z
   uOlJ03NeWVi0bASpbDsV3uYKUGh8vQOnxzzup/JrbTyjeDt+HA5OBxN+W
   6rvTwOHKfnvhCLRjg25nyLjHdzYD6Ap0/CrUARsey9FD2eiXMQvTW4vza
   vX+qeOt1+ZGMDJRBC1mE+Mki27TtXW/7GFr03lMr+YDFYkj+Qicxk1bkC
   s26SK1Q5XmW9Tcojg98q9/XFy+rHYbibYKJYJogh2CL2j5RK+WtyuHJ3W
   g==;
X-CSE-ConnectionGUID: s+NdFlxCQ0euriHGSnbt4g==
X-CSE-MsgGUID: R6mq5x8tQZGWCwN/fYisTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41409417"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41409417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:49:10 -0800
X-CSE-ConnectionGUID: u+gjdte4TX6KTFW7j+dreQ==
X-CSE-MsgGUID: +w6L6/fDSk6zN8+RpOOcmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116418536"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Feb 2025 23:49:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnCAD-000BLz-31;
	Wed, 26 Feb 2025 07:49:05 +0000
Date: Wed, 26 Feb 2025 15:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 122/123]
 fs/bcachefs/extents_format.h:219:10: error: width of bit-field 'flags' (76
 bits) exceeds the width of its type (64 bits)
Message-ID: <202502261546.ZokeMDs6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   8de504fc059b751ae0cc0fd600f2d5e28ccb8dc5
commit: 82af8187566114f55114f1b878562de031e0b9b4 [122/123] bcachefs: bcachefs_metadata_version_extent_flags
config: s390-randconfig-002-20250226 (https://download.01.org/0day-ci/archive/20250226/202502261546.ZokeMDs6-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261546.ZokeMDs6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261546.ZokeMDs6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_locking.c:3:
   In file included from fs/bcachefs/bcachefs.h:208:
   In file included from fs/bcachefs/bcachefs_format.h:502:
>> fs/bcachefs/extents_format.h:219:10: error: width of bit-field 'flags' (76 bits) exceeds the width of its type (64 bits)
           __u64                   flags:76
                                   ^
>> fs/bcachefs/extents_format.h:219:18: error: expected ';' at end of declaration list
           __u64                   flags:76
                                           ^
                                           ;
   2 errors generated.
--
   In file included from fs/bcachefs/io_write.c:7:
   In file included from fs/bcachefs/bcachefs.h:208:
   In file included from fs/bcachefs/bcachefs_format.h:502:
>> fs/bcachefs/extents_format.h:219:10: error: width of bit-field 'flags' (76 bits) exceeds the width of its type (64 bits)
           __u64                   flags:76
                                   ^
>> fs/bcachefs/extents_format.h:219:18: error: expected ';' at end of declaration list
           __u64                   flags:76
                                           ^
                                           ;
>> fs/bcachefs/io_write.c:1180:2: error: statement requires expression of scalar type ('void' invalid)
           extent_for_each_ptr_decode(e, p, entry) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:396:2: note: expanded from macro 'extent_for_each_ptr_decode'
           __bkey_for_each_ptr_decode((_e).k, (_e).v->start,               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:350:2: note: expanded from macro '__bkey_for_each_ptr_decode'
           for ((_ptr).crc = bch2_extent_crc_unpack(_k, NULL),             \
           ^
   3 errors generated.
--
   In file included from fs/bcachefs/move.c:3:
   In file included from fs/bcachefs/bcachefs.h:208:
   In file included from fs/bcachefs/bcachefs_format.h:502:
>> fs/bcachefs/extents_format.h:219:10: error: width of bit-field 'flags' (76 bits) exceeds the width of its type (64 bits)
           __u64                   flags:76
                                   ^
>> fs/bcachefs/extents_format.h:219:18: error: expected ';' at end of declaration list
           __u64                   flags:76
                                           ^
                                           ;
   fs/bcachefs/move.c:715:11: warning: variable 'sectors_moved' set but not used [-Wunused-but-set-variable]
           unsigned sectors_moved = 0;
                    ^
   1 warning and 2 errors generated.
--
   In file included from fs/bcachefs/data_update.c:3:
   In file included from fs/bcachefs/bcachefs.h:208:
   In file included from fs/bcachefs/bcachefs_format.h:502:
>> fs/bcachefs/extents_format.h:219:10: error: width of bit-field 'flags' (76 bits) exceeds the width of its type (64 bits)
           __u64                   flags:76
                                   ^
>> fs/bcachefs/extents_format.h:219:18: error: expected ';' at end of declaration list
           __u64                   flags:76
                                           ^
                                           ;
>> fs/bcachefs/data_update.c:281:3: error: statement requires expression of scalar type ('void' invalid)
                   extent_for_each_ptr_decode(extent_i_to_s(new), p, entry)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:396:2: note: expanded from macro 'extent_for_each_ptr_decode'
           __bkey_for_each_ptr_decode((_e).k, (_e).v->start,               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:350:2: note: expanded from macro '__bkey_for_each_ptr_decode'
           for ((_ptr).crc = bch2_extent_crc_unpack(_k, NULL),             \
           ^
   fs/bcachefs/data_update.c:306:3: error: statement requires expression of scalar type ('void' invalid)
                   extent_for_each_ptr_decode(extent_i_to_s(new), p, entry)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:396:2: note: expanded from macro 'extent_for_each_ptr_decode'
           __bkey_for_each_ptr_decode((_e).k, (_e).v->start,               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:350:2: note: expanded from macro '__bkey_for_each_ptr_decode'
           for ((_ptr).crc = bch2_extent_crc_unpack(_k, NULL),             \
           ^
   4 errors generated.


vim +/flags +219 fs/bcachefs/extents_format.h

   213	
   214	struct bch_extent_flags {
   215	#if defined(__LITTLE_ENDIAN_BITFIELD)
   216		__u64			type:7,
   217					flags:57;
   218	#elif defined (__BIG_ENDIAN_BITFIELD)
 > 219		__u64			flags:76
   220					type:7;
   221	#endif
   222	};
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
