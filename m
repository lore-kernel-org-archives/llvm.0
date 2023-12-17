Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65394185E;
	Sun, 17 Dec 2023 03:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUvLOq2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702782558; x=1734318558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ue4/zGIz72GphjFAu71uxk0vwhVL+kGj158yrPAL4kU=;
  b=QUvLOq2jwy2GvxivfbmH25BCnCWF3Tyvu7QZtoUQs1qwz4OWwezKjZKq
   gUPh1cj26nMuylPkaINZYLToB12ak/g474dB2uQRzBInX6FghhYVrX+dj
   9C7vwa62eDd96O7VDYe0nUpPZ2SyTDX0KOU/psJnj3sEy1tq1MTZ5F0iR
   LbpGg/IBfdUy15Ovns5fXQvV9dAzagsI9QZNlvAYvXnmbkuEJaYbU8JaO
   eKm9aWV6S3O9g/afqEsLpCvbEDMbpI1NhfvyKkbA2eLVCuwrtYwuIsa/P
   VZDAK+emysW8phvLGXGdaK8viBH+cmD2FmU75qRQYnRvjFvdCM/Ihp8uW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="398184634"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="398184634"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 19:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="1022376188"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="1022376188"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2023 19:09:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEhWj-0002YV-1M;
	Sun, 17 Dec 2023 03:09:13 +0000
Date: Sun, 17 Dec 2023 11:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 40/50]
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c:565:34: warning: result of
 comparison of constant 17592186040320 with expression of type
 'resource_size_t' (aka 'unsigned int') is always false
Message-ID: <202312171126.LFwyoDnN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 9da0ecf79b1a28b051c2398bcc6c5f606632d19e [40/50] seccomp: Split out seccomp_types.h
config: i386-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171126.LFwyoDnN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171126.LFwyoDnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171126.LFwyoDnN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wformat-truncation' [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wstring-concatenation'? [-Wunknown-warning-option]
   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:14:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:16:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:16:
   In file included from include/linux/ptrace.h:12:
   include/linux/seccomp.h:49:8: error: redefinition of 'seccomp'
   struct seccomp { };
          ^
   include/linux/seccomp_types.h:20:8: note: previous definition is here
   struct seccomp {
          ^
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:565:34: warning: result of comparison of constant 17592186040320 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
                                      ~~~~ ^ ~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +565 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

8475355f7a2645 Chris Wilson    2019-05-28  544  
da1184cd41d4c6 Matthew Auld    2019-10-18  545  static int __create_shmem(struct drm_i915_private *i915,
8475355f7a2645 Chris Wilson    2019-05-28  546  			  struct drm_gem_object *obj,
da1184cd41d4c6 Matthew Auld    2019-10-18  547  			  resource_size_t size)
8475355f7a2645 Chris Wilson    2019-05-28  548  {
8475355f7a2645 Chris Wilson    2019-05-28  549  	unsigned long flags = VM_NORESERVE;
8475355f7a2645 Chris Wilson    2019-05-28  550  	struct file *filp;
8475355f7a2645 Chris Wilson    2019-05-28  551  
8475355f7a2645 Chris Wilson    2019-05-28  552  	drm_gem_private_object_init(&i915->drm, obj, size);
8475355f7a2645 Chris Wilson    2019-05-28  553  
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  554  	/* XXX: The __shmem_file_setup() function returns -EINVAL if size is
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  555  	 * greater than MAX_LFS_FILESIZE.
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  556  	 * To handle the same error as other code that returns -E2BIG when
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  557  	 * the size is too large, we add a code that returns -E2BIG when the
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  558  	 * size is larger than the size that can be handled.
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  559  	 * If BITS_PER_LONG is 32, size > MAX_LFS_FILESIZE is always false,
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  560  	 * so we only needs to check when BITS_PER_LONG is 64.
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  561  	 * If BITS_PER_LONG is 32, E2BIG checks are processed when
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  562  	 * i915_gem_object_size_2big() is called before init_object() callback
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  563  	 * is called.
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  564  	 */
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28 @565  	if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  566  		return -E2BIG;
662c04e2b8c6fe Gwan-gyeong Mun 2022-12-28  567  
8475355f7a2645 Chris Wilson    2019-05-28  568  	if (i915->mm.gemfs)
8475355f7a2645 Chris Wilson    2019-05-28  569  		filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
8475355f7a2645 Chris Wilson    2019-05-28  570  						 flags);
8475355f7a2645 Chris Wilson    2019-05-28  571  	else
8475355f7a2645 Chris Wilson    2019-05-28  572  		filp = shmem_file_setup("i915", size, flags);
8475355f7a2645 Chris Wilson    2019-05-28  573  	if (IS_ERR(filp))
8475355f7a2645 Chris Wilson    2019-05-28  574  		return PTR_ERR(filp);
8475355f7a2645 Chris Wilson    2019-05-28  575  
8475355f7a2645 Chris Wilson    2019-05-28  576  	obj->filp = filp;
8475355f7a2645 Chris Wilson    2019-05-28  577  	return 0;
8475355f7a2645 Chris Wilson    2019-05-28  578  }
8475355f7a2645 Chris Wilson    2019-05-28  579  

:::::: The code at line 565 was first introduced by commit
:::::: 662c04e2b8c6fe8eb2f2b88c62e25c8241d0f793 drm/i915: Check if the size is too big while creating shmem file

:::::: TO: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
