Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614414D70C;
	Thu, 25 Apr 2024 19:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714074679; cv=none; b=PzslH1gH4mbxHQnmGpwWXaxAWQO09fetsaXOyfWAXg9/L++5f/cUEL7bkyDyc+6u6mSE8+9iGg78rFZF4Kt+WBNLQ6SGyCmvvQkUs273iO/IqUY01EVn4ra2VTBcanVUOK2VU+3pwQL4U0l+QrBjttl5xgbbiP8hGLe4TwNXXaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714074679; c=relaxed/simple;
	bh=g/7WY1PNa+eVzC8Vs0EclC277d1TuItoUpmgdey+meg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6CScONFJVvNDYj1EQuyEMV2WqkFw3RXI/R6mV/pbb+zIb7mM/ibHOU+ILJPve1zHAuM+fX60jR+Z/VmYceGetPo4GpWKmdCppGfgZ7pLk61Bnp5rOC1hkyBXfmVmyLCWvf0lx+sPmFGX89fEX0BCg+hUMAeeu1Uyq3rTBXV3JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjegX/Qn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjegX/Qn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714074677; x=1745610677;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g/7WY1PNa+eVzC8Vs0EclC277d1TuItoUpmgdey+meg=;
  b=QjegX/QnXBhXgkPsdJKK3xvHztak0e/+kZTAQLrNnjzquGdGxXeb/8dx
   iGdGX6n4uUkmfrjqUimhSjDKwHHUCkI5A3a6FFVY+G1cek727HiMpHW+P
   w195xRw4UK5yEYKKA0JTWesXhojjjs2lEPYvP/TEji7M9QCB1U9uYBOT0
   tOd9METSuz3wR8xmkLLPcSGHPzZs+qaQxuZAKOUlXWIShzH/ICVGSWV+5
   1aAC27O4HKMhfR69jIEjJrEugI7X3ixIQIc8ONYhNkRCCu4xErDHgDX3H
   EicQ/SWL0B4rtgUiBY7JeFWeSXnEKy8roRvS71jz71EmT1hxVnXyDowDP
   w==;
X-CSE-ConnectionGUID: 9xlnJgz4QfePNhIehUMidw==
X-CSE-MsgGUID: FAA4sdkcRqOx2AVPYBLorg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20402918"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="20402918"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 12:51:16 -0700
X-CSE-ConnectionGUID: W/CLOaQJRDCbfbhpqI0e0A==
X-CSE-MsgGUID: G7pC3Cd0RzyWkiKZebrE8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="62660915"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Apr 2024 12:51:15 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s057f-0002o4-2g;
	Thu, 25 Apr 2024 19:51:11 +0000
Date: Fri, 26 Apr 2024 03:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [drm-misc:for-linux-next 2/2]
 drivers/gpu/drm/omapdrm/omap_fb.c:325:2: error: implicit declaration of
 function 'seq_printf' is invalid in C99
Message-ID: <202404260318.H7uZPwSq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2bdb481bf7a93c22b9fea8daefa2834aab23a70f
commit: 9e2b84fb6cd7ee913aa61d461db65c1d6a08dcf2 [2/2] drm/print: drop include seq_file.h
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240426/202404260318.H7uZPwSq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260318.H7uZPwSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260318.H7uZPwSq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/omap_fb.c:325:2: error: implicit declaration of function 'seq_printf' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           seq_printf(m, "fb: %dx%d@%4.4s\n", fb->width, fb->height,
           ^
   1 error generated.


vim +/seq_printf +325 drivers/gpu/drm/omapdrm/omap_fb.c

b33f34d3d10b9b drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  319  
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  320  #ifdef CONFIG_DEBUG_FS
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  321  void omap_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  322  {
bcb0b461454c9c drivers/gpu/drm/omapdrm/omap_fb.c Ville Syrjälä 2016-12-14  323  	int i, n = fb->format->num_planes;
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  324  
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05 @325  	seq_printf(m, "fb: %dx%d@%4.4s\n", fb->width, fb->height,
438b74a5497c36 drivers/gpu/drm/omapdrm/omap_fb.c Ville Syrjälä 2016-12-14  326  			(char *)&fb->format->format);
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  327  
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  328  	for (i = 0; i < n; i++) {
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  329  		seq_printf(m, "   %d: offset=%d pitch=%d, obj: ",
2ecceeb53b1945 drivers/gpu/drm/omapdrm/omap_fb.c Daniel Stone  2018-03-30  330  				i, fb->offsets[n], fb->pitches[i]);
3e44255260dc3c drivers/gpu/drm/omapdrm/omap_fb.c Daniel Stone  2018-03-30  331  		omap_gem_describe(fb->obj[i], m);
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  332  	}
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  333  }
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  334  #endif
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  335  

:::::: The code at line 325 was first introduced by commit
:::::: f6b6036e56ca17378dd0294b684db623abd6a901 staging: drm/omap: debugfs for object and fb tracking

:::::: TO: Rob Clark <rob@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
