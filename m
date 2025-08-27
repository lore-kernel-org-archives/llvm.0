Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5EC269AE9;
	Wed, 27 Aug 2025 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756312387; cv=none; b=hqRiIISgZ9c+0TOvCkAZzDtLdnidZpknHBqGgefQu7tzYQNz6gJf4vrsw1b/VynPao1D/LPZLFz1cF9duCUYEQ3sH08/4JlgCLeFTD5I5yu+fTSBAwWGgm3FSskge9cBQjfla9rEaN3o1jTpQU2HM/QeQbGu4LCtARHN/uKQ9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756312387; c=relaxed/simple;
	bh=tnTA/PNxi7uOQgEmoAZ2b1rNPAWX95IlTIWABbktj2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbSli23GtQ6Fp/mRt7HCxZvQBT7805CuIOBmn5oa0J0hWMqlbTvnpcTbajWM5Y8IOhcDCevA4dew9hF/XnDqg55dXxEu6pNkklNZEINnwtlx8WGC7y0W3UFM4iURitho300NVhDIpp4+ABW+IWDFg9SEWmEfdAXtBDSmb8KPTng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apQS+cdA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apQS+cdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756312383; x=1787848383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tnTA/PNxi7uOQgEmoAZ2b1rNPAWX95IlTIWABbktj2E=;
  b=apQS+cdA3jx7PHRUjRPblci18MuG+w+WIrlPnBiyqLx4iZkMElIIq9ho
   ldabFk1G7CuUsXuzyp1uhR4iOQYeAMDpK/a6zHEz4zWwogoPoszgqkHV+
   jwNJ7jsxsX0+10KnxDy3yEiOpeNSMzNe7YE+nUcfJy1BL7bm9QZuZKTlQ
   rtMWXcqrJzr6dNThNOUyJWE58bv4M8sGVCXzxRYtdUwmrOJ14tuONXEen
   1vJz+Y9ollBrVc/Cp3otYiAYpPGxbMMNVqnRuxpiCOYMkuqy0GwBkvFkf
   NWc0LAjgcCiO4nnXKNsgVz3Bqxq7JJjU+HotdVZvFbhhnct31ZUG3GISi
   w==;
X-CSE-ConnectionGUID: bBPWyrDlQI6mXMWfsxLawA==
X-CSE-MsgGUID: ssXlODGVQwi+PLV/vbMexA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69939969"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69939969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 09:33:01 -0700
X-CSE-ConnectionGUID: rsYzn5mVRVy6Xw1pxl621w==
X-CSE-MsgGUID: LXp69DIGTUqK7FFQVmGRRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170708925"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Aug 2025 09:32:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urJ4T-000T4N-1n;
	Wed, 27 Aug 2025 16:32:49 +0000
Date: Thu, 28 Aug 2025 00:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/5] media: nxp: imx8-isi: Simplify code by using helper
 macro
Message-ID: <202508280040.QKK6nZ3x-lkp@intel.com>
References: <20250827-isi_imx93-v1-2-83e6b4b50c4d@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-isi_imx93-v1-2-83e6b4b50c4d@nxp.com>

Hi Guoniu,

kernel test robot noticed the following build errors:

[auto build test ERROR on a75b8d198c55e9eb5feb6f6e155496305caba2dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Guoniu-Zhou/media-dt-bindings-nxp-imx8-isi-Add-i-MX91-ISI-compatible-string/20250827-175809
base:   a75b8d198c55e9eb5feb6f6e155496305caba2dc
patch link:    https://lore.kernel.org/r/20250827-isi_imx93-v1-2-83e6b4b50c4d%40nxp.com
patch subject: [PATCH 2/5] media: nxp: imx8-isi: Simplify code by using helper macro
config: riscv-randconfig-002-20250827 (https://download.01.org/0day-ci/archive/20250828/202508280040.QKK6nZ3x-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280040.QKK6nZ3x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280040.QKK6nZ3x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c:36:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      36 |         val = GASKET_CTRL_DATA_TYPE(fd->entry[0].bus.csi2.dt);
         |               ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c:19:36: note: expanded from macro 'GASKET_CTRL_DATA_TYPE'
      19 | #define GASKET_CTRL_DATA_TYPE(dt)               FIELD_PREP(GENMASK(13, 8), (dt))
         |                                                 ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c:70:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      70 |         val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
         |               ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c:60:49: note: expanded from macro 'DISP_MIX_CAMERA_MUX_DATA_TYPE'
      60 | #define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
         |                                                 ^
   2 errors generated.


vim +/FIELD_PREP +36 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c

f48498ad0a4106e Guoniu.zhou 2023-06-29  25  
f48498ad0a4106e Guoniu.zhou 2023-06-29  26  static void mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
f48498ad0a4106e Guoniu.zhou 2023-06-29  27  				   const struct v4l2_mbus_frame_desc *fd,
f48498ad0a4106e Guoniu.zhou 2023-06-29  28  				   const struct v4l2_mbus_framefmt *fmt,
f48498ad0a4106e Guoniu.zhou 2023-06-29  29  				   const unsigned int port)
f48498ad0a4106e Guoniu.zhou 2023-06-29  30  {
f48498ad0a4106e Guoniu.zhou 2023-06-29  31  	u32 val;
f48498ad0a4106e Guoniu.zhou 2023-06-29  32  
f48498ad0a4106e Guoniu.zhou 2023-06-29  33  	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE, fmt->width);
f48498ad0a4106e Guoniu.zhou 2023-06-29  34  	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE, fmt->height);
f48498ad0a4106e Guoniu.zhou 2023-06-29  35  
f48498ad0a4106e Guoniu.zhou 2023-06-29 @36  	val = GASKET_CTRL_DATA_TYPE(fd->entry[0].bus.csi2.dt);
f48498ad0a4106e Guoniu.zhou 2023-06-29  37  	if (fd->entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
f48498ad0a4106e Guoniu.zhou 2023-06-29  38  		val |= GASKET_CTRL_DUAL_COMP_ENABLE;
f48498ad0a4106e Guoniu.zhou 2023-06-29  39  
f48498ad0a4106e Guoniu.zhou 2023-06-29  40  	val |= GASKET_CTRL_ENABLE;
f48498ad0a4106e Guoniu.zhou 2023-06-29  41  	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
f48498ad0a4106e Guoniu.zhou 2023-06-29  42  }
f48498ad0a4106e Guoniu.zhou 2023-06-29  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
