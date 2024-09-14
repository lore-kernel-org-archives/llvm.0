Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2CE1482F5;
	Sat, 14 Sep 2024 17:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726335438; cv=none; b=CKY7Raxf9EghStAgB5NYw2xPA79rdI/BoI93EAOFLdBHCCOKry+PMR+PInaaFM78xsDo5oCktFPsa0BLDwe/xhsolpAau3cir/MRqHb+PVqvH0DyOQKdKmHC3lY7fpadrEnOCS5fBqYOcmHBNsxZotwtAAfOyXXSV9tKAO7wEaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726335438; c=relaxed/simple;
	bh=bdeTaft8mZqRo5px+2z30ZmBbAywulCX2M/9l9QbDkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqjHqkdU9TJEDo9y4yCe1HDl1neC2rFrl/6IWJSIHaoPsFMzVCSCaI9Y2Ax/Hfn035gJvV8jhLraGqt0FmAj8zQ1jcGj/B/LLikguA0Ux1i4ei+KIVNmz80AaJ/kqyxm6goqV65/9Bli7U8Gy3HEQ1VixzO6FutQFOsyffXLL9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/2KZaFu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/2KZaFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726335437; x=1757871437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bdeTaft8mZqRo5px+2z30ZmBbAywulCX2M/9l9QbDkA=;
  b=C/2KZaFu8unzLrcbXzujMjPHPzjrJjWmTZPxT0HNQAhPIsML8Drf6Qwt
   phOpZPQGBG6RKl2FPp3P4g3Fws7yTMlU5aC9bAnIZfe5Q3LvtPqkxJETO
   aryfOaeoCEbk0XzRwtIzudpO5ncCXDdQ02Men3PVblb64UF+EGjqZnr0L
   0+I4sc4kGaBivf3k2NnTNbyZxgysbRey5Fz1j0nVAzyDe572AjCxmhRIP
   VRehYeilHs8KfyQbvhJ1K6jE7wB3QOChZ30sbYl8eb+aMNgAyhs9wCIes
   sXY1CK2UWql2X6x5H3Hk4f1ihRZZ1lQuFaL/nDt+A7VTzIPFYyucwFjBC
   w==;
X-CSE-ConnectionGUID: RJoJ2nbuRWey+q0KExf64w==
X-CSE-MsgGUID: 7tulXwAiQ9axVDtZG+DvIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="24758381"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="24758381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 10:37:16 -0700
X-CSE-ConnectionGUID: pZGSGrYJTAGuvs13gFzz1Q==
X-CSE-MsgGUID: TUlD6Sg7SYOH5LMDPifvEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68134716"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Sep 2024 10:37:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spWhq-000814-1w;
	Sat, 14 Sep 2024 17:37:10 +0000
Date: Sun, 15 Sep 2024 01:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Lakkaraju <Raju.Lakkaraju@microchip.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, bryan.whitehead@microchip.com,
	UNGLinuxDriver@microchip.com, linux@armlinux.org.uk,
	maxime.chevallier@bootlin.com, rdunlap@infradead.org,
	andrew@lunn.ch, Steen.Hegelund@microchip.com,
	Raju.Lakkaraju@microchip.com, daniel.machon@microchip.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next V2 2/5] net: lan743x: Add support to
 software-nodes for sfp
Message-ID: <202409150110.dSOZKgpK-lkp@intel.com>
References: <20240911161054.4494-3-Raju.Lakkaraju@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911161054.4494-3-Raju.Lakkaraju@microchip.com>

Hi Raju,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Raju-Lakkaraju/net-lan743x-Add-SFP-support-check-flag/20240912-002444
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240911161054.4494-3-Raju.Lakkaraju%40microchip.com
patch subject: [PATCH net-next V2 2/5] net: lan743x: Add support to software-nodes for sfp
config: x86_64-randconfig-003-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150110.dSOZKgpK-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150110.dSOZKgpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150110.dSOZKgpK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_i2c_add_adapter
   >>> referenced by i2c-mchp-pci1xxxx.c:1182 (drivers/i2c/busses/i2c-mchp-pci1xxxx.c:1182)
   >>>               drivers/i2c/busses/i2c-mchp-pci1xxxx.o:(pci1xxxx_i2c_probe_pci) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GP_PCI1XXXX
   Depends on [n]: PCI [=y] && GPIOLIB [=y] && NVMEM_SYSFS [=n]
   Selected by [y]:
   - LAN743X [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICROCHIP [=y] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   WARNING: unmet direct dependencies detected for I2C_PCI1XXXX
   Depends on [m]: I2C [=m] && HAS_IOMEM [=y] && PCI [=y]
   Selected by [y]:
   - LAN743X [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICROCHIP [=y] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
