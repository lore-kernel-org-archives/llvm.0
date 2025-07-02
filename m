Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD03E275B1D;
	Wed,  2 Jul 2025 13:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463440; cv=none; b=pGF20Xv/4M1DL2GLQGNIlyZh1WjrCZ/CWRgSSAcfYuoHPK45KSKuvjPuTFGADQ+4P9Xik1azsZxyKQoQanbrQvVGgyDI/UNXWAZ5DiBn6cJtsOQM0RFMM/dxjHBvCPud9lTIhKBK4KhI68eNUcX3DczzcvBxf2G3NcVn3I8ju3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463440; c=relaxed/simple;
	bh=s9gOzfm57ApnogRzuX4Eeuc2bvXSAcImho9OrvtTqg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kwuhaTW9QWMby6eWOMvWK/hsBfQd9mJqDNnQGzkQ3n+sz2b4PQMfr3IbOwNxdgilT9T1XwUoULgfEEYSm93pNKVqSnDjnCutqu+MBEir/4XvDS8w7rkyDfj8waDdkCoswhM8FQvgWNx0J/5Lh9J0Ej+CyQ3+uemoLQXKxS4Dlhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h59fEXM1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h59fEXM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751463438; x=1782999438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s9gOzfm57ApnogRzuX4Eeuc2bvXSAcImho9OrvtTqg0=;
  b=h59fEXM1F99MsVx2BGnbZAdmZ/VQYG/yPHUwTBBrOrc5iRh9DI1i8h8G
   VTAl5qgZzpxe2L//004NQV6dGvwgc7rG8ThB29xtx+d1oFTMMzOyd3f4R
   hXIU1TZGNGf3wVNL+o9Qz/bgt5PhFiryQokQp3HGI1n6ajBVFYdTMZp4e
   drn+cuS6JwDhRwhMhij9R1ED6T/+uUtHg6sglF36csir7/S98JPVWTlTE
   Owq8nGLmfDfucnuJbRx0ks7467w68ZBnkLZIWU1Yp0myNCJmjWXrL6e0U
   7QE5yr42qoJNUWJ4YDNLGM3vLXZ3zuexl6xNlMbS00nj6nB2xUDe3isdF
   Q==;
X-CSE-ConnectionGUID: t/ZOqhrfQUioCEnTA55MzA==
X-CSE-MsgGUID: HqOJJpllR4mQDTW4JVSKNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53852805"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53852805"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:37:18 -0700
X-CSE-ConnectionGUID: +2rgUT1TQkaBa3itLnyMXg==
X-CSE-MsgGUID: RGsc5t8FTeGNkmyHI70u3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153852318"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jul 2025 06:37:17 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWxeE-0000fj-1v;
	Wed, 02 Jul 2025 13:37:14 +0000
Date: Wed, 2 Jul 2025 21:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6351/6656] Warning: security/landlock/fs.c:1107
 function parameter 'mnt_dir' not described in 'collect_domain_accesses'
Message-ID: <202507022103.mioAq8cY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   50c8770a42faf8b1c7abe93e7c114337f580a97d
commit: 4a2e8dc023bce5931f3e6ef3efdb7c07ebb2cdbc [6351/6656] landlock: Fix handling of disconnected directories
config: arm-randconfig-001-20250702 (https://download.01.org/0day-ci/archive/20250702/202507022103.mioAq8cY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022103.mioAq8cY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022103.mioAq8cY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: security/landlock/fs.c:764 Invalid param: layer_mask_t (*const layer_masks_parent1)[LANDLOCK_NUM_ACCESS_FS]
   Warning: security/landlock/fs.c:764 function parameter 'layer_mask_t (*const layer_masks_parent1' not described in 'is_access_to_paths_allowed'
   Warning: security/landlock/fs.c:764 Invalid param: layer_mask_t (*const layer_masks_parent2)[LANDLOCK_NUM_ACCESS_FS]
   Warning: security/landlock/fs.c:764 function parameter 'layer_mask_t (*const layer_masks_parent2' not described in 'is_access_to_paths_allowed'
>> Warning: security/landlock/fs.c:1107 function parameter 'mnt_dir' not described in 'collect_domain_accesses'
   Warning: security/landlock/fs.c:1107 Invalid param: layer_mask_t (*const layer_masks_dom)[LANDLOCK_NUM_ACCESS_FS]
   Warning: security/landlock/fs.c:1107 function parameter 'layer_mask_t (*const layer_masks_dom' not described in 'collect_domain_accesses'
>> Warning: security/landlock/fs.c:1107 Excess function parameter 'mnt_root' description in 'collect_domain_accesses'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
