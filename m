Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D763B4;
	Sun, 23 Apr 2023 21:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682286755; x=1713822755;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cWvKTufM4aAYK2edpES3Yw+jaWkfAVoQozooa2EkHFQ=;
  b=RBGASakxrVpVzdJxt7vB0W6e85GLwQDBgqNjVblLJ0Y1xxOOnN31p/LK
   /pHFIN4ZTfgrJZoLlQTvY470sv95ZN+wRPdeDjEKQsujGEC/jheLYyYop
   vsek8dxEWr/11jLQTDbr4SnC+hRd4hrmWil10uuzmOJXT+QUI1S2OCf+B
   O+aXovjD9Wg5kMkZ8iFD/gKpuTbs3mps0/1SFJG05euoHHMLcgLgOzUrh
   Y0xRxGHVkwvtLU6skNuRL0OWjwy7mxlIn5LLdDfXwnu9Cgw+dmI8TFL8U
   MicI0zvgXkUKoKA1jnn1xO1mSlFHckuiUihaK711sZSyulveeE82As5Dq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="345075886"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="345075886"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 14:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="643137246"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="643137246"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Apr 2023 14:52:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqhdG-000i6U-0e;
	Sun, 23 Apr 2023 21:52:30 +0000
Date: Mon, 24 Apr 2023 05:51:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jarkko-tpmdd:tis-irq 74/75] vmlinux.o: warning: objtool:
 ___ksymtab_gpl+tpm_chip_startup+0x0: data relocation to !ENDBR:
 tpm_chip_startup+0x0
