Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DFA21A0C;
	Mon,  1 Apr 2024 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711976216; cv=none; b=gIjIKTjhRQ/pw8V7cY/U/fXRwshhmKIdUFhA7KiCJ1kDmdoCG0ePtRdcmFxZOGcvUsyINCZb/eVLFVRDNmLLHwWDwe95AAUXJ3QT/qsYB7cOJHxCwj7ywqZNMb/eJr9aTkgl0PuI+8RYirh+6Dn+GhQ1QX0/Swhnic/lfS/1qeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711976216; c=relaxed/simple;
	bh=6yUN7Kopza35TH5tDTz+rN7vpnEdZfLYf6EBYGz3wI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fljjIDFCV75o4vLtJIQ59p/PqMEGxWVAPHshmxGiqU/WohsKKr1jtYfe4Gi2nMeskV5LH0hOih8nfJdbbk8v9LfW0h5X6zblH8u1ndKcAws89Cum6N+M2PRU1O2VK+7hwZ+EIf9TwM1UXHfu81gH3UtvqSgF3LeUm7gd+bPCY+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exwqU1ms; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exwqU1ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711976214; x=1743512214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6yUN7Kopza35TH5tDTz+rN7vpnEdZfLYf6EBYGz3wI4=;
  b=exwqU1msa0lrhfdmwW/fPbQUfttYsrFe+mJ0sxyutw/Q4ygKwZxjcHVk
   PAlBWQEi5dcxhgLy0UDIDDQe641BgCXUVH+wbLq+D5iIaeVU+HRBZP2Mo
   zKnwooQeqxC71qiBqOhBVxLHuM/hCLLMQHU3oS91wg/y/v4qyqIAcTfsn
   pGsnzUdLvbTrhyKOYIVUsAs27fkr7ExMY1vODIqHfmTQ6obGIunKtunhs
   6OdDEaymg4GiJVjOQPzd1Ewt6u6LDsgtSrbzWTXlQuuw5oPwU66ke15C8
   PCBKv//K0teg3seDs9XmhI8+k1FyhmNNLeXZ01QOdG22tn5CBBpRx2Fo9
   A==;
X-CSE-ConnectionGUID: 2PNikKUXRwGqTM3RpjK9Pw==
X-CSE-MsgGUID: +e3OmrGJRWiuaXBRA4HyVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="18250395"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="18250395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 05:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="22452221"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Apr 2024 05:56:53 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrHDG-0000JV-2I;
	Mon, 01 Apr 2024 12:56:44 +0000
Date: Mon, 1 Apr 2024 20:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vivek-drm-tip:virtgpu_import_rfc 9/9]
 drivers/dma-buf/udmabuf.c:347:24: error: incompatible integer to pointer
 conversion passing 'unsigned long' to parameter of type 'const void *'
Message-ID: <202404012015.zh49v9wj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/Vivek/drm-tip.git virtgpu_import_rfc
head:   2347bf8ba6d850818b830aa54bb75d4b892fb6a8
commit: 2347bf8ba6d850818b830aa54bb75d4b892fb6a8 [9/9] udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl
config: arm-randconfig-002-20240401 (https://download.01.org/0day-ci/archive/20240401/202404012015.zh49v9wj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404012015.zh49v9wj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404012015.zh49v9wj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dma-buf/udmabuf.c:4:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/dma-buf/udmabuf.c:347:24: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
     347 |                         page = virt_to_page((unsigned long)addr + size);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/memory.h:390:53: note: expanded from macro 'virt_to_page'
     390 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:18:41: note: expanded from macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/arm/include/asm/memory.h:296:53: note: passing argument to parameter 'p' here
     296 | static inline unsigned long virt_to_pfn(const void *p)
         |                                                     ^
   drivers/dma-buf/udmabuf.c:565:9: warning: shift count >= width of type [-Wshift-count-overflow]
     565 |                                            DMA_BIT_MASK(64));
         |                                            ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   2 warnings and 1 error generated.


vim +347 drivers/dma-buf/udmabuf.c

   299	
   300	static int handle_pcidev_pages(struct udmabuf *ubuf,
   301				       struct udmabuf_create_list *head,
   302				       struct udmabuf_create_item *list)
   303	{
   304		struct pci_dev *pdev = NULL;
   305		resource_size_t bar_size;
   306		pgoff_t pgbuf = 0;
   307		struct page *page;
   308		int i, ret;
   309		size_t size;
   310		void *addr;
   311	
   312		for (i = 0; i < head->count; i++) {
   313			if (!ubuf->pdev) {
   314				pdev = pci_get_domain_bus_and_slot(0,
   315							PCI_BUS_NUM(list[i].devid),
   316							list[i].devid & 0xff);
   317				if (!pdev) {
   318					ret = -ENODEV;
   319					goto err;
   320				}
   321	
   322				ubuf->pdev = pdev;
   323			}
   324	
   325			bar_size = pci_resource_len(pdev, list[i].bar);
   326			if (list[i].offset > bar_size ||
   327			    list[i].offset + list[i].size > bar_size) {
   328				ret = -EINVAL;
   329				goto err;
   330			}
   331	
   332			ret = pci_p2pdma_add_resource(pdev,
   333						      list[i].bar,
   334						      list[i].size,
   335						      list[i].offset);
   336			if (ret)
   337				goto err;
   338	
   339			addr = pci_alloc_p2pmem(pdev, list[i].size);
   340			if (!addr) {
   341				ret = -EINVAL;
   342				goto err;
   343			}
   344	
   345			size = 0;
   346			while (size < list[i].size) {
 > 347				page = virt_to_page((unsigned long)addr + size);
   348				ubuf->pages[pgbuf++] = page;
   349	
   350				size += PAGE_SIZE;
   351			}
   352		}
   353	
   354	err:
   355		while (pgbuf > 0 && ubuf->pages[--pgbuf])
   356			pci_free_p2pmem(pdev,
   357					page_to_virt(ubuf->pages[pgbuf]),
   358					PAGE_SIZE);
   359		if (pdev)
   360			pci_dev_put(pdev);
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
