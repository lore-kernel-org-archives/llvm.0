Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795310823;
	b=CYOXwqr7cs6gt/RG5qEqbHrDGJ/XJ8gxgWJBuRuO125UgmC9cprHgGNsghXV05AQaDZf
	 i5p4qhB/IFhjLb89BeKsZdAsyFRKIYyFoSAVRE3/i1rVIhGDDz/4SV/GICWSSBKHCdMsD
	 1Fhpy70iiwmLw4P9F5REhgg/hyypafEnsJs4SS0R5/zVa+vPIWGyYkiTSnFy9MBgfyB/J
	 06KtX+dFEKaHyTObslxcxfHUGz7NclABcAa3FlwQ77lIK5xcOuj5PDDyk7O8ryLnHzary
	 d/1wb6jVKCJbVL6ZmyvoJOr+5xuzEsS/LSRWc1TY21DwyBUu7TBdRNu+HNdTf5wjBUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795310823;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=nlrnJ1MEmoSQ8WjYVvRJfU9Fpkq5KKWacqaqSZEKft8=;
	b=mU5rboQPSRi5E/k1x7N4czUi/fCcv8uotn+5yoztCYK09EiS4khcWwoGPy+qiMSRDJHl
	 XDVTPY9j02sIUiH4UKSiTVClOUTrHjbMNjxtBsQtlDhqXMzbWnGfrJu4C/iQIOOceh4x9
	 ONcCjTKVqh06XcDQinFGd9h7M/n749MGibDhbj6dM6nc54kBM8hSdk09yfh7owH5mZYBF
	 XTGjmzXIwP6VgHMCk4zr1TU6+H5X+fBu8WMoBzWO4XxnEIp9yvUkLbG7aiG9RuTETIDN8
	 8AzsXQ8yZjgqLvnyHvnz/18h7iwKuRZjPUHMk9nR4VOKv2FUeeqSXHVYTjHAvt/eVCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mp4p5VI3;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60564606A330;
	Sun, 22 Nov 2026 01:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60564606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mp4p5VI3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795310823; x=1826846823;
  h=date:from:to:cc:subject:message-id;
  bh=R1jUNFW4du44WXWAvk6UbdFhllk3VGpcCk8YPcCxEW8=;
  b=mp4p5VI3KYduxRinfdV9yWR25mZf/i4LhKVslHBBA7vFOtOyDCEM3A6d
   OjXShpP6FAC2EKqAUmNc2WZ61fpBBjXrTn8UAH+htZv5y4pHQH9dtykYv
   seaiQGzzQyfZns9SkWm7g+jVFUUzUdsdpI1fVrFfJdvC4AW3d4twOaMAj
   Wpk9i1hfQ+rk05XqG7qbbagD81kFLVrJRoBEdc3LA2U0Vrc2IgSbhNP+j
   KZ2ohzt+yCrRJfvA8TrcfM/Ol/Ar9aRk6mrqeVwHjJJK9GRlyQHLKpFQO
   Cr4jO7MxbwDEtKi5IjVXBq9Wn926LNRyDoG3Idf+D593aSGE97CQI8YIU
   w==;
X-CSE-ConnectionGUID: x3aIA4srQ3G3J8gN6+BWuQ==
X-CSE-MsgGUID: xQ4x3l9gR72JBsduNDYs8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4049772"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4049772"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 17:27:02 -0800
X-CSE-ConnectionGUID: btGkmVORTIOsOqYro0KLbw==
X-CSE-MsgGUID: R1YcoLHNRxCwKNfx54FAsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11412789"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2026 17:27:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUwM3-000000004Rx-37er;
	Sun, 22 Nov 2026 01:26:55 +0000
Date: Sun, 22 Nov 2026 02:26:38 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:for-next 15/16]
 drivers/video/fbdev/core/bitblit.c:94:35: error: no member named 'rotated' in
 'struct fbcon_par'
Message-ID: <20261122015534.liMRwGYt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next
head:   b2595e9adf4d5ea8ab31f3da7bd5ff5b0a479a64
commit: c8d71132c412bc50728c5ec2b8a8c7ab405e132d [15/16] fbcon: Handle characters with no glyph defined in a consistent way
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261122/20261122015534.liMRwGYt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122015534.liMRwGYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122015534.liMRwGYt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/bitblit.c:94:35: error: no member named 'rotated' in 'struct fbcon_par'
      94 |                         src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
         |                                                   ~~~  ^
   drivers/video/fbdev/core/bitblit.c:137:35: error: no member named 'rotated' in 'struct fbcon_par'
     137 |                         src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
         |                                                   ~~~  ^
   2 errors generated.


vim +94 drivers/video/fbdev/core/bitblit.c

    76	
    77	static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
    78					     const u16 *s, u32 attr, u32 cnt,
    79					     u32 d_pitch, u32 s_width, u32 s_vpitch,
    80					     struct fb_image *image,
    81					     unsigned char *buf, u8 *dst)
    82	{
    83		u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
    84		u32 idx = vc->vc_font.width >> 3;
    85		struct fbcon_par *par = info->fbcon_par;
    86		u32 s_pitch = font_glyph_pitch(s_width);
    87		const unsigned char *src;
    88	
    89		while (cnt--) {
    90			u16 ch = scr_readw(s++) & charmask;
    91	
    92			src = font_data_glyph_buf(par->p->fontdata, s_width, s_vpitch, ch);
    93			if (!src) {
  > 94				src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
    95				if (!src)
    96					goto next_char;
    97			}
    98	
    99			if (attr) {
   100				update_attr(buf, src, attr, vc);
   101				src = buf;
   102			}
   103	
   104			if (likely(idx == 1))
   105				__fb_pad_aligned_buffer(dst, d_pitch, src, idx,
   106							image->height);
   107			else
   108				fb_pad_aligned_buffer(dst, d_pitch, src, idx,
   109						      image->height);
   110	next_char:
   111			dst += s_pitch;
   112		}
   113	
   114		info->fbops->fb_imageblit(info, image);
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
