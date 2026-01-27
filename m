Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461287080D;
	Tue, 27 Jan 2026 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528441; cv=none; b=Hm+uSUSJpQ9ejbTaJHMZsGky2uXgGmJgbbtNujEbkFLI7U/nx3c6htCStdVd6XoUmChsDWCUtbfuhaPzbB5PBQ/XC/ZH5D3EM9/oa+aIaOdCmltGXaw8ljIDDT9DfYFWtVKgfeG+RsxvLh28ik8eb3pm4ecLBAv1NKrPpRlfwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528441; c=relaxed/simple;
	bh=XhBC5KV+PtVVZ/Z9sK8gsPhmkVrcEIqlnIPPBjBhYdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQbxItiiXhMwU1c+qwC/OGA5YzIFTuDkj+0ZUV1f01vCCVm5al8oKcz7iwkK6+v24EklRQSjVJHFayuaB9Bjl24xwePbQMYjtzmPz9A1/KeaSVm2YfJjKXpsNU6dusj5ptbDTN6JSXpXpUuLk/YtEAfMuUgtGL1mSMvibbwGyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HH7jjZDY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HH7jjZDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769528439; x=1801064439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XhBC5KV+PtVVZ/Z9sK8gsPhmkVrcEIqlnIPPBjBhYdM=;
  b=HH7jjZDYIY7bdnJIZN/2fCFtUvsF9W84UcigxQouj0DCvUFWeUmevNq0
   BpePAqcX/UYB1GwUTA9YVG/9Y19BST+cipyFnhdt58N5NbxKP236oUpeO
   fMHRie/ZY0hvo6JFohEsEhstWLj0/Sb3ykT2TZATLEESQRvuibSykO3k4
   bxKHMV+Ta5QH/1cgUPWQqg1I8jvK5+BnHkEpou+SubmmkTp2hDgetdYjf
   GnXLddknkY8l9uUYOUBp3CRJnHYmCOlPC9rydMpfm0QNMiVS/+ED1k3uL
   Q9vtY5lbcCcmDY9YtBiZ8c1xEs3cegtwimKEyz/Z0jF2z5olvcCilP8rZ
   g==;
X-CSE-ConnectionGUID: Dg+AFPTpTAuzquVYALNw7g==
X-CSE-MsgGUID: B3Jxh+aXRgm8qStjGQzXkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70816140"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70816140"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 07:40:39 -0800
X-CSE-ConnectionGUID: YkjinVAERv2ujCwRoSLWag==
X-CSE-MsgGUID: XSHPA9EtQ96q7JmKxOnzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208058802"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 07:40:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vklB9-00000000YcG-3qcQ;
	Tue, 27 Jan 2026 15:40:31 +0000
Date: Tue, 27 Jan 2026 23:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Lu <a0987203069@gmail.com>, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
	a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
