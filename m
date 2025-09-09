Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1619329BDB1;
	Tue,  9 Sep 2025 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410971; cv=none; b=EJphIQQk40gwsbGSanLInW45XHtcPG+cvQPVYHE4hM+wYV/dSPskbsmJwu+0/XVb6gVVK9nlo4UUC2o0lffNH+y/mpfUyKfP4kJ4Sb7o3/TUox4ZAwJme/YXVn50gQ5v91UiXfjtDYPMSDqYi2q78QlFvzwBje7IO0S8MKaWUqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410971; c=relaxed/simple;
	bh=YhIsuyT32WR9UdRetO0vSva6rEWQWAdkx7fjgtPvQZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzFokGvId0Tnk1zpUdzI3CRMfA+QcoIk2T8um8GRmuzBDG2YicO2VPtjG8xkITnJtUEbTDm7wn2+k4H3Hlls2FBnVNSvdJaZu0vdZBwMeYvrQ5PrWmgmuuo9NMHnXpaPRQvcxNXMu5JLrn5NfDaHxZAzPXs+cQlEFMu7rxb3uSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caG7RnZZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caG7RnZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757410970; x=1788946970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YhIsuyT32WR9UdRetO0vSva6rEWQWAdkx7fjgtPvQZQ=;
  b=caG7RnZZBVTbnLS8iUUeB7mI+26H7R1jzbVTtEsb1OY4mCwjEjHkop4T
   KhOo6NuZ1hnDGgB1Mg2phUz8qZ5IJmy4dCx3qt/kpdFi7sd0B23PzFUgz
   SPZ3RpWgvc9sBaWGuSOKMPIkazQtScdPTARVjCMcDQATXmNGnkXEA2WTO
   GoNQ6ftmA8Cj9+PZrek0PcgVeopNVec9xKymHvj7n0mLH3Qq0G2luDSJZ
   InWfnJN/X3MElPT2BFVzWh3re564G3V1Z7hA8G2xm93yx37WbOtJ4Vkq1
   mBIibbvZnkdHlwKOn+uHPcgvj5MqbBwgOW6a1uNMx06ckhX6kgBdm04HS
   g==;
X-CSE-ConnectionGUID: W8LKboQuRlmAgfa23jOySA==
X-CSE-MsgGUID: YpQIL5nISiK3RHZWqDb5DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59795915"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59795915"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 02:42:49 -0700
X-CSE-ConnectionGUID: H9s4sHoTTPmrV+J0WIt+rg==
X-CSE-MsgGUID: rOUG1w+VTQOnr2+LE0peRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="177337465"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Sep 2025 02:42:41 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvus1-0004iZ-33;
	Tue, 09 Sep 2025 09:42:37 +0000
Date: Tue, 9 Sep 2025 17:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Wilcox <willy@infradead.org>, Guo Ren <guoren@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Nicolas Pitre <nico@fluxnic.net>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH 13/16] mm: update cramfs to use mmap_prepare,
 mmap_complete
Message-ID: <202509091758.mKPE6Hs0-lkp@intel.com>
References: <e2fb74b295b60bcb591aba5cc521cbe1b7901cd3.1757329751.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2fb74b295b60bcb591aba5cc521cbe1b7901cd3.1757329751.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[cannot apply to brauner-vfs/vfs.all char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus s390/features lwn/docs-next linus/master v6.17-rc5 next-20250909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-shmem-update-shmem-to-use-mmap_prepare/20250908-191516
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/e2fb74b295b60bcb591aba5cc521cbe1b7901cd3.1757329751.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 13/16] mm: update cramfs to use mmap_prepare, mmap_complete
config: arm64-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091758.mKPE6Hs0-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091758.mKPE6Hs0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091758.mKPE6Hs0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/cramfs/inode.c:19:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:1096:
   include/linux/huge_mm.h:591:16: warning: unused variable 'folio' [-Wunused-variable]
           struct folio *folio = page_folio(page);
                         ^
   include/linux/huge_mm.h:598:16: warning: unused variable 'folio' [-Wunused-variable]
           struct folio *folio = page_folio(page);
                         ^
>> fs/cramfs/inode.c:358:38: warning: cast to smaller integer type 'enum cramfs_mmap_state' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           enum cramfs_mmap_state mmap_state = (enum cramfs_mmap_state)context;
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +358 fs/cramfs/inode.c

   350	
   351	static int cramfs_physmem_mmap_complete(struct file *file, struct vm_area_struct *vma,
   352						const void *context)
   353	{
   354		struct inode *inode = file_inode(file);
   355		struct cramfs_sb_info *sbi = CRAMFS_SB(inode->i_sb);
   356		unsigned long address, pgoff = vma->vm_pgoff;
   357		unsigned int pages, offset;
 > 358		enum cramfs_mmap_state mmap_state = (enum cramfs_mmap_state)context;
   359		int ret = 0;
   360	
   361		if (mmap_state == NO_PREPOPULATE)
   362			return 0;
   363	
   364		offset = cramfs_get_block_range(inode, pgoff, &pages);
   365		address = sbi->linear_phys_addr + offset;
   366	
   367		/*
   368		 * Now try to pre-populate ptes for this vma with a direct
   369		 * mapping avoiding memory allocation when possible.
   370		 */
   371	
   372		if (mmap_state == PREPOPULATE_PFNMAP) {
   373			/*
   374			 * The entire vma is mappable. remap_pfn_range() will
   375			 * make it distinguishable from a non-direct mapping
   376			 * in /proc/<pid>/maps by substituting the file offset
   377			 * with the actual physical address.
   378			 */
   379			ret = remap_pfn_range_complete(vma, vma->vm_start, address >> PAGE_SHIFT,
   380					pages * PAGE_SIZE, vma->vm_page_prot);
   381		} else {
   382			/*
   383			 * Let's create a mixed map if we can't map it all.
   384			 * The normal paging machinery will take care of the
   385			 * unpopulated ptes via cramfs_read_folio().
   386			 */
   387			int i;
   388	
   389			for (i = 0; i < pages && !ret; i++) {
   390				vm_fault_t vmf;
   391				unsigned long off = i * PAGE_SIZE;
   392	
   393				vmf = vmf_insert_mixed(vma, vma->vm_start + off,
   394						address + off);
   395				if (vmf & VM_FAULT_ERROR)
   396					ret = vm_fault_to_errno(vmf, 0);
   397			}
   398		}
   399	
   400		if (!ret)
   401			pr_debug("mapped %pD[%lu] at 0x%08lx (%u/%lu pages) "
   402				 "to vma 0x%08lx, page_prot 0x%llx\n", file,
   403				 pgoff, address, pages, vma_pages(vma), vma->vm_start,
   404				 (unsigned long long)pgprot_val(vma->vm_page_prot));
   405		return ret;
   406	}
   407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
