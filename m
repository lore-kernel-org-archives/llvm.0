Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C29144C67E;
	Thu,  6 Aug 2026 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026136; cv=none; b=F7rXr451eW4DO9NBr7vfprRWIKq9ql20hknhw6iIa2GfvYDkVsDL1DQbeMNvHvuPNu0qjuSWeXMiLSDkVwL/hu/kQ6UGRXkyFsbFOVJSKJpevwVngmUBUjsswW3yC5mMrUw92k//meqlx7D/J5s3Mu9s1kfeyzGeo14rmilqssQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026136; c=relaxed/simple;
	bh=NTE0gQPp841HJZ7ZGXtEj3QFHsDZuWuGfmet1LQrV0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cl045Qw/GwMXA/jyFvVHiX/zZDmlAkE/ycZbMq2sU663XbxM2jabkhBO/VSqwWp8eUOcK6I5sgvLbpZZvf2z1draIM/p/unJh4bRx2a72Y/OV6b974tXSGOZNmqh5oEbEqYHzaLSkeC7oYW58H6ttl/bqDiqQWwg1L00AEv6wtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRANwmsv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRANwmsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026133; x=1817562133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NTE0gQPp841HJZ7ZGXtEj3QFHsDZuWuGfmet1LQrV0s=;
  b=RRANwmsvhAyXeNd9ZqLDYiV9oTG6dzS7YW0jNCcf6xgvOrKE0Bopowwd
   huyNDBLUJfzSTjUawJpIEdRL61BKkO51wnOf6hu8tIJ845gpgnCGldwZ+
   W1FSOFBR0oH5uihkCZ9LzWqJauFPUyWFz1hS7H2g3n1ImAlhmsJ6eODQa
   cObfVAgiYIO7Cy7+YIfH7kqLzxmdNMv7hAAuowcAKxBYBOWPbFM6wDBtZ
   A8B246Rvk/Zv+qeYrkefoqUxtTks7Ds4lwykoSy8Col+I6W/9bJIZwxbN
   XC7CufoTstCJ5FqjTZ6dDMoNy2ZQhNNhE49fBa0lBnIF8arrBMQ36ZJA6
   w==;
X-CSE-ConnectionGUID: 2ZnVkrJETge4Vs5BqhGwRg==
X-CSE-MsgGUID: noQJEFTfRN+lMP7MIFIrBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90439935"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="90439935"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:22:10 -0700
X-CSE-ConnectionGUID: lrDeZggjSKWosppqomCv7A==
X-CSE-MsgGUID: 25J0DZsGSsqGVLp4wDV+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="262196547"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2026 07:22:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wryyz-00000000FI1-2ZLn;
	Thu, 06 Aug 2026 14:22:05 +0000
Date: Thu, 6 Aug 2026 22:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: WenTao Liang <vulab@iscas.ac.cn>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	linux-ntb@googlegroups.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] fix: ntb: perf_copy_chunk: fix tx descriptor and unmap
 kref leak on   dmaengine_submit failure
Message-ID: <202608062211.ndlKUG0U-lkp@intel.com>
References: <20260626153917.53128-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626153917.53128-1-vulab@iscas.ac.cn>

Hi WenTao,

kernel test robot noticed the following build errors:

[auto build test ERROR on jonmason-ntb/ntb-next]
[also build test ERROR on linus/master v7.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/WenTao-Liang/fix-ntb-perf_copy_chunk-fix-tx-descriptor-and-unmap-kref-leak-on-dmaengine_submit-failure/20260806-074331
base:   https://github.com/jonmason/ntb ntb-next
patch link:    https://lore.kernel.org/r/20260626153917.53128-1-vulab%40iscas.ac.cn
patch subject: [PATCH] fix: ntb: perf_copy_chunk: fix tx descriptor and unmap kref leak on   dmaengine_submit failure
config: x86_64-buildonly-randconfig-004-20260806 (https://download.01.org/0day-ci/archive/20260806/202608062211.ndlKUG0U-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608062211.ndlKUG0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608062211.ndlKUG0U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ntb/test/ntb_perf.c:854:2: error: call to undeclared function 'dmaengine_desc_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     854 |         dmaengine_desc_put(tx);
         |         ^
   drivers/ntb/test/ntb_perf.c:854:2: note: did you mean 'dmaengine_desc_free'?
   include/linux/dmaengine.h:1607:19: note: 'dmaengine_desc_free' declared here
    1607 | static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
         |                   ^
   1 error generated.


vim +/dmaengine_desc_put +854 drivers/ntb/test/ntb_perf.c

   784	
   785	static int perf_copy_chunk(struct perf_thread *pthr,
   786				   void __iomem *dst, void *src, size_t len)
   787	{
   788		struct dma_async_tx_descriptor *tx;
   789		struct dmaengine_unmap_data *unmap;
   790		struct device *dma_dev;
   791		int try = 0, ret = 0;
   792		struct perf_peer *peer = pthr->perf->test_peer;
   793		void __iomem *vbase;
   794		void __iomem *dst_vaddr;
   795		dma_addr_t dst_dma_addr;
   796	
   797		if (!use_dma) {
   798			memcpy_toio(dst, src, len);
   799			goto ret_check_tsync;
   800		}
   801	
   802		dma_dev = pthr->dma_chan->device->dev;
   803	
   804		if (!is_dma_copy_aligned(pthr->dma_chan->device, offset_in_page(src),
   805					 offset_in_page(dst), len))
   806			return -EIO;
   807	
   808		vbase = peer->outbuf;
   809		dst_vaddr = dst;
   810		dst_dma_addr = peer->dma_dst_addr + (dst_vaddr - vbase);
   811	
   812		unmap = dmaengine_get_unmap_data(dma_dev, 1, GFP_NOWAIT);
   813		if (!unmap)
   814			return -ENOMEM;
   815	
   816		unmap->len = len;
   817		unmap->addr[0] = dma_map_page(dma_dev, virt_to_page(src),
   818			offset_in_page(src), len, DMA_TO_DEVICE);
   819		if (dma_mapping_error(dma_dev, unmap->addr[0])) {
   820			ret = -EIO;
   821			goto err_free_resource;
   822		}
   823		unmap->to_cnt = 1;
   824	
   825		do {
   826			tx = dmaengine_prep_dma_memcpy(pthr->dma_chan, dst_dma_addr,
   827				unmap->addr[0], len, DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
   828			if (!tx)
   829				msleep(DMA_MDELAY);
   830		} while (!tx && (try++ < DMA_TRIES));
   831	
   832		if (!tx) {
   833			ret = -EIO;
   834			goto err_free_resource;
   835		}
   836	
   837		tx->callback = perf_dma_copy_callback;
   838		tx->callback_param = pthr;
   839		dma_set_unmap(tx, unmap);
   840	
   841		ret = dma_submit_error(dmaengine_submit(tx));
   842		if (ret)
   843			goto err_free_resource;
   844	
   845		dmaengine_unmap_put(unmap);
   846	
   847		atomic_inc(&pthr->dma_sync);
   848		dma_async_issue_pending(pthr->dma_chan);
   849	
   850	ret_check_tsync:
   851		return likely(atomic_read(&pthr->perf->tsync) > 0) ? 0 : -EINTR;
   852	
   853	err_free_resource:
 > 854		dmaengine_desc_put(tx);
   855		dmaengine_unmap_put(unmap);
   856	
   857		return ret;
   858	}
   859	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
