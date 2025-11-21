Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7462BEFF1;
	Fri, 21 Nov 2025 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763740146; cv=none; b=AbUZJso5uBGM2puuBbuNGYGhIjn98dD9I9+MgnFJ2QPnKSbyWqk0McLh4Knr80ZrrqikngYfMJRFAKgoE4CUgHwqemPIQD8Q8twiK0hiTWUB/VIhJyo8NmndER1kMRiewEK3ky+P6zIhSBNNt0FPxQRc14EkoatHjdHFr88I/e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763740146; c=relaxed/simple;
	bh=I+eZM8y4822ZhQguud4i5d0RspiKKU1aFhvwdNevmxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JFUdlmvP4llTdI4e3U+IyhvnBLX+BmXJK+tL8rHbuO7CqRRXmAWX7l90dBBo6YQBzGnwViPxwLoX1wbkvG09W5LkGCTMKYIJRAaIk4K61pEdjeLrP/nigm1jxIONI8QzKAIforLIu/WXKLx+5bbdqV40+xFwo4N/8uy+TiM9ucw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJqb0F6Q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJqb0F6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763740144; x=1795276144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+eZM8y4822ZhQguud4i5d0RspiKKU1aFhvwdNevmxw=;
  b=nJqb0F6QwGH9O/wb+5ywpP7gxSb559FXg/QfhPIysG/YUTgt8X6p+pDF
   IiXVsMaOxO0Ivu0PmBZ3bKyzl097cXUEwY1OHGgBCRUL4UnEVVuMLs1IJ
   K0yeLVCVYmG832YgF+ckozZSiKgyf+xO1ajaxuk1yHPA8OrBf9agwY57A
   5JkLClF4ZH2zOnh81Ywr3u7vnDJGSJG/6MxxbMb5Eqr9coKMArztQWb0u
   ItZc2lGsODOZRzCUUi4EMgaW7Wr9nqIgJDs9ztgRprb3Gb8PKfiQHzlhq
   2beZsaHZ37B4V2Sm+DqO/DYzxcnAUikFvZAu4gJeP5EFvnR7wRAJukJxS
   g==;
X-CSE-ConnectionGUID: ss9mA8BoS46FdGGktqlceQ==
X-CSE-MsgGUID: 7vyvmEbTTI+s+5KYm+GXMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69702099"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="69702099"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 07:49:03 -0800
X-CSE-ConnectionGUID: os19VIQmS+WQt9HVXi79qQ==
X-CSE-MsgGUID: lfxCkzQeT+eS4DRpKuSLHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191022926"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2025 07:49:02 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMTNa-0006YF-2B;
	Fri, 21 Nov 2025 15:48:58 +0000
Date: Fri, 21 Nov 2025 23:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [linusw-nomadik:b4/mcde-drm-regression-thirdfix 4/4]
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:552:34: error: use of
 undeclared identifier 'state'
Message-ID: <202511212319.aUKKl3Vq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/mcde-drm-regression-thirdfix
head:   3e64b03a4bf2f67f43046af7e41c197df9fd6efb
commit: 3e64b03a4bf2f67f43046af7e41c197df9fd6efb [4/4] RFT: drm/rcar-du: Modify custom commit tail
config: arm-randconfig-003-20251121 (https://download.01.org/0day-ci/archive/20251121/202511212319.aUKKl3Vq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212319.aUKKl3Vq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511212319.aUKKl3Vq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:552:34: error: use of undeclared identifier 'state'
     552 |         drm_encoder_bridge_disable(dev, state);
         |                                         ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:553:39: error: use of undeclared identifier 'state'
     553 |         drm_encoder_bridge_post_disable(dev, state);
         |                                              ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:554:24: error: use of undeclared identifier 'state'
     554 |         drm_crtc_disable(dev, state);
         |                               ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:555:53: error: use of undeclared identifier 'state'
     555 |         drm_atomic_helper_update_legacy_modeset_state(dev, state);
         |                                                            ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:556:48: error: use of undeclared identifier 'state'
     556 |         drm_atomic_helper_calc_timestamping_constants(state);
         |                                                       ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:557:25: error: use of undeclared identifier 'state'
     557 |         drm_crtc_set_mode(dev, state);
         |                                ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:563:23: error: use of undeclared identifier 'state'
     563 |         drm_crtc_enable(dev, state);
         |                              ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:564:37: error: use of undeclared identifier 'state'
     564 |         drm_encoder_bridge_pre_enable(dev, state);
         |                                            ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:565:33: error: use of undeclared identifier 'state'
     565 |         drm_encoder_bridge_enable(dev, state);
         |                                        ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:566:43: error: use of undeclared identifier 'state'
     566 |         drm_atomic_helper_commit_writebacks(dev, state);
         |                                                  ^~~~~
   10 errors generated.


vim +/state +552 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c

   516	
   517	static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
   518	{
   519		struct drm_device *dev = old_state->dev;
   520		struct rcar_du_device *rcdu = to_rcar_du_device(dev);
   521		struct drm_crtc_state *crtc_state;
   522		struct drm_crtc *crtc;
   523		unsigned int i;
   524	
   525		/*
   526		 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
   527		 * when starting the CRTCs.
   528		 */
   529		rcdu->dpad1_source = -1;
   530	
   531		for_each_new_crtc_in_state(old_state, crtc, crtc_state, i) {
   532			struct rcar_du_crtc_state *rcrtc_state =
   533				to_rcar_crtc_state(crtc_state);
   534			struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
   535	
   536			if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD0))
   537				rcdu->dpad0_source = rcrtc->index;
   538	
   539			if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
   540				rcdu->dpad1_source = rcrtc->index;
   541		}
   542	
   543		/*
   544		 * Apply the atomic update.
   545		 *
   546		 * We need special ordering to make sure the CRTC disabled last
   547		 * and enabled first. We do this with modified versions of the
   548		 * common modeset_disables/enables functions.
   549		 */
   550	
   551		/* Variant of drm_atomic_helper_commit_modeset_disables() */
 > 552		drm_encoder_bridge_disable(dev, state);
   553		drm_encoder_bridge_post_disable(dev, state);
   554		drm_crtc_disable(dev, state);
   555		drm_atomic_helper_update_legacy_modeset_state(dev, state);
   556		drm_atomic_helper_calc_timestamping_constants(state);
   557		drm_crtc_set_mode(dev, state);
   558	
   559		drm_atomic_helper_commit_planes(dev, old_state,
   560						DRM_PLANE_COMMIT_ACTIVE_ONLY);
   561	
   562		/* Variant of drm_atomic_helper_commit_modeset_enables() */
   563		drm_crtc_enable(dev, state);
   564		drm_encoder_bridge_pre_enable(dev, state);
   565		drm_encoder_bridge_enable(dev, state);
   566		drm_atomic_helper_commit_writebacks(dev, state);
   567	
   568		drm_atomic_helper_commit_hw_done(old_state);
   569		drm_atomic_helper_wait_for_flip_done(dev, old_state);
   570	
   571		drm_atomic_helper_cleanup_planes(dev, old_state);
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
