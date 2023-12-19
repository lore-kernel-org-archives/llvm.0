Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF8411702;
	Tue, 19 Dec 2023 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uoir5r3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702971572; x=1734507572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pgmdYKgyRkuZEUGwlip+3BYv5Fufll2Tkv7v8GiW2FU=;
  b=Uoir5r3j54D2ETlNoqiL8SAABJ3C6KCdpX/HhbN7bD0ynJ3cLifmlPIZ
   RTXIINScmWp+v+q+b++95Wm6fY8ovUjsWpIvwtmq3VyCiRtBRW/2XXvEV
   aUorydGSEymGJTFPBOQmba/ZjSpnpgdeI46Ip3iJ7Ho+y2GUqWcE1K1Gg
   dsbtTGlvDtNTLHtXuUsIm8g6C2CizowdONDb3E9Ch7iHKfMccw0H+6zt4
   ESXKNMUca6a2xtkV/pzqP2NJCFng/1XGYVABiqtlfXTp81194Jdbsrd0a
   Uh1VzNwdiqMkoFUfYv06Ue975lcMUqA+cdJ021k/n5xlavpyZMnMn1/kf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2712909"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="2712909"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 23:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="810132501"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="810132501"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 18 Dec 2023 23:39:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFUhM-0004zM-1l;
	Tue, 19 Dec 2023 07:39:28 +0000
Date: Tue, 19 Dec 2023 15:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 16/27] arch/arm64/kvm/guest.c:325:7:
 error: call to undeclared function 'vq_available'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202312191524.uLR2p3Ec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   52abc971c4f55f4327e7558b4df424d11ccfa9a8
commit: 04582e4032d48202fd807125d498f91c85e1b923 [16/27] KVM: arm64: Implement SME vector length configuration
config: arm64-randconfig-003-20231219 (https://download.01.org/0day-ci/archive/20231219/202312191524.uLR2p3Ec-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 5ac12951b4e9bbfcc5791282d0961ec2b65575e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191524.uLR2p3Ec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191524.uLR2p3Ec-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/guest.c:325:7: error: call to undeclared function 'vq_available'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |                 if (vq_available(vec_type, vq))
         |                     ^
   arch/arm64/kvm/guest.c:325:7: note: did you mean 'sve_vq_available'?
   arch/arm64/include/asm/fpsimd.h:332:20: note: 'sve_vq_available' declared here
     332 | static inline bool sve_vq_available(unsigned int vq) { return false; }
         |                    ^
   arch/arm64/kvm/guest.c:365:30: error: call to undeclared function 'vq_available'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     365 |                 if (vq_present(vqs, vq) != vq_available(vec_type, vq))
         |                                            ^
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
