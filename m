Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0338C3FCE
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 22:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643236046; x=1674772046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FiUdITY5Eu5ZGdXWjoskPBCnS9kcaGk9t5jjocwL+nc=;
  b=azhIE/c3aQ++AcQQIPcjxgMm/pFgs63iGKEl2j2+1eSmfynX2kgyb3H2
   YgsXuK2e88Amo86mwR/JhgRLGnfvSAANGnMA26gP8dVUw7NaL8SAK0vHC
   +dEteNDAg5ix3z10C+j2Ba6S13tkTWfscEQ7e6MM3kF7qp3oB1C8F6Jo0
   VRl+ER1H5AH8fxD9KbwXG0pkjXhN0zjqxTEXJzTvIgiyJ0CR9YSGKz7G/
   t4I7TYZBvc6Xbwc/vvJ42g3RmRABiVFIy9s9FHEggU93NIqDjoDEosbSH
   PaFWDWUWsBKLqCSU4rr7/EWrPennTA/d0cb1mWk+bbTwo+Ibik8vHpOFo
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="244266538"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="244266538"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 14:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="696391770"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2022 14:27:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCql8-000Lj7-BJ; Wed, 26 Jan 2022 22:27:22 +0000
Date: Thu, 27 Jan 2022 06:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org, Quentin Perret <qperret@google.com>,
	Will Deacon <willdeacon@google.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-trusty-5.10
 4728/5866] arch/arm64/kvm/fpsimd.c:129:5: error: implicit declaration of
 function 'sve_cond_update_zcr_vq'
Message-ID: <202201270637.CwoQKBGC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Marc,

FYI, the error/warning still remains.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-trusty-5.10
head:   52cdd137fae0b001197a51646289e3cbdda921d5
commit: b0e15c8c44275afef4aacfb1560e38b974b02ac8 [4728/5866] FROMGIT: KVM: arm64: Save/restore SVE state for nVHE
config: arm64-randconfig-r022-20220124 (https://download.01.org/0day-ci/archive/20220127/202201270637.CwoQKBGC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/b0e15c8c44275afef4aacfb1560e38b974b02ac8
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-trusty-5.10
        git checkout b0e15c8c44275afef4aacfb1560e38b974b02ac8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/fpsimd.c:129:5: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror,-Wimplicit-function-declaration]
                                   sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,
                                   ^
   1 error generated.


vim +/sve_cond_update_zcr_vq +129 arch/arm64/kvm/fpsimd.c

   108	
   109	/*
   110	 * Write back the vcpu FPSIMD regs if they are dirty, and invalidate the
   111	 * cpu FPSIMD regs so that they can't be spuriously reused if this vcpu
   112	 * disappears and another task or vcpu appears that recycles the same
   113	 * struct fpsimd_state.
   114	 */
   115	void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
   116	{
   117		unsigned long flags;
   118		bool host_has_sve = system_supports_sve();
   119		bool guest_has_sve = vcpu_has_sve(vcpu);
   120	
   121		local_irq_save(flags);
   122	
   123		if (vcpu->arch.flags & KVM_ARM64_FP_ENABLED) {
   124			if (guest_has_sve) {
   125				__vcpu_sys_reg(vcpu, ZCR_EL1) = read_sysreg_el1(SYS_ZCR);
   126	
   127				/* Restore the VL that was saved when bound to the CPU */
   128				if (!has_vhe())
 > 129					sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
