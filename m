Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7693EBF1B;
	Sun, 22 Feb 2026 01:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771723956; cv=none; b=P7oDFwio7O+m7u78wsM1X+X9A4JjTpi4+rSvTEeNUtPDlRcCEXWO/JOBiTcUBZfnXHMoIFSshRF7Zpp4XK+cTnYq4pbGlBr/KxN/DSHo0RNjjeFwqrhTKQ1LCQoZBv2Iou+NvgEWQODH8DO7BP8aj6JVDUoKs/PL/W29XPh9S4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771723956; c=relaxed/simple;
	bh=UMNWWmO9D8kkiPDFflHPNwSITBCK2gfU+KYNvblhz6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qM+cBLYcArn5L8u5PaT0jg/9IJgCkEKWXgqWUnTAvggIBxaZbJLnkB66xhx7XadE99LzvlglsmA1nikFxcT57Rq+aFkXImMyvZNVOGB7Y8Kam2XOXRc0xLGfupnKntTqq4TxaycgRJ8qDb7bC5PB+2zdsPxjFxSH0Bh1uJ/1RhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPC0lTNj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPC0lTNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771723953; x=1803259953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UMNWWmO9D8kkiPDFflHPNwSITBCK2gfU+KYNvblhz6k=;
  b=LPC0lTNjVVvsbPM3NZpYQNTWB3vyWW8ZbGEVUVTg+Ex10XpVHKf9lBCg
   c3isAyntpoivEvvcNAXpK9m/o5g52ulRgc+1uMcX812dHqft/JUBNE1mW
   FTjz5smMcCb7vaX/cYNfTT3N3udMxyrpThlmiYPPJDEsRiSQyCNV/0gtq
   wOBWbsD3yRMeOehF5MEi5aERCqmQ+GyVaH4Q+/LZPUQIRSUF9Kgqrl37W
   gCX+KxokulmRCSLcId5xnN3ndwJ8ZdureNmcERSryz26PsCm2KSMBZ3lV
   4AiYorTYZxab7FDEY99XDTCN+gjyP6UtqzaOSFAdz9sEZN9f794zEMBzj
   g==;
X-CSE-ConnectionGUID: gnKG238xTii8FBmR4lfIxQ==
X-CSE-MsgGUID: OzJlmjVrSzOm03amqkfftA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="84126461"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="84126461"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 17:32:33 -0800
X-CSE-ConnectionGUID: cEYGtZoQRZCqkcLdRr5W/A==
X-CSE-MsgGUID: /iycV2yyQmmSDgu1elp/kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="214171076"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2026 17:32:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtyKf-000000015HY-3QBK;
	Sun, 22 Feb 2026 01:32:25 +0000
Date: Sun, 22 Feb 2026 09:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <someguy@effective-light.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Hung <alex.hung@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Wayne Lin <Wayne.Lin@amd.com>,
	Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Dominik Kaszewski <dominik.kaszewski@amd.com>,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] drm/amd/display: add vendor specific reset
Message-ID: <202602220950.2iCpIKFc-lkp@intel.com>
References: <20260220171518.711594-2-someguy@effective-light.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220171518.711594-2-someguy@effective-light.com>

