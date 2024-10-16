Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A48206059;
	Wed, 16 Oct 2024 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729080384; cv=none; b=h2QFd6zPYGbQOoFrGDt3AazXrKIu5jTDr2hniU46plh6N3WmoD7o+8Ca5YzasOlVTWjN/Xi4rod/5/sMK9HZSGTedUGdWhp6H06FI4wJkZg5/WC0lsNGuHM/nkxX2F6EDUZQ0mBjzLN9KItXIXKlXsJYlKgUFfBG080vFJ390+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729080384; c=relaxed/simple;
	bh=yr131OHwh6p7SKAQDgvSbW6R8Cppve4kOb48UjyIjao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Poc6GeUWtHMVt/6E4AeDt2//8/RTo1TIodHfPSFr18l56T43iVX7eqMqaAoPeyk2j8wl0++Su8qMYR36og7LJqF4JfCtWAP7XYMs9wdEmwmYa66H2HwjMrR6D6k+rAklqfdWRKZi40/FANE9Ej37TCXmZuIhaJBAOwbeVVwQfjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmZASWmC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmZASWmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729080373; x=1760616373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yr131OHwh6p7SKAQDgvSbW6R8Cppve4kOb48UjyIjao=;
  b=WmZASWmCYnsqO4g9egaUfDyfJWrSulCHqr8M2kXPszrYPJfHF732UGHE
   i2NIWDH0AM7poaGsO4h2fNT+F+IuWDVr4rT2GhIVzexUZ2C8vD8vk6xiU
   q+v7XTcpx8lhYsDBaQXlkhvIeKS1DLMcHW9xOHlXLJvLseEWryxymWqoS
   uDPqLEwE3ER/zdurzdilQUlf+w4MGG/CsKaqtJDuXC6zXf3Wi1gJ2dkZd
   9ac3+B6qB4Lt3r9MKsWbeBEnN7hed26ZpkAur1rwqYaflumqcO+LITBX2
   KT8mXfylJsSNKz0/2dp3XL4/Yj/V/JBEePNnMiZokFU8EAMMb+0jBfZYD
   A==;
X-CSE-ConnectionGUID: TfWLn5QWQqC6r3bsfHHgcw==
X-CSE-MsgGUID: hCwYM3sBTeGxKeXa2ZnhiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32442125"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="32442125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 05:06:12 -0700
X-CSE-ConnectionGUID: Pcsrg82oRlGOGHjum8f1xw==
X-CSE-MsgGUID: StjWqrhHT0Ck8nRnWQFrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="77887319"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Oct 2024 05:06:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t12n2-000Kse-1E;
	Wed, 16 Oct 2024 12:06:08 +0000
Date: Wed, 16 Oct 2024 20:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm/prime: introduce DRM_PRIME_FD_TO_HANDLE_NO_MOVE
Message-ID: <202410161956.1kSWZNlc-lkp@intel.com>
References: <20241013133431.1356874-1-contact@emersion.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013133431.1356874-1-contact@emersion.fr>

