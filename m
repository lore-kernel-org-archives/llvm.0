Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A44A2D;
	Thu, 31 Jul 2025 01:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753925863; cv=none; b=Ncb/Hd9sDhKmhOjjAt/p+d3ExdO/8+YRaAbSi9F0xA8/1bLe0eBAjqGoPbUX7ni/3T6re8+8effy5fOlmtTYYURKsHaH0j/VM2CTmSx8r/yAmt2DERQDW/w5N7ZqmzYQp+4+cf6e3FeMcoCT3wroYyaI32FcqWvR4A3VfRLrhnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753925863; c=relaxed/simple;
	bh=wIerfZZuc5NuQNtEvce37Ns64kpQ/dwVqbjbKTdo8IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aB7OVR3SBCdZTCCdWwxrcyY3JX+yT2giF08tAB3v1tav7WbXpfWckPBfpUT+uuwfJJzetfMgqnB4dlxnaI/J6IVa5LZjQ4gYsCNC9bor07nrBp8Ge8nQvtMiCXhbQj1PQKV9lkrT7lKyLO/biBdkAn67y1KdJbJNa9lpLEyGG+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwSsVIQW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwSsVIQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753925861; x=1785461861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wIerfZZuc5NuQNtEvce37Ns64kpQ/dwVqbjbKTdo8IQ=;
  b=bwSsVIQW6DVqYyaO8pbeQqtyh1i6ezjmY5+llvww8uHOMsH0vhnWASFJ
   S9rlHJHWKPO6Iv/pm5IOnxfxnSiwUB+OcX2VVW6SDjOIYQ118CYIBUoNL
   ii8oES6QYytUTWn29QGB8U1Ozzi1gILEUfPJkIuQDQxFbc5tvWiFUdRgJ
   cajUm6svOYqtZ9PZLDh7topzL8qWX45n4xBNkDlj2t01zZC3FAOfZhFw2
   PTQcWIJXAQl4ejVXby7pam5CLT89Atpz6gqe30T5t2p57avXakFUbHv/9
   prsppn3edaUCST+myC8xD28ALb8+3IgpVEHzcy7qvgiWAnn7PtOasfGby
   Q==;
X-CSE-ConnectionGUID: pdE4JB34Tyq5PN7YBYhE1A==
X-CSE-MsgGUID: SJZsPKC/SdqwgQrJRBZA0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55445090"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="55445090"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:37:41 -0700
X-CSE-ConnectionGUID: FljI8Tu/Q6iyPI7csp2N2w==
X-CSE-MsgGUID: wV+bxjLmQWi9WHYw9V99sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="162398544"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jul 2025 18:37:39 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhIEi-0003JC-2F;
	Thu, 31 Jul 2025 01:37:36 +0000
Date: Thu, 31 Jul 2025 09:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 102/139] vmlinux.o: warning: objtool:
 pci_device_group+0x130: sibling call from callable instruction with modified
 stack frame
