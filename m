Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5FB2EF67A;
	Wed, 19 Aug 2026 20:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787172976; cv=none; b=aucak7YuKSmfs/7XgpGlXWyUpfB8YIzVObTI9Fkpl/FOH8L5cG319e48qmUeDgJar3Rasfkz0hkctUiwr74FswynRXC5Xmh0zY3KTyc6HgM83DrYpJsyljRkFz/fC4bls0eN09k7+c5aQwBkb3AmZNla7SwiXusidJeEz/bDi38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787172976; c=relaxed/simple;
	bh=J8UpUb83/V7JrOeJsv6fZAjbKgeNB2BOk0vfeoZsiXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WwCGVZpDJ4HKex00pcoKu1zoAsVo1llAgfcyTk/pNjqprHn05ngRJ1LkVsvyIPJD9z1eaqKWXzfDhi2M4O9309QejzrLYjevbv1z1X5stLreA/vyp7XUC4+8epnikrYD+B04mr5A+Jt01gnM1ZmUIxoMRn2qBYpfoyNSGKgPKtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8Q+4Rub; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8Q+4Rub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787172974; x=1818708974;
  h=date:from:to:cc:subject:message-id;
  bh=J8UpUb83/V7JrOeJsv6fZAjbKgeNB2BOk0vfeoZsiXY=;
  b=C8Q+4RubT6tZcApB1a1wDwyA9VsqB8U73IBAGBCS9mkNZNngMfNzWnsY
   u8ivShVVYW9m333YHm3nFVhVxVlgRSslvCbaKjA5d/KyNuQaVcJcNkLtB
   qfh0MFs3YXj87ywjRHiqAELWZVWnpv0uXQh/puS2tMx4L0vD5w/sNpYzx
   FZ2o4jSoDk6MPdNmLwDCmcFkbjzt6gAIFrNGV/XvFE5+ym7vH7ICRjfxH
   jQSvLGO7lljeh+r/gCocecy+SG/bwLLWAbJfnX45Qi34i+NqII6el6O8p
   UU74AT6Mcqoiq4onkKkxzLll6/pcyj9S4H35CeqsjUYWHCfzWgIbfa0Th
   w==;
X-CSE-ConnectionGUID: U885qAtASOaD6vO5pSRq0Q==
X-CSE-MsgGUID: GFPU1PRcQTyND5lGdSWGeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87561485"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87561485"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 13:56:14 -0700
X-CSE-ConnectionGUID: yYWc0XdySVqEDoDWWrpWsg==
X-CSE-MsgGUID: GdsUfLzPQn+oF29wiTsMng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="261881897"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 19 Aug 2026 13:56:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwnKT-000000007Oj-1t4i;
	Wed, 19 Aug 2026 20:56:09 +0000
Date: Wed, 19 Aug 2026 22:55:44 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-combine-module-section-allocations 1/1]
 kernel/module/main.c:2826:21: warning: comparison between pointer and integer
 ('enum iter_type (*)(const struct iov_iter *)' and 'int')
Message-ID: <202608192253.Q3oNYow4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-combine-module-section-allocations
head:   eaa00409fb18efd5ba35159657893d158d91faa4
commit: eaa00409fb18efd5ba35159657893d158d91faa4 [1/1] module: Permit module section allocations to be combined
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260819/202608192253.Q3oNYow4-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608192253.Q3oNYow4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608192253.Q3oNYow4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/module/main.c:2826:7: error: use of undeclared identifier 'provider_type'; did you mean 'iov_iter_type'?
    2826 |                 if (provider_type == MOD_INVALID)
         |                     ^~~~~~~~~~~~~
         |                     iov_iter_type
   include/linux/uio.h:110:30: note: 'iov_iter_type' declared here
     110 | static inline enum iter_type iov_iter_type(const struct iov_iter *i)
         |                              ^
>> kernel/module/main.c:2826:21: warning: comparison between pointer and integer ('enum iter_type (*)(const struct iov_iter *)' and 'int') [-Wpointer-integer-compare]
    2826 |                 if (provider_type == MOD_INVALID)
         |                     ~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   1 warning and 1 error generated.


