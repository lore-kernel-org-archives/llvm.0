Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4417E1A316E;
	Mon, 19 Jan 2026 02:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791067; cv=none; b=FpLCdusk0nEakS79HY0rP94maB65IqoGF0SdphX8OfnhcMoW8Gattw9oboetaKtwH98UPxZgYarcOxXuyz0WC1G1SkMA8SsCRVvLcVqQ3l3K6iBVLFlG4HSnGBNHIMnEeuT1b+3N9d4ngntbAZYVF+rACXKwnw+PVbsmqWiKt7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791067; c=relaxed/simple;
	bh=xI9G2YDyHw/tx9H9sGNetm3vjJdCmg+aOfmGoZ8Mhq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8SEDGZnNy77oexLP+Xw4tAlcwOu7Rbmp66CyDPX/2Vnuk7x5sgnz6bLcWVKcD05Y5AsuNcrM3XamTHnGPu4BjB6fQSYpQ9lV6JdnG63JA/2SeIgQ4WXyX0LGKuS4CyvbHhy4FkNYPlfTR1PjxRuXBHLQ1eUELwy5X72P1PZSSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDpY74rD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDpY74rD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768791065; x=1800327065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xI9G2YDyHw/tx9H9sGNetm3vjJdCmg+aOfmGoZ8Mhq8=;
  b=YDpY74rDqT3YhRyHjaWI/3ZeQW8ctDqPBnehoDmvDrmSDss/jyOv6+Vi
   yy17AjDQnINMriPGGZ9TPMCU7Dh+6LM/gTZTd2Q70YcGRTIe+RsiQqaUM
   GUgdQpYRKN+FY4ZK43+/pfMLhbB5viUjSrLWwlS0nPpj5U1XiHCVjsxO3
   BpnksmZDcaUivnGUijQ/RlCGuOGsj6aeLz4xYol2OYvjEQuMBOsSEkYZ6
   rd1PmzF6sD/gwt1f1v0esq0PY4/CG3tvfJNzUa4dOLK8sPRYFiZ+zKoeS
   RuDjgRIjESnPUJRSYLLDRXAP1f3si24CO3qkd3vFHugwK23sERUVVCW9r
   Q==;
X-CSE-ConnectionGUID: at/yqH7DTjKCl7x1yyyS1A==
X-CSE-MsgGUID: lRTZ3oCrQcSg5pQUv4a+Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70048618"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="70048618"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 18:51:03 -0800
X-CSE-ConnectionGUID: ENxeChpQQ12P3LAlJoi54A==
X-CSE-MsgGUID: wpMXrPiuSmqC+Z6jPXcqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="237029681"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2026 18:51:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhfM3-00000000NNh-3WtD;
	Mon, 19 Jan 2026 02:50:59 +0000
Date: Mon, 19 Jan 2026 10:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 7/9] iio: Expand IIO event interface for
 real-world unit handling
Message-ID: <202601191016.14C0gjBY-lkp@intel.com>
References: <6d9baa8d553d03a41fbd97bca0377a7a4779a93e.1768759292.git.marcelo.schmitt1@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d9baa8d553d03a41fbd97bca0377a7a4779a93e.1768759292.git.marcelo.schmitt1@gmail.com>

Hi Marcelo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c30e80d68a7afb334fde7147ee0106f25dd58d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/iio-ABI-Drop-unused-in_energy_input/20260119-022321
base:   c30e80d68a7afb334fde7147ee0106f25dd58d3a
patch link:    https://lore.kernel.org/r/6d9baa8d553d03a41fbd97bca0377a7a4779a93e.1768759292.git.marcelo.schmitt1%40gmail.com
patch subject: [RFC PATCH v1 7/9] iio: Expand IIO event interface for real-world unit handling
config: i386-buildonly-randconfig-005-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191016.14C0gjBY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191016.14C0gjBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191016.14C0gjBY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/dac/ad8460.c:653:23: error: incompatible function pointer types initializing 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, enum iio_event_info, enum iio_event_unit, int, int)' with an expression of type 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, enum iio_event_info, int, int)' [-Wincompatible-function-pointer-types]
     653 |         .write_event_value = &ad8460_write_event_value,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad8460.c:654:22: error: incompatible function pointer types initializing 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, enum iio_event_info, enum iio_event_unit, int *, int *)' with an expression of type 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, enum iio_event_info, int *, int *)' [-Wincompatible-function-pointer-types]
     654 |         .read_event_value = &ad8460_read_event_value,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +653 drivers/iio/dac/ad8460.c

a976ef24c62540d Mariel Tinaco 2024-09-12  649  
a976ef24c62540d Mariel Tinaco 2024-09-12  650  static const struct iio_info ad8460_info = {
a976ef24c62540d Mariel Tinaco 2024-09-12  651  	.read_raw = &ad8460_read_raw,
a976ef24c62540d Mariel Tinaco 2024-09-12  652  	.write_raw = &ad8460_write_raw,
a976ef24c62540d Mariel Tinaco 2024-09-12 @653  	.write_event_value = &ad8460_write_event_value,
a976ef24c62540d Mariel Tinaco 2024-09-12  654  	.read_event_value = &ad8460_read_event_value,
a976ef24c62540d Mariel Tinaco 2024-09-12  655  	.write_event_config = &ad8460_write_event_config,
a976ef24c62540d Mariel Tinaco 2024-09-12  656  	.read_event_config = &ad8460_read_event_config,
a976ef24c62540d Mariel Tinaco 2024-09-12  657  	.debugfs_reg_access = &ad8460_reg_access,
a976ef24c62540d Mariel Tinaco 2024-09-12  658  };
a976ef24c62540d Mariel Tinaco 2024-09-12  659  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
