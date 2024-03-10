Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB036622;
	Sun, 10 Mar 2024 00:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710030230; cv=none; b=j5kDhLHiSpMrXuBXXAH7RcoiWyoq5gV/7tXaHsEiAfbgJOS77qljrpbu8JF8HSvL3rltxtxyhgqBVed/gLhrvSkL6cNKa81cN16C8Sd/QZ7s7NGi/1F+QAOG+0H2fL7VPpzBfboXcvKLYXNJqDCMGcdgzVLT4ofS9M8yUxKC4pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710030230; c=relaxed/simple;
	bh=dzEAqD3eUzda7mIQwuYJ12Lv1uqIPpfeffI4OGSFIZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CXd+m4OsvXR/XCiv5g9iabd2DN6sBbLOPQgfhf5JNCoQz1HtMXhZHzQnPsaTg0fwW9AUowohL69PnBxQh7l6Nl7SGObdjBBddk+OatmqrszaVCSWXej/xWqAWkfyBAtmgNlks+QgNeoJFDf6NN5JliEIUoFhiplqUmdJ9ttCkW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdpTgqVl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdpTgqVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710030229; x=1741566229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dzEAqD3eUzda7mIQwuYJ12Lv1uqIPpfeffI4OGSFIZ4=;
  b=NdpTgqVlvkPUS5TF9fQBPE85md63+PZAMIzIkXj4RWgWJ0kSnLB4QbWj
   P4R6gid1nZZOphSNMOxlJaljUn8Q4hz5sM3jkNwkGGU4Mu5YZkvmcdbK+
   HMBy52gZURbmcYjNz6dZvBssS9DbqoMxllMZuC/mJdL9AkesnREGshUxx
   IizFdDbsyEHS3wWryF1astbqiNvbawd3z6YikmgHm/Za9R/MHq4OAMdxA
   ibB6jyw4sQMYZIrcns8xGwM9v0JsPdrwgyk7Yc9AsjHSpd/4ky4zykv1C
   p41MK8XvYkk+mIoWcN5OH97+dJlFhwH754pEBI4o2pJWhKZZIqbj2pBC9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="15865120"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15865120"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 16:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="11209932"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2024 16:23:46 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj6yd-0007lF-1S;
	Sun, 10 Mar 2024 00:23:43 +0000
Date: Sun, 10 Mar 2024 08:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:pfn_cow 1/8] arch/x86/mm/pat/memtype.c:977:45:
 error: no member named 'pat_cachemode' in 'struct vma_pfnmap_ctx'
Message-ID: <202403100812.f7oiFzER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux pfn_cow
head:   00b7acecadc66f73e664b6bffeb7a237a9c0a47a
commit: abd1306234acff20b98e11f44f3dfaadc40a15c5 [1/8] x86/mm/pat: don't rely on PTE information in COW mappings
config: x86_64-buildonly-randconfig-001-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100812.f7oiFzER-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100812.f7oiFzER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100812.f7oiFzER-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/pat/memtype.c:977:45: error: no member named 'pat_cachemode' in 'struct vma_pfnmap_ctx'
     977 |                         prot = cachemode2protval(vma->pfnmap_ctx.pat_cachemode);
         |                                                  ~~~~~~~~~~~~~~~ ^
   arch/x86/mm/pat/memtype.c:1009:20: error: no member named 'pat_cachemode' in 'struct vma_pfnmap_ctx'
    1009 |                         vma->pfnmap_ctx.pat_cachemode = pgprot2cachemode(*prot);
         |                         ~~~~~~~~~~~~~~~ ^
   2 errors generated.


vim +977 arch/x86/mm/pat/memtype.c

   952	
   953	/*
   954	 * track_pfn_copy is called when vma that is covering the pfnmap gets
   955	 * copied through copy_page_range().
   956	 *
   957	 * If the vma has a linear pfn mapping for the entire range, we get the prot
   958	 * from pte and reserve the entire vma range with single reserve_pfn_range call.
   959	 */
   960	int track_pfn_copy(struct vm_area_struct *vma)
   961	{
   962		resource_size_t paddr;
   963		unsigned long prot;
   964		unsigned long vma_size = vma->vm_end - vma->vm_start;
   965		pgprot_t pgprot;
   966	
   967		if (vma->vm_flags & VM_PAT) {
   968			/*
   969			 * reserve the whole chunk covered by vma. We need the
   970			 * starting address and protection from pte.
   971			 *
   972			 * For COW mappings, we have the PFN in vma->vm_pgoff, see
   973			 * remap_pfn_range_notrack().
   974			 */
   975			if (is_cow_mapping(vma->vm_flags)) {
   976				paddr = (resource_size_t)vma->vm_pgoff << PAGE_SHIFT;
 > 977				prot = cachemode2protval(vma->pfnmap_ctx.pat_cachemode);
   978			} else if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
   979				WARN_ON_ONCE(1);
   980				return -EINVAL;
   981			}
   982			pgprot = __pgprot(prot);
   983			return reserve_pfn_range(paddr, vma_size, &pgprot, 1);
   984		}
   985	
   986		return 0;
   987	}
   988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
