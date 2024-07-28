Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A46224DC;
	Sun, 28 Jul 2024 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722176471; cv=none; b=AT5BLhvpAUa6+4zwHZooLbi8qJjpBDWNh4xYJACOlnlQqNa3LicsdrCXSfGVmlQO79kCo17dqgIfhArGrQ/E8P1vlsJG+9SaUbipW9o7dYVmRABwdG4bDjajiB9/KZWoFIoExYcHVdVRz/2ctd2hCGkoI7tkzmZ30dbXWckj9gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722176471; c=relaxed/simple;
	bh=N4HeyKL/OsES6Vs+K4fJs0V+NxElfEYfLSeB7Htgvbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9x8/jtaYcAVxtexelGeDfZsk5u70LjEaHcRL5PNo5y3h5N6jPoATeQ96FVKhi119HkYHMfexDNLrB8Y0uM6w82yK8ut7hC/RbswhlKe0nF4O7GpjnBMhncdMSCaSBINo5DRAgjXeS9AibJZ+GKR56wQj7xrKjUYL8KPOANtOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMeG2mY5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMeG2mY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722176469; x=1753712469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N4HeyKL/OsES6Vs+K4fJs0V+NxElfEYfLSeB7Htgvbk=;
  b=aMeG2mY5glT4XGNyofm+ArP96k5kDd3OfTfhDC4OmPEotXHiNmzpS6uf
   P9SlZAriWs2oylaaNftTfPyqirq1uaaC6iQVfgD8BJZvbczVm0DuByImp
   S1ahDxOWW8M9wnSA6wr+mtI+r24ViaB6fg0+gTnMaxgo+uaW5VshHA4bQ
   ukOn53dT6HsfE7hKA74x+c4vCzHRDgaxCVBnbL6r3emHiYjqnDpjR/KGJ
   8TiujTnE0X3bCDhiIhXudgQYhnKdMlBc438ema9IBJ8lSfifFJ2aFkBZ0
   RI/uejF3rNCAVyVkiHN/Gb5By7sJrMs8h+k+qJW+LrtZZHC/ZgKAn+gCv
   A==;
X-CSE-ConnectionGUID: mY1s3qOVSNOJbASKzjRI+Q==
X-CSE-MsgGUID: qS3QWL04Twm/4bYIjxaBTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="37424979"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="37424979"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 07:21:08 -0700
X-CSE-ConnectionGUID: 2rpXd/1gSM6yzKQGRaM27w==
X-CSE-MsgGUID: 5yFZMf2RQCWiageMbcnqtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="53384782"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2024 07:21:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sY4lj-000qr7-2I;
	Sun, 28 Jul 2024 14:21:03 +0000
Date: Sun, 28 Jul 2024 22:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: Samson Tam <Samson.Tam@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Martin Leung <martin.leung@amd.com>,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Subject: [agd5f:drm-next 162/190]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp_dscl.c:981:
 warning: Excess function parameter 'bs_coeffs_updated' description in
 'dpp401_dscl_program_isharp'
Message-ID: <202407282253.hdL8FEZ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   c9bfc37f085aa180b3c49b9c95756b9ef032243e
commit: f9e6759888866748f31b6b6c2142a481d587f51f [162/190] drm/amd/display: roll back quality EASF and ISHARP and dc dependency changes
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240728/202407282253.hdL8FEZ0-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407282253.hdL8FEZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407282253.hdL8FEZ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp_dscl.c:981: warning: Excess function parameter 'bs_coeffs_updated' description in 'dpp401_dscl_program_isharp'


vim +981 drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp_dscl.c

