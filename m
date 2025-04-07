Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7E212D6A;
	Mon,  7 Apr 2025 02:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743991230; cv=none; b=R6GkhjaNzI0kru9vRKh/LURG64zU+DLdqxnIzSsZ3tnd0bFL94iJfHyhM9pMo2slqMNH+dUhIBwG0IkZH7A5toSzs8i0UfVdYcNrAoZmzS6EaWFgg5TlydXYURuh1iF/EcQpeavBZkcMKFB8iR7WUdlSFrbwGHt94C4Y5Mw5Wco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743991230; c=relaxed/simple;
	bh=c+LWKME/vJdR92Qt5IQfvCW4tBxBnIiP/qUH4o4NDsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jt4SeZeTGUXikSP/rZI1BrL/alN5TgfS9Vj4W76SNJf5dxhU3lBo6iAGX/OTfrdiZKXoDqCABbzxfBsSVu7+4f0iRwpmQCFcpYJEeRFuhkLxf8Et/Xj7jBi//LpFI6edR7HIboJDfBLlzLanCSrFRpKevTBiUJW8p85/7azMwyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfAF4ohe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfAF4ohe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743991228; x=1775527228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+LWKME/vJdR92Qt5IQfvCW4tBxBnIiP/qUH4o4NDsg=;
  b=JfAF4oheQGMlEAKBimYbn4lwzVHbVOatfpOjJWgndBcvGpVANv4eHR0z
   1YYVdlURbvH2qqNbRQe1wui4uQfgiOR3p4VK4KozN77qG9NvCxcwhYy8d
   XBD65drAm1UUS0UezYbxJwNj/LDR7QnatVwGpykKGl2CwS9DZaodXsv9w
   MmXxE5eL/v4mcNmDNH2+xMvSwoX2Thz6AVbZ7UW58I3z/Ezyp5J2pLPvA
   tZOZ1rhCuZafZMcSBqixp2Wqp6tSUFxt9iBPxsIofb9C48g5dp0u7Imz8
   ONfs1vJsqGzb61AAD+hZ5AfQsQqooffLl9sEHTCc5o4kSK6EOZHq5Cuhh
   g==;
X-CSE-ConnectionGUID: Oy0wJN32TlOZdrOMZaGNCw==
X-CSE-MsgGUID: Vt4q1bbPR8i8WLGkg+R7Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="62902935"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="62902935"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 19:00:28 -0700
X-CSE-ConnectionGUID: ytxoQhGARcKwS9Aqf4Xx9g==
X-CSE-MsgGUID: IkyjZkLTQkCFYVauWYYaHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132949289"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Apr 2025 19:00:26 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1bmh-0002t1-2s;
	Mon, 07 Apr 2025 02:00:23 +0000
Date: Mon, 7 Apr 2025 09:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	Akshata MukundShetty <akshata.mukundshetty@amd.com>
Subject: [broonie-ci:fileH5Eyqu 4/4] drivers/spi/spi-amd-pci.c:67:1: error:
 type specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <202504070929.jvWcx1T3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileH5Eyqu
head:   b644c2776652671256edcd7a8e71161e212b59ac
commit: b644c2776652671256edcd7a8e71161e212b59ac [4/4] spi: spi_amd: Add PCI-based driver for AMD HID2 SPI controller
config: hexagon-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504070929.jvWcx1T3-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504070929.jvWcx1T3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504070929.jvWcx1T3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-amd-pci.c:67:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Werror,-Wimplicit-int]
   module_pci_driver(amd_spi_pci_driver);
   ^
   int
   drivers/spi/spi-amd-pci.c:67:19: error: a parameter list without types is only allowed in a function definition
   module_pci_driver(amd_spi_pci_driver);
                     ^
   2 errors generated.


vim +/int +67 drivers/spi/spi-amd-pci.c

    66	
  > 67	module_pci_driver(amd_spi_pci_driver);
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
