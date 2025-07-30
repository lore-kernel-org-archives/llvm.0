Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371F01CDA3F;
	Wed, 30 Jul 2025 01:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753840590; cv=none; b=Sgrhmu/craJOuFm9+C1afv1VcgSfYh6N32qipv/FZAS/8g8UWd4uel7pKa60J7zXKD7oHIjTfsZrE9Wd7qYnMjDlG56bvrMZM1t5/YEeqCfrdvRhWq+z4LBAKxAsOWDidBslPjTJ8tdqcfVfcS0oGp10PhG2RwlS6qmkPPuz7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753840590; c=relaxed/simple;
	bh=TPdH2OFjavmD8HZiabkL9jfybjdro/SgRX5HRyZNi20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7ojKNwNmycA49Fw/tdBhi2L1tnWNUanN85eDwD4ytzjEcKQBJqq+jQzqVI47x3+GwLX65I4Ghqqqhyj0oi9RQf0prR+VcnvsdrtBGUjOMyPDpG8S6wC9Q67hzsSOxsX2YahCaMaxRbIy8ULGKCZJZSrJ1/Sv0/WuKAW2YOW3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8uO6Cy8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8uO6Cy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753840588; x=1785376588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPdH2OFjavmD8HZiabkL9jfybjdro/SgRX5HRyZNi20=;
  b=Q8uO6Cy8rqolmIoQxxwG3AXvPS2XUKFYmhTueC01a94/hCX2TeKAK6LC
   p1Rsq8K3zCtPcYQtd6N1tp7GHilVRrtffyCmUkQVpUhHNdfi+RqWKRoz8
   uvY/MdFV0nUI/+e7iTDWj60nt7IU4ykTtfuKb30imQxk564zlK32V3/GH
   VVJgL3Mo4we8f8rqMsxs5K5jM1ZlJzX9ELC7atTWHcOXkKAz4QmxNmaXd
   Y6npTMomlNcPZ7PJrpoJ2pSMj9xR35gZK/n6P642mrRAa19+AK7uNf8jb
   27LAYgH3hYPhSK2Kd/OVviZwMRrGLrGpO08U94DOoEHKVwKJWfN6uRfwn
   w==;
X-CSE-ConnectionGUID: ihmY8z8hQaGIEHrrGTWDwQ==
X-CSE-MsgGUID: W0Pl4rkKSo64eIHGlF+TvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59955040"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="59955040"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 18:56:26 -0700
X-CSE-ConnectionGUID: lFSpbaXwRDG4nWIYqOirZA==
X-CSE-MsgGUID: BRBtpFHgS1+3h0FgtFa8ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="168147822"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jul 2025 18:51:46 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugvyp-0001rb-2d;
	Wed, 30 Jul 2025 01:51:43 +0000
Date: Wed, 30 Jul 2025 09:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Matthew Brost <matthew.brost@intel.com>
Subject: [linux-next:master 11095/12827] vmlinux.o: warning: objtool:
 register_exec_queue.llvm.7904150307710208986+0x84: sibling call from
 callable instruction with modified stack frame
