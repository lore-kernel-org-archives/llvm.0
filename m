Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE7D163;
	Sat, 21 Dec 2024 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734799745; cv=none; b=FqQbUFmV32D/TA56vJAJNxURACWVSRsIGIG9bmc+tJWTOIlKv12/55ZYPYYIQooZSpJ/8rAOg5EH1H7zGSgWrZE9mv9I/wH35A5qWa4uw+pLKbled/2pwWOAD45I7jJ3bVeKMjj1vvGbbKosRcv/VhYKxX067yYpGTHDsvcjhIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734799745; c=relaxed/simple;
	bh=ilBor9KaUEsYRWX/tHknlXALJ6GCfySDgWhDX793c1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+ApTxo5+JWwG8haPla/T0O78PmMIEfAkS++kn9HrTwx7BIaBuOY0A+Be5QZXTspCvC2RYu/1MaAa2UCGsXFK3Kj3DNLoemejta9JOO0KZoFMES/ovdwQX18luGB51sM3Sswly3tGABnPUnJ8eGUnykPZcVZ38ZE1SoN7GXCJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBugyxsk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBugyxsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734799744; x=1766335744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ilBor9KaUEsYRWX/tHknlXALJ6GCfySDgWhDX793c1Q=;
  b=XBugyxskPSDsVnDsP6M+VWUzsYEIxoJBdgDHOdViEciADsIhTQPTxqp9
   G5hT0cOKIaayzBqaTUscvPdencQNydTcWx0ahBtktX3CH1y5u4plLSk6N
   2gdHL/qD2XA2ckgi0sblr9LOORjqmZrQOfa0ykI89AH5/d+M2/zcsE5wT
   HgwQjmHGaFS35OqRQ1H65RX2JJKzQjUri7i89QDzPnqTG4Wl0hSgy1XUf
   VDrkGi8Q1wD0arEYoUTtaqc/yLYt1yXWgWMNC02jBs81O+Vre051YUsW9
   ZPnuTEs7RPR6Hnm8ev57zO8dN9OrXD1HjPeCLuDHLgiLhGPQxp7fUiMUu
   Q==;
X-CSE-ConnectionGUID: sG92bC5UQXi6hqfCxKD7tQ==
X-CSE-MsgGUID: todPzseWR4+vV2mg1rMpZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39263369"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="39263369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 08:49:03 -0800
X-CSE-ConnectionGUID: LeVHX3x9RxiV5sm2IkvKDg==
X-CSE-MsgGUID: RK7FeMUvRpCPIOKe+sx2aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102902197"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 08:49:01 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP2ex-0002IJ-1M;
	Sat, 21 Dec 2024 16:48:59 +0000
Date: Sun, 22 Dec 2024 00:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linux-next:master 1042/5236] ld.lld: error: undefined symbol:
 intel_vsec_register
Message-ID: <202412220022.mbthn5JL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 0c45e76fcc6243723f1f90848170d6bcb4a5bc6c [1042/5236] drm/xe/vsec: Support BMG devices
config: i386-buildonly-randconfig-005-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220022.mbthn5JL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220022.mbthn5JL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220022.mbthn5JL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: intel_vsec_register
   >>> referenced by xe_vsec.c:231 (drivers/gpu/drm/xe/xe_vsec.c:231)
   >>>               drivers/gpu/drm/xe/xe_vsec.o:(xe_vsec_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
