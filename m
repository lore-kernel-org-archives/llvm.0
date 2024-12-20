Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77882594B5;
	Fri, 20 Dec 2024 04:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734668795; cv=none; b=atCTl66xHzACK5ps7g7vLaY90hTloZZIfObRRoGMSwSX9saf86ZCBr4BRLXqAa9yBMLHBbhMQZJgURYBE9OxO7yYdkeeZkzHwHrL4Mr4azA80daEuH6FQX6EWydX3GErqehOAAlkkdJ0hTf7l8NZ7SE4yDsAs1wweydN2OqbFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734668795; c=relaxed/simple;
	bh=PhOKWy9XAAvbEpMaFISe4jUJ1PO+ykFw1VHcxWZKZvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7C2q59BYjbLabMig932xC7hVdTD/2T5UrF8Zhcli9AakwtG4qM0LkeN9X52BCBngs6/yBYLPIOJSrUxIQ4kH4a+h+e6sh1wFQ3PIyFLZ8hK6kriVZ9BCwfli4k/f3PxylSz8F0Lt+vybE9vUQHUFtG9ws7UHZWqMHf2MmK7aXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJ3OpBrv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJ3OpBrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734668794; x=1766204794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PhOKWy9XAAvbEpMaFISe4jUJ1PO+ykFw1VHcxWZKZvU=;
  b=AJ3OpBrvQMBuSWaceTm0lQQNjFFisfXChnWcnibkD3XfO2IWvGR6FO5v
   6DLOrQT+Zc9KRcOGm+Uztu9KC7qyZPfQEKuNLCrWCRsCrd6mmT6Jta6kb
   l2WjrQ0e2cVg4WDRGBqxn2TyrS+Y3cA4R7anPK6sIAKC9a8WqdxYsS1C6
   TrACxRR+HPNWkyAZGS/FYyZs9FmD2paMx2SZS9EpVsZ6fYK0FpjCZEbGX
   q2qfJ2BWkw8HKxx157bmtDISawlCNpZmMtWvPpotYD78ZQ8WyQb3FhBGb
   X3nJqKiKQPQ2d5j0+8sv7vRAYtjO7GlFwPhvv3ZdourYjyAi5jcn3Ygrq
   Q==;
X-CSE-ConnectionGUID: lQ/V5MGrSSm+GS58H3AhiQ==
X-CSE-MsgGUID: J0eJNT33TDC+b9okr/xi4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35428405"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35428405"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 20:26:33 -0800
X-CSE-ConnectionGUID: b7Ufziq0QSuGE6TMN2/vsA==
X-CSE-MsgGUID: bppr7dJiSguqN5v8jZla8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="129230199"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Dec 2024 20:26:32 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOUar-0000lj-2O;
	Fri, 20 Dec 2024 04:26:29 +0000
Date: Fri, 20 Dec 2024 12:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:buffered-uncached.10 13/18]
 fs/iomap/buffered-io.c:606:20: error: use of undeclared identifier
 'IOMAP_DONTCACHE'
Message-ID: <202412201218.KQsWMlvy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git buffered-uncached.10
head:   10ef57808208218b909eb26c9de3f3aec7b63d05
commit: 94425319b56d6ebc9d5d6eca449532d41275fbfb [13/18] iomap: make buffered writes work with RWF_DONTCACHE
config: hexagon-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201218.KQsWMlvy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201218.KQsWMlvy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201218.KQsWMlvy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/iomap/buffered-io.c:9:
   In file included from include/linux/iomap.h:7:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/iomap/buffered-io.c:606:20: error: use of undeclared identifier 'IOMAP_DONTCACHE'
     606 |         if (iter->flags & IOMAP_DONTCACHE)
         |                           ^
   fs/iomap/buffered-io.c:1040:17: error: use of undeclared identifier 'IOMAP_DONTCACHE'
    1040 |                 iter.flags |= IOMAP_DONTCACHE;
         |                               ^
   1 warning and 2 errors generated.


vim +/IOMAP_DONTCACHE +606 fs/iomap/buffered-io.c

   590	
   591	/**
   592	 * iomap_get_folio - get a folio reference for writing
   593	 * @iter: iteration structure
   594	 * @pos: start offset of write
   595	 * @len: Suggested size of folio to create.
   596	 *
   597	 * Returns a locked reference to the folio at @pos, or an error pointer if the
   598	 * folio could not be obtained.
   599	 */
   600	struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos, size_t len)
   601	{
   602		fgf_t fgp = FGP_WRITEBEGIN | FGP_NOFS;
   603	
   604		if (iter->flags & IOMAP_NOWAIT)
   605			fgp |= FGP_NOWAIT;
 > 606		if (iter->flags & IOMAP_DONTCACHE)
   607			fgp |= FGP_DONTCACHE;
   608		fgp |= fgf_set_order(len);
   609	
   610		return __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
   611				fgp, mapping_gfp_mask(iter->inode->i_mapping));
   612	}
   613	EXPORT_SYMBOL_GPL(iomap_get_folio);
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
