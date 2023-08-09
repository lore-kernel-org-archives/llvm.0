Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABDA3C3F;
	Wed,  9 Aug 2023 06:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691561545; x=1723097545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vm5GKLTlVnJ4hPhgLqxQ4o/Pa3bwwcfP/tQbqOQrRz8=;
  b=YvHRfAPUYXLnAP9TzZCQkd08nNlHPz4yqDkJMkZXWkDxzkqM7KQbkfN2
   B3XDJ7JWJzFTsQPcr6mymg3qE5sxwQUsdPCWyHTd0aBWsOhuvyBIbrfD/
   CFqVoh+TX8BfjMES0hz6RGrhyJFsRFThhUx5sT5Z9yAPEsxcDrOwI+YNs
   PDs9wsx57bQKMgVOUj0aHet9fD/8ymAsGCp/f2qYCbGGpIcG9bWBo470E
   HdMWohVkyc84fVGSBB0/n7EZyztqmpqzXQbe51bwJKy0jsbWz5nSw8nl7
   mUbzlraGU/DAXKQXxv9oi6SxzU/B2OCUHv7R/v0nrA5sSJCqpk+c+g/li
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361159611"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="361159611"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 23:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681553168"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="681553168"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 23:12:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTcQh-0005r6-0I;
	Wed, 09 Aug 2023 06:12:23 +0000
Date: Wed, 9 Aug 2023 14:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-runtime-cleanup 8/11]
 drivers/firmware/efi/runtime-wrappers.c:293:26: error: expected identifier