70839da6360500 Aurabindo Pillai     2024-04-19  631  
70839da6360500 Aurabindo Pillai     2024-04-19  632  /**
70839da6360500 Aurabindo Pillai     2024-04-19  633   * dpp401_dscl_set_recout - Set the first pixel of RECOUT in the OTG active area
70839da6360500 Aurabindo Pillai     2024-04-19  634   *
70839da6360500 Aurabindo Pillai     2024-04-19  635   * @dpp: DPP data struct
70839da6360500 Aurabindo Pillai     2024-04-19  636   * @recout: Rectangle information
70839da6360500 Aurabindo Pillai     2024-04-19  637   *
70839da6360500 Aurabindo Pillai     2024-04-19  638   * This function sets the MPC RECOUT_START and RECOUT_SIZE registers based on
70839da6360500 Aurabindo Pillai     2024-04-19  639   * the values specified in the recount parameter.
70839da6360500 Aurabindo Pillai     2024-04-19  640   *
70839da6360500 Aurabindo Pillai     2024-04-19  641   * Note: This function only have effect if AutoCal is disabled.
70839da6360500 Aurabindo Pillai     2024-04-19  642   */
70839da6360500 Aurabindo Pillai     2024-04-19  643  static void dpp401_dscl_set_recout(struct dcn401_dpp *dpp,
70839da6360500 Aurabindo Pillai     2024-04-19  644  				 const struct rect *recout)
70839da6360500 Aurabindo Pillai     2024-04-19  645  {
70839da6360500 Aurabindo Pillai     2024-04-19  646  	REG_SET_2(RECOUT_START, 0,
70839da6360500 Aurabindo Pillai     2024-04-19  647  		  /* First pixel of RECOUT in the active OTG area */
70839da6360500 Aurabindo Pillai     2024-04-19  648  		  RECOUT_START_X, recout->x,
70839da6360500 Aurabindo Pillai     2024-04-19  649  		  /* First line of RECOUT in the active OTG area */
70839da6360500 Aurabindo Pillai     2024-04-19  650  		  RECOUT_START_Y, recout->y);
70839da6360500 Aurabindo Pillai     2024-04-19  651  
70839da6360500 Aurabindo Pillai     2024-04-19  652  	REG_SET_2(RECOUT_SIZE, 0,
70839da6360500 Aurabindo Pillai     2024-04-19  653  		  /* Number of RECOUT horizontal pixels */
70839da6360500 Aurabindo Pillai     2024-04-19  654  		  RECOUT_WIDTH, recout->width,
70839da6360500 Aurabindo Pillai     2024-04-19  655  		  /* Number of RECOUT vertical lines */
70839da6360500 Aurabindo Pillai     2024-04-19  656  		  RECOUT_HEIGHT, recout->height);
70839da6360500 Aurabindo Pillai     2024-04-19  657  }
70839da6360500 Aurabindo Pillai     2024-04-19  658  /**
f9e67598888667 Samson Tam           2024-07-14  659   * dpp401_dscl_program_easf - Program EASF
70839da6360500 Aurabindo Pillai     2024-04-19  660   *
70839da6360500 Aurabindo Pillai     2024-04-19  661   * @dpp_base: High level DPP struct
70839da6360500 Aurabindo Pillai     2024-04-19  662   * @scl_data: scalaer_data info
70839da6360500 Aurabindo Pillai     2024-04-19  663   *
f9e67598888667 Samson Tam           2024-07-14  664   * This is the primary function to program EASF
70839da6360500 Aurabindo Pillai     2024-04-19  665   *
70839da6360500 Aurabindo Pillai     2024-04-19  666   */
f9e67598888667 Samson Tam           2024-07-14  667  static void dpp401_dscl_program_easf(struct dpp *dpp_base, const struct scaler_data *scl_data)
70839da6360500 Aurabindo Pillai     2024-04-19  668  {
70839da6360500 Aurabindo Pillai     2024-04-19  669  	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
70839da6360500 Aurabindo Pillai     2024-04-19  670  
70839da6360500 Aurabindo Pillai     2024-04-19  671  	PERF_TRACE();
f9e67598888667 Samson Tam           2024-07-14  672  	REG_UPDATE(DSCL_SC_MODE,
f9e67598888667 Samson Tam           2024-07-14  673  			SCL_SC_MATRIX_MODE, scl_data->dscl_prog_data.easf_matrix_mode);
f9e67598888667 Samson Tam           2024-07-14  674  	REG_UPDATE(DSCL_SC_MODE,
f9e67598888667 Samson Tam           2024-07-14  675  			SCL_SC_LTONL_EN, scl_data->dscl_prog_data.easf_ltonl_en);
7a1dd866c5ac7d Samson Tam           2024-04-24  676  	/* DSCL_EASF_V_MODE */
f9e67598888667 Samson Tam           2024-07-14  677  	REG_UPDATE(DSCL_EASF_V_MODE,
f9e67598888667 Samson Tam           2024-07-14  678  			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en);
f9e67598888667 Samson Tam           2024-07-14  679  	REG_UPDATE(DSCL_EASF_V_MODE,
f9e67598888667 Samson Tam           2024-07-14  680  			SCL_EASF_V_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_v_sharp_factor);
f9e67598888667 Samson Tam           2024-07-14  681  	REG_UPDATE(DSCL_EASF_V_MODE,
70839da6360500 Aurabindo Pillai     2024-04-19  682  			SCL_EASF_V_RINGEST_FORCE_EN, scl_data->dscl_prog_data.easf_v_ring);
f9e67598888667 Samson Tam           2024-07-14  683  	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  684  			SCL_EASF_V_BF1_EN, scl_data->dscl_prog_data.easf_v_bf1_en);
f9e67598888667 Samson Tam           2024-07-14  685  	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  686  			SCL_EASF_V_BF2_MODE, scl_data->dscl_prog_data.easf_v_bf2_mode);
f9e67598888667 Samson Tam           2024-07-14  687  	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  688  			SCL_EASF_V_BF3_MODE, scl_data->dscl_prog_data.easf_v_bf3_mode);
f9e67598888667 Samson Tam           2024-07-14  689  	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  690  			SCL_EASF_V_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat1_gain);
f9e67598888667 Samson Tam           2024-07-14  691  	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  692  			SCL_EASF_V_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat2_gain);
f9e67598888667 Samson Tam           2024-07-14  693  	REG_UPDATE(DSCL_EASF_V_BF_CNTL,
70839da6360500 Aurabindo Pillai     2024-04-19  694  			SCL_EASF_V_BF2_ROC_GAIN, scl_data->dscl_prog_data.easf_v_bf2_roc_gain);
f9e67598888667 Samson Tam           2024-07-14  695  	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL1,
f9e67598888667 Samson Tam           2024-07-14  696  		SCL_EASF_V_RINGEST_3TAP_DNTILT_UPTILT, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_uptilt);
f9e67598888667 Samson Tam           2024-07-14  697  	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL1,
70839da6360500 Aurabindo Pillai     2024-04-19  698  		SCL_EASF_V_RINGEST_3TAP_UPTILT_MAXVAL, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt_max);
f9e67598888667 Samson Tam           2024-07-14  699  	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL2,
f9e67598888667 Samson Tam           2024-07-14  700  		SCL_EASF_V_RINGEST_3TAP_DNTILT_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_slope);
f9e67598888667 Samson Tam           2024-07-14  701  	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL2,
70839da6360500 Aurabindo Pillai     2024-04-19  702  		SCL_EASF_V_RINGEST_3TAP_UPTILT1_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt1_slope);
f9e67598888667 Samson Tam           2024-07-14  703  	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL3,
f9e67598888667 Samson Tam           2024-07-14  704  		SCL_EASF_V_RINGEST_3TAP_UPTILT2_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_slope);
f9e67598888667 Samson Tam           2024-07-14  705  	REG_UPDATE(DSCL_EASF_V_RINGEST_3TAP_CNTL3,
70839da6360500 Aurabindo Pillai     2024-04-19  706  		SCL_EASF_V_RINGEST_3TAP_UPTILT2_OFFSET, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_offset);
f9e67598888667 Samson Tam           2024-07-14  707  	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE,
f9e67598888667 Samson Tam           2024-07-14  708  		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg1);
f9e67598888667 Samson Tam           2024-07-14  709  	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE,
70839da6360500 Aurabindo Pillai     2024-04-19  710  		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG2, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg2);
f9e67598888667 Samson Tam           2024-07-14  711  	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_GAIN,
f9e67598888667 Samson Tam           2024-07-14  712  		SCL_EASF_V_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain1);
f9e67598888667 Samson Tam           2024-07-14  713  	REG_UPDATE(DSCL_EASF_V_RINGEST_EVENTAP_GAIN,
70839da6360500 Aurabindo Pillai     2024-04-19  714  		SCL_EASF_V_RINGEST_EVENTAP_GAIN2, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain2);
f9e67598888667 Samson Tam           2024-07-14  715  	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
f9e67598888667 Samson Tam           2024-07-14  716  			SCL_EASF_V_BF_MAXA, scl_data->dscl_prog_data.easf_v_bf_maxa);
f9e67598888667 Samson Tam           2024-07-14  717  	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
f9e67598888667 Samson Tam           2024-07-14  718  			SCL_EASF_V_BF_MAXB, scl_data->dscl_prog_data.easf_v_bf_maxb);
f9e67598888667 Samson Tam           2024-07-14  719  	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
f9e67598888667 Samson Tam           2024-07-14  720  			SCL_EASF_V_BF_MINA, scl_data->dscl_prog_data.easf_v_bf_mina);
f9e67598888667 Samson Tam           2024-07-14  721  	REG_UPDATE(DSCL_EASF_V_BF_FINAL_MAX_MIN,
70839da6360500 Aurabindo Pillai     2024-04-19  722  			SCL_EASF_V_BF_MINB, scl_data->dscl_prog_data.easf_v_bf_minb);
f9e67598888667 Samson Tam           2024-07-14  723  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
f9e67598888667 Samson Tam           2024-07-14  724  			SCL_EASF_V_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg0);
f9e67598888667 Samson Tam           2024-07-14  725  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
f9e67598888667 Samson Tam           2024-07-14  726  			SCL_EASF_V_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg0);
f9e67598888667 Samson Tam           2024-07-14  727  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG0,
7a1dd866c5ac7d Samson Tam           2024-04-24  728  			SCL_EASF_V_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg0);
f9e67598888667 Samson Tam           2024-07-14  729  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
f9e67598888667 Samson Tam           2024-07-14  730  			SCL_EASF_V_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg1);
f9e67598888667 Samson Tam           2024-07-14  731  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
f9e67598888667 Samson Tam           2024-07-14  732  			SCL_EASF_V_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg1);
f9e67598888667 Samson Tam           2024-07-14  733  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG1,
7a1dd866c5ac7d Samson Tam           2024-04-24  734  			SCL_EASF_V_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg1);
f9e67598888667 Samson Tam           2024-07-14  735  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
f9e67598888667 Samson Tam           2024-07-14  736  			SCL_EASF_V_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg2);
f9e67598888667 Samson Tam           2024-07-14  737  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
f9e67598888667 Samson Tam           2024-07-14  738  			SCL_EASF_V_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg2);
f9e67598888667 Samson Tam           2024-07-14  739  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG2,
7a1dd866c5ac7d Samson Tam           2024-04-24  740  			SCL_EASF_V_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg2);
f9e67598888667 Samson Tam           2024-07-14  741  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
f9e67598888667 Samson Tam           2024-07-14  742  			SCL_EASF_V_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg3);
f9e67598888667 Samson Tam           2024-07-14  743  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
f9e67598888667 Samson Tam           2024-07-14  744  			SCL_EASF_V_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg3);
f9e67598888667 Samson Tam           2024-07-14  745  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG3,
7a1dd866c5ac7d Samson Tam           2024-04-24  746  			SCL_EASF_V_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg3);
f9e67598888667 Samson Tam           2024-07-14  747  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
f9e67598888667 Samson Tam           2024-07-14  748  			SCL_EASF_V_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg4);
f9e67598888667 Samson Tam           2024-07-14  749  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
f9e67598888667 Samson Tam           2024-07-14  750  			SCL_EASF_V_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg4);
f9e67598888667 Samson Tam           2024-07-14  751  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG4,
7a1dd866c5ac7d Samson Tam           2024-04-24  752  			SCL_EASF_V_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg4);
f9e67598888667 Samson Tam           2024-07-14  753  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
f9e67598888667 Samson Tam           2024-07-14  754  			SCL_EASF_V_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg5);
f9e67598888667 Samson Tam           2024-07-14  755  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
f9e67598888667 Samson Tam           2024-07-14  756  			SCL_EASF_V_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg5);
f9e67598888667 Samson Tam           2024-07-14  757  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG5,
7a1dd866c5ac7d Samson Tam           2024-04-24  758  			SCL_EASF_V_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg5);
f9e67598888667 Samson Tam           2024-07-14  759  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
f9e67598888667 Samson Tam           2024-07-14  760  			SCL_EASF_V_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg6);
f9e67598888667 Samson Tam           2024-07-14  761  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
f9e67598888667 Samson Tam           2024-07-14  762  			SCL_EASF_V_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg6);
f9e67598888667 Samson Tam           2024-07-14  763  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG6,
7a1dd866c5ac7d Samson Tam           2024-04-24  764  			SCL_EASF_V_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg6);
f9e67598888667 Samson Tam           2024-07-14  765  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG7,
f9e67598888667 Samson Tam           2024-07-14  766  			SCL_EASF_V_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg7);
f9e67598888667 Samson Tam           2024-07-14  767  	REG_UPDATE(DSCL_EASF_V_BF1_PWL_SEG7,
7a1dd866c5ac7d Samson Tam           2024-04-24  768  			SCL_EASF_V_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg7);
f9e67598888667 Samson Tam           2024-07-14  769  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
f9e67598888667 Samson Tam           2024-07-14  770  			SCL_EASF_V_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set0);
f9e67598888667 Samson Tam           2024-07-14  771  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
f9e67598888667 Samson Tam           2024-07-14  772  			SCL_EASF_V_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set0);
f9e67598888667 Samson Tam           2024-07-14  773  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG0,
7a1dd866c5ac7d Samson Tam           2024-04-24  774  			SCL_EASF_V_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set0);
f9e67598888667 Samson Tam           2024-07-14  775  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
f9e67598888667 Samson Tam           2024-07-14  776  			SCL_EASF_V_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set1);
f9e67598888667 Samson Tam           2024-07-14  777  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
f9e67598888667 Samson Tam           2024-07-14  778  			SCL_EASF_V_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set1);
f9e67598888667 Samson Tam           2024-07-14  779  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG1,
7a1dd866c5ac7d Samson Tam           2024-04-24  780  			SCL_EASF_V_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set1);
f9e67598888667 Samson Tam           2024-07-14  781  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
f9e67598888667 Samson Tam           2024-07-14  782  			SCL_EASF_V_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set2);
f9e67598888667 Samson Tam           2024-07-14  783  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
f9e67598888667 Samson Tam           2024-07-14  784  			SCL_EASF_V_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set2);
f9e67598888667 Samson Tam           2024-07-14  785  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG2,
7a1dd866c5ac7d Samson Tam           2024-04-24  786  			SCL_EASF_V_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set2);
f9e67598888667 Samson Tam           2024-07-14  787  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
f9e67598888667 Samson Tam           2024-07-14  788  			SCL_EASF_V_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set3);
f9e67598888667 Samson Tam           2024-07-14  789  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
f9e67598888667 Samson Tam           2024-07-14  790  			SCL_EASF_V_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set3);
f9e67598888667 Samson Tam           2024-07-14  791  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG3,
7a1dd866c5ac7d Samson Tam           2024-04-24  792  			SCL_EASF_V_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set3);
f9e67598888667 Samson Tam           2024-07-14  793  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
f9e67598888667 Samson Tam           2024-07-14  794  			SCL_EASF_V_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set4);
f9e67598888667 Samson Tam           2024-07-14  795  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
f9e67598888667 Samson Tam           2024-07-14  796  			SCL_EASF_V_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set4);
f9e67598888667 Samson Tam           2024-07-14  797  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG4,
7a1dd866c5ac7d Samson Tam           2024-04-24  798  			SCL_EASF_V_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set4);
f9e67598888667 Samson Tam           2024-07-14  799  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG5,
f9e67598888667 Samson Tam           2024-07-14  800  			SCL_EASF_V_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set5);
f9e67598888667 Samson Tam           2024-07-14  801  	REG_UPDATE(DSCL_EASF_V_BF3_PWL_SEG5,
7a1dd866c5ac7d Samson Tam           2024-04-24  802  			SCL_EASF_V_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set5);
7a1dd866c5ac7d Samson Tam           2024-04-24  803  	/* DSCL_EASF_H_MODE */
f9e67598888667 Samson Tam           2024-07-14  804  	REG_UPDATE(DSCL_EASF_H_MODE,
f9e67598888667 Samson Tam           2024-07-14  805  			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en);
f9e67598888667 Samson Tam           2024-07-14  806  	REG_UPDATE(DSCL_EASF_H_MODE,
f9e67598888667 Samson Tam           2024-07-14  807  			SCL_EASF_H_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_h_sharp_factor);
f9e67598888667 Samson Tam           2024-07-14  808  	REG_UPDATE(DSCL_EASF_H_MODE,
70839da6360500 Aurabindo Pillai     2024-04-19  809  			SCL_EASF_H_RINGEST_FORCE_EN, scl_data->dscl_prog_data.easf_h_ring);
f9e67598888667 Samson Tam           2024-07-14  810  	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  811  			SCL_EASF_H_BF1_EN, scl_data->dscl_prog_data.easf_h_bf1_en);
f9e67598888667 Samson Tam           2024-07-14  812  	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  813  			SCL_EASF_H_BF2_MODE, scl_data->dscl_prog_data.easf_h_bf2_mode);
f9e67598888667 Samson Tam           2024-07-14  814  	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  815  			SCL_EASF_H_BF3_MODE, scl_data->dscl_prog_data.easf_h_bf3_mode);
f9e67598888667 Samson Tam           2024-07-14  816  	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  817  			SCL_EASF_H_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat1_gain);
f9e67598888667 Samson Tam           2024-07-14  818  	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
f9e67598888667 Samson Tam           2024-07-14  819  			SCL_EASF_H_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat2_gain);
f9e67598888667 Samson Tam           2024-07-14  820  	REG_UPDATE(DSCL_EASF_H_BF_CNTL,
70839da6360500 Aurabindo Pillai     2024-04-19  821  			SCL_EASF_H_BF2_ROC_GAIN, scl_data->dscl_prog_data.easf_h_bf2_roc_gain);
f9e67598888667 Samson Tam           2024-07-14  822  	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE,
f9e67598888667 Samson Tam           2024-07-14  823  			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg1);
f9e67598888667 Samson Tam           2024-07-14  824  	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE,
70839da6360500 Aurabindo Pillai     2024-04-19  825  			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG2, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg2);
f9e67598888667 Samson Tam           2024-07-14  826  	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_GAIN,
f9e67598888667 Samson Tam           2024-07-14  827  			SCL_EASF_H_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain1);
f9e67598888667 Samson Tam           2024-07-14  828  	REG_UPDATE(DSCL_EASF_H_RINGEST_EVENTAP_GAIN,
70839da6360500 Aurabindo Pillai     2024-04-19  829  			SCL_EASF_H_RINGEST_EVENTAP_GAIN2, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain2);
f9e67598888667 Samson Tam           2024-07-14  830  	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
f9e67598888667 Samson Tam           2024-07-14  831  			SCL_EASF_H_BF_MAXA, scl_data->dscl_prog_data.easf_h_bf_maxa);
f9e67598888667 Samson Tam           2024-07-14  832  	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
f9e67598888667 Samson Tam           2024-07-14  833  			SCL_EASF_H_BF_MAXB, scl_data->dscl_prog_data.easf_h_bf_maxb);
f9e67598888667 Samson Tam           2024-07-14  834  	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
f9e67598888667 Samson Tam           2024-07-14  835  			SCL_EASF_H_BF_MINA, scl_data->dscl_prog_data.easf_h_bf_mina);
f9e67598888667 Samson Tam           2024-07-14  836  	REG_UPDATE(DSCL_EASF_H_BF_FINAL_MAX_MIN,
70839da6360500 Aurabindo Pillai     2024-04-19  837  			SCL_EASF_H_BF_MINB, scl_data->dscl_prog_data.easf_h_bf_minb);
f9e67598888667 Samson Tam           2024-07-14  838  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
f9e67598888667 Samson Tam           2024-07-14  839  			SCL_EASF_H_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg0);
f9e67598888667 Samson Tam           2024-07-14  840  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
f9e67598888667 Samson Tam           2024-07-14  841  			SCL_EASF_H_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg0);
f9e67598888667 Samson Tam           2024-07-14  842  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG0,
7a1dd866c5ac7d Samson Tam           2024-04-24  843  			SCL_EASF_H_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg0);
f9e67598888667 Samson Tam           2024-07-14  844  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
f9e67598888667 Samson Tam           2024-07-14  845  			SCL_EASF_H_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg1);
f9e67598888667 Samson Tam           2024-07-14  846  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
f9e67598888667 Samson Tam           2024-07-14  847  			SCL_EASF_H_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg1);
f9e67598888667 Samson Tam           2024-07-14  848  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG1,
7a1dd866c5ac7d Samson Tam           2024-04-24  849  			SCL_EASF_H_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg1);
f9e67598888667 Samson Tam           2024-07-14  850  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
f9e67598888667 Samson Tam           2024-07-14  851  			SCL_EASF_H_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg2);
f9e67598888667 Samson Tam           2024-07-14  852  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
f9e67598888667 Samson Tam           2024-07-14  853  			SCL_EASF_H_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg2);
f9e67598888667 Samson Tam           2024-07-14  854  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG2,
7a1dd866c5ac7d Samson Tam           2024-04-24  855  			SCL_EASF_H_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg2);
f9e67598888667 Samson Tam           2024-07-14  856  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
f9e67598888667 Samson Tam           2024-07-14  857  			SCL_EASF_H_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg3);
f9e67598888667 Samson Tam           2024-07-14  858  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
f9e67598888667 Samson Tam           2024-07-14  859  			SCL_EASF_H_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg3);
f9e67598888667 Samson Tam           2024-07-14  860  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG3,
7a1dd866c5ac7d Samson Tam           2024-04-24  861  			SCL_EASF_H_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg3);
f9e67598888667 Samson Tam           2024-07-14  862  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
f9e67598888667 Samson Tam           2024-07-14  863  			SCL_EASF_H_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg4);
f9e67598888667 Samson Tam           2024-07-14  864  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
f9e67598888667 Samson Tam           2024-07-14  865  			SCL_EASF_H_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg4);
f9e67598888667 Samson Tam           2024-07-14  866  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG4,
7a1dd866c5ac7d Samson Tam           2024-04-24  867  			SCL_EASF_H_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg4);
f9e67598888667 Samson Tam           2024-07-14  868  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
f9e67598888667 Samson Tam           2024-07-14  869  			SCL_EASF_H_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg5);
f9e67598888667 Samson Tam           2024-07-14  870  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
f9e67598888667 Samson Tam           2024-07-14  871  			SCL_EASF_H_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg5);
f9e67598888667 Samson Tam           2024-07-14  872  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG5,
7a1dd866c5ac7d Samson Tam           2024-04-24  873  			SCL_EASF_H_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg5);
f9e67598888667 Samson Tam           2024-07-14  874  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
f9e67598888667 Samson Tam           2024-07-14  875  			SCL_EASF_H_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg6);
f9e67598888667 Samson Tam           2024-07-14  876  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
f9e67598888667 Samson Tam           2024-07-14  877  			SCL_EASF_H_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg6);
f9e67598888667 Samson Tam           2024-07-14  878  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG6,
7a1dd866c5ac7d Samson Tam           2024-04-24  879  			SCL_EASF_H_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg6);
f9e67598888667 Samson Tam           2024-07-14  880  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG7,
f9e67598888667 Samson Tam           2024-07-14  881  			SCL_EASF_H_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg7);
f9e67598888667 Samson Tam           2024-07-14  882  	REG_UPDATE(DSCL_EASF_H_BF1_PWL_SEG7,
7a1dd866c5ac7d Samson Tam           2024-04-24  883  			SCL_EASF_H_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg7);
f9e67598888667 Samson Tam           2024-07-14  884  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
f9e67598888667 Samson Tam           2024-07-14  885  			SCL_EASF_H_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set0);
f9e67598888667 Samson Tam           2024-07-14  886  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
f9e67598888667 Samson Tam           2024-07-14  887  			SCL_EASF_H_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set0);
f9e67598888667 Samson Tam           2024-07-14  888  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG0,
7a1dd866c5ac7d Samson Tam           2024-04-24  889  			SCL_EASF_H_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set0);
f9e67598888667 Samson Tam           2024-07-14  890  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
f9e67598888667 Samson Tam           2024-07-14  891  			SCL_EASF_H_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set1);
f9e67598888667 Samson Tam           2024-07-14  892  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
f9e67598888667 Samson Tam           2024-07-14  893  			SCL_EASF_H_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set1);
f9e67598888667 Samson Tam           2024-07-14  894  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG1,
7a1dd866c5ac7d Samson Tam           2024-04-24  895  			SCL_EASF_H_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set1);
f9e67598888667 Samson Tam           2024-07-14  896  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
f9e67598888667 Samson Tam           2024-07-14  897  			SCL_EASF_H_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set2);
f9e67598888667 Samson Tam           2024-07-14  898  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
f9e67598888667 Samson Tam           2024-07-14  899  			SCL_EASF_H_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set2);
f9e67598888667 Samson Tam           2024-07-14  900  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG2,
7a1dd866c5ac7d Samson Tam           2024-04-24  901  			SCL_EASF_H_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set2);
f9e67598888667 Samson Tam           2024-07-14  902  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
f9e67598888667 Samson Tam           2024-07-14  903  			SCL_EASF_H_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set3);
f9e67598888667 Samson Tam           2024-07-14  904  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
f9e67598888667 Samson Tam           2024-07-14  905  			SCL_EASF_H_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set3);
f9e67598888667 Samson Tam           2024-07-14  906  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG3,
7a1dd866c5ac7d Samson Tam           2024-04-24  907  			SCL_EASF_H_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set3);
f9e67598888667 Samson Tam           2024-07-14  908  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
f9e67598888667 Samson Tam           2024-07-14  909  			SCL_EASF_H_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set4);
f9e67598888667 Samson Tam           2024-07-14  910  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
f9e67598888667 Samson Tam           2024-07-14  911  			SCL_EASF_H_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set4);
f9e67598888667 Samson Tam           2024-07-14  912  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG4,
7a1dd866c5ac7d Samson Tam           2024-04-24  913  			SCL_EASF_H_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set4);
f9e67598888667 Samson Tam           2024-07-14  914  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG5,
f9e67598888667 Samson Tam           2024-07-14  915  			SCL_EASF_H_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set5);
f9e67598888667 Samson Tam           2024-07-14  916  	REG_UPDATE(DSCL_EASF_H_BF3_PWL_SEG5,
7a1dd866c5ac7d Samson Tam           2024-04-24  917  			SCL_EASF_H_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set5);
7a1dd866c5ac7d Samson Tam           2024-04-24  918  	/* DSCL_EASF_SC_MATRIX_C0C1, DSCL_EASF_SC_MATRIX_C2C3 */
f9e67598888667 Samson Tam           2024-07-14  919  	REG_UPDATE(DSCL_SC_MATRIX_C0C1,
f9e67598888667 Samson Tam           2024-07-14  920  			SCL_SC_MATRIX_C0, scl_data->dscl_prog_data.easf_matrix_c0);
f9e67598888667 Samson Tam           2024-07-14  921  	REG_UPDATE(DSCL_SC_MATRIX_C0C1,
7a1dd866c5ac7d Samson Tam           2024-04-24  922  			SCL_SC_MATRIX_C1, scl_data->dscl_prog_data.easf_matrix_c1);
f9e67598888667 Samson Tam           2024-07-14  923  	REG_UPDATE(DSCL_SC_MATRIX_C2C3,
f9e67598888667 Samson Tam           2024-07-14  924  			SCL_SC_MATRIX_C2, scl_data->dscl_prog_data.easf_matrix_c2);
f9e67598888667 Samson Tam           2024-07-14  925  	REG_UPDATE(DSCL_SC_MATRIX_C2C3,
7a1dd866c5ac7d Samson Tam           2024-04-24  926  			SCL_SC_MATRIX_C3, scl_data->dscl_prog_data.easf_matrix_c3);
7a1dd866c5ac7d Samson Tam           2024-04-24  927  	PERF_TRACE();
7a1dd866c5ac7d Samson Tam           2024-04-24  928  }
7a1dd866c5ac7d Samson Tam           2024-04-24  929  /**
7a1dd866c5ac7d Samson Tam           2024-04-24  930   * dpp401_dscl_disable_easf - Disable EASF when no scaling (1:1)
7a1dd866c5ac7d Samson Tam           2024-04-24  931   *
7a1dd866c5ac7d Samson Tam           2024-04-24  932   * @dpp_base: High level DPP struct
7a1dd866c5ac7d Samson Tam           2024-04-24  933   * @scl_data: scalaer_data info
7a1dd866c5ac7d Samson Tam           2024-04-24  934   *
7a1dd866c5ac7d Samson Tam           2024-04-24  935   * When we have 1:1 scaling, we need to disable EASF
7a1dd866c5ac7d Samson Tam           2024-04-24  936   *
7a1dd866c5ac7d Samson Tam           2024-04-24  937   */
7a1dd866c5ac7d Samson Tam           2024-04-24  938  static void dpp401_dscl_disable_easf(struct dpp *dpp_base, const struct scaler_data *scl_data)
7a1dd866c5ac7d Samson Tam           2024-04-24  939  {
7a1dd866c5ac7d Samson Tam           2024-04-24  940  	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
7a1dd866c5ac7d Samson Tam           2024-04-24  941  
7a1dd866c5ac7d Samson Tam           2024-04-24  942  	PERF_TRACE();
7a1dd866c5ac7d Samson Tam           2024-04-24  943  	/* DSCL_EASF_V_MODE */
7a1dd866c5ac7d Samson Tam           2024-04-24  944  	REG_UPDATE(DSCL_EASF_V_MODE,
7a1dd866c5ac7d Samson Tam           2024-04-24  945  			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en);
7a1dd866c5ac7d Samson Tam           2024-04-24  946  	/* DSCL_EASF_H_MODE */
7a1dd866c5ac7d Samson Tam           2024-04-24  947  	REG_UPDATE(DSCL_EASF_H_MODE,
7a1dd866c5ac7d Samson Tam           2024-04-24  948  			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en);
70839da6360500 Aurabindo Pillai     2024-04-19  949  	PERF_TRACE();
70839da6360500 Aurabindo Pillai     2024-04-19  950  }
70839da6360500 Aurabindo Pillai     2024-04-19  951  static void dpp401_dscl_set_isharp_filter(
70839da6360500 Aurabindo Pillai     2024-04-19  952  	struct dcn401_dpp *dpp, const uint32_t *filter)
70839da6360500 Aurabindo Pillai     2024-04-19  953  {
70839da6360500 Aurabindo Pillai     2024-04-19  954  	int level;
70839da6360500 Aurabindo Pillai     2024-04-19  955  	uint32_t filter_data;
2998bccfa4197f Samson Tam           2024-04-26  956  	if (filter == NULL)
2998bccfa4197f Samson Tam           2024-04-26  957  		return;
2998bccfa4197f Samson Tam           2024-04-26  958  
70839da6360500 Aurabindo Pillai     2024-04-19  959  	REG_UPDATE(ISHARP_DELTA_CTRL,
70839da6360500 Aurabindo Pillai     2024-04-19  960  		ISHARP_DELTA_LUT_HOST_SELECT, 0);
70839da6360500 Aurabindo Pillai     2024-04-19  961  	for (level = 0; level < NUM_LEVELS; level++)	{
70839da6360500 Aurabindo Pillai     2024-04-19  962  		filter_data = filter[level];
f9e67598888667 Samson Tam           2024-07-14  963  		REG_SET(ISHARP_DELTA_INDEX, 0,
f9e67598888667 Samson Tam           2024-07-14  964  				ISHARP_DELTA_INDEX, level);
70839da6360500 Aurabindo Pillai     2024-04-19  965  		REG_SET(ISHARP_DELTA_DATA, 0,
70839da6360500 Aurabindo Pillai     2024-04-19  966  				ISHARP_DELTA_DATA, filter_data);
70839da6360500 Aurabindo Pillai     2024-04-19  967  	}
70839da6360500 Aurabindo Pillai     2024-04-19  968  } // dpp401_dscl_set_isharp_filter
70839da6360500 Aurabindo Pillai     2024-04-19  969  /**
70839da6360500 Aurabindo Pillai     2024-04-19  970   * dpp401_dscl_program_isharp - Program isharp
70839da6360500 Aurabindo Pillai     2024-04-19  971   *
70839da6360500 Aurabindo Pillai     2024-04-19  972   * @dpp_base: High level DPP struct
70839da6360500 Aurabindo Pillai     2024-04-19  973   * @scl_data: scalaer_data info
0352e39e7e781f Srinivasan Shanmugam 2024-07-22  974   * @bs_coeffs_updated: coeffs update flag
70839da6360500 Aurabindo Pillai     2024-04-19  975   *
70839da6360500 Aurabindo Pillai     2024-04-19  976   * This is the primary function to program isharp
70839da6360500 Aurabindo Pillai     2024-04-19  977   *
70839da6360500 Aurabindo Pillai     2024-04-19  978   */
70839da6360500 Aurabindo Pillai     2024-04-19  979  static void dpp401_dscl_program_isharp(struct dpp *dpp_base,
f9e67598888667 Samson Tam           2024-07-14  980  		const struct scaler_data *scl_data)
70839da6360500 Aurabindo Pillai     2024-04-19 @981  {

:::::: The code at line 981 was first introduced by commit
:::::: 70839da6360500a82e4d5f78499284474cbed7c1 drm/amd/display: Add new DCN401 sources

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
