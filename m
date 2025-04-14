Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21D3FF1;
	Mon, 14 Apr 2025 04:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744605883; cv=none; b=J23LtPYRvIyBPdxGbaVZmjhCghWs1FMaePeydeEchNIcQo2D5QdugnYIG2oGMVQKsu4KPIgp/XT3NXZO0h6V29AxtMEsrkO9pyWgS/lJFcXl74a2ZagWHdSApXuRqSQrJlUGl3s4emCldSIyCqmLm4X+WQ29taK6TB669NaCZA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744605883; c=relaxed/simple;
	bh=bk4ynxxowmyCbNhVeedvrcD/jRM2v+UmaAhb9Op8L4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cl/TXdGN6nntbwu8u7h2WSeMkf3hYnf7zgAuItLIKWRrWIIGhuY7GLGQy/5zdFhdNmo3WDLOJkpIyjy2BuMwYiTFm2S4Ud8hkkJBDVIrkCswWpuXLhC4y9pei3yiU582RdHsthnhCqW3YMwC6/VmGPeoVMmCyOj+QWy0jgPEmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePawI27x; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePawI27x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744605881; x=1776141881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bk4ynxxowmyCbNhVeedvrcD/jRM2v+UmaAhb9Op8L4E=;
  b=ePawI27xVRSE7YX072SMU6s3z79ecK4sWhCI7VaDnvika0g8qsSsLG5t
   k/AobeAPoRF4MFhyKPFni3s0dQyWBRtf98x+vQvNb3sDCpIJZ63KGGXGx
   QdOTJpMo2g1lRSELgKAJXnpsWM9ZPc+YeLwzidWEtEDtqNGR6ZNCgcv2j
   Y4mcUqYnNsozmL5fL8Ls1elFbI4nkhDbR6zOuqH+6pNEKiAVXpOeMRyXn
   zxV8ibvAYxKWO+r8I+fJsAOXrE33KXZOm6eMjBir0CGT9p1zcTlfi6VBn
   VN3e/VmOaKlNjqVQYYfQlsPyf3qXvlF/7cA53lFHslgz+Z9tV2vdS193L
   Q==;
X-CSE-ConnectionGUID: P/bWV8htTwmDY682UVPVKg==
X-CSE-MsgGUID: CP5tjaBlRneD3tSOTyZkEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56708121"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="56708121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 21:44:40 -0700
X-CSE-ConnectionGUID: BXWGclJcSIanpkDd+4i6AQ==
X-CSE-MsgGUID: 5j4Pb5UvQm24uFHSNMtwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134554170"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2025 21:44:39 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4BgS-000Dbi-1z;
	Mon, 14 Apr 2025 04:44:36 +0000
Date: Mon, 14 Apr 2025 12:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:for-kernelci 29/44] arch/arm64/kvm/guest.c:326:7:
 error: call to undeclared function 'vq_available'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202504141252.1j5u5Jwb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git for-kernelci
head:   b172cafa2943fcb2f66d49d5c683fc9b372fc508
commit: ede01a82eae184bdc30dc4be084fdac67135a58c [29/44] KVM: arm64: Implement SME vector length configuration
config: arm64-randconfig-001-20250414 (https://download.01.org/0day-ci/archive/20250414/202504141252.1j5u5Jwb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141252.1j5u5Jwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141252.1j5u5Jwb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/guest.c:326:7: error: call to undeclared function 'vq_available'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     326 |                 if (vq_available(vec_type, vq))
         |                     ^
   arch/arm64/kvm/guest.c:326:7: note: did you mean 'sve_vq_available'?
   arch/arm64/include/asm/fpsimd.h:324:20: note: 'sve_vq_available' declared here
     324 | static inline bool sve_vq_available(unsigned int vq) { return false; }
         |                    ^
   arch/arm64/kvm/guest.c:369:30: error: call to undeclared function 'vq_available'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     369 |                 if (vq_present(vqs, vq) != vq_available(vec_type, vq))
         |                                            ^
   2 errors generated.


vim +/vq_available +326 arch/arm64/kvm/guest.c

   312	
   313	static int get_vec_vls(enum vec_type vec_type, struct kvm_vcpu *vcpu,
   314			      const struct kvm_one_reg *reg)
   315	{
   316		unsigned int max_vq, vq;
   317		u64 vqs[KVM_ARM64_SVE_VLS_WORDS];
   318	
   319		if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[vec_type])))
   320			return -EINVAL;
   321	
   322		memset(vqs, 0, sizeof(vqs));
   323	
   324		max_vq = vcpu_vec_max_vq(vcpu, vec_type);
   325		for (vq = SVE_VQ_MIN; vq <= max_vq; ++vq)
 > 326			if (vq_available(vec_type, vq))
   327				vqs[vq_word(vq)] |= vq_mask(vq);
   328	
   329		if (copy_to_user((void __user *)reg->addr, vqs, sizeof(vqs)))
   330			return -EFAULT;
   331	
   332		return 0;
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
