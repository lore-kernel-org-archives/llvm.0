Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582F380;
	Fri, 26 Apr 2024 00:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714091607; cv=none; b=HYVhtGzzuMyWpuNNPZAOFzD7dGdXURLh05ByVXT9dNcdY4psEl816Z0Rdvaxi1ID1Zaay0IEQpyKvL2XVVU3o/CI9TQQDkq0ltwkNTMGgihXAwzfCueABzcVDp/t29CGdiU4xc9VQYw+YMaJMhUNH16p/wV4ji7rGAtK9c6QtWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714091607; c=relaxed/simple;
	bh=Nf+U2Bz83MNqocDchiJl1OjjxkiS7h47yk61UeFnBl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GlWgw0uz7gQAS+6pW5E2Vy7CQjb3b2TtIRZ87KllkcRFZ1LM5RHFgdW6gJKcHQH3m/hvbkMD9OFQXWPKO7Nle7G9unPL0GLjJuNbKuZYH5W9x2HVjxeCEZWzVEPCBlPeEOpEmSfN6HNIO4asFkwulaljTUBsbkReES4QmzQa6YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCRMFwP4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCRMFwP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714091607; x=1745627607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nf+U2Bz83MNqocDchiJl1OjjxkiS7h47yk61UeFnBl8=;
  b=gCRMFwP4R3AUJeXrz3lii/FUQ0KyuHOovoYAoC5cfAtCaJv39T/wmMMq
   FLsHSiwBe9LeefjaiX/pcyHsJO4WSRsxsCmgh65cFUuWp5BRUP7a+qzvc
   XYEagd6FDixB/F5gMFZWEs/JJpTsuqVjunPjoPlROKnpjRzhJYgLlUDPG
   ZqnCIBFNIJl5WQ/f5ZYczb3caXtDLJ9rHUYMmxm8hMLHmE+u4AYprpDZ4
   ejKa5glTNcOx1utZ/alpCzJ6D8lpYaNfTa1gPQwe39R7tfsH0NOKnBAl3
   hgKKnByJ77kiZxNWcuuRk0sica6S7MYsePsAV03IRJywJYshnFfezIAgT
   g==;
X-CSE-ConnectionGUID: noazeaKrS6OalHZzvX5q1Q==
X-CSE-MsgGUID: mT6wVp+/SRenspW75NJrNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27270904"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="27270904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 17:33:26 -0700
X-CSE-ConnectionGUID: WEGGWKYmQ0KvzmlT10ekOA==
X-CSE-MsgGUID: 3zTKaR2kReCPY5gGTqbRWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25893760"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Apr 2024 17:33:23 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s09Wj-00033w-0A;
	Fri, 26 Apr 2024 00:33:21 +0000
Date: Fri, 26 Apr 2024 08:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [drm-misc:for-linux-next 4/6]
 drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: warning: logical not is only
 applied to the left hand side of this comparison
Message-ID: <202404260800.7UEcBP6c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2bdb481bf7a93c22b9fea8daefa2834aab23a70f
commit: b0f0469ab662159f182f5af292b71cc5d42468a8 [4/6] drm: xlnx: zynqmp_dpsub: Anounce supported input formats
config: i386-buildonly-randconfig-006-20240426 (https://download.01.org/0day-ci/archive/20240426/202404260800.7UEcBP6c-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260800.7UEcBP6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260800.7UEcBP6c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: warning: logical not is only applied to the left hand side of this comparison [-Wlogical-not-parentheses]
     949 |         if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
         |                     ^            ~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses after the '!' to evaluate the comparison first
   drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses around left hand side expression to silence this warning
   1 warning generated.


vim +949 drivers/gpu/drm/xlnx/zynqmp_disp.c

   928	
   929	/**
   930	 * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
   931	 * @layer: The layer
   932	 * @num_formats: Pointer to the returned number of formats
   933	 *
   934	 * NOTE: This function doesn't make sense for live video layers and will
   935	 * always return an empty list in such cases. zynqmp_disp_live_layer_formats()
   936	 * should be used to query a list of media bus formats supported by the live
   937	 * video input layer.
   938	 *
   939	 * Return: A newly allocated u32 array that stores all the DRM formats
   940	 * supported by the layer. The number of formats in the array is returned
   941	 * through the num_formats argument.
   942	 */
   943	u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
   944					   unsigned int *num_formats)
   945	{
   946		unsigned int i;
   947		u32 *formats;
   948	
 > 949		if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
   950			*num_formats = 0;
   951			return NULL;
   952		}
   953	
   954		formats = kcalloc(layer->info->num_formats, sizeof(*formats),
   955				  GFP_KERNEL);
   956		if (!formats) {
   957			*num_formats = 0;
   958			return NULL;
   959		}
   960	
   961		for (i = 0; i < layer->info->num_formats; ++i)
   962			formats[i] = layer->info->formats[i].drm_fmt;
   963	
   964		*num_formats = layer->info->num_formats;
   965		return formats;
   966	}
   967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
