Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8383C3D76;
	Wed, 25 Jun 2025 02:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750817856; cv=none; b=DRiOf5aeNeQ65XLq2JAetAvVz2PaXrhF4wT0/7M1yu8PHhMfPvmZ5meuKz0TrT5V26QMRRudVw9nUZAyAkcuWvTagr0+AlFGB0/LjNh6FdMEurW8oMGe6Oxkhx0VEAbABNuFcZB4SBfAHoOyNhV6gGRD4WL5dNrUjQxQnWtk+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750817856; c=relaxed/simple;
	bh=l+EZxfuJv47bukLhIcT9SV+KwtZV3bERANVHKibLcfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nGNY6ODTUfxB5rGXZ8tFCai+UadSfVDeL9VR9BSXG9WaIYp9B5dOmzUxhlTRKai0IWblnNgxExF8TwXEvlSKRmvH+hYbaytpMKF9AzWKmgY8pkC8i+2PEyqVT2nNWdaOLaXXxQY9L7H9SiN1G4ecemY/LjHJVTYxx0Egast+jOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1+o0gB7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1+o0gB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750817855; x=1782353855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l+EZxfuJv47bukLhIcT9SV+KwtZV3bERANVHKibLcfU=;
  b=K1+o0gB72U1b9CG5NN3sV87KnmxWby5DqtSylAW6RewJfpZu89sKMYQq
   cv49XgkxHloT8gdBXVpM0aZbF/0sMSA0UuxCzGGOS9tH8afv1Zt9tYsUD
   GcbC3Jci/cKUqbCljq/G9+ppVfwNL/9yn2dsNKj4J/olam/4jlRs47vFd
   LE3a9cA43Ma9OCggSaQxNVlsdKf3mKTRxZ4Y9WSlnRwk+moSRCTONIRrX
   nIwbmJouKVmXHJv6rLvlgrDrDk3XypKDs/3InBH7FwoHJ4kkagf0VYp84
   0eWRFlUjbjdUSF7PxwYTUrklISLoEK/Z6DiDTks3PgXh/CICSUEvaSMRo
   g==;
X-CSE-ConnectionGUID: gtfPeOA2Rn6qUxS1kOROXg==
X-CSE-MsgGUID: Djusm2n1QoKJvAkMYi4IyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75613100"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="75613100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 19:17:34 -0700
X-CSE-ConnectionGUID: NLVF3TtmT0uUsaA5k4D7Gg==
X-CSE-MsgGUID: Ul2ezMtIQBegqfwSSxMnlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="156113119"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jun 2025 19:17:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUFha-000Sgg-2L;
	Wed, 25 Jun 2025 02:17:30 +0000
Date: Wed, 25 Jun 2025 10:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>
Subject: [linux-next:master 3022/4739] drivers/gpu/drm/msm/msm.o: warning:
 objtool: msm_dp_ctrl_on_stream(): unexpected end of section
 .text.msm_dp_ctrl_on_stream
Message-ID: <202506251051.7rmus46j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ae2aaafb21454f4781c30734959cf223ab486ef
commit: 8583a655f2c2bb442e2a2668680f419aa4c511d1 [3022/4739] drm/msm/dp: move/inline ctrl register functions
config: x86_64-buildonly-randconfig-005-20250625 (https://download.01.org/0day-ci/archive/20250625/202506251051.7rmus46j-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251051.7rmus46j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251051.7rmus46j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
