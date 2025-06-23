Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63E4242D80;
	Mon, 23 Jun 2025 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672841; cv=none; b=OcYyujcUKaye47DqlrrPLJnLR8HjOXpDM/xLXhE6H6GSiZkmUHC+C5lVEhzgP3/xNT26GXfLN0I+v68Kl7riYPno1XqCwvPqRGEPSbKmEoxr3b4fOsuvXKUjvet7A6oTncznC1hAbGAtbi5+jkl7K4R4h3xV2Rgr9IqQC/7ql7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672841; c=relaxed/simple;
	bh=4JV+By1pXi83zG+o1aVXBhH+PKzXW71STeMIFjFmBZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UA46JraR/uZV0k/vpHV7qZElkdOCbPEev3i3ROTluT6gOQacHNV3VYCrgFyra5+8qqxmxEOSYLEDrg8kkhnbCQT6f7Y9K4LDcgv1Y2BsAHCQ18D7eaMbkUjBcF5XNPp8DO7yliJnW5oxbq4SYbVi/Hn7hJbg3hcLMy3E4vtQQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIuhaJvr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIuhaJvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672840; x=1782208840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4JV+By1pXi83zG+o1aVXBhH+PKzXW71STeMIFjFmBZI=;
  b=cIuhaJvrHi3HsdnRVicWkDJQXI2v+wA32JI7SqhSQ9h+jQF5R1Ycs2rV
   8x53PEQbzQo6aTcn0TxuUWj3xQW7tUnfIS2/qAm/NKZ8X9hnp/t7kYY7P
   0RGqbMUt1L+TWoml6HOD84qzI3z2HBYNTZzYh4qMxYnP+B1TjKB/ePrY/
   O91lVt75+/p3lQ0mieGcRFbyPWn0gVAulFF0HqVp5c10UoP7nfAifZS6m
   LFKB8whIaOaZmDAAfnDmtCqZq24drQ0rVqmQJAlbvJuigrAumftOBju4D
   PUWh44LYcik+BSW9ZJTc3r0jL5f85KDD002DPy79+lfVz/hvL3ULPJIqT
   w==;
X-CSE-ConnectionGUID: cBfJ18wQQUOgg53NdWY9nw==
X-CSE-MsgGUID: BilzqIlfTG++g3kagmko/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64227968"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64227968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:00:38 -0700
X-CSE-ConnectionGUID: C61qQjCCQhWAJh+i6lHzVw==
X-CSE-MsgGUID: CLgbVnMMRQCefat+FxcpsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151023781"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 03:00:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTdyX-000NvU-0m;
	Mon, 23 Jun 2025 10:00:29 +0000
Date: Mon, 23 Jun 2025 18:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, lee@kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, dlan@gentoo.org,
	wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <202506231720.IakJqbvG-lkp@intel.com>
References: <20250622032941.3768912-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622032941.3768912-3-elder@riscstar.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5d4809e25903ab8e74034c1f23c787fd26d52934]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250622-113200
base:   5d4809e25903ab8e74034c1f23c787fd26d52934
patch link:    https://lore.kernel.org/r/20250622032941.3768912-3-elder%40riscstar.com
patch subject: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
config: i386-randconfig-017-20250623 (https://download.01.org/0day-ci/archive/20250623/202506231720.IakJqbvG-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231720.IakJqbvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231720.IakJqbvG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __devm_regmap_init_i2c
   >>> referenced by simple-mfd-i2c.c:47 (drivers/mfd/simple-mfd-i2c.c:47)
   >>>               drivers/mfd/simple-mfd-i2c.o:(simple_mfd_i2c_probe) in archive vmlinux.a
   >>> referenced by simple-mfd-i2c.c:47 (drivers/mfd/simple-mfd-i2c.c:47)
   >>>               drivers/mfd/simple-mfd-i2c.o:(simple_mfd_i2c_probe) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_SIMPLE_MFD_I2C
   Depends on [m]: HAS_IOMEM [=y] && I2C [=m]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y]
   Selected by [m]:
   - JOYSTICK_SENSEHAT [=m] && INPUT_JOYSTICK [=y] && INPUT [=y] && I2C [=m] && HAS_IOMEM [=y]
   - MFD_MAX77705 [=m] && HAS_IOMEM [=y] && I2C [=m]
   - MFD_SY7636A [=m] && HAS_IOMEM [=y] && I2C [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
