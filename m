Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1DA748E;
	Thu, 13 Jun 2024 03:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718249013; cv=none; b=YvVykup9Y0Rfq+sk6pzjkxhnvnZhJ9Odbddd2VA88sxXD4/dJ8WgozsjFsU2us8ne8n98+EaOhWwj6XPnSVqQ40CV3vO9SrdzSRTW8/i1LrgOVusox31PZIei13k7yCSsW1Fx/aE6FSN5CBmeLtX9c2c9ax8k5Cs0azaFkp/34M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718249013; c=relaxed/simple;
	bh=/cvJyVF2OmyG9TelXEntHOF7zEqgXUn1C33Ne6L++1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIaokNh396/y1KbhDJSNsHJ21zjYB1+D+7RCrtFN+vhDpB8ETl3EUI7FvwLhh/cAICYxHnKSCkRkYHE3w6J98754H+5eLS5cvSoTjo3IaVWT9VorYLo7RioZhyQ8RhIAs+DP1h5UkOUPCEtoMX3TF32vRpELTqtEieZ+CHt3/pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSCRnVfF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSCRnVfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718249011; x=1749785011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/cvJyVF2OmyG9TelXEntHOF7zEqgXUn1C33Ne6L++1E=;
  b=JSCRnVfFJ4gEQiwNB2FAJCeOTOnTekr/cj2oVS+1DC6Id+jKdgHwsm68
   +UTIYht18uq6ro+dKZ/q1yw/hPzGquDpC2ZXz63K5pFf60Ho81RobIKLA
   IVT45aWbENQfgoRFG+8edOWYJN2QAhqiP93IoRPqV1ygxxVLVyN71KyRq
   vbWNHtMGdA5j2N+qqKqz8PkjhGVqoyfMFwIY00Qq+zEQOVc+W/QHReFkn
   9aKGPEHr869lI81oTKQvWwpP7U8x2p548kZ+Ozh+k8pfMdENgvOMPnO57
   +O9UeSv/UTeCCe/okAA0DaNuJDlJL9ZNG6wSqNTRi2UvEwqlsrkFrqvwX
   g==;
X-CSE-ConnectionGUID: tQ0hDYbdReOjLqKnMFc7Ug==
X-CSE-MsgGUID: JSQiLK72Rua+MbjTPk1atQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14881072"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14881072"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:23:30 -0700
X-CSE-ConnectionGUID: 91P0hGKwSkSpUFzUUA1GLg==
X-CSE-MsgGUID: VUxBOyYSRM2jnMENFhNABQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="77450302"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2024 20:23:29 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHb3e-0002Ae-2g;
	Thu, 13 Jun 2024 03:23:26 +0000
Date: Thu, 13 Jun 2024 11:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Simei Su <simei.su@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Subject: [tnguy-next-queue:dev-queue 49/85]
 drivers/net/ethernet/intel/ice/ice_virtchnl.c:3851:19: error: call to
 undeclared function 'ice_ptp_read_src_clk_reg'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202406131123.jE3mwlmL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   9af9f19ba76127f423f1b2cbe41b3cc098f0f5d4
commit: f3b2d0b0778285c46d451413fb4d5e67b85ee8fd [49/85] ice: support Rx timestamp on flex descriptor
config: x86_64-randconfig-071-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131123.jE3mwlmL-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131123.jE3mwlmL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131123.jE3mwlmL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_virtchnl.c:3851:19: error: call to undeclared function 'ice_ptp_read_src_clk_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3851 |         phc_time->time = ice_ptp_read_src_clk_reg(pf, NULL);
         |                          ^
   1 error generated.


vim +/ice_ptp_read_src_clk_reg +3851 drivers/net/ethernet/intel/ice/ice_virtchnl.c

  3829	
  3830	static int ice_vc_get_phc_time(struct ice_vf *vf)
  3831	{
  3832		enum virtchnl_status_code v_ret = VIRTCHNL_STATUS_SUCCESS;
  3833		struct virtchnl_phc_time *phc_time = NULL;
  3834		struct ice_pf *pf = vf->pf;
  3835		int len = 0;
  3836		int ret;
  3837	
  3838		if (!test_bit(ICE_VF_STATE_ACTIVE, vf->vf_states)) {
  3839			v_ret = VIRTCHNL_STATUS_ERR_PARAM;
  3840			goto err;
  3841		}
  3842	
  3843		len = sizeof(struct virtchnl_phc_time);
  3844		phc_time = kzalloc(len, GFP_KERNEL);
  3845		if (!phc_time) {
  3846			v_ret = VIRTCHNL_STATUS_ERR_NO_MEMORY;
  3847			len = 0;
  3848			goto err;
  3849		}
  3850	
> 3851		phc_time->time = ice_ptp_read_src_clk_reg(pf, NULL);
  3852	
  3853	err:
  3854		/* send the response back to the VF */
  3855		ret = ice_vc_send_msg_to_vf(vf, VIRTCHNL_OP_1588_PTP_GET_TIME,
  3856					    v_ret, (u8 *)phc_time, len);
  3857		kfree(phc_time);
  3858		return ret;
  3859	}
  3860	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
