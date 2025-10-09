Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225351E1DE5;
	Thu,  9 Oct 2025 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760038239; cv=none; b=LaejTM+W2RGJ2jZGX2ukx+kbKmTDdsieRes6v/Zp6R1TewIBlsQH+LtqHMdbFow5hs5nTOiBUP7/6sbR7kvnZQsNAKUzvVdWmLpQvCe88STCB4FbWxyRk4FKp7T3Z5GV/6ZVGXBp+11EB1C65Y1t0ZxGbldylLTfTOfNpQG/XUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760038239; c=relaxed/simple;
	bh=wTRw5dAJte414ociQsKmjOaMUKC9Dh55NIyY0qGunpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NbkTD/lF+XCgitK+si1NM5E6RjdPopDQib2hpV9cr7SomlrVyqczZ15Ks+OeVVw20NtRqYl9GupWqzAZpe+oVLB+WKd7qElePJcxN/EG8evGJv1Qt48DZvUPUMCx46KGKjF4wtA6dBve1Z9hpuTLbnAGf4EUl6MXFv/9RPK/ct8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXY4QLAk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXY4QLAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760038234; x=1791574234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wTRw5dAJte414ociQsKmjOaMUKC9Dh55NIyY0qGunpE=;
  b=YXY4QLAkUV0JN2rbEqJ7hQ2Cun0+Vja/ByiNFe/jJ77HAgzsdhYUC7mX
   JLPosYtTorBP8xjFuD4lVbCRpuZ1G5AMzc3Z8UhdLIZNgLa+94jdZdyRY
   zY5D2+PwdwJn9yyy98UZcPPSemw2OMxY78VJrW2dIX0+sBiAWTw6VQOl/
   Tyy43cogMkWxDwYGh8fOhZA5bsRfNrgRpJZdgE/MmKW1Pqus/vvdNJJZZ
   Rv0Vq4WnxU+cVjhv4bJUSehz2OfmhJ32OI21gstPr/KWnYWWYujVF96qr
   IrOMifLZt47NMANtsvJ3xIAEZASpWMIt1l5yoZYAU/fwdSlfLtnwgOJHn
   w==;
X-CSE-ConnectionGUID: QzvVvndHTgyvlSn4WIuENQ==
X-CSE-MsgGUID: cTEuJg7BRCuu5WFsIf2JoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="87718593"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="87718593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 12:30:33 -0700
X-CSE-ConnectionGUID: B7h12RneRSuV5iMc5Ov8UQ==
X-CSE-MsgGUID: IZa++u7gRYuzR0M2B0SiHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="211442276"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 12:30:32 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6wLN-0001Ix-2n;
	Thu, 09 Oct 2025 19:30:29 +0000
Date: Fri, 10 Oct 2025 03:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Keith Busch <kbusch@kernel.org>
Subject: [leon-rdma:dmabuf-vfio 3/27] block/blk-mq-dma.c:199:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202510100336.KqcGJyix-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   f7fc6a9789d546e210a6a6098617785b1c5994a6
commit: 9844a76c1fd47c3f0698731b528eb9a35e62fde6 [3/27] block-dma: properly take MMIO path
config: s390-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100336.KqcGJyix-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100336.KqcGJyix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100336.KqcGJyix-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-dma.c:199:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     199 |         case PCI_P2PDMA_MAP_NONE:
         |         ^
   block/blk-mq-dma.c:199:2: note: insert 'break;' to avoid fall-through
     199 |         case PCI_P2PDMA_MAP_NONE:
         |         ^
         |         break; 
   1 warning generated.


vim +199 block/blk-mq-dma.c

