Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C5063B4;
	Sun, 23 Apr 2023 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682288554; x=1713824554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nYMfmig2mi95ii8mp8wLIxP6dKXvvgVi+7wieZLZUkU=;
  b=CRSL/ToR/M9DEQQWom4vCFigXb/U4X5My8KU6pjkNLAcgDDKqJ3OUbdb
   0TvMaxU5hJPRfGcjnj0g2PoffU5eowkpAaF4gwE3TOZug0atdEbIIBqOS
   bJeW6zV2BAS8x1PAX+tI5Igh3YnANaFw8jmdueM8+WbCfdq/bwlZv3A/c
   660cRMYiSy9KNodUkkp6MEggBXt1LUxVjw+nj7hJXnfe6zqubUIGsFjzt
   wZ3jhtzd4MzhrUnLcykUSnEm7+uNORD9Mvq/Le9jq0YdnAZ+Z7ZWDc3ig
   puCbVjXcaUXrN4TRWxGmtYgCCvz6MrlRh7AO7Mv8M54mP3JjDqusUNsgA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="348228452"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="348228452"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 15:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="836743252"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="836743252"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2023 15:22:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqi6J-000i7U-0p;
	Sun, 23 Apr 2023 22:22:31 +0000
Date: Mon, 24 Apr 2023 06:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jintack Lim <jintack.lim@linaro.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [arm-platforms:kvm-arm64/nv-trap-forwarding 22/60]
 arch/arm64/kvm/at.c:105:2: warning: variable 'fail' is used uninitialized
 whenever switch default is taken
Message-ID: <202304240657.YOfivToV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-trap-forwarding
head:   83dacd59334502b4097cfb21ca565254333ea152
commit: 2dbce1d13be353b13fa3db765cce18f6d0dbc7e9 [22/60] KVM: arm64: nv: Trap and emulate AT instructions from virtual EL2
config: arm64-randconfig-r036-20230424 (https://download.01.org/0day-ci/archive/20230424/202304240657.YOfivToV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=2dbce1d13be353b13fa3db765cce18f6d0dbc7e9
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/nv-trap-forwarding
        git checkout 2dbce1d13be353b13fa3db765cce18f6d0dbc7e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240657.YOfivToV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/at.c:105:2: warning: variable 'fail' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   arch/arm64/kvm/at.c:110:7: note: uninitialized use occurs here
           if (!fail)
                ^~~~
   arch/arm64/kvm/at.c:49:11: note: initialize the variable 'fail' to silence this warning
           bool fail;
                    ^
                     = 0
   1 warning generated.


vim +/fail +105 arch/arm64/kvm/at.c

    43	
    44	void __kvm_at_s1e01(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
    45	{
    46		struct kvm_cpu_context *ctxt = &vcpu->arch.ctxt;
    47		struct mmu_config config;
    48		struct kvm_s2_mmu *mmu;
    49		bool fail;
    50	
    51		write_lock(&vcpu->kvm->mmu_lock);
    52	
    53		/*
    54		 * If HCR_EL2.{E2H,TGE} == {1,1}, the MMU context is already
    55		 * the right one (as we trapped from vEL2).
    56		 */
    57		if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu))
    58			goto skip_mmu_switch;
    59	
    60		/*
    61		 * FIXME: Obtaining the S2 MMU for a L2 is horribly racy, and
    62		 * we may not find it (recycled by another vcpu, for example).
    63		 * See the other FIXME comment below about the need for a SW
    64		 * PTW in this case.
    65		 */
    66		mmu = lookup_s2_mmu(vcpu);
    67		if (WARN_ON(!mmu))
    68			goto out;
    69	
    70		/* We've trapped, so everything is live on the CPU. */
    71		__mmu_config_save(&config);
    72	
    73		write_sysreg_el1(ctxt_sys_reg(ctxt, TTBR0_EL1),	SYS_TTBR0);
    74		write_sysreg_el1(ctxt_sys_reg(ctxt, TTBR1_EL1),	SYS_TTBR1);
    75		write_sysreg_el1(ctxt_sys_reg(ctxt, TCR_EL1),	SYS_TCR);
    76		write_sysreg_el1(ctxt_sys_reg(ctxt, SCTLR_EL1),	SYS_SCTLR);
    77		write_sysreg(kvm_get_vttbr(mmu),		vttbr_el2);
    78		/*
    79		 * REVISIT: do we need anything from the guest's VTCR_EL2? If
    80		 * looks like keeping the hosts configuration is the right
    81		 * thing to do at this stage (and we could avoid save/restore
    82		 * it. Keep the host's version for now.
    83		 */
    84		write_sysreg((config.hcr & ~HCR_TGE) | HCR_VM,	hcr_el2);
    85	
    86		isb();
    87	
    88	skip_mmu_switch:
    89	
    90		switch (op) {
    91		case OP_AT_S1E1R:
    92		case OP_AT_S1E1RP:
    93			fail = __kvm_at("s1e1r", vaddr);
    94			break;
    95		case OP_AT_S1E1W:
    96		case OP_AT_S1E1WP:
    97			fail = __kvm_at("s1e1w", vaddr);
    98			break;
    99		case OP_AT_S1E0R:
   100			fail = __kvm_at("s1e0r", vaddr);
   101			break;
   102		case OP_AT_S1E0W:
   103			fail = __kvm_at("s1e0w", vaddr);
   104			break;
 > 105		default:
   106			WARN_ON_ONCE(1);
   107			break;
   108		}
   109	
   110		if (!fail)
   111			ctxt_sys_reg(ctxt, PAR_EL1) = read_sysreg(par_el1);
   112		else
   113			ctxt_sys_reg(ctxt, PAR_EL1) = SYS_PAR_EL1_F;
   114	
   115		/*
   116		 * Failed? let's leave the building now.
   117		 *
   118		 * FIXME: how about a failed translation because the shadow S2
   119		 * wasn't populated? We may need to perform a SW PTW,
   120		 * populating our shadow S2 and retry the instruction.
   121		 */
   122		if (ctxt_sys_reg(ctxt, PAR_EL1) & SYS_PAR_EL1_F)
   123			goto nopan;
   124	
   125		/* No PAN? No problem. */
   126		if (!vcpu_el2_e2h_is_set(vcpu) || !(*vcpu_cpsr(vcpu) & PSR_PAN_BIT))
   127			goto nopan;
   128	
   129		/*
   130		 * For PAN-involved AT operations, perform the same
   131		 * translation, using EL0 this time.
   132		 */
   133		switch (op) {
   134		case OP_AT_S1E1RP:
   135			fail = __kvm_at("s1e0r", vaddr);
   136			break;
   137		case OP_AT_S1E1WP:
   138			fail = __kvm_at("s1e0w", vaddr);
   139			break;
   140		default:
   141			goto nopan;
   142		}
   143	
   144		/*
   145		 * If the EL0 translation has succeeded, we need to pretend
   146		 * the AT operation has failed, as the PAN setting forbids
   147		 * such a translation.
   148		 *
   149		 * FIXME: we hardcode a Level-3 permission fault. We really
   150		 * should return the real fault level.
   151		 */
   152		if (fail || !(read_sysreg(par_el1) & SYS_PAR_EL1_F))
   153			ctxt_sys_reg(ctxt, PAR_EL1) = (0xf << 1) | SYS_PAR_EL1_F;
   154	
   155	nopan:
   156		if (!(vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)))
   157			__mmu_config_restore(&config);
   158	
   159	out:
   160		write_unlock(&vcpu->kvm->mmu_lock);
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
