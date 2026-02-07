Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54833E346;
	Sat,  7 Feb 2026 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460363; cv=none; b=J4f8JssmSrsUnTO+wFtxJXWCRJKHrGUu4MKvgbguHIytBZ0KI2n2gLtSLT7Fjn1K/BWfDsTVTWCUVvVUW1xQnWyTTuYHUJG/aAlPvrSmXnAqBEf4RFeDvc0ATb9ggAcJAn3ZMJhAFhIiOsxT6scXJ1bAqg6ICLf7zwmu4QFkgsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460363; c=relaxed/simple;
	bh=DvbKsUO2Ns4Jkg3ga2bB91TVwqscHas39jGeLOn88Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JcfHtbIcdclB7URWaJNXejIZM+MhFWcK/SXDOwNJjcEt9qZlJ/DYW+Zon/KHCXBYOBQyDAGcNnM0o/N0glzy6w4j2N3EsaSjRkNevgEBlwl0YCAcx7Ol6/PKiOnBEpRO9RqHzJEp7UL/50zGV1jEbLzdUZX+Xu7KCxAdX/IFg9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4HW0PxU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4HW0PxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770460363; x=1801996363;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DvbKsUO2Ns4Jkg3ga2bB91TVwqscHas39jGeLOn88Ww=;
  b=L4HW0PxUK9H7bpOcbD6IVcE6qUQwXjldual0p3MhfQjO7jSr74mzXSqb
   T5VAu34tYYCLjkR7/bMzw3vTQ0NxENtoBR3sp1rzMM6lHiFWdn2fupTYY
   UKVSUR3Dj6hXeG/PnjXUjUW/SyTHfHHlEGLM58G5AC0gtU/FcjSzCd7Ai
   7XHDu+TOCKM4A3wEGYtn76VS0WURlgntEHP99xR9ekuXbigthI+tlF2rs
   YlYSKeqCgFVqojjhscLF4st1fGM/ON5rntr3EG6u0h1Jp6hC28rkN5hG0
   NR5Vb7qFwgDG5OVHy8Cb0EMvEM5ksz/RBRgwsob90sNxy7JxH7tiUTOGZ
   g==;
X-CSE-ConnectionGUID: nXLvRPlRQPqWon1usGEn+Q==
X-CSE-MsgGUID: cNfOaCw3RLGqMviR14Hsvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71691058"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71691058"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 02:32:41 -0800
X-CSE-ConnectionGUID: kOzWI1KkTOOugsFp1TzDdQ==
X-CSE-MsgGUID: 9Z7zNsWOTRagmmStLptrXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210406370"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Feb 2026 02:32:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vofcD-00000000lZk-1fnS;
	Sat, 07 Feb 2026 10:32:37 +0000
Date: Sat, 07 Feb 2026 18:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bob Zhou <bob.zhou@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [agd5f:baseline0 3225/3826]
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:790:5: error: redefinition of
 'amdgpu_hmm_register'
