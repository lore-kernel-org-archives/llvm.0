Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612B7138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652735172; x=1684271172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OiTkWpvVQg1oDb85FadfPVoeph8BDp4glXEEbhxZyXU=;
  b=KxkQAuQ32bvteNTMAMPh+WJJRatHzqtHDFWj7HVt/wv3Sop2jz8MD2ri
   11tktcF68qYcCH3GOdnjWCIkNOLYQMKn9WmYRF8DkQpcPGBfrPOxqOHv9
   ltz7YdAyTDTYVmQ4Te6RMNaoyh04YpSgFdfEffscsyPQY3E5RqeFMBCJC
   naysLPR9/sb9Uj0aLDlIH7+E3Yr41p/xI2Sfa+51jrjW3bEdwkQggUJaw
   WhxrDbf4PIkDtAuYG3WWi0uh1nVxioPc3J7imn4o6lj6dqpPGcDGxqkxZ
   aMCGUmheiemYQTtdtjrandp0dKZhyRDgrgt3Rv8+MDmtgN22pcMN4r2MV
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="331576927"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="331576927"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 14:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="660296101"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 May 2022 14:05:51 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqhuY-0000LA-IM;
	Mon, 16 May 2022 21:05:50 +0000
Date: Tue, 17 May 2022 05:05:47 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@google.com>
Subject: [arm-platforms:kvm-arm64/per-vcpu-host-pmu-data 3/5]
 arch/arm64/kvm/pmu.c:31:9: error: arithmetic on a pointer to an incomplete
 type 'typeof(struct kvm_pmu_events)' (aka 'struct kvm_pmu_events')
Message-ID: <202205170503.iV7Pj4uC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/per-vcpu-host-pmu-data
head:   20492a62b99bd4367b79a76ca288d018f11980db
commit: 84d751a019a9792f5b4884e1d598b603c360ec22 [3/5] KVM: arm64: Pass pmu events to hyp via vcpu
config: arm64-randconfig-r001-20220516 (https://download.01.org/0day-ci/archive/20220517/202205170503.iV7Pj4uC-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the arm-platforms/kvm-arm64/per-vcpu-host-pmu-data HEAD 20492a62b99bd4367b79a76ca288d018f11980db builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/arm64/kvm/pmu.c:9:46: warning: tentative definition of variable with internal linkage has incomplete non-array type 'typeof(struct kvm_pmu_events)' (aka 'struct kvm_pmu_events') [-Wtentative-definition-incomplete-type]
   static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);
                                                ^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
>> arch/arm64/kvm/pmu.c:31:9: error: arithmetic on a pointer to an incomplete type 'typeof(struct kvm_pmu_events)' (aka 'struct kvm_pmu_events')
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
>> arch/arm64/kvm/pmu.c:46:6: error: incomplete definition of type 'struct kvm_pmu_events'
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
>> arch/arm64/kvm/pmu.c:9:46: error: tentative definition has type 'typeof(struct kvm_pmu_events)' (aka 'struct kvm_pmu_events') that is never completed
   static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);
                                                ^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   1 warning and 10 errors generated.
--
>> arch/arm64/kvm/arm.c:764:17: error: no member named 'events' in 'struct kvm_pmu'
           vcpu->arch.pmu.events = *kvm_get_pmu_events();
           ~~~~~~~~~~~~~~ ^
   1 error generated.
--
>> arch/arm64/kvm/hyp/nvhe/switch.c:128:47: error: no member named 'events' in 'struct kvm_pmu'
           struct kvm_pmu_events *pmu = &vcpu->arch.pmu.events;
                                         ~~~~~~~~~~~~~~ ^
