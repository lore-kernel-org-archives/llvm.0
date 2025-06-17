Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC02DBF60;
	Tue, 17 Jun 2025 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157727; cv=none; b=ObDYFrB7ypnRElSno7cixwTb4CHk0PwPPvYzFgPJI6l9kDTipzmuEg6F0zuqWAoqDsuPo46xmn7imyPyBShaGrl9eHa01PLs/EU1r4iLBQysgf7/W2U47KbXaqSXfE4Q4IVyBzvM7KPWXDPGUDRIWOZxL1W1SXqmy5ujUNmmf34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157727; c=relaxed/simple;
	bh=DcGs6xIsMTM66l3iSmYomInS4AfCgNyt+tl2U8Y1BRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oc5Lcnb5SowK4ESZoUvpzOe3uzYAVAgbjZAOyFb7c44Kqyj9d7JV22whhQKOZ3xMeOPGm/zJiVre3Bv3HZdGk52Z0Yi1pqolMNpRigpfHcDkPXPLcgq9ggqpzqLlX9rbXMTXyzSmvRwyKfxDGk2tGkx46SP5tS9SF46SiWdmco8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqCAfpCj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqCAfpCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750157725; x=1781693725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DcGs6xIsMTM66l3iSmYomInS4AfCgNyt+tl2U8Y1BRU=;
  b=eqCAfpCjdVNe08a7ZVhScCxuEPPlUlxkHl2vCmlYvjRKqVCxqBchlrwm
   AX9rDM4n79saJy8R8tQg6UuYsLldohCFFYCPB11mcdWHxF4yCtzqd3Omb
   CDeRE6yd4Iy8iSKv2/KI3IIf9Mnky+ueo6B7j4vRmy0jzi+cxYbl6VJqr
   38/MPjCmWeJsWI/p70HIZMZH9PAHcwCor+i1J/9MJw8BQ7ApJuGPmYqAo
   eY9oK5q/AVVc330gHhe8nReON0+5D5FNFXtuA+yqLKbf30NBZKw33MSiq
   P49odr9Ka7xJPeLcMfpi5HQYLU1/uS8+FNAUo2L8U3T0M23NhbtQ9oz5t
   Q==;
X-CSE-ConnectionGUID: baqVd1P6QSqpgMHM/gUHYQ==
X-CSE-MsgGUID: fLVIKMthTCWLKNr0peGQbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54943299"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="54943299"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 03:55:21 -0700
X-CSE-ConnectionGUID: 3jnRWxteQ8KNM03RtZyX0g==
X-CSE-MsgGUID: 2pHAXw8tQAuSrhhICp+hKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149109949"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jun 2025 03:55:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRTyG-000FuA-2s;
	Tue, 17 Jun 2025 10:55:16 +0000
Date: Tue, 17 Jun 2025 18:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Stephen Bates <sbates@raithlin.com>
Subject: [sbates130272-p2pmem:dev/amd-dma-buf 4/4]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:402:5: warning: format specifies
 type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202506171832.9tEmIvR1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sbates130272/linux-p2pmem.git dev/amd-dma-buf
