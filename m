Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2A82EB0F;
	Sat, 11 Jul 2026 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783763246; cv=none; b=CJH+KoSg6coxFRRKh/9JapAvKJXi1t4tohOCNHmPQ3T3H5HDzaPVmrqjU1IBj5GKC/q6uy5/KbptKC2sjO8HriwOLNQlQkfscjmeLV6/5hUDjYUWGYFlWIyRZ9NJct1WgM50pW+aAQs1ETP8NA3wjNaegFRWwrnXgzP1XycGuP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783763246; c=relaxed/simple;
	bh=+OJDRIVgQl0tEspOeu+Ie4UXUXqjifeaamvuBgPZJ30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RMcSa5hf+21+p7Mr83ZbT7h/DfJ6QnOXMV88PZYCwxyMzR1fcc8gPY+FiE9BBONDyhaTvw3z7y3Lb8QADFvpDPjFG4bCbZB+oNWuqGH4HqteV6H70EmLK/+L/uYJNpAT3lf94EDLgmX7BtCT3Q0lT02kutwHCYTlQVg7ggEnesA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXeQvGr9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXeQvGr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783763245; x=1815299245;
  h=date:from:to:cc:subject:message-id;
  bh=+OJDRIVgQl0tEspOeu+Ie4UXUXqjifeaamvuBgPZJ30=;
  b=fXeQvGr9X+7+MgTzMEgdshC9fPsmyKPch6Hz5tKMiyRPN5X+gyAmGH+g
   PZgMkLOweecirz/rjs5W1bT3FaUrvJwr01BbgoPE48DmLDCxApOUlbaGv
   XaKoW/M7cSqgZWCZj1850r4t6PvfVnzd+4k/yw+tD4yCFkuGtGp3xDSLN
   amsaiBLOcxENh8wJTKxJvMId5uGLnj8y1H2vgDzbPFp2UcoP5UnsBqBQl
   IiCfXvmx4SeOBfP8keEhDk+UabJ743Lc35kfw8RWxLL+yga3sU6mBtTEn
   z97ss4Ocptcngd7xsFHi/UvVVopMwZWqeBoIfgMjTxnaOQ4+2GgW7Sfcu
   Q==;
X-CSE-ConnectionGUID: OUr5q7CPQI+LRk16Xd5c9w==
X-CSE-MsgGUID: sFpjxaW8TlmrV1zJMZeksg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84417214"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84417214"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 02:47:24 -0700
X-CSE-ConnectionGUID: 5CuuPpPiRFyIc25Fhe3cFA==
X-CSE-MsgGUID: D9HiRkOoQOSGERLgvUjWqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259406068"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Jul 2026 02:47:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiUIq-00000000JxE-0KUL;
	Sat, 11 Jul 2026 09:47:20 +0000
Date: Sat, 11 Jul 2026 17:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 23/30]
 arch/arm64/kvm/hyp/include/hyp/switch.h:518:7: warning: unused variable
 'max_len'
Message-ID: <202607111758.HexaozQP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   b53a1666379c25919672622adc3e3984693ef9a1
commit: 68a05d441f4a2bbe2e9d717764fb171c99f9ec30 [23/30] KVM: arm64: Context switch SME state for guests
config: arm64-randconfig-001-20260708 (https://download.01.org/0day-ci/archive/20260711/202607111758.HexaozQP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111758.HexaozQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111758.HexaozQP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
   arch/arm64/kvm/hyp/include/hyp/switch.h:489:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     489 |         u64 zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
         |             ^~~~~~~
>> arch/arm64/kvm/hyp/include/hyp/switch.h:518:7: warning: unused variable 'max_len' [-Wunused-variable]
     518 |                 u64 max_len = vcpu_sme_max_vq(vcpu) - 1;
         |                     ^~~~~~~
>> arch/arm64/kvm/hyp/include/hyp/switch.h:519:7: warning: unused variable 'smcr_len' [-Wunused-variable]
     519 |                 u64 smcr_len = SYS_FIELD_GET(SMCR_ELx, LEN,
         |                     ^~~~~~~~
   3 warnings generated.


vim +/max_len +518 arch/arm64/kvm/hyp/include/hyp/switch.h

   498	
   499	static inline void __hyp_nv_restore_guest_vls(struct kvm_vcpu *vcpu)
   500	{
   501		if (!is_nested_ctxt(vcpu))
   502			return;
   503	
   504		/*
   505		 * The effective VL for a VM could differ from the max VL when running a
   506		 * nested guest, as the guest hypervisor could select a smaller VL. Slap
   507		 * that into hardware before wrapping up.
   508		 */
   509	
   510		if (vcpu_has_sve(vcpu)) {
   511			u64 zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
   512	
   513			zcr_el2 = min(zcr_el2, __vcpu_sys_reg(vcpu, ZCR_EL2));
   514			sve_cond_update_zcr_vq(zcr_el2, SYS_ZCR_EL2);
   515		}
   516	
   517		if (vcpu_has_sme(vcpu)) {
 > 518			u64 max_len = vcpu_sme_max_vq(vcpu) - 1;
 > 519			u64 smcr_len = SYS_FIELD_GET(SMCR_ELx, LEN,
   520						     __vcpu_sys_reg(vcpu, SMCR_EL2));
   521	
   522			sme_cond_update_smcr_vq(min(smcr_len, max_len), SYS_SMCR_EL2);
   523		}
   524	}
   525	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
