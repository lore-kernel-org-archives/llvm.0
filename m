Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E6A3F;
	Tue, 28 Mar 2023 04:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679977071; x=1711513071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MVQmqSMWkH/bwxqqpPEro/VanLVMDYXA3r6UCNX41EY=;
  b=PJuTRxFJLw7FmQC9EA/E9QfcRVclMo0CydXNa4Ac2RJlHyZCZe+QZZAk
   XryEuZwFOAx2V+4reOzj1NWC4oSvEJvI9juHNtZ1gOXayAG9iOpctbZv4
   RZMtgNwgVlFZqJIxyvycC6RkJzbQmIt+whsTrQA4GiCRzLanUp144Tm+P
   sOTrufavLc8oIijz7ZaJNY/SMHXr8fmYIRxrFXp5XprIz1S+8n1IOJFQn
   FatgxRHWENUSGLeZ3UcepC2C3VL9LW0+ZDQu/BtZV7+Qp2XLThTo3lXo3
   NLAOiBAZ1vhwHcxSdmhmc7F3iJjeBU+pKqhg55ND6g41cq9Z1ESC0LFMr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324361216"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="324361216"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 21:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="1013386681"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="1013386681"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Mar 2023 21:17:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph0mJ-000IGj-27;
	Tue, 28 Mar 2023 04:17:47 +0000
Date: Tue, 28 Mar 2023 12:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.19.y 2317/9999]
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/calcs_logger.h:183:13:
 warning: stack frame size (1112) exceeds limit (1024) in
 'print_bw_calcs_data'
