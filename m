Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AA528E568;
	Thu, 29 May 2025 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516602; cv=none; b=B6e5+nH3e/+hts3JesDA8ep+uNEX8RRiI7Btpx2kP2jLKC5o3kAiB4sbK30FvyGUvgfWnHyGmzKmMo0R/A0Rm+6JPo2DrW2hZW3K9hk/r0hNRFWJU52Jc+AAfoCL877Szgh+ysT1G31enwoYTZ97fVOcYP2awhpEKdUWACKhHaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516602; c=relaxed/simple;
	bh=wyJW8Mg168yKHBOeZ9Lq5Kkee/exvjHrLjSGrTodNSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JLe+lo84j7ngG/xZfT7edD2wA0n71xAaMD4GlUfCvQLv7ZcvdIn5oWwl/QuiVQ7fYlOrdn1ui+i3UCk2tnj939J3OKf7OvlDhAPGyakglBuLWIf7GtcWI7Lr/J2UAcvawX3AQqgFkfFCAQkTRHis8y4Vy5x4BXOpt3SaR1hSlqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+OoYUoM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+OoYUoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516601; x=1780052601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wyJW8Mg168yKHBOeZ9Lq5Kkee/exvjHrLjSGrTodNSo=;
  b=l+OoYUoMpZolWP+47Xp8hr8FSv9ZMiyBJRsi5PdDGpRxpxb/ig4t1gku
   sO/oVcxoYu6arviKRo11rbOWCjKmY0xXgXnJ5CH29CGZbl8/n/XLUrSFb
   Bh80r/iy1wvQCr5f9qBybAh+D9pBqXeSjaq5XT2qdXCgwE2eRt50xhDRL
   fuPWyVGIWpRo0qtfgY/zAen8ClbBetynvybs7lvaOGNfkw+9khifp9O2j
   +uxqOr3kYEQb1CV7WtQALj3dr6kONw7XcifXaSFMYRBDPE4l/GWz0/3Sy
   3PnVYQnaBnO43DjWn8/FqDDQhKyFmzDyr47dqCQt8GaqbKrmL/71EXq2G
   Q==;
X-CSE-ConnectionGUID: oKdYt+h9SWyijudKApO9rQ==
X-CSE-MsgGUID: 339FopIiT6SfGPAjincOgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60830490"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="60830490"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:21 -0700
X-CSE-ConnectionGUID: 90d+gMtxTnOBi3Aj2Z9qHw==
X-CSE-MsgGUID: aWIJkR+URnKFjFpvxSJA0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="143864593"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 04:03:19 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2b-0000Y6-0W;
	Thu, 29 May 2025 11:03:17 +0000
Date: Tue, 27 May 2025 14:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>
Subject: [krzk-github:b4/dts-qcom-label 3385/6923] ld.lld: error: Function
 Import: link error: linking module flags 'Code Model': IDs have conflicting
 values: 'i32 2' from vmlinux.a(head64.o at 2493550), and 'i32 1' from
 vmlinux.a(map_kernel.o at 2505790)
Message-ID: <202505271402.5u5ugKFK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/dts-qcom-label
head:   51ec339d26a6101b54ebf7514ad05e9bb51ff6cf
commit: d923b1e0ff3dcb31660942746fd4be80ece15bb9 [3385/6923] x86/boot: Move early kernel mapping code into startup/
config: x86_64-buildonly-randconfig-2003-20250514 (https://download.01.org/0day-ci/archive/20250527/202505271402.5u5ugKFK-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271402.5u5ugKFK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271402.5u5ugKFK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 2' from vmlinux.a(head64.o at 2493550), and 'i32 1' from vmlinux.a(map_kernel.o at 2505790)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
