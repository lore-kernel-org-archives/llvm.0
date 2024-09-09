Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1323C3C;
	Mon,  9 Sep 2024 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725910732; cv=none; b=EwX+GYb8xSldIGrISaKFDb9pZq4kBBAmGk2pzuT04Fs/6SeiPQFtZBnL2sb1qNJQFJubDTNbdSOGgzdQBgTrcz5lzEqONPiCSdUjJZN4FctkeGWmwq2jExRJ44im6vCWFyjhaaecRM+jdnwvronO/hoROVscSper1SmZBW0XmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725910732; c=relaxed/simple;
	bh=+2zLvAo8Z6qPlXkln840S8eIhGkCs2BCaqJ3/ItKBFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BFk3sPBRGI2MXwKkuU1QcorqaRkQO6OgmMtmLiwLrvEGtMbWUNRvNPzF+4ueHj8djKB41H5effeIpZDV2rPClT7MI2W42mmthHlrN9RkZy4NCbqcIRzHMsFudXa+tdokecMlM5avzQCGmFpfL0iYgMw77Fuqruab4zJ2fcPOGos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REQ8CrOA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REQ8CrOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725910730; x=1757446730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2zLvAo8Z6qPlXkln840S8eIhGkCs2BCaqJ3/ItKBFU=;
  b=REQ8CrOAlV06ZOUCmAuNLddy3sQWJm0RfHB/KVu3C3L3Q3gvLoLQstQc
   DgPQ/sJKQlZWe5mIYQEnpJsVo4JrrqA8iwyuM6TNCemyj/X5TU7p9k3ii
   BVsFePy3Nm5n3QwyN3gitCTtK0HUq6nrQavoJjA0c8FmpWsjNBMvlA2gx
   n7FyI850PvbfWSy6DNwvL+JI6+a3QYctk/MoRINWu0hSSRWCoISz/DO4b
   M67q94dvpTuvop6zAbiPuvAVNWBbDr3Xh+LO4awDfZHv7PS6uosSZvBSh
   w70sbKnGxzaRCGSFHGuk94TejqUjYEIIZqEDtPDbAX58v9OjECUhHFnVx
   w==;
X-CSE-ConnectionGUID: 1RQAfLPSSrWdGOpZpCY4UQ==
X-CSE-MsgGUID: KeXl0ZyrQQqtxb/g/TqbvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28513248"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="28513248"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 12:38:50 -0700
X-CSE-ConnectionGUID: Rrxjq2KrQ0eK96+a89s88A==
X-CSE-MsgGUID: F5h94r9LRSSgcVXLr4FIiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="97584003"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2024 12:38:49 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snkDm-000F9Q-2O;
	Mon, 09 Sep 2024 19:38:46 +0000
Date: Tue, 10 Sep 2024 03:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 233/258]
 include/linux/bio.h:85:34: warning: missing field 'bv_len' initializer
Message-ID: <202409100321.lhgllXlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 14e062203f6e4a3ffedf97fe91ad1cfca460e43a [233/258] block: Rework bio_for_each_segment_all()
config: arm64-randconfig-004-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100321.lhgllXlA-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100321.lhgllXlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100321.lhgllXlA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwtracing/coresight/coresight-cpu-debug.c:8:
   In file included from include/linux/amba/bus.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:209:
>> include/linux/bio.h:85:34: warning: missing field 'bv_len' initializer [-Wmissing-field-initializers]
                   return (struct bio_vec) { NULL };
                                                  ^
   1 warning generated.


vim +/bv_len +85 include/linux/bio.h

    80	
    81	static inline struct bio_vec bio_iter_all_peek(const struct bio *bio,
    82						       struct bvec_iter_all *iter)
    83	{
    84		if (WARN_ON(iter->idx >= bio->bi_vcnt))
  > 85			return (struct bio_vec) { NULL };
    86	
    87		return bvec_iter_all_peek(bio->bi_io_vec, iter);
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