>> arch/arm64/kvm/hyp/nvhe/switch.c:130:9: error: incomplete definition of type 'struct kvm_pmu_events'
           if (pmu->events_host)
               ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:131:19: error: incomplete definition of type 'struct kvm_pmu_events'
                   write_sysreg(pmu->events_host, pmcntenclr_el0);
                                ~~~^
   arch/arm64/include/asm/sysreg.h:1300:20: note: expanded from macro 'write_sysreg'
           u64 __val = (u64)(v);                                   \
                             ^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:133:9: error: incomplete definition of type 'struct kvm_pmu_events'
           if (pmu->events_guest)
               ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:134:19: error: incomplete definition of type 'struct kvm_pmu_events'
                   write_sysreg(pmu->events_guest, pmcntenset_el0);
                                ~~~^
   arch/arm64/include/asm/sysreg.h:1300:20: note: expanded from macro 'write_sysreg'
           u64 __val = (u64)(v);                                   \
                             ^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:136:13: error: incomplete definition of type 'struct kvm_pmu_events'
           return (pmu->events_host || pmu->events_guest);
                   ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:136:33: error: incomplete definition of type 'struct kvm_pmu_events'
           return (pmu->events_host || pmu->events_guest);
                                       ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:144:47: error: no member named 'events' in 'struct kvm_pmu'
           struct kvm_pmu_events *pmu = &vcpu->arch.pmu.events;
                                         ~~~~~~~~~~~~~~ ^
   arch/arm64/kvm/hyp/nvhe/switch.c:146:9: error: incomplete definition of type 'struct kvm_pmu_events'
           if (pmu->events_guest)
               ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:147:19: error: incomplete definition of type 'struct kvm_pmu_events'
                   write_sysreg(pmu->events_guest, pmcntenclr_el0);
                                ~~~^
   arch/arm64/include/asm/sysreg.h:1300:20: note: expanded from macro 'write_sysreg'
           u64 __val = (u64)(v);                                   \
                             ^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:149:9: error: incomplete definition of type 'struct kvm_pmu_events'
           if (pmu->events_host)
               ~~~^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:150:19: error: incomplete definition of type 'struct kvm_pmu_events'
                   write_sysreg(pmu->events_host, pmcntenset_el0);
                                ~~~^
   arch/arm64/include/asm/sysreg.h:1300:20: note: expanded from macro 'write_sysreg'
           u64 __val = (u64)(v);                                   \
                             ^
   arch/arm64/include/asm/kvm_host.h:793:8: note: forward declaration of 'struct kvm_pmu_events'
   struct kvm_pmu_events *kvm_get_pmu_events(void);
          ^
   arch/arm64/kvm/hyp/nvhe/switch.c:189:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
                                             ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:188:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:190:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
                                             ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:188:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:191:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
                                             ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:188:28: note: previous initialization is here
           [0 ... ESR_ELx_EC_MAX]          = NULL,
                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)


vim +31 arch/arm64/kvm/pmu.c

     8	
   > 9	static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);
    10	
    11	/*
    12	 * Given the perf event attributes and system type, determine
    13	 * if we are going to need to switch counters at guest entry/exit.
    14	 */
    15	static bool kvm_pmu_switch_needed(struct perf_event_attr *attr)
    16	{
    17		/**
    18		 * With VHE the guest kernel runs at EL1 and the host at EL2,
    19		 * where user (EL0) is excluded then we have no reason to switch
    20		 * counters.
    21		 */
    22		if (has_vhe() && attr->exclude_user)
    23			return false;
    24	
    25		/* Only switch if attributes are different */
    26		return (attr->exclude_host != attr->exclude_guest);
    27	}
    28	
    29	struct kvm_pmu_events *kvm_get_pmu_events(void)
    30	{
  > 31		return this_cpu_ptr(&kvm_pmu_events);
    32	}
    33	
    34	/*
    35	 * Add events to track that we may want to switch at guest entry/exit
    36	 * time.
    37	 */
    38	void kvm_set_pmu_events(u32 set, struct perf_event_attr *attr)
    39	{
    40		struct kvm_pmu_events *pmu = kvm_get_pmu_events();
    41	
    42		if (!kvm_arm_support_pmu_v3() || !pmu || !kvm_pmu_switch_needed(attr))
    43			return;
    44	
    45		if (!attr->exclude_host)
  > 46			pmu->events_host |= set;
    47		if (!attr->exclude_guest)
    48			pmu->events_guest |= set;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
