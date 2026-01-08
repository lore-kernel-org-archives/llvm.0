Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFFA3D6F2C;
	Thu,  8 Jan 2026 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871848; cv=none; b=OI2TyVq6QDE0+3BElxOhfc8pF3aT1q+O0vHE+FNxJGENexoTwqi4KHdGSXaMl0qCzOVYAbrd1C2X4VjVfY6Ufj5xdl3cErxQLHMSYCzGKoHpdwN9Vj/V6ax6205DOQvOGWUoD5jhR7Gi1IvJQP8Ul6jfr6SEtMFZSvVo9lXYnc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871848; c=relaxed/simple;
	bh=dGeTTAUM39XiS6LSPPFAqHm+Y9musL0xxMJyeWVKT1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S4rx6mfCbC5TF9hIfm9rjEvhGLKzz43zO/Rgrj+aPQVa0CqgrRI65qncwXZhXexmnckrtDA08qmgLhCufTfzgnoR9CGrxnjtXnWzvC9XwKU/PUCxAdXtVFAtflLi35pFMFLTr/PmOv4iY0Wd6Mhl4ImnpJdY8vR567WKBsrY6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sc3lzSqM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sc3lzSqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767871844; x=1799407844;
  h=date:from:to:cc:subject:message-id;
  bh=dGeTTAUM39XiS6LSPPFAqHm+Y9musL0xxMJyeWVKT1M=;
  b=Sc3lzSqMJY4AOK5/OcJdV4P8kyeWc/3fsshXCJNS+n5uFgmSab5Ox7aq
   0ecEEPI6GCv+eeQ0vlrgh56jrmxKppaNzUkPOsH1I+tKfdXoiTQDgcQh3
   FfILQtr/4VQ71C73HwlqF9+1srsFFeEv5sIBNxGmwvdV8FRWXFX6Wl7cq
   gMB0Wi4K1X2oe1aDsTWgH5ahobo9+uoqYT8SHorgcjfOszm3l/1YJQS3s
   fUudQP2nUPhEAPs7pVxzGuQnpz0huoxRXBlpeABTgizBQWTUPuxj9eki3
   O7G5nlLQCLfZ6U6XIBuPt26qhA8ZkE8CMO6URojTxA+JTLg3sTIwuZYme
   w==;
X-CSE-ConnectionGUID: yU5YO6otR7CU4hZ1m0phCA==
X-CSE-MsgGUID: KMJggzEjRt2yfz7BFPawkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80695862"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="80695862"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 03:30:40 -0800
X-CSE-ConnectionGUID: vHMBbdO1T1uAI48WvIzqrw==
X-CSE-MsgGUID: b/qyNn6HRKC8uMNY/Ianwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="207316787"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Jan 2026 03:30:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdoDs-000000004eG-1jHd;
	Thu, 08 Jan 2026 11:30:36 +0000
Date: Thu, 08 Jan 2026 19:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: drivers/gpu/drm/msm/msm.o: warning: objtool:
 msm_dp_ctrl_on_stream(): unexpected end of section
 .text.msm_dp_ctrl_on_stream
Message-ID: <202601081959.9UVJEOfP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: 2b3d6611b2ae50cab37e68cbae7b3ef8f9276c86 drm/msm/dp: move/inline ctrl register functions
date:   6 months ago
config: x86_64-buildonly-randconfig-003-20260108 (https://download.01.org/0day-ci/archive/20260108/202601081959.9UVJEOfP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601081959.9UVJEOfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
