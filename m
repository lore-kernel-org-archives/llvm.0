Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB971922D4;
	Sat, 14 Dec 2024 18:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734202466; cv=none; b=RNlE+F1vHz+MCJEa7Zhr3X5RKllkfyV/4zYGzKsvMiozDNupqUoa6ZIwlVpVIyUkuw/x1ecUFoHsRI8s9gdtow4uQX7sTxtmLClU+yaRW6iruW3vYzFe9pSrpe7GA/xzXGRXH8j+tgF+MddE22tTreKy4wFqWqlXLidMJ1nscG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734202466; c=relaxed/simple;
	bh=amGcBvq1/nSnbIRSQ+vRtNj+Owx0UYDSRmBQ1w0L3Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dod7ziuIh7wPpbwvd/A3lrrHwBkbTwQJJqetudYL8LWlyv1wYByQIEeVF0EnXctlujWgSCfALx7+lyMUbCGLgIXv8qBYDhRGs3bKvHG8Kc87gQaS8dBRgNSwO/JFbVii6g15Ol7RO6jf/Ip1t26DIMJ7DVByZyZms9V5W70NazU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9rUkxjP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9rUkxjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734202464; x=1765738464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=amGcBvq1/nSnbIRSQ+vRtNj+Owx0UYDSRmBQ1w0L3Ls=;
  b=E9rUkxjPa1jen1vgDx4xn2RQEe80Xv6apJ9iDH55TF07M/KdH8jVZtTK
   /Uw8vn/0XrSLnrUQeofRONeTkHbozYLY83PLRtEuxct3GAdc4qyZM7oBo
   /XqbGje/A/Q1rfVdyDJ/VQbU5VXv/0vcWYObBJNQWl/nCfmmiwd7IEYqs
   nSIHVc2t8DVgbCUcAccJ15G3D0CeOgbe3CtPv4KegJbg+dbPUQrelqJ2E
   TjJXjAhxU8GST8oFNIc9KYeWTMnsgcnE3sjnlfHPEX/+2O7r6773yo7t8
   JqK+5+HG80iyhkuvRdPlYeNFqp/3EYufKJOXLf+4DqAevevGl6iQPOCkQ
   Q==;
X-CSE-ConnectionGUID: PJWtNqxpRnCMQLRdekeSug==
X-CSE-MsgGUID: tatCzLWrRGKWdwSfQ0kNRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34783963"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34783963"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 10:54:23 -0800
X-CSE-ConnectionGUID: 7ewKQKGWR4iB5rkFJzjcGA==
X-CSE-MsgGUID: Ii8NRAu3TI2H92W6U3MAuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="97236296"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Dec 2024 10:54:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMXHQ-000D9K-0h;
	Sat, 14 Dec 2024 18:54:20 +0000
Date: Sun, 15 Dec 2024 02:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 06/14] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
Message-ID: <202412150235.pdU2pDm8-lkp@intel.com>
References: <20241213164811.2006197-7-tabba@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213164811.2006197-7-tabba@google.com>

Hi Fuad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/mm-Consolidate-freeing-of-typed-folios-on-final-folio_put/20241214-005109
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241213164811.2006197-7-tabba%40google.com
patch subject: [RFC PATCH v4 06/14] KVM: guest_memfd: Handle final folio_put() of guestmem pages
config: i386-buildonly-randconfig-006-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150235.pdU2pDm8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150235.pdU2pDm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150235.pdU2pDm8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:17:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/x86/events/intel/core.c:17:
>> include/linux/kvm_host.h:2620:5: warning: no previous prototype for function 'kvm_slot_gmem_register_callback' [-Wmissing-prototypes]
    2620 | int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn)
         |     ^
   include/linux/kvm_host.h:2620:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2620 | int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn)
         | ^
         | static 
   2 warnings generated.


vim +/kvm_slot_gmem_register_callback +2620 include/linux/kvm_host.h

  2566	
  2567	#ifdef CONFIG_KVM_GMEM_MAPPABLE
  2568	bool kvm_gmem_is_mappable(struct kvm *kvm, gfn_t gfn, gfn_t end);
  2569	int kvm_gmem_set_mappable(struct kvm *kvm, gfn_t start, gfn_t end);
  2570	int kvm_gmem_clear_mappable(struct kvm *kvm, gfn_t start, gfn_t end);
  2571	int kvm_slot_gmem_set_mappable(struct kvm_memory_slot *slot, gfn_t start,
  2572				       gfn_t end);
  2573	int kvm_slot_gmem_clear_mappable(struct kvm_memory_slot *slot, gfn_t start,
  2574					 gfn_t end);
  2575	bool kvm_slot_gmem_is_mappable(struct kvm_memory_slot *slot, gfn_t gfn);
  2576	bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot, gfn_t gfn);
  2577	int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn);
  2578	void kvm_gmem_handle_folio_put(struct folio *folio);
  2579	#else
  2580	static inline bool kvm_gmem_is_mappable(struct kvm *kvm, gfn_t gfn, gfn_t end)
  2581	{
  2582		WARN_ON_ONCE(1);
  2583		return false;
  2584	}
  2585	static inline int kvm_gmem_set_mappable(struct kvm *kvm, gfn_t start, gfn_t end)
  2586	{
  2587		WARN_ON_ONCE(1);
  2588		return -EINVAL;
  2589	}
  2590	static inline int kvm_gmem_clear_mappable(struct kvm *kvm, gfn_t start,
  2591						  gfn_t end)
  2592	{
  2593		WARN_ON_ONCE(1);
  2594		return -EINVAL;
  2595	}
  2596	static inline int kvm_slot_gmem_set_mappable(struct kvm_memory_slot *slot,
  2597						     gfn_t start, gfn_t end)
  2598	{
  2599		WARN_ON_ONCE(1);
  2600		return -EINVAL;
  2601	}
  2602	static inline int kvm_slot_gmem_clear_mappable(struct kvm_memory_slot *slot,
  2603						       gfn_t start, gfn_t end)
  2604	{
  2605		WARN_ON_ONCE(1);
  2606		return -EINVAL;
  2607	}
  2608	static inline bool kvm_slot_gmem_is_mappable(struct kvm_memory_slot *slot,
  2609						     gfn_t gfn)
  2610	{
  2611		WARN_ON_ONCE(1);
  2612		return false;
  2613	}
  2614	static inline bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot,
  2615							   gfn_t gfn)
  2616	{
  2617		WARN_ON_ONCE(1);
  2618		return false;
  2619	}
> 2620	int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn)
  2621	{
  2622		WARN_ON_ONCE(1);
  2623		return -EINVAL;
  2624	}
  2625	static inline void kvm_gmem_handle_folio_put(struct folio *folio)
  2626	{
  2627		WARN_ON_ONCE(1);
  2628	}
  2629	#endif /* CONFIG_KVM_GMEM_MAPPABLE */
  2630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
