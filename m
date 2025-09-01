Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C5923B0;
	Mon,  1 Sep 2025 19:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755777; cv=none; b=tXZUDSrMFOQY5MuBCyha3HDFWYOBFyPR14/L9i3+hqZfrZ7KtYoMtTfKhgHduJAHroT/Vu6cksHh4iAnMh+DXInJtEOBcVZ8NUAuWM2Aj49WE0a5ROoUTK7ceDIw8IeY20sUHn5KwSrv+F8a9YWOwveV3QSVM8Ky1WwSxIAks/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755777; c=relaxed/simple;
	bh=GEQmvcbISbFCAkB6GkidVQPNmSYq8J8izcSRbd/FNO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oVqljle8z3AIhMtq38AJ1a3ZC/5ruegam/iyyUYffOxA6zRYm137n+Gfnr++K5KIg+orsRVwwzc5yDJr3I66cO32CYgbjmOojy4gI4ofrO17AsF5tbXMDO/ZQgLppIO7PaQ3xEU9KMItilbzL5A7MrmSjvM/wAN74RyPt5XaClU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgJk8tCv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgJk8tCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756755776; x=1788291776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GEQmvcbISbFCAkB6GkidVQPNmSYq8J8izcSRbd/FNO8=;
  b=LgJk8tCv81et7sT7kXPzrCLekT7jggPhHz2l5CeT4ZbqUYUDlnR+n6e1
   C9hmfeJi6WjmN869PylW3NNZtNyUHP2WTB8ipmCDzQJCcvDAhhk+btPPY
   955CayPEqlV/qCBgdRDx9WQsxgvtAWy2s93+Qj4agXRdi7NZLIzp+Ll0+
   EEyMczc0YpoYMsEInFFnCyRwe5Ep/6T8XO9avsWPTuwtNkual5shxG/H6
   flm+wUrODSWoo6jq4VTlnekE+RxRJQGLiHR+/UrHODRRD5qtqAtXQ6PCD
   bTV3XXb3aT9zVbQp5Qd22MhUhn1VfFPJ1FaXFe0UqNd2D3J9WF71PWI+n
   g==;
X-CSE-ConnectionGUID: RW3y8qQhS8q3ivPAjBiIIg==
X-CSE-MsgGUID: ccRjSp+AQOmj7ylQne+qAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59124951"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59124951"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 12:42:55 -0700
X-CSE-ConnectionGUID: tEocO+ueQeuA6yEzg7GxOQ==
X-CSE-MsgGUID: 26Diw2H7S1GhoZgC4699Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202013453"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2025 12:42:54 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utAPN-0000yX-2N;
	Mon, 01 Sep 2025 19:41:53 +0000
Date: Tue, 2 Sep 2025 03:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [leon-rdma:dmabuf-vfio 3/27] kernel/dma/debug.c:1063:7: error: call
 to undeclared function 'PhysHighMem'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202509020340.HQsewwBx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   4318dbe63bda33b36f0359de75ad0a30bb01138b
commit: 426e2878d936d4f23b1e7132beca699528ea99a5 [3/27] dma-debug: refactor to use physical addresses for page mapping
config: hexagon-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509020340.HQsewwBx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020340.HQsewwBx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020340.HQsewwBx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/dma/debug.c:1063:7: error: call to undeclared function 'PhysHighMem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1063 |                 if (PhysHighMem(phys))
         |                     ^
   kernel/dma/debug.c:1063:7: note: did you mean 'PageHighMem'?
   include/linux/page-flags.h:619:1: note: 'PageHighMem' declared here
     619 | PAGEFLAG_FALSE(HighMem, highmem)
         | ^
   include/linux/page-flags.h:545:38: note: expanded from macro 'PAGEFLAG_FALSE'
     545 | #define PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, lname)   \
         |                                      ^
   include/linux/page-flags.h:523:19: note: expanded from macro 'TESTPAGEFLAG_FALSE'
     523 | static inline int Page##uname(const struct page *page) { return 0; }
         |                   ^
   <scratch space>:230:1: note: expanded from here
     230 | PageHighMem
         | ^
   kernel/dma/debug.c:1236:8: error: call to undeclared function 'PhysHighMem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1236 |                 if (!PhysHighMem(phys))
         |                      ^
   kernel/dma/debug.c:1232:10: warning: unused variable 'offset' [-Wunused-variable]
    1232 |                 size_t offset = offset_in_page(page);
         |                        ^~~~~~
>> kernel/dma/debug.c:1309:36: error: too many arguments to function call, expected 2, have 3
    1309 |                 check_for_stack(dev, sg_page(s), s->offset);
         |                 ~~~~~~~~~~~~~~~                  ^~~~~~~~~
   kernel/dma/debug.c:1056:13: note: 'check_for_stack' declared here
    1056 | static void check_for_stack(struct device *dev, phys_addr_t phys)
         |             ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 3 errors generated.


vim +/PhysHighMem +1063 kernel/dma/debug.c

  1055	
  1056	static void check_for_stack(struct device *dev, phys_addr_t phys)
  1057	{
  1058		void *addr;
  1059		struct vm_struct *stack_vm_area = task_stack_vm_area(current);
  1060	
  1061		if (!stack_vm_area) {
  1062			/* Stack is direct-mapped. */
> 1063			if (PhysHighMem(phys))
  1064				return;
  1065			addr = phys_to_virt(phys);
  1066			if (object_is_on_stack(addr))
  1067				err_printk(dev, NULL, "device driver maps memory from stack [addr=%p]\n", addr);
  1068		} else {
  1069			/* Stack is vmalloced. */
  1070			int i;
  1071	
  1072			for (i = 0; i < stack_vm_area->nr_pages; i++) {
  1073				if (__phys_to_pfn(phys) !=
  1074				    page_to_pfn(stack_vm_area->pages[i]))
  1075					continue;
  1076	
  1077				addr = (u8 *)current->stack + i * PAGE_SIZE +
  1078				       (phys % PAGE_SIZE);
  1079				err_printk(dev, NULL, "device driver maps memory from stack [probable addr=%p]\n", addr);
  1080				break;
  1081			}
  1082		}
  1083	}
  1084	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
