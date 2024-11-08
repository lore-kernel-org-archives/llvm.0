Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1A1AA1D5;
	Fri,  8 Nov 2024 22:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731103346; cv=none; b=N4DU76ITx1x9oo6uACqNihRrghNu4wAbVFgiPjVssSjrFJBtVH42UiCUGijgXv8MLYerHwLzQRQsZ44dg2prsnhiC4GJq4gsgBJHQ3+cTfCPT4aQHwtZj+eowNmv2B93mxBtfhp6pvp6jSY7Cw2mB9TPDbDglIfsh1phaijQ5H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731103346; c=relaxed/simple;
	bh=SBRhSVYfm342YwAvm4PH2PawPdS9ufBUuzTqE34Ij8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMNiHq2gpeLIT2FJ7vDnMvm6nOm4nhrPj2g3OJjeseF+qPYoC5q8w/yxvOizPps6QSMA6CWrKJt0R/0rzi9iBTU63Q0egRcy/x67GPeNKuHo0GXBR2tVagWg4REx+J2Ethg5nfZA5eImcHgW3XK+FZqNufOReMBY8udEXee4aG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HH8LdjDs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HH8LdjDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731103344; x=1762639344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SBRhSVYfm342YwAvm4PH2PawPdS9ufBUuzTqE34Ij8A=;
  b=HH8LdjDslb8Maiy/gPu7Irt3NKiVQ0fy6N3lLTbZI3uynpjSIiTZyZzp
   KtHCy0xcra3gXZwRnZUyBY39NSEJ/lQKZrmvRe+IEV7GIKerNyXPeEeUe
   +DhZ1ReRzEzc3CA7vNPooBNeY2tuomV79fFA6MUYijo7FN4taCAq2kYNv
   gDKwNsNKNNKPtUNjcoKCXzQIByUG9INCt5E39s+i8wAcwTgcNu6nqFKqV
   ynKjaDzrwr9YMFiRberQSi0j0uVrD+eJZqk2hGP9c9gaaxUyaY0YIXIoz
   L7byqMfdLwm8c+IJ6J+VyLXthVF7XoYRYAzJzc5wuJwc9xF6i7sbeUwKA
   Q==;
X-CSE-ConnectionGUID: hP1UASXOT0WrfhRD6Pc0aw==
X-CSE-MsgGUID: 7Uf85v0oQBmviJnuytyC1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="56398640"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="56398640"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 14:02:22 -0800
X-CSE-ConnectionGUID: epwK2O0XTOuRZ+4OeB4wVA==
X-CSE-MsgGUID: lSG9X2V8T0+sf0sbIgaudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="90860564"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2024 14:02:21 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9X3a-000rpd-1v;
	Fri, 08 Nov 2024 22:02:18 +0000
Date: Sat, 9 Nov 2024 06:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/5] vfio-iommufd: Support pasid [at|de]tach for
 physical VFIO devices
Message-ID: <202411090535.ma094bix-lkp@intel.com>
References: <20241108121742.18889-3-yi.l.liu@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108121742.18889-3-yi.l.liu@intel.com>

Hi Yi,

kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on akpm-mm/mm-nonmm-unstable pci/next pci/for-linus linus/master awilliam-vfio/for-linus v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-Liu/ida-Add-ida_find_first_range/20241108-202010
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20241108121742.18889-3-yi.l.liu%40intel.com
patch subject: [PATCH v5 2/5] vfio-iommufd: Support pasid [at|de]tach for physical VFIO devices
config: arm64-randconfig-001-20241109 (https://download.01.org/0day-ci/archive/20241109/202411090535.ma094bix-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090535.ma094bix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090535.ma094bix-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/iommufd.c:134:3: error: implicit declaration of function 'iommufd_device_pasid_detach' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   iommufd_device_pasid_detach(vdev->iommufd_device, pasid);
                   ^
   drivers/vfio/iommufd.c:134:3: note: did you mean 'iommufd_device_detach'?
   include/linux/iommufd.h:27:6: note: 'iommufd_device_detach' declared here
   void iommufd_device_detach(struct iommufd_device *idev);
        ^
>> drivers/vfio/iommufd.c:190:10: error: implicit declaration of function 'iommufd_device_pasid_replace' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   return iommufd_device_pasid_replace(vdev->iommufd_device,
                          ^
   drivers/vfio/iommufd.c:190:10: note: did you mean 'iommufd_device_replace'?
   include/linux/iommufd.h:26:5: note: 'iommufd_device_replace' declared here
   int iommufd_device_replace(struct iommufd_device *idev, u32 *pt_id);
       ^
>> drivers/vfio/iommufd.c:197:7: error: implicit declaration of function 'iommufd_device_pasid_attach' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           rc = iommufd_device_pasid_attach(vdev->iommufd_device, pasid, pt_id);
                ^
   drivers/vfio/iommufd.c:197:7: note: did you mean 'iommufd_device_pasid_replace'?
   drivers/vfio/iommufd.c:190:10: note: 'iommufd_device_pasid_replace' declared here
                   return iommufd_device_pasid_replace(vdev->iommufd_device,
                          ^
   drivers/vfio/iommufd.c:216:2: error: implicit declaration of function 'iommufd_device_pasid_detach' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           iommufd_device_pasid_detach(vdev->iommufd_device, pasid);
           ^
   4 errors generated.


vim +/iommufd_device_pasid_detach +134 drivers/vfio/iommufd.c

   126	
   127	void vfio_iommufd_physical_unbind(struct vfio_device *vdev)
   128	{
   129		int pasid;
   130	
   131		lockdep_assert_held(&vdev->dev_set->lock);
   132	
   133		while ((pasid = ida_find_first(&vdev->pasids)) >= 0) {
 > 134			iommufd_device_pasid_detach(vdev->iommufd_device, pasid);
   135			ida_free(&vdev->pasids, pasid);
   136		}
   137	
   138		if (vdev->iommufd_attached) {
   139			iommufd_device_detach(vdev->iommufd_device);
   140			vdev->iommufd_attached = false;
   141		}
   142		iommufd_device_unbind(vdev->iommufd_device);
   143		vdev->iommufd_device = NULL;
   144	}
   145	EXPORT_SYMBOL_GPL(vfio_iommufd_physical_unbind);
   146	
   147	int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
   148	{
   149		int rc;
   150	
   151		lockdep_assert_held(&vdev->dev_set->lock);
   152	
   153		if (WARN_ON(!vdev->iommufd_device))
   154			return -EINVAL;
   155	
   156		if (vdev->iommufd_attached)
   157			rc = iommufd_device_replace(vdev->iommufd_device, pt_id);
   158		else
   159			rc = iommufd_device_attach(vdev->iommufd_device, pt_id);
   160		if (rc)
   161			return rc;
   162		vdev->iommufd_attached = true;
   163		return 0;
   164	}
   165	EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
   166	
   167	void vfio_iommufd_physical_detach_ioas(struct vfio_device *vdev)
   168	{
   169		lockdep_assert_held(&vdev->dev_set->lock);
   170	
   171		if (WARN_ON(!vdev->iommufd_device) || !vdev->iommufd_attached)
   172			return;
   173	
   174		iommufd_device_detach(vdev->iommufd_device);
   175		vdev->iommufd_attached = false;
   176	}
   177	EXPORT_SYMBOL_GPL(vfio_iommufd_physical_detach_ioas);
   178	
   179	int vfio_iommufd_physical_pasid_attach_ioas(struct vfio_device *vdev,
   180						    u32 pasid, u32 *pt_id)
   181	{
   182		int rc;
   183	
   184		lockdep_assert_held(&vdev->dev_set->lock);
   185	
   186		if (WARN_ON(!vdev->iommufd_device))
   187			return -EINVAL;
   188	
   189		if (ida_exists(&vdev->pasids, pasid))
 > 190			return iommufd_device_pasid_replace(vdev->iommufd_device,
   191							    pasid, pt_id);
   192	
   193		rc = ida_alloc_range(&vdev->pasids, pasid, pasid, GFP_KERNEL);
   194		if (rc < 0)
   195			return rc;
   196	
 > 197		rc = iommufd_device_pasid_attach(vdev->iommufd_device, pasid, pt_id);
   198		if (rc)
   199			ida_free(&vdev->pasids, pasid);
   200	
   201		return rc;
   202	}
   203	EXPORT_SYMBOL_GPL(vfio_iommufd_physical_pasid_attach_ioas);
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