vim +2826 kernel/module/main.c

  2800	
  2801	static int move_module(struct module *mod, struct load_info *info)
  2802	{
  2803		int i, ret;
  2804		enum mod_mem_type t = MOD_MEM_NUM_TYPES;
  2805		bool codetag_section_found = false;
  2806	
  2807		for_each_mod_mem_type(type) {
  2808			if (!mod->mem[type].size) {
  2809				mod->mem[type].base = NULL;
  2810				continue;
  2811			}
  2812	
  2813			if (mod->mem[type].alloc_provider != MOD_INVALID)
  2814				continue;
  2815	
  2816			ret = module_memory_alloc(mod, type);
  2817			if (ret) {
  2818				t = type;
  2819				goto out_err;
  2820			}
  2821		}
  2822	
  2823		for_each_mod_mem_type(type) {
  2824			auto p_type = mod->mem[type].alloc_provider;
  2825	
> 2826			if (provider_type == MOD_INVALID)
  2827				continue;
  2828	
  2829			mod->mem[p_type].size -= mod->mem[type].size;
  2830			mod->mem[type].base = mod->mem[p_type].base +
  2831					      mod->mem[p_type].size;
  2832	
  2833			mod->mem[type].is_rox = mod->mem[p_type].is_rox;
  2834		}
  2835	
  2836		/* Transfer each section which specifies SHF_ALLOC */
  2837		pr_debug("Final section addresses for %s:\n", mod->name);
  2838		for (i = 0; i < info->hdr->e_shnum; i++) {
  2839			void *dest;
  2840			Elf_Shdr *shdr = &info->sechdrs[i];
  2841			const char *sname;
  2842	
  2843			if (!(shdr->sh_flags & SHF_ALLOC))
  2844				continue;
  2845	
  2846			sname = info->secstrings + shdr->sh_name;
  2847			/*
  2848			 * Load codetag sections separately as they might still be used
  2849			 * after module unload.
  2850			 */
  2851			if (codetag_needs_module_section(mod, sname, shdr->sh_size)) {
  2852				dest = codetag_alloc_module_section(mod, sname, shdr->sh_size,
  2853						arch_mod_section_prepend(mod, i), shdr->sh_addralign);
  2854				if (WARN_ON(!dest)) {
  2855					ret = -EINVAL;
  2856					goto out_err;
  2857				}
  2858				if (IS_ERR(dest)) {
  2859					ret = PTR_ERR(dest);
  2860					goto out_err;
  2861				}
  2862				codetag_section_found = true;
  2863			} else {
  2864				enum mod_mem_type type = shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHIFT;
  2865				unsigned long offset = shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK;
  2866	
  2867				dest = mod->mem[type].base + offset;
  2868			}
  2869	
  2870			if (shdr->sh_type != SHT_NOBITS) {
  2871				/*
  2872				 * Our ELF checker already validated this, but let's
  2873				 * be pedantic and make the goal clearer. We actually
  2874				 * end up copying over all modifications made to the
  2875				 * userspace copy of the entire struct module.
  2876				 */
  2877				if (i == info->index.mod &&
  2878				   (WARN_ON_ONCE(shdr->sh_size != sizeof(struct module)))) {
  2879					ret = -ENOEXEC;
  2880					goto out_err;
  2881				}
  2882				memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);
  2883			}
  2884			/*
  2885			 * Update the userspace copy's ELF section address to point to
  2886			 * our newly allocated memory as a pure convenience so that
  2887			 * users of info can keep taking advantage and using the newly
  2888			 * minted official memory area.
  2889			 */
  2890			shdr->sh_addr = (unsigned long)dest;
  2891			pr_debug("\t0x%lx 0x%.8lx %s\n", (long)shdr->sh_addr,
  2892				 (long)shdr->sh_size, info->secstrings + shdr->sh_name);
  2893		}
  2894	
  2895		return 0;
  2896	out_err:
  2897		module_memory_restore_rox(mod);
  2898		while (t--)
  2899			module_memory_free(mod, t);
  2900		if (codetag_section_found)
  2901			codetag_free_module_sections(mod);
  2902	
  2903		return ret;
  2904	}
  2905	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
