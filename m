Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B1152F60;
	Mon,  5 Feb 2024 23:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707176089; cv=none; b=py3OhaeG5UWQg40+Fdtt3W6milQQe5UH8S3CDbw9O8TPeNgN3YCJ2prfJBPoO6Q13PG/whvFbPdHWi+w128VFZfU98inkgfnSWoFmAu+IqkjcZTbxF1dfEj6zbnkjPQUZxbo0r0kfu4PHi3c+74dp8IpASAx4pcvAPLz6dk+2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707176089; c=relaxed/simple;
	bh=rh5HBxbmK4wOU5X/HkWmDwSLncKexjNpc3U8nK/z6DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gaY0mfuLUvgemb7phpkeC0C0hHgkZVF+5KJFI5+8vCkkj5q+J6RqQf9eSAcdceWRPNNGBdWQPuhKHj95KE/BrXrexvuWB7ZX9K1m88TQ/iNNTuFcy/2HulnWsn8V+gZ5FoP230dZ1qO4A5nhfJdEsGk/QjBsqK2AoEBqfFegyQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EO2uAA07; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EO2uAA07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707176088; x=1738712088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rh5HBxbmK4wOU5X/HkWmDwSLncKexjNpc3U8nK/z6DA=;
  b=EO2uAA07ApL3WL8tPOa913EcuSluTAgKfA9NuQXFSUZgXlfUTRFWO20U
   yxDNxtmbnzTNiGP4BLJEZlqiOCpWAXuRN1cXnOPSyZpnf3lGmbBWEwWl3
   gqzx3HbVmxqtxz3Ux0+oT8NQU+GwhRd4gV0ZA6VdwexpHIKmteHXPrBr0
   ntqAACeXd9nvg/QCQZTJ3xcVE2D6p7uMH5sTYlgDWTg+M3tXMrJjOTwgk
   Tb1tXUvBx4WjCxo5MMHQDRalp/DAukKfxCErx7oVpH2WRr8ckBiLppIJv
   hIzKtrYjO93G0Ogevzs6d5OgGPLyvqlJeoRCyMh1cxyoiizBWOIBLVvX4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11997566"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11997566"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 15:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="855778"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Feb 2024 15:34:44 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX8U6-0000tY-04;
	Mon, 05 Feb 2024 23:34:42 +0000
Date: Tue, 6 Feb 2024 07:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: [drm-xe:drm-xe-next 1/4] drivers/gpu/drm/xe/xe_bo.c:1635:2: error:
 call to undeclared function 'drmm_release_action'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202402060701.gySJwBBM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   897c5b367db8affee69823c7e639caf33187bdf2
commit: 30b71bce350e4ab5e495697838b1fb8478970140 [1/4] drm/xe/guc: Allocate GuC data structures in system memory for initial load
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240206/202402060701.gySJwBBM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060701.gySJwBBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060701.gySJwBBM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_bo.c:1635:2: error: call to undeclared function 'drmm_release_action'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1635 |         drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
         |         ^
   drivers/gpu/drm/xe/xe_bo.c:1635:2: note: did you mean 'devm_release_action'?
   include/linux/device.h:388:6: note: 'devm_release_action' declared here
     388 | void devm_release_action(struct device *dev, void (*action)(void *), void *data);
         |      ^
   1 error generated.


vim +/drmm_release_action +1635 drivers/gpu/drm/xe/xe_bo.c

  1608	
  1609	/**
  1610	 * xe_managed_bo_reinit_in_vram
  1611	 * @xe: xe device
  1612	 * @tile: Tile where the new buffer will be created
  1613	 * @src: Managed buffer object allocated in system memory
  1614	 *
  1615	 * Replace a managed src buffer object allocated in system memory with a new
  1616	 * one allocated in vram, copying the data between them.
  1617	 * Buffer object in VRAM is not going to have the same GGTT address, the caller
  1618	 * is responsible for making sure that any old references to it are updated.
  1619	 *
  1620	 * Returns 0 for success, negative error code otherwise.
  1621	 */
  1622	int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
  1623	{
  1624		struct xe_bo *bo;
  1625	
  1626		xe_assert(xe, IS_DGFX(xe));
  1627		xe_assert(xe, !(*src)->vmap.is_iomem);
  1628	
  1629		bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
  1630						    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
  1631						    XE_BO_CREATE_GGTT_BIT);
  1632		if (IS_ERR(bo))
  1633			return PTR_ERR(bo);
  1634	
> 1635		drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
  1636		*src = bo;
  1637	
  1638		return 0;
  1639	}
  1640	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
