Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D9286A9;
	Fri, 26 Dec 2025 02:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766714425; cv=none; b=uVRqFkT5gOVz/qF95FckqSpKEWp49gPLRdzpZOwmJYMw8tThZo62Uam3rGS4IlqpAqEDmLaEYun0fK05u0iaZiDIbfVZ0wheBFSB1i4hdOZ4kSlJBjp0zCAVDk1yODXfIR/XzG9dEfQfkhHog/KKrAQ1nJXfxgWXK/ZQzwg/sYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766714425; c=relaxed/simple;
	bh=mbh35zCHvVc4/OoLF4JYPwU8u2ad/rWS9xiqpq3H/5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kfDuU2M4o8Qis6ST6vyfZhtQFgmAxQG/e3YUsD+nqFQv3g2oqI6FNkMi/sew3abM95V3w6FvZYzvgn0Kll1ZDM6XszMfGOFz1W8tbaeXC/RzZfru0QV/csq3UH+tbpgAIEcNARxIFkxqRYZDcW7xTPRzskFb0o1PPzDauXUg8y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQQkXeKx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQQkXeKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766714424; x=1798250424;
  h=date:from:to:cc:subject:message-id;
  bh=mbh35zCHvVc4/OoLF4JYPwU8u2ad/rWS9xiqpq3H/5w=;
  b=TQQkXeKxJVHrFxvSDFy4IK7BeZOL++mzwdmod+Xb/qdgLgaXwAoUCIPV
   ryYtpLiV1ocjVHnUzBQMAkeSkiU7QgQKZSftNyfwKcj7Umi9l8G++mZbm
   IRP7rWxgtH0cad3HaPJr+A5caz+eO5avcg2LhwC0lx79UhvG2IkS4Ukc7
   TUMp54LXeutAqZGnfDz9U6Wg484DAgiWdFJuGUOvllgO3xUf+fwoRN31m
   5vQ3bMXw+yUDXgjsf9rtNgiAMVct7SDmnrnrAHLh1rjgJxyuPnZUBVWrY
   BDpQ5ZTdpVYzNrWXrzXju9vT0Qb/KWfa5BGWk5jX+Sik2pUdVSyB6EG+S
   Q==;
X-CSE-ConnectionGUID: SFg+zB8LTpij2SUuyZ9ajQ==
X-CSE-MsgGUID: RLoixEcISOaNuf7aXCrUSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68537495"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68537495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 18:00:23 -0800
X-CSE-ConnectionGUID: qzLGtRnRTZmkDjj1nudnSw==
X-CSE-MsgGUID: z7rLU4kOQsG1EUlXvhbW2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="223784565"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Dec 2025 18:00:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYx7r-000000004bR-1CUQ;
	Fri, 26 Dec 2025 02:00:19 +0000
Date: Fri, 26 Dec 2025 10:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 36/62] 19 | use
 crate::error::to_result;
Message-ID: <202512261259.rGEJ035N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e08116e258e28774a3770a80debc819b89928f45
commit: 3edfa200c39f0b92170fc23da2662f1a1faf6080 [36/62] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251226/202512261259.rGEJ035N-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261259.rGEJ035N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261259.rGEJ035N-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: unused import: `crate::error::to_result`
   --> rust/kernel/of.rs:19:5
   |
>> 19 | use crate::error::to_result;
   |     ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
