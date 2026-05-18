Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548C2D838E;
	Mon, 18 May 2026 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130085; cv=none; b=EguGHfdcDjE7xRfwW55XWucyDwf2MeLSbY0Rz5EDTxqR5cI4ambDe0HgI8NIHV4vpF7F7DYH4bjuKGy2imm3LFuA8p8ZoPYaJvHxKWAtZmOSfGYfBq8mHlsnwRaGiqg3+wzrIymefLcut2AXVoXLJHqTXIQ+1SH2f+KEnHESJZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130085; c=relaxed/simple;
	bh=G+srGmgFVESH0UaKQZ3cfcY+lT1roXHVD0cpaBNsb6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JYPtqJnm0lytBWZMCrXivQr5bbfJI6y6jnKVgrVaPGgUuiXsK0+vTy0Vx83cH+Y4ZLf2osBFWtaQq3Angtom1r2xtH1oI7UmkEI8RtJ8Zk4gM1WizJZvDungCBosvCkNNZMg6RkaGeOuSnETWhcCOQ7+wQkbDqg1eXsUTuqIPvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSuH2wGN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSuH2wGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779130084; x=1810666084;
  h=date:from:to:cc:subject:message-id;
  bh=G+srGmgFVESH0UaKQZ3cfcY+lT1roXHVD0cpaBNsb6w=;
  b=gSuH2wGN7J3NRYmND1SEb2Lq0UgydYuqawjesUVQEbWeyRo41NGQ2QlN
   R95EE0eh9Ab2qzUiUCYg1G/0f3FcXjtT1vKmT1daVMcND5CxbHz/Wd6EL
   /fRWJ2+WM1hOb4ilyR2yDaECNfXZQPbL4OTxqgcCAmNACsuOan29kXD35
   R8XeOOn8qJpoSDXMA/vAxUd1rtR7MU+MnrVnl7AUVufkfXkwPdpZYbaLI
   eZwDDk0w/xkDhMwCEPtlPWEsgnyXx6MnFqMPEJOpVDs4wWWUGP1mlioxI
   im1ZsBWeDwFdg/JLxJRjRDZDRh5RUkpui9gsmfakISmdYUVTY/DYfEm5B
   A==;
X-CSE-ConnectionGUID: 3KE27P9CTgqeFm2DN88DTA==
X-CSE-MsgGUID: b+sHI01NSG6iaijJ+jccBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80113157"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="80113157"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 11:48:03 -0700
X-CSE-ConnectionGUID: kwtxut3XQhmkFmvz5p73QA==
X-CSE-MsgGUID: d5OO7U9hT5ubYTtrZuitHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="277622951"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2026 11:48:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP30R-000000009th-0jw7;
	Mon, 18 May 2026 18:47:59 +0000
Date: Mon, 18 May 2026 20:47:03 +0200
From: kernel test robot <lkp@intel.com>
To: Tarun Sahu <tarunsahu@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: arch/x86/kvm/../../../virt/kvm/guest_memfd.c:101:6: warning:
 unused variable 'idx'
Message-ID: <202605182054.oXUw961t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tarun-Sahu/liveupdate-Add-LIVEUPDATE_GUEST_MEMFD-config-option/20260518-184146
head:   f3f1cf3afea13caef26e96b7838b73a301fda2e7
commit: 90081315361a629b585cf1da5cedf5e164f20397 kvm: guest_memfd: Add support for freezing and unfreezing mappings
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260518/202605182054.oXUw961t-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605182054.oXUw961t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605182054.oXUw961t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:101:6: warning: unused variable 'idx' [-Wunused-variable]
     101 |         int idx;
         |             ^~~
   1 warning generated.


vim +/idx +101 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

    86	
    87	/*
    88	 * Returns a locked folio on success.  The caller is responsible for
    89	 * setting the up-to-date flag before the memory is mapped into the guest.
    90	 * There is no backing storage for the memory, so the folio will remain
    91	 * up-to-date until it's removed.
    92	 *
    93	 * Ignore accessed, referenced, and dirty flags.  The memory is
    94	 * unevictable and there is no storage to write back to.
    95	 */
    96	static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
    97	{
    98		/* TODO: Support huge pages. */
    99		struct mempolicy *policy;
   100		struct folio *folio;
 > 101		int idx;
   102	
   103		/*
   104		 * Fast-path: See if folio is already present in mapping to avoid
   105		 * policy_lookup.
   106		 */
   107		folio = filemap_lock_folio(inode->i_mapping, index);
   108		if (!IS_ERR(folio))
   109			return folio;
   110	
   111		policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
   112		folio = __filemap_get_folio_mpol(inode->i_mapping, index,
   113						 FGP_LOCK | FGP_CREAT,
   114						 mapping_gfp_mask(inode->i_mapping), policy);
   115		mpol_cond_put(policy);
   116	
   117		/*
   118		 * External interfaces like kvm_gmem_get_pfn() support dealing
   119		 * with hugepages to a degree, but internally, guest_memfd currently
   120		 * assumes that all folios are order-0 and handling would need
   121		 * to be updated for anything otherwise (e.g. page-clearing
   122		 * operations).
   123		 */
   124		WARN_ON_ONCE(!IS_ERR(folio) && folio_order(folio));
   125	
   126		return folio;
   127	}
   128	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