dae75dead2359e Keith Busch       2025-08-13  165  
e2be2ba6d27d5c Keith Busch       2025-08-13  166  static bool blk_dma_map_iter_start(struct request *req, struct device *dma_dev,
e2be2ba6d27d5c Keith Busch       2025-08-13  167  		struct dma_iova_state *state, struct blk_dma_iter *iter,
e2be2ba6d27d5c Keith Busch       2025-08-13  168  		unsigned int total_len)
858299dc616036 Christoph Hellwig 2025-06-25  169  {
858299dc616036 Christoph Hellwig 2025-06-25  170  	struct phys_vec vec;
858299dc616036 Christoph Hellwig 2025-06-25  171  
858299dc616036 Christoph Hellwig 2025-06-25  172  	memset(&iter->p2pdma, 0, sizeof(iter->p2pdma));
858299dc616036 Christoph Hellwig 2025-06-25  173  	iter->status = BLK_STS_OK;
858299dc616036 Christoph Hellwig 2025-06-25  174  
858299dc616036 Christoph Hellwig 2025-06-25  175  	/*
858299dc616036 Christoph Hellwig 2025-06-25  176  	 * Grab the first segment ASAP because we'll need it to check for P2P
858299dc616036 Christoph Hellwig 2025-06-25  177  	 * transfers.
858299dc616036 Christoph Hellwig 2025-06-25  178  	 */
858299dc616036 Christoph Hellwig 2025-06-25  179  	if (!blk_map_iter_next(req, &iter->iter, &vec))
858299dc616036 Christoph Hellwig 2025-06-25  180  		return false;
858299dc616036 Christoph Hellwig 2025-06-25  181  
858299dc616036 Christoph Hellwig 2025-06-25  182  	switch (pci_p2pdma_state(&iter->p2pdma, dma_dev,
858299dc616036 Christoph Hellwig 2025-06-25  183  				 phys_to_page(vec.paddr))) {
858299dc616036 Christoph Hellwig 2025-06-25  184  	case PCI_P2PDMA_MAP_BUS_ADDR:
d57447ffb5fadf Keith Busch       2025-09-03  185  		if (iter->iter.is_integrity)
d57447ffb5fadf Keith Busch       2025-09-03  186  			bio_integrity(req->bio)->bip_flags |= BIP_P2P_DMA;
d57447ffb5fadf Keith Busch       2025-09-03  187  		else
d57447ffb5fadf Keith Busch       2025-09-03  188  			req->cmd_flags |= REQ_P2PDMA;
858299dc616036 Christoph Hellwig 2025-06-25  189  		return blk_dma_map_bus(iter, &vec);
858299dc616036 Christoph Hellwig 2025-06-25  190  	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
858299dc616036 Christoph Hellwig 2025-06-25  191  		/*
858299dc616036 Christoph Hellwig 2025-06-25  192  		 * P2P transfers through the host bridge are treated the
858299dc616036 Christoph Hellwig 2025-06-25  193  		 * same as non-P2P transfers below and during unmap.
858299dc616036 Christoph Hellwig 2025-06-25  194  		 */
9844a76c1fd47c Leon Romanovsky   2025-08-03  195  		if (iter->iter.is_integrity)
9844a76c1fd47c Leon Romanovsky   2025-08-03  196  			bio_integrity(req->bio)->bip_flags |= BIP_MMIO;
9844a76c1fd47c Leon Romanovsky   2025-08-03  197  		else
9844a76c1fd47c Leon Romanovsky   2025-08-03  198  			req->cmd_flags |= REQ_MMIO;
7092639031a1bd Keith Busch       2025-08-13 @199  	case PCI_P2PDMA_MAP_NONE:
858299dc616036 Christoph Hellwig 2025-06-25  200  		break;
858299dc616036 Christoph Hellwig 2025-06-25  201  	default:
858299dc616036 Christoph Hellwig 2025-06-25  202  		iter->status = BLK_STS_INVAL;
858299dc616036 Christoph Hellwig 2025-06-25  203  		return false;
858299dc616036 Christoph Hellwig 2025-06-25  204  	}
858299dc616036 Christoph Hellwig 2025-06-25  205  
858299dc616036 Christoph Hellwig 2025-06-25  206  	if (blk_can_dma_map_iova(req, dma_dev) &&
858299dc616036 Christoph Hellwig 2025-06-25  207  	    dma_iova_try_alloc(dma_dev, state, vec.paddr, total_len))
858299dc616036 Christoph Hellwig 2025-06-25  208  		return blk_rq_dma_map_iova(req, dma_dev, state, iter, &vec);
858299dc616036 Christoph Hellwig 2025-06-25  209  	return blk_dma_map_direct(req, dma_dev, iter, &vec);
858299dc616036 Christoph Hellwig 2025-06-25  210  }
e2be2ba6d27d5c Keith Busch       2025-08-13  211  

:::::: The code at line 199 was first introduced by commit
:::::: 7092639031a1bd5320ab827e8f665350f332b7ce blk-mq: remove REQ_P2PDMA flag

:::::: TO: Keith Busch <kbusch@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
