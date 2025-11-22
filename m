Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2135204583;
	Sat, 22 Nov 2025 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763819448; cv=none; b=RRG3OBqYjEXoJPa20lTnjwMLpsqZ1RBrHUwcepkq3t7r6MWqNKiFcKEsyHFnb5I+JyZpqVBr9c9ntTcrDtduYYpADPDa/JCF8XLTDfWu9c6HgT9po+Q7qlOGc6s3BMyWsl87LD16JcSmXFjToaFaSxJZuVr/qhE+tFBYA1pxQZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763819448; c=relaxed/simple;
	bh=5uHIYXs6hKc0/G6gf077IjVTcvUcqthDxaSh4N0B7A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PtMbxZBhVrkueJMJoZvoHfrw0WD+yhiwFZxizXtUYAVp5M9Ed6O0Va9zNOHw3+yQ5FqTPFatHtesktMVB8nV+72kcz3CIJsyvosPUz6FIsh88S2G9hGCbDmrRmXK82WY3fj40g31May0RGWCcUV4wR1OSqtytSUoq/DOmFGsu/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbK7YXBc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbK7YXBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763819447; x=1795355447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5uHIYXs6hKc0/G6gf077IjVTcvUcqthDxaSh4N0B7A0=;
  b=UbK7YXBcg6iZlg9GF5YOwuKOK0ae6ktCsh+d7FpTF9WuHOd+ksfNRZNe
   5Ha+QiZLDTNhpdXcGt0ntCbn8bwHvh01rLKUilmZYF/31mobcmZxVEAdy
   c8+c2Fy0fs00xwOnXtg5OtWyhJEjKRxVjVFDhknL973ilPBIuST9t/mNw
   d0L2I/kz+srwwui14CBsJrvtasKsbHEYZJNlGuPIKzyjcIEEE4WgCyG/U
   J85ewdDcI2aWhChx55A9CxVZST6fCdg2rKkeSqi/M0D/cu0FiVGhBzKyb
   6w1O6fO3PlHkp+6/MAbLC3nMQl8HFpx/OGtPpSFpb/fD5nGJxqAmvvGMp
   w==;
X-CSE-ConnectionGUID: hFaYMTdxQee6bjfOasHgAA==
X-CSE-MsgGUID: V3sF3T2tT2mqsvbrzoIhLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65080094"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65080094"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:50:46 -0800
X-CSE-ConnectionGUID: 8MYHAAF5QeKDLY2fmws1Jg==
X-CSE-MsgGUID: SfpbS6vlQCm5aGhmCFP72g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222874520"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2025 05:50:45 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMo0g-0007Yh-2g;
	Sat, 22 Nov 2025 13:50:42 +0000
Date: Sat, 22 Nov 2025 21:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:uffd+guestmemfd/v1 4/5]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:376:10: error: use of
 undeclared identifier 'VM_FAULT_USERFAULTFD'
Message-ID: <202511222133.qIuQVc3r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/v1
head:   37911e172b33e52e4e224da52775c714483c8a90
commit: bf20f42e7ef8a03b1df8aca27e5159b87f7d40ea [4/5] guest_memfd: add support for userfaultfd minor mode
config: x86_64-randconfig-075-20251122 (https://download.01.org/0day-ci/archive/20251122/202511222133.qIuQVc3r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511222133.qIuQVc3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511222133.qIuQVc3r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:376:10: error: use of undeclared identifier 'VM_FAULT_USERFAULTFD'
     376 |                 return VM_FAULT_USERFAULTFD;
         |                        ^
   1 error generated.


vim +/VM_FAULT_USERFAULTFD +376 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   350	
   351	static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
   352	{
   353		struct inode *inode = file_inode(vmf->vma->vm_file);
   354		struct folio *folio;
   355		vm_fault_t ret = VM_FAULT_LOCKED;
   356	
   357		if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
   358			return VM_FAULT_SIGBUS;
   359	
   360		if (!((u64)inode->i_private & GUEST_MEMFD_FLAG_INIT_SHARED))
   361			return VM_FAULT_SIGBUS;
   362	
   363		folio = kvm_gmem_get_folio(inode, vmf->pgoff);
   364		if (IS_ERR(folio)) {
   365			int err = PTR_ERR(folio);
   366	
   367			if (err == -EAGAIN)
   368				return VM_FAULT_RETRY;
   369	
   370			return vmf_error(err);
   371		}
   372	
   373		if (userfaultfd_minor(vmf->vma)) {
   374			folio_unlock(folio);
   375			folio_put(folio);
 > 376			return VM_FAULT_USERFAULTFD;
   377		}
   378	
   379		if (WARN_ON_ONCE(folio_test_large(folio))) {
   380			ret = VM_FAULT_SIGBUS;
   381			goto out_folio;
   382		}
   383	
   384		if (!folio_test_uptodate(folio)) {
   385			clear_highpage(folio_page(folio, 0));
   386			kvm_gmem_mark_prepared(folio);
   387		}
   388	
   389		vmf->page = folio_file_page(folio, vmf->pgoff);
   390	
   391	out_folio:
   392		if (ret != VM_FAULT_LOCKED) {
   393			folio_unlock(folio);
   394			folio_put(folio);
   395		}
   396	
   397		return ret;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
