Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAF243C06B;
	Thu, 20 Aug 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787233018; cv=none; b=sltf8HVwN/ni2wnLT8aeVuaK3MredsCo4dkdDq156lvmvy2iRyhn8wKZQorNmTol5/CZH8OfhLpcVMPJWokbOny1ZGgkFdPbFHlz13rYK4brTuvxcn2y5SyFdBrUACRUsnwTXSIqZNu/cj/bSUxoVvHYB2+Db4Y9hCsxqsMgGNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787233018; c=relaxed/simple;
	bh=ed0d73b1uaKSVdsHTyKzJtudjzuqa46UFmOWWW1XXLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bjV+LWmfrH6EKpRGjD1ar2IZhfV5N0Bim6yBQdJjRt7ikak8Ah1QHhZXuGKNytYEtEZZdQZCY4TgBwZksZfOmZ8RQyCTE0vmy5YepezD0sXbUARFwfkZ3P41crstTVzSoG8sGSaluxwvgNeVHOeqed4wqizbTh+83GIerU1aEtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LA0XqWXG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LA0XqWXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787233016; x=1818769016;
  h=date:from:to:cc:subject:message-id;
  bh=ed0d73b1uaKSVdsHTyKzJtudjzuqa46UFmOWWW1XXLM=;
  b=LA0XqWXGiOrQX2wNTXrUNYzU44pPjUfXcbK84w8qLvKnzDnlqKLFCmPA
   CVlQEDZU/4kF5PJWhtQB+DsyFyexXKyXoa3NytdEDiMtNdSD2Dd60OxWj
   OWQTNHIA148Dh+wbmRFeodm6Q5ehT8gKD/9BVesjIenwl0jRxQK5fMXjq
   0t0sf9mEGRvvpKHmIELEDa2+UoqSgsPpeOuyKuh09S9+rhSo7iWvqK7RF
   89sFiB2JKGt+XiD7fSpGrQ+HPPzUEQer6bTrXBCVuLfkpGlClSKnR8SYJ
   ImNnT3ILV9NTpBWdTixSxSL0GkCQYyLYUkDhfNcpgILAoLWyPcJerm307
   w==;
X-CSE-ConnectionGUID: YhMbXEAhQ7yq7uCSjWr9Rg==
X-CSE-MsgGUID: Q1B6jrL6RuCQmgrbK7Xzgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91638391"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="91638391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 06:36:55 -0700
X-CSE-ConnectionGUID: qNkPgO+7TfOfIGeEm++EcA==
X-CSE-MsgGUID: 7GOX6/HiRYSFlaM9M2qhQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="271244709"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Aug 2026 06:36:53 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx2ws-00000000jCb-3ti8;
	Thu, 20 Aug 2026 13:36:50 +0000
Date: Thu, 20 Aug 2026 21:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-combine-module-section-allocations 1/1]
 kernel/module/main.c:2826:7: error: use of undeclared identifier
 'provider_type'; did you mean 'iov_iter_type'?
Message-ID: <202608202148.PDyCZrlm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-combine-module-section-allocations
head:   eaa00409fb18efd5ba35159657893d158d91faa4
commit: eaa00409fb18efd5ba35159657893d158d91faa4 [1/1] module: Permit module section allocations to be combined
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260820/202608202148.PDyCZrlm-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608202148.PDyCZrlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608202148.PDyCZrlm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/module/main.c:2826:7: error: use of undeclared identifier 'provider_type'; did you mean 'iov_iter_type'?
    2826 |                 if (provider_type == MOD_INVALID)
         |                     ^~~~~~~~~~~~~
         |                     iov_iter_type
   include/linux/uio.h:110:30: note: 'iov_iter_type' declared here
     110 | static inline enum iter_type iov_iter_type(const struct iov_iter *i)
         |                              ^
   kernel/module/main.c:2826:21: warning: comparison between pointer and integer ('enum iter_type (*)(const struct iov_iter *)' and 'int') [-Wpointer-integer-compare]
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
