Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A53168
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643217197; x=1674753197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WIgJq1vWU6jw1/jQDPrNCQhuhtK+wLmdU8VzdaGKxSI=;
  b=XmuzVOJuwcgfPIXtOgZqMHRdziVqszi5n/Arb8ZDYWblqu18d/HvtC0y
   YzZUfFDqENlUSn1MXFvHfL/Ko0PK3OoSQY7VtAvyNsbtDkoHIyozGRC88
   3anU96cjnED5GDbcPZhZOKxYPDHwZzsSFipV8Xgz2Jxi7K0w+obVIwv+Z
   V8SfPjUppKbRkwasWwgs+rx7xB65p1pt8p6T2Di3hDBjjsT6Bwf9+f5bc
   Xt5C2UDeZxn+cGxyp/8DI+64OZclXvPXYTZEnfiXWdJEXYz0GG5JjCRYM
   zWBSELAOnYS7GOiDUQuvoWqWpSu6ui36tH+VQPOvT09JZQKGo/AEH0/zM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246817358"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="246817358"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 09:11:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="696302581"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2022 09:11:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nClp1-000LRF-Et; Wed, 26 Jan 2022 17:11:03 +0000
Date: Thu, 27 Jan 2022 01:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org, Quentin Perret <qperret@google.com>,
	Will Deacon <willdeacon@google.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10
 1026/9999] arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit
 declaration of function 'sve_cond_update_zcr_vq'
Message-ID: <202201270116.Lw5fVBBz-lkp@intel.com>
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

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-5.10
head:   4b1862e4fc6967bf326107ac0d5695157f32c25d
commit: 1105b4d1cef4bc19ad20129a716194268c937eaf [1026/9999] BACKPORT: FROMGIT: KVM: arm64: Rework SVE host-save/guest-restore
config: arm64-randconfig-r022-20220124 (https://download.01.org/0day-ci/archive/20220127/202201270116.Lw5fVBBz-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/1105b4d1cef4bc19ad20129a716194268c937eaf
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-5.10
        git checkout 1105b4d1cef4bc19ad20129a716194268c937eaf
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/switch.c:8:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror,-Wimplicit-function-declaration]
           sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
           ^
   arch/arm64/kvm/hyp/vhe/switch.c:227:17: warning: no previous prototype for function 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
   asmlinkage void kvm_unexpected_el2_exception(void)
                   ^
   arch/arm64/kvm/hyp/vhe/switch.c:227:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void kvm_unexpected_el2_exception(void)
              ^
              static 
   1 warning and 1 error generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:8:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror,-Wimplicit-function-declaration]
           sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
           ^
   arch/arm64/kvm/hyp/nvhe/switch.c:282:17: warning: no previous prototype for function 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
   asmlinkage void kvm_unexpected_el2_exception(void)
                   ^
   arch/arm64/kvm/hyp/nvhe/switch.c:282:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void kvm_unexpected_el2_exception(void)
              ^
              static 
   1 warning and 1 error generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror,-Wimplicit-function-declaration]
           sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
           ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:233:6: warning: no previous prototype for function 'handle_trap' [-Wmissing-prototypes]
   void handle_trap(struct kvm_cpu_context *host_ctxt)
        ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void handle_trap(struct kvm_cpu_context *host_ctxt)
   ^
   static 
   1 warning and 1 error generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:15:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror,-Wimplicit-function-declaration]
           sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
           ^
   1 error generated.


vim +/sve_cond_update_zcr_vq +216 arch/arm64/kvm/hyp/include/hyp/switch.h

   213	
   214	static inline void __hyp_sve_restore_guest(struct kvm_vcpu *vcpu)
   215	{
 > 216		sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
   217		__sve_restore_state(vcpu_sve_pffr(vcpu),
   218				    &vcpu->arch.ctxt.fp_regs.fpsr);
   219		write_sysreg_el1(__vcpu_sys_reg(vcpu, ZCR_EL1), SYS_ZCR);
   220	}
   221	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
