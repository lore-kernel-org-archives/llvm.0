Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B362CA3
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643226858; x=1674762858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EiT41giUqcW/0GqXGVf6/xHw6IYAqQc2dNP8ZAMbYls=;
  b=Hp9XwbwZJgmFB7MzBFt8zc8cAtI+GwgykpZpZudrZ2HvtA/zXXLYPl0s
   65cCghKk/4D7zUct5TP4OulblzcBXI9xZfiP/d0GToPujqAn+h4YhgEmJ
   xPz1dwjNcczFxXDawY8mlAXh7rLXjT5+s70Ys4nHtX3orN8ikA+33jBUL
   bz8ZpLR2ERq+yc23O7AeyDzF83IhuMgOuJF/jJOND21WmrfGdyZ/gkiP9
   DoqX3PYMyJXsUgXnw+Vvw0D5l1svHgt9+LCplQkWO+pZ2Q4YDj6gefnH0
   HnBUx5VO4D/9Xi2qP7YIHNyDy/zQhMiOCSKZLTPx5IC+dhQBFI/Cyx9TQ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244236694"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="244236694"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 11:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="563514541"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Jan 2022 11:54:15 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCoMw-000Lau-S3; Wed, 26 Jan 2022 19:54:14 +0000
Date: Thu, 27 Jan 2022 03:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org, Quentin Perret <qperret@google.com>,
	Will Deacon <willdeacon@google.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-trusty-5.10
 4727/5866] arch/arm64/kvm/hyp/nvhe/hyp-main.c:245:3: error: implicit
 declaration of function 'sve_cond_update_zcr_vq'
Message-ID: <202201270330.KuQqBytU-lkp@intel.com>
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
commit: 194fd166b5d5f6694047b45dc409f9620a8a9646 [4727/5866] BACKPORT: FROMGIT: KVM: arm64: Trap host SVE accesses when the FPSIMD state is dirty
config: arm64-randconfig-r022-20220124 (https://download.01.org/0day-ci/archive/20220127/202201270330.KuQqBytU-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/194fd166b5d5f6694047b45dc409f9620a8a9646
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-trusty-5.10
        git checkout 194fd166b5d5f6694047b45dc409f9620a8a9646
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   arch/arm64/kvm/hyp/include/hyp/switch.h:216:2: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror,-Wimplicit-function-declaration]
           sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
           ^
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:245:3: error: implicit declaration of function 'sve_cond_update_zcr_vq' [-Werror,-Wimplicit-function-declaration]
                   sve_cond_update_zcr_vq(ZCR_ELx_LEN_MASK, SYS_ZCR_EL2);
                   ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:233:6: warning: no previous prototype for function 'handle_trap' [-Wmissing-prototypes]
   void handle_trap(struct kvm_cpu_context *host_ctxt)
        ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void handle_trap(struct kvm_cpu_context *host_ctxt)
   ^
   static 
   1 warning and 2 errors generated.


vim +/sve_cond_update_zcr_vq +245 arch/arm64/kvm/hyp/nvhe/hyp-main.c

   232	
   233	void handle_trap(struct kvm_cpu_context *host_ctxt)
   234	{
   235		u64 esr = read_sysreg_el2(SYS_ESR);
   236	
   237		switch (ESR_ELx_EC(esr)) {
   238		case ESR_ELx_EC_HVC64:
   239			handle_host_hcall(host_ctxt);
   240			break;
   241		case ESR_ELx_EC_SMC64:
   242			handle_host_smc(host_ctxt);
   243			break;
   244		case ESR_ELx_EC_SVE:
 > 245			sve_cond_update_zcr_vq(ZCR_ELx_LEN_MASK, SYS_ZCR_EL2);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
