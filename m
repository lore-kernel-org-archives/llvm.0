Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CA7308F2A;
	Mon, 15 Sep 2025 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757940813; cv=none; b=gz6F9TqMqRpAIE2EfzJpy0NF0cQo2U70VHjj4dXo43kABksx4BJO1JIteqOt4PO0bhA32m5hJeRkpkvD8aEDQ5kMS+Qs+yPq0tnP7V64EDYqNXiNjHKk/RDGapexPjX8znGaYXD2whPSM9c2DbsiDBG1UctQ8dZutWRUhg5rv/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757940813; c=relaxed/simple;
	bh=SdX8AjQVlaitGassOJiFuSnW7pCyzl/B3JGxEkxwdFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUEWeasZn/DAL272uOQ9nPqae1OHXkOR0EFhniLIJCaaVZtwW2QvYY7leRaNuAhNG86RedE4zs+I3Q9bRv4VbeeiFFuD2XxabBKgoBXH8lxUslc7RRWAlw4WrKCRhe7E2kNXN758Kd38ZSwVon0rMzcK/NH/bk7SFmBUu+Agre8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqZqXhmD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqZqXhmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757940812; x=1789476812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SdX8AjQVlaitGassOJiFuSnW7pCyzl/B3JGxEkxwdFg=;
  b=BqZqXhmDssk5Hqedc21SfQ8VXzbFm9Mis6bqMeOkpugVkkMTn90wGdo8
   1mE0tz2xKvm+I1RYfASU++bfufiqCzggOWSqsbDGTqnoYFuD2NvaJXRMY
   8jHS5fTf8J55OjRWSOa9NaaixG3p2fWfX2IGqLN1iNK5Bg4sFSK2/VHW5
   cTCxtgzc8I2Qwdl4Jun/+gQpE1o08oXUDSYlNoBFzV2NdAWlnC/Ft87oj
   dxSAQEv/hiDG7LEc7v03yE+ChFX9KuwBaowxbRPnAYR+B/udf5V4RJvgu
   6Ur478/7Yt2yiVUzONVvwXETyXO/X6pyz5WTrB88lSc+iZI/cl5ohKqHF
   A==;
X-CSE-ConnectionGUID: GCvuV0PUQ9aYaF4bVJSSAA==
X-CSE-MsgGUID: CeZw7iZWSLeMxY5HJP1XMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64004788"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64004788"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:53:31 -0700
X-CSE-ConnectionGUID: KoSN1MMZTIShKfBJ20X8QA==
X-CSE-MsgGUID: b3fkp+YZQsWUjbL3TfZuZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="174450894"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2025 05:53:30 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uy8hz-0000Eh-2C;
	Mon, 15 Sep 2025 12:53:27 +0000
Date: Mon, 15 Sep 2025 20:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/vmalloc/v4 3/4] kernel/kexec_handover.c:849:15: warning:
 variable 'num_elms' is uninitialized when used here
Message-ID: <202509152038.NqSCwQU9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/vmalloc/v4
head:   4198c802be71f6b2ce7716a8f89fb779b09575a2
commit: 01ea1bd238b11a157114d172bc88608ed08c3b17 [3/4] kho: add support for preserving vmalloc allocations
config: arm64-randconfig-001-20250915 (https://download.01.org/0day-ci/archive/20250915/202509152038.NqSCwQU9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509152038.NqSCwQU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509152038.NqSCwQU9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kexec_handover.c:849:15: warning: variable 'num_elms' is uninitialized when used here [-Wuninitialized]
     849 |                 chunk->phys[num_elms++] = phys;
         |                             ^~~~~~~~
   kernel/kexec_handover.c:824:37: note: initialize the variable 'num_elms' to silence this warning
     824 |         unsigned int order, flags, num_elms, nr_contig_pages;
         |                                            ^
         |                                             = 0
   1 warning generated.


vim +/num_elms +849 kernel/kexec_handover.c

   804	
   805	/**
   806	 * kho_preserve_vmalloc - preserve memory allocated with vmalloc() across kexec
   807	 * @ptr: pointer to the area in vmalloc address space
   808	 * @preservation: placeholder for preservation metadata
   809	 *
   810	 * Instructs KHO to preserve the area in vmalloc address space at @ptr. The
   811	 * physical pages mapped at @ptr will be preserved and on successful return
   812	 * @preservation will hold the physical address of a structure that describes
   813	 * the preservation.
   814	 *
   815	 * NOTE: The memory allocated with vmalloc_node() variants cannot be reliably
   816	 * restored on the same node
   817	 *
   818	 * Return: 0 on success, error code on failure
   819	 */
   820	int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
   821	{
   822		struct kho_vmalloc_chunk *chunk;
   823		struct vm_struct *vm = find_vm_area(ptr);
   824		unsigned int order, flags, num_elms, nr_contig_pages;
   825		int err;
   826	
   827		if (!vm)
   828			return -EINVAL;
   829	
   830		if (vm->flags & ~KHO_VMALLOC_FLAGS_MASK)
   831			return -EOPNOTSUPP;
   832	
   833		flags = vm->flags & KHO_VMALLOC_FLAGS_MASK;
   834		order = get_vm_area_page_order(vm);
   835	
   836		chunk = new_vmalloc_chunk(NULL);
   837		if (!chunk)
   838			return -ENOMEM;
   839		KHOSER_STORE_PTR(preservation->first, chunk);
   840	
   841		nr_contig_pages = (1 << order);
   842		for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
   843			phys_addr_t phys = page_to_phys(vm->pages[i]);
   844	
   845			err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
   846			if (err)
   847				goto err_free;
   848	
 > 849			chunk->phys[num_elms++] = phys;
   850			if (num_elms == ARRAY_SIZE(chunk->phys)) {
   851				chunk = new_vmalloc_chunk(chunk);
   852				if (!chunk)
   853					goto err_free;
   854			}
   855		}
   856	
   857		preservation->total_pages = vm->nr_pages;
   858		preservation->flags = flags;
   859		preservation->order = order;
   860	
   861		return 0;
   862	
   863	err_free:
   864		kho_vmalloc_free_chunks(preservation);
   865		return err;
   866	}
   867	EXPORT_SYMBOL_GPL(kho_preserve_vmalloc);
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
