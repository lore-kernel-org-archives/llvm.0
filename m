Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D775801;
	Sat, 13 Jun 2026 02:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781316232; cv=none; b=urlqnckBzk0N0PtRx5ek4d1Cky+aYCR7M/ljo81TtgiUSYE+hgpcsVHp8j47HT7K5SO1qDf316S8hXV/V/EKi2ixwc6tu1UqwBQK2u88u0/ZZqth5dmO77sAQAAI8Se5q3fKzS2ubvHFIVhjx9mL5WNspT9Ih3Ba5bPH8m7Gork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781316232; c=relaxed/simple;
	bh=+s5j/+li9yLQESl9M671zUFuKmT+fEpW3CroKMxNPDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mLT5o3RUZWvHM06cz5Nl0hOjt989kwTCuuWq31Yb4UfzZCXWEsnLVHrOKNNy+uBdCZhBWA7B1HYEJZ8Rx6oTr9wR3r7DZwQDG5CDISNvBCYCLFmbickdZhDKhe1Z2pFxtlCUJ2K8QhxXM1QlzT6ahr4xtpGz+X9EE/BniVYXub4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlG9fqZ3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlG9fqZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781316231; x=1812852231;
  h=date:from:to:cc:subject:message-id;
  bh=+s5j/+li9yLQESl9M671zUFuKmT+fEpW3CroKMxNPDQ=;
  b=VlG9fqZ3vDI59g6vPBcY1k+rb/82urql1V5VaztvpylErteY1rnHTD0j
   MDs4K4c7Fj3Jl+5h6zXWmHYyl/6U0nXXz+GbuXXMzK4o1nk44EGt2NPgd
   6FHWuG1e+UhxaeEZt7Gm4W9BtDFp0ABQT1YKf71w4eJPhtHpI6teVGovX
   KHbmT7m8rmuPg52cFc/rUywlJrQshQMWv9czF6JgnCCZ0tx27AO2sjo5B
   Mt5WeoAcjpzzmIP+3TKxMtBKXWJ6zshDqlzEUvOEmZf7bgApE9lNq+6/m
   n0r86RmwSPyOkHoMNHoZXosAXZ3GT8D8Wsg/0bdDjTiogEcCsM4yVLtT4
   Q==;
X-CSE-ConnectionGUID: TiTJ26jRQaSeqC85XKQg2Q==
X-CSE-MsgGUID: eCjXoO/WQ3ShiaG0ycVHLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82214224"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82214224"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 19:03:50 -0700
X-CSE-ConnectionGUID: o7vUcoZKQVKiDt/9bpHueA==
X-CSE-MsgGUID: 6DOvHziKTZyAEPtIE19XLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="271022076"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jun 2026 19:03:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYDir-00000000Pac-3cZK;
	Sat, 13 Jun 2026 02:03:45 +0000
Date: Sat, 13 Jun 2026 10:03:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/no_unsync_for_nested_tdp 26/28] ERROR: modpost:
 "tdp_enabled" [arch/x86/kvm/kvm-intel.ko] undefined!
Message-ID: <202606131030.1J97XoH8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/no_unsync_for_nested_tdp
head:   9f53f21ed659784cf113f5c1690230a7b1549cb5
commit: 8412c1fa144d9e1ae3718fb299ccd1e1e4b671af [26/28] KVM: x86: hyper-v: Drop an ugly shadow of the global tdp_enabled in
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260613/202606131030.1J97XoH8-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131030.1J97XoH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131030.1J97XoH8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tdp_enabled" [arch/x86/kvm/kvm-intel.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
