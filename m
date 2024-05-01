Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0425644B;
	Wed,  1 May 2024 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714561692; cv=none; b=WwJ1fhm0wpD777yajWQ3jYYU5wT0i08SFP23zbvEAC3+wHR25WCJHHSNQu39et+yujmkycEm0BhvQa9Vy3XGPW3y2Z4tMZRmsRTz0wlIUP8IAo60Sg8pHmze9lTZSdhIdgCFR5ah8VFumhuzleXtpQF0L2KZkI1X6SOHgeH7VMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714561692; c=relaxed/simple;
	bh=QW/OX1Hg0ryEgQO9RBLkIoidccmiC1c4FfiHVArLhRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qXSqpZGfGo8qAJYFURZ76IIRsBaJiPqCBReI5YWDzXohaPGXb9Jyf6Q6bdbfE0khk0dUyvX0svIfYlsl5ZEG8CwV75a/wqkPCP5klsZXpxRs/W9VX4BP2RMRFb89SoH4LtB59FmVSk38GQ+PVq/Xnwlm2t2IbMrTzuEJZcGx0Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGKgTmTc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGKgTmTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714561688; x=1746097688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QW/OX1Hg0ryEgQO9RBLkIoidccmiC1c4FfiHVArLhRY=;
  b=QGKgTmTcgofRB8UsuxpLLmrD166C56vYYa3klLh5cX8Ou/ZU05g2RdpQ
   ekKSO2bnvXCwbomCq7YsiIzXuJBhEHqV/xl6a81XdWYMEjFWkUKomxn5G
   CpZIKTh9+oqeIsDDIpnZxbe7N33gDKIztBSwnwccNQvGRtDSKs/NnOFvZ
   ZXAjURAcm0v9sTLuXzumnqZkHJITsMLr+I8JWRnvqkR2u3CoX8OC2xymG
   44WHZMTn8ys3sX68MiuuePuvI5yP25jFmeYSbDRihdqtJwnU15hmwD4gJ
   rbDp/d652kb3qla+MPbm4Tr3amW/zO3aYKUson5hrTvjR/htDxCtcF9Vw
   Q==;
X-CSE-ConnectionGUID: 3OPZwmWJSEmuun5DhPpSsw==
X-CSE-MsgGUID: uVfdKMNGTVSxP7Deg/3jRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10453089"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="10453089"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 04:08:07 -0700
X-CSE-ConnectionGUID: fLAilZWlQBWBTgGRgREPmg==
X-CSE-MsgGUID: GDjqsnKQQLO8pjt4FQFSLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="31471864"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2024 04:08:06 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s27oh-0009So-1M;
	Wed, 01 May 2024 11:08:03 +0000
Date: Wed, 1 May 2024 19:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Chengming Zhou <chengming.zhou@linux.dev>
Subject: [vbabka-slab:slab/for-next 1/3] mm/slub.c:2103:11: error: call to
 undeclared function 'get_info_end'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202405011954.GfS77PZb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git slab/for-next
head:   8acbdbf0106c179801f30bff547e9512889c624d
commit: 7f39e23ed8ddd6c49b7a2615037af50881b50206 [1/3] mm/slub: avoid zeroing outside-object freepointer for single free
config: x86_64-buildonly-randconfig-002-20240501 (https://download.01.org/0day-ci/archive/20240501/202405011954.GfS77PZb-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011954.GfS77PZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011954.GfS77PZb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:2103:11: error: call to undeclared function 'get_info_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2103 |                 inuse = get_info_end(s);
         |                         ^
   mm/slub.c:2580:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
    2580 |         unsigned int partial_slabs = 0;
         |                      ^
>> mm/slub.c:3731:7: error: call to undeclared function 'freeptr_outside_object'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3731 |             !freeptr_outside_object(s))
         |              ^
   1 warning and 2 errors generated.


vim +/get_info_end +2103 mm/slub.c

  2061	
  2062	/*
  2063	 * Hooks for other subsystems that check memory allocations. In a typical
  2064	 * production configuration these hooks all should produce no code at all.
  2065	 *
  2066	 * Returns true if freeing of the object can proceed, false if its reuse
  2067	 * was delayed by KASAN quarantine, or it was returned to KFENCE.
  2068	 */
  2069	static __always_inline
  2070	bool slab_free_hook(struct kmem_cache *s, void *x, bool init)
  2071	{
  2072		kmemleak_free_recursive(x, s->flags);
  2073		kmsan_slab_free(s, x);
  2074	
  2075		debug_check_no_locks_freed(x, s->object_size);
  2076	
  2077		if (!(s->flags & SLAB_DEBUG_OBJECTS))
  2078			debug_check_no_obj_freed(x, s->object_size);
  2079	
  2080		/* Use KCSAN to help debug racy use-after-free. */
  2081		if (!(s->flags & SLAB_TYPESAFE_BY_RCU))
  2082			__kcsan_check_access(x, s->object_size,
  2083					     KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT);
  2084	
  2085		if (kfence_free(x))
  2086			return false;
  2087	
  2088		/*
  2089		 * As memory initialization might be integrated into KASAN,
  2090		 * kasan_slab_free and initialization memset's must be
  2091		 * kept together to avoid discrepancies in behavior.
  2092		 *
  2093		 * The initialization memset's clear the object and the metadata,
  2094		 * but don't touch the SLAB redzone.
  2095		 *
  2096		 * The object's freepointer is also avoided if stored outside the
  2097		 * object.
  2098		 */
  2099		if (unlikely(init)) {
  2100			int rsize;
  2101			unsigned int inuse;
  2102	
> 2103			inuse = get_info_end(s);
  2104			if (!kasan_has_integrated_init())
  2105				memset(kasan_reset_tag(x), 0, s->object_size);
  2106			rsize = (s->flags & SLAB_RED_ZONE) ? s->red_left_pad : 0;
  2107			memset((char *)kasan_reset_tag(x) + inuse, 0,
  2108			       s->size - inuse - rsize);
  2109		}
  2110		/* KASAN might put x into memory quarantine, delaying its reuse. */
  2111		return !kasan_slab_free(s, x, init);
  2112	}
  2113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
