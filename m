Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B5B73506;
	Wed,  3 Apr 2024 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712143926; cv=none; b=YzzHPEWaYhibrHsbPPtkQ90Gt5i7sJUfwRfecfeb/58RglCohX0i4nAJLlY9lJLZCfSSkt4hGt8AHsQgCytSIFo1IsKioYsxlelNZl158gk9Xy1XgIY5M5KVFYxeB1Fp2RRQbO6wPEskK7VJ4vujkcJZ4Q+wqqOyp6HsUVYq1xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712143926; c=relaxed/simple;
	bh=0zmDNVi3EuzUQ3djA1KlSACWfrrnxTwaUcaEUj/bsfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMeE/bIzxZ7fdHXZsHM5OjIxeqdjbFupSvnUZh5HCeNU09mEwXHwNW3SWpteW2vYdUynpJwafvYymFPfGPGiRFv6tgLVZ0Ed1uB5pUSwoFIfOQvUc10YFJL9aqQokjLH2jsT82jIyfbyQPLD1vw2R+FXraI6mYBXa6J/ls8OLrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7bMAiuP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7bMAiuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712143925; x=1743679925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0zmDNVi3EuzUQ3djA1KlSACWfrrnxTwaUcaEUj/bsfw=;
  b=C7bMAiuP0yxL2g8/jA/+KZNvcwX/q1Xrqs6nN5vhJFQgkl6yYCU5a2Ug
   YIz/SzgqK6GaHZ2iR6pkDVVnyjtbiwle4wW6o8/eOWNA6r9nHByrPGv9C
   d3unexm4/LdYwk3QTBd9qWlOCPdJGgFnxP+TYHQLjaRY/7EuGgApw8aqG
   G+OYdYP4ClkE3PVpPvo+JCVWpAeOMjvt7Tn+XnCn1MulipVVi1tkeN50r
   xhDvEhkJEsZb1j87qInKrzn4SlzVKz0rwcJFM5YanWNU+r0LXdu1IqMnd
   DNuYRlIvbq9noiOxkDoZkkoN1NCIAbOQyES3wpaci8vZG//ZnmSB4TKXF
   A==;
X-CSE-ConnectionGUID: MB7O0MqaTVC/cm0xBXKVZg==
X-CSE-MsgGUID: QLLGUs6bQTerfCE8YujC1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18815379"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18815379"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 04:32:04 -0700
X-CSE-ConnectionGUID: DBlNApzzTQOXWKaqT9NXZg==
X-CSE-MsgGUID: +v/6/jYpT6mup6YOoQHTqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18459257"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2024 04:32:01 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rryqV-00029j-1c;
	Wed, 03 Apr 2024 11:31:59 +0000
Date: Wed, 3 Apr 2024 19:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	ian.forbes@broadcom.com, martin.krastev@broadcom.com,
	maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH 2/5] drm/vmwgfx: Implement virtual crc generation
Message-ID: <202404031944.HMjSiHkr-lkp@intel.com>
References: <20240402232813.2670131-3-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402232813.2670131-3-zack.rusin@broadcom.com>

Hi Zack,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.9-rc2 next-20240403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-vmwgfx-Implement-virtual-kms/20240403-073132
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240402232813.2670131-3-zack.rusin%40broadcom.com
patch subject: [PATCH 2/5] drm/vmwgfx: Implement virtual crc generation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240403/202404031944.HMjSiHkr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031944.HMjSiHkr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031944.HMjSiHkr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c:515: warning: expecting prototype for vmw_vkms_lock_max_delay(). Prototype was for vmw_vkms_lock_max_wait_ns() instead


vim +515 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c

   504	
   505	/**
   506	 * vmw_vkms_lock_max_delay - Return the max wait for the vkms lock
   507	 * @du: The vmw_display_unit from which to grab the vblank timings
   508	 *
   509	 * Returns the maximum wait time used to acquire the vkms lock. By
   510	 * default uses a time of a single frame and in case where vblank
   511	 * was not initialized for the display unit 1/60th of a second.
   512	 */
   513	static inline u64
   514	vmw_vkms_lock_max_wait_ns(struct vmw_display_unit *du)
 > 515	{
   516		s64 nsecs = ktime_to_ns(du->vkms.period_ns);
   517	
   518		return  (nsecs > 0) ? nsecs : 16666666;
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