Message-ID: <202507300932.cMHKVE2Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   54efec8782214652b331c50646013f8526570e8d
commit: 916ee4704a8653910f10c65c2b5d6699dfac5df8 [11095/12827] drm/xe/vf: Register CCS read/write contexts with Guc
config: loongarch-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300932.cMHKVE2Y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300932.cMHKVE2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300932.cMHKVE2Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   vmlinux.o: warning: objtool: dpia_perform_link_training+0xaa8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dp_parse_lttpr_repeater_count+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: link_bw_kbps_from_raw_frl_link_rate_data+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: decide_fallback_link_setting+0x13c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: reduce_link_rate+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_active_converter_info+0x14c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: edp_setup_psr+0x2c0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: link_dpia_enable_usb4_dp_bw_alloc_mode+0xdc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_bandwidth_in_kbps_from_timing+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_dsc_parse_dsc_dpcd+0xb8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dsc_throughput_from_dpcd+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: setup_dsc_config+0x1a4: sibling call from callable instruction with modified stack frame
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
   vmlinux.o: warning: objtool: dc_dmub_srv_notify_idle+0x154: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_dmub_srv_ips_query_residency_info+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dce_version_to_string+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dc_update_visual_confirm_color+0x264: sibling call from callable instruction with modified stack frame
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
   vmlinux.o: warning: objtool: mod_hdcp_hdcp1_dp_transition+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_hdcp2_execution+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_hdcp2_dp_execution+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_hdcp2_transition+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mod_hdcp_hdcp2_dp_transition+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_ttm_io_mem_reserve.llvm.7554943727570445750+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_exec_queue_assign_name+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_gsc_load_start+0x98: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_gsc_stop_prepare+0x90: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_gt_clock_init+0xa4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: acc_queue_work_func+0x158: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __xe_guc_upload.llvm.11532270743475513411+0x438: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: guc_golden_lrc_init+0x134: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_guc_ads_populate+0xda0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_guc_ads_populate_post_load+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_engine_manual_capture+0x318: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_engine_snapshot_print+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_guc_capture_get_matching_and_lock+0x1c0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_guc_capture_steered_list_init+0x190: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dequeue_one_g2h+0x16c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: hw_engine_to_engine_activity+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: engine_activity_map+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_guc_klv_key_to_string+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_guc_pc_print+0xc8: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: register_exec_queue.llvm.7904150307710208986+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: guc_exec_queue_process_msg+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_heci_gsc_init+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_hw_engine_class_to_str+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_hw_engine_setup_groups+0x13c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_gt_lrc_size+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_mocs_settings+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_nvm_init+0x140: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_oa_stream_open_ioctl+0x408: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_oa_init+0x2f0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_oa_ioctl+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_pm_notifier_callback+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_pt_update_ops_prepare+0x1e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: op_commit+0xc0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_pxp_get_readiness_status+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_pxp_exec_queue_add+0x158: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_pxp_pm_suspend+0xdc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pxp_info+0xec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: query_engine_cycles+0x1a0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_reg_whitelist_print_entry+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_ring_ops_get+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rule_matches+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_step_pre_gmdid_get+0x368: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_step_name+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_ttm_stolen_mgr_init+0x294: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_wopcm_size+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_uc_fw_print+0xe4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: vm_bind_ioctl_ops_create+0xc0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: vm_bind_ioctl_ops_execute+0x11c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: vm_bind_ioctl_ops_parse+0x9f0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_pmt_telem_read+0xf8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: do_compare+0x138: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_hwmon_is_visible+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_hwmon_read+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_hwmon_read_label+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: relay_send_to.llvm.11323946379893786058+0x178: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: relay_process_msg+0xdc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: relay_send_transaction+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: relay_process_incoming_action+0x29c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_gt_sriov_pf_config_set_threshold+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pf_provision_threshold+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_gt_sriov_pf_config_restore+0x208: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_gt_sriov_pf_control_process_guc2pf+0x13c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pf_send_vf_control_cmd+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xe_gt_sriov_pf_monitor_process_guc2pf+0xe8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: kmb_plane_atomic_update+0xa1c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: kmb_dsi_mode_set+0x334: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mgag200_init_pci_options+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mgag200_pci_probe+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mgag200_g200_device_create+0x64c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mgag200_g200se_device_create+0xc4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mgag200_set_format_regs+0xdc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: v3d_show_fdinfo+0xf0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: v3d_get_param_ioctl+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: v3d_fence_get_timeline_name+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: v3d_get_extensions+0x1c4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_conversion_matrix_to_argb_u16+0xa8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_block_step_bytes+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_subsampling+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_subsampling_offset+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvif_conn_ctor+0x118: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvif_outp_ctor+0x160: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvkm_boolopt+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: dcb_i2c_parse+0x1b8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: init_generic_condition+0x94: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mxm_sor_map+0x15c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvbios_perfEp+0x3d8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvbios_timingEp+0x3f0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvbios_therm_sensor_parse+0xdc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvbios_therm_fan_parse+0xe0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nv04_clk_pll_prog+0xb0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: read_clk+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nv50_clk_read+0x2b0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: read_div+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: read_div+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: read_div+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: read_pll_ref+0x200: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: read_vco+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gt215_clk_read+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mcp77_clk_read+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gf100_clk_read+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gk104_clk_read+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: powerctrl_1_shift+0xd4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: setPLL_double_highregs+0x3f8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nv04_devinit_pll_set+0x16c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvkm_fb_bios_memtype+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nv04_ram_new+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nv20_ram_new+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nv40_ram_new+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nv40_ram_prog+0x464: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nv49_ram_new+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nv50_ram_ctor+0x94: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gk104_ram_init+0x358: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gk104_ram_calc_sddr3+0xec0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gk104_ram_calc_gddr5+0xe54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvkm_rm_engine_obj_new+0xe0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nvkm_rm_engine_new+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: r535_gsp_msg_run_cpu_sequencer+0x258: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: r535_gsp_xlat_mc_engine_idx+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: r535_dp_get_caps+0x12c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: r535_outp_new+0x170: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
