Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C61922D3;
	Mon, 14 Apr 2025 05:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744610173; cv=none; b=eRS6hYaqMNU4YOEmx7Bk1c4hnNgGPa31UtqWss47kImddTDOzO8+wAl1H/M4IpmFaK96V0+xj7M+qtYz5wfLp3hRUjRz9/yWuQcOOZU+nZFYH+V6PZNSjulPD4hU7MrQs77PplG88Wz93ApGnZsDn/g8QJGA456cdIngz47LP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744610173; c=relaxed/simple;
	bh=kLksmk9hz3UZmqdEOnmhdQARiAfhpFmJxNLbquk+08s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hO+Silo0hmJOEZ82667SzUwsgj+ZHHQvstRn/oECwS3T+d+NYoKTtUXbgs82B65tbwX+6Y7jWPWxJ1JyUUD32CrOgu8IQ6y/YPr9Xyc5af3YiAGb4rd3zULoY4ljh21KMeTK/je0//CIi/zWLOIKDuTWNtRSXXqhbjPkkaVVh6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U26B2EIn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U26B2EIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744610172; x=1776146172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLksmk9hz3UZmqdEOnmhdQARiAfhpFmJxNLbquk+08s=;
  b=U26B2EInOTNncsh1ngRE1apk6LJun7rQkAeZNyTICHzBhbLcctXDFwcq
   3nBbI4+6G6gd2LqMm59iLnoTdnYrEMFjPALSv9OT4/HghsDFb/W3ei0D9
   qq9jK49tw/rSwVuWN14A5LCYkHXfVroEYAZawTVxfPqFSQXrqBdzl7qcx
   xzQ/ToXnAMfSHdK6VbLssSVa29G2d57kRJQ2OxOYAUt3qyiWof8sTcRtQ
   VBO0WQd2A+wjjdUd00SUy/xL+XgE2+ACbAMd91Yya0CZ9rnToYSHo2y8P
   ulSgzcQNpFjpmDY2APxqAvrJKGFyEMxz9RAtjBR+IJtfogeElquO3AIlN
   Q==;
X-CSE-ConnectionGUID: kTwdQiTFSh6hi1v+Go2TMA==
X-CSE-MsgGUID: IxGMlnfLR1mNWIdInhLNeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57434686"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="57434686"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 22:56:10 -0700
X-CSE-ConnectionGUID: yZIa9hqeRd+zz25ivPoSSg==
X-CSE-MsgGUID: /nhkhJULQG2oRZ85879pRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134563202"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2025 22:56:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Cne-000Dli-01;
	Mon, 14 Apr 2025 05:56:06 +0000
Date: Mon, 14 Apr 2025 13:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 38/43]
 arch/arm64/kvm/hyp/include/hyp/switch.h:353:60: error: too many arguments
 provided to function-like macro invocation
Message-ID: <202504141325.wFdySzDs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   f45bb42b58d9b51e7eb0553781a2b827b0314b20
commit: 3d6b3a16799869f8c757f073ccd92b553f6d8865 [38/43] KVM: arm64: Context switch SME state for guests
config: arm64-randconfig-001-20250414 (https://download.01.org/0day-ci/archive/20250414/202504141325.wFdySzDs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141325.wFdySzDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141325.wFdySzDs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:353:60: error: too many arguments provided to function-like macro invocation
     353 |         sme_cond_update_smcr(vcpu_sme_max_vq(vcpu) - 1, has_fa64, has_sme2,
         |                                                                   ^
   arch/arm64/include/asm/fpsimd.h:450:9: note: macro 'sme_cond_update_smcr' defined here
     450 | #define sme_cond_update_smcr(val, reg) do { } while (0)
         |         ^
   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:353:2: error: use of undeclared identifier 'sme_cond_update_smcr'
     353 |         sme_cond_update_smcr(vcpu_sme_max_vq(vcpu) - 1, has_fa64, has_sme2,
         |         ^
   2 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:8:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:353:60: error: too many arguments provided to function-like macro invocation
     353 |         sme_cond_update_smcr(vcpu_sme_max_vq(vcpu) - 1, has_fa64, has_sme2,
         |                                                                   ^
   arch/arm64/include/asm/fpsimd.h:450:9: note: macro 'sme_cond_update_smcr' defined here
     450 | #define sme_cond_update_smcr(val, reg) do { } while (0)
         |         ^
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:8:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:353:2: error: use of undeclared identifier 'sme_cond_update_smcr'
     353 |         sme_cond_update_smcr(vcpu_sme_max_vq(vcpu) - 1, has_fa64, has_sme2,
         |         ^
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:68:9: error: too many arguments provided to function-like macro invocation
      68 |                              vcpu_has_sme2(vcpu), SYS_SMCR_EL2);
         |                              ^
   arch/arm64/include/asm/fpsimd.h:450:9: note: macro 'sme_cond_update_smcr' defined here
     450 | #define sme_cond_update_smcr(val, reg) do { } while (0)
         |         ^
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:67:2: error: use of undeclared identifier 'sme_cond_update_smcr'
      67 |         sme_cond_update_smcr(vcpu_sme_max_vq(vcpu) - 1, vcpu_has_fa64(vcpu),
         |         ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:87:9: error: too many arguments provided to function-like macro invocation
      87 |                              cpus_have_final_cap(ARM64_SME2), SYS_SMCR_EL2);
         |                              ^
   arch/arm64/include/asm/fpsimd.h:450:9: note: macro 'sme_cond_update_smcr' defined here
     450 | #define sme_cond_update_smcr(val, reg) do { } while (0)
         |         ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:85:2: error: use of undeclared identifier 'sme_cond_update_smcr'
      85 |         sme_cond_update_smcr(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SME]) - 1,
         |         ^
   6 errors generated.


vim +353 arch/arm64/kvm/hyp/include/hyp/switch.h

   345	
   346	static inline void __hyp_sme_restore_guest(struct kvm_vcpu *vcpu,
   347						   bool *restore_sve,
   348						   bool *restore_ffr)
   349	{
   350		bool has_fa64 = vcpu_has_fa64(vcpu);
   351		bool has_sme2 = vcpu_has_sme2(vcpu);
   352	
 > 353		sme_cond_update_smcr(vcpu_sme_max_vq(vcpu) - 1, has_fa64, has_sme2,
   354				     SYS_SMCR_EL2);
   355	
   356		write_sysreg_el1(__vcpu_sys_reg(vcpu, SMCR_EL1), SYS_SMCR);
   357	
   358		write_sysreg_s(__vcpu_sys_reg(vcpu, SVCR), SYS_SVCR);
   359	
   360		if (vcpu_in_streaming_mode(vcpu)) {
   361			*restore_sve = true;
   362			*restore_ffr = has_fa64;
   363		}
   364	
   365		if (vcpu_za_enabled(vcpu))
   366			__sme_restore_state(vcpu_sme_state(vcpu), has_sme2);
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
