Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B74F2C21D4;
	Fri, 17 Oct 2025 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724002; cv=none; b=OI2xiVTVecxX3JOZIq5sKlZhuLu4/kSwPX6NYuggNuW5VYQf9YoHY/G/E1B/pfReT5GWuE8agj7gtWyLwL/NIHmUGI4DbCFCTb/dLH/evxhtacpsJpIHCvdX2wcWvWmEexd+j+8mskQSmckwDHUV2UA+8cqtdBTWwwLF60WoSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724002; c=relaxed/simple;
	bh=LEtyC+7q5/xhjrN5IbnszuxPD8yZhrzF6h8sqjJeKFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pONBmGcZAwhH8VQ/u1jVyqF4ymzk2LSC5F6YjXQ9N7GN3tuJ06V8p1mnnywcjZKpRIYjjeler7cU15nkqV4RsKQXKmv+AL4vdJ37/QkSJA4xl2c1vfft7WypiEjbj/KbLZfRYv7/YPC0E//iT8dXIhXBK+oHW38uvAMNesp0zmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXdIkXvw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXdIkXvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760724001; x=1792260001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEtyC+7q5/xhjrN5IbnszuxPD8yZhrzF6h8sqjJeKFc=;
  b=WXdIkXvwKSQillAOuP1z2tWyrxmFjMPkEkpZG32YJaAUgJZQgCMl2uYK
   OXg9nNAp3UqNRGYyTpaesrG36YGWyobiTNHjsIYeyEwa53P4+LiiHyyxH
   5obhz+3DT630NZpu22zJGdpq6CbbHH1F4gtirC7yzKyHMnMc77D0/pJxa
   K7Tgrk5fAUmvkt4YQmiktKqLy9xPSLGWIb7QjgEu64dD9sn8V1ZzkrCuQ
   SkyMtfQqEj9hvbSUauKUpkmL1fd+RnK3aqU0YAj7ap8ofc9e0/zSmMZO4
   YQrJo7iCSsQ8cYecRfgT9PJUK5ftBE73+NgNNO+vnSqn7lYYjhVFtHVr2
   w==;
X-CSE-ConnectionGUID: iy/khNhST7OJCoF/hg9NGw==
X-CSE-MsgGUID: 3xiWQjvhSvydrcSX6BsLPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62843318"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="62843318"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 11:00:00 -0700
X-CSE-ConnectionGUID: p37q7bUxQG+SiOCZ40zANg==
X-CSE-MsgGUID: YLGvCnoXS26Xx5E72zbI3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="182490150"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2025 10:59:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9ok4-0007cv-0e;
	Fri, 17 Oct 2025 17:59:53 +0000
Date: Sat, 18 Oct 2025 01:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v5 3/3] drivers/accel/ethosu/ethosu_device.h:192:9:
 error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510180142.1WiqZ3WK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v5
head:   b0387da0b7877bc9e120bfc20df0c73623c596c9
commit: b0387da0b7877bc9e120bfc20df0c73623c596c9 [3/3] accel: Add Arm Ethos-U NPU driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251018/202510180142.1WiqZ3WK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180142.1WiqZ3WK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180142.1WiqZ3WK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/ethosu/ethosu_gem.c:9:
>> drivers/accel/ethosu/ethosu_device.h:192:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     192 |         return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosudev->npu_info.id) == 1;
         |                ^
   In file included from drivers/accel/ethosu/ethosu_gem.c:10:
   In file included from drivers/accel/ethosu/ethosu_gem.h:8:
   In file included from include/drm/drm_gem_dma_helper.h:5:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/accel/ethosu/ethosu_gem.c:10:
   In file included from drivers/accel/ethosu/ethosu_gem.h:8:
   In file included from include/drm/drm_gem_dma_helper.h:5:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/accel/ethosu/ethosu_gem.c:10:
   In file included from drivers/accel/ethosu/ethosu_gem.h:8:
   In file included from include/drm/drm_gem_dma_helper.h:5:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/accel/ethosu/ethosu_gem.c:10:
   In file included from drivers/accel/ethosu/ethosu_gem.h:8:
   In file included from include/drm/drm_gem_dma_helper.h:5:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/accel/ethosu/ethosu_gem.c:10:
   In file included from drivers/accel/ethosu/ethosu_gem.h:8:
   In file included from include/drm/drm_gem_dma_helper.h:5:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/accel/ethosu/ethosu_gem.c:10:
   In file included from drivers/accel/ethosu/ethosu_gem.h:8:
   In file included from include/drm/drm_gem_dma_helper.h:5:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/accel/ethosu/ethosu_gem.c:10:
   In file included from drivers/accel/ethosu/ethosu_gem.h:8:
   In file included from include/drm/drm_gem_dma_helper.h:5:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:


vim +/FIELD_GET +192 drivers/accel/ethosu/ethosu_device.h

   186	
   187	#define to_ethosu_device(drm_dev) \
   188		((struct ethosu_device *)container_of(drm_dev, struct ethosu_device, base))
   189	
   190	static inline bool ethosu_is_u65(const struct ethosu_device *ethosudev)
   191	{
 > 192		return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosudev->npu_info.id) == 1;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