Hi Simon,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master v6.12-rc3 next-20241016]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Ser/drm-prime-introduce-DRM_PRIME_FD_TO_HANDLE_NO_MOVE/20241013-213609
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241013133431.1356874-1-contact%40emersion.fr
patch subject: [RFC PATCH] drm/prime: introduce DRM_PRIME_FD_TO_HANDLE_NO_MOVE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241016/202410161956.1kSWZNlc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161956.1kSWZNlc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161956.1kSWZNlc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:928:7: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     928 |                 if (DMA_BUF_ATTACH_NO_MOVE &&
         |                     ^
   include/linux/dma-buf.h:602:35: note: expanded from macro 'DMA_BUF_ATTACH_NO_MOVE'
     602 | #define DMA_BUF_ATTACH_NO_MOVE (1 << 0)
         |                                   ^
   1 warning generated.


vim +928 drivers/dma-buf/dma-buf.c

   815	
   816	/**
   817	 * DOC: locking convention
   818	 *
   819	 * In order to avoid deadlock situations between dma-buf exports and importers,
   820	 * all dma-buf API users must follow the common dma-buf locking convention.
   821	 *
   822	 * Convention for importers
   823	 *
   824	 * 1. Importers must hold the dma-buf reservation lock when calling these
   825	 *    functions:
   826	 *
   827	 *     - dma_buf_pin()
   828	 *     - dma_buf_unpin()
   829	 *     - dma_buf_map_attachment()
   830	 *     - dma_buf_unmap_attachment()
   831	 *     - dma_buf_vmap()
   832	 *     - dma_buf_vunmap()
   833	 *
   834	 * 2. Importers must not hold the dma-buf reservation lock when calling these
   835	 *    functions:
   836	 *
   837	 *     - dma_buf_attach()
   838	 *     - dma_buf_dynamic_attach()
   839	 *     - dma_buf_detach()
   840	 *     - dma_buf_export()
   841	 *     - dma_buf_fd()
   842	 *     - dma_buf_get()
   843	 *     - dma_buf_put()
   844	 *     - dma_buf_mmap()
   845	 *     - dma_buf_begin_cpu_access()
   846	 *     - dma_buf_end_cpu_access()
   847	 *     - dma_buf_map_attachment_unlocked()
   848	 *     - dma_buf_unmap_attachment_unlocked()
   849	 *     - dma_buf_vmap_unlocked()
   850	 *     - dma_buf_vunmap_unlocked()
   851	 *
   852	 * Convention for exporters
   853	 *
   854	 * 1. These &dma_buf_ops callbacks are invoked with unlocked dma-buf
   855	 *    reservation and exporter can take the lock:
   856	 *
   857	 *     - &dma_buf_ops.attach()
   858	 *     - &dma_buf_ops.detach()
   859	 *     - &dma_buf_ops.release()
   860	 *     - &dma_buf_ops.begin_cpu_access()
   861	 *     - &dma_buf_ops.end_cpu_access()
   862	 *     - &dma_buf_ops.mmap()
   863	 *
   864	 * 2. These &dma_buf_ops callbacks are invoked with locked dma-buf
   865	 *    reservation and exporter can't take the lock:
   866	 *
   867	 *     - &dma_buf_ops.pin()
   868	 *     - &dma_buf_ops.unpin()
   869	 *     - &dma_buf_ops.map_dma_buf()
   870	 *     - &dma_buf_ops.unmap_dma_buf()
   871	 *     - &dma_buf_ops.vmap()
   872	 *     - &dma_buf_ops.vunmap()
   873	 *
   874	 * 3. Exporters must hold the dma-buf reservation lock when calling these
   875	 *    functions:
   876	 *
   877	 *     - dma_buf_move_notify()
   878	 */
   879	
   880	/**
   881	 * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
   882	 * @dmabuf:		[in]	buffer to attach device to.
   883	 * @dev:		[in]	device to be attached.
   884	 * @importer_ops:	[in]	importer operations for the attachment
   885	 * @importer_priv:	[in]	importer private pointer for the attachment
   886	 *
   887	 * Returns struct dma_buf_attachment pointer for this attachment. Attachments
   888	 * must be cleaned up by calling dma_buf_detach().
   889	 *
   890	 * Optionally this calls &dma_buf_ops.attach to allow device-specific attach
   891	 * functionality.
   892	 *
   893	 * Returns:
   894	 *
   895	 * A pointer to newly created &dma_buf_attachment on success, or a negative
   896	 * error code wrapped into a pointer on failure.
   897	 *
   898	 * Note that this can fail if the backing storage of @dmabuf is in a place not
   899	 * accessible to @dev, and cannot be moved to a more suitable place. This is
   900	 * indicated with the error code -EBUSY.
   901	 */
   902	struct dma_buf_attachment *
   903	dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
   904			       const struct dma_buf_attach_ops *importer_ops,
   905			       void *importer_priv, int flags)
   906	{
   907		struct dma_buf_attachment *attach;
   908		int ret;
   909	
   910		if (WARN_ON(!dmabuf || !dev))
   911			return ERR_PTR(-EINVAL);
   912	
   913		if (WARN_ON(importer_ops && !importer_ops->move_notify))
   914			return ERR_PTR(-EINVAL);
   915	
   916		attach = kzalloc(sizeof(*attach), GFP_KERNEL);
   917		if (!attach)
   918			return ERR_PTR(-ENOMEM);
   919	
   920		attach->dev = dev;
   921		attach->dmabuf = dmabuf;
   922		if (importer_ops)
   923			attach->peer2peer = importer_ops->allow_peer2peer;
   924		attach->importer_ops = importer_ops;
   925		attach->importer_priv = importer_priv;
   926	
   927		if (dmabuf->ops->attach) {
 > 928			if (DMA_BUF_ATTACH_NO_MOVE &&
   929			    (!dmabuf->ops->attach_needs_move ||
   930			      dmabuf->ops->attach_needs_move(dmabuf, attach))) {
   931				ret = -EINVAL;
   932				goto err_attach;
   933			}
   934	
   935			ret = dmabuf->ops->attach(dmabuf, attach);
   936			if (ret)
   937				goto err_attach;
   938		}
   939		dma_resv_lock(dmabuf->resv, NULL);
   940		list_add(&attach->node, &dmabuf->attachments);
   941		dma_resv_unlock(dmabuf->resv);
   942	
   943		/* When either the importer or the exporter can't handle dynamic
   944		 * mappings we cache the mapping here to avoid issues with the
   945		 * reservation object lock.
   946		 */
   947		if (dma_buf_attachment_is_dynamic(attach) !=
   948		    dma_buf_is_dynamic(dmabuf)) {
   949			struct sg_table *sgt;
   950	
   951			dma_resv_lock(attach->dmabuf->resv, NULL);
   952			if (dma_buf_is_dynamic(attach->dmabuf)) {
   953				ret = dmabuf->ops->pin(attach);
   954				if (ret)
   955					goto err_unlock;
   956			}
   957	
   958			sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
   959			if (!sgt)
   960				sgt = ERR_PTR(-ENOMEM);
   961			if (IS_ERR(sgt)) {
   962				ret = PTR_ERR(sgt);
   963				goto err_unpin;
   964			}
   965			dma_resv_unlock(attach->dmabuf->resv);
   966			attach->sgt = sgt;
   967			attach->dir = DMA_BIDIRECTIONAL;
   968		}
   969	
   970		return attach;
   971	
   972	err_attach:
   973		kfree(attach);
   974		return ERR_PTR(ret);
   975	
   976	err_unpin:
   977		if (dma_buf_is_dynamic(attach->dmabuf))
   978			dmabuf->ops->unpin(attach);
   979	
   980	err_unlock:
   981		dma_resv_unlock(attach->dmabuf->resv);
   982	
   983		dma_buf_detach(dmabuf, attach);
   984		return ERR_PTR(ret);
   985	}
   986	EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);
   987	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
