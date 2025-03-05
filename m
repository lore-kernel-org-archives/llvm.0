Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BC2254859;
	Wed,  5 Mar 2025 20:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741206847; cv=none; b=V7skld0yPnp8eOiCUrMfNhrjjaA/1pnnMK4IrugvtTh/vY/yZhYiL1sjdDp3yQqZZ6PD+LpaAehJMCPY6EWPSf/gyHzj5NFoZ4uhhbz0lPOFm07nAeN10xav4L2zJbT5aoVXVJi3m7sh33IHqy2m0CPkQJO7KjQrJb+KJuYRIPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741206847; c=relaxed/simple;
	bh=pnPnl0Y7Hh2+wMBdn/c6Xp+d9j2XPjWTAzEbuMwtIyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijjF9XZtq2n0l7BE7tO7Jf0TtcZWDEG2Wfp+T9sepf9/1fdEkZxukpDrWNT/wD8+x1n0saFT7r3IsmfEAuP+6s7iz98XGJMuRHg9v5vLiGx5VvZKFHJ3NhMTnkp1nc5zcb3Fy8dYfru5fVg080KcJ+gJMnCR2FoUDP6cZT3cr/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrA67gTe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrA67gTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741206846; x=1772742846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pnPnl0Y7Hh2+wMBdn/c6Xp+d9j2XPjWTAzEbuMwtIyQ=;
  b=BrA67gTeW/5t+VOi1i/RicwP+ivlYCS74Unjhvkl3CUrY1Rw2Wko0oCp
   QcdzyhYLvPzmsoX2bMuFqRnH9r2zBa8ANGCMstNTvtMgf5q7/XlnEGez9
   rfSaMxgHmj9wCZLF1Lrs8khO3n/QJ4hBrPSw8X3rXW7+lKZ1smcWYx9dO
   O1AzN+vR91wZpfPV/HbNwf5FaCAUGdseG7wq/j5UJ5fQCWUoTYydV12XL
   bscmMMe2l4k9du6hQaULkX01akKYo6z3haNDbJRfkDLfT+yo2fnW4u1hP
   5taoGiJdBJtBW0A8NYvyEj9PX+ePNdeZ4IBpK7BjmqLXeQlO8/Rf9d3rc
   Q==;
X-CSE-ConnectionGUID: vs6Cx4d1T3KWAzRZ7j2iCQ==
X-CSE-MsgGUID: sRUNJIRtQtGQ3FI+RHM1+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42390885"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="42390885"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 12:34:04 -0800
X-CSE-ConnectionGUID: UwSLidiaRdeam5BscguJxg==
X-CSE-MsgGUID: 6jagxbcLR+29I2UWtemHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118723547"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2025 12:33:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpvRE-000MB4-2T;
	Wed, 05 Mar 2025 20:33:56 +0000
Date: Thu, 6 Mar 2025 04:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>, dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev
Subject: Re: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <202503060435.1c1akI1Q-lkp@intel.com>
References: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Sverdlin/dt-bindings-mfd-sophgo-add-RTC-support-for-Sophgo-CV1800-series-SoC/20250303-035433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250302195205.3183174-3-alexander.sverdlin%40gmail.com
patch subject: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503060435.1c1akI1Q-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060435.1c1akI1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060435.1c1akI1Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/cv1800-rtcsys.c:30:30: warning: unused variable 'cv1800_rtcsys_rtc_subdev' [-Wunused-const-variable]
      30 | static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/cv1800_rtcsys_rtc_subdev +30 drivers/mfd/cv1800-rtcsys.c

    29	
  > 30	static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
    31		MFD_CELL_NAME("cv1800-rtc");
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