Message-ID: <202602071847.ahTWTOPu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: c3ae2851e95176316859bc6300f80759e2bc3db7 [3225/3826] Bump AMDGPU ve=
rsion to 6.18.0
config: sparc64-randconfig-002-20260207 (https://download.01.org/0day-ci/ar=
chive/20260207/202602071847.ahTWTOPu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260207/202602071847.ahTWTOPu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071847.ahTWTOPu-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:790:5: error: redefinition of 'a=
mdgpu_hmm_register'
     790 | int amdgpu_hmm_register(struct amdgpu_bo *bo, unsigned long addr)
         |     ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_hmm.h:102:19: note: previous=
 definition is here
     102 | static inline int amdgpu_hmm_register(struct amdgpu_bo *bo, unsi=
gned long addr)
         |                   ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:820:6: error: redefinition of 'a=
mdgpu_hmm_unregister'
     820 | void amdgpu_hmm_unregister(struct amdgpu_bo *bo)
         |      ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_hmm.h:109:20: note: previous=
 definition is here
     109 | static inline void amdgpu_hmm_unregister(struct amdgpu_bo *bo) {}
         |                    ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:937:6: error: redefinition of 'a=
mdgpu_hmm_range_valid'
     937 | bool amdgpu_hmm_range_valid(struct amdgpu_hmm_range *range)
         |      ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_hmm.h:111:20: note: previous=
 definition is here
     111 | static inline bool amdgpu_hmm_range_valid(struct amdgpu_hmm_rang=
e *range)
         |                    ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:957:26: error: redefinition of '=
amdgpu_hmm_range_alloc'
     957 | struct amdgpu_hmm_range *amdgpu_hmm_range_alloc(struct amdgpu_bo=
 *bo)
         |                          ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_hmm.h:116:40: note: previous=
 definition is here
     116 | static inline struct amdgpu_hmm_range *amdgpu_hmm_range_alloc(st=
ruct amdgpu_bo *bo)
         |                                        ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:978:6: error: redefinition of 'a=
mdgpu_hmm_range_free'
     978 | void amdgpu_hmm_range_free(struct amdgpu_hmm_range *range)
         |      ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_hmm.h:121:20: note: previous=
 definition is here
     121 | static inline void amdgpu_hmm_range_free(struct amdgpu_hmm_range=
 *range) {}
         |                    ^
   5 errors generated.


vim +/amdgpu_hmm_register +790 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c

ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian K=C3=B6nig=
      2016-03-18  780 =20
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  781  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
      2022-11-09  782   * amdgpu_hmm_register - register a BO for notifier =
updates
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  783   *
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  784   * @bo: amdgpu buffer object
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  785   * @addr: userptr addr we should monitor
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  786   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe     =
 2019-11-12  787   * Registers a mmu_notifier for the given BO at the speci=
fied address.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  788   * Returns 0 on success, -ERRNO if anything goes wrong.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  789   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
      2022-11-09 @790  int amdgpu_hmm_register(struct amdgpu_bo *bo, unsign=
ed long addr)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  791  {
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  792  	int r;
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  793 =20
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe     =
 2019-11-12  794  	if (bo->kfd_bo)
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  795  		r =3D mmu_interval_notifier_insert(&bo->notifier, curre=
nt->mm,
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe     =
 2019-11-12  796  						    addr, amdgpu_bo_size(bo),
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
      2022-11-09  797  						    &amdgpu_hmm_hsa_ops);
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  798  	else
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  799  		r =3D mmu_interval_notifier_insert(&bo->notifier, curre=
nt->mm, addr,
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe     =
 2019-11-12  800  							amdgpu_bo_size(bo),
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
      2022-11-09  801  							&amdgpu_hmm_gfx_ops);
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  802  	if (r)
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  803  		/*
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  804  		 * Make sure amdgpu_hmm_unregister() doesn't call
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  805  		 * mmu_interval_notifier_remove() when the notifier isn=
't properly
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  806  		 * initialized.
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  807  		 */
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  808  		bo->notifier.mm =3D NULL;
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  809 =20
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak      =
 2024-03-06  810  	return r;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  811  }
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  812 =20
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  813  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
      2022-11-09  814   * amdgpu_hmm_unregister - unregister a BO for notif=
ier updates
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  815   *
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  816   * @bo: amdgpu buffer object
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  817   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe     =
 2019-11-12  818   * Remove any registration of mmu notifier updates from t=
he buffer object.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  819   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
      2022-11-09 @820  void amdgpu_hmm_unregister(struct amdgpu_bo *bo)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  821  {
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe     =
 2019-11-12  822  	if (!bo->notifier.mm)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  823  		return;
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe     =
 2019-11-12  824  	mmu_interval_notifier_remove(&bo->notifier);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe     =
 2019-11-12  825  	bo->notifier.mm =3D NULL;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher        =
 2015-04-20  826  }
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  827 =20
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  828  #ifndef HAVE_HMM_DROP_CUSTOMIZABLE_PFN_FORMAT
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  829  /* flags used by HMM internal, not related to CPU/GPU PTE=
 flags */
95e6713f2f51ef drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2021-04-30  830  const uint64_t hmm_range_flags[HMM_PFN_FLAG_MAX] =3D {
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  831  	(1 << 0), /* HMM_PFN_VALID */
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  832  	(1 << 1), /* HMM_PFN_WRITE */
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  833  	0 /* HMM_PFN_DEVICE_PRIVATE */
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  834  };
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  835 =20
95e6713f2f51ef drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2021-04-30  836  const uint64_t hmm_range_values[HMM_PFN_VALUE_MAX] =3D {
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  837  	0xfffffffffffffffeUL, /* HMM_PFN_ERROR */
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  838  	0, /* HMM_PFN_NONE */
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  839  	0xfffffffffffffffcUL /* HMM_PFN_SPECIAL */
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  840  };
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  841  #endif
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  842 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  843  int amdgpu_hmm_range_get_pages(struct mmu_interval_notifi=
er *notifier,
d4cbff464d2932 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6nig=
      2022-11-09  844  			       uint64_t start, uint64_t npages, bool read=
only,
c5b3cc417b0260 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-09-17  845  			       void *owner,
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  846  			       struct amdgpu_hmm_range *range)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  847  {
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  848  	unsigned long end;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  849  	unsigned long timeout;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  850  	unsigned long *pfns;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  851  	int r =3D 0;
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  852  	struct hmm_range *hmm_range =3D &range->hmm_range;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  853 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  854  	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNE=
L);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  855  	if (unlikely(!pfns)) {
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  856  		r =3D -ENOMEM;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  857  		goto out_free_range;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  858  	}
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  859 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  860  	hmm_range->notifier =3D notifier;
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  861  #ifndef HAVE_HMM_DROP_CUSTOMIZABLE_PFN_FORMAT
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  862  	hmm_range->flags =3D hmm_range_flags;
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  863  	hmm_range->values =3D hmm_range_values;
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  864  	hmm_range->pfn_shift =3D PAGE_SHIFT;
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  865  	hmm_range->default_flags =3D hmm_range_flags[HMM_PFN_VAL=
ID];
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  866  	if (!readonly)
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  867  		hmm_range->default_flags |=3D hmm_range->flags[HMM_PFN_=
WRITE];
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  868  	hmm_range->pfns =3D (uint64_t *)pfns;
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  869  #else
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  870  	hmm_range->default_flags =3D HMM_PFN_REQ_FAULT;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  871  	if (!readonly)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  872  		hmm_range->default_flags |=3D HMM_PFN_REQ_WRITE;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  873  	hmm_range->hmm_pfns =3D pfns;
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  874  #endif
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  875  	hmm_range->start =3D start;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  876  	end =3D start + npages * PAGE_SIZE;
8c21fc49a8e637 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Sierra         =
 2021-05-06  877  	hmm_range->dev_private_owner =3D owner;
d8a3c1c80ceb65 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2021-03-30  878 =20
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  879  	do {
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  880  		hmm_range->end =3D min(hmm_range->start + MAX_WALK_BYTE=
, end);
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  881 =20
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  882  		pr_debug("hmm range: start =3D 0x%lx, end =3D 0x%lx",
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  883  			hmm_range->start, hmm_range->end);
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  884 =20
9095e5544061b1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang         =
 2024-04-30  885  		timeout =3D jiffies + msecs_to_jiffies(HMM_RANGE_DEFAUL=
T_TIMEOUT);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  886 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  887  retry:
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  888  		hmm_range->notifier_seq =3D mmu_interval_read_begin(not=
ifier);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  889  		r =3D hmm_range_fault(hmm_range);
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  890  #ifndef HAVE_HMM_DROP_CUSTOMIZABLE_PFN_FORMAT
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  891  		if (unlikely(r <=3D 0)) {
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  892  #else
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  893  		if (unlikely(r)) {
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  894  #endif
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  895  #ifndef HAVE_HMM_DROP_CUSTOMIZABLE_PFN_FORMAT
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  896  			if ((r =3D=3D 0 || r =3D=3D -EBUSY) && !time_after(jif=
fies, timeout))
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  897  #else
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  898  			if (r =3D=3D -EBUSY && !time_after(jiffies, timeout))
b89f664bf7cf61 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Flora Cui           =
 2020-02-24  899  #endif
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  900  				goto retry;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  901  			goto out_free_pfns;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  902  		}
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  903 =20
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  904  		if (hmm_range->end =3D=3D end)
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  905  			break;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  906  		hmm_range->hmm_pfns +=3D MAX_WALK_BYTE >> PAGE_SHIFT;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  907  		hmm_range->start =3D hmm_range->end;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  908  	} while (hmm_range->end < end);
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  909 =20
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  910  	hmm_range->start =3D start;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  911  	hmm_range->hmm_pfns =3D pfns;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu           =
 2022-11-17  912 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  913  	return 0;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  914 =20
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  915  out_free_pfns:
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  916  	kvfree(pfns);
dfc74e37bdb487 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Srinivasan Shanmugam=
 2025-10-23  917  	hmm_range->hmm_pfns =3D NULL;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  918  out_free_range:
9095e5544061b1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang         =
 2024-04-30  919  	if (r =3D=3D -EBUSY)
9095e5544061b1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang         =
 2024-04-30  920  		r =3D -EAGAIN;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  921  	return r;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  922  }
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  923 =20
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  924  /**
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  925   * amdgpu_hmm_range_valid - check if an HMM range is stil=
l valid
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  926   * @range: pointer to the &struct amdgpu_hmm_range to val=
idate
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  927   *
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  928   * Determines whether the given HMM range @range is still=
 valid by
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  929   * checking for invalidations via the MMU notifier sequen=
ce. This is
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  930   * typically used to verify that the range has not been i=
nvalidated
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  931   * by concurrent address space updates before it is acces=
sed.
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  932   *
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  933   * Return:
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  934   * * true if @range is valid and can be used safely
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  935   * * false if @range is NULL or has been invalidated
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  936   */
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10 @937  bool amdgpu_hmm_range_valid(struct amdgpu_hmm_range *rang=
e)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  938  {
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  939  	if (!range)
b1dd0db1c668a3 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-09-30  940  		return false;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang         =
 2020-02-24  941 =20
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  942  	return !mmu_interval_read_retry(range->hmm_range.notifie=
r,
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  943  					range->hmm_range.notifier_seq);
b1dd0db1c668a3 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-09-30  944  }
b1dd0db1c668a3 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-09-30  945 =20
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  946  /**
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  947   * amdgpu_hmm_range_alloc - allocate and initialize an AM=
DGPU HMM range
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  948   * @bo: optional buffer object to associate with this HMM=
 range
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  949   *
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  950   * Allocates memory for amdgpu_hmm_range and associates i=
t with the @bo passed.
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  951   * The reference count of the @bo is incremented.
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  952   *
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  953   * Return:
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  954   * Pointer to a newly allocated struct amdgpu_hmm_range o=
n success,
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  955   * or NULL if memory allocation fails.
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  956   */
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10 @957  struct amdgpu_hmm_range *amdgpu_hmm_range_alloc(struct am=
dgpu_bo *bo)
b1dd0db1c668a3 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-09-30  958  {
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  959  	struct amdgpu_hmm_range *range;
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  960 =20
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  961  	range =3D kzalloc(sizeof(*range), GFP_KERNEL);
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  962  	if (!range)
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  963  		return NULL;
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  964 =20
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  965  	range->bo =3D amdgpu_bo_ref(bo);
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10  966  	return range;
b1dd0db1c668a3 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-09-30  967  }
b1dd0db1c668a3 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-09-30  968 =20
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  969  /**
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  970   * amdgpu_hmm_range_free - release an AMDGPU HMM range
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  971   * @range: pointer to the range object to free
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  972   *
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  973   * Releases all resources held by @range, including the a=
ssociated
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  974   * hmm_pfns and the dropping reference of associated bo i=
f any.
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  975   *
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  976   * Return: void
d5a62b7aa9323f drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-14  977   */
737da5363cc07c drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri        =
 2025-10-10 @978  void amdgpu_hmm_range_free(struct amdgpu_hmm_range *range)

:::::: The code at line 790 was first introduced by commit
:::::: d9483ecd327b7537c6a51cab515b5faad21b8200 drm/amdgpu: rename the file=
s for HMM handling

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
