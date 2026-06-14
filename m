Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1EA155C82;
	Sun, 14 Jun 2026 01:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781400246; cv=none; b=FW0XcWwjpcVtQm0l0QyaLSHd22ARuYHNukx2xJnZnqRx7RoGWG2id0B9T+rPPXqZq8TQOfjfjOMQ/Cn6JlLxzRm195KTnKfNTGwO2MFRZNRCep2OchsYm3o1gDhxtpnn/D3FNX/uU45OSg/2cnZGKRsquo7DoWfTTWhf3gRWXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781400246; c=relaxed/simple;
	bh=bP4L/JPYGvhjM8Q+ob9eWSRSR8BVuAjZiUlMtw1t3yA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fw/l0OymlfP3YBEIF7R8WnbaVb5fGpI/G5GpNAhyoVD/LG5Ysjos+yxIxZe8+EuN2K095IFaS6ifnhJuWmrFHU0iXgYML44uWYMypQDSbyxNUOWPrI9/L36Sb32h8iTujGgazdzaipRsvDxkyo/9zuIPxkUF3B3HpOVhiTcLRpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5h9qw4J; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5h9qw4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781400244; x=1812936244;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bP4L/JPYGvhjM8Q+ob9eWSRSR8BVuAjZiUlMtw1t3yA=;
  b=J5h9qw4JEarNYVngdFrodmfrSscZLJfLmdmpjqcMsrWpt0KAJo3wlA4C
   NSsmfIKeJ1MOZVJsTuYSUNOkBuCoyIowePUbXoGUCdHBNS2z4hjWfvPTX
   8uVgx9ZOx24xWyQtybrQHardWjWlHAD4n8M4CCmZXPeVaESk7aWQAaPCL
   1rc6A3BDagZ+K2bWOhlVS+WzKmcB4xb4K1HQLPbD3j8nnMpYOG7nA7xWA
   aIfhpSYC7eNpOIf5WWI/GqU8s1NPWnnJuPPTxHJGBW+jqgppBcoZyotYA
   XTlLXR/iTlIJj2Ln1F/jECfKpEOZxD4WAFiNcI/9hdOaOGx8xMniYdcgH
   g==;
X-CSE-ConnectionGUID: 575zc5ZSQNW4/IkTsxgXUw==
X-CSE-MsgGUID: W0/g0wMQR5uWKsbSKwPtHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82291339"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82291339"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 18:24:02 -0700
X-CSE-ConnectionGUID: yrpEH7hWQ9qPIp+QZuQgRw==
X-CSE-MsgGUID: 3uQ82u+QT7+Yt+tzwlLQLQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2026 18:24:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYZZt-00000000QSI-3RMC;
	Sun, 14 Jun 2026 01:23:57 +0000
Date: Sun, 14 Jun 2026 09:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [drm-tip:drm-tip 1/9]
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:203:1: warning: unused label 'retry'
Message-ID: <202606140935.EiNEvxGP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
head:   5fc0f82c971ea3b4e1c58602c0be573a802a8670
commit: f8363c190f6fe6cffebc8733c2375330112327f9 [1/9] Merge remote-trackin=
g branch 'drm/drm-next' into drm-tip
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260614=
/202606140935.EiNEvxGP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305=
faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260614/202606140935.EiNEvxGP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140935.EiNEvxGP-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:203:1: warning: unused label 're=
try' [-Wunused-label]
     203 | retry:
         | ^~~~~~
   1 warning generated.


vim +/retry +203 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c

04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  168 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  169  int amdgpu_hmm_range_get_pages(struct mmu_interval_notif=
ier *notifier,
d4cbff464d2932a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g      2022-11-09  170  			       uint64_t start, uint64_t npages, bool rea=
donly,
c5b3cc417b0260a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri       =
  2025-09-17  171  			       void *owner,
737da5363cc07c9 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Sunil Khatri       =
  2025-10-10  172  			       struct amdgpu_hmm_range *range)
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  173  {
962d684b5dc0741 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g      2026-02-18  174  	const u64 max_bytes =3D SZ_2G;
962d684b5dc0741 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g      2026-02-18  175 =20
962d684b5dc0741 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g      2026-02-18  176  	struct hmm_range *hmm_range =3D &range->hmm_range;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  177  	unsigned long *pfns;
962d684b5dc0741 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g      2026-02-18  178  	unsigned long end;
962d684b5dc0741 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g      2026-02-18  179  	int r;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  180 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  181  	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERN=
EL);
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  182  	if (unlikely(!pfns)) {
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  183  		r =3D -ENOMEM;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  184  		goto out_free_range;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  185  	}
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  186 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  187  	hmm_range->notifier =3D notifier;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  188  	hmm_range->default_flags =3D HMM_PFN_REQ_FAULT;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  189  	if (!readonly)
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  190  		hmm_range->default_flags |=3D HMM_PFN_REQ_WRITE;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  191  	hmm_range->hmm_pfns =3D pfns;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  192  	hmm_range->start =3D start;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  193  	end =3D start + npages * PAGE_SIZE;
8c21fc49a8e637b drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Sierra        =
  2021-05-06  194  	hmm_range->dev_private_owner =3D owner;
d8a3c1c80ceb656 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2021-03-30  195 =20
962d684b5dc0741 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g      2026-02-18  196  	hmm_range->notifier_seq =3D mmu_interval_read_begi=
n(notifier);
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  197  	do {
962d684b5dc0741 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g      2026-02-18  198  		hmm_range->end =3D min(hmm_range->start + max_byt=
es, end);
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  199 =20
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  200  		pr_debug("hmm range: start =3D 0x%lx, end =3D 0x%lx",
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  201  			hmm_range->start, hmm_range->end);
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  202 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24 @203  retry:
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  204  		r =3D hmm_range_fault(hmm_range);
342981fff32802a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Honglei Huang      =
  2026-05-29  205  		if (unlikely(r))
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  206  			goto out_free_pfns;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  207 =20
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  208  		if (hmm_range->end =3D=3D end)
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  209  			break;
962d684b5dc0741 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian K=C3=B6ni=
g      2026-02-18  210  		hmm_range->hmm_pfns +=3D max_bytes >> PAGE_SHIFT;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  211  		hmm_range->start =3D hmm_range->end;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  212  	} while (hmm_range->end < end);
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  213 =20
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  214  	hmm_range->start =3D start;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  215  	hmm_range->hmm_pfns =3D pfns;
c1420a5dd4dd2a1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu          =
  2022-11-17  216 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  217  	return 0;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  218 =20
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  219  out_free_pfns:
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  220  	kvfree(pfns);
dfc74e37bdb487e drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Srinivasan Shanmuga=
m 2025-10-23  221  	hmm_range->hmm_pfns =3D NULL;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  222  out_free_range:
9095e5544061b16 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang        =
  2024-04-30  223  	if (r =3D=3D -EBUSY)
9095e5544061b16 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang        =
  2024-04-30  224  		r =3D -EAGAIN;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  225  	return r;
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  226  }
04d8d73dbcbe645 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang        =
  2020-02-24  227 =20

:::::: The code at line 203 was first introduced by commit
:::::: 04d8d73dbcbe645a378fca6adc6f0e7111e46c17 drm/amdgpu: add common HMM =
get pages function

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
