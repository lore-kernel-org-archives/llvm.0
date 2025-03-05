Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03494252903;
	Wed,  5 Mar 2025 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201802; cv=none; b=E00Kdkt2pmEygumyBH/sdQB4Mf7LneBwWAUYVGBSP3wLESRgp3viVM+MK5UVsmllPkSHPTUTtHsM39K8MrC1iS22DFfQp4KKU1f7wU0jycPPEaDvehcCjaKO9ET90FjjcdhOt8RFZjG0O7J8OtUv+pCecQiX/tBEMEjMwNEqJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201802; c=relaxed/simple;
	bh=VekNt6JrT6vFVon+D9gX3GKMMPt3To8/2oCXdhpGF+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpGNdL7unq38jJt8I5b6AeWsLNeJIIJIekvVIOUoVgYdGNRj5Ra/8LgkD0p3Bhn6yKcApPyk12uY1z+JvR3hRYRqeSXuAqRC1y1CJ2evhCpHZyoEdR267XumoZ4fEbKRa/K30D2BWxsU+AMuMzic0Sbhz5kQ6Wh5CfI9JXQNhyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BK4rGycB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BK4rGycB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741201800; x=1772737800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VekNt6JrT6vFVon+D9gX3GKMMPt3To8/2oCXdhpGF+s=;
  b=BK4rGycBu4m/32hYHzgH7RuCH9vLj5r/ei9SaKJhwkTA0HwDbd7mD3Z5
   ms0zKyz7e4l/Jm+4uHPRbbOAnbo8d1aTHwVFuKk87fnOqUPrOamfAfofM
   EWh2cdV+h65cHA/QWqYPCd+Y0ZHrZ4hT6xtrp2gUx44dFF6XRUsT5+/xZ
   AiMACH8t4Qkpkb0hcWOk7PX24JH+7M262LvB+qvK8ibkwUaiRwEeAGjpw
   WBTZbeQcuZ4W7VETsTdq7CTZCxjd2QnaP/gukBJsZ7XV84mp40Vl/R67n
   YBaFzQTXuo1Cw0xzQtHmQAXdIJPwY3Xx+xMN1vxCiNB9MaiIU0PoKwVqs
   Q==;
X-CSE-ConnectionGUID: gPb9zZAuRvu25Qa6XBY22g==
X-CSE-MsgGUID: lRZa8UG3QWeSx2d7bYJfKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64628581"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="64628581"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 11:09:59 -0800
X-CSE-ConnectionGUID: jBAszFV4SUuDCf+dMaff9A==
X-CSE-MsgGUID: nyaRXvvZTJ65++Dubmgtpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="142013996"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2025 11:09:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpu7u-000M4s-1k;
	Wed, 05 Mar 2025 19:09:54 +0000
Date: Thu, 6 Mar 2025 03:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	ian.forbes@broadcom.com, martin.krastev@broadcom.com,
	maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH] drm/vmwgfx: Make sure the dirty tracker is released on
 surfaces
Message-ID: <202503060223.BrfYSoFw-lkp@intel.com>
References: <20250304184942.2127704-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304184942.2127704-1-zack.rusin@broadcom.com>

Hi Zack,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-vmwgfx-Make-sure-the-dirty-tracker-is-released-on-surfaces/20250305-025105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250304184942.2127704-1-zack.rusin%40broadcom.com
patch subject: [PATCH] drm/vmwgfx: Make sure the dirty tracker is released on surfaces
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250306/202503060223.BrfYSoFw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060223.BrfYSoFw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060223.BrfYSoFw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:1236:18: error: incomplete definition of type 'struct vmw_res_func'
    1236 |                         surf->res.func->dirty_free(&surf->res);
         |                         ~~~~~~~~~~~~~~^
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:120:8: note: forward declaration of 'struct vmw_res_func'
     120 | struct vmw_res_func;
         |        ^
   1 error generated.


vim +1236 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c

  1196	
  1197	
  1198	/**
  1199	 * vmw_du_connector_destroy_state - destroy connector state
  1200	 * @connector: DRM connector
  1201	 * @state: state object to destroy
  1202	 *
  1203	 * Destroys the connector state (both common and vmw-specific) for the
  1204	 * specified plane.
  1205	 */
  1206	void
  1207	vmw_du_connector_destroy_state(struct drm_connector *connector,
  1208				  struct drm_connector_state *state)
  1209	{
  1210		drm_atomic_helper_connector_destroy_state(connector, state);
  1211	}
  1212	/*
  1213	 * Generic framebuffer code
  1214	 */
  1215	
  1216	/*
  1217	 * Surface framebuffer code
  1218	 */
  1219	
  1220	static void vmw_framebuffer_surface_destroy(struct drm_framebuffer *framebuffer)
  1221	{
  1222		struct vmw_framebuffer_surface *vfbs =
  1223			vmw_framebuffer_to_vfbs(framebuffer);
  1224		struct vmw_bo *bo = vmw_user_object_buffer(&vfbs->uo);
  1225		struct vmw_surface *surf = vmw_user_object_surface(&vfbs->uo);
  1226	
  1227		if (bo) {
  1228			vmw_bo_dirty_release(bo);
  1229			/*
  1230			 * bo->dirty is reference counted so it being NULL
  1231			 * means that the surface wasn't coherent to begin
  1232			 * with and so we have to free the dirty tracker
  1233			 * in the vmw_resource
  1234			 */
  1235			if (!bo->dirty && surf && surf->res.dirty)
> 1236				surf->res.func->dirty_free(&surf->res);
  1237		}
  1238		drm_framebuffer_cleanup(framebuffer);
  1239		vmw_user_object_unref(&vfbs->uo);
  1240	
  1241		kfree(vfbs);
  1242	}
  1243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
