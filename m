Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C73A380;
	Thu, 25 Jul 2024 00:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721866726; cv=none; b=p4KmSfGkgKvve6t79Rm08TRYSsg0Gz5HMadMUW7xFHokewk/7oH/PpgAaVzWFiG0puurz2o1VHaaE8UlxAuFBnIvExvoP3vO7A0Xi9/b0rSlmLdq4WuvShFrA58oKc5rESobhKI5QKgUAh5NfG2m89NIFj+K8dXww+iPGxxz9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721866726; c=relaxed/simple;
	bh=n4g7TmvfgJTgBzefSyHPDlsVZQBS0qkfvFKvxt0YzKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeXnc/rql+0eVgTBAGB6bP3qdkkQ+SvOoNYJ1Y/xljp+9dsNUHDiST0JPmaa+23sLwzTHb5LOWyMb54Nf10lHrPibNmC9uPdscqYvBCrrZjlUtI4rYjT+F4NMRiYe6fN2AU95mwPb5xeFb9iwatxgxv4W7nio4PRThwQr9hVqTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/SYwJBK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/SYwJBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721866725; x=1753402725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n4g7TmvfgJTgBzefSyHPDlsVZQBS0qkfvFKvxt0YzKk=;
  b=B/SYwJBKi57fTUuOyGL/82b/5MDL5mwHhVyUYpYW8yx7dC/1vk9VnYZ3
   C0bQaer6Nd32ktX9bu5aBaQyzwSsvWLk+F0tT7ERBuWmqSwU+/T9ZOu1L
   63CWqU+rOe5kUiLGbs27KVP91VIkgMt4pi0l2Wyfay/9JKh4WOVleUxBz
   I4OYhelXwh1uo4d0QzniJsqXy3iTjvJeioGoSyndtlgGA4Yveonkt1WfH
   rVEPPgkYqSrU0nllr7Dchkkoc4jJ3WEFk1FiRMuqP7LQUE3HsKYvnMqgB
   c7TSRMNex4tv/Ox9TZVQWY8moO+rqVIq78aqIGYUqfd7I+OS2OEMn5eg9
   w==;
X-CSE-ConnectionGUID: phsLW/oJQeGtRhBzsU5Wqg==
X-CSE-MsgGUID: Dv3DR0TdRYK87qHpmN5bHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30969912"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="30969912"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 17:18:44 -0700
X-CSE-ConnectionGUID: 6DnktWa1R2ag5cfaA+m8mQ==
X-CSE-MsgGUID: add6sTFcSjGsTveEa8jMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="52780469"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jul 2024 17:18:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWmBs-000naS-1V;
	Thu, 25 Jul 2024 00:18:40 +0000
Date: Thu, 25 Jul 2024 08:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jann Horn <jannh@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] kasan: catch invalid free before SLUB
 reinitializes the object
Message-ID: <202407250851.Ec0uq4Hw-lkp@intel.com>
References: <20240724-kasan-tsbrcu-v2-1-45f898064468@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724-kasan-tsbrcu-v2-1-45f898064468@google.com>

Hi Jann,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0c3836482481200ead7b416ca80c68a29cfdaabd]

url:    https://github.com/intel-lab-lkp/linux/commits/Jann-Horn/kasan-catch-invalid-free-before-SLUB-reinitializes-the-object/20240725-005307
base:   0c3836482481200ead7b416ca80c68a29cfdaabd
patch link:    https://lore.kernel.org/r/20240724-kasan-tsbrcu-v2-1-45f898064468%40google.com
patch subject: [PATCH v2 1/2] kasan: catch invalid free before SLUB reinitializes the object
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240725/202407250851.Ec0uq4Hw-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407250851.Ec0uq4Hw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250851.Ec0uq4Hw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:2177:6: error: call to undeclared function 'kasan_slab_pre_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2177 |         if (kasan_slab_pre_free(s, x))
         |             ^
   mm/slub.c:2177:6: note: did you mean 'kasan_slab_free'?
   include/linux/kasan.h:384:20: note: 'kasan_slab_free' declared here
     384 | static inline bool kasan_slab_free(struct kmem_cache *s, void *object, bool init)
         |                    ^
   1 error generated.


vim +/kasan_slab_pre_free +2177 mm/slub.c

  2146	
  2147	/*
  2148	 * Hooks for other subsystems that check memory allocations. In a typical
  2149	 * production configuration these hooks all should produce no code at all.
  2150	 *
  2151	 * Returns true if freeing of the object can proceed, false if its reuse
  2152	 * was delayed by KASAN quarantine, or it was returned to KFENCE.
  2153	 */
  2154	static __always_inline
  2155	bool slab_free_hook(struct kmem_cache *s, void *x, bool init)
  2156	{
  2157		kmemleak_free_recursive(x, s->flags);
  2158		kmsan_slab_free(s, x);
  2159	
  2160		debug_check_no_locks_freed(x, s->object_size);
  2161	
  2162		if (!(s->flags & SLAB_DEBUG_OBJECTS))
  2163			debug_check_no_obj_freed(x, s->object_size);
  2164	
  2165		/* Use KCSAN to help debug racy use-after-free. */
  2166		if (!(s->flags & SLAB_TYPESAFE_BY_RCU))
  2167			__kcsan_check_access(x, s->object_size,
  2168					     KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT);
  2169	
  2170		if (kfence_free(x))
  2171			return false;
  2172	
  2173		/*
  2174		 * Give KASAN a chance to notice an invalid free operation before we
  2175		 * modify the object.
  2176		 */
> 2177		if (kasan_slab_pre_free(s, x))
  2178			return false;
  2179	
  2180		/*
  2181		 * As memory initialization might be integrated into KASAN,
  2182		 * kasan_slab_free and initialization memset's must be
  2183		 * kept together to avoid discrepancies in behavior.
  2184		 *
  2185		 * The initialization memset's clear the object and the metadata,
  2186		 * but don't touch the SLAB redzone.
  2187		 *
  2188		 * The object's freepointer is also avoided if stored outside the
  2189		 * object.
  2190		 */
  2191		if (unlikely(init)) {
  2192			int rsize;
  2193			unsigned int inuse;
  2194	
  2195			inuse = get_info_end(s);
  2196			if (!kasan_has_integrated_init())
  2197				memset(kasan_reset_tag(x), 0, s->object_size);
  2198			rsize = (s->flags & SLAB_RED_ZONE) ? s->red_left_pad : 0;
  2199			memset((char *)kasan_reset_tag(x) + inuse, 0,
  2200			       s->size - inuse - rsize);
  2201		}
  2202		/* KASAN might put x into memory quarantine, delaying its reuse. */
  2203		return !kasan_slab_free(s, x, init);
  2204	}
  2205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
