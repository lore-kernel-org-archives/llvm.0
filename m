Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74802A3F;
	Wed,  6 Dec 2023 01:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miTJJRBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701825757; x=1733361757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hKqKTS2nPg3pzQqtsO7o1mE/HeXCCWcHKiyVPcEKXiM=;
  b=miTJJRBryb70zsg4YMTL8swWZdY8aN11HcFdhq2626zHNqnM8M7Wla2l
   OS9x7MxHDkkIpP20DhmN1xz/NV7MtX0uQatiWSCPY94PYftyu1AN//DbX
   6h3pJULGvf40dgWfogWZCPDRHtP0JFNQ25Z/tsT+mIbilsYyKK2qgUVD7
   ZHheNmAEbVtjMiNQ+g1jS/4ra7VPCLNnxXu7vJHwX/02rM/yGDA0ipYNF
   K2E+dDoDldialW667zZxolcxyYWFUykU2p8by2O+k6pYGTyLSgipLOsvX
   6IxNev/F5AQrxi6YJ1hb8cBl/7Vxi5ZCGHIpkb0JRcru8fnO0lNs/jfMB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396777231"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="396777231"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 17:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944462186"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="944462186"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 17:22:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAgcL-000A0s-2C;
	Wed, 06 Dec 2023 01:22:25 +0000
Date: Wed, 6 Dec 2023 09:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 17/26] arch/arm64/kvm/guest.c:325:7:
 error: implicit declaration of function 'vq_available' is invalid in C99
Message-ID: <202312060901.mfYwvqW7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   cf8673c4f464f79c9b5528a6ca24001cb40e5605
commit: 9188453af24188b2be6a6129e4a70868fbbfc1f0 [17/26] KVM: arm64: Implement SME vector length configuration
config: arm64-randconfig-003-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060901.mfYwvqW7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060901.mfYwvqW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060901.mfYwvqW7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/guest.c:325:7: error: implicit declaration of function 'vq_available' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (vq_available(vec_type, vq))
                       ^
   arch/arm64/kvm/guest.c:325:7: note: did you mean 'sve_vq_available'?
   arch/arm64/include/asm/fpsimd.h:332:20: note: 'sve_vq_available' declared here
   static inline bool sve_vq_available(unsigned int vq) { return false; }
                      ^
   arch/arm64/kvm/guest.c:365:30: error: implicit declaration of function 'vq_available' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (vq_present(vqs, vq) != vq_available(vec_type, vq))
                                              ^
   2 errors generated.


vim +/vq_available +325 arch/arm64/kvm/guest.c

   311	
   312	static int get_vec_vls(enum vec_type vec_type, struct kvm_vcpu *vcpu,
   313			      const struct kvm_one_reg *reg)
   314	{
   315		unsigned int max_vq, vq;
   316		u64 vqs[KVM_ARM64_SVE_VLS_WORDS];
   317	
   318		if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[vec_type])))
   319			return -EINVAL;
   320	
   321		memset(vqs, 0, sizeof(vqs));
   322	
   323		max_vq = vcpu_vec_max_vq(vec_type, vcpu);
   324		for (vq = SVE_VQ_MIN; vq <= max_vq; ++vq)
 > 325			if (vq_available(vec_type, vq))
   326				vqs[vq_word(vq)] |= vq_mask(vq);
   327	
   328		if (copy_to_user((void __user *)reg->addr, vqs, sizeof(vqs)))
   329			return -EFAULT;
   330	
   331		return 0;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
