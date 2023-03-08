Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668297C;
	Wed,  8 Mar 2023 02:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678241014; x=1709777014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OdfDnUPQDtOKrp01+rLrFGldS289cUYNY1OFHAZkUqk=;
  b=SQ7Zw2RQaMIV0ToOeCx4BR5WU5kzIuVqnR88D5eVVblp9ydS32WjXjja
   +UEIYRla8NZ9YI5UpI3Je9uXXcjcHVamOtgJNbsskdr/uVJBdLeEZL4Dt
   GZdbvglwRmc7UBnWokV6bU28ZQVwfHSvlR/tLgPq6NGpYDKP1+QwCi61K
   5wqunac3IOg798uboLc+rhUs11nB9tItwJJDdseKoV0+RdDC/IT+E+y80
   zYeZDtwEzzHeLEhet4qik/Np9CCRAlYt3kaFdPeobvbkOGCoCa2fol8up
   GpBC6fLzga4S66l+fEqquGHXPQjx3ZKn1WVm6vrO/GS045uI9z38D+dQb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324342351"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="324342351"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 18:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="850913619"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="850913619"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Mar 2023 18:03:32 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZj9P-0001mh-1a;
	Wed, 08 Mar 2023 02:03:31 +0000
Date: Wed, 8 Mar 2023 10:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 33/35]
 include/linux/of_device.h:107:19: error: conflicting types for
 'of_device_uevent'
Message-ID: <202303080911.TfjjgiCK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nvmem-layouts-and-of-cleanup
head:   d8752324726fdde6bb205a5aa95ae8ff7d84eff7
commit: 576fd27b398772cd60c431ee26e40051d7bbbce0 [33/35] of: module: Mutate of_device_uevent() into two helpers
config: i386-randconfig-a016-20230306 (https://download.01.org/0day-ci/archive/20230308/202303080911.TfjjgiCK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/miquelraynal/linux-0day/commit/576fd27b398772cd60c431ee26e40051d7bbbce0
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout 576fd27b398772cd60c431ee26e40051d7bbbce0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080911.TfjjgiCK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dma/qcom/hidma_mgmt.c:14:
   In file included from include/linux/of_platform.h:12:
>> include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'
   static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
                     ^
   include/linux/of_device.h:81:20: note: previous definition is here
   static inline void of_device_uevent(const struct device *dev,
                      ^
   1 error generated.
--
   In file included from kernel/sched/fair.c:55:
   In file included from kernel/sched/sched.h:31:
   In file included from include/linux/cpufreq.h:18:
>> include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'
   static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
                     ^
   include/linux/of_device.h:81:20: note: previous definition is here
   static inline void of_device_uevent(const struct device *dev,
                      ^
   kernel/sched/fair.c:6074:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
        ^
   kernel/sched/fair.c:6074:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
   ^
   static 
   kernel/sched/fair.c:12489:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12489:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:12491:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair.c:12491:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/fair.c:12496:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12496:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:12498:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:12498:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   5 warnings and 1 error generated.
--
   In file included from kernel/power/hibernate.c:34:
   In file included from include/trace/events/power.h:8:
   In file included from include/linux/cpufreq.h:18:
>> include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'
   static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
                     ^
   include/linux/of_device.h:81:20: note: previous definition is here
   static inline void of_device_uevent(const struct device *dev,
                      ^
   kernel/power/hibernate.c:278:12: warning: no previous prototype for function 'arch_resume_nosmt' [-Wmissing-prototypes]
   __weak int arch_resume_nosmt(void)
              ^
   kernel/power/hibernate.c:278:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak int arch_resume_nosmt(void)
          ^
          static 
   1 warning and 1 error generated.
--
   In file included from arch/x86/kernel/tsc.c:11:
   In file included from include/linux/cpufreq.h:18:
>> include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'
   static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
                     ^
   include/linux/of_device.h:81:20: note: previous definition is here
   static inline void of_device_uevent(const struct device *dev,
                      ^
   In file included from arch/x86/kernel/tsc.c:25:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/tsc.c:25:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/tsc.c:25:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/tsc.c:25:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/tsc.c:25:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/tsc.c:25:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/tsc.c:25:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                        ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/tsc.c:25:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:24: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                                        ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/x86/kernel/tsc.c:25:
--
   In file included from drivers/char/tpm/tpm_tis.c:28:
>> include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'
   static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
                     ^
   include/linux/of_device.h:81:20: note: previous definition is here
   static inline void of_device_uevent(const struct device *dev,
                      ^
   In file included from drivers/char/tpm/tpm_tis.c:31:
   In file included from drivers/char/tpm/tpm.h:27:
   In file included from include/linux/tpm.h:23:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/char/tpm/tpm_tis.c:31:
   In file included from drivers/char/tpm/tpm.h:27:
   In file included from include/linux/tpm.h:23:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/char/tpm/tpm_tis.c:31:
   In file included from drivers/char/tpm/tpm.h:27:
   In file included from include/linux/tpm.h:23:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/char/tpm/tpm_tis.c:31:
   In file included from drivers/char/tpm/tpm.h:27:
   In file included from include/linux/tpm.h:23:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/char/tpm/tpm_tis.c:31:
   In file included from drivers/char/tpm/tpm.h:27:
   In file included from include/linux/tpm.h:23:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/char/tpm/tpm_tis.c:31:
   In file included from drivers/char/tpm/tpm.h:27:
   In file included from include/linux/tpm.h:23:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/char/tpm/tpm_tis.c:31:
   In file included from drivers/char/tpm/tpm.h:27:
   In file included from include/linux/tpm.h:23:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                        ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/char/tpm/tpm_tis.c:31:
--
   In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:22:
>> include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'
   static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
                     ^
   include/linux/of_device.h:81:20: note: previous definition is here
   static inline void of_device_uevent(const struct device *dev,
                      ^
   In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:23:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
   1 warning and 1 error generated.
--
   In file included from drivers/ata/libahci_platform.c:23:
   In file included from include/linux/of_platform.h:12:
>> include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'
   static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
                     ^
   include/linux/of_device.h:81:20: note: previous definition is here
   static inline void of_device_uevent(const struct device *dev,
                      ^
   drivers/ata/libahci_platform.c:750:42: warning: shift count >= width of type [-Wshift-count-overflow]
                   rc = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
                                                          ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.
..


vim +/of_device_uevent +107 include/linux/of_device.h

   106	
 > 107	static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
   108	{
   109		return -ENODEV;
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
