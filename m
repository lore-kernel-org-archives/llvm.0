Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6551B4223;
	Mon, 12 Jan 2026 04:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768190699; cv=none; b=e4Wj5UlTNWZL27+2Sttixmyu5MWKIt0J6vjK/dv4cCklvV36foP1MfmOS16MgLFdkBZdYqe1+qOSqA1VTpUEgrYOAo9qp64v4LVmme7+Qw1r2ta5EmNMVNKVAZ5WBN/N+tVicCK08/X/3PUAbrXHDicsHPNUHUbd6RWhd2wL+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768190699; c=relaxed/simple;
	bh=nobKRwxVgMWgBjdLoVjmDjhxZXi9yTdtiAgAN804SFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIcquUecKOh/ijbSnku3FxQmkrx9jWMKfK6PwzCotl4XvzIrDMPykvjESAtGWzUT9MduZKa9dYD3ODi41I1pLmEFPY5CCLTgccKngdgQFcvR7ZCARttP5VptEs4hD5xPIWlZ/bksDrNxn4uF6DRelAEA/I4BBAJKFvaj7gUf9II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IunrcjUH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IunrcjUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768190697; x=1799726697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nobKRwxVgMWgBjdLoVjmDjhxZXi9yTdtiAgAN804SFE=;
  b=IunrcjUHg69++CLL2b46YHlpY1vSHKR57CpTDEVIuxsFuRfNHokcG8gt
   YJ/uAd2HV4HIHV+UXNuq6hcF0hUbeCnRA1Eqt+vYnw0/qwhI76ih08UhI
   hWHTvqM2gBPtjYVtubwK1Jd8dzYyE1KtvkNalc82gYmEqyLHxu0Io5eNA
   i7MG2TCC28QnE4zTWmJFigXs59VSR+/nfS7TvhV5uJVsMSn4mmLabo/Pf
   2fer64saL8QRp+ebaqzIAoSgG60W5o7BgR5IpX2yHMs07vM/YYOhggRMs
   4Jm/VqHVlajloLeGfUTO4XHQZRjde9BRzfzzPbVYNQP1Ojmsgdb5KE1go
   g==;
X-CSE-ConnectionGUID: WTYOjfNcQjiiCkK7U7xKxw==
X-CSE-MsgGUID: kpJ6eDMbRO+srj2aVB9nNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69448508"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69448508"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 20:04:56 -0800
X-CSE-ConnectionGUID: 0gYD4nNUSfKVN5gNJXPAVQ==
X-CSE-MsgGUID: /+SJJSmDSU2VNFpUx2CvjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208130772"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2026 20:04:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf9Ah-00000000Cy0-1Z8u;
	Mon, 12 Jan 2026 04:04:51 +0000
Date: Mon, 12 Jan 2026 12:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
	airlied@redhat.com, kraxel@redhat.com,
	dmitry.osipenko@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, nirmoyd@nvidia.com,
	vivek.kasireddy@intel.com
Subject: Re: [PATCH v7 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Message-ID: <202601121153.7CddhDzp-lkp@intel.com>
References: <20260107182745.229481-3-dongwon.kim@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107182745.229481-3-dongwon.kim@intel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc4 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dongwon-kim-intel-com/drm-virtio-Freeze-and-restore-hooks-to-support-suspend-and-resume/20260108-024124
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260107182745.229481-3-dongwon.kim%40intel.com
patch subject: [PATCH v7 2/3] drm/virtio: Add support for saving and restoring virtio_gpu_objects
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260112/202601121153.7CddhDzp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121153.7CddhDzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121153.7CddhDzp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/virtio/virtgpu_prime.c:291:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     291 |                 DRM_ERROR("no sgt bound to virtio_gpu_object\n");
         |                 ^
   drivers/gpu/drm/virtio/virtgpu_prime.c:299:3: error: call to undeclared function 'DRM_ERROR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     299 |                 DRM_ERROR("failed to allocate ent list\n");
         |                 ^
   2 errors generated.


vim +/DRM_ERROR +291 drivers/gpu/drm/virtio/virtgpu_prime.c

   282	
   283	int virtgpu_dma_buf_obj_resubmit(struct virtio_gpu_device *vgdev,
   284					 struct virtio_gpu_object *bo)
   285	{
   286		struct virtio_gpu_mem_entry *ents;
   287		struct scatterlist *sl;
   288		int i;
   289	
   290		if (!bo->sgt) {
 > 291			DRM_ERROR("no sgt bound to virtio_gpu_object\n");
   292			return -ENOMEM;
   293		}
   294	
   295		ents = kvmalloc_array(bo->sgt->nents,
   296				      sizeof(struct virtio_gpu_mem_entry),
   297				      GFP_KERNEL);
   298		if (!ents) {
   299			DRM_ERROR("failed to allocate ent list\n");
   300			return -ENOMEM;
   301		}
   302	
   303		for_each_sgtable_dma_sg(bo->sgt, sl, i) {
   304			ents[i].addr = cpu_to_le64(sg_dma_address(sl));
   305			ents[i].length = cpu_to_le32(sg_dma_len(sl));
   306			ents[i].padding = 0;
   307		}
   308	
   309		virtio_gpu_cmd_resource_create_blob(vgdev, bo, &bo->params,
   310						    ents, bo->sgt->nents);
   311	
   312		return 0;
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
