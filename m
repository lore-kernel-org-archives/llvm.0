Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A861D23EA8E;
	Wed,  3 Dec 2025 06:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764743302; cv=none; b=Eg64FmcA4aaocuMdNKtX6+sOLzJJiGH4MDnDOI2ywb8AFu1LkGPvbwrSWv40e9GppeE/KzHnBiG4J1rZquNjbP/Vl3JYkciT1qU0xsEa3cfB0nbsOMhn7VIk88ITbgMA24Ifte5JJcR0tq2qz9H3ema1fDt2XT6lla+HgNQd5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764743302; c=relaxed/simple;
	bh=9iO+2PoqPRGm3Xkrf3CRD/Nz63PYKIo3a9kdSiLHDL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SlJZ4BOllqMuIPGUXuUI/vvDlM5xY75yfgia28iwTOCbW7JZY2PO35+HjUeq23D36ky99+FBe0pJKhU1xFPICF1fYbaunf0UCiXLpmB9W9Pe8twxkmHv2Uf9XYyIs0a7nEZgCAtT1r+2e5Xnz9UtzG3wom7Jd4q21FxHVoim0AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1yuYrav; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1yuYrav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764743301; x=1796279301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9iO+2PoqPRGm3Xkrf3CRD/Nz63PYKIo3a9kdSiLHDL8=;
  b=Y1yuYravHvgpkn7OZt53vRM0fa28MpUlfSwC6R8hi75KfERRPt8NJHsZ
   ZyxeWT3nSDGNtH7XvDTFrlRJqvJdJ6fdUKDuMQn7HCiSl9YVkxgQEwO+C
   JXM3BiE6Z2fYDL43/dF5WYmnUFrEz7lvAK7tMFJothPqo2YyYiz9W/Qqt
   V84g39n+Ga4Q/Fix+92wu9Z85wY8M/wHWhXN5UMuXZ3XjZ/Xc4Ptms1zu
   //euCwqMWVBpBLnDdRcwyqJT3VMSiHCqvvSNurHH9ReKSXMVgKJqDKcO0
   3j/0x2GO5VRvibBLNopTqHNyOp+yaJlUDzuWGoLfzYOOvo77keVV5JDX9
   g==;
X-CSE-ConnectionGUID: 9fioQOQSTkmYd8iUoyLsAg==
X-CSE-MsgGUID: njrOPi9FRdyfDg6dQihJqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66669547"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66669547"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 22:28:20 -0800
X-CSE-ConnectionGUID: Be5A9dLZSZ+HmU+PsAs5/w==
X-CSE-MsgGUID: eiOpL9rzTiGunIm+tuI1hw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2025 22:28:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQgLY-00000000AfB-32J5;
	Wed, 03 Dec 2025 06:28:16 +0000
Date: Wed, 3 Dec 2025 14:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jpsollie <janpieter.sollie@edpnet.be>
Subject: [koverstreet-bcachefs:pr/992 2/2] ERROR: modpost:
 "curve25519_generic" [lib/crypto/libcurve25519.ko] undefined!
Message-ID: <202512031412.agZspLiJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/992
head:   39aff98c65bacc4dcd96c8ac030646bca1bfb183
commit: 39aff98c65bacc4dcd96c8ac030646bca1bfb183 [2/2] Merge branch 'master' of https://github.com/koverstreet/bcachefs into HEAD
config: i386-randconfig-017-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031412.agZspLiJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031412.agZspLiJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031412.agZspLiJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "curve25519_generic" [lib/crypto/libcurve25519.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