Message-ID: <202308091414.fPZ0j8Ex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-runtime-cleanup
head:   c71456a199541783dbb943e07547fc0d0c929ea2
commit: 74d615646e6a6ab2abe1d6b22d519d7b1b8981c1 [8/11] acpi/prmt: Use EFI runtime sandbox to invoke PRM handlers
config: x86_64-buildonly-randconfig-r003-20230808 (https://download.01.org/0day-ci/archive/20230809/202308091414.fPZ0j8Ex-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091414.fPZ0j8Ex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091414.fPZ0j8Ex-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/runtime-wrappers.c:293:26: error: expected identifier
                   status = efi_call_virt(&args->ACPI_PRM_HANDLER,
                                          ^
>> drivers/firmware/efi/runtime-wrappers.c:294:12: error: use of undeclared identifier 'acpi_prm_handler'
                                          acpi_prm_handler,
                                          ^
   drivers/firmware/efi/runtime-wrappers.c:293:12: error: assigning to 'u64' (aka 'unsigned long long') from incompatible type 'void'
                   status = efi_call_virt(&args->ACPI_PRM_HANDLER,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/runtime-wrappers.c:43:2: note: expanded from macro 'efi_call_virt'
           arch_efi_call_virt(efi.runtime, f, args)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/efi.h:109:6: note: expanded from macro 'arch_efi_call_virt'
           ret = efi_call((void *)p->f, args);                             \
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +293 drivers/firmware/efi/runtime-wrappers.c

   210	
   211	/*
   212	 * Calls the appropriate efi_runtime_service() with the appropriate
   213	 * arguments.
   214	 */
   215	static void efi_call_rts(struct work_struct *work)
   216	{
   217		const union efi_rts_args *args = efi_rts_work.args;
   218		efi_status_t status = EFI_NOT_FOUND;
   219		unsigned long flags;
   220	
   221		arch_efi_call_virt_setup();
   222		flags = efi_call_virt_save_flags();
   223	
   224		switch (efi_rts_work.efi_rts_id) {
   225		case EFI_GET_TIME:
   226			status = efi_call_virt(get_time,
   227					       args->GET_TIME.time,
   228					       args->GET_TIME.capabilities);
   229			break;
   230		case EFI_SET_TIME:
   231			status = efi_call_virt(set_time,
   232					       args->SET_TIME.time);
   233			break;
   234		case EFI_GET_WAKEUP_TIME:
   235			status = efi_call_virt(get_wakeup_time,
   236					       args->GET_WAKEUP_TIME.enabled,
   237					       args->GET_WAKEUP_TIME.pending,
   238					       args->GET_WAKEUP_TIME.time);
   239			break;
   240		case EFI_SET_WAKEUP_TIME:
   241			status = efi_call_virt(set_wakeup_time,
   242					       args->SET_WAKEUP_TIME.enable,
   243					       args->SET_WAKEUP_TIME.time);
   244			break;
   245		case EFI_GET_VARIABLE:
   246			status = efi_call_virt(get_variable,
   247					       args->GET_VARIABLE.name,
   248					       args->GET_VARIABLE.vendor,
   249					       args->GET_VARIABLE.attr,
   250					       args->GET_VARIABLE.data_size,
   251					       args->GET_VARIABLE.data);
   252			break;
   253		case EFI_GET_NEXT_VARIABLE:
   254			status = efi_call_virt(get_next_variable,
   255					       args->GET_NEXT_VARIABLE.name_size,
   256					       args->GET_NEXT_VARIABLE.name,
   257					       args->GET_NEXT_VARIABLE.vendor);
   258			break;
   259		case EFI_SET_VARIABLE:
   260			status = efi_call_virt(set_variable,
   261					       args->SET_VARIABLE.name,
   262					       args->SET_VARIABLE.vendor,
   263					       args->SET_VARIABLE.attr,
   264					       args->SET_VARIABLE.data_size,
   265					       args->SET_VARIABLE.data);
   266			break;
   267		case EFI_QUERY_VARIABLE_INFO:
   268			status = efi_call_virt(query_variable_info,
   269					       args->QUERY_VARIABLE_INFO.attr,
   270					       args->QUERY_VARIABLE_INFO.storage_space,
   271					       args->QUERY_VARIABLE_INFO.remaining_space,
   272					       args->QUERY_VARIABLE_INFO.max_variable_size);
   273			break;
   274		case EFI_GET_NEXT_HIGH_MONO_COUNT:
   275			status = efi_call_virt(get_next_high_mono_count,
   276					       args->GET_NEXT_HIGH_MONO_COUNT.high_count);
   277			break;
   278		case EFI_UPDATE_CAPSULE:
   279			status = efi_call_virt(update_capsule,
   280					       args->UPDATE_CAPSULE.capsules,
   281					       args->UPDATE_CAPSULE.count,
   282					       args->UPDATE_CAPSULE.sg_list);
   283			break;
   284		case EFI_QUERY_CAPSULE_CAPS:
   285			status = efi_call_virt(query_capsule_caps,
   286					       args->QUERY_CAPSULE_CAPS.capsules,
   287					       args->QUERY_CAPSULE_CAPS.count,
   288					       args->QUERY_CAPSULE_CAPS.max_size,
   289					       args->QUERY_CAPSULE_CAPS.reset_type);
   290			break;
   291		case EFI_ACPI_PRM_HANDLER:
   292	#ifdef CONFIG_ACPI_PRMT
 > 293			status = efi_call_virt(&args->ACPI_PRM_HANDLER,
 > 294					       acpi_prm_handler,
   295					       args->ACPI_PRM_HANDLER.param_buffer_addr,
   296					       args->ACPI_PRM_HANDLER.context);
   297			break;
   298	#endif
   299		default:
   300			/*
   301			 * Ideally, we should never reach here because a caller of this
   302			 * function should have put the right efi_runtime_service()
   303			 * function identifier into efi_rts_work->efi_rts_id
   304			 */
   305			pr_err("Requested executing invalid EFI Runtime Service.\n");
   306		}
   307	
   308		efi_call_virt_check_flags(flags, efi_rts_work.caller);
   309		arch_efi_call_virt_teardown();
   310	
   311		efi_rts_work.status = status;
   312		complete(&efi_rts_work.efi_rts_comp);
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
