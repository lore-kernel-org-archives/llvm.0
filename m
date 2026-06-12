Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E47728850E;
	Fri, 12 Jun 2026 02:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781230519; cv=none; b=Jb+K7soBlUw7U7j+1tmttD0TQer6z6Wp4Kj8tr1TUXN7G1HSSlGhQzsXT8NTWc1e0WtlFu21qNkOmVNyXhZaWrhRFFrc0kY5J8U1gxt7hWvlj/Ez+41mOiGyrqkyUoDkCovFHE1751H45DnCtE9mv/l9XqZCa4WDys1fGyYAVCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781230519; c=relaxed/simple;
	bh=Oy85sK2Gn+Zq/RhyB1hdWZcoNF2HzoKYEyRUhJRFs98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y303xFYBjAkbWE2z4Fswl12+O2pqQeC/Pgg/3OmxFKuhwI7NTYavS91OQ5IBpqXdoABltjtiDf0tDJcwi/OCFUgJGcIYrxLYiB7HbVFILvqxJ3n6JdMW3CNf/xioB2ZsSpGvrLN/U59S3XUYvpTquJH2O84b49Jets7IyozrKzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZOj8YM7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZOj8YM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781230518; x=1812766518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oy85sK2Gn+Zq/RhyB1hdWZcoNF2HzoKYEyRUhJRFs98=;
  b=BZOj8YM74ijlipHZsUpBavBRbcXLHeDp2kKWdrre+VLvzTgdLoMA3IDO
   8gtpAmnJx3bDVSlhscnKKM+jdwJLqou8gmOiAfHjtYg3I6q9+evFWPyLi
   ul4SGPTPp9Fg0HAbRQN3ZeqdxSFav1kbZaOOYI2ddal8FSyCR3HljsKau
   Y6QDAI2XJ4uWMdaY/jMaa5mceylt8Q/LsFlFLAkE9mf809fExqgMzL4rp
   MvIgQcDK9zwGGpfh7OR4i+tC6QVNi4Yjoj4bP0RsvKDOibkHKyJuZF8Kj
   eYjWA9ZGmJSbOXJ7NWztL+WbejyDjAL8bMSgyo9XhLLebY9vcvxl8taOg
   Q==;
X-CSE-ConnectionGUID: 9lUhxyQ6Ss6YmBOdBZxipA==
X-CSE-MsgGUID: 03G2rEc2S36RVeBJeyXg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82105569"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82105569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 19:15:15 -0700
X-CSE-ConnectionGUID: mm4dzS0QSW6s/fPGsfAEfA==
X-CSE-MsgGUID: 6WGDJgrGTeaYkwKunTwo6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251641450"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2026 19:15:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXrQK-00000000OA8-0VEK;
	Fri, 12 Jun 2026 02:15:08 +0000
Date: Fri, 12 Jun 2026 10:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <ehristev@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Eugen Hristev <ehristev@kernel.org>
Subject: Re: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
Message-ID: <202606121013.RsnqIwho-lkp@intel.com>
References: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>

Hi Eugen,

kernel test robot noticed the following build errors:

[auto build test ERROR on a87737435cfa134f9cdcc696ba3080759d04cf72]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/media-bcm2835-unicam-Fix-querycap-multiple-caps/20260611-141320
base:   a87737435cfa134f9cdcc696ba3080759d04cf72
patch link:    https://lore.kernel.org/r/20260611-bcmpiqcap-v1-1-10cf7fb438df%40kernel.org
patch subject: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260612/202606121013.RsnqIwho-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121013.RsnqIwho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121013.RsnqIwho-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/broadcom/bcm2835-unicam.c:33:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/media/platform/broadcom/bcm2835-unicam.c:1836:20: error: use of undeclared identifier 'node'
    1836 |         if (is_image_node(node))
         |                           ^
   1 warning and 1 error generated.


vim +/node +1836 drivers/media/platform/broadcom/bcm2835-unicam.c

  1825	
  1826	/* -----------------------------------------------------------------------------
  1827	 *  V4L2 video device operations
  1828	 */
  1829	
  1830	static int unicam_querycap(struct file *file, void *priv,
  1831				   struct v4l2_capability *cap)
  1832	{
  1833		strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
  1834		strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
  1835	
> 1836		if (is_image_node(node))
  1837			cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
  1838		else
  1839			cap->capabilities |= V4L2_CAP_META_CAPTURE;
  1840	
  1841		return 0;
  1842	}
  1843	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
