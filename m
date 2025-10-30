Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2830BF68;
	Thu, 30 Oct 2025 21:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761861017; cv=none; b=PefH/plA0Wq+xddzeIy3cedHy8k7UhiWK/Rh+nqdYg3YV2lPaoqv77eWMyCIV/Rj8fhpQimreiHBXJhGyoDgHs2mTKptbt3tUiXntNNyO1HzN7BZlEy4hI9dAm9PH/1XESQEvEAdtUjJ276Pa+yedpTHZO6TvQTgxRbHCVZLjS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761861017; c=relaxed/simple;
	bh=uhsBi6jPYk4r7zoS0KFwjGrcAihOvbPQ1OZl8wiwXVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCEYYh+Qp/EP0wxeVUwVu+VU5OAHJy7tyvTivvMZDefTBEXQWlNKsbviyxT0FE5C9UgCBKj2p/i1T6y7yiQ2jGmqvC4bCebp6sT9BsXF3kCZfZwqCg1O0DD8l+RMn/UvY/xphKd291oORADzFtCyk7YiWoIHh7q3OJ4xPMOhJzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzbE7McX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzbE7McX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761861016; x=1793397016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uhsBi6jPYk4r7zoS0KFwjGrcAihOvbPQ1OZl8wiwXVg=;
  b=ZzbE7McXuckRTmtONo9jvxI7uyGY4m4KhBJ9CfWUz3/d3TLRGhro8AuD
   WOZrFzoSEQO/uwxRt02YvhkVKBnRB6Yx62l4efBJK7QANYRYrJSHrPtcW
   /60BP0y032vj/Iv+J14rLQR+UTfUipqaHLszvvkQqKEhZN+niDxT2w2ko
   m21MC5BKAzBDguK/Csw+o1gGop8csouOHbYyaUA1COXLMpqG9KN3/YXpm
   M/fuXI7YX+xJzlNDyoKBwBmnc0jR52FP+3ntIvsTWCWa9d29bsgMz1IfN
   bw3LgxrdNEnjrQzCs+KeuROE/c+sZQYmjUB+Fc9nJ4Et1wOZlTgLHXcEW
   w==;
X-CSE-ConnectionGUID: EpHEbKI9Scqm4q60AZ7q1A==
X-CSE-MsgGUID: 25wnT4A7QmWj5L0gp4WdZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89483147"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="89483147"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 14:50:15 -0700
X-CSE-ConnectionGUID: mqKL0/XMRAu6LM36rYEPAQ==
X-CSE-MsgGUID: UsRHOMzSR5SIqQrleSv+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186404807"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2025 14:50:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEaX4-000MYi-28;
	Thu, 30 Oct 2025 21:50:10 +0000
Date: Fri, 31 Oct 2025 05:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, broonie@kernel.org, dlan@gentoo.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	p.zabel@pengutronix.de, linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
Message-ID: <202510310505.d7e7kzCk-lkp@intel.com>
References: <20251027125504.297033-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027125504.297033-3-elder@riscstar.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-spi-add-SpacemiT-K1-SPI-support/20251027-211246
base:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
patch link:    https://lore.kernel.org/r/20251027125504.297033-3-elder%40riscstar.com
patch subject: [PATCH v6 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251031/202510310505.d7e7kzCk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310505.d7e7kzCk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310505.d7e7kzCk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_udivdi3" [drivers/spi/spi-spacemit-k1.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMA_CMA
   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
   Selected by [m]:
   - SND_SOC_K1_I2S [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && (COMPILE_TEST [=y] || ARCH_SPACEMIT) && HAVE_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
