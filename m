Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB81D1BD01D;
	Thu, 20 Mar 2025 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742504562; cv=none; b=MRfcxo1O4Yl8DjlSX288q60rS7QuLTgadEBmJeMxlkWcnClsjfzO/+Lb6DPq/Km4fMK/wrHWGmFZrFXIqpoQ6wzI8yYRFMMRpyPbUYjiaIHgSiDd4CNspmynWGIYcZ8YHyP1hPZwGD2gbi8MiF5dKTUl5/G1RSE/dpjx4Lsds4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742504562; c=relaxed/simple;
	bh=9Yu/IcKZ+HW0miEpI8MazFPTTbzQQ642qRvaUz7Er3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jo85ZhthI4mjoa4C5Y8nabTCd/iEMLJN+eTSwKgNBBBY4QKGqNMR+ZiHWspMmxLX+YJM63BU2Fde3HPb3m8WBhVot09GMq9UnrX/xjhjb3nlvx+JxGWU0aerG1syr4uoS/mfqTwUvsrfblEYH5t/3jxz+UdJ15BS+EUy//pYnb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdeVv2EO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdeVv2EO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742504561; x=1774040561;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9Yu/IcKZ+HW0miEpI8MazFPTTbzQQ642qRvaUz7Er3I=;
  b=cdeVv2EOsNcpWWdWSoZLUoCtu4+93ZoakSgw2MmVUKSTB88DmB84WWIO
   AuyXVnOBufPftn0OckrofqS9SbjQuvGXbJjgltf7mQeIsuIZFIrMvE89M
   TmvjtSq+BCSpEpuJo+90IDTt/z67JFcTVriAPlftBPkgikzoqYhcDFrp4
   5U32KE97crYPzUmOBYywAMI8mCkxpmBgthaU7jSvfJEISO/wtvKiUAQTB
   9oWAphHnAsHW22yw7U1nSNiy10/fRKbcVejFJHsX2E5cT3j1GBdmM3X3J
   dJT4IZ9ChHIXicEbPDZNsCpKWRIBBjeVuDhwuRGs1ar2mNfUopLUHW6c4
   Q==;
X-CSE-ConnectionGUID: pF+wXDOjSB6sehMM7pQwNw==
X-CSE-MsgGUID: 01lAEDQRQVKg85idyHd3wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43491196"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43491196"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 14:02:40 -0700
X-CSE-ConnectionGUID: nXFITisySfCRV1iQdQ4WdQ==
X-CSE-MsgGUID: CbZlzwNgQJurit+a8DQtvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="154099904"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2025 14:02:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvN29-0000lP-2g;
	Thu, 20 Mar 2025 21:02:35 +0000
Date: Fri, 21 Mar 2025 05:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 22/24]
 drivers/platform/cznic/turris-signing-key.c:25:55: warning: omitting the
 parameter name in a function definition is a C23 extension
Message-ID: <202503210450.AoOpbJXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   ba8755ab541fc629948233125db870d4dbf00a75
commit: df94a2f1eb455b57dd01f9b64419e3163d44df7f [22/24] platform: cznic: turris-omnia-mcu: Add support for digital message signing with HW private key
config: arm-randconfig-001-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210450.AoOpbJXC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210450.AoOpbJXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210450.AoOpbJXC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/cznic/turris-signing-key.c:25:55: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      25 | static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
         |                                                       ^
   drivers/platform/cznic/turris-signing-key.c:25:87: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      25 | static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
         |                                                                                       ^
   2 warnings generated.


vim +25 drivers/platform/cznic/turris-signing-key.c

0b28b7080ef5a3 Marek Behún 2025-02-04  24  
0b28b7080ef5a3 Marek Behún 2025-02-04 @25  static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
0b28b7080ef5a3 Marek Behún 2025-02-04  26  {
0b28b7080ef5a3 Marek Behún 2025-02-04  27  	return 0;
0b28b7080ef5a3 Marek Behún 2025-02-04  28  }
0b28b7080ef5a3 Marek Behún 2025-02-04  29  

:::::: The code at line 25 was first introduced by commit
:::::: 0b28b7080ef5a323c3afa3860c3d45d627629830 platform: cznic: Add keyctl helpers for Turris platform

:::::: TO: Marek Behún <kabel@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
