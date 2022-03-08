Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF107491
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646777984; x=1678313984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cp8zGGLTLUHm8iCY4AoXsdfeinLenignQ5FmKmCOhbE=;
  b=RlTrwxPuY+W9qovBrgAqPxoCNUlbKOh1qcFjD8UZl1f5ekxy/gbpmE9X
   eHaChpEvMMCYMf3ybCAwpIU3jA3vUuhhWuUSqToAhVf8drysK9HQ3gA1O
   rXE/dNX4eH2/N3+b6mgptObJ1vS+hgQMhQfJSkbiH54XF2GZPlVHF5XoE
   kGUiOeTrK//0yJcby+iC97aY39UbDanz0djpSFiJOFRvWhi+i3ifyM51o
   tt7MTMzFeRxIWPnSgRO56HnC6IjN1ogAWhmhWpU+GaUxjGhfZbVmkHn1Z
   mppkBka9AR29f6IYYwQ4A7o9ea+6HKwJI4yHHVbCzMHvPqfcumkj4Ly2T
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="234781222"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="234781222"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 14:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="643816899"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Mar 2022 14:19:40 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRiBA-00025r-61; Tue, 08 Mar 2022 22:19:40 +0000
Date: Wed, 9 Mar 2022 06:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: Li RongQing <lirongqing@baidu.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wang GuangJu <wangguangju@baidu.com>
Subject: [kvm:queue 182/203] arch/x86/kernel/kvm.c:769:4: error: use of
 undeclared identifier '__raw_callee_save___kvm_vcpu_is_preempted'
Message-ID: <202203090613.qYNxBFkZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   00a2bd3464280ca1f08e2cbfab22b884ffb731d8
commit: dc889a8974087aba3eb1cc6db2066fbbdb58922a [182/203] KVM: x86: Support the vCPU preemption check with nopvspin and realtime hint
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220309/202203090613.qYNxBFkZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0dc66b76fe4c33843755ade391b85ffda0742aeb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=dc889a8974087aba3eb1cc6db2066fbbdb58922a
        git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
        git fetch --no-tags kvm queue
        git checkout dc889a8974087aba3eb1cc6db2066fbbdb58922a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kernel/kvm.c:769:4: error: use of undeclared identifier '__raw_callee_save___kvm_vcpu_is_preempted'
                           PV_CALLEE_SAVE(__kvm_vcpu_is_preempted);
                           ^
   arch/x86/include/asm/paravirt.h:683:35: note: expanded from macro 'PV_CALLEE_SAVE'
           ((struct paravirt_callee_save) { __raw_callee_save_##func })
                                            ^
   <scratch space>:52:1: note: expanded from here
   __raw_callee_save___kvm_vcpu_is_preempted
   ^
   1 error generated.


vim +/__raw_callee_save___kvm_vcpu_is_preempted +769 arch/x86/kernel/kvm.c

   754	
   755	static void __init kvm_guest_init(void)
   756	{
   757		int i;
   758	
   759		paravirt_ops_setup();
   760		register_reboot_notifier(&kvm_pv_reboot_nb);
   761		for (i = 0; i < KVM_TASK_SLEEP_HASHSIZE; i++)
   762			raw_spin_lock_init(&async_pf_sleepers[i].lock);
   763	
   764		if (kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
   765			has_steal_clock = 1;
   766			static_call_update(pv_steal_clock, kvm_steal_clock);
   767	
   768			pv_ops.lock.vcpu_is_preempted =
 > 769				PV_CALLEE_SAVE(__kvm_vcpu_is_preempted);
   770		}
   771	
   772		if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
   773			apic_set_eoi_write(kvm_guest_apic_eoi_write);
   774	
   775		if (kvm_para_has_feature(KVM_FEATURE_ASYNC_PF_INT) && kvmapf) {
   776			static_branch_enable(&kvm_async_pf_enabled);
   777			alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, asm_sysvec_kvm_asyncpf_interrupt);
   778		}
   779	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
