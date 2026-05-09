Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26AE37BE7D;
	Sat,  9 May 2026 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778326860; cv=none; b=IxiO4S76OZpmjS9qwoFJQTKUPdQ9JiVCV43zfBDgnu1CZA/jCv3Mjg9i5vEeN+/P3VpzbU/cxKeJLODD3ohECI1fd0S5ZgpVoyXX2E5VKTosd+43j2ov8N/3jxwIuwKUjaM/hGPixM6NU3EKCUj0gDIBpqJp8jqsyCjgMkuLcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778326860; c=relaxed/simple;
	bh=dsN+LeLUajUmwwn/y/d+HoAY3+lsLO1R1TI5qhp2L/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iv7eZR1Yb2cBewlCfKDmbskSZzO0r2xdjUYng106SgpMApyIB6GSE+Ll1ei301I3QOlpur8vEhb5RaHcB5DibFRpTq1YvPwo0Ejqfz9d/GVDEkK2NgSP+jfn+0E0rNzVMPQDRCzyzoFQL1X80NwYqDe3nz0qCcKMXVb3nVkDXa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQk3bzKE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQk3bzKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778326859; x=1809862859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dsN+LeLUajUmwwn/y/d+HoAY3+lsLO1R1TI5qhp2L/E=;
  b=LQk3bzKEzQkfAYEjaxYDItuCYAZdqEL89DQVqxAlUAs0ifhTy87MJQYy
   dVrVG9Na6/sQ+BHno/B3GlK5ILvt+0DEr1EtAvjFD2fAsY5WJGd941DIq
   RpuXCBU71xFolI4V5y4YYvoDN0X/03SGJhv9ByQsvvwpqDKx9z3nuh124
   EGG1jZAyApRitAfMix0G5ajLGxv3GHh/cWZiXwHWbOuAZ47KjZZfKUK+6
   YCw+kSRHZAoYaFynkfIjwmuAHBdQbyk5Qms2bIViYJBZBxzyUA0+y2GbX
   HVY4Ig6zqQZo9Rskrg3g2l5tbNfaRK6ZupH0PfJmM8uQzOkb4AUpLV+P0
   w==;
X-CSE-ConnectionGUID: X5whsZn7QZWDJABQRV92TA==
X-CSE-MsgGUID: ki6ZDcapSaGZwBNxT1oIlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90754305"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="90754305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 04:40:58 -0700
X-CSE-ConnectionGUID: P/WzQYxGQvi09L1EFrS5Zg==
X-CSE-MsgGUID: 0JblDNN0RluJ8SjYdf/8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234341283"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2026 04:40:56 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLg3B-000000000vJ-2aE4;
	Sat, 09 May 2026 11:40:53 +0000
Date: Sat, 9 May 2026 19:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v1 1/1] fpga: lattice-sysconfig-spi: simplify with
 spi_get_device_match_data()
Message-ID: <202605091959.PZIPUKud-lkp@intel.com>
References: <20260508080650.1144588-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508080650.1144588-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/fpga-lattice-sysconfig-spi-simplify-with-spi_get_device_match_data/20260509-133025
base:   linus/master
patch link:    https://lore.kernel.org/r/20260508080650.1144588-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] fpga: lattice-sysconfig-spi: simplify with spi_get_device_match_data()
config: arm-randconfig-004-20260509 (https://download.01.org/0day-ci/archive/20260509/202605091959.PZIPUKud-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091959.PZIPUKud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091959.PZIPUKud-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/fpga/lattice-sysconfig-spi.c:96:44: error: incompatible pointer types passing 'struct device *' to parameter of type 'const struct spi_device *' [-Wincompatible-pointer-types]
      96 |         spi_max_speed = spi_get_device_match_data(dev);
         |                                                   ^~~
   include/linux/spi/spi.h:1757:52: note: passing argument to parameter 'sdev' here
    1757 | spi_get_device_match_data(const struct spi_device *sdev);
         |                                                    ^
   1 error generated.


vim +96 drivers/fpga/lattice-sysconfig-spi.c

    85	
    86	static int sysconfig_spi_probe(struct spi_device *spi)
    87	{
    88		struct device *dev = &spi->dev;
    89		struct sysconfig_priv *priv;
    90		const u32 *spi_max_speed;
    91	
    92		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    93		if (!priv)
    94			return -ENOMEM;
    95	
  > 96		spi_max_speed = spi_get_device_match_data(dev);
    97		if (!spi_max_speed)
    98			return -EINVAL;
    99	
   100		if (spi->max_speed_hz > *spi_max_speed) {
   101			dev_err(dev, "SPI speed %u is too high, maximum speed is %u\n",
   102				spi->max_speed_hz, *spi_max_speed);
   103			return -EINVAL;
   104		}
   105	
   106		priv->dev = dev;
   107		priv->command_transfer = sysconfig_spi_cmd_transfer;
   108		priv->bitstream_burst_write_init = sysconfig_spi_bitstream_burst_init;
   109		priv->bitstream_burst_write = sysconfig_spi_bitstream_burst_write;
   110		priv->bitstream_burst_write_complete = sysconfig_spi_bitstream_burst_complete;
   111	
   112		return sysconfig_probe(priv);
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
