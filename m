Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81006167296;
	Sat,  7 Sep 2024 22:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725749497; cv=none; b=eR7CO3v88BitlS8eEWV8N2jsQovFK2NrqAxiDM0rWZWz0TvsXWm335oLOUOjDdIPpINMiDUUlYjZFpApWRgAxIXHbtGw0AqG28B31K8snJfWSnbFr94hTHLLY9t7D/sIIk5zUg1nVXz5OGZTCFGMLWY+NlX+GtskWG7T6aEqVOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725749497; c=relaxed/simple;
	bh=do842DqulJJ6dI6EnJSEYjNX4gsqnwlO4RWeiRD9jww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cv5g0Ezba2Hp+w5vS3n3+57xDYhrAjGNh5Sue0RVRVguHR+vgC6bGZygnFywiouJMCdyZg1srxx0ZM6SxDd04iVbUfmM6Aq2s5/zgIr9oJOzGk8veQJa3po/pD489OhrrExa5rW+qjA2IxXSAYrqE9jAez3Alo0ALXH2uCiCG7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pb6ysrGF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pb6ysrGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725749495; x=1757285495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=do842DqulJJ6dI6EnJSEYjNX4gsqnwlO4RWeiRD9jww=;
  b=Pb6ysrGF+qX8WEk97a40l3tjIhKlIy5nTfE1zygExd9vxXj3MwSVCqqo
   9RkCznLWJSwJyLkmSkr28pwohwcCMx6nqf/qv1TbvyL6Wr9/gGZv6KhKL
   /18X2B0bU/ahNG8gmJE7ziPv6n9nehmW7l4fz/MDZq4xF04mN6RZLX8YF
   cWMM6uZ91AYLxzFCR9ODaIyc5sghPm/rNnOApy2p23pfUfU3HzNwV6mG5
   IqU8ji5z6dLEBGVEQ3B1LMCGSwQQ0pJvX3weJ7CknPJNcLc2jMqMdvv+x
   EjyVV6vrmcvfuekNW+sHUWfN0YEYC7igrJpYX1JC5onuLfF/PM0CY5iKR
   A==;
X-CSE-ConnectionGUID: 6eeesWQBRtmO/p9qwmPC9g==
X-CSE-MsgGUID: yUDbp3snRFyYWu7+xxnsmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35829792"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="35829792"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 15:51:33 -0700
X-CSE-ConnectionGUID: 8u21cVZpQTWszDXC4sHFxw==
X-CSE-MsgGUID: kD/vSvzLTFyG7uaJTE2dgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="89562848"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Sep 2024 15:51:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn4H9-000D4b-20;
	Sat, 07 Sep 2024 22:51:27 +0000
Date: Sun, 8 Sep 2024 06:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Trevor Gamblin <tgamblin@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	David Lechner <dlechner@baylibre.com>,
	Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH v4 2/3] iio: adc: ad7625: add driver
Message-ID: <202409080658.vblJ5uZm-lkp@intel.com>
References: <20240904-ad7625_r1-v4-2-78bc7dfb2b35@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904-ad7625_r1-v4-2-78bc7dfb2b35@baylibre.com>

Hi Trevor,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1ebd3850421749eb44bd040b249bd4db88d35b33]

url:    https://github.com/intel-lab-lkp/linux/commits/Trevor-Gamblin/dt-bindings-iio-adc-add-AD762x-AD796x-ADCs/20240905-031609
base:   1ebd3850421749eb44bd040b249bd4db88d35b33
patch link:    https://lore.kernel.org/r/20240904-ad7625_r1-v4-2-78bc7dfb2b35%40baylibre.com
patch subject: [PATCH v4 2/3] iio: adc: ad7625: add driver
config: arm-randconfig-002-20240908 (https://download.01.org/0day-ci/archive/20240908/202409080658.vblJ5uZm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080658.vblJ5uZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080658.vblJ5uZm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
>> ERROR: modpost: "pwm_round_waveform_might_sleep" [drivers/iio/adc/ad7625.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
