Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E0BE4D;
	Fri,  3 May 2024 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714697354; cv=none; b=t4iVmBse1uZM+HRP58HhiumyFzSfRX0cxXD2XBlmte0aWw/99tr4vXnV0kjDWOTyuRe9FlRw4WrynZsv3HxfsdnnbDPA6xJyMolGvuVsI2/4zZKBQyMAm2UN8wnBnicn15P94Fl6p73jMWYeFFROKVXoOUhrx3hRnizz0okGOFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714697354; c=relaxed/simple;
	bh=e8gv3W/Brx3HvAKKZaondDw3R2sPm/HrLFuXQ3joDqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wv98fg/jOgbzJh+/jCsavTJ5EiQFXlM4CMDU/OIxiAZz3bg8YqMHFxLz1R9+kb872hwhukNugkoQ7ntyIcyDwCDTJ0gjrJOP/4/DpBiXvmbViL3phAQKL5uiPhd+hR/I+MuF/sdifS+cQ/65vZMA2MowOk+VzLHukMulc/mwW4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKRDgYTs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKRDgYTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714697353; x=1746233353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8gv3W/Brx3HvAKKZaondDw3R2sPm/HrLFuXQ3joDqM=;
  b=fKRDgYTsnHDWYhiJKaTDLQYrg9NKzHCedE5AUOtKFx05Cxp6IgjswIXP
   QpVym380r6fjtLE5G3rT3p/72bH6Yam3pQwZCmQcxEjVcMQIvxuJ5VKoS
   cWr544kZEKMUZpjswoOrmRdKltXw2dVcU6Ti/bMvSAQymz9Opdjobn/rc
   1MUyYlgp8BJRWBxLcyoZ3k+KfqSXO24rawjAWYshv/20nFNxXFHUdclmP
   KY5nq7n6E2R1/zO8DJWDocLQxaMDEPcCihvDU0ZwGYdayFJ1tN3d27jXj
   AR49qCb0ehbAXsjIEOwf7k1hofKDcptsKnvqoNEoz0gd/2I1Bx7oEDKQF
   Q==;
X-CSE-ConnectionGUID: FgQv5vloRRC/riJ2c9igWA==
X-CSE-MsgGUID: v8J+EM3MTMWCxdcKvaYCZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="13446938"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="13446938"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 17:49:10 -0700
X-CSE-ConnectionGUID: 498PzvFOSFWJVfw1VwK/kw==
X-CSE-MsgGUID: izzd4mpYTfWmrhlpzTqUFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="32112566"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 May 2024 17:49:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2h6n-000BBe-0y;
	Fri, 03 May 2024 00:49:05 +0000
Date: Fri, 3 May 2024 08:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 5/17] include/linux/dma-mapping.h:371:9:
 warning: implicit conversion from 'dma_addr_t' (aka 'unsigned long long') to
 'int' changes value from 18446744073709551615 to -1
Message-ID: <202405030826.HgwAbh1S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   9da240ed50fabf3d371ed059aff21c206982f722
commit: a086d6de4fdb629b97a02c3b03fcd64d6074e2ba [5/17] dma-mapping: implement link range API
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240503/202405030826.HgwAbh1S-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030826.HgwAbh1S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405030826.HgwAbh1S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from fs/namei.c:41:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
>> include/linux/dma-mapping.h:371:9: warning: implicit conversion from 'dma_addr_t' (aka 'unsigned long long') to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     371 |         return DMA_MAPPING_ERROR;
         |         ~~~~~~ ^~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:29: note: expanded from macro 'DMA_MAPPING_ERROR'
      76 | #define DMA_MAPPING_ERROR               (~(dma_addr_t)0)
         |                                          ^~~~~~~~~~~~~~
   13 warnings generated.
--
   In file included from fs/select.c:22:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/select.c:22:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/select.c:22:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
