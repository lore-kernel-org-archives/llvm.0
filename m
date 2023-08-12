Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1932585;
	Sat, 12 Aug 2023 22:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691880207; x=1723416207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOYPsyLcl4z9mezQCMIjUvJe/N9q8blajBcDXBF19BE=;
  b=JHz3o6prvEcxKZS/jkxswuob9yXttlrs1n7rWGfzTG0Z8MW202iQ6Eul
   teXvexCFwqGNwWlf8FucxMTBXwngtAaoPcmN1H7lXpR1lY+p1ZFALSjI1
   m8qRcVNTYGMfAq2QvPvpQTD0k3wKReH322sFCOW/M7BmHIiKkYuEe3EX0
   o1JZTyYbbiPnYnCM/FcqovLHxoWK2ZIf3q99e48BXo/37GnifsVWufDQ7
   MknOoSAuKnnZuugqT51k6ozQLRLP6c9omQEl6j6qhvwrAENng0i0HKwJN
   LPLm27WjDP9lj2sqSqSAjD6ZRHL5ZXfoah/RAPj7rwkVgl+/e/qjF+dw5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="438187049"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="438187049"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 15:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="733006721"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="733006721"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Aug 2023 15:43:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUxKP-0008p6-0H;
	Sat, 12 Aug 2023 22:43:25 +0000
Date: Sun, 13 Aug 2023 06:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 10/20] arch/x86/kernel/sev.c:237:4: error: call to
 undeclared function 'sysvec_irq_move_cleanup'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202308130634.BE5Kl3I5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   a8a44aa58e6c9eac7cdbb142e11b3ac894404756
commit: 65f17da72a5e7625d2cb608eabf084e53f9286dc [10/20] x86/sev: Add AMD sev-snp enlightened guest support on hyperv
config: x86_64-randconfig-x002-20230812 (https://download.01.org/0day-ci/archive/20230813/202308130634.BE5Kl3I5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130634.BE5Kl3I5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130634.BE5Kl3I5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/sev.c:185:30: warning: no previous prototype for function 'sev_snp_current_doorbell_page' [-Wmissing-prototypes]
   struct sev_hv_doorbell_page *sev_snp_current_doorbell_page(void)
                                ^
   arch/x86/kernel/sev.c:185:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sev_hv_doorbell_page *sev_snp_current_doorbell_page(void)
   ^
   static 
>> arch/x86/kernel/sev.c:237:4: error: call to undeclared function 'sysvec_irq_move_cleanup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           sysvec_irq_move_cleanup(regs);
                           ^
   arch/x86/kernel/sev.c:284:37: error: use of undeclared identifier 'vector'
                                   panic("Unexpected vector %d\n", vector);
                                                                   ^
   arch/x86/kernel/sev.c:413:30: warning: variable 'data' set but not used [-Wunused-but-set-variable]
           struct sev_es_runtime_data *data;
                                       ^
   2 warnings and 2 errors generated.


vim +/sysvec_irq_move_cleanup +237 arch/x86/kernel/sev.c

   229	
   230			if (!pending_events.vector)
   231				goto out;
   232	
   233			if (pending_events.vector < FIRST_EXTERNAL_VECTOR) {
   234				/* Exception vectors */
   235				WARN(1, "exception shouldn't happen\n");
   236			} else if (pending_events.vector == FIRST_EXTERNAL_VECTOR) {
 > 237				sysvec_irq_move_cleanup(regs);
   238			} else if (pending_events.vector == IA32_SYSCALL_VECTOR) {
   239				WARN(1, "syscall shouldn't happen\n");
   240			} else if (pending_events.vector >= FIRST_SYSTEM_VECTOR) {
   241				switch (pending_events.vector) {
   242	#if IS_ENABLED(CONFIG_HYPERV)
   243				case HYPERV_STIMER0_VECTOR:
   244					sysvec_hyperv_stimer0(regs);
   245					break;
   246				case HYPERVISOR_CALLBACK_VECTOR:
   247					sysvec_hyperv_callback(regs);
   248					break;
   249	#endif
   250	#ifdef CONFIG_SMP
   251				case RESCHEDULE_VECTOR:
   252					sysvec_reschedule_ipi(regs);
   253					break;
   254				case IRQ_MOVE_CLEANUP_VECTOR:
   255					sysvec_irq_move_cleanup(regs);
   256					break;
   257				case REBOOT_VECTOR:
   258					sysvec_reboot(regs);
   259					break;
   260				case CALL_FUNCTION_SINGLE_VECTOR:
   261					sysvec_call_function_single(regs);
   262					break;
   263				case CALL_FUNCTION_VECTOR:
   264					sysvec_call_function(regs);
   265					break;
   266	#endif
   267	#ifdef CONFIG_X86_LOCAL_APIC
   268				case ERROR_APIC_VECTOR:
   269					sysvec_error_interrupt(regs);
   270					break;
   271				case SPURIOUS_APIC_VECTOR:
   272					sysvec_spurious_apic_interrupt(regs);
   273					break;
   274				case LOCAL_TIMER_VECTOR:
   275					sysvec_apic_timer_interrupt(regs);
   276					break;
   277				case X86_PLATFORM_IPI_VECTOR:
   278					sysvec_x86_platform_ipi(regs);
   279					break;
   280	#endif
   281				case 0x0:
   282					break;
   283				default:
   284					panic("Unexpected vector %d\n", vector);
   285					unreachable();
   286				}
   287			} else {
   288				common_interrupt(regs, pending_events.vector);
   289			}
   290		}
   291	
   292	out:
   293		this_cpu_read(snp_runtime_data)->hv_handling_events = false;
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
