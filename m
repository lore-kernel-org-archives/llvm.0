Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC425EC5
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652703281; x=1684239281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Q8f1JvyHhUxmG26SWRNtSo7rrD6kouF7yvqy7cOjJY=;
  b=FtYPGcZteqIlwdpYvaHV/8axBG3RFRQDvgriVJjQdoQRFRrIr3neAT2m
   gtwkYewHsF1rSybjFee8ZhoYTAuroI0IO3Mh2YuQsVKHmZjmiKl2lhwpy
   IUmkxjSJsS8UuNVuh7hLLpG1fmFLTmNB10bckUtpZaX5FmlJqxt78a7PQ
   4HgWqnaBta3EdRZhQNrJs3ITIM8I57JYs6KqNiaCD6xGKRO8RkYPdxuBA
   z+FPSAYxD+xqQe5faczesLfA4IxarW3dt6CS4GJBPMKanpqkAt3glSOFI
   goFTbf2fdMTtXvedhf1fdcFPvrgzaApalXQuwCiwGwASKGFuUQFpnb2iX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="258382342"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="258382342"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 05:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="568289295"
Received: from lkp-server02.sh.intel.com (HELO 0628dcddc537) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 May 2022 05:14:30 -0700
Received: from kbuild by 0628dcddc537 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqZcM-00004y-3p;
	Mon, 16 May 2022 12:14:30 +0000
Date: Mon, 16 May 2022 20:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@google.com>
Subject: [arm-platforms:kvm-arm64/per-vcpu-host-pmu-data 3/4]
 arch/arm64/kvm/pmu.c:9:46: warning: tentative definition of variable with
 internal linkage has incomplete non-array type 'typeof(struct
 kvm_pmu_events)' (aka 'struct kvm_pmu_events')
Message-ID: <202205162042.UpDGm191-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/per-vcpu-host-pmu-data
head:   722625c6f4c5b6a9953d6af04c7bb1a6e12830b3
commit: 84d751a019a9792f5b4884e1d598b603c360ec22 [3/4] KVM: arm64: Pass pmu events to hyp via vcpu
config: arm64-randconfig-r001-20220516 (https://download.01.org/0day-ci/archive/20220516/202205162042.UpDGm191-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=84d751a019a9792f5b4884e1d598b603c360ec22
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/per-vcpu-host-pmu-data
        git checkout 84d751a019a9792f5b4884e1d598b603c360ec22
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/ kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/pmu.c:9:46: warning: tentative definition of variable with internal linkage has incomplete non-array type 'typeof(struct kvm_pmu_events)' (aka 'struct kvm_pmu_events') [-Wtentative-definition-incomplete-type]
   static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);
                                                ^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:31:9: error: arithmetic on a pointer to an incomplete type 'typeof(struct kvm_pmu_events)' (aka 'struct kvm_pmu_events')
           return this_cpu_ptr(&kvm_pmu_events);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:219:52: note: expanded from macro '__verify_pcpu_ptr'
           const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
                                                       ~~~~~ ^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:46:6: error: incomplete definition of type 'struct kvm_pmu_events'
                   pmu->events_host |= set;
                   ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:48:6: error: incomplete definition of type 'struct kvm_pmu_events'
                   pmu->events_guest |= set;
                   ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:61:5: error: incomplete definition of type 'struct kvm_pmu_events'
           pmu->events_host &= ~clr;
           ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:62:5: error: incomplete definition of type 'struct kvm_pmu_events'
           pmu->events_guest &= ~clr;
           ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:186:20: error: incomplete definition of type 'struct kvm_pmu_events'
           events_guest = pmu->events_guest;
                          ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:187:19: error: incomplete definition of type 'struct kvm_pmu_events'
           events_host = pmu->events_host;
                         ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:206:20: error: incomplete definition of type 'struct kvm_pmu_events'
           events_guest = pmu->events_guest;
                          ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:207:19: error: incomplete definition of type 'struct kvm_pmu_events'
           events_host = pmu->events_host;
                         ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/pmu.c:9:46: error: tentative definition has type 'typeof(struct kvm_pmu_events)' (aka 'struct kvm_pmu_events') that is never completed
   static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);
                                                ^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   1 warning and 10 errors generated.


vim +9 arch/arm64/kvm/pmu.c

     8	
   > 9	static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);
    10	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
