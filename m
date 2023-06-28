Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F7BA923;
	Wed, 28 Jun 2023 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687978014; x=1719514014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1CN8Q/5r/FFePJl54pKbSgDC9Hrr/L46Q/P9NSB4QKY=;
  b=JnsGEuxsm41JOcT6IMbUff9khQrioRV14M67xbCdM/1pVHbye0WmEke0
   U8XS28p5NpbevgJ+n3jFBbs/Fcx3y23+3X6A+hqTgxfENUx/Pz8cHgxJ3
   U/rqjiFlZOGlHA9WD6s40J4mS9dpvPZnP85xTSmryWUrmYriF+P8cun5+
   a0+IIFA4Gfz3Y7s9NsBgBP25u3a5ZMwjk5QF/WbmcA+l8ZlX6Nz5GSXey
   2vbB/r5gn6EXn1BJfkUXkgANTrwiKjAk9JgUKd5aMVmwQpM39/doNn6pn
   XtFOx+154nTAJsU/vbe0dieKT1wC31Lg1QDCbk6Tclaxnh0z4rR6jazB2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351721416"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="351721416"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 11:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="782400315"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="782400315"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jun 2023 11:46:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEaBm-000DRJ-2T;
	Wed, 28 Jun 2023 18:46:50 +0000
Date: Thu, 29 Jun 2023 02:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 4888/4896]
 drivers/video/fbdev/imsttfb.c:1457:3: error: void function 'init_imstt'
 should not return a value
Message-ID: <202306290259.KMN4oRNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: 8f05ae0e3fdd533865dbd1b0b2632986c0706a50 [4888/4896] fbdev: imsttfb: Release framebuffer and dealloc cmap on error path
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230629/202306290259.KMN4oRNH-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290259.KMN4oRNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290259.KMN4oRNH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/imsttfb.c:1457:3: error: void function 'init_imstt' should not return a value [-Wreturn-type]
                   return -ENODEV;
                   ^      ~~~~~~~
   1 error generated.


vim +/init_imstt +1457 drivers/video/fbdev/imsttfb.c

  1418	
  1419		if ((info->var.xres * info->var.yres) * (info->var.bits_per_pixel >> 3) > info->fix.smem_len
  1420		    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres))) {
  1421			printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->var.yres, info->var.bits_per_pixel);
  1422			framebuffer_release(info);
  1423			return;
  1424		}
  1425	
  1426		sprintf(info->fix.id, "IMS TT (%s)", par->ramdac == IBM ? "IBM" : "TVP");
  1427		info->fix.mmio_len = 0x1000;
  1428		info->fix.accel = FB_ACCEL_IMS_TWINTURBO;
  1429		info->fix.type = FB_TYPE_PACKED_PIXELS;
  1430		info->fix.visual = info->var.bits_per_pixel == 8 ? FB_VISUAL_PSEUDOCOLOR
  1431								: FB_VISUAL_DIRECTCOLOR;
  1432		info->fix.line_length = info->var.xres * (info->var.bits_per_pixel >> 3);
  1433		info->fix.xpanstep = 8;
  1434		info->fix.ypanstep = 1;
  1435		info->fix.ywrapstep = 0;
  1436	
  1437		info->var.accel_flags = FB_ACCELF_TEXT;
  1438	
  1439	//	if (par->ramdac == IBM)
  1440	//		imstt_cursor_init(info);
  1441		if (info->var.green.length == 6)
  1442			set_565(par);
  1443		else
  1444			set_555(par);
  1445		set_imstt_regvals(info, info->var.bits_per_pixel);
  1446	
  1447		info->var.pixclock = 1000000 / getclkMHz(par);
  1448	
  1449		info->fbops = &imsttfb_ops;
  1450		info->flags = FBINFO_DEFAULT |
  1451	                      FBINFO_HWACCEL_COPYAREA |
  1452		              FBINFO_HWACCEL_FILLRECT |
  1453		              FBINFO_HWACCEL_YPAN;
  1454	
  1455		if (fb_alloc_cmap(&info->cmap, 0, 0)) {
  1456			framebuffer_release(info);
> 1457			return -ENODEV;
  1458		}
  1459	
  1460		if (register_framebuffer(info) < 0) {
  1461			fb_dealloc_cmap(&info->cmap);
  1462			framebuffer_release(info);
  1463			return;
  1464		}
  1465	
  1466		tmp = (read_reg_le32(par->dc_regs, SSTATUS) & 0x0f00) >> 8;
  1467		fb_info(info, "%s frame buffer; %uMB vram; chip version %u\n",
  1468			info->fix.id, info->fix.smem_len >> 20, tmp);
  1469	}
  1470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
