Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB4314F6E;
	Sat,  9 Dec 2023 22:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4CLcuFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702160557; x=1733696557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jQVI10ojt2pNa2p7oTrsLX7J984azRT0H87VfWxIKKE=;
  b=b4CLcuFvPkv9Aj63seidTGIpNGqifGlqj9Y86IX1q6RK8LUHHkYYm69x
   VFzncA1YUaVfitCLsI+179etJBtrH9lTTt+8h1QzNRfhh3LdxwlyDZ5Yr
   G8148Y58/9w74tomOUGWe5G4I3dzXdCAwYtXBeUqEUNTlYYYumn1jgVam
   ZD5sMtI5g7gQBr3/IfFhJCCEost1bZDRQIzDNURtT+fqpZHmsddZALaG9
   WfR1VxeWFOZTmrPVm+xwLuIghF92oqig7hKWY5SMRbQUXN08UoknG7xp3
   4IiQ7g3DLmEplQtZMJmbQyuyPb3+X144Qc+GxYttUuT2ZTUcvQEGo/JjA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1345040"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1345040"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 14:22:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="748729927"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="748729927"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Dec 2023 14:17:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC5dk-000G1Z-0B;
	Sat, 09 Dec 2023 22:17:40 +0000
Date: Sun, 10 Dec 2023 06:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	kernel@collabora.com
Subject: Re: [PATCH v2] usb: gadget: webcam: Make g_webcam loadable again
Message-ID: <202312100602.sdYTHOg1-lkp@intel.com>
References: <20231208131342.65671-1-andrzej.p@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208131342.65671-1-andrzej.p@collabora.com>

Hi Andrzej,

kernel test robot noticed the following build errors:

[auto build test ERROR on 33cc938e65a98f1d29d0a18403dbbee050dcad9a]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrzej-Pietrasiewicz/usb-gadget-webcam-Make-g_webcam-loadable-again/20231208-211513
base:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
patch link:    https://lore.kernel.org/r/20231208131342.65671-1-andrzej.p%40collabora.com
patch subject: [PATCH v2] usb: gadget: webcam: Make g_webcam loadable again
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231210/202312100602.sdYTHOg1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312100602.sdYTHOg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100602.sdYTHOg1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/legacy/webcam.c:224:36: error: initializer element is not a compile-time constant
     224 |                 .b_length                       = uvc_frame_yuv_360p.bLength,
         |                                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/usb/gadget/legacy/webcam.c:263:36: error: initializer element is not a compile-time constant
     263 |                 .b_length                       = uvc_frame_yuv_720p.bLength,
         |                                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/usb/gadget/legacy/webcam.c:332:37: error: initializer element is not a compile-time constant
     332 |                 .b_length                       = uvc_frame_mjpg_360p.bLength,
         |                                                   ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/usb/gadget/legacy/webcam.c:371:37: error: initializer element is not a compile-time constant
     371 |                 .b_length                       = uvc_frame_mjpg_720p.bLength,
         |                                                   ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   4 errors generated.


vim +224 drivers/usb/gadget/legacy/webcam.c

   220	
   221	static const struct uvcg_frame uvcg_frame_yuv_360p = {
   222		.fmt_type		= UVCG_UNCOMPRESSED,
   223		.frame = {
 > 224			.b_length			= uvc_frame_yuv_360p.bLength,
   225			.b_descriptor_type		= uvc_frame_yuv_360p.bDescriptorType,
   226			.b_descriptor_subtype		= uvc_frame_yuv_360p.bDescriptorSubType,
   227			.b_frame_index			= uvc_frame_yuv_360p.bFrameIndex,
   228			.bm_capabilities		= uvc_frame_yuv_360p.bmCapabilities,
   229			.w_width			= uvc_frame_yuv_360p.wWidth,
   230			.w_height			= uvc_frame_yuv_360p.wHeight,
   231			.dw_min_bit_rate		= uvc_frame_yuv_360p.dwMinBitRate,
   232			.dw_max_bit_rate		= uvc_frame_yuv_360p.dwMaxBitRate,
   233			.dw_max_video_frame_buffer_size	= uvc_frame_yuv_360p.dwMaxVideoFrameBufferSize,
   234			.dw_default_frame_interval	= uvc_frame_yuv_360p.dwDefaultFrameInterval,
   235			.b_frame_interval_type		= uvc_frame_yuv_360p.bFrameIntervalType,
   236		},
   237		.dw_frame_interval	= (u32 *)uvc_frame_yuv_360p.dwFrameInterval,
   238	};
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