>> include/linux/dma-mapping.h:371:9: warning: implicit conversion from 'dma_addr_t' (aka 'unsigned long long') to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     371 |         return DMA_MAPPING_ERROR;
         |         ~~~~~~ ^~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:29: note: expanded from macro 'DMA_MAPPING_ERROR'
      76 | #define DMA_MAPPING_ERROR               (~(dma_addr_t)0)
         |                                          ^~~~~~~~~~~~~~
   fs/select.c:974:12: warning: stack frame size (1064) exceeds limit (1024) in 'do_sys_poll' [-Wframe-larger-than]
     974 | static int do_sys_poll(struct pollfd __user *ufds, unsigned int nfds,
         |            ^
   14 warnings generated.


vim +371 include/linux/dma-mapping.h

   138	
   139	dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
   140			size_t offset, size_t size, enum dma_data_direction dir,
   141			unsigned long attrs);
   142	void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
   143			enum dma_data_direction dir, unsigned long attrs);
   144	unsigned int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
   145			int nents, enum dma_data_direction dir, unsigned long attrs);
   146	void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
   147					      int nents, enum dma_data_direction dir,
   148					      unsigned long attrs);
   149	int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
   150			enum dma_data_direction dir, unsigned long attrs);
   151	dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
   152			size_t size, enum dma_data_direction dir, unsigned long attrs);
   153	void dma_unmap_resource(struct device *dev, dma_addr_t addr, size_t size,
   154			enum dma_data_direction dir, unsigned long attrs);
   155	void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr, size_t size,
   156			enum dma_data_direction dir);
   157	void dma_sync_single_for_device(struct device *dev, dma_addr_t addr,
   158			size_t size, enum dma_data_direction dir);
   159	void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
   160			    int nelems, enum dma_data_direction dir);
   161	void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
   162			       int nelems, enum dma_data_direction dir);
   163	void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
   164			gfp_t flag, unsigned long attrs);
   165	void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
   166			dma_addr_t dma_handle, unsigned long attrs);
   167	void *dmam_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
   168			gfp_t gfp, unsigned long attrs);
   169	void dmam_free_coherent(struct device *dev, size_t size, void *vaddr,
   170			dma_addr_t dma_handle);
   171	int dma_get_sgtable_attrs(struct device *dev, struct sg_table *sgt,
   172			void *cpu_addr, dma_addr_t dma_addr, size_t size,
   173			unsigned long attrs);
   174	int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
   175			void *cpu_addr, dma_addr_t dma_addr, size_t size,
   176			unsigned long attrs);
   177	bool dma_can_mmap(struct device *dev);
   178	bool dma_pci_p2pdma_supported(struct device *dev);
   179	int dma_set_mask(struct device *dev, u64 mask);
   180	int dma_set_coherent_mask(struct device *dev, u64 mask);
   181	u64 dma_get_required_mask(struct device *dev);
   182	bool dma_addressing_limited(struct device *dev);
   183	size_t dma_max_mapping_size(struct device *dev);
   184	size_t dma_opt_mapping_size(struct device *dev);
   185	bool dma_need_sync(struct device *dev, dma_addr_t dma_addr);
   186	unsigned long dma_get_merge_boundary(struct device *dev);
   187	struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
   188			enum dma_data_direction dir, gfp_t gfp, unsigned long attrs);
   189	void dma_free_noncontiguous(struct device *dev, size_t size,
   190			struct sg_table *sgt, enum dma_data_direction dir);
   191	void *dma_vmap_noncontiguous(struct device *dev, size_t size,
   192			struct sg_table *sgt);
   193	void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
   194	int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
   195			size_t size, struct sg_table *sgt);
   196	
   197	void dma_get_memory_type(struct page *page, struct dma_memory_type *type);
   198	bool dma_can_use_iova(struct dma_iova_state *state, size_t size);
   199	int dma_start_range(struct dma_iova_state *state);
   200	void dma_end_range(struct dma_iova_state *state);
   201	dma_addr_t dma_link_range(struct dma_iova_state *state, phys_addr_t phys,
   202				  size_t size);
   203	void dma_unlink_range(struct dma_iova_state *state);
   204	#else /* CONFIG_HAS_DMA */
   205	static inline int dma_alloc_iova(struct dma_iova_attrs *iova)
   206	{
   207		return -EOPNOTSUPP;
   208	}
   209	static inline void dma_free_iova(struct dma_iova_attrs *iova)
   210	{
   211	}
   212	static inline dma_addr_t dma_map_page_attrs(struct device *dev,
   213			struct page *page, size_t offset, size_t size,
   214			enum dma_data_direction dir, unsigned long attrs)
   215	{
   216		return DMA_MAPPING_ERROR;
   217	}
   218	static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
   219			size_t size, enum dma_data_direction dir, unsigned long attrs)
   220	{
   221	}
   222	static inline unsigned int dma_map_sg_attrs(struct device *dev,
   223			struct scatterlist *sg, int nents, enum dma_data_direction dir,
   224			unsigned long attrs)
   225	{
   226		return 0;
   227	}
   228	static inline void dma_unmap_sg_attrs(struct device *dev,
   229			struct scatterlist *sg, int nents, enum dma_data_direction dir,
   230			unsigned long attrs)
   231	{
   232	}
   233	static inline int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
   234			enum dma_data_direction dir, unsigned long attrs)
   235	{
   236		return -EOPNOTSUPP;
   237	}
   238	static inline dma_addr_t dma_map_resource(struct device *dev,
   239			phys_addr_t phys_addr, size_t size, enum dma_data_direction dir,
   240			unsigned long attrs)
   241	{
   242		return DMA_MAPPING_ERROR;
   243	}
   244	static inline void dma_unmap_resource(struct device *dev, dma_addr_t addr,
   245			size_t size, enum dma_data_direction dir, unsigned long attrs)
   246	{
   247	}
   248	static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
   249			size_t size, enum dma_data_direction dir)
   250	{
   251	}
   252	static inline void dma_sync_single_for_device(struct device *dev,
   253			dma_addr_t addr, size_t size, enum dma_data_direction dir)
   254	{
   255	}
   256	static inline void dma_sync_sg_for_cpu(struct device *dev,
   257			struct scatterlist *sg, int nelems, enum dma_data_direction dir)
   258	{
   259	}
   260	static inline void dma_sync_sg_for_device(struct device *dev,
   261			struct scatterlist *sg, int nelems, enum dma_data_direction dir)
   262	{
   263	}
   264	static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
   265	{
   266		return -ENOMEM;
   267	}
   268	static inline void *dma_alloc_attrs(struct device *dev, size_t size,
   269			dma_addr_t *dma_handle, gfp_t flag, unsigned long attrs)
   270	{
   271		return NULL;
   272	}
   273	static void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
   274			dma_addr_t dma_handle, unsigned long attrs)
   275	{
   276	}
   277	static inline void *dmam_alloc_attrs(struct device *dev, size_t size,
   278			dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
   279	{
   280		return NULL;
   281	}
   282	static inline void dmam_free_coherent(struct device *dev, size_t size,
   283			void *vaddr, dma_addr_t dma_handle)
   284	{
   285	}
   286	static inline int dma_get_sgtable_attrs(struct device *dev,
   287			struct sg_table *sgt, void *cpu_addr, dma_addr_t dma_addr,
   288			size_t size, unsigned long attrs)
   289	{
   290		return -ENXIO;
   291	}
   292	static inline int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
   293			void *cpu_addr, dma_addr_t dma_addr, size_t size,
   294			unsigned long attrs)
   295	{
   296		return -ENXIO;
   297	}
   298	static inline bool dma_can_mmap(struct device *dev)
   299	{
   300		return false;
   301	}
   302	static inline bool dma_pci_p2pdma_supported(struct device *dev)
   303	{
   304		return false;
   305	}
   306	static inline int dma_set_mask(struct device *dev, u64 mask)
   307	{
   308		return -EIO;
   309	}
   310	static inline int dma_set_coherent_mask(struct device *dev, u64 mask)
   311	{
   312		return -EIO;
   313	}
   314	static inline u64 dma_get_required_mask(struct device *dev)
   315	{
   316		return 0;
   317	}
   318	static inline bool dma_addressing_limited(struct device *dev)
   319	{
   320		return false;
   321	}
   322	static inline size_t dma_max_mapping_size(struct device *dev)
   323	{
   324		return 0;
   325	}
   326	static inline size_t dma_opt_mapping_size(struct device *dev)
   327	{
   328		return 0;
   329	}
   330	static inline bool dma_need_sync(struct device *dev, dma_addr_t dma_addr)
   331	{
   332		return false;
   333	}
   334	static inline unsigned long dma_get_merge_boundary(struct device *dev)
   335	{
   336		return 0;
   337	}
   338	static inline struct sg_table *dma_alloc_noncontiguous(struct device *dev,
   339			size_t size, enum dma_data_direction dir, gfp_t gfp,
   340			unsigned long attrs)
   341	{
   342		return NULL;
   343	}
   344	static inline void dma_free_noncontiguous(struct device *dev, size_t size,
   345			struct sg_table *sgt, enum dma_data_direction dir)
   346	{
   347	}
   348	static inline void *dma_vmap_noncontiguous(struct device *dev, size_t size,
   349			struct sg_table *sgt)
   350	{
   351		return NULL;
   352	}
   353	static inline void dma_vunmap_noncontiguous(struct device *dev, void *vaddr)
   354	{
   355	}
   356	static inline int dma_mmap_noncontiguous(struct device *dev,
   357			struct vm_area_struct *vma, size_t size, struct sg_table *sgt)
   358	{
   359		return -EINVAL;
   360	}
   361	static inline void dma_get_memory_type(struct page *page,
   362					       struct dma_memory_type *type)
   363	{
   364	}
   365	static inline bool dma_can_use_iova(struct dma_iova_state *state, size_t size)
   366	{
   367		return false;
   368	}
   369	static inline int dma_start_range(struct dma_iova_state *state)
   370	{
 > 371		return DMA_MAPPING_ERROR;
   372	}
   373	static inline void dma_end_range(struct dma_iova_state *state)
   374	{
   375	}
   376	static inline dma_addr_t dma_link_range(struct dma_iova_state *state,
   377						phys_addr_t phys, size_t size)
   378	{
   379		return DMA_MAPPING_ERROR;
   380	}
   381	static inline void dma_unlink_range(struct dma_iova_state *state)
   382	{
   383	}
   384	#endif /* CONFIG_HAS_DMA */
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
