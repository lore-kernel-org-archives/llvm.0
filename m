Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87B0D53C;
	Thu, 31 Jul 2025 02:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753928269; cv=none; b=Lf89BNb0QCswaSTBJOeayHLxZyCYgWPzm9B/sGGdokHH0zNXuxoJGjEe31MMpg909lPlWMamfBMXyGbv+Ki5ZHrlA0jQInMQwiTjr/VvRcxRrg53N7Ng5fZwuyFTWa5NGldcuPV0ndfbedRiWzFQEswnYvhgtTwtI/PMUjzvVDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753928269; c=relaxed/simple;
	bh=aomfruCwTf+QUqW/wcZh4mzaJMKTmPfPExxMtXgI5zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0NBhL2dZyx9B1iXf7t89eREB6Ai6B4FDv9WYmqbpCYHWZjZKSP5c1L0E8EU6jnQ5zaoS6X6vW7pwLSbE11Bs5p/opTgMVy8ZYg6hK5pt9VSPQQlOQ+m0dclZ4TOTnsxyjQFyr3J6xwVCMdQijx4RDKHPCo1+HSI/sIoe6+4YRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgSnceIH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgSnceIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753928267; x=1785464267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aomfruCwTf+QUqW/wcZh4mzaJMKTmPfPExxMtXgI5zg=;
  b=mgSnceIHEFEOspIuXq4OK0BN/Ij4AIYBgZuAHskqefvCRzgUSZfvCwx2
   CfSB88m7Jilpwaxs/jXbtLYBPbh+srV1SpYLKNIc8wJpTSM1bgJnGFE2C
   viI9fac3154IerFpG+CWvCtvV7/wnu5elWReSKinYHPsqhYQ1qfYozLYj
   61vcP47SPNdt1LrRNDRpsOaaXbk6iWmpIkRo6LOwF7sLYJY02sACVCf8r
   l6SkCStn5OdPFgLHiGtSOYCuQkNv+IS+XBuJiTuyGkxP/A/TrF2MWZZ2v
   YBaUWW5oKkYBbbJ553ArW/YZObw07iXAkCOh6nOPiF/W1r5z0E0C6DzMz
   Q==;
X-CSE-ConnectionGUID: eginxbNIQIONiGDcsqf3Og==
X-CSE-MsgGUID: K11ZC8eIRiqJ2KsbsOBajQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="81694925"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="81694925"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 19:17:46 -0700
X-CSE-ConnectionGUID: m9OxLl20Ri2vlPKT1Aa5Sg==
X-CSE-MsgGUID: t62IAJI9SkS6RoHWPYvDUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="163172790"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Jul 2025 19:17:44 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhIrV-0003LG-2O;
	Thu, 31 Jul 2025 02:17:41 +0000
Date: Thu, 31 Jul 2025 10:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Relja Vojvodic <rvojvodi@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>, Ivan Lipski <ivan.lipski@amd.com>
Subject: [linux-next:master 12442/12889] vmlinux.o: warning: objtool:
 translate_to_dto_source+0x40: sibling call from callable instruction with
 modified stack frame
