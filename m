Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046616;
	b=t1zrnFiUN6eX9HzrMEtN8HVe5DPVw/9STmd2v+na6RHcCM5S9qFn6pySFOsDOyAiVnjJ
	 TPxUmzbnAr1JuS3/hnZn0L47Dr1FVoQ0I/pdYDOhEI9uHANpgH7sAsrPEWh+q2XnykAp0
	 JGCMiebYOKDsODvMHR/t7acA2WWFvJJpa4KukrgIOBzHYocbobH7Hy3WbIjrM+85S8zCU
	 0ZEvSAxJWVumM7+5cQYO/pR7hGS9FkBEY3Lf7I5D8kwzYOt44hkC5eJNa2wG3MlzneU8l
	 UOqYXgFHjsJpiE81+RTYqFL4HW1WE6ZSdsEb1RvkFw05t0syUjCKf7caNcZaKfKJKyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046616;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wSUrful0euhKs1g6tDniX2BrNZhZeb4YLmR6CIA+FuQ=;
	b=D7v78E6o6K2C4ZZ4P96yAVu05jTgmrtAgm7H90JX4IOUEexOXgyJSRL6CvpTaFDfpGIs
	 k5jkhld3sG8bpGXnwpLZetiLtiCQSq042JzQeOVUqfHynAXfvgYpCPJ1Aq4hRatcRFNFx
	 SraVATYoWAPaRZD5ixBoS0eU7u7LgbOeJxUhzxDLWR2Lr6uUAIojbd+PZoIHj2t8qs1mI
	 H4CRnwSdocCRqJNs1bqX5yv9Irou6tHz1yb+bK3cP8/IwfCtroyYcUvKVMTYFO+MhIr9f
	 c/QAIex8gntYsWfbUoMtS8sGwBrd8q5TuKMvf23j7jCV6qXBPnCXrehFK+rcv2ghZiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=heM8qmJH;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE5D606A338;
	Thu, 19 Nov 2026 00:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE5D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=heM8qmJH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795046615; x=1826582615;
  h=date:from:to:cc:subject:message-id;
  bh=DTIMPoh+6kJSNbUeBdEU/oQlpRuVEwJDYedrh/ZpawQ=;
  b=heM8qmJHc8lRq989jH0OFhgvwrR8OOT9+aiOVKavW4othI6v+AcHBKCt
   i5Yq+eD7Si932gdOSATyDCKNO8jW8DBH8Y6FjUg2rSxirLHlOiSy3f+Lm
   y7nk1mMzpgDjGIHrdw63mrPewPXOqnuXEe7bU7uF8T7ssbjwK1dZQQGpF
   mPoVL2a8HVSx/VLU/DscSvV+QJDSeGVRu6INYrye3yGEEQH2mE6P4a6fM
   cMXUPVQrCaDn5rnvuZfTAgCXxlKBxScnBatUez/NILa6JFPMHF6iH8+EW
   +piWPHaF372nanpPHUk3j6Id3ei01xlhteR/R6OFby0SFWTyX4M4zRB0G
   A==;
X-CSE-ConnectionGUID: zItK5WnIQx6ZfYplrmug/w==
X-CSE-MsgGUID: zy9HzX26SGyEZ3k0oWerGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3768890"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3768890"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 16:03:28 -0800
X-CSE-ConnectionGUID: wivSJCj9SNSEovwzX2vfQw==
X-CSE-MsgGUID: A8LFFXINSnGEq94oLt+MRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10527650"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2026 16:03:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTpcZ-000000003XJ-1gpl;
	Thu, 19 Nov 2026 00:03:23 +0000
Date: Thu, 19 Nov 2026 01:02:34 +0100
From: kernel test robot <lkp@intel.com>
To: Ding Feng <dingf3ng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Damien Le Moal <dlemoal@kernel.org>
Subject: [dlemoal-zonefs:for-7.4-fixes 2/2] fs/zonefs/file.c:406:38:
 warning: result of comparison of constant 9223372036854775807 with expression
 of type 'unsigned long' is always true
Message-ID: <20261119005454.1XSsI6Vv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs.git for-7.4-fixes
head:   8de358df7785d9c8b3e6640cef2418eecc3d4a94
commit: 8de358df7785d9c8b3e6640cef2418eecc3d4a94 [2/2] zonefs: ignore RLIMIT_FSIZE above LLONG_MAX in zonefs_write_check_limits()
config: hexagon-randconfig-2001-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119005454.1XSsI6Vv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119005454.1XSsI6Vv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119005454.1XSsI6Vv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/zonefs/file.c:406:38: warning: result of comparison of constant 9223372036854775807 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
     406 |         if (limit != RLIM_INFINITY && limit <= LLONG_MAX) {
         |                                       ~~~~~ ^  ~~~~~~~~~
   1 warning generated.


vim +406 fs/zonefs/file.c

   392	
   393	/*
   394	 * Do not exceed the LFS limits nor the file zone size. If pos is under the
   395	 * limit it becomes a short access. If it exceeds the limit, return -EFBIG.
   396	 */
   397	static loff_t zonefs_write_check_limits(struct file *file, loff_t pos,
   398						loff_t count)
   399	{
   400		struct inode *inode = file_inode(file);
   401		struct zonefs_zone *z = zonefs_inode_zone(inode);
   402		unsigned long limit = rlimit(RLIMIT_FSIZE);
   403		loff_t max_size = z->z_capacity;
   404	
   405		/* No file position reaches a limit above LLONG_MAX. */
 > 406		if (limit != RLIM_INFINITY && limit <= LLONG_MAX) {
   407			if (pos >= (loff_t)limit) {
   408				send_sig(SIGXFSZ, current, 0);
   409				return -EFBIG;
   410			}
   411			count = min(count, (loff_t)limit - pos);
   412		}
   413	
   414		if (!(file->f_flags & O_LARGEFILE))
   415			max_size = min_t(loff_t, MAX_NON_LFS, max_size);
   416	
   417		if (unlikely(pos >= max_size))
   418			return -EFBIG;
   419	
   420		return min(count, max_size - pos);
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
