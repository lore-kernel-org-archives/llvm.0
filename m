Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376841C4A24;
	Tue, 24 Dec 2024 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735060464; cv=none; b=MemEFgqoAs/j3mNiqTqOyub8oYNTiuaW2mRR0N3eYFZMUL70dqNfs6aXXBtPTj96v9ZGdPa6jeVqRCgu/OwC/hVjnSrZxTYfZoOacjpN1/FQr0zKHXM6hsf5e1dwY/6mLZhPen21pBwpfVsC/vNGraVCiOVlCfq2FjDgfahl41w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735060464; c=relaxed/simple;
	bh=Yojp5uCv90zfCQ+TejW3fszYK5JErgu4yHk4Qa8r89A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h2XDeuYIxIFGAJrKRpumhDBdLMQNB4NcDPZpBCAoPPKs1sDXsYpZ6TyatxDctp+ljaMFf/XEHQSOi8phF6wfgr9A+G73FHL9S9VBTzpzt6XLp73HGWQOgd71PMoU7lVaeRg1VsLDm/4rA0tOuehHKilTgRjRcFZycPEzzt507XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pp5YKvxN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pp5YKvxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735060462; x=1766596462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yojp5uCv90zfCQ+TejW3fszYK5JErgu4yHk4Qa8r89A=;
  b=Pp5YKvxNukoTsADo7vVWlpj7pvxXJzO55t+31NrB+ho89JEnPJ/aVKqc
   6AyeKimZYMfEeYKICfChaifZhWxDtuYXriPvObFBqNe3Eo88rbcl/807C
   uaHFM0baTFRgbLphh69/jcFz/bvBNgRtXt7YGSUijZ2XMpoPyRJ2QZtpC
   PuxKbfEt2wV51AthV7tfQOlTV7ssBlk9z10vKrDaBEEiJtOChpy7ifpy+
   2dMiRorYhOyGveqSyPLZo7OXoSAWtClffEzPLFcBEEsj+IHWM/FnSHDur
   Sur09DhfTJWSZrmyXvmjUAHcZTDM6jnJ1ljaSvpkFl1xd3U6SLib8uxGU
   g==;
X-CSE-ConnectionGUID: 9sN6Sjo/QqSlgx5kh8ZH4Q==
X-CSE-MsgGUID: aftdx3rrR3K5D02kufa1Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46129471"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="46129471"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 09:14:21 -0800
X-CSE-ConnectionGUID: jp1t1Lz5T6qECyWl29k2Gg==
X-CSE-MsgGUID: 7R5F6c0FTgie59P7wS/0Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="100038843"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Dec 2024 09:14:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ8U6-0001Jp-0k;
	Tue, 24 Dec 2024 17:14:18 +0000
Date: Wed, 25 Dec 2024 01:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yuyu Li <liyuyu6@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>,
	Junxian Huang <huangjunxian6@hisilicon.com>
Subject: [leon-rdma:rdma-next 32/1045]
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:184:23: error: use of
 undeclared identifier 'pvrdma_report_event_handle'
Message-ID: <202412250108.bZPX0cVX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   afe2e50bf66e078829b0b15249542da262a945ed
commit: 6577fade345296c6ed8aa054181c67a05cb135f2 [32/1045] RDMA/pvrdma: Support report_port_event() ops
config: x86_64-buildonly-randconfig-004-20241224 (https://download.01.org/0day-ci/archive/20241225/202412250108.bZPX0cVX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250108.bZPX0cVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250108.bZPX0cVX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:47:
   In file included from include/linux/inetdevice.h:9:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:184:23: error: use of undeclared identifier 'pvrdma_report_event_handle'
     184 |         .report_port_event = pvrdma_report_event_handle,
         |                              ^
   drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:830:46: warning: shift count >= width of type [-Wshift-count-overflow]
     830 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   4 warnings and 1 error generated.


vim +/pvrdma_report_event_handle +184 drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c

   145	
   146	static const struct ib_device_ops pvrdma_dev_ops = {
   147		.owner = THIS_MODULE,
   148		.driver_id = RDMA_DRIVER_VMW_PVRDMA,
   149		.uverbs_abi_ver = PVRDMA_UVERBS_ABI_VERSION,
   150	
   151		.add_gid = pvrdma_add_gid,
   152		.alloc_mr = pvrdma_alloc_mr,
   153		.alloc_pd = pvrdma_alloc_pd,
   154		.alloc_ucontext = pvrdma_alloc_ucontext,
   155		.create_ah = pvrdma_create_ah,
   156		.create_cq = pvrdma_create_cq,
   157		.create_qp = pvrdma_create_qp,
   158		.dealloc_pd = pvrdma_dealloc_pd,
   159		.dealloc_ucontext = pvrdma_dealloc_ucontext,
   160		.del_gid = pvrdma_del_gid,
   161		.dereg_mr = pvrdma_dereg_mr,
   162		.destroy_ah = pvrdma_destroy_ah,
   163		.destroy_cq = pvrdma_destroy_cq,
   164		.destroy_qp = pvrdma_destroy_qp,
   165		.device_group = &pvrdma_attr_group,
   166		.get_dev_fw_str = pvrdma_get_fw_ver_str,
   167		.get_dma_mr = pvrdma_get_dma_mr,
   168		.get_link_layer = pvrdma_port_link_layer,
   169		.get_port_immutable = pvrdma_port_immutable,
   170		.map_mr_sg = pvrdma_map_mr_sg,
   171		.mmap = pvrdma_mmap,
   172		.modify_port = pvrdma_modify_port,
   173		.modify_qp = pvrdma_modify_qp,
   174		.poll_cq = pvrdma_poll_cq,
   175		.post_recv = pvrdma_post_recv,
   176		.post_send = pvrdma_post_send,
   177		.query_device = pvrdma_query_device,
   178		.query_gid = pvrdma_query_gid,
   179		.query_pkey = pvrdma_query_pkey,
   180		.query_port = pvrdma_query_port,
   181		.query_qp = pvrdma_query_qp,
   182		.reg_user_mr = pvrdma_reg_user_mr,
   183		.req_notify_cq = pvrdma_req_notify_cq,
 > 184		.report_port_event = pvrdma_report_event_handle,
   185	
   186		INIT_RDMA_OBJ_SIZE(ib_ah, pvrdma_ah, ibah),
   187		INIT_RDMA_OBJ_SIZE(ib_cq, pvrdma_cq, ibcq),
   188		INIT_RDMA_OBJ_SIZE(ib_pd, pvrdma_pd, ibpd),
   189		INIT_RDMA_OBJ_SIZE(ib_qp, pvrdma_qp, ibqp),
   190		INIT_RDMA_OBJ_SIZE(ib_ucontext, pvrdma_ucontext, ibucontext),
   191	};
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
