Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACD31474AE;
	Mon, 13 May 2024 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715588957; cv=none; b=VQfzab7EC2AeYvRMYxipIE/Xgp2uynYvrSQdyfsMrqgYEFbLd79bY/dVYnlfPRZqNMV5IrJQSER+HpvFXv805HpXtYWQ9bZRuDmc7e/egBZ2bt7KxJu0K4bbhQQl2i01HzdKfoEJt6gVgwHaPFK5MmXvDBtHLdohTA4f/xuob+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715588957; c=relaxed/simple;
	bh=Sr5zODGoT7QmZtyh9PRBIPHTepC41S6bbyUt7jEawHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZJbwV2ZricIWnC8P2qD/TH4d6U9sjiu3JAAlsuxBEU/94VyYINsk08jjoXS65G4Rs6cQMlvs2pkbnaq3mnd7Aclg6gEdloUsX9qrqLV6BlqOqYYYvnR4mIRGjvxGueBGyQEQlz0TJDs5YjpOBPtcH9U5tot9jTuGsqmcYCTSds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erfpmZmD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erfpmZmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715588956; x=1747124956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sr5zODGoT7QmZtyh9PRBIPHTepC41S6bbyUt7jEawHY=;
  b=erfpmZmDfALJS154MT7YjF82ZKkW9TzGMy9LBD2GaCtUBnVGspfY6HId
   ykdRqMF08NXOrSP9jfYsTZrHP36P7b9u9qikMyR8p3bKoAUlRdPgmbSfp
   h8ZVwy2py3hl8B/D0dxIJirQoNFJ6dUeuvSMrSBht67eFCTOa6KUtcUkT
   87iyARIja86uSIF6iU1okf18FUEsIBvEhO6Xp+KjH7AwAv5rRXVbKReRT
   NZmlQHz4UtJfSm+4YodHBBa9OFGbb9wyL4f7FeoMa4nHOhavipqnIK8zz
   pkRidVbmvbt9kXY4edtg2HKUDwfyvb9AGGTCBy1KarpYGs3B0sOcn7NY6
   w==;
X-CSE-ConnectionGUID: E5w98sZlQbu5+6CRY7lqMw==
X-CSE-MsgGUID: MRdasaOFTviYMfxNY3BbQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22658804"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="22658804"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 01:29:15 -0700
X-CSE-ConnectionGUID: sidtKCkBRUKMoJEw9ZAvrQ==
X-CSE-MsgGUID: ixUyaZ3ARdGyIuVLxtBBsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30255526"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 May 2024 01:29:13 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6R3X-0009nH-1c;
	Mon, 13 May 2024 08:29:11 +0000
Date: Mon, 13 May 2024 16:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:asahi-wip 29/31] drivers/gpu/drm/apple/dcp.c:101:
 warning: Function parameter or struct member 'crtc' not described in
 'dcp_crtc_send_page_flip_event'
Message-ID: <202405131641.E3WM7KFH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   65718aefab870e7d3ab6c1863cb9dc2773712312
commit: 64bf00b0969fcf8f27cb21e4db4a0741b47cfdda [29/31] drm: apple: Override drm_vblank's page flip event handling [HACK]
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240513/202405131641.E3WM7KFH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131641.E3WM7KFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131641.E3WM7KFH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/apple/dcp.c:101: warning: Function parameter or struct member 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> drivers/gpu/drm/apple/dcp.c:101: warning: Function parameter or struct member 'e' not described in 'dcp_crtc_send_page_flip_event'
>> drivers/gpu/drm/apple/dcp.c:101: warning: Function parameter or struct member 'now' not described in 'dcp_crtc_send_page_flip_event'
>> drivers/gpu/drm/apple/dcp.c:101: warning: Function parameter or struct member 'start' not described in 'dcp_crtc_send_page_flip_event'


vim +101 drivers/gpu/drm/apple/dcp.c

    82	
    83	/**
    84	 * dcp_crtc_send_page_flip_event - helper to send vblank event after pageflip
    85	 *
    86	 * Compensate for unknown slack between page flip and arrival of the
    87	 * swap_complete callback. Minimal observed duration on DCP with HDMI output
    88	 * was around 2.3 ms. If the fb swap was submitted closer to the expected
    89	 * swap_complete it gets a penalty of one frame duration. This is on the border
    90	 * of unreasonable considering that Apple advertises support for 240 Hz (frame
    91	 * duration of 4.167 ms).
    92	 * It is unreasonable considering kwin's kms commit scheduling. Kwin commits
    93	 * 1.5 ms + the mode's vblank time before the expected next page flip
    94	 * completion. This results in presenting at half the display's rate for HDMI
    95	 * outputs.
    96	 * This might be a difference between dcp and dcpext.
    97	 */
    98	static void dcp_crtc_send_page_flip_event(struct apple_crtc *crtc,
    99						  struct drm_pending_vblank_event *e,
   100						  ktime_t now, ktime_t start)
 > 101	{
   102		struct drm_device *dev = crtc->base.dev;
   103		u64 seq;
   104		unsigned int pipe = drm_crtc_index(&crtc->base);
   105		ktime_t flip;
   106	
   107		seq = 0;
   108		if (start != KTIME_MIN) {
   109			s64 delta = ktime_us_delta(now, start);
   110			if (delta <= 500)
   111				flip = now;
   112			else if (delta >= 2500)
   113				flip = ktime_sub_us(now, 1000);
   114			else
   115				flip = ktime_sub_us(now, (delta - 500) / 2);
   116		} else {
   117			flip = now;
   118		}
   119		e->pipe = pipe;
   120		send_vblank_event(dev, e, seq, flip);
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
