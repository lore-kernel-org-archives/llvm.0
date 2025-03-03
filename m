Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2E51E48A;
	Mon,  3 Mar 2025 17:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741023705; cv=none; b=kK/mw81b/dGQB/eWMoDVNyhD12B1D38s6xK+EZQwM6olqFKaYGlo+U+edjbHXCX15QrdhQEMZd4SYpW5i4MJ+lZkpceb5oCHe/gCT/p5XdptCLEMT84ytjM1OAOGGjTPiY8dIgH/hwhFhxWja6VeN7qYVR4suUdX6jMO8DNzltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741023705; c=relaxed/simple;
	bh=afGinfUwlGd9kB/M/zPUgOUnTWedTZevaW2r2iqNX28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7Ms8SBICkVkpynBomK1gh3sGm4RJfT1tauUX45OjpO4xMkE6Sf73wM7Hgqp37hvrhgrBZHWaA6ZtAs7g4flM2qMWWbF1ePlN0rAnoX1qgWFaOjqkSBE2Cii4eFsS1BfwccQPHjI8glK+B1frF6UmZteZZhHMJyHEx/kMxeIaKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyG3QCFv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyG3QCFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741023703; x=1772559703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=afGinfUwlGd9kB/M/zPUgOUnTWedTZevaW2r2iqNX28=;
  b=QyG3QCFvbdWqnQTM6Ybo8uXhp7kDZPuDoCmEdshR1t/BRaQwGCGoS9EO
   qmzKLxq7PLgxbSwvKnqnat8AzQ8X7nDtVpcr2Ikj73016Iw/R2/iXhV4j
   S9OKg6DGf3zcuZnsFO3FTr35Ws9YL0yuZIOYyfH3GePIXVHL3ZdwHx1Es
   Hj5+sZdP2nY6fHsmPfMm7Ny3aI914XyKRLsHoPOdjZwawHZ0VlvV6PEse
   nuDF3bYONJqlX3z9VH6XwWut/eN0zg991uhaqOFw0cd3rbzcYppsOHVzO
   Qk8PqP/21FOxysSVnTV8vcVaGSnj8g90rU4Z3px563YitQJy84Im9BoCK
   Q==;
X-CSE-ConnectionGUID: aFUSf/TjS8GpFv/ymRZ+yA==
X-CSE-MsgGUID: +5LqkstFS/OXzVoo2NSNWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29499198"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="29499198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 09:41:36 -0800
X-CSE-ConnectionGUID: qcvfrF7PT7ynZ3tmoXN2Hw==
X-CSE-MsgGUID: t7ZDnc1NQjaIUBEwubB/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="123052577"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2025 09:41:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp9nB-000ImI-1c;
	Mon, 03 Mar 2025 17:41:25 +0000
Date: Tue, 4 Mar 2025 01:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Eason Yang <j2anfernee@gmail.com>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, jic23@kernel.org,
	lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nuno.sa@analog.com, dlechner@baylibre.com,
	javier.carrasco.cruz@gmail.com, andriy.shevchenko@linux.intel.com,
	gstols@baylibre.com, olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com, tgamblin@baylibre.com,
	matteomartelli3@gmail.com, marcelo.schmitt@analog.com,
	alisadariana@gmail.com, joao.goncalves@toradex.com,
	thomas.bonnefille@bootlin.com, ramona.nechita@analog.com,
	herve.codina@bootlin.com, chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com, yhyang2@nuvoton.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4 2/2] iio: adc: add support for Nuvoton NCT7201
Message-ID: <202503040154.I5tA9gE9-lkp@intel.com>
References: <20250221090918.1487689-3-j2anfernee@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221090918.1487689-3-j2anfernee@gmail.com>

