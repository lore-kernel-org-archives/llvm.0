Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC0221F04;
	Fri, 18 Jul 2025 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831292; cv=none; b=WrqIen+0JUWW/G5D5nhMU7T7oJTS7e3geudHFKGMD10gVhPQOIPG75UVpuP+heZnOC1KLCJSmPh2rAws+2VL7yDTri4jBnss+uO7aWqF02rJxANiSTjUnMhsRWZtE3P6zKwRIzoE3fKJm2oUE1B32LVhp7LA1Wn2TYiNILT/cjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831292; c=relaxed/simple;
	bh=IRZ6eW/IHF7BaJPyLxlRyPGJhIBXJU4DVyfIU35NfdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+1vVOIGQJQpTLomO2SPeZsZOf2nbhtJ6pOscphcr4dZEHG6oUDzvk4zW7yKhKi7q4VjAyVoUbOoz17VoG8L8CXMcoi1APqk+Gssv94miFT/YSldsyv9vJs4ay6QezuSjGnkRyjPCQ0BKJquYlZqQ7zI8NAjjY6q2ispCgi/odQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DE2Rp8tW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DE2Rp8tW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752831291; x=1784367291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IRZ6eW/IHF7BaJPyLxlRyPGJhIBXJU4DVyfIU35NfdA=;
  b=DE2Rp8tW5fQyi7w/6CIzDvxlBoFN60Csfa2OaXzCT2rOobWGKS1IkWmV
   lmKAiRUJ9FH8gTwpWUiH0q1z+GfBKv+UEAUIj9lrbUxq+elBIbb/SV1wG
   nTW9uK6CpgdAw9Sv2w7hR2clY9tSzYncTLiqkPlSh9Qtwb10DBssbN2Gq
   h4szxrqbZu4+mhGB81LI6+UbCETrYwcXOV88LLVjDLDu8YNgxs109/v0e
   M0Xfwf3hkeQ3wqOUU0geX5RlUgOKUI9hp5fPQVEFmDenEzERvoK3nm/6T
   FxAqfBQKp1AJhGUs5MK7no1xTnaXhpBAGXRmYYVVWMelmQpypVrA4Ldql
   g==;
X-CSE-ConnectionGUID: V2cKRzZWRYW2CoIqs+oEdw==
X-CSE-MsgGUID: kJkEA6B2RS2SzwvIUQsN2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="42745802"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="42745802"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 02:34:51 -0700
X-CSE-ConnectionGUID: 0Fen4lgZRp6H3IhGQ8OvOQ==
X-CSE-MsgGUID: SFl6ENtfTHm7C6s1bpaAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="158096101"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jul 2025 02:34:46 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uchUJ-000EVf-34;
	Fri, 18 Jul 2025 09:34:43 +0000
Date: Fri, 18 Jul 2025 17:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 09/26] media: v4l2-dev: Add
 video_device_context_from_file()
Message-ID: <202507181702.W5iinHRF-lkp@intel.com>
References: <20250717-multicontext-mainline-2025-v1-9-81ac18979c03@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-multicontext-mainline-2025-v1-9-81ac18979c03@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d968e50b5c26642754492dea23cbd3592bde62d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-mc-Add-per-file-handle-data-support/20250717-190546
base:   d968e50b5c26642754492dea23cbd3592bde62d8
patch link:    https://lore.kernel.org/r/20250717-multicontext-mainline-2025-v1-9-81ac18979c03%40ideasonboard.com
patch subject: [PATCH 09/26] media: v4l2-dev: Add video_device_context_from_file()
config: x86_64-buildonly-randconfig-004-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181702.W5iinHRF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181702.W5iinHRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181702.W5iinHRF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-dev.c:1184:1: warning: no previous prototype for function 'video_device_context_from_file' [-Wmissing-prototypes]
    1184 | video_device_context_from_file(struct file *filp, struct video_device *vfd)
         | ^
   drivers/media/v4l2-core/v4l2-dev.c:1183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1183 | struct video_device_context *
         | ^
         | static 
   1 warning generated.


vim +/video_device_context_from_file +1184 drivers/media/v4l2-core/v4l2-dev.c

  1182	
  1183	struct video_device_context *
> 1184	video_device_context_from_file(struct file *filp, struct video_device *vfd)
  1185	{
  1186		struct v4l2_fh *vfh =
  1187			test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? filp->private_data
  1188								    : NULL;
  1189	
  1190		/* If the file handle has been bound to a context return it. */
  1191		if (vfh && vfh->context)
  1192			return vfh->context;
  1193	
  1194		return vfd->default_context;
  1195	}
  1196	EXPORT_SYMBOL_GPL(video_device_context_from_file);
  1197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