Message-ID: <202304240547.kPilozlK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Lino Sanfilippo <l.sanfilippo@kunbus.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tis-irq
head:   6cea73a6f10e7c9d07f77bb894d6aa4a29ed7bd8
commit: 240237f7c90799c19666553c762eab1b80bd5552 [74/75] tpm, tpm_tis: startup chip before testing for interrupts
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230424/202304240547.kPilozlK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=240237f7c90799c19666553c762eab1b80bd5552
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tis-irq
        git checkout 240237f7c90799c19666553c762eab1b80bd5552
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240547.kPilozlK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ___ksymtab_gpl+pciserial_remove_ports+0x0: data relocation to !ENDBR: pciserial_remove_ports+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+pciserial_suspend_ports+0x0: data relocation to !ENDBR: pciserial_suspend_ports+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+pciserial_resume_ports+0x0: data relocation to !ENDBR: pciserial_resume_ports+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uart8250427+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uart428+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_ns16550429+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_ns16550a430+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uart431+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uart432+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uartlite432+0x90: data relocation to !ENDBR: early_uartlite_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uartlite_b433+0x90: data relocation to !ENDBR: early_uartlite_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uartlite_a434+0x90: data relocation to !ENDBR: early_uartlite_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lantiq434+0x90: data relocation to !ENDBR: lqasc_serial_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lantiq435+0x90: data relocation to !ENDBR: lqasc_serial_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lpuart462+0x90: data relocation to !ENDBR: lpuart_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lpuart32463+0x90: data relocation to !ENDBR: lpuart32_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lpuart32464+0x90: data relocation to !ENDBR: ls1028a_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lpuart32465+0x90: data relocation to !ENDBR: lpuart32_imx_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lpuart32466+0x90: data relocation to !ENDBR: lpuart32_imx_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lpuart32467+0x90: data relocation to !ENDBR: lpuart32_imx_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lpuart468+0x90: data relocation to !ENDBR: lpuart_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_lpuart32469+0x90: data relocation to !ENDBR: lpuart32_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_sprd_serial443+0x90: data relocation to !ENDBR: sprd_early_console_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_early_gf_tty435+0x90: data relocation to !ENDBR: gf_earlycon_setup+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_set+0x0: data relocation to !ENDBR: mctrl_gpio_set+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_to_gpiod+0x0: data relocation to !ENDBR: mctrl_gpio_to_gpiod+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_get+0x0: data relocation to !ENDBR: mctrl_gpio_get+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_get_outputs+0x0: data relocation to !ENDBR: mctrl_gpio_get_outputs+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_init_noauto+0x0: data relocation to !ENDBR: mctrl_gpio_init_noauto+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_init+0x0: data relocation to !ENDBR: mctrl_gpio_init+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_free+0x0: data relocation to !ENDBR: mctrl_gpio_free+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_enable_ms+0x0: data relocation to !ENDBR: mctrl_gpio_enable_ms+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_disable_ms+0x0: data relocation to !ENDBR: mctrl_gpio_disable_ms+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_enable_irq_wake+0x0: data relocation to !ENDBR: mctrl_gpio_enable_irq_wake+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_disable_irq_wake+0x0: data relocation to !ENDBR: mctrl_gpio_disable_irq_wake+0x0
   vmlinux.o: warning: objtool: ___ksymtab+rng_is_initialized+0x0: data relocation to !ENDBR: rng_is_initialized+0x0
   vmlinux.o: warning: objtool: ___ksymtab+wait_for_random_bytes+0x0: data relocation to !ENDBR: wait_for_random_bytes+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_bytes+0x0: data relocation to !ENDBR: get_random_bytes+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_u8+0x0: data relocation to !ENDBR: get_random_u8+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_u16+0x0: data relocation to !ENDBR: get_random_u16+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_u32+0x0: data relocation to !ENDBR: get_random_u32+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_u64+0x0: data relocation to !ENDBR: get_random_u64+0x0
   vmlinux.o: warning: objtool: ___ksymtab+__get_random_u32_below+0x0: data relocation to !ENDBR: __get_random_u32_below+0x0
   vmlinux.o: warning: objtool: ___ksymtab+add_device_randomness+0x0: data relocation to !ENDBR: add_device_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+add_hwgenerator_randomness+0x0: data relocation to !ENDBR: add_hwgenerator_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+add_interrupt_randomness+0x0: data relocation to !ENDBR: add_interrupt_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+add_input_randomness+0x0: data relocation to !ENDBR: add_input_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+add_disk_randomness+0x0: data relocation to !ENDBR: add_disk_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab+misc_register+0x0: data relocation to !ENDBR: misc_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab+misc_deregister+0x0: data relocation to !ENDBR: misc_deregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+hwrng_register+0x0: data relocation to !ENDBR: hwrng_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+hwrng_unregister+0x0: data relocation to !ENDBR: hwrng_unregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+devm_hwrng_register+0x0: data relocation to !ENDBR: devm_hwrng_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+devm_hwrng_unregister+0x0: data relocation to !ENDBR: devm_hwrng_unregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+hwrng_msleep+0x0: data relocation to !ENDBR: hwrng_msleep+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_backend_acquire+0x0: data relocation to !ENDBR: agp_backend_acquire+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_backend_release+0x0: data relocation to !ENDBR: agp_backend_release+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_alloc_bridge+0x0: data relocation to !ENDBR: agp_alloc_bridge+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_put_bridge+0x0: data relocation to !ENDBR: agp_put_bridge+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+agp_add_bridge+0x0: data relocation to !ENDBR: agp_add_bridge+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+agp_remove_bridge+0x0: data relocation to !ENDBR: agp_remove_bridge+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_free_key+0x0: data relocation to !ENDBR: agp_free_key+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_alloc_page_array+0x0: data relocation to !ENDBR: agp_alloc_page_array+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_create_memory+0x0: data relocation to !ENDBR: agp_create_memory+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_free_memory+0x0: data relocation to !ENDBR: agp_free_memory+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_allocate_memory+0x0: data relocation to !ENDBR: agp_allocate_memory+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+agp_num_entries+0x0: data relocation to !ENDBR: agp_num_entries+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_copy_info+0x0: data relocation to !ENDBR: agp_copy_info+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_bind_memory+0x0: data relocation to !ENDBR: agp_bind_memory+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_unbind_memory+0x0: data relocation to !ENDBR: agp_unbind_memory+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_collect_device_status+0x0: data relocation to !ENDBR: agp_collect_device_status+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_device_command+0x0: data relocation to !ENDBR: agp_device_command+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_agp_version+0x0: data relocation to !ENDBR: get_agp_version+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_enable+0x0: data relocation to !ENDBR: agp_generic_enable+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_create_gatt_table+0x0: data relocation to !ENDBR: agp_generic_create_gatt_table+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_free_gatt_table+0x0: data relocation to !ENDBR: agp_generic_free_gatt_table+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_insert_memory+0x0: data relocation to !ENDBR: agp_generic_insert_memory+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_remove_memory+0x0: data relocation to !ENDBR: agp_generic_remove_memory+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_alloc_by_type+0x0: data relocation to !ENDBR: agp_generic_alloc_by_type+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_free_by_type+0x0: data relocation to !ENDBR: agp_generic_free_by_type+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_alloc_user+0x0: data relocation to !ENDBR: agp_generic_alloc_user+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_alloc_pages+0x0: data relocation to !ENDBR: agp_generic_alloc_pages+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_alloc_page+0x0: data relocation to !ENDBR: agp_generic_alloc_page+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_destroy_pages+0x0: data relocation to !ENDBR: agp_generic_destroy_pages+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_destroy_page+0x0: data relocation to !ENDBR: agp_generic_destroy_page+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_enable+0x0: data relocation to !ENDBR: agp_enable+0x0
   vmlinux.o: warning: objtool: ___ksymtab+global_cache_flush+0x0: data relocation to !ENDBR: global_cache_flush+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_mask_memory+0x0: data relocation to !ENDBR: agp_generic_mask_memory+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp_generic_type_to_mask_type+0x0: data relocation to !ENDBR: agp_generic_type_to_mask_type+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp3_generic_fetch_size+0x0: data relocation to !ENDBR: agp3_generic_fetch_size+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp3_generic_tlbflush+0x0: data relocation to !ENDBR: agp3_generic_tlbflush+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp3_generic_configure+0x0: data relocation to !ENDBR: agp3_generic_configure+0x0
   vmlinux.o: warning: objtool: ___ksymtab+agp3_generic_cleanup+0x0: data relocation to !ENDBR: agp3_generic_cleanup+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_start+0x0: data relocation to !ENDBR: tpm_chip_start+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_stop+0x0: data relocation to !ENDBR: tpm_chip_stop+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_try_get_ops+0x0: data relocation to !ENDBR: tpm_try_get_ops+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_put_ops+0x0: data relocation to !ENDBR: tpm_put_ops+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_default_chip+0x0: data relocation to !ENDBR: tpm_default_chip+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_alloc+0x0: data relocation to !ENDBR: tpm_chip_alloc+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpmm_chip_alloc+0x0: data relocation to !ENDBR: tpmm_chip_alloc+0x0
>> vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_startup+0x0: data relocation to !ENDBR: tpm_chip_startup+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_register+0x0: data relocation to !ENDBR: tpm_chip_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_unregister+0x0: data relocation to !ENDBR: tpm_chip_unregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_calc_ordinal_duration+0x0: data relocation to !ENDBR: tpm_calc_ordinal_duration+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_transmit_cmd+0x0: data relocation to !ENDBR: tpm_transmit_cmd+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_get_timeouts+0x0: data relocation to !ENDBR: tpm_get_timeouts+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_is_tpm2+0x0: data relocation to !ENDBR: tpm_is_tpm2+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_pcr_read+0x0: data relocation to !ENDBR: tpm_pcr_read+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_pcr_extend+0x0: data relocation to !ENDBR: tpm_pcr_extend+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_send+0x0: data relocation to !ENDBR: tpm_send+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_pm_suspend+0x0: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_pm_resume+0x0: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_get_random+0x0: data relocation to !ENDBR: tpm_get_random+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm1_getcap+0x0: data relocation to !ENDBR: tpm1_getcap+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm1_do_selftest+0x0: data relocation to !ENDBR: tpm1_do_selftest+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm2_flush_context+0x0: data relocation to !ENDBR: tpm2_flush_context+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm2_get_tpm_pt+0x0: data relocation to !ENDBR: tpm2_get_tpm_pt+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm2_probe+0x0: data relocation to !ENDBR: tpm2_probe+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm2_get_cc_attrs_tbl+0x0: data relocation to !ENDBR: tpm2_get_cc_attrs_tbl+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_tis_remove+0x0: data relocation to !ENDBR: tpm_tis_remove+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_tis_core_init+0x0: data relocation to !ENDBR: tpm_tis_core_init+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_tis_resume+0x0: data relocation to !ENDBR: tpm_tis_resume+0x0
   vmlinux.o: warning: objtool: ___ksymtab+st33zp24_probe+0x0: data relocation to !ENDBR: st33zp24_probe+0x0
   vmlinux.o: warning: objtool: ___ksymtab+st33zp24_remove+0x0: data relocation to !ENDBR: st33zp24_remove+0x0
   vmlinux.o: warning: objtool: ___ksymtab+st33zp24_pm_suspend+0x0: data relocation to !ENDBR: st33zp24_pm_suspend+0x0
   vmlinux.o: warning: objtool: ___ksymtab+st33zp24_pm_resume+0x0: data relocation to !ENDBR: st33zp24_pm_resume+0x0
   vmlinux.o: warning: objtool: ___ksymtab+xillybus_init_chrdev+0x0: data relocation to !ENDBR: xillybus_init_chrdev+0x0
   vmlinux.o: warning: objtool: ___ksymtab+xillybus_cleanup_chrdev+0x0: data relocation to !ENDBR: xillybus_cleanup_chrdev+0x0
   vmlinux.o: warning: objtool: ___ksymtab+xillybus_find_inode+0x0: data relocation to !ENDBR: xillybus_find_inode+0x0
   vmlinux.o: warning: objtool: ___ksymtab+xillybus_isr+0x0: data relocation to !ENDBR: xillybus_isr+0x0
   vmlinux.o: warning: objtool: ___ksymtab+xillybus_init_endpoint+0x0: data relocation to !ENDBR: xillybus_init_endpoint+0x0
   vmlinux.o: warning: objtool: ___ksymtab+xillybus_endpoint_discovery+0x0: data relocation to !ENDBR: xillybus_endpoint_discovery+0x0
   vmlinux.o: warning: objtool: ___ksymtab+xillybus_endpoint_remove+0x0: data relocation to !ENDBR: xillybus_endpoint_remove+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_register+0x0: data relocation to !ENDBR: iommu_device_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_unregister+0x0: data relocation to !ENDBR: iommu_device_unregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_get_group_resv_regions+0x0: data relocation to !ENDBR: iommu_get_group_resv_regions+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_alloc+0x0: data relocation to !ENDBR: iommu_group_alloc+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_get_by_id+0x0: data relocation to !ENDBR: iommu_group_get_by_id+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_get_iommudata+0x0: data relocation to !ENDBR: iommu_group_get_iommudata+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_set_iommudata+0x0: data relocation to !ENDBR: iommu_group_set_iommudata+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_set_name+0x0: data relocation to !ENDBR: iommu_group_set_name+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_add_device+0x0: data relocation to !ENDBR: iommu_group_add_device+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_remove_device+0x0: data relocation to !ENDBR: iommu_group_remove_device+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_for_each_dev+0x0: data relocation to !ENDBR: iommu_group_for_each_dev+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_get+0x0: data relocation to !ENDBR: iommu_group_get+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_ref_get+0x0: data relocation to !ENDBR: iommu_group_ref_get+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_put+0x0: data relocation to !ENDBR: iommu_group_put+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_register_device_fault_handler+0x0: data relocation to !ENDBR: iommu_register_device_fault_handler+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_unregister_device_fault_handler+0x0: data relocation to !ENDBR: iommu_unregister_device_fault_handler+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_report_device_fault+0x0: data relocation to !ENDBR: iommu_report_device_fault+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_page_response+0x0: data relocation to !ENDBR: iommu_page_response+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_id+0x0: data relocation to !ENDBR: iommu_group_id+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+generic_device_group+0x0: data relocation to !ENDBR: generic_device_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+pci_device_group+0x0: data relocation to !ENDBR: pci_device_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+fsl_mc_device_group+0x0: data relocation to !ENDBR: fsl_mc_device_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_present+0x0: data relocation to !ENDBR: iommu_present+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+device_iommu_capable+0x0: data relocation to !ENDBR: device_iommu_capable+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_has_isolated_msi+0x0: data relocation to !ENDBR: iommu_group_has_isolated_msi+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_set_fault_handler+0x0: data relocation to !ENDBR: iommu_set_fault_handler+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_domain_alloc+0x0: data relocation to !ENDBR: iommu_domain_alloc+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_domain_free+0x0: data relocation to !ENDBR: iommu_domain_free+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_attach_device+0x0: data relocation to !ENDBR: iommu_attach_device+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_detach_device+0x0: data relocation to !ENDBR: iommu_detach_device+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_get_domain_for_dev+0x0: data relocation to !ENDBR: iommu_get_domain_for_dev+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_attach_group+0x0: data relocation to !ENDBR: iommu_attach_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_detach_group+0x0: data relocation to !ENDBR: iommu_detach_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_iova_to_phys+0x0: data relocation to !ENDBR: iommu_iova_to_phys+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_map+0x0: data relocation to !ENDBR: iommu_map+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_unmap+0x0: data relocation to !ENDBR: iommu_unmap+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_unmap_fast+0x0: data relocation to !ENDBR: iommu_unmap_fast+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_map_sg+0x0: data relocation to !ENDBR: iommu_map_sg+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+report_iommu_fault+0x0: data relocation to !ENDBR: report_iommu_fault+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_enable_nesting+0x0: data relocation to !ENDBR: iommu_enable_nesting+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_set_pgtable_quirks+0x0: data relocation to !ENDBR: iommu_set_pgtable_quirks+0x0
   vmlinux.o: warning: objtool: ___ksymtab+iommu_put_resv_regions+0x0: data relocation to !ENDBR: iommu_put_resv_regions+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_alloc_resv_region+0x0: data relocation to !ENDBR: iommu_alloc_resv_region+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_default_passthrough+0x0: data relocation to !ENDBR: iommu_default_passthrough+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_fwspec_init+0x0: data relocation to !ENDBR: iommu_fwspec_init+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_fwspec_free+0x0: data relocation to !ENDBR: iommu_fwspec_free+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_fwspec_add_ids+0x0: data relocation to !ENDBR: iommu_fwspec_add_ids+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_dev_enable_feature+0x0: data relocation to !ENDBR: iommu_dev_enable_feature+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_dev_disable_feature+0x0: data relocation to !ENDBR: iommu_dev_disable_feature+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_claim_dma_owner+0x0: data relocation to !ENDBR: iommu_group_claim_dma_owner+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_claim_dma_owner+0x0: data relocation to !ENDBR: iommu_device_claim_dma_owner+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_release_dma_owner+0x0: data relocation to !ENDBR: iommu_group_release_dma_owner+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_release_dma_owner+0x0: data relocation to !ENDBR: iommu_device_release_dma_owner+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_dma_owner_claimed+0x0: data relocation to !ENDBR: iommu_group_dma_owner_claimed+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_attach_device_pasid+0x0: data relocation to !ENDBR: iommu_attach_device_pasid+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_detach_device_pasid+0x0: data relocation to !ENDBR: iommu_detach_device_pasid+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_get_domain_for_dev_pasid+0x0: data relocation to !ENDBR: iommu_get_domain_for_dev_pasid+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_add_device_to_group+0x0: data relocation to !ENDBR: __traceiter_add_device_to_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_remove_device_from_group+0x0: data relocation to !ENDBR: __traceiter_remove_device_from_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_attach_device_to_domain+0x0: data relocation to !ENDBR: __traceiter_attach_device_to_domain+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_map+0x0: data relocation to !ENDBR: __traceiter_map+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_unmap+0x0: data relocation to !ENDBR: __traceiter_unmap+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_io_page_fault+0x0: data relocation to !ENDBR: __traceiter_io_page_fault+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_sysfs_add+0x0: data relocation to !ENDBR: iommu_device_sysfs_add+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_sysfs_remove+0x0: data relocation to !ENDBR: iommu_device_sysfs_remove+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_link+0x0: data relocation to !ENDBR: iommu_device_link+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_unlink+0x0: data relocation to !ENDBR: iommu_device_unlink+0x0
   vmlinux.o: warning: objtool: ___ksymtab+iommu_get_msi_cookie+0x0: data relocation to !ENDBR: iommu_get_msi_cookie+0x0


objdump-func vmlinux.o ___ksymtab_gpl:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
