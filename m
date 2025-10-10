Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1A01F4C99;
	Fri, 10 Oct 2025 04:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760070123; cv=none; b=p+FyzFBL/dFJPZHS9dA1Z6XrZJUKTkigURe5XV84AScYVVanYLaepBgS9np8psUQaTzRc6yKyE9otKfxezlMmGFzSDetddQllYtdFXDS7VLa5cDtwrqbvb0Xnz4h0O0z6cHB8oSNaH7M2WT3ldZHJMHz4IaTFKIoScPpNjc9SB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760070123; c=relaxed/simple;
	bh=V8lVhg40i6i3dzj7FEuSEzfEDeikzBVx4RlBJVsKO+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWnrUKvgK0D5DJmsgwBIXwFLrUu+MPfc/u2GuJ2Bllc9Ls5EVHUQeGqg74LoYHp921tymTKJW0G5baGLaOCcNvi9XwNmqbA5KFSTB46b4zRW+xDipR/yrCoTdJ/7SRoKv2hZg9SxZw8K2D4BRUvU2NcVciE9Fq5JExzyIhw8VxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c57DB32K; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c57DB32K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760070122; x=1791606122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V8lVhg40i6i3dzj7FEuSEzfEDeikzBVx4RlBJVsKO+g=;
  b=c57DB32KSOf0zK988eamVPjR3OfcjjlGWIs61efAOxZM+XlmcAVKFzNt
   07ino3Lxnyd+mBqCZJ0yI+WiShmCoMhNYOEu/C8JNX6kWvbZTM1b4545q
   RtTwxlzS0iMGHQdQSInJTn3R3GiHJUGaFPsZ7a4Ey2bY1Ad5f2j3u+Rpz
   KuHjth36z8QdAo0V7hgUc1tGgasIJ7/Q3K72ohsbk0Ol/yUaZC45hjYOo
   +HciHOXmsIrZA/+VmbU/OCwJ6R2HqpHO4aKpzJ5lsnvpMhM9XYY3wpK+M
   BAxg+dHjDA9j0yR2mxRgVQWO0TvsqxqUiIEoPRKTLow14Nchk8ifcE212
   g==;
X-CSE-ConnectionGUID: M0eyd99kS9OOt5pHmQQAxA==
X-CSE-MsgGUID: Kj0p8onJRjq0stUOW02HwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79931634"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="79931634"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 21:22:00 -0700
X-CSE-ConnectionGUID: 7bOHdkV+SSOVseicgkDGvw==
X-CSE-MsgGUID: Ilpw6yfLTLq+oUU9z57IIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180572606"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2025 21:21:56 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v74dd-00028h-2m;
	Fri, 10 Oct 2025 04:21:53 +0000
Date: Fri, 10 Oct 2025 12:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH 11/19] arm64: dts: amlogic: A4: Add peripherals clock
 controller node
Message-ID: <202510101124.3xwn3STp-lkp@intel.com>
References: <20250930-a4_a5_add_clock_driver-v1-11-a9acf7951589@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-11-a9acf7951589@amlogic.com>

Hi Chuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuan-Liu-via-B4-Relay/dt-bindings-clock-Add-Amlogic-A4-SCMI-clock-controller/20250930-174011
base:   01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
patch link:    https://lore.kernel.org/r/20250930-a4_a5_add_clock_driver-v1-11-a9acf7951589%40amlogic.com
patch subject: [PATCH 11/19] arm64: dts: amlogic: A4: Add peripherals clock controller node
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251010/202510101124.3xwn3STp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101124.3xwn3STp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101124.3xwn3STp-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:119.19-20 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