Message-ID: <202507310923.GsVV4jxF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   e02ad15f3e318839e0c9ac700006054613386bea
commit: 9481fbd9e24f70e33d1a612d2329e3d4fb626e79 [102/139] iommu: Compute iommu_groups properly for PCIe switches
config: loongarch-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250731/202507310923.GsVV4jxF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310923.GsVV4jxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310923.GsVV4jxF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: max77650_regulator_probe+0x114: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: max8660_probe+0x344: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: max8998_get_voltage_register+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: max8998_get_enable_register+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: max8998_set_voltage_buck_sel+0xf4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mcp16502_set_voltage_time_sel+0xc0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mp8859_readable+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rpmh_regulator_pmic4_smps_of_map_mode+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: spmi_regulator_of_parse+0x320: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pca9450_i2c_probe+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pf9453_pmic_write+0x114: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pv88060_buck_get_mode+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pv88090_buck_get_mode+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: is_write_reg+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rohm_regulator_set_dvs_levels+0x138: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rt5120_regulator_probe+0x274: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rt6190_is_volatile_reg+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rtmv20_is_accessible_reg+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: slg51000_i2c_probe+0x1f0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps62360_probe+0x1ec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps6507x_pmic_set_voltage_sel+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps6507x_pmic_get_voltage_sel+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps65086_of_parse_cb+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps6586x_regulator_probe+0xe8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps65910_get_ctrl_register+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps65911_get_ctrl_register+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps65910_set_voltage_sel+0x98: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps65910_get_voltage_sel+0xb8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps65911_list_voltage+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps65911_set_voltage_sel+0x98: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps65911_get_voltage_sel+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tps6594_regulator_probe+0x254: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm831x_dcdc_get_mode+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm831x_dcdc_set_mode_int+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_dcdc_set_slot+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_ldo_set_slot+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_regulator_probe+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_dcdc_set_mode+0xd0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_dcdc_get_mode+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_dcdc_get_optimum_mode+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_dcdc_set_suspend_voltage+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_dcdc_set_suspend_enable+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_dcdc_set_suspend_disable+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_dcdc_set_suspend_mode+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: force_continuous_enable+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_ldo_set_suspend_voltage+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_ldo_set_suspend_enable+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_ldo_set_suspend_disable+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wm8350_isink_enable_time+0xec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: a10sr_reset_status+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: a10sr_reset_update+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: eqr_assert+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: eqr_deassert+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: eqr_status+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: eqr_busy_wait_locked+0x100: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pistachio_reset_assert+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pistachio_reset_deassert+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tty_ioctl+0xf4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: n_tty_write+0x300: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: do_output_char+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: n_tty_receive_char_flagged+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tty_get_char_size+0x38: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tty_get_frame_size+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tty_mode_ioctl+0x10c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: n_tty_ioctl_helper+0xf0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: uart_match_port+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: serial_core_register_port+0x420: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: univ8250_console_match+0x164: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: serial8250_handle_irq+0x20c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: serial8250_do_startup+0xac0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: set_io_from_upio+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: serial8250_config_port+0x494: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: serial8250_release_std_resource+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: serial8250_request_std_resource+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: serial8250_early_in+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: serial8250_early_out+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cti_port_setup_xr17c15x+0x19c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cti_get_port_type_xr17c15x_xr17v25x+0xec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cti_port_setup_xr17v25x+0x174: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cti_port_setup_xr17v35x+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cti_port_setup_fpga+0x274: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pci_fastcom335_setup+0xe8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ni16550_probe+0x42c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atmel_set_termios+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bcm_uart_set_termios+0x1b8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: uart_clps711x_set_termios+0xc0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: esp32_uart_set_termios+0x128: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: icom_set_termios+0xf0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: jsm_probe_one+0x4b0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: neo_intr+0x100: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: msm_set_termios+0x608: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: owl_uart_set_termios+0x100: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sccnxp_set_termios+0xdc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sci_set_termios+0xb08: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ulite_probe+0x26c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: interrupt_handler+0x6e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: control_work_handler+0x104: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ac_ioctl+0x13c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xillybus_isr+0x1d8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iommufd_vfio_ioctl+0x78: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: pci_device_group+0x130: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: arm_64_lpae_alloc_pgtable_s1+0x208: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: arm_64_lpae_alloc_pgtable_s2+0x2e4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: host1x_job_pin+0x9e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: show_gather+0x28c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: show_gather+0x28c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: show_channel_command+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: show_channel_command+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: show_channel_command+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: show_channel_command+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: show_channel_command+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_get_connector_force_name+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_mode_create_dumb+0x9c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_match_cea_mode+0x208: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: update_display_info+0x19f0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_hdmi_vendor_infoframe_from_display_mode+0x118: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: do_detailed_mode+0x8c4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: do_cvt_mode+0x1f4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_mode_legacy_fb_format+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_getcap+0x148: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_setclientcap+0x98: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_analog_tv_mode+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_mode_parse_cmdline_extra+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_mode_convert_to_umode+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_mode_convert_umode+0x1c0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mipi_dsi_packet_format_is_short+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mipi_dsi_packet_format_is_long+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mipi_dsi_create_packet+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_mipi_dsi_get_input_bus_fmt+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: malidp550_query_hw+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: malidp650_query_hw+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: malidp_se_irq+0x138: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: komeda_pipeline_get_component_pos+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: d71_change_opmode+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: d71_probe_block+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_get_dual_mode_type_name+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_downstream_max_bpc+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_downstream_mode+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_downstream_debug+0x100: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_subconnector_type+0xc0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_dsc_sink_bpp_incr+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_dsc_sink_line_buf_depth+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_vsc_sdp_log+0x158: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_vsc_sdp_pack+0x110: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_get_pcon_max_frl_bw+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_pcon_dsc_bpp_incr+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __128b132b_channel_eq_delay_us+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_i2c_do_msg+0x154: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_encode_sideband_req+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_decode_sideband_req+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_dump_sideband_msg_req_body+0x128: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_mst_hpd_irq_handle_event+0x4bc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dp_mst_dump_mstb+0x174: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dsc_dp_rc_buffer_size+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: drm_dsc_setup_rc_params+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_device_init+0x478: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_asic_init+0x2b8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_info_ioctl+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_atombios_get_lvds_info+0x360: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_atombios_get_tv_info+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_atombios_get_power_modes+0xa4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_atom_get_clock_dividers+0xb8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_atombios_add_pplib_thermal_controller+0x114: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_atombios_parse_pplib_non_clock_info+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atombios_crtc_dpms+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce4_crtc_do_set_base+0x718: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atombios_crtc_mode_set+0x7b0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_atombios_init_crtc+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atombios_crtc_program_pll+0xe4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atombios_crtc_mode_fixup+0x190: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atombios_crtc_disable+0x390: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: combios_get_table_offset+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_combios_i2c_init+0xe8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: combios_setup_i2c_bus+0x3d0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_combios_get_tv_info+0x184: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_get_legacy_connector_info_from_table+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_get_legacy_connector_info_from_bios+0x2e0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_combios_get_power_modes+0x86c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_combios_external_tmds_setup+0x1a4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: combios_parse_mmio_table+0xac: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: combios_parse_pll_table+0xb0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_op_move+0xc8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_op_move+0xc8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_op_jump+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_op_jump+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_op_mask+0xac: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_op_mask+0xac: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_put_dst+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_put_dst+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_get_src_int+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_get_src_int+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_iio_execute+0xa4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: atom_iio_execute+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_fence_get_timeline_name.llvm.12523456394296244300+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_bo_set_tiling_flags+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_crtc_do_set_base+0xc4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_crtc_dpms+0xa4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_crtc_mode_set+0xe38: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_legacy_lvds_update+0xf0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_legacy_backlight_init+0x284: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: radeon_add_legacy_encoder+0x13c: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