Message-ID: <202507311053.Iyqj7MfH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   79fb37f39b77bbf9a56304e9af843cd93a7a1916
commit: 7af124772fcf8422a55efa3a4d64484835db3beb [12442/12889] drm/amd/display: Allow for sharing of some link and audio link functions
config: loongarch-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250731/202507311053.Iyqj7MfH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311053.Iyqj7MfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311053.Iyqj7MfH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: dal_cmd_table_helper_transmitter_bp_to_atom+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_cmd_table_helper_encoder_mode_bp_to_atom+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_cmd_table_helper_clock_source_id_to_ref_clk_src+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_cmd_table_helper_encoder_id_to_atom+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: phy_id_to_atom+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: engine_bp_to_atom+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: object_id_from_bios_object_id+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: encoder_control_digx_v1_5+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_bios_parser_init_cmd_tbl_helper2+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_cmd_table_helper_controller_id_to_atom2+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_cmd_table_helper_transmitter_bp_to_atom2+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_cmd_table_helper_encoder_mode_bp_to_atom2+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_cmd_table_helper_clock_source_id_to_ref_clk_src2+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_cmd_table_helper_encoder_id_to_atom2+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bios_parser_get_lttpr_caps+0xb0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bios_parser_get_lttpr_interop+0xa8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: encoder_action_to_atom.llvm.753739695213977192+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: clock_source_id_to_atom.llvm.753739695213977192+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: hpd_sel_to_atom.llvm.753739695213977192+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dig_encoder_sel_to_atom.llvm.753739695213977192+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: encoder_action_to_atom.llvm.12140176210478562298+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: clock_source_id_to_atom.llvm.12140176210478562298+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: hpd_sel_to_atom.llvm.12140176210478562298+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dig_encoder_sel_to_atom.llvm.12140176210478562298+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: encoder_action_to_atom.llvm.16371678853864409890+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: clock_source_id_to_atom.llvm.16371678853864409890+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: hpd_sel_to_atom.llvm.16371678853864409890+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: encoder_action_to_atom.llvm.261292085290456734+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: clock_source_id_to_atom.llvm.261292085290456734+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: hpd_sel_to_atom.llvm.261292085290456734+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: transmitter_color_depth_to_atom.llvm.261292085290456734+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: encoder_action_to_atom.llvm.8938158909249946605+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: clock_source_id_to_atom.llvm.8938158909249946605+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: hpd_sel_to_atom.llvm.8938158909249946605+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: transmitter_color_depth_to_atom.llvm.8938158909249946605+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_clk_mgr_construct+0x1a0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_stream_encoder_dp_set_stream_attribute+0x3d0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_stream_encoder_hdmi_set_stream_attribute+0x1d0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_update_hdmi_info_packet+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_update_generic_info_packet+0x35c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_get_dig_frontend+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_link_encoder_validate_dvi_output+0x1bc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_link_encoder_construct+0xf0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_link_encoder_validate_output_with_stream+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_link_encoder_setup+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_link_encoder_dp_set_phy_pattern+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_link_encoder_connect_dig_be_to_fe+0xf8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce60_link_encoder_construct+0xf0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce60_link_encoder_dp_set_phy_pattern+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_mi_program_pte_vm+0xc0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: program_grph_pixel_format+0xd0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_program_pix_clk+0x7a8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_ss_data_entry+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_transform_get_optimal_number_of_taps+0xb8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: configure_graphics_mode+0xc4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_transform_set_pixel_storage_depth+0x148: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_filter_coeffs_16p+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: set_denormalization+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: set_round+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce60_transform_set_pixel_storage_depth+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_opp_set_clamping+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: set_spatial_dither+0x1c4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce60_opp_program_fmt+0xe0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_dmcu_setup_psr+0xd0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dcn10_dmcu_setup_psr+0xec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_ipp_cursor_set_attributes+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_aux_configure_timeout+0x1b4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_i2c_submit_command_sw+0x230: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dmub_psr_get_state+0xa4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dmub_replay_send_cmd+0x90: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dmub_replay_residency+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_gpio_get_sync_source+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_gpio_create+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_gpio_service_open+0x114: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_hw_factory_init+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_hw_gpio_config_mode+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dal_hw_translate_init+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.17922509056781146048+0x128: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.17922509056781146048+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.5950510450151290124+0x128: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.5950510450151290124+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.10627752979407100357+0x150: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.10627752979407100357+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.13015197079183416452+0x150: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.13015197079183416452+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.8395230476989753172+0x150: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.8395230476989753172+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.9621139854595012177+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.9621139854595012177+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.14872008295439248821+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.14872008295439248821+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.3971983104138372946+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.3971983104138372946+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.5326177460966789901+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.5326177460966789901+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.7765598953241864197+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.7765598953241864197+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: offset_to_id.llvm.4911145929124267298+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: id_to_offset.llvm.4911145929124267298+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce60_apply_ctx_for_surface+0x3ac: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: translate_to_dto_source+0x40: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: populate_audio_dp_link_info+0x1fc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: build_audio_output+0x20c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_set_input_transfer_func+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dce60+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dce110+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn10+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn20+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn21+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn201+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn30+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn302+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn303+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn31+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn314+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn315+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn32+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn35+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn351+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn36+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: to_dal_irq_source_dcn401+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: link_detect+0x5a4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_ext_hdmi_settings+0x9c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: link_set_dpms_on+0x68c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: link_validate_mode_timing+0x61c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_handle_automated_test+0x600: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_set_test_pattern+0x4ac: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: set_crtc_test_pattern+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_hpd_line+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: link_get_fixed_vs_pe_retimer_write_address+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_log_training_result+0x118: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_initialize_scrambling_data_symbols+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_training_pattern_to_dpcd_training_pattern+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_translate_training_aux_read_interval+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_get_eq_aux_rd_interval+0x110: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dpcd_set_training_pattern+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dpcd_set_lt_pattern_and_lane_settings+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_set_hw_training_pattern+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: decide_8b_10b_training_settings+0x14c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dpia_perform_link_training+0xa98: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_parse_lttpr_repeater_count+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: link_bw_kbps_from_raw_frl_link_rate_data+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: decide_fallback_link_setting+0x13c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: reduce_link_rate+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_active_converter_info+0x14c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: edp_setup_psr+0x2d0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: link_dpia_enable_usb4_dp_bw_alloc_mode+0xd0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_bandwidth_in_kbps_from_timing+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_dsc_parse_dsc_dpcd+0xb8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dsc_throughput_from_dpcd+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: setup_dsc_config+0x198: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_dsc_get_policy_for_timing+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce60_link_encoder_create+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce80_link_encoder_create+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce100_link_encoder_create+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_link_encoder_create+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: resource_map_phy_clock_resources+0xe4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce112_link_encoder_create+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce120_link_encoder_create+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce120_timing_generator_disable_vga+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce120_timing_generator_set_test_pattern+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce112_compressor_program_lpt_control+0x218: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_timing_generator_set_test_pattern+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_timing_generator_disable_vga+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_opp_v_set_csc_default+0x37c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_mem_input_v_program_pte_vm.llvm.13880970803235655497+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_mem_input_v_program_surface_config.llvm.13880970803235655497+0x39c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce110_xfmv_set_pixel_storage_depth+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_dmub_srv_notify_idle+0x160: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_version_to_string+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_update_visual_confirm_color+0x26c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_status_to_str+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_pixel_encoding_to_str+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_color_depth_to_str+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: find_color_matrix+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: color_space_to_black_color+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_surface_visual_confirm_color+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_mclk_switch_visual_confirm_color+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: hwss_execute_sequence+0xa4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: resource_parse_asic_id+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_create_resource_pool+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: resource_build_test_pattern_params+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: resource_build_scaling_params+0x118: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: resource_is_pipe_type+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: calculate_phy_pix_clks+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: resource_build_info_frame+0x588: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: resource_build_bit_depth_reduction_params+0x314: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: resource_pixel_format_to_bpp+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: resource_transmitter_to_phy_idx+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_color_calculate_degamma_params+0x24c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: build_coefficients+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_build_vsc_infopacket+0x450: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_build_hf_vsif_infopacket+0x140: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dmub_srv_create+0xc0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dmub_srv_stat_get_notification+0x110: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dmub_dcn401_send_reg_inbox0_cmd_msg+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_status_to_str+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_state_id_to_str+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_hdcp2_create_session+0x10c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_hdcp1_execution+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_hdcp1_dp_execution+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_hdcp1_transition+0x68: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
