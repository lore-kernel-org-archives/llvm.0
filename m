Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E91DE3C3;
	Tue,  7 Jan 2025 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736233637; cv=none; b=W2QhPlv/fFPy809YmrzzalwQPon9aY/kK6RlJk1sjCMjBFRa8E9vhZ9T0UM/atOBiNtSx/A3fujU+3+TfC4gdP3ri4rlaMtP/y629bdqhJ3KfVaA7bFIfXQF+luqAWd3RamWnDiVWr7VHsO/jMoMEYtkVqSQereDV5rJBijX+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736233637; c=relaxed/simple;
	bh=cBvHJaVWeBjeJ/PISu1wZvr0CC7LQUYnuw9giVpoK+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nnU6RGhU6UlkTbHC9oBapaoSolPZEq0Wx2MGpPhUp9HAbRakLS6kcvHrBs2mP+r1RtpbxiZ7m78lWT6BjHXAIhE/Q+ehOMHJcoVZe946Kbk4MAbauLag53sQPYqdtvTNBpnp8SW4QSnl+8ZSnrh+aFOfPr5Mm/yN7P8lXIsvNEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYR6WDrm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYR6WDrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736233634; x=1767769634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cBvHJaVWeBjeJ/PISu1wZvr0CC7LQUYnuw9giVpoK+0=;
  b=DYR6WDrmb2J2Fn09sFJsDjf9NXQfmoREhw+bcoDOh0UM5H69KUWPEjL6
   s3i87DvsuZ23SVHIU324cA9KyJOGAFZi+AB2W+IvLLXwzfna8pRM2jhDf
   +0z8gdNqkaIaacp9eRFcVzcHh4p5FlICjn55HG/o9gQ6SYnPycCBW3R5b
   /wMRti9pBibSSrTT2jw2VpCKBe9bvC1z+Yx/F4UsEReCIRcioeaSrB7ur
   z+VaKESX1CHc34yIM+NeBRIo/CA4Oq6HDDWhWRism3Gt2KjUDR9psJaaM
   li4tKiPr0WRY49cQnZxHiSQHh3jLu7GzSumY2FcmObykOfPgAlWqoWCn7
   A==;
X-CSE-ConnectionGUID: 0mqgz0SYTuaTQJwFxwufaw==
X-CSE-MsgGUID: 96DO9xSXSDCmj+o2d3urwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36419536"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36419536"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 23:07:13 -0800
X-CSE-ConnectionGUID: XizBfwSXRka/68e++4MD6Q==
X-CSE-MsgGUID: j1xSHsNWRciXPhScdf+q+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="102481070"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jan 2025 23:07:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV3gD-000ELX-0W;
	Tue, 07 Jan 2025 07:07:09 +0000
Date: Tue, 7 Jan 2025 15:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:20241217_ckeepax_expand_soundwire_mbq_register_map_support
 4/4] drivers/base/regmap/regmap-sdw-mbq.c:57:6: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is false
Message-ID: <202501071455.Gv6kl3eR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20241217_ckeepax_expand_soundwire_mbq_register_map_support
head:   766e902f1c1c12164474c206edae09c3af3a5318
commit: 766e902f1c1c12164474c206edae09c3af3a5318 [4/4] regmap: sdw-mbq: Add support for SDCA deferred controls
config: x86_64-randconfig-076-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071455.Gv6kl3eR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071455.Gv6kl3eR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071455.Gv6kl3eR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/regmap/regmap-sdw-mbq.c:57:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      57 |         if (ctx->readable_reg(dev, reg)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-sdw-mbq.c:70:9: note: uninitialized use occurs here
      70 |         return ret;
         |                ^~~
   drivers/base/regmap/regmap-sdw-mbq.c:57:2: note: remove the 'if' if its condition is always true
      57 |         if (ctx->readable_reg(dev, reg)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      58 |                 ret = read_poll_timeout(sdw_read_no_pm, val,
      59 |                                         val < 0 || !(val & SDCA_CTL_ENTITY_0_FUNCTION_BUSY),
      60 |                                         ctx->cfg.timeout_us, ctx->cfg.retry_us,
      61 |                                         false, slave, reg);
      62 |                 if (val < 0)
      63 |                         return val;
      64 |                 if (ret)
      65 |                         dev_err(dev, "Function busy timed out 0x%x: %d\n", reg, val);
      66 |         } else {
         |           ~~~~~~
      67 |                 fsleep(ctx->cfg.timeout_us);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      68 |         }
         |         ~
   drivers/base/regmap/regmap-sdw-mbq.c:50:14: note: initialize the variable 'ret' to silence this warning
      50 |         int val, ret;
         |                     ^
         |                      = 0
   1 warning generated.


vim +57 drivers/base/regmap/regmap-sdw-mbq.c

    45	
    46	static int regmap_sdw_mbq_poll_busy(struct sdw_slave *slave, unsigned int reg,
    47					    struct regmap_mbq_context *ctx)
    48	{
    49		struct device *dev = &slave->dev;
    50		int val, ret;
    51	
    52		dev_dbg(dev, "Deferring transaction for 0x%x\n", reg);
    53	
    54		reg = SDW_SDCA_CTL(SDW_SDCA_CTL_FUNC(reg), 0,
    55				   SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
    56	
  > 57		if (ctx->readable_reg(dev, reg)) {
    58			ret = read_poll_timeout(sdw_read_no_pm, val,
    59						val < 0 || !(val & SDCA_CTL_ENTITY_0_FUNCTION_BUSY),
    60						ctx->cfg.timeout_us, ctx->cfg.retry_us,
    61						false, slave, reg);
    62			if (val < 0)
    63				return val;
    64			if (ret)
    65				dev_err(dev, "Function busy timed out 0x%x: %d\n", reg, val);
    66		} else {
    67			fsleep(ctx->cfg.timeout_us);
    68		}
    69	
    70		return ret;
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
