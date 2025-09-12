Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D920ADD6;
	Fri, 12 Sep 2025 04:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757651835; cv=none; b=RGJaK2tWwGkeHUb5RVekL/PzSwm7JWNJoIr+my3r3XZh/Emj1Di6/yojTj90eD4+D+3C49YilXOXTjfkvMf0KILAmS1P1TRwnNGXaM/KuoW0lq6HV+k4u7EPcm/FipuT78wyPGM1V18pwiNB62aYo0rgFFfZekzujKI4QS0xRqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757651835; c=relaxed/simple;
	bh=tIScyNtV5vqGvsfXQWsIrheh64xVT47qWOZ/k3Fb1Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o29x6K5wjhL3pN9ONrij7uYvjUjh+aDYF1sCz6AHTMunlZSPnBlAUZYoEFumyu0R0vYnaNAOqimKpVLfJk0jG85llb+/IDWfzDwXNXOG3Hv/R/wyc72MqxAxuMicO8lsWaXjHXWwT2K/87avnWL4vKiVequ6c+2yJPmpl8xLUC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzOqtu9Y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzOqtu9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757651833; x=1789187833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tIScyNtV5vqGvsfXQWsIrheh64xVT47qWOZ/k3Fb1Wo=;
  b=fzOqtu9YeNI/dIolmHocuSQES/eyto64UkJYAX4TzLZp6hf5kuDvrXKV
   i+12OiWubCHAQ1rftuAInC+kp9imS/1ibUDi0hSPGuR9RX0lbv3qA0Ut6
   +DJ7ALiET6ta6IKo/ZdfngWFi/I79O6eN4J4fJg5hb/t5NawICSixXhwm
   nwI2secvhrBBtTuGKkjUDH2CV3Oqrd4HBdmG9Q7Ef5UpRbAU61nb2YusO
   IrKtj5MbPHdts2imo3P0D3UAQ1yzIdmNIeCH0NCkWSFwhwd3bk4F7q9r7
   RBUyBC6x5bj7Z7hjluu/uHDliZlINLMPRvYYy8RMqcd+bYELjY+jI0jRf
   Q==;
X-CSE-ConnectionGUID: IoG/nXf6SiOw/YrUQS4mig==
X-CSE-MsgGUID: OCIF5tEdQeyL0+d4xUAB7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="62625248"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="62625248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 21:37:10 -0700
X-CSE-ConnectionGUID: Q9sCZUCrRVOr7UEBKKsAxg==
X-CSE-MsgGUID: 7Tnv/Lj9TAyiuj3hf2nIwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="204642445"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Sep 2025 21:37:09 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwvWw-0000qC-0u;
	Fri, 12 Sep 2025 04:37:04 +0000
Date: Fri, 12 Sep 2025 12:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/slub-slab-validation 11/12] mm/slub.c:2825:4: error: call
 to undeclared function 'slab_err'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202509121225.u1EPShJO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slub-slab-validation
head:   01cb8fd75b321601e835ec2e501a2ca32378cec5
commit: 4da56ac925d6c6314912bf7651137988dcb34a7b [11/12] slab: validate slab before using it in alloc_single_from_partial()
config: riscv-randconfig-001-20250912 (https://download.01.org/0day-ci/archive/20250912/202509121225.u1EPShJO-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509121225.u1EPShJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509121225.u1EPShJO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:2825:4: error: call to undeclared function 'slab_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           slab_err(s, slab, "Not a valid slab page");
                           ^
   1 error generated.


vim +/slab_err +2825 mm/slub.c

  2809	
  2810	/*
  2811	 * Called only for kmem_cache_debug() caches instead of remove_partial(), with a
  2812	 * slab from the n->partial list. Remove only a single object from the slab, do
  2813	 * the alloc_debug_processing() checks and leave the slab on the list, or move
  2814	 * it to full list if it was the last free object.
  2815	 */
  2816	static void *alloc_single_from_partial(struct kmem_cache *s,
  2817			struct kmem_cache_node *n, struct slab *slab, int orig_size)
  2818	{
  2819		void *object;
  2820	
  2821		lockdep_assert_held(&n->list_lock);
  2822	
  2823		if (s->flags & SLAB_CONSISTENCY_CHECKS) {
  2824			if (!validate_slab_ptr(slab)) {
> 2825				slab_err(s, slab, "Not a valid slab page");
  2826				return NULL;
  2827			}
  2828		}
  2829	
  2830		object = slab->freelist;
  2831		slab->freelist = get_freepointer(s, object);
  2832		slab->inuse++;
  2833	
  2834		if (!alloc_debug_processing(s, slab, object, orig_size))
  2835			return NULL;
  2836	
  2837		if (slab->inuse == slab->objects) {
  2838			remove_partial(n, slab);
  2839			add_full(s, n, slab);
  2840		}
  2841	
  2842		return object;
  2843	}
  2844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
