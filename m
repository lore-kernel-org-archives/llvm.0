Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911701C1F02;
	Wed,  9 Jul 2025 21:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752097767; cv=none; b=KbV3jvz1oLBYeZ0NE+5AOtGHJsHk2hm+vxSzLnBsXsx873rGNquCDD8/AE/2RSCR+KXxAKMN4ZIoKuMOhOSDNnjt1W7SKcmd0z53222ZyYmtVmJNTxjtYTCWaBpNA/2BwQQ6JH0VLsvK+CqcsYJiFT6WhhJYljD1NuWieRDOZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752097767; c=relaxed/simple;
	bh=hlJaBkqV/lAvFuI4327SMMuFMXtqDJ/zJG6qSod6eNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HU1OZE7g0Vx7wtEATSvXBd5j2ZkrVRM0LjBsCpBLiLP6RVEtvcPTGImbpupPs5F1ECna4G2uzOmw9vnHJU1Bek+1Mjg9aJwWMJeupIGEHVDLsQxJ6OAcy5j7B5aV/HAVsFwCElwjMmj2UeF4MbnebQEZJIJcsxJ7QYdzcsuNSBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgjeieCZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgjeieCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752097766; x=1783633766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hlJaBkqV/lAvFuI4327SMMuFMXtqDJ/zJG6qSod6eNw=;
  b=VgjeieCZclS8NABJyXhvgQDD6qH1G8Dm1k5mE3fpneSIufFBlK5yd104
   Xr9VvsIhsiYaZRl5QJ49cmkjj1zK1z/wEHy/QzzoeY6ApMUHfgtoyHhOb
   3i8+32Oe6N12bAJSs61ifYeqqq6v6HHZUD+Ua2oH1BaQdOyKNRrbvQ83H
   sr1dZZ6lfhvvp3BWNEIE63klME7GdJrlyfHk0zn7EnjHhy/RXAPHrrxSI
   lr7K0RaPYYOlNrke7rYkgdRjLezzS8B0gODxR6SoBUWb48UKdyPJRrI22
   zrQvDrHemA25B87b9t8ELRZeWEEw9UOr9gefUBbIMF7URMEY0CTALs6U+
   g==;
X-CSE-ConnectionGUID: M6N87/GbTVmsEIibmTCO5g==
X-CSE-MsgGUID: uX3FZyJTTUWfALsPPrdTQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54089976"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="54089976"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 14:49:26 -0700
X-CSE-ConnectionGUID: AdMKfogwRAOZGCzn20axIw==
X-CSE-MsgGUID: L0BPgrqTQuqwn6SJAt+u2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="155306075"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2025 14:49:24 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZcfJ-00046h-1h;
	Wed, 09 Jul 2025 21:49:21 +0000
Date: Thu, 10 Jul 2025 05:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 132/187] vmlinux.o: warning: objtool:
 bno055_get_regmask(): unexpected end of section .text.bno055_get_regmask
Message-ID: <202507100510.rGt1YOOx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   f8f559752d573a051a984adda8d2d1464f92f954
commit: 486300b45b81df9079fc2cea6179116c65c22ab5 [132/187] iio: imu: bno055: make bno055_sysfs_attr const
config: x86_64-buildonly-randconfig-006-20250710 (https://download.01.org/0day-ci/archive/20250710/202507100510.rGt1YOOx-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100510.rGt1YOOx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100510.rGt1YOOx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: bno055_get_regmask(): unexpected end of section .text.bno055_get_regmask

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
