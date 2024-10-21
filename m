Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899403D6D;
	Mon, 21 Oct 2024 02:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729478918; cv=none; b=AjdNwpBTMzwoqUszaAfXLsOTjFhat+VkHLlgF90+jLyHyXvTvxZ6au8xI+YFFU2MOb6aL1MX/jzpmvh4LFGr6aoVzrWS/rXjgCO8Nzm3L++BODaQRlIhToVbnx0yAGzqJ9mgJ38x+ZxylSeq612in0mYRJJ0mUjOU2VIrjt5lXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729478918; c=relaxed/simple;
	bh=uVQHywV46Z3ILsJbikiLROf8ZMq1+NxFZ8hAJ9jZ3OY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kfUzC7/Lx/6WSI9CxTOj6EuT4TRs336KMb3FcBHxgBt3kq4slBYRacVZ0aeVlEUeHedSpJjSm78nvSRHIwuX/PoYT+bbAE2F2pSnQdxUmyqVseppm9HimJ4PQZfjyOW/XjLYBF1nI5V3Ir5DC26a9ZfS4x7Npp2V9z5Ko9Ljlik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXm0ta82; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXm0ta82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729478916; x=1761014916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uVQHywV46Z3ILsJbikiLROf8ZMq1+NxFZ8hAJ9jZ3OY=;
  b=VXm0ta82ThDcnbp6DJv1s+tu++/ZyHQKyXE9LHgElIzaPlGwawPAqtKr
   eFKVu3+ELTPEQaQPhFdzSFKWgjpf+2YwO5u2sy01ZHoZ0NgbKTadG/bXS
   87XQeTIdY9D2/cHA1JUjO38rDZnpcnROmDWt4CpzmjwmX5I1l4QiFFY8J
   NrVt9SPY+46vpBukiCNe10SZMYk7kzTsuTrp3DeMD4k4KPM4dagYyNMfC
   gToGdfD/DbQm6Fa3l8zc+ZHVYfbqrbfmaCdKehW6QjVhMiLqUAHa9+ErR
   atcbmX2OLSHBDg0x432i/ccvsTs/KR5Cl5+OvYcnxJ0fgGIEwbnZFv9Ds
   w==;
X-CSE-ConnectionGUID: 2vJMV8aDSVWw+mbC4uFiIQ==
X-CSE-MsgGUID: 9ermA+XyR5KYJgt30r/2jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51488979"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51488979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 19:48:35 -0700
X-CSE-ConnectionGUID: aZyCJVabS1e8Diap24k4rQ==
X-CSE-MsgGUID: yZXyv7X0TeKqGJngx86AMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79406061"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Oct 2024 19:48:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2iT9-000R4f-0x;
	Mon, 21 Oct 2024 02:48:31 +0000
Date: Mon, 21 Oct 2024 10:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: [arm64:for-next/core 11/42] ld.lld: error: HYP init code too big
Message-ID: <202410211052.8GubCgxd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
head:   b8be9b42e20c26ceff1335f7a0eee5bac99206ea
commit: ff5181d8a2a82c982276a7e035896185c390e856 [11/42] arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241021/202410211052.8GubCgxd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211052.8GubCgxd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211052.8GubCgxd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: HYP init code too big
>> ld.lld: error: HYP init code too big
>> ld.lld: error: HYP init code too big
>> ld.lld: error: HYP init code too big
>> ld.lld: error: HYP init code too big

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
