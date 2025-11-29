Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5602AD03;
	Sat, 29 Nov 2025 07:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764400556; cv=none; b=R3p5bJw+cS4pskTCiKndCCZhFHpGT2Huc7XGwvX9dF8AdlHDZ0cBXlCQWA9jH71VhWeQFCX9EOm3OHPVYszu6t0jhpkWwj2A5cOdI66aDLYvsEHt4gRFEb/qFzDnGNob3XznCJEG1iLEnQzTdI+Ecsr1lw7l4cTiadWJ4M2u1So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764400556; c=relaxed/simple;
	bh=iaywJPt2HLvjDv82OKAPLZoVV9z3KhP1ubyFHjexsv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gAFqtsVKs2O/OImbrYokWlZjTfwSaji2e2MNcdRUNZRDT9syZTEbKucLpYvTuT/UsFlH9orQJXZJ1DtDHhMI06Zuqk+LtgUxoyUuCRVkIBi1vMd1OCuL0oueoOH5gRkurk7PpFURh8ru+8+JJgCh9FZIrzLsK3XhCE9YWQwgCb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChEH7maV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChEH7maV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764400554; x=1795936554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iaywJPt2HLvjDv82OKAPLZoVV9z3KhP1ubyFHjexsv8=;
  b=ChEH7maV93N0SQ21//fxQpEGS1iFdicBLR73soO/HCgep19UzLxI9xP7
   Pt/9VHKbhnagnoygcbP4mzXwg+G5/qb1wdhbpeYxTu/gIS27z7mvy5dkX
   QcKPEuQzz/xrtwjLtGs7G3Nv9dbeRaqbxSS3K7xeCZ46iKCoodB7A+ntH
   dYeWorCLLXP3dEGr59s17hYdx8fZnD97gLaM7k94P+YMneMYpKGtWd7DZ
   NSIFwE52y8YiWjnb99eQROx4tdTWKZ6wHGQhVjfw9C7pL6vr0PePQV4mK
   bkC9uu44ukR8GNSiVv7T5Ky4uVchDsfyFO84plsk1CuRlkv/xDOE7dTmJ
   A==;
X-CSE-ConnectionGUID: sfB+kGagQXiz7pUhU6wAAg==
X-CSE-MsgGUID: tXgoSXAvSk6GEeEJnMzNcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77769017"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="77769017"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 23:15:53 -0800
X-CSE-ConnectionGUID: uS8kyiijTkG6HHbOe95UhA==
X-CSE-MsgGUID: 5WbayvM3T3y8PWXnTHIJBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="216968980"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2025 23:15:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPFBO-0000000072D-1mKH;
	Sat, 29 Nov 2025 07:15:50 +0000
Date: Sat, 29 Nov 2025 15:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [linux-next:master 11759/12740] ld.lld: error: undefined symbol:
 safe_candev_priv
Message-ID: <202511291520.guIE1QHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
commit: 1a620a723853a0f49703c317d52dc6b9602cbaa8 [11759/12740] can: raw: instantly reject unsupported CAN frames
config: x86_64-randconfig-012-20251125 (https://download.01.org/0day-ci/archive/20251129/202511291520.guIE1QHj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291520.guIE1QHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291520.guIE1QHj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: safe_candev_priv
   >>> referenced by raw.c:933 (net/can/raw.c:933)
   >>>               vmlinux.o:(raw_sendmsg)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
