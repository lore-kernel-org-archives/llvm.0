Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5372D9482;
	Tue,  9 Dec 2025 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765295934; cv=none; b=VwVajgxEoHyL4pqvC1L7O2voAyVoIaCrWIEItlHNn4BD0X2kBOwlDy9JhK5OXLut6UNzVGBQ819CMlVDEHnrGXcMKy7pq/V5W8D52dJ/nXZrHCxyehA1savqkUEQAufi1hXlbrExQJak0GAnp6F+FJW4JwgjJGYAOEyPtoyP2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765295934; c=relaxed/simple;
	bh=INi002jv7KrXbyJTv2qIzBFWACm3Y+knsAXaeEA4fTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EOco+0VirMtWWPv/9GUSLYEj3SIspZvarVdLSxtoQ+oLD+yisBFnT7RnfirdSxmciYBLSwwL+UMPCLcoFdYUaTLB8iNLYQkiSB2qaGqsHOY8N5JUCb9X9TE9lqkX34vFJEndTl/CrxfbaMfBCa1IoxaDSndXSSZQaZ0pG4L9UGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyO3+U2z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyO3+U2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765295933; x=1796831933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=INi002jv7KrXbyJTv2qIzBFWACm3Y+knsAXaeEA4fTA=;
  b=EyO3+U2z2PCaBtawS+8G2GhL4BhJXGwXq3nnWlQBNPlc4cO27YrC5s+f
   /klmPwpzs0OMqHVCXmz1l6nUo2DlupmL1RdupdBdBqzBW2M/Z6WjysObM
   z1mwnBFuJVTyUJVei0l+rHQ7qLeEMRCDvOpWIb0SzbPT42Uy/Pf1ifVKF
   OQiTYyiRslyFeGwVBb0A1/i0APeSea3Z1xUMZZ9i8h4qCtSO94/R61nFq
   V1T2H8PGiBfzB/ELwFNT/UnF41XB75wqGVTZCfDQlzCF2OLNEjqy+RYfD
   nowE1ZghSh2TjnFc55kUoVwxrjGsFnJJvpCxf+79Ei5YIluo+JUXSITGY
   A==;
X-CSE-ConnectionGUID: 93LPbq2qRHKjVecMDPS55g==
X-CSE-MsgGUID: LsLUxqXBRz+4Xp4oiOEjpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77871685"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="77871685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 07:58:52 -0800
X-CSE-ConnectionGUID: jVfp7vuMSv6uNZFgicwrfQ==
X-CSE-MsgGUID: JxHMEiGkQZCyHgTK/rTyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="196314426"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Dec 2025 07:58:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT06x-000000001yX-28Vb;
	Tue, 09 Dec 2025 15:58:47 +0000
Date: Tue, 9 Dec 2025 23:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Boris Brezillon <bbrezillon@kernel.org>
Subject: [drm-misc:drm-misc-next 4/11] drivers/gpu/drm/drm_gem.c:1261:10:
 error: call to undeclared function 'mm_get_unmapped_area'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202512092338.ylY8zET6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   0823bd894278e4c0f1acb8f3a8a3c67745e6d1f6
commit: 99bda20d6d4cac30ed6d357658d8bc328c3b27d9 [4/11] drm/gem: Introduce drm_gem_get_unmapped_area() fop
config: arm-randconfig-003-20251209 (https://download.01.org/0day-ci/archive/20251209/202512092338.ylY8zET6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512092338.ylY8zET6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092338.ylY8zET6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem.c:1261:10: error: call to undeclared function 'mm_get_unmapped_area'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1261 |                 return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
         |                        ^
   drivers/gpu/drm/drm_gem.c:1261:10: note: did you mean '__get_unmapped_area'?
   include/linux/mm.h:3441:1: note: '__get_unmapped_area' declared here
    3441 | __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
         | ^
   1 error generated.


vim +/mm_get_unmapped_area +1261 drivers/gpu/drm/drm_gem.c

  1229	
  1230	/**
  1231	 * drm_gem_get_unmapped_area - get memory mapping region routine for GEM objects
  1232	 * @filp: DRM file pointer
  1233	 * @uaddr: User address hint
  1234	 * @len: Mapping length
  1235	 * @pgoff: Offset (in pages)
  1236	 * @flags: Mapping flags
  1237	 *
  1238	 * If a driver supports GEM object mapping, before ending up in drm_gem_mmap(),
  1239	 * mmap calls on the DRM file descriptor will first try to find a free linear
  1240	 * address space large enough for a mapping. Since GEM objects are backed by
  1241	 * shmem buffers, this should preferably be handled by the shmem virtual memory
  1242	 * filesystem which can appropriately align addresses to huge page sizes when
  1243	 * needed.
  1244	 *
  1245	 * Look up the GEM object based on the offset passed in (vma->vm_pgoff will
  1246	 * contain the fake offset we created) and call shmem_get_unmapped_area() with
  1247	 * the right file pointer.
  1248	 *
  1249	 * If a GEM object is not available at the given offset or if the caller is not
  1250	 * granted access to it, fall back to mm_get_unmapped_area().
  1251	 */
  1252	unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
  1253						unsigned long len, unsigned long pgoff,
  1254						unsigned long flags)
  1255	{
  1256		struct drm_gem_object *obj;
  1257		unsigned long ret;
  1258	
  1259		obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
  1260		if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> 1261			return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
  1262						    flags);
  1263	
  1264		ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
  1265							 flags);
  1266	
  1267		drm_gem_object_put(obj);
  1268	
  1269		return ret;
  1270	}
  1271	EXPORT_SYMBOL_GPL(drm_gem_get_unmapped_area);
  1272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
