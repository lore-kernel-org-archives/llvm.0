Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612402F9C37;
	Tue,  2 Dec 2025 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764714603; cv=none; b=scXpyKVx8GYRhsJVrb1wmXm5cdazmP7h9Fx383uScDKxqKUCxKWCur53QQtkdShNLSRMqvDujRoMPZx4nrWr/841EIJ4knLdu7sXrcR+RpUcwtnLXCA7lsAOieuTrpq8DVgMeLuu2ojDm4HkTK5HeeFl52lF+tLYV6KpZkaWAbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764714603; c=relaxed/simple;
	bh=Tzm85UWzBGZBLCaGdXzjQsCeqTMM+dsj8Uofxue8lK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LCX1lTClZVMAVqWVD66ZNqLFZp/Ds1QGJ721TZsxua6+l7n0euaikUAVxM2ctup10MmTHuGSxWTYT+m9pO2Ku58IjpxQOCpn4nJHcqMkBdyMVfxCUlsyftxGpdUiGzKxA1MOvFQZKtd7DRC5n6KUgzZx8JXhqEIxY1spP/mO83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BilQRweQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BilQRweQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764714601; x=1796250601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tzm85UWzBGZBLCaGdXzjQsCeqTMM+dsj8Uofxue8lK4=;
  b=BilQRweQIxO4P1efxNFZfcQ3zCJC+QTQ8svmIuL67uLSxfJdkgX3LNdP
   8EJ3K6yYq5Dd4NYRE82z3E1MlPLrPMAOW/4f0dV/EkDF5YT0wD0114M6o
   mhbpMYIzugFJDe+taUxp0Z32t0p8Btrl5JQagTCYpy4DzlGYVFvj4uesc
   ROcWY3ukPqbGzVvKOUN9V4J3GKRALMTova2uqHTusBSeiEBfWJR0sMnUW
   y55TcDwQwAMm0+FkhEfrbskJMMnc8+Dx9mEtcsrvxKP+VC4fBmSMifyx6
   PZ2CNBuOYtTQMA5WfXttcUkz0vJ8BEyOCspvK91Fwie/Oh5YNhXCz62jK
   w==;
X-CSE-ConnectionGUID: 7uVhpaDUSXGaY++2r2I0mw==
X-CSE-MsgGUID: 9G4EeGYpT1yzHIeCrQeJQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66734303"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66734303"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:28:55 -0800
X-CSE-ConnectionGUID: GVHmDmGyTw6yrPiHMea7Pw==
X-CSE-MsgGUID: sKSSSVIeRhWjaviZcNY+gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="217847435"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2025 14:28:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQYrb-00000000AGP-3Sr9;
	Tue, 02 Dec 2025 22:28:51 +0000
Date: Wed, 3 Dec 2025 06:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13063/13171] Warning:
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:244 struct __packed
 mtk_mfg_opp_entry { __le32 freq_khz; __le32 voltage_core; __le32
 voltage_sram; __le32 posdiv; __le32 voltage_margin; __le32 power_mw; };
 error: Cannot parse struct or union!
Message-ID: <202512030622.oPwuphyX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: e4f12451cc6431b08c454cb0d71f158f119d3dfe [13063/13171] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251203/202512030622.oPwuphyX-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030622.oPwuphyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030622.oPwuphyX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:244 struct __packed mtk_mfg_opp_entry { __le32 freq_khz; __le32 voltage_core; __le32 voltage_sram; __le32 posdiv; __le32 voltage_margin; __le32 power_mw; }; error: Cannot parse struct or union!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
