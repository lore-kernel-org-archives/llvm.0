Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98996270553;
	Mon, 13 Oct 2025 12:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358446; cv=none; b=csW04tS/lrODqHyoJXAkeZrFGuNSk3KJzeIxIOdpatm8VFCM5j3ppXYZIRo0xsbPvRm+FuE6x+h1ww+DxZWe1rTOMrENswpfFsmTzECrp7wS/52uzrw3UUxEMwocV21g0NDZQHZfU+aKIQCgrcRK7imh4g/FAVL7D/oN8HvCMlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358446; c=relaxed/simple;
	bh=nx3ufwTUgiNEVquPhVF0BzjK3raz7mJ8M8zxQnVW5Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdiWRPePchsJlL2PRj7BfK+o/LBK6xXybepRe6OaGQOn0fX0hoisTwIXxn6AJu5sWoefJRPsL+RxZ7p2aO8p+TrkEQVrwk3NeBTOWdF8Vwy9Z5v33+dER9PF33zMRgBvTZPJeX6tngL9vaDkq5LGOGqqv/ylj/yQ3mXx0Rv9lRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ggb32g6W; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ggb32g6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358444; x=1791894444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nx3ufwTUgiNEVquPhVF0BzjK3raz7mJ8M8zxQnVW5Q4=;
  b=Ggb32g6WRcmYpkvG9aQw5Pk9G+6oxv9/OmLRLOwmnnPCBVNw8P7CPAX8
   Dx0sXoJEIS9diYOIhQZS7arFLkKN1r0KyH0umoqnejK8RNFYndNQfKLb8
   ZrINP1e5c0tSSVXO8gJpCTgEBWosNoXeGOiWr3fdCA9nxkjDceTKGxWLR
   nQgFgNmehvNux2sp4Dqqp9+Vayo7XZeQbGH9ohgBpowIem7DBbG81XeTC
   8oQD5iyk4xvgRXgs1kzukQTl7xiDUfZSLhw0xEPv/E3c60prePrVTq91S
   QWWeWvpl3kcIiISF3+waMxn/xtaRnsdLrcikWgc290crnYoBtFJV/MvgR
   Q==;
X-CSE-ConnectionGUID: I/518B2ZQeuh2JIcokAXyA==
X-CSE-MsgGUID: GQdth3VzRJu0DMAULlSYNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62528681"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62528681"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:27:20 -0700
X-CSE-ConnectionGUID: /d7zNtv+S5qZCAdWy4nXdg==
X-CSE-MsgGUID: M1m676uCT2Cmo0NqooPl1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="186001672"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2025 05:27:18 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8He0-000000008sC-1uB3;
	Mon, 13 Oct 2025 12:27:16 +0000
Date: Mon, 13 Oct 2025 14:26:46 +0200
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [davidhildenbrand:guestmemfd-preview 18/26]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:155:10: error: call to
 undeclared function '__filemap_get_folio_mpol'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510120020.Yna3VUaz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux guestmemfd-preview
head:   0c301bf7489a928d4839f3ee7477966a681543a2
commit: 0214cede5073bcc0f7cd671ca0c3ec99ef4eb164 [18/26] KVM: guest_memfd: Enforce NUMA mempolicy using shared policy
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251012/202510120020.Yna3VUaz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120020.Yna3VUaz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120020.Yna3VUaz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:155:10: error: call to undeclared function '__filemap_get_folio_mpol'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |         folio = __filemap_get_folio_mpol(inode->i_mapping, index,
         |                 ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:155:10: note: did you mean '__filemap_get_folio'?
   include/linux/pagemap.h:748:15: note: '__filemap_get_folio' declared here
     748 | struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
         |               ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:155:8: error: incompatible integer to pointer conversion assigning to 'struct folio *' from 'int' [-Wint-conversion]
     155 |         folio = __filemap_get_folio_mpol(inode->i_mapping, index,
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                                          FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     157 |                                          mapping_gfp_mask(inode->i_mapping), policy);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/__filemap_get_folio_mpol +155 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   129	
   130	/*
   131	 * Returns a locked folio on success.  The caller is responsible for
   132	 * setting the up-to-date flag before the memory is mapped into the guest.
   133	 * There is no backing storage for the memory, so the folio will remain
   134	 * up-to-date until it's removed.
   135	 *
   136	 * Ignore accessed, referenced, and dirty flags.  The memory is
   137	 * unevictable and there is no storage to write back to.
   138	 */
   139	static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
   140	{
   141		/* TODO: Support huge pages. */
   142		struct mempolicy *policy;
   143		struct folio *folio;
   144	
   145		/*
   146		 * Fast-path: See if folio is already present in mapping to avoid
   147		 * policy_lookup.
   148		 */
   149		folio = __filemap_get_folio(inode->i_mapping, index,
   150					    FGP_LOCK | FGP_ACCESSED, 0);
   151		if (!IS_ERR(folio))
   152			return folio;
   153	
   154		policy = kvm_gmem_get_folio_policy(GMEM_I(inode), index);
 > 155		folio = __filemap_get_folio_mpol(inode->i_mapping, index,
   156						 FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
   157						 mapping_gfp_mask(inode->i_mapping), policy);
   158		mpol_cond_put(policy);
   159	
   160		return folio;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
