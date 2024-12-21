Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAB540849;
	Sat, 21 Dec 2024 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734804214; cv=none; b=tikegZHhZ7yW6zh+9S28xhcErLRngXyCoCRBcb63Ojkc2hKSqnDtAd/BiiGwqXRSZ27kBNfBacWgmI2NqnvIzDfGA9vis7wYcQoECcCESm43PhhmdwsiqvKPiLC0vzS98gyPeG7IDYS8ilgR8n+squ7E0BIujHeHr+q0c45dUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734804214; c=relaxed/simple;
	bh=kkq5Us1DWbLrXaRI69S2OmXoUqK45twPixWgPS6JPeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VDHvIKEdwiNAcWWx8UWfJLpkRCz2QcdtcupOZoJZ81Urh5ERQ2tglYlnGpyDip1UoLv75fLT9l4MJlpe5Epaqo7yh8Usnwb3CLpiRtkKomEFUfALltAS/FNodMfPpgOOI82aR22b+gLl5064idYVi6F6MdUGCNaCBoFYx3hpY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/mm8yu/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/mm8yu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734804212; x=1766340212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkq5Us1DWbLrXaRI69S2OmXoUqK45twPixWgPS6JPeA=;
  b=d/mm8yu/J+Ye5DesfKxzrqqWpiVKMa5yEOMCaK0Kx/oq/HcstSKfWoAv
   FCmh+gR5AGMLeWx4s6gZeWYwtwRERP4CoE9TUnJYMT8mJr5FqgeGtXhjX
   iLT8pKq672AfUweV0zxMg/QMbRdhABa2iWHRlJKR8yxiMEkO0vxXZf6Wj
   HvMByzRe8yr6v3DwwJT4gPY0Dz5ABWel6746Epa6pE3yix+4HpByLrA24
   8S72A5YU1ro9Ep6xCT4HMwh0/sNEi/Ohkm+DbAsiw/DKor4/0RnpyM8oT
   Kp0A2lirUKeTjjp5dL48wPFDWoWivLklDm6jl3bkPwPQKy4oego/dWqyD
   w==;
X-CSE-ConnectionGUID: T1m4p1hLQfCyIFnNiHJgBQ==
X-CSE-MsgGUID: vTsyPYa7T267V09S/3BodA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35219220"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35219220"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:03:29 -0800
X-CSE-ConnectionGUID: B+JeVQ0DRwe+cA141uUxMw==
X-CSE-MsgGUID: kumV4ttyT72eLaAVQQ1dAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122097758"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2024 10:03:28 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP3oz-0002MT-1S;
	Sat, 21 Dec 2024 18:03:25 +0000
Date: Sun, 22 Dec 2024 02:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 21/239]
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c:30:18: error: unused
 function 'hdmi_read'
Message-ID: <202412220112.f5nh5rSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   13d127a82b5c70061560c65fb083e30e79363874
commit: 30c2de0a267c04046d89e678cc0067a9cfb455df [21/239] mm/vmstat: fix a W=1 clang compiler warning
config: arm-randconfig-003-20241222 (https://download.01.org/0day-ci/archive/20241222/202412220112.f5nh5rSz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220112.f5nh5rSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220112.f5nh5rSz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c:30:18: error: unused function 'hdmi_read' [-Werror,-Wunused-function]
      30 | static inline u8 hdmi_read(struct dw_hdmi_i2s_audio_data *audio, int offset)
         |                  ^~~~~~~~~
   1 error generated.


vim +/hdmi_read +30 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c

2761ba6c0925ca9 drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c Kuninori Morimoto 2016-11-08  29  
2761ba6c0925ca9 drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c Kuninori Morimoto 2016-11-08 @30  static inline u8 hdmi_read(struct dw_hdmi_i2s_audio_data *audio, int offset)
2761ba6c0925ca9 drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c Kuninori Morimoto 2016-11-08  31  {
2761ba6c0925ca9 drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c Kuninori Morimoto 2016-11-08  32  	struct dw_hdmi *hdmi = audio->hdmi;
2761ba6c0925ca9 drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c Kuninori Morimoto 2016-11-08  33  
2761ba6c0925ca9 drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c Kuninori Morimoto 2016-11-08  34  	return audio->read(hdmi, offset);
2761ba6c0925ca9 drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c Kuninori Morimoto 2016-11-08  35  }
2761ba6c0925ca9 drivers/gpu/drm/bridge/dw-hdmi-i2s-audio.c Kuninori Morimoto 2016-11-08  36  

:::::: The code at line 30 was first introduced by commit
:::::: 2761ba6c0925ca9c5b917a95f68135d9dce443fb drm: bridge: add DesignWare HDMI I2S audio support

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Archit Taneja <architt@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
