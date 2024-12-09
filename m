Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CAC156225;
	Mon,  9 Dec 2024 04:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717471; cv=none; b=EGKZX3R7Rh1y2QOuXFobb1miqDCmoS8AkW9zxoe7KE2ztziKZnYNnRKL8KZYvpmlxQVh0yFQLN/oc624DVHo48KlcpJFUSCR04i5hcZTF6+OwZapqH/0rM4sIDZYr0lZkRaDWJn7GqcS4WicVn0n/qxh70iC94/munRy8oqs+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717471; c=relaxed/simple;
	bh=m8zpm5TzL8Z1oZYL9cuUFv/SV9l1iK2APJjOjBwDllE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FWB4yJJmeL5YF+LZlxhkkKBNYVQwkSfaKoZcjnFyRI5BDvJJ7yhjylbyAijS8KFK977hYIXBw8CJGYn2ZsepHCXg2k1IGdhzF0HRfLz4cB2bAveHW/piD/IXorQfd9MkrUK6sHiEMPyiXaaaGKpUDIhxYJYQKqBvsikH1/tyJYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8F3lzzC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8F3lzzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717469; x=1765253469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m8zpm5TzL8Z1oZYL9cuUFv/SV9l1iK2APJjOjBwDllE=;
  b=Y8F3lzzCNntni1yAClj4HnplHiTS4ifTm5w0V3pRSvUjntkmfCtuauHM
   22niCegPdXZJAjndL4tvvVj0vHDq0/ykQPmV96lv6ubpFp9G8oASWaCoz
   ysiSlkUMatOcPZ5VQStJz4VEV7XgQYRL7bt/EAZ1GLltc5Qa5sc2rJpws
   iFXYBjy3FBFJ83LMm6VgUYG9J9fUyi6NMh+kEQb0U/YU8yQ5JOBYXnQ0u
   +ElogUIBS3uTwQ2fcwQhF0CsWCYOlvsBGs3RoUSElxtl6fUg8Xe5s65ix
   s8SOKr7ayPX9ia+5fOvghtzO8Uenu48uufu1zoichQnQFrLsANc2FiAtx
   g==;
X-CSE-ConnectionGUID: cjXixxEUQMyGePSrsC4Leg==
X-CSE-MsgGUID: FEvJnWJQQGOlSpoRQf4i6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="21591000"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="21591000"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:11:09 -0800
X-CSE-ConnectionGUID: jZCxdXjPSGyisYOMV1hgdA==
X-CSE-MsgGUID: 7rUkNFX0TxWO9q/PqbBfQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125841212"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2024 20:11:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV6v-0003o0-1c;
	Mon, 09 Dec 2024 04:11:05 +0000
Date: Mon, 9 Dec 2024 12:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 76/76] mm/damon/paddr.c:493:3: warning: variable
 'applied' is uninitialized when used here
Message-ID: <202412071433.DgqslKRN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   25b6468a712e65fa59ad8724e87ed32fb3e1d0c3
commit: 25b6468a712e65fa59ad8724e87ed32fb3e1d0c3 [76/76] mm/damon: add a new DAMOS action for fine-grained filter-aware stat
config: i386-buildonly-randconfig-004-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071433.DgqslKRN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071433.DgqslKRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071433.DgqslKRN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/paddr.c:12:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/damon/paddr.c:17:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/damon/paddr.c:493:3: warning: variable 'applied' is uninitialized when used here [-Wuninitialized]
     493 |                 applied += folio_size(folio);
         |                 ^~~~~~~
   mm/damon/paddr.c:482:29: note: initialize the variable 'applied' to silence this warning
     482 |         unsigned long addr, applied;
         |                                    ^
         |                                     = 0
   4 warnings generated.


vim +/applied +493 mm/damon/paddr.c

   479	
   480	static unsigned long damon_pa_stat2(struct damon_region *r, struct damos *s)
   481	{
   482		unsigned long addr, applied;
   483		LIST_HEAD(folio_list);
   484	
   485		for (addr = r->ar.start; addr < r->ar.end; addr += PAGE_SIZE) {
   486			struct folio *folio = damon_get_folio(PHYS_PFN(addr));
   487	
   488			if (!folio)
   489				continue;
   490	
   491			if (damos_pa_filter_out(s, folio))
   492				goto put_folio;
 > 493			applied += folio_size(folio);
   494	put_folio:
   495			folio_put(folio);
   496		}
   497		return applied;
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
