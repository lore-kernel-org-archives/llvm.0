Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983D61C13;
	Sun,  4 Feb 2024 03:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707016122; cv=none; b=fB1EKiF9tbS8DWuBZblmU3GH3GBCeISJhz3b/+K9uYXd3DbXMSxTII4dxGsTSSk0ukOvI8U+HcfS+9lAhLHj7na295KWx8t4YlvbFSCD8GPyMN5YTn3oKs/RrJzoaAZsKoLeOfF94sfxGFKJLbYbEO6yQfar980Nq99hxncZeGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707016122; c=relaxed/simple;
	bh=AVOnidsQjxYMHyui+RNWlebf4vVrm6wMvKHzEC6L5Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOkI8jyfhmixpPJcaKvns0+665EuhBO71RBt7i/0j6Pn52eyqn3ZH0bXeBlnJF31mvXndx8LHV01uXi6/GshT15EiKSOVyhF882Pua/s1DkLBR5fv94FtjVaZoFuZGK1/Ca+DyGA3ICp5YefTV87dFTE4mSyqYRCzB9Gx9N1xOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzKWIZcm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzKWIZcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707016121; x=1738552121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AVOnidsQjxYMHyui+RNWlebf4vVrm6wMvKHzEC6L5Vk=;
  b=gzKWIZcm1ZmYUtgok8XgKzjYPxKUqVjjf8sySJGQN8p4qxiJSl3uwSc9
   a3tyHiRmViCdZOGAEDgYj2kPaHq27mS0/I5SwTtMDjoeOsOgPuPWVJzz2
   pN7fAxMYywzSG1PKII3qwPWU2Wl0vzpLn4+r3pNh2NlikZ2EOHKGKsKEJ
   +61q8/b00um8x1HYrcZVFJCXYiW/gkobqE8I1a9Q4KQTYc1f+sv4qD2gb
   2f75oBYnKkwMW2n/oJ3KWroEt0KjRSdaxlB2RHHT3Z5zKJG+LIyyhBWh2
   ynaP7yxE06HYBzmFoqNXNGauzOmlDEys1RAAuEF3AsoQB33bsMR3qKKf7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="518484"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="518484"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 19:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="23679473"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2024 19:08:39 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWSs0-0005wE-36;
	Sun, 04 Feb 2024 03:08:36 +0000
Date: Sun, 4 Feb 2024 11:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.6.y 17/51]
 drivers/gpu/drm/tiny/ili9488_pio.c:23:10: fatal error:
 'drm/drm_fb_cma_helper.h' file not found
Message-ID: <202402041118.Pte11TkB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   0ea9759612aba09cc99b50301b281417f70e847c
commit: d9d97a57ca4c689c91ba8d0ca0af61187dbe19f1 [17/51] ODROID-COMMON: gpu/drm: Add new Tiny DRM driver with Ili9488
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240204/202402041118.Pte11TkB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041118.Pte11TkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041118.Pte11TkB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/ili9488_pio.c:23:10: fatal error: 'drm/drm_fb_cma_helper.h' file not found
      23 | #include <drm/drm_fb_cma_helper.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +23 drivers/gpu/drm/tiny/ili9488_pio.c

    19	
    20	#include <drm/drm_atomic_helper.h>
    21	#include <drm/drm_damage_helper.h>
    22	#include <drm/drm_drv.h>
  > 23	#include <drm/drm_fb_cma_helper.h>
    24	#include <drm/drm_fb_helper.h>
    25	#include <drm/drm_fourcc.h>
    26	#include <drm/drm_gem_atomic_helper.h>
    27	#include <drm/drm_gem_cma_helper.h>
    28	#include <drm/drm_gem_framebuffer_helper.h>
    29	#include <drm/drm_managed.h>
    30	#include <drm/drm_mipi_dbi.h>
    31	#include <drm/drm_rect.h>
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
