Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6A5143C58;
	Sat, 20 Jul 2024 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721490512; cv=none; b=IdtVu47D53NhW20AAvryIV/g9EkX2drA6tKdDAyeAVbF5aKipWWpgqVvBT1AUaYC9CimrXezweNA9vDcKfJFP+8G2dKB8ARgrWP42dxJYraX93nLmBUQ2zlBN6bNaAZC2qcXNjS1n/j+69SsOBYJAYI5aYk5Q4T841mnchejBKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721490512; c=relaxed/simple;
	bh=KIDAk+Fd9KNkQwDa3xlyqewoxZTenSjmFTjHfKCIgdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rcI4piHqDHgzQW04yGqnxvE6gsRKbpcjmAizbf9Mr5we62H5P5rv44Dx3E/Z8leABERGyoli+RWYUPvdheUYP2NnOTQA46mlNIiKIXUQsuVSrqt5AhnsOTw59Ms/Li9jGd5IM8daIbihJk16Aj1upy2uD6vrSCU2mFhOsaEq2dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkN83PT0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkN83PT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721490511; x=1753026511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIDAk+Fd9KNkQwDa3xlyqewoxZTenSjmFTjHfKCIgdM=;
  b=nkN83PT0ZZlqDyOH/aEu0r7Gl698t71k3dlm6tCy/zH6qwSw2X/urumi
   6qe5+DVdXHskvUtns0aLtNN7MXsQxwqxZHacyXW6ikHl7H67/ArqGXKZ+
   zs7jTjoMfRpyGgMjka5FiqKkawe44SIqDsyDoHVXlwKCCNuGRmntox7DD
   g0gWMx+KkDdx4eNJyt9sLs4O57jbjqxKaxCtAYMpUoYGWqT7FyPSK+9TN
   1THobiHytBY+QbKe9bjam7kPH2Ry0or6ZP670dIUTG7ZY17VszuU7PiXq
   u3LkBb7KeLGfMo6ZMWXOYEFLmIzjtQtjUsGIlbJPiYmXCWvMLGlbCpO+4
   w==;
X-CSE-ConnectionGUID: k6yjuepwSAWqftD31G2lmw==
X-CSE-MsgGUID: wJiZBxuASkq8yB7wu3WRnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="22001642"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="22001642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:48:30 -0700
X-CSE-ConnectionGUID: GPsLmWQOTTuU8QIUqRNpZg==
X-CSE-MsgGUID: nAj59jcGRraUXYcjA3RLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51427955"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jul 2024 08:48:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVCJt-000jLq-16;
	Sat, 20 Jul 2024 15:48:25 +0000
Date: Sat, 20 Jul 2024 23:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [drm-misc:drm-misc-next 1/4] ld.lld: error: duplicate symbol:
 drm_panic_is_enabled
Message-ID: <202407202339.crvKBwVZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   7e33fc2ff6754b5ff39b11297f713cd0841d9962
commit: 9f774c42a908affba615bbed7463dd4f904dd5f1 [1/4] drm/panic: Add drm_panic_is_enabled()
config: i386-buildonly-randconfig-001-20240720 (https://download.01.org/0day-ci/archive/20240720/202407202339.crvKBwVZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202339.crvKBwVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202339.crvKBwVZ-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD 7e33fc2ff6754b5ff39b11297f713cd0841d9962 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_atomic_helper.c:48:
>> drivers/gpu/drm/drm_crtc_internal.h:324:6: warning: no previous prototype for function 'drm_panic_is_enabled' [-Wmissing-prototypes]
     324 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
         |      ^
   drivers/gpu/drm/drm_crtc_internal.h:324:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     324 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
         | ^
         | static 
   1 warning generated.
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_debugfs.c
   >>>            drivers/gpu/drm/drm_debugfs.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_sysfs.c
   >>>            drivers/gpu/drm/drm_sysfs.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_file.c
   >>>            drivers/gpu/drm/drm_file.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_encoder.c
   >>>            drivers/gpu/drm/drm_encoder.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_eld.c
   >>>            drivers/gpu/drm/drm_eld.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_edid.c
   >>>            drivers/gpu/drm/drm_edid.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_dumb_buffers.c
   >>>            drivers/gpu/drm/drm_dumb_buffers.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_drv.c
   >>>            drivers/gpu/drm/drm_drv.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_displayid.c
   >>>            drivers/gpu/drm/drm_displayid.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: drm_panic_is_enabled
   >>> defined at drm_atomic.c
   >>>            drivers/gpu/drm/drm_atomic.o:(drm_panic_is_enabled)
   >>> defined at drm_crtc.c
   >>>            drivers/gpu/drm/drm_crtc.o:(.text+0x0)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
