Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB01276024;
	Fri, 13 Jun 2025 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805205; cv=none; b=pJRiWTqu4/WjKbMWfLn6blfo76rYKumslpI1Fv5dbvVHojJwfz0eN/b2NkcqNB9lcBxTHgQGV56Oucq5R9jRMvbkhYbzoh0/KWXRUcBzeJiAw9GAo/N34fXKkRfiXfYgLy+owY/cKf335HY7Hgo3wnqwYREBZm066QstciOJWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805205; c=relaxed/simple;
	bh=Uqu0lAJUVoK8LO0dL8e3PxW8AqzbjBSMetAOHpASS3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eT+Gr4Z+970R7cCznQwb7JuM4q8tpJ4enbWEJbAGdLGmqUQ3fypJUmXHiQVlOfNuGqk0BAVEFZrM1OJBdHqk8G2SckcSvnkipkm+2t1sbn0pXxFq8ZLvDsCLE4rFyJ4QppetQDsp0nICffmnRU9OJPXVZGC0CKqq3PYQWFKwjOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjnOuHAV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjnOuHAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749805204; x=1781341204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uqu0lAJUVoK8LO0dL8e3PxW8AqzbjBSMetAOHpASS3Q=;
  b=AjnOuHAV5564JRX2EePpTv+2zYCOicZourfwT3JKQnq5j9nk0uUREpNs
   QCsn+zooZUEYclrcoqwj1rOPFVFRbKu8EjXP0z9pMXR8I+ssONa/I7Amo
   Ecf9SZja3v8WXqkGuLHPGhocHVfyjIC9BQlAsy7RR0K27sIX6vyTgCYQt
   kZzBLmXPzJb8jU5wMORIzOb0vcSgklQ3pPlGg8cN38UEfv+KuODQJYRnG
   FuYxLx8b1SJrtXchf/UlyFD37xTeqPOE5jOP1SLx8kaThE8H8xvhn7TM7
   ggcekJN/Txeuhb/j50fGX6gjmy7cfnppHD8SnQXOP3vWbSFbDCaIHskwB
   Q==;
X-CSE-ConnectionGUID: abU1HdBwTguFWEpSwz78yw==
X-CSE-MsgGUID: akCNmkUhR/yz1++4IF5znw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52110057"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="52110057"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 02:00:03 -0700
X-CSE-ConnectionGUID: xVfYTQtaR1CutY/ZKroX+Q==
X-CSE-MsgGUID: d3pWQCpGQ4C6R1MpqYijPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148325488"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2025 02:00:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ0GV-000COo-1Z;
	Fri, 13 Jun 2025 08:59:59 +0000
Date: Fri, 13 Jun 2025 16:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] PCI: Add quirk to always map ivshmem as write-back
Message-ID: <202506131608.QlkxUPnI-lkp@intel.com>
References: <20250612082233.3008318-1-aik@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612082233.3008318-1-aik@amd.com>

Hi Alexey,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Kardashevskiy/PCI-Add-quirk-to-always-map-ivshmem-as-write-back/20250612-162626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250612082233.3008318-1-aik%40amd.com
patch subject: [RFC PATCH] PCI: Add quirk to always map ivshmem as write-back
config: i386-buildonly-randconfig-004-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131608.QlkxUPnI-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131608.QlkxUPnI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131608.QlkxUPnI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/mmap.c:38:2: error: expected expression
      38 |         else if (!(pci_resource_flags(pdev, bar) & IORESOURCE_CACHEABLE))
         |         ^
   1 error generated.


vim +38 drivers/pci/mmap.c

    23	
    24	int pci_mmap_resource_range(struct pci_dev *pdev, int bar,
    25				    struct vm_area_struct *vma,
    26				    enum pci_mmap_state mmap_state, int write_combine)
    27	{
    28		unsigned long size;
    29		int ret;
    30	
    31		size = ((pci_resource_len(pdev, bar) - 1) >> PAGE_SHIFT) + 1;
    32		if (vma->vm_pgoff + vma_pages(vma) > size)
    33			return -EINVAL;
    34	
    35		if (write_combine)
    36			vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
    37		else
  > 38		else if (!(pci_resource_flags(pdev, bar) & IORESOURCE_CACHEABLE))
    39			vma->vm_page_prot = pgprot_device(vma->vm_page_prot);
    40	
    41		if (mmap_state == pci_mmap_io) {
    42			ret = pci_iobar_pfn(pdev, bar, vma);
    43			if (ret)
    44				return ret;
    45		} else
    46			vma->vm_pgoff += (pci_resource_start(pdev, bar) >> PAGE_SHIFT);
    47	
    48		vma->vm_ops = &pci_phys_vm_ops;
    49	
    50		if (pci_resource_flags(pdev, bar) & IORESOURCE_CACHEABLE)
    51			return remap_pfn_range_notrack(vma, vma->vm_start, vma->vm_pgoff,
    52						       vma->vm_end - vma->vm_start,
    53						       vma->vm_page_prot);
    54	
    55		return io_remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
    56					  vma->vm_end - vma->vm_start,
    57					  vma->vm_page_prot);
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
