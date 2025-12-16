Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F403491D6;
	Tue, 16 Dec 2025 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765885163; cv=none; b=dyMI8BWZ9Tr3mSovsJ/Aatm1GAVQ/LGlICrOna11GXUuSilmIUMwricSMDrRte9+rjXQb3VTunWCfH5fMbOiRKxF/1wv/xqqG7Dz5ZtzGhw+VuCyGV1nb4zu9i1iDc/A8YaZ83JTPWMYjDSNx/cUReOvX/CmGnlDwvO3W3+9GJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765885163; c=relaxed/simple;
	bh=G0MliCZ3qoCXzuKR2ADRnq6tPcKVuJjZUHxc2xReJxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzIRgH97tE98beXdO99trL2g1pP0r60KdZbKoVc2n8USeY3PmVD+qtwFORGT6gagCxR2laI7TO/WUOhE5yd8Ro99j4RAAraUUNLtNFArAhq+7/K9ye6oyjtYTa111xZpSlLwq2Uu++dViwfPAT7H/tJwiUx7XqvdI7G1vHeJMO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTOKBp6p; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTOKBp6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765885162; x=1797421162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G0MliCZ3qoCXzuKR2ADRnq6tPcKVuJjZUHxc2xReJxY=;
  b=mTOKBp6piQe3PyiBpce8JmDNQHJUSHbeUwOy6X3BWXarbdhcR7QQ1ZGg
   vJ/x/K+6twz3E20pO1xO/Q3P76PccsAzXC6v1ozAm/vpZS04I52R1uw8j
   kv0N3vGe5da5GzzXI/Fde4GaPfS3NXUlbs7RSMkKu1Z+z8g5DHnnKepF1
   nKD3qbJ0e7XbsJYztQNmMs6UA6KKnsGMjjXnWWm08NuaaLKzcSgsqX9ij
   In+T9ty1g3NyKvC29gdXsBEEBeLn/YOhFRATQg+q0Vrp2VQe41e+D/A92
   NXe6Y7ROMX2m9S603hLJ4oeI08azOAM16M3oXHHawgQ3Xihzqb+OmSPpl
   w==;
X-CSE-ConnectionGUID: Z40BhPYoTi2FecrRpXJzlw==
X-CSE-MsgGUID: oY8qKWL5Q1q3JH4F56dTzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70376669"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="70376669"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 03:39:21 -0800
X-CSE-ConnectionGUID: TGYDgSbyRnixB09Tyh1qkQ==
X-CSE-MsgGUID: CDjWge8UQQ+HSo5Hxk15Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197977625"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 03:39:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVTOb-0000000035U-2iLD;
	Tue, 16 Dec 2025 11:39:13 +0000
Date: Tue, 16 Dec 2025 12:38:35 +0100
From: kernel test robot <lkp@intel.com>
To: Zhang Qilong <zhangqilong3@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com, corbet@lwn.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH next 2/2] mm/huge_memory: Add sysfs knob for executable
 THP COW
Message-ID: <202512161231.CTAFQzip-lkp@intel.com>
References: <20251215123407.380813-3-zhangqilong3@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215123407.380813-3-zhangqilong3@huawei.com>

Hi Zhang,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251215]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Qilong/mm-huge_memory-Implementation-of-THP-COW-for-executable-file-mmap/20251215-204035
base:   next-20251215
patch link:    https://lore.kernel.org/r/20251215123407.380813-3-zhangqilong3%40huawei.com
patch subject: [PATCH next 2/2] mm/huge_memory: Add sysfs knob for executable THP COW
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251216/202512161231.CTAFQzip-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161231.CTAFQzip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161231.CTAFQzip-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:6131:6: error: call to undeclared function 'transparent_hugepage_use_exec_cow'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6131 |         if (transparent_hugepage_use_exec_cow() &&
         |             ^
   mm/memory.c:6135:7: error: call to undeclared function 'vma_is_special_huge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6135 |                 if (vma_is_special_huge(vma) || vma_is_shmem(vma))
         |                     ^
   2 errors generated.


vim +/transparent_hugepage_use_exec_cow +6131 mm/memory.c

  6104	
  6105	/* `inline' is required to avoid gcc 4.1.2 build error */
  6106	static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
  6107	{
  6108		struct vm_area_struct *vma = vmf->vma;
  6109		const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
  6110		vm_fault_t ret;
  6111	
  6112		if (vma_is_anonymous(vma)) {
  6113			if (likely(!unshare) &&
  6114			    userfaultfd_huge_pmd_wp(vma, vmf->orig_pmd)) {
  6115				if (userfaultfd_wp_async(vmf->vma))
  6116					goto split;
  6117				return handle_userfault(vmf, VM_UFFD_WP);
  6118			}
  6119			return do_huge_pmd_wp_page(vmf);
  6120		}
  6121	
  6122		if (vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) {
  6123			if (vma->vm_ops->huge_fault) {
  6124				ret = vma->vm_ops->huge_fault(vmf, PMD_ORDER);
  6125				if (!(ret & VM_FAULT_FALLBACK))
  6126					return ret;
  6127			}
  6128		}
  6129	
  6130	
> 6131		if (transparent_hugepage_use_exec_cow() &&
  6132		    is_exec_mapping(vma->vm_flags) &&
  6133		    is_cow_mapping(vma->vm_flags)) {
  6134			/* Skip special and shmem */
  6135			if (vma_is_special_huge(vma) || vma_is_shmem(vma))
  6136				goto split;
  6137	
  6138			ret = do_huge_pmd_exec_cow(vmf);
  6139			if (!(ret & VM_FAULT_FALLBACK))
  6140				return ret;
  6141		}
  6142	
  6143	split:
  6144		/* COW or write-notify handled on pte level: split pmd. */
  6145		__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
  6146	
  6147		return VM_FAULT_FALLBACK;
  6148	}
  6149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