Message-ID: <202601272315.09SFioVt-lkp@intel.com>
References: <20260126085727.2568958-4-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126085727.2568958-4-a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next]
[cannot apply to robh/for-next linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-display-nuvoton-add-MA35D1-DCU-binding/20260126-170258
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260126085727.2568958-4-a0987203069%40gmail.com
patch subject: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260127/202601272315.09SFioVt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272315.09SFioVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272315.09SFioVt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nuvoton/ma35_plane.c:177:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     177 |                 *reg = MA35_BLEND_MODE_SRC;
         |                        ^
   drivers/gpu/drm/nuvoton/ma35_plane.h:141:2: note: expanded from macro 'MA35_BLEND_MODE_SRC'
     141 |         FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
         |         ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:337:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     337 |         reg = FIELD_PREP(MA35_OVERLAY_POSITION_X_MASK, x) |
         |               ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:360:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     360 |                 reg = FIELD_PREP(MA35_PRIMARY_FORMAT_MASK, format) |
         |                       ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:384:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     384 |                 reg = FIELD_PREP(MA35_OVERLAY_FORMAT_MASK, format) |
         |                       ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:441:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     441 |         reg = FIELD_PREP(MA35_CURSOR_X_MASK, x) |
         |               ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:483:4: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     483 |                         FIELD_PREP(MA35_CURSOR_HOTSPOT_X_MASK, new_state->hotspot_x) |
         |                         ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:537:4: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     537 |                         FIELD_PREP(MA35_CURSOR_HOTSPOT_X_MASK, new_state->hotspot_x) |
         |                         ^
   7 errors generated.
--
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:97:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      97 |         reg = FIELD_PREP(MA35_DISPLAY_TOTAL_MASK, mode->htotal) |
         |               ^
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:228:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     228 |         *hpos = FIELD_GET(MA35_DISPLAY_CURRENT_X, reg);
         |                 ^
   drivers/gpu/drm/nuvoton/ma35_crtc.c:284:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |                 reg = FIELD_PREP(MA35_GAMMA_RED_MASK, r[i]) |
         |                       ^
   3 errors generated.
--
>> drivers/gpu/drm/nuvoton/ma35_interface.c:150:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     150 |         if (!interface) {
         |             ^~~~~~~~~~
   drivers/gpu/drm/nuvoton/ma35_interface.c:191:9: note: uninitialized use occurs here
     191 |         return ret;
         |                ^~~
   drivers/gpu/drm/nuvoton/ma35_interface.c:150:2: note: remove the 'if' if its condition is always false
     150 |         if (!interface) {
         |         ^~~~~~~~~~~~~~~~~
     151 |                 drm_err(drm_dev, "Failed to initialize encoder\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     152 |                 goto error_early;
         |                 ~~~~~~~~~~~~~~~~~
     153 |         }
         |         ~
   drivers/gpu/drm/nuvoton/ma35_interface.c:145:9: note: initialize the variable 'ret' to silence this warning
     145 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/FIELD_PREP +177 drivers/gpu/drm/nuvoton/ma35_plane.c

   167	
   168	static int ma35_layer_blend_mode_select(u32 mode, u32 *reg)
   169	{
   170		u32 ret = 0;
   171	
   172		switch (mode) {
   173		case MA35_ALPHA_CLEAR:
   174			*reg = MA35_BLEND_MODE_CLEAR;
   175			break;
   176		case MA35_ALPHA_SRC:
 > 177			*reg = MA35_BLEND_MODE_SRC;
   178			break;
   179		case MA35_ALPHA_DST:
   180			*reg = MA35_BLEND_MODE_DST;
   181			break;
   182		case MA35_ALPHA_SRC_OVER:
   183			*reg = MA35_BLEND_MODE_SRC_OVER;
   184			break;
   185		case MA35_ALPHA_DST_OVER:
   186			*reg = MA35_BLEND_MODE_DST_OVER;
   187			break;
   188		case MA35_ALPHA_SRC_IN:
   189			*reg = MA35_BLEND_MODE_SRC_IN;
   190			break;
   191		case MA35_ALPHA_DST_IN:
   192			*reg = MA35_BLEND_MODE_DST_IN;
   193			break;
   194		case MA35_ALPHA_SRC_OUT:
   195			*reg = MA35_BLEND_MODE_SRC_OUT;
   196			break;
   197		case MA35_ALPHA_DST_OUT:
   198			*reg = MA35_BLEND_MODE_DST_OUT;
   199			break;
   200		case MA35_ALPHA_SRC_ATOP:
   201			*reg = MA35_BLEND_MODE_SRC_ATOP;
   202			break;
   203		case MA35_ALPHA_DST_ATOP:
   204			*reg = MA35_BLEND_MODE_DST_ATOP;
   205			break;
   206		case MA35_ALPHA_XOR:
   207			*reg = MA35_BLEND_MODE_XOR;
   208			break;
   209		default:
   210			ret = -EINVAL;
   211		}
   212	
   213		return ret;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