Message-ID: <202303281215.uj1CSANy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   30baa0923a27fb9a04444a29562344e0573992e4
commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [2317/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r015-20230326 (https://download.01.org/0day-ci/archive/20230328/202303281215.uj1CSANy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=69c122751164c3c343eea205fd5c3e1d5132f967
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 69c122751164c3c343eea205fd5c3e1d5132f967
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281215.uj1CSANy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2999:21: warning: variable 'sclk_lvl' set but not used [-Wunused-but-set-variable]
                   uint8_t yclk_lvl, sclk_lvl;
                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2981:6: warning: stack frame size (1240) exceeds limit (1024) in 'bw_calcs' [-Wframe-larger-than]
   bool bw_calcs(struct dc_context *ctx,
        ^
   126/1240 (10.16%) spills, 1114/1240 (89.84%) variables
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:31:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/calcs_logger.h:183:13: warning: stack frame size (1112) exceeds limit (1024) in 'print_bw_calcs_data' [-Wframe-larger-than]
   static void print_bw_calcs_data(struct dc_context *ctx, struct bw_calcs_data *data)
               ^
   1060/1112 (95.32%) spills, 52/1112 (4.68%) variables
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:74:13: warning: stack frame size (4856) exceeds limit (1024) in 'calculate_bandwidth' [-Wframe-larger-than]
   static void calculate_bandwidth(
               ^
   36/4856 (0.74%) spills, 4820/4856 (99.26%) variables
   4 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2740: warning: Function parameter or member 'vbios' not described in 'is_display_configuration_supported'
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2740: warning: Function parameter or member 'calcs_output' not described in 'is_display_configuration_supported'
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2987: warning: Function parameter or member 'ctx' not described in 'bw_calcs'
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2987: warning: Function parameter or member 'dceip' not described in 'bw_calcs'
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2987: warning: Function parameter or member 'vbios' not described in 'bw_calcs'
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2987: warning: Function parameter or member 'pipe' not described in 'bw_calcs'
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2987: warning: Function parameter or member 'pipe_count' not described in 'bw_calcs'
   drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2987: warning: Function parameter or member 'calcs_output' not described in 'bw_calcs'


vim +/print_bw_calcs_data +183 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/calcs_logger.h

1249acefefd4300 Bhawanpreet Lakha   2018-03-08  182  
e1cb3e4801e6896 Nicholas Kazlauskas 2018-06-19 @183  static void print_bw_calcs_data(struct dc_context *ctx, struct bw_calcs_data *data)
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  184  {
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  185  
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  186  	int i, j, k;
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  187  
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  188  	DC_LOG_BANDWIDTH_CALCS("#####################################################################");
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  189  	DC_LOG_BANDWIDTH_CALCS("struct bw_calcs_data data");
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  190  	DC_LOG_BANDWIDTH_CALCS("#####################################################################");
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  191  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] number_of_displays: %d", data->number_of_displays);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  192  	DC_LOG_BANDWIDTH_CALCS("	[enum] bw_defines underlay_surface_type: %d", data->underlay_surface_type);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  193  	DC_LOG_BANDWIDTH_CALCS("	[enum] bw_defines panning_and_bezel_adjustment: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  194  				data->panning_and_bezel_adjustment);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  195  	DC_LOG_BANDWIDTH_CALCS("	[enum] bw_defines graphics_tiling_mode: %d", data->graphics_tiling_mode);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  196  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] graphics_lb_bpc: %d", data->graphics_lb_bpc);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  197  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] underlay_lb_bpc: %d", data->underlay_lb_bpc);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  198  	DC_LOG_BANDWIDTH_CALCS("	[enum] bw_defines underlay_tiling_mode: %d", data->underlay_tiling_mode);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  199  	DC_LOG_BANDWIDTH_CALCS("	[enum] bw_defines d0_underlay_mode: %d", data->d0_underlay_mode);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  200  	DC_LOG_BANDWIDTH_CALCS("	[bool] d1_display_write_back_dwb_enable: %d", data->d1_display_write_back_dwb_enable);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  201  	DC_LOG_BANDWIDTH_CALCS("	[enum] bw_defines d1_underlay_mode: %d", data->d1_underlay_mode);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  202  	DC_LOG_BANDWIDTH_CALCS("	[bool] cpup_state_change_enable: %d", data->cpup_state_change_enable);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  203  	DC_LOG_BANDWIDTH_CALCS("	[bool] cpuc_state_change_enable: %d", data->cpuc_state_change_enable);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  204  	DC_LOG_BANDWIDTH_CALCS("	[bool] nbp_state_change_enable: %d", data->nbp_state_change_enable);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  205  	DC_LOG_BANDWIDTH_CALCS("	[bool] stutter_mode_enable: %d", data->stutter_mode_enable);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  206  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] y_clk_level: %d", data->y_clk_level);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  207  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] sclk_level: %d", data->sclk_level);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  208  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] number_of_underlay_surfaces: %d", data->number_of_underlay_surfaces);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  209  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] number_of_dram_wrchannels: %d", data->number_of_dram_wrchannels);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  210  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] chunk_request_delay: %d", data->chunk_request_delay);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  211  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] number_of_dram_channels: %d", data->number_of_dram_channels);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  212  	DC_LOG_BANDWIDTH_CALCS("	[enum] bw_defines underlay_micro_tile_mode: %d", data->underlay_micro_tile_mode);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  213  	DC_LOG_BANDWIDTH_CALCS("	[enum] bw_defines graphics_micro_tile_mode: %d", data->graphics_micro_tile_mode);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  214  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] max_phyclk: %d", bw_fixed_to_int(data->max_phyclk));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  215  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dram_efficiency: %d", bw_fixed_to_int(data->dram_efficiency));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  216  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_width_after_surface_type: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  217  				bw_fixed_to_int(data->src_width_after_surface_type));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  218  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_height_after_surface_type: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  219  				bw_fixed_to_int(data->src_height_after_surface_type));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  220  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] hsr_after_surface_type: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  221  				bw_fixed_to_int(data->hsr_after_surface_type));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  222  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] vsr_after_surface_type: %d", bw_fixed_to_int(data->vsr_after_surface_type));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  223  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_width_after_rotation: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  224  				bw_fixed_to_int(data->src_width_after_rotation));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  225  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_height_after_rotation: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  226  				bw_fixed_to_int(data->src_height_after_rotation));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  227  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] hsr_after_rotation: %d", bw_fixed_to_int(data->hsr_after_rotation));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  228  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] vsr_after_rotation: %d", bw_fixed_to_int(data->vsr_after_rotation));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  229  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] source_height_pixels: %d", bw_fixed_to_int(data->source_height_pixels));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  230  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] hsr_after_stereo: %d", bw_fixed_to_int(data->hsr_after_stereo));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  231  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] vsr_after_stereo: %d", bw_fixed_to_int(data->vsr_after_stereo));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  232  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] source_width_in_lb: %d", bw_fixed_to_int(data->source_width_in_lb));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  233  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] lb_line_pitch: %d", bw_fixed_to_int(data->lb_line_pitch));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  234  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] underlay_maximum_source_efficient_for_tiling: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  235  				bw_fixed_to_int(data->underlay_maximum_source_efficient_for_tiling));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  236  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] num_lines_at_frame_start: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  237  				bw_fixed_to_int(data->num_lines_at_frame_start));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  238  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] min_dmif_size_in_time: %d", bw_fixed_to_int(data->min_dmif_size_in_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  239  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] min_mcifwr_size_in_time: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  240  				bw_fixed_to_int(data->min_mcifwr_size_in_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  241  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_requests_for_dmif_size: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  242  				bw_fixed_to_int(data->total_requests_for_dmif_size));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  243  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] peak_pte_request_to_eviction_ratio_limiting: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  244  				bw_fixed_to_int(data->peak_pte_request_to_eviction_ratio_limiting));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  245  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] useful_pte_per_pte_request: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  246  				bw_fixed_to_int(data->useful_pte_per_pte_request));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  247  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scatter_gather_pte_request_rows: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  248  				bw_fixed_to_int(data->scatter_gather_pte_request_rows));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  249  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scatter_gather_row_height: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  250  				bw_fixed_to_int(data->scatter_gather_row_height));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  251  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scatter_gather_pte_requests_in_vblank: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  252  				bw_fixed_to_int(data->scatter_gather_pte_requests_in_vblank));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  253  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] inefficient_linear_pitch_in_bytes: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  254  				bw_fixed_to_int(data->inefficient_linear_pitch_in_bytes));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  255  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] cursor_total_data: %d", bw_fixed_to_int(data->cursor_total_data));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  256  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] cursor_total_request_groups: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  257  				bw_fixed_to_int(data->cursor_total_request_groups));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  258  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scatter_gather_total_pte_requests: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  259  				bw_fixed_to_int(data->scatter_gather_total_pte_requests));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  260  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scatter_gather_total_pte_request_groups: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  261  				bw_fixed_to_int(data->scatter_gather_total_pte_request_groups));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  262  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] tile_width_in_pixels: %d", bw_fixed_to_int(data->tile_width_in_pixels));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  263  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dmif_total_number_of_data_request_page_close_open: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  264  				bw_fixed_to_int(data->dmif_total_number_of_data_request_page_close_open));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  265  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] mcifwr_total_number_of_data_request_page_close_open: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  266  				bw_fixed_to_int(data->mcifwr_total_number_of_data_request_page_close_open));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  267  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] bytes_per_page_close_open: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  268  				bw_fixed_to_int(data->bytes_per_page_close_open));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  269  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] mcifwr_total_page_close_open_time: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  270  				bw_fixed_to_int(data->mcifwr_total_page_close_open_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  271  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_requests_for_adjusted_dmif_size: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  272  				bw_fixed_to_int(data->total_requests_for_adjusted_dmif_size));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  273  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_dmifmc_urgent_trips: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  274  				bw_fixed_to_int(data->total_dmifmc_urgent_trips));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  275  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_dmifmc_urgent_latency: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  276  				bw_fixed_to_int(data->total_dmifmc_urgent_latency));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  277  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_display_reads_required_data: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  278  				bw_fixed_to_int(data->total_display_reads_required_data));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  279  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_display_reads_required_dram_access_data: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  280  				bw_fixed_to_int(data->total_display_reads_required_dram_access_data));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  281  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_display_writes_required_data: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  282  				bw_fixed_to_int(data->total_display_writes_required_data));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  283  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_display_writes_required_dram_access_data: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  284  				bw_fixed_to_int(data->total_display_writes_required_dram_access_data));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  285  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] display_reads_required_data: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  286  				bw_fixed_to_int(data->display_reads_required_data));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  287  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] display_reads_required_dram_access_data: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  288  				bw_fixed_to_int(data->display_reads_required_dram_access_data));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  289  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dmif_total_page_close_open_time: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  290  				bw_fixed_to_int(data->dmif_total_page_close_open_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  291  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] min_cursor_memory_interface_buffer_size_in_time: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  292  				bw_fixed_to_int(data->min_cursor_memory_interface_buffer_size_in_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  293  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] min_read_buffer_size_in_time: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  294  				bw_fixed_to_int(data->min_read_buffer_size_in_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  295  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] display_reads_time_for_data_transfer: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  296  				bw_fixed_to_int(data->display_reads_time_for_data_transfer));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  297  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] display_writes_time_for_data_transfer: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  298  				bw_fixed_to_int(data->display_writes_time_for_data_transfer));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  299  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dmif_required_dram_bandwidth: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  300  				bw_fixed_to_int(data->dmif_required_dram_bandwidth));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  301  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] mcifwr_required_dram_bandwidth: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  302  				bw_fixed_to_int(data->mcifwr_required_dram_bandwidth));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  303  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] required_dmifmc_urgent_latency_for_page_close_open: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  304  				bw_fixed_to_int(data->required_dmifmc_urgent_latency_for_page_close_open));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  305  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] required_mcifmcwr_urgent_latency: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  306  				bw_fixed_to_int(data->required_mcifmcwr_urgent_latency));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  307  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] required_dram_bandwidth_gbyte_per_second: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  308  				bw_fixed_to_int(data->required_dram_bandwidth_gbyte_per_second));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  309  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dram_bandwidth: %d", bw_fixed_to_int(data->dram_bandwidth));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  310  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dmif_required_sclk: %d", bw_fixed_to_int(data->dmif_required_sclk));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  311  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] mcifwr_required_sclk: %d", bw_fixed_to_int(data->mcifwr_required_sclk));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  312  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] required_sclk: %d", bw_fixed_to_int(data->required_sclk));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  313  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] downspread_factor: %d", bw_fixed_to_int(data->downspread_factor));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  314  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] v_scaler_efficiency: %d", bw_fixed_to_int(data->v_scaler_efficiency));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  315  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scaler_limits_factor: %d", bw_fixed_to_int(data->scaler_limits_factor));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  316  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] display_pipe_pixel_throughput: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  317  				bw_fixed_to_int(data->display_pipe_pixel_throughput));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  318  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_dispclk_required_with_ramping: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  319  				bw_fixed_to_int(data->total_dispclk_required_with_ramping));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  320  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_dispclk_required_without_ramping: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  321  				bw_fixed_to_int(data->total_dispclk_required_without_ramping));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  322  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_read_request_bandwidth: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  323  				bw_fixed_to_int(data->total_read_request_bandwidth));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  324  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_write_request_bandwidth: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  325  				bw_fixed_to_int(data->total_write_request_bandwidth));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  326  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dispclk_required_for_total_read_request_bandwidth: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  327  				bw_fixed_to_int(data->dispclk_required_for_total_read_request_bandwidth));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  328  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_dispclk_required_with_ramping_with_request_bandwidth: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  329  				bw_fixed_to_int(data->total_dispclk_required_with_ramping_with_request_bandwidth));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  330  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_dispclk_required_without_ramping_with_request_bandwidth: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  331  				bw_fixed_to_int(data->total_dispclk_required_without_ramping_with_request_bandwidth));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  332  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dispclk: %d", bw_fixed_to_int(data->dispclk));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  333  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] blackout_recovery_time: %d", bw_fixed_to_int(data->blackout_recovery_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  334  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] min_pixels_per_data_fifo_entry: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  335  				bw_fixed_to_int(data->min_pixels_per_data_fifo_entry));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  336  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] sclk_deep_sleep: %d", bw_fixed_to_int(data->sclk_deep_sleep));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  337  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] chunk_request_time: %d", bw_fixed_to_int(data->chunk_request_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  338  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] cursor_request_time: %d", bw_fixed_to_int(data->cursor_request_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  339  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] line_source_pixels_transfer_time: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  340  				bw_fixed_to_int(data->line_source_pixels_transfer_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  341  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dmifdram_access_efficiency: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  342  				bw_fixed_to_int(data->dmifdram_access_efficiency));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  343  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] mcifwrdram_access_efficiency: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  344  				bw_fixed_to_int(data->mcifwrdram_access_efficiency));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  345  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_average_bandwidth_no_compression: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  346  				bw_fixed_to_int(data->total_average_bandwidth_no_compression));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  347  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_average_bandwidth: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  348  				bw_fixed_to_int(data->total_average_bandwidth));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  349  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] total_stutter_cycle_duration: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  350  				bw_fixed_to_int(data->total_stutter_cycle_duration));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  351  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] stutter_burst_time: %d", bw_fixed_to_int(data->stutter_burst_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  352  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] time_in_self_refresh: %d", bw_fixed_to_int(data->time_in_self_refresh));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  353  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] stutter_efficiency: %d", bw_fixed_to_int(data->stutter_efficiency));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  354  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] worst_number_of_trips_to_memory: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  355  				bw_fixed_to_int(data->worst_number_of_trips_to_memory));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  356  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] immediate_flip_time: %d", bw_fixed_to_int(data->immediate_flip_time));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  357  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] latency_for_non_dmif_clients: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  358  				bw_fixed_to_int(data->latency_for_non_dmif_clients));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  359  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] latency_for_non_mcifwr_clients: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  360  				bw_fixed_to_int(data->latency_for_non_mcifwr_clients));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  361  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dmifmc_urgent_latency_supported_in_high_sclk_and_yclk: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  362  				bw_fixed_to_int(data->dmifmc_urgent_latency_supported_in_high_sclk_and_yclk));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  363  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] nbp_state_dram_speed_change_margin: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  364  				bw_fixed_to_int(data->nbp_state_dram_speed_change_margin));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  365  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] display_reads_time_for_data_transfer_and_urgent_latency: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  366  				bw_fixed_to_int(data->display_reads_time_for_data_transfer_and_urgent_latency));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  367  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dram_speed_change_margin: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  368  				bw_fixed_to_int(data->dram_speed_change_margin));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  369  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] min_vblank_dram_speed_change_margin: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  370  				bw_fixed_to_int(data->min_vblank_dram_speed_change_margin));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  371  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] min_stutter_refresh_duration: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  372  				bw_fixed_to_int(data->min_stutter_refresh_duration));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  373  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] total_stutter_dmif_buffer_size: %d", data->total_stutter_dmif_buffer_size);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  374  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] total_bytes_requested: %d", data->total_bytes_requested);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  375  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] min_stutter_dmif_buffer_size: %d", data->min_stutter_dmif_buffer_size);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  376  	DC_LOG_BANDWIDTH_CALCS("	[uint32_t] num_stutter_bursts: %d", data->num_stutter_bursts);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  377  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] v_blank_nbp_state_dram_speed_change_latency_supported: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  378  				bw_fixed_to_int(data->v_blank_nbp_state_dram_speed_change_latency_supported));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  379  	DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] nbp_state_dram_speed_change_latency_supported: %d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  380  				bw_fixed_to_int(data->nbp_state_dram_speed_change_latency_supported));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  381  
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  382  	for (i = 0; i < maximum_number_of_surfaces; i++) {
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  383  		DC_LOG_BANDWIDTH_CALCS("	[bool] fbc_en[%d]:%d\n", i, data->fbc_en[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  384  		DC_LOG_BANDWIDTH_CALCS("	[bool] lpt_en[%d]:%d", i, data->lpt_en[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  385  		DC_LOG_BANDWIDTH_CALCS("	[bool] displays_match_flag[%d]:%d", i, data->displays_match_flag[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  386  		DC_LOG_BANDWIDTH_CALCS("	[bool] use_alpha[%d]:%d", i, data->use_alpha[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  387  		DC_LOG_BANDWIDTH_CALCS("	[bool] orthogonal_rotation[%d]:%d", i, data->orthogonal_rotation[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  388  		DC_LOG_BANDWIDTH_CALCS("	[bool] enable[%d]:%d", i, data->enable[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  389  		DC_LOG_BANDWIDTH_CALCS("	[bool] access_one_channel_only[%d]:%d", i, data->access_one_channel_only[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  390  		DC_LOG_BANDWIDTH_CALCS("	[bool] scatter_gather_enable_for_pipe[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  391  					i, data->scatter_gather_enable_for_pipe[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  392  		DC_LOG_BANDWIDTH_CALCS("	[bool] interlace_mode[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  393  					i, data->interlace_mode[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  394  		DC_LOG_BANDWIDTH_CALCS("	[bool] display_pstate_change_enable[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  395  					i, data->display_pstate_change_enable[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  396  		DC_LOG_BANDWIDTH_CALCS("	[bool] line_buffer_prefetch[%d]:%d", i, data->line_buffer_prefetch[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  397  		DC_LOG_BANDWIDTH_CALCS("	[uint32_t] bytes_per_pixel[%d]:%d", i, data->bytes_per_pixel[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  398  		DC_LOG_BANDWIDTH_CALCS("	[uint32_t] max_chunks_non_fbc_mode[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  399  					i, data->max_chunks_non_fbc_mode[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  400  		DC_LOG_BANDWIDTH_CALCS("	[uint32_t] lb_bpc[%d]:%d", i, data->lb_bpc[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  401  		DC_LOG_BANDWIDTH_CALCS("	[uint32_t] output_bpphdmi[%d]:%d", i, data->output_bpphdmi[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  402  		DC_LOG_BANDWIDTH_CALCS("	[uint32_t] output_bppdp4_lane_hbr[%d]:%d", i, data->output_bppdp4_lane_hbr[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  403  		DC_LOG_BANDWIDTH_CALCS("	[uint32_t] output_bppdp4_lane_hbr2[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  404  					i, data->output_bppdp4_lane_hbr2[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  405  		DC_LOG_BANDWIDTH_CALCS("	[uint32_t] output_bppdp4_lane_hbr3[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  406  					i, data->output_bppdp4_lane_hbr3[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  407  		DC_LOG_BANDWIDTH_CALCS("	[enum] bw_defines stereo_mode[%d]:%d", i, data->stereo_mode[i]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  408  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dmif_buffer_transfer_time[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  409  					i, bw_fixed_to_int(data->dmif_buffer_transfer_time[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  410  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] displays_with_same_mode[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  411  					i, bw_fixed_to_int(data->displays_with_same_mode[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  412  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] stutter_dmif_buffer_size[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  413  					i, bw_fixed_to_int(data->stutter_dmif_buffer_size[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  414  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] stutter_refresh_duration[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  415  					i, bw_fixed_to_int(data->stutter_refresh_duration[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  416  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] stutter_exit_watermark[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  417  					i, bw_fixed_to_int(data->stutter_exit_watermark[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  418  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] stutter_entry_watermark[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  419  					i, bw_fixed_to_int(data->stutter_entry_watermark[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  420  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] h_total[%d]:%d", i, bw_fixed_to_int(data->h_total[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  421  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] v_total[%d]:%d", i, bw_fixed_to_int(data->v_total[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  422  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] pixel_rate[%d]:%d", i, bw_fixed_to_int(data->pixel_rate[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  423  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_width[%d]:%d", i, bw_fixed_to_int(data->src_width[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  424  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] pitch_in_pixels[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  425  					i, bw_fixed_to_int(data->pitch_in_pixels[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  426  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] pitch_in_pixels_after_surface_type[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  427  					i, bw_fixed_to_int(data->pitch_in_pixels_after_surface_type[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  428  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_height[%d]:%d", i, bw_fixed_to_int(data->src_height[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  429  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scale_ratio[%d]:%d", i, bw_fixed_to_int(data->scale_ratio[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  430  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] h_taps[%d]:%d", i, bw_fixed_to_int(data->h_taps[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  431  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] v_taps[%d]:%d", i, bw_fixed_to_int(data->v_taps[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  432  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] h_scale_ratio[%d]:%d", i, bw_fixed_to_int(data->h_scale_ratio[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  433  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] v_scale_ratio[%d]:%d", i, bw_fixed_to_int(data->v_scale_ratio[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  434  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] rotation_angle[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  435  					i, bw_fixed_to_int(data->rotation_angle[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  436  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] compression_rate[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  437  					i, bw_fixed_to_int(data->compression_rate[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  438  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] hsr[%d]:%d", i, bw_fixed_to_int(data->hsr[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  439  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] vsr[%d]:%d", i, bw_fixed_to_int(data->vsr[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  440  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] source_width_rounded_up_to_chunks[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  441  					i, bw_fixed_to_int(data->source_width_rounded_up_to_chunks[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  442  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] source_width_pixels[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  443  					i, bw_fixed_to_int(data->source_width_pixels[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  444  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] source_height_rounded_up_to_chunks[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  445  					i, bw_fixed_to_int(data->source_height_rounded_up_to_chunks[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  446  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] display_bandwidth[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  447  					i, bw_fixed_to_int(data->display_bandwidth[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  448  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] request_bandwidth[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  449  					i, bw_fixed_to_int(data->request_bandwidth[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  450  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] bytes_per_request[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  451  					i, bw_fixed_to_int(data->bytes_per_request[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  452  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] useful_bytes_per_request[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  453  					i, bw_fixed_to_int(data->useful_bytes_per_request[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  454  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] lines_interleaved_in_mem_access[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  455  					i, bw_fixed_to_int(data->lines_interleaved_in_mem_access[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  456  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] latency_hiding_lines[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  457  					i, bw_fixed_to_int(data->latency_hiding_lines[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  458  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] lb_partitions[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  459  					i, bw_fixed_to_int(data->lb_partitions[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  460  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] lb_partitions_max[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  461  					i, bw_fixed_to_int(data->lb_partitions_max[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  462  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dispclk_required_with_ramping[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  463  					i, bw_fixed_to_int(data->dispclk_required_with_ramping[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  464  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dispclk_required_without_ramping[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  465  					i, bw_fixed_to_int(data->dispclk_required_without_ramping[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  466  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] data_buffer_size[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  467  					i, bw_fixed_to_int(data->data_buffer_size[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  468  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] outstanding_chunk_request_limit[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  469  					i, bw_fixed_to_int(data->outstanding_chunk_request_limit[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  470  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] urgent_watermark[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  471  					i, bw_fixed_to_int(data->urgent_watermark[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  472  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] nbp_state_change_watermark[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  473  					i, bw_fixed_to_int(data->nbp_state_change_watermark[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  474  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] v_filter_init[%d]:%d", i, bw_fixed_to_int(data->v_filter_init[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  475  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] stutter_cycle_duration[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  476  					i, bw_fixed_to_int(data->stutter_cycle_duration[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  477  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] average_bandwidth[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  478  					i, bw_fixed_to_int(data->average_bandwidth[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  479  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] average_bandwidth_no_compression[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  480  					i, bw_fixed_to_int(data->average_bandwidth_no_compression[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  481  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scatter_gather_pte_request_limit[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  482  					i, bw_fixed_to_int(data->scatter_gather_pte_request_limit[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  483  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] lb_size_per_component[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  484  					i, bw_fixed_to_int(data->lb_size_per_component[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  485  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] memory_chunk_size_in_bytes[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  486  					i, bw_fixed_to_int(data->memory_chunk_size_in_bytes[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  487  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] pipe_chunk_size_in_bytes[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  488  					i, bw_fixed_to_int(data->pipe_chunk_size_in_bytes[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  489  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] number_of_trips_to_memory_for_getting_apte_row[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  490  					i, bw_fixed_to_int(data->number_of_trips_to_memory_for_getting_apte_row[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  491  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] adjusted_data_buffer_size[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  492  					i, bw_fixed_to_int(data->adjusted_data_buffer_size[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  493  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] adjusted_data_buffer_size_in_memory[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  494  					i, bw_fixed_to_int(data->adjusted_data_buffer_size_in_memory[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  495  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] pixels_per_data_fifo_entry[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  496  					i, bw_fixed_to_int(data->pixels_per_data_fifo_entry[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  497  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scatter_gather_pte_requests_in_row[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  498  					i, bw_fixed_to_int(data->scatter_gather_pte_requests_in_row[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  499  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] pte_request_per_chunk[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  500  					i, bw_fixed_to_int(data->pte_request_per_chunk[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  501  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scatter_gather_page_width[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  502  					i, bw_fixed_to_int(data->scatter_gather_page_width[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  503  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] scatter_gather_page_height[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  504  					i, bw_fixed_to_int(data->scatter_gather_page_height[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  505  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] lb_lines_in_per_line_out_in_beginning_of_frame[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  506  					i, bw_fixed_to_int(data->lb_lines_in_per_line_out_in_beginning_of_frame[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  507  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] lb_lines_in_per_line_out_in_middle_of_frame[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  508  					i, bw_fixed_to_int(data->lb_lines_in_per_line_out_in_middle_of_frame[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  509  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] cursor_width_pixels[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  510  					i, bw_fixed_to_int(data->cursor_width_pixels[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  511  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] minimum_latency_hiding[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  512  					i, bw_fixed_to_int(data->minimum_latency_hiding[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  513  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] maximum_latency_hiding[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  514  					i, bw_fixed_to_int(data->maximum_latency_hiding[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  515  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] minimum_latency_hiding_with_cursor[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  516  					i, bw_fixed_to_int(data->minimum_latency_hiding_with_cursor[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  517  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] maximum_latency_hiding_with_cursor[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  518  					i, bw_fixed_to_int(data->maximum_latency_hiding_with_cursor[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  519  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_pixels_for_first_output_pixel[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  520  					i, bw_fixed_to_int(data->src_pixels_for_first_output_pixel[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  521  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_pixels_for_last_output_pixel[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  522  					i, bw_fixed_to_int(data->src_pixels_for_last_output_pixel[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  523  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_data_for_first_output_pixel[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  524  					i, bw_fixed_to_int(data->src_data_for_first_output_pixel[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  525  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] src_data_for_last_output_pixel[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  526  					i, bw_fixed_to_int(data->src_data_for_last_output_pixel[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  527  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] active_time[%d]:%d", i, bw_fixed_to_int(data->active_time[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  528  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] horizontal_blank_and_chunk_granularity_factor[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  529  					i, bw_fixed_to_int(data->horizontal_blank_and_chunk_granularity_factor[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  530  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] cursor_latency_hiding[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  531  					i, bw_fixed_to_int(data->cursor_latency_hiding[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  532  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] v_blank_dram_speed_change_margin[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  533  					i, bw_fixed_to_int(data->v_blank_dram_speed_change_margin[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  534  		}
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  535  
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  536  	for (i = 0; i < maximum_number_of_surfaces; i++) {
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  537  		for (j = 0; j < 3; j++) {
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  538  			for (k = 0; k < 8; k++) {
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  539  
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  540  				DC_LOG_BANDWIDTH_CALCS("\n	[bw_fixed] line_source_transfer_time[%d][%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  541  					i, j, k, bw_fixed_to_int(data->line_source_transfer_time[i][j][k]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  542  				DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dram_speed_change_line_source_transfer_time[%d][%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  543  					i, j, k,
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  544  					bw_fixed_to_int(data->dram_speed_change_line_source_transfer_time[i][j][k]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  545  			}
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  546  		}
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  547  	}
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  548  
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  549  	for (i = 0; i < 3; i++) {
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  550  		for (j = 0; j < 8; j++) {
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  551  
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  552  			DC_LOG_BANDWIDTH_CALCS("\n	[uint32_t] num_displays_with_margin[%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  553  					i, j, data->num_displays_with_margin[i][j]);
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  554  			DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dmif_burst_time[%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  555  					i, j, bw_fixed_to_int(data->dmif_burst_time[i][j]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  556  			DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] mcifwr_burst_time[%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  557  					i, j, bw_fixed_to_int(data->mcifwr_burst_time[i][j]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  558  			DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] min_dram_speed_change_margin[%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  559  					i, j, bw_fixed_to_int(data->min_dram_speed_change_margin[i][j]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  560  			DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dispclk_required_for_dram_speed_change[%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  561  					i, j, bw_fixed_to_int(data->dispclk_required_for_dram_speed_change[i][j]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  562  			DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] blackout_duration_margin[%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  563  					i, j, bw_fixed_to_int(data->blackout_duration_margin[i][j]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  564  			DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dispclk_required_for_blackout_duration[%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  565  					i, j, bw_fixed_to_int(data->dispclk_required_for_blackout_duration[i][j]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  566  			DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dispclk_required_for_blackout_recovery[%d][%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  567  					i, j, bw_fixed_to_int(data->dispclk_required_for_blackout_recovery[i][j]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  568  		}
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  569  	}
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  570  
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  571  	for (i = 0; i < 6; i++) {
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  572  		DC_LOG_BANDWIDTH_CALCS("	[bw_fixed] dmif_required_sclk_for_urgent_latency[%d]:%d",
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  573  					i, bw_fixed_to_int(data->dmif_required_sclk_for_urgent_latency[i]));
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  574  	}
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  575  }
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  576  ;
1249acefefd4300 Bhawanpreet Lakha   2018-03-08  577  

:::::: The code at line 183 was first introduced by commit
:::::: e1cb3e4801e6896ba93d63222b1052199d2a8c9b drm/amd/display: Convert remaining loggers off dc_logger

:::::: TO: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