head:   9dd4127ada3f673941734289f7a8a949e16332d8
commit: 9dd4127ada3f673941734289f7a8a949e16332d8 [4/4] drm/amdgpu: Use MEMORY_DEVICE_PCI_P2PDMA pages
config: arm-randconfig-004-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171832.9tEmIvR1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171832.9tEmIvR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171832.9tEmIvR1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:402:5: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     401 |                 dev_info(amdgpu_ttm_adev(bo->tbo.bdev)->dev, "DMA-BUF bo->tbo.base.size:%lx\n",
         |                                                                                         ~~~
         |                                                                                         %zx
     402 |                          bo->tbo.base.size);
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +402 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c

   345	
   346	static int amdgpu_rw_file(struct dma_buf *dmabuf, bool is_read,
   347	                          bool direct_io, struct file *filp, loff_t file_offset,
   348	                          size_t buf_offset, size_t len)
   349	{
   350		struct sg_table *sgt;
   351		struct dma_buf_attachment attach;
   352		struct dma_buf_attach_ops ops;
   353		struct amdgpu_bo *bo;
   354	
   355		struct bio_vec *bvec;
   356		int nr_segs = 0;
   357		struct iov_iter iter;
   358		struct kiocb kiocb;
   359		int ret = 0;
   360		struct pci_dev *pdev;
   361	
   362		printk(KERN_INFO "is_read = %d!\n", is_read);
   363		printk(KERN_INFO "file_offset = %lld!\n", file_offset);
   364		printk(KERN_INFO "buf_offset = %zd!\n", buf_offset);
   365		printk(KERN_INFO "len = %zd!\n", len);
   366	
   367		if (direct_io) {
   368			if (!(filp->f_mode & FMODE_CAN_ODIRECT))
   369				return -EINVAL;
   370		}
   371	
   372		memset(&attach, 0, sizeof(attach));
   373		ops.allow_peer2peer = true;
   374		attach.dmabuf = dmabuf;
   375		attach.peer2peer = true;
   376		attach.importer_ops = &ops;
   377		/*
   378		 * SUPER HACK. Need to find the correct way to locate the
   379		 * DMA-capable parent of file based on either struct file or the
   380		 * file descriptor.
   381		*/
   382		attach.dev = filp->f_path.mnt->mnt_sb->s_bdev->bd_device.parent->parent;
   383		if (!attach.dev->dma_mask) {
   384			/* The above hack didn't work. So hard code it for now */
   385			pdev = pci_get_domain_bus_and_slot(0, 0x41, PCI_DEVFN(0, 0));
   386			attach.dev = &pdev->dev;
   387		}
   388	
   389		sgt = dma_buf_map_attachment_unlocked(&attach, DMA_BIDIRECTIONAL);
   390		if (IS_ERR(sgt)) {
   391			ret = PTR_ERR(sgt);
   392			goto out;
   393		}
   394	
   395		bo = gem_to_amdgpu_bo(dmabuf->priv);
   396		if (!bo) {
   397			ret = -EINVAL;
   398			goto out;
   399		} else {
   400			/* Show BO domain to cross-check if it is in VRAM */
   401			dev_info(amdgpu_ttm_adev(bo->tbo.bdev)->dev, "DMA-BUF bo->tbo.base.size:%lx\n",
 > 402				 bo->tbo.base.size);
   403			dev_info(amdgpu_ttm_adev(bo->tbo.bdev)->dev, "mem_type:%x start:%lx size:%zx placement:%x\n",
   404				 bo->tbo.resource->mem_type, bo->tbo.resource->start,
   405				 bo->tbo.resource->size, bo->tbo.resource->placement);
   406		}
   407	
   408		if (pci_p2pdma_distance(pdev, amdgpu_ttm_adev(bo->tbo.bdev)->dev, false) < 0) {
   409			dev_info(amdgpu_ttm_adev(bo->tbo.bdev)->dev,
   410				 "DMA-BUF p2p not accessible!\n");
   411			ret = -ENODEV;
   412			goto out;
   413		}
   414	
   415		bvec = amdgpu_init_bvec(sgt, buf_offset, len, &nr_segs);
   416		if (!bvec) {
   417			ret = -ENOMEM;
   418			goto out;
   419		}
   420	
   421		iov_iter_bvec(&iter, is_read ? ITER_DEST : ITER_SOURCE, bvec, nr_segs, len);
   422		init_sync_kiocb(&kiocb, filp);
   423		kiocb.ki_pos = file_offset;
   424		if (direct_io)
   425			kiocb.ki_flags |= IOCB_DIRECT;
   426	
   427		while (kiocb.ki_pos < file_offset + len) {
   428	
   429			if (is_read)
   430				ret = vfs_iocb_iter_read(filp, &kiocb, &iter);
   431			else
   432				ret = vfs_iocb_iter_write(filp, &kiocb, &iter);
   433			if (ret <= 0)
   434				break;
   435		}
   436	
   437		kvfree(bvec);
   438		dma_buf_unmap_attachment_unlocked(&attach, sgt,
   439					 DMA_BIDIRECTIONAL);
   440	out:
   441		return ret < 0 ? ret : 0;
   442	}
   443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
