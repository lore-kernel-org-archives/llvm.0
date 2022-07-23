Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A616C7E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658576602; x=1690112602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfnCHYoMY2tDPyXHKF0xWuuQt4+rPKGgT4kXodGeX08=;
  b=N0ZDzDqOoFhEwVMsUPDagbDLQNC+Lvt6cNHd6Pd7lT8XgdfpxbSaIK+9
   +cdpPUnxNzKF8gSfkrG2jUA7+hk9W+xZ5oOdHB9HnENLBhrLxP0rJ2IQD
   JirTglfF6B4jDYBMWBvVCb2t1jhotjBy8vbHyG1rFD3D7k8PZKcpj4zrm
   GPM0Yt1OuLDCP0T7LWdjGAD2K7l/B+jan9YRKgrzRp/YIfH+oKfhuq5Ss
   e27hMCLxqQ5A4DroKPN3J/FNeCF8OADkvUkogC8Zw8S67TOt0oURgKU7M
   1Tzis8cKinQuRmlU2acgr7lGnqhF8zkCpjdUj9groypSWztP4O4721WK0
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="288642869"
X-IronPort-AV: E=Sophos;i="5.93,188,1654585200"; 
   d="scan'208";a="288642869"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2022 04:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,188,1654585200"; 
   d="scan'208";a="574461537"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Jul 2022 04:43:20 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFDXT-0002Y5-15;
	Sat, 23 Jul 2022 11:43:19 +0000
Date: Sat, 23 Jul 2022 19:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Atish Patra <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>
Subject: [atishp04:sstc_v6 5/5] arch/riscv/kvm/vcpu_timer.c:302:23: warning:
 variable 'csr' set but not used
Message-ID: <202207231936.SWNvXLnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux sstc_v6
head:   c20c842325eb8261b2a0a034aad746505475fef7
commit: c20c842325eb8261b2a0a034aad746505475fef7 [5/5] RISC-V: KVM: Support sstc extension
config: riscv-randconfig-c006-20220721 (https://download.01.org/0day-ci/archive/20220723/202207231936.SWNvXLnK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/atishp04/linux/commit/c20c842325eb8261b2a0a034aad746505475fef7
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 sstc_v6
        git checkout c20c842325eb8261b2a0a034aad746505475fef7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_timer.c:302:23: warning: variable 'csr' set but not used [-Wunused-but-set-variable]
           struct kvm_vcpu_csr *csr;
                                ^
   arch/riscv/kvm/vcpu_timer.c:327:23: warning: variable 'csr' set but not used [-Wunused-but-set-variable]
           struct kvm_vcpu_csr *csr;
                                ^
   2 warnings generated.


vim +/csr +302 arch/riscv/kvm/vcpu_timer.c

   299	
   300	void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
   301	{
 > 302		struct kvm_vcpu_csr *csr;
   303		struct kvm_vcpu_timer *t = &vcpu->arch.timer;
   304	
   305		kvm_riscv_vcpu_update_timedelta(vcpu);
   306	
   307		if (!t->sstc_enabled)
   308			return;
   309	
   310		csr = &vcpu->arch.guest_csr;
   311	#if defined(CONFIG_32BIT)
   312		csr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
   313		csr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
   314	#else
   315		csr_write(CSR_VSTIMECMP, t->next_cycles);
   316	#endif
   317	
   318		/* timer should be enabled for the remaining operations */
   319		if (unlikely(!t->init_done))
   320			return;
   321	
   322		kvm_riscv_vcpu_timer_unblocking(vcpu);
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
