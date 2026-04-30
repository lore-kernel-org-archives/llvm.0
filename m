Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1513A453D;
	Thu, 30 Apr 2026 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550259; cv=none; b=b/FjTgn4u7Z+LcVGmFpH2Bm8wzapoEGYhdND4DFZAXK5V2qXOnc6vpEquHwFIWZFwJlgtjp7uiZ219jaDG7FCmia7Xibll7dxSf6VzZnZYK1g+UtFv6ppWtuF9hCidYeXFWv/ailtgqu3wUNK+OwrYUPyTfTcAtRTsAKqE4AHC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550259; c=relaxed/simple;
	bh=XJA46/wwW+Kyq+UP1OnWiiBK7rfaDzFdRkLf0bTJAHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fJyeh45LrwdcGobPQgfyO8jvNySaZFTzzc0E5BHaOdOTQscYEFX8UDmZMZDmX0IkNoLV3Rn3Hosum3D90takV0qhgFLOfKPfEEwRcKYqUmW9DoS4RVjnLYofvxbN41Rh2EtMNbGGNkU7W3k+P1+jW9m6rwWNgR09A1/UUPgBJVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQdJl11S; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQdJl11S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777550258; x=1809086258;
  h=date:from:to:cc:subject:message-id;
  bh=XJA46/wwW+Kyq+UP1OnWiiBK7rfaDzFdRkLf0bTJAHc=;
  b=kQdJl11S5Y+LdYUFNY3OYdfgUV5zID+qx5NYHIGhZ/Vw7O3pkvbkwK5S
   A+GB4ZXD4XTWvGl5wnEYbN2EPQkH3Rd3UWaLG/dK5D/W9pv49Oe0BycUx
   XUDzfEaY1zX9MEfl4vWCntBoPBCtIV7vnYHs0c/m7q//QW8cEorE84nth
   ofL6fqTAPqLsrYHvjI6GnVFnwgD2WaWOaKCXkxH08pknBWBsXHG3+Fb6N
   mVs8xUzC6B+AEeCkQV8cSzt9m3sbjjwKwChXM0d9L7PlD/HGP9byZ5/o7
   D7LQHrYJFmeOOFHyXIzKXr7wbeIobA3f6EmdeyMVDtCAqflY+Da2O/1Nd
   A==;
X-CSE-ConnectionGUID: JKEXchy0RoquAby2WtMBsQ==
X-CSE-MsgGUID: JjBgzNAnQ7abGXc4scOQ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78364087"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78364087"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 04:57:37 -0700
X-CSE-ConnectionGUID: +wXQmVZQQJG9gEK4BfU0zw==
X-CSE-MsgGUID: GYDvawMNQjy3Nbxcm3U/Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="264931127"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 30 Apr 2026 04:57:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIQ1N-000000004oL-1ZEZ;
	Thu, 30 Apr 2026 11:57:33 +0000
Date: Thu, 30 Apr 2026 13:57:22 +0200
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/percpu.c:3284:32: error: use of undeclared identifier
 'percpu_pgd'
Message-ID: <202604301300.KJsFOyAg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/arm64-mm-enable-percpu-kernel-page-table/20260430-122920
head:   7e0c701a28a9dc36bcaf857ae2a956b4f3131bf2
commit: 55d66d9a4b96d8a09cf37d61a3280d71f57438a5 arm64: mm: map local percpu first chunk
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260430/202604301300.KJsFOyAg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301300.KJsFOyAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301300.KJsFOyAg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/percpu.c:3284:32: error: use of undeclared identifier 'percpu_pgd'
    3284 |                 map_local_percpu_first_chunk(percpu_pgd[unit], (unsigned long)pcpu_vm.addr,
         |                                              ^
   1 error generated.


vim +/percpu_pgd +3284 mm/percpu.c

  3260	
  3261		for (unit = 0; unit < num_possible_cpus(); unit++) {
  3262			unsigned long unit_addr =
  3263				(unsigned long)vm.addr + unit * ai->unit_size;
  3264	
  3265			for (i = 0; i < unit_pages; i++)
  3266				pcpu_populate_pte(unit_addr + (i << PAGE_SHIFT));
  3267	
  3268			/* pte already populated, the following shouldn't fail */
  3269			rc = __pcpu_map_pages(unit_addr, &pages[unit * unit_pages],
  3270					      unit_pages);
  3271			if (rc < 0)
  3272				panic("failed to map percpu area, err=%d\n", rc);
  3273	
  3274			flush_cache_vmap_early(unit_addr, unit_addr + ai->unit_size);
  3275	
  3276			/* copy static data */
  3277			memcpy((void *)unit_addr, __per_cpu_start, ai->static_size);
  3278	
  3279			/*
  3280			 * Map percpu data to PERCPU map.
  3281			 *
  3282			 * PCPU_FC_EMBED can't support it.
  3283			 */
> 3284			map_local_percpu_first_chunk(percpu_pgd[unit], (unsigned long)pcpu_vm.addr,
  3285					&pages[unit * unit_pages], unit_pages);
  3286		}
  3287	
  3288		/* we're ready, commit */
  3289		pr_info("%d %s pages/cpu s%zu r%zu d%zu\n",
  3290			unit_pages, psize_str, ai->static_size,
  3291			ai->reserved_size, ai->dyn_size);
  3292	
  3293		pcpu_setup_first_chunk(ai, vm.addr);
  3294		goto out_free_ar;
  3295	
  3296	enomem:
  3297		while (--j >= 0)
  3298			pcpu_fc_free(page_address(pages[j]), PAGE_SIZE);
  3299		rc = -ENOMEM;
  3300	out_free_ar:
  3301		memblock_free(pages, pages_size);
  3302		pcpu_free_alloc_info(ai);
  3303		return rc;
  3304	}
  3305	#endif /* BUILD_PAGE_FIRST_CHUNK */
  3306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
