Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F9720FAAD;
	Fri,  4 Oct 2024 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728046164; cv=none; b=e8CvDZtvO8VK2zT4aZT16J1gw53Uj5ueGDGpBjvfgF9reTxmmP6WuEFdQG5UkFQ2QohEUbWsCKzWUTljzhNPjCrzyH5OEjMyyBzqEnPrY8jcxBBJDUO9OiIRQ+T09BuRjzxyVrWKhPI+/osfM8JexlnDySedEuzqQwfrf4VfxwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728046164; c=relaxed/simple;
	bh=xdgsY0YDuDcng7CbNpryo4/J/L41PiaVwaZGfHmXK+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5ZckOTn+30DhHv/3I31wLProPfZVY6lhNYf0EQkDOIziEaX4JloAZIz5kSvw1P10aUbDe7273CzPzz5mwWgOQWgxD9PrK6woPiDHo/7KvgTxKu76b0WcdZj/4fPsQpC3tgUsVDw5gavU2cOVOV8j1AS3xmYqH7SmTM6U6mMhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9kpSIPp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9kpSIPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728046162; x=1759582162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xdgsY0YDuDcng7CbNpryo4/J/L41PiaVwaZGfHmXK+I=;
  b=j9kpSIPpiMjr3BeXljY987oanUY1MM9ZbEt0j84tfbzcimjuHQayVqxQ
   25G3qYc6KVONTkK3VvG1BXDK8fcCHwXk9RQ+amO4CTxX4pjokdZUuJgzy
   Mt4xIGEJ9ppvrcFDskAtrqrvZ5R7+dQqOAutzzQ9BSgwmN0jgMmLHyfCb
   pR+bXdpiwPhNixelwXOscte3hrJ+6uXFBW4FgqGde5/VeeIIEzhvCJY1u
   jlUfXA+UgZBmiaVBLzoZTNLjmI3ojCNgm42gdhJlXm4Sr2kkVtbLy/8H2
   YkkqB4+uzc4uer06qp41IIqcdG8CoXuSlXvg2L1Lh3L0f4lEd8QOZJuFf
   A==;
X-CSE-ConnectionGUID: +3NR7j5zQPm4lwJqdqWfxw==
X-CSE-MsgGUID: uGKKG9IHSFWxhumKMJLjmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37833780"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37833780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 05:49:18 -0700
X-CSE-ConnectionGUID: ppB39njVRFKreHHoTE8YQw==
X-CSE-MsgGUID: PnoaQI93SwaIY7o85pFCtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79122716"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2024 05:49:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swhkA-0001cy-2U;
	Fri, 04 Oct 2024 12:49:14 +0000
Date: Fri, 4 Oct 2024 20:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 03/12] drm/i915/display: Use async flip when available
 for initial plane config
Message-ID: <202410042053.DCNgBMOr-lkp@intel.com>
References: <20241003154421.33805-4-maarten.lankhorst@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003154421.33805-4-maarten.lankhorst@linux.intel.com>

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.12-rc1]
[cannot apply to next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-xe-display-Handle-stolen-bar-readout-in-the-same-way-as-lmem/20241004-000534
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241003154421.33805-4-maarten.lankhorst%40linux.intel.com
patch subject: [PATCH v3 03/12] drm/i915/display: Use async flip when available for initial plane config
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20241004/202410042053.DCNgBMOr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042053.DCNgBMOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042053.DCNgBMOr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/skl_universal_plane.c:2814:14: error: call to undeclared function 'intel_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2814 |         plane_ctl = intel_read(i915, PLANE_CTL(pipe, plane_id));
         |                     ^
   1 error generated.


vim +/intel_read +2814 drivers/gpu/drm/i915/display/skl_universal_plane.c

  2789	
  2790	bool skl_fixup_initial_plane_config(struct intel_crtc *crtc,
  2791					    const struct intel_initial_plane_config *plane_config)
  2792	{
  2793		struct drm_i915_private *i915 = to_i915(crtc->base.dev);
  2794		struct intel_plane *plane = to_intel_plane(crtc->base.primary);
  2795		const struct intel_plane_state *plane_state =
  2796			to_intel_plane_state(plane->base.state);
  2797		enum plane_id plane_id = plane->id;
  2798		enum pipe pipe = crtc->pipe;
  2799		u32 base, plane_ctl;
  2800	
  2801		if (!plane_state->uapi.visible)
  2802			return false;
  2803	
  2804		base = intel_plane_ggtt_offset(plane_state);
  2805	
  2806		/*
  2807		 * We may have moved the surface to a different
  2808		 * part of ggtt, make the plane aware of that.
  2809		 */
  2810		if (plane_config->base == base)
  2811			return false;
  2812	
  2813		/* Perform an async flip to the new surface. */
> 2814		plane_ctl = intel_read(i915, PLANE_CTL(pipe, plane_id));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