Hi Hamza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hamza-Mahfooz/drm-amd-display-add-vendor-specific-reset/20260221-011745
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260220171518.711594-2-someguy%40effective-light.com
patch subject: [PATCH v4 2/2] drm/amd/display: add vendor specific reset
config: x86_64-randconfig-072-20260221 (https://download.01.org/0day-ci/archive/20260222/202602220950.2iCpIKFc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602220950.2iCpIKFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602220950.2iCpIKFc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11143:8: warning: variable 'acrtc' is uninitialized when used here [-Wuninitialized]
    11143 |                         if (acrtc->event) {
          |                             ^~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:10875:27: note: initialize the variable 'acrtc' to silence this warning
    10875 |         struct amdgpu_crtc *acrtc;
          |                                  ^
          |                                   = NULL
   1 warning generated.


vim +/acrtc +11143 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

 11021	
 11022			if (new_crtc_state->active &&
 11023			    (!old_crtc_state->active ||
 11024			     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
 11025				dc_stream_retain(dm_new_crtc_state->stream);
 11026				acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
 11027				manage_dm_interrupts(adev, acrtc, dm_new_crtc_state);
 11028			}
 11029			/* Handle vrr on->off / off->on transitions */
 11030			amdgpu_dm_handle_vrr_transition(dm_old_crtc_state, dm_new_crtc_state);
 11031	
 11032	#ifdef CONFIG_DEBUG_FS
 11033			if (new_crtc_state->active &&
 11034			    (!old_crtc_state->active ||
 11035			     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
 11036				/**
 11037				 * Frontend may have changed so reapply the CRC capture
 11038				 * settings for the stream.
 11039				 */
 11040				if (amdgpu_dm_is_valid_crc_source(cur_crc_src)) {
 11041	#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 11042					if (amdgpu_dm_crc_window_is_activated(crtc)) {
 11043						uint8_t cnt;
 11044	
 11045						spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 11046						for (cnt = 0; cnt < MAX_CRC_WINDOW_NUM; cnt++) {
 11047							if (acrtc->dm_irq_params.window_param[cnt].enable) {
 11048								acrtc->dm_irq_params.window_param[cnt].update_win = true;
 11049	
 11050								/**
 11051								 * It takes 2 frames for HW to stably generate CRC when
 11052								 * resuming from suspend, so we set skip_frame_cnt 2.
 11053								 */
 11054								acrtc->dm_irq_params.window_param[cnt].skip_frame_cnt = 2;
 11055							}
 11056						}
 11057						spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 11058					}
 11059	#endif
 11060					if (amdgpu_dm_crtc_configure_crc_source(
 11061						crtc, dm_new_crtc_state, cur_crc_src))
 11062						drm_dbg_atomic(dev, "Failed to configure crc source");
 11063				}
 11064			}
 11065	#endif
 11066		}
 11067	
 11068		for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
 11069			if (new_crtc_state->async_flip)
 11070				wait_for_vblank = false;
 11071	
 11072		/* update planes when needed per crtc*/
 11073		for_each_new_crtc_in_state(state, crtc, new_crtc_state, j) {
 11074			dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
 11075	
 11076			if (dm_new_crtc_state->stream)
 11077				amdgpu_dm_commit_planes(state, dev, dm, crtc, wait_for_vblank);
 11078		}
 11079	
 11080		/* Enable writeback */
 11081		for_each_new_connector_in_state(state, connector, new_con_state, i) {
 11082			struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
 11083			struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
 11084	
 11085			if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 11086				continue;
 11087	
 11088			if (!new_con_state->writeback_job)
 11089				continue;
 11090	
 11091			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
 11092	
 11093			if (!new_crtc_state)
 11094				continue;
 11095	
 11096			if (acrtc->wb_enabled)
 11097				continue;
 11098	
 11099			dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
 11100	
 11101			dm_set_writeback(dm, dm_new_crtc_state, connector, new_con_state);
 11102			acrtc->wb_enabled = true;
 11103		}
 11104	
 11105		/* Update audio instances for each connector. */
 11106		amdgpu_dm_commit_audio(dev, state);
 11107	
 11108		/* restore the backlight level */
 11109		for (i = 0; i < dm->num_of_edps; i++) {
 11110			if (dm->backlight_dev[i] &&
 11111			    (dm->actual_brightness[i] != dm->brightness[i]))
 11112				amdgpu_dm_backlight_set_level(dm, i, dm->brightness[i]);
 11113		}
 11114	
 11115		/*
 11116		 * send vblank event on all events not handled in flip and
 11117		 * mark consumed event for drm_atomic_helper_commit_hw_done
 11118		 */
 11119		spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 11120		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 11121	
 11122			if (new_crtc_state->event)
 11123				drm_send_event_locked(dev, &new_crtc_state->event->base);
 11124	
 11125			new_crtc_state->event = NULL;
 11126		}
 11127		spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 11128	
 11129		/* Signal HW programming completion */
 11130		drm_atomic_helper_commit_hw_done(state);
 11131	
 11132		if (wait_for_vblank &&
 11133		    drm_atomic_helper_wait_for_flip_done(dev, state)) {
 11134			mutex_lock(&dm->dc_lock);
 11135			if (dm_dmub_hw_init(adev))
 11136				drm_dev_wedged_event(dev, DRM_WEDGE_RECOVERY_REBIND |
 11137						     DRM_WEDGE_RECOVERY_BUS_RESET,
 11138						     NULL);
 11139			mutex_unlock(&dm->dc_lock);
 11140	
 11141			spin_lock_irqsave(&dev->event_lock, flags);
 11142			drm_for_each_crtc(crtc, dev) {
 11143				if (acrtc->event) {
 11144					drm_crtc_send_vblank_event(crtc, acrtc->event);
 11145					acrtc->event = NULL;
 11146					drm_crtc_vblank_put(crtc);
 11147					acrtc->pflip_status = AMDGPU_FLIP_NONE;
 11148				}
 11149			}
 11150			spin_unlock_irqrestore(&dev->event_lock, flags);
 11151		}
 11152	
 11153		drm_atomic_helper_cleanup_planes(dev, state);
 11154	
 11155		/* Don't free the memory if we are hitting this as part of suspend.
 11156		 * This way we don't free any memory during suspend; see
 11157		 * amdgpu_bo_free_kernel().  The memory will be freed in the first
 11158		 * non-suspend modeset or when the driver is torn down.
 11159		 */
 11160		if (!adev->in_suspend) {
 11161			/* return the stolen vga memory back to VRAM */
 11162			if (!adev->mman.keep_stolen_vga_memory)
 11163				amdgpu_bo_free_kernel(&adev->mman.stolen_vga_memory, NULL, NULL);
 11164			amdgpu_bo_free_kernel(&adev->mman.stolen_extended_memory, NULL, NULL);
 11165		}
 11166	
 11167		/*
 11168		 * Finally, drop a runtime PM reference for each newly disabled CRTC,
 11169		 * so we can put the GPU into runtime suspend if we're not driving any
 11170		 * displays anymore
 11171		 */
 11172		for (i = 0; i < crtc_disable_count; i++)
 11173			pm_runtime_put_autosuspend(dev->dev);
 11174		pm_runtime_mark_last_busy(dev->dev);
 11175	
 11176		trace_amdgpu_dm_atomic_commit_tail_finish(state);
 11177	}
 11178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