Hi Eason,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.14-rc5 next-20250303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eason-Yang/dt-bindings-iio-adc-add-NCT7201-ADCs/20250221-171244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250221090918.1487689-3-j2anfernee%40gmail.com
patch subject: [PATCH v4 2/2] iio: adc: add support for Nuvoton NCT7201
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250304/202503040154.I5tA9gE9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040154.I5tA9gE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040154.I5tA9gE9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/nct7201.c:212:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     212 |                 *val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
         |                        ^
   drivers/iio/adc/nct7201.c:256:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     256 |         *val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
         |                ^
>> drivers/iio/adc/nct7201.c:278:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     278 |                              FIELD_PREP(NCT7201_REG_VIN_MASK, val));
         |                              ^
   3 errors generated.


vim +/FIELD_GET +212 drivers/iio/adc/nct7201.c

   192	
   193	static int nct7201_read_raw(struct iio_dev *indio_dev,
   194				    struct iio_chan_spec const *chan,
   195				    int *val, int *val2, long mask)
   196	{
   197		u16 volt;
   198		unsigned int value;
   199		int err;
   200		struct nct7201_chip_info *chip = iio_priv(indio_dev);
   201	
   202		if (chan->type != IIO_VOLTAGE)
   203			return -EOPNOTSUPP;
   204	
   205		guard(mutex)(&chip->access_lock);
   206		switch (mask) {
   207		case IIO_CHAN_INFO_RAW:
   208			err = regmap_read(chip->regmap16, NCT7201_REG_VIN(chan->address), &value);
   209			if (err < 0)
   210				return err;
   211			volt = value;
 > 212			*val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
   213			return IIO_VAL_INT;
   214		case IIO_CHAN_INFO_SCALE:
   215			/* From the datasheet, we have to multiply by 0.0004995 */
   216			*val = 0;
   217			*val2 = 499500;
   218			return IIO_VAL_INT_PLUS_NANO;
   219		default:
   220			return -EINVAL;
   221		}
   222	}
   223	
   224	static int nct7201_read_event_value(struct iio_dev *indio_dev,
   225					    const struct iio_chan_spec *chan,
   226					    enum iio_event_type type,
   227					    enum iio_event_direction dir,
   228					    enum iio_event_info info,
   229					    int *val, int *val2)
   230	{
   231		struct nct7201_chip_info *chip = iio_priv(indio_dev);
   232		u16 volt;
   233		unsigned int value;
   234		int err;
   235	
   236		if (chan->type != IIO_VOLTAGE)
   237			return -EOPNOTSUPP;
   238	
   239		if (info != IIO_EV_INFO_VALUE)
   240			return -EINVAL;
   241	
   242		if (dir == IIO_EV_DIR_FALLING) {
   243			err = regmap_read(chip->regmap16, NCT7201_REG_VIN_LOW_LIMIT(chan->address),
   244					  &value);
   245			if (err < 0)
   246				return err;
   247			volt = value;
   248		} else {
   249			err = regmap_read(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
   250					  &value);
   251			if (err < 0)
   252				return err;
   253			volt = value;
   254		}
   255	
   256		*val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
   257	
   258		return IIO_VAL_INT;
   259	}
   260	
   261	static int nct7201_write_event_value(struct iio_dev *indio_dev,
   262					     const struct iio_chan_spec *chan,
   263					     enum iio_event_type type,
   264					     enum iio_event_direction dir,
   265					     enum iio_event_info info,
   266					     int val, int val2)
   267	{
   268		struct nct7201_chip_info *chip = iio_priv(indio_dev);
   269	
   270		if (chan->type != IIO_VOLTAGE)
   271			return -EOPNOTSUPP;
   272	
   273		if (info != IIO_EV_INFO_VALUE)
   274			return -EOPNOTSUPP;
   275	
   276		if (dir == IIO_EV_DIR_FALLING)
   277			regmap_write(chip->regmap16, NCT7201_REG_VIN_LOW_LIMIT(chan->address),
 > 278				     FIELD_PREP(NCT7201_REG_VIN_MASK, val));
   279		else
   280			regmap_write(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
   281				     FIELD_PREP(NCT7201_REG_VIN_MASK, val));
   282	
   283		return 0;
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
