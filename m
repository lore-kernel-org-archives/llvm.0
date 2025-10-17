Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68D330B3F;
	Fri, 17 Oct 2025 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722677; cv=none; b=S67a3BqH1lx4lrR5HVFsmA5ZdXusrXWHoF9sjWUXtXqKtK6HgS12pdaFwn9EmQma/mXwofbx8j4UxUQHqKVzzJoUaWV0niZQJANxW4WCZCDX8Bk18we2uvb3h8uJBySP8DIKlezz/3lekbyNQOhqkdSH3iFuloGAA6f+phRtues=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722677; c=relaxed/simple;
	bh=K0cYWfEo+mouk3Ylx+tdBKbAUa3ICxtLt0gseQ7bYg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxt7fUbPKQHGcdW4Cl54QZF1G84yL1761bak6NrHej5Ug+eZOjSA/X3YbMAARb6jXLF9QEnMkNizI0sLz/+gEoEcLqfAyKoHu0HiqfJ7WRHJ0ehVGlMrL622j7JCJeQXfrxsCkdYVLUmvQh0ZLTOaixtz2YBGe7a+yhGylcGNu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5cjW2XL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5cjW2XL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760722675; x=1792258675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0cYWfEo+mouk3Ylx+tdBKbAUa3ICxtLt0gseQ7bYg4=;
  b=B5cjW2XLEBlIxTIUmpaNUWLR9D4pCfGDWvpsC0lTw4DcdBtEP8jw0d+q
   1l+O/03xU3fn6OpSF0QNQvyHjBq5+XSIHHKiA3U59mH4pLDfe4dNm2RJV
   NtBGQ/Ur0OY8Q5evMOBUGlINiDTAbNlWUy/yDZresPXm/6zrz80U53ZlK
   ap0hCgrgUqEf2UnASWM+cZFcuWBveDM+lc5LBHkp8k+t36LL8yCDV0BtN
   Uph+5aIELwQA15IjE08LP058j6sJaAC18q0tNyljC57Y6oAbF5FhRvt0i
   DmiIOvZ6XFp5p+i/3xFW6Rt9YTnklJjHlq4u7utRBvh7D0LXxM7oTy3Nq
   w==;
X-CSE-ConnectionGUID: QS3MljAFQzG3G78TyfOJKA==
X-CSE-MsgGUID: 1rsOcbIHRrehSj4Xfw0r4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73613037"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="73613037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 10:37:51 -0700
X-CSE-ConnectionGUID: kMg9YNUlSVqOxMSugVk/tg==
X-CSE-MsgGUID: twiy+U32TAaNsVk2E5RKRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="213393837"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Oct 2025 10:37:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9oOL-0007c3-1Y;
	Fri, 17 Oct 2025 17:37:33 +0000
Date: Sat, 18 Oct 2025 01:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 13/24]
 drivers/iommu/iommufd/pages.c:1390:7: warning: attribute declaration must
 precede definition
Message-ID: <202510180114.HJwjE2dn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   e1e0600b1a5699114df3ae378cd69a7f953e5b3d
commit: c6bba7e55c4c144ad5a4469e5a9c9f45954411dc [13/24] iommufd: Add DMABUF to iopt_pages
config: x86_64-buildonly-randconfig-005-20251017 (https://download.01.org/0day-ci/archive/20251018/202510180114.HJwjE2dn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180114.HJwjE2dn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180114.HJwjE2dn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/pages.c:1390:7: warning: attribute declaration must precede definition [-Wignored-attributes]
    1390 |         fn = symbol_get(vfio_pci_dma_buf_iommufd_map);
         |              ^
   include/linux/module.h:826:60: note: expanded from macro 'symbol_get'
     826 | #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
         |                                                            ^
   include/linux/vfio_pci_core.h:172:1: note: previous definition is here
     172 | vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
         | ^
>> drivers/iommu/iommufd/pages.c:1390:7: warning: attribute declaration must precede definition [-Wignored-attributes]
    1390 |         fn = symbol_get(vfio_pci_dma_buf_iommufd_map);
         |              ^
   include/linux/module.h:826:65: note: expanded from macro 'symbol_get'
     826 | #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
         |                                                                 ^
   include/linux/vfio_pci_core.h:172:1: note: previous definition is here
     172 | vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
         | ^
   2 warnings generated.


vim +1390 drivers/iommu/iommufd/pages.c

  1378	
  1379	/*
  1380	 * iommufd and vfio have a circular dependency. Future work for a phys
  1381	 * based private interconnect will remove this.
  1382	 */
  1383	static int
  1384	sym_vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
  1385					 struct phys_vec *phys)
  1386	{
  1387		typeof(&vfio_pci_dma_buf_iommufd_map) fn;
  1388		int rc;
  1389	
> 1390		fn = symbol_get(vfio_pci_dma_buf_iommufd_map);
  1391		if (!fn)
  1392			return -EOPNOTSUPP;
  1393		rc = fn(attachment, phys);
  1394		symbol_put(vfio_pci_dma_buf_iommufd_map);
  1395		return rc;
  1396	}
  1397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
