Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6853BFAD1;
	Tue, 19 May 2026 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779227115; cv=none; b=q0pfnE4jqYVBMyMs6ox5UAw4uta9jSbkf6fDx/kdPgSOsDXRY/R3ivWSusFFPa8HIpKG/VLFCUyqAAPiA1+aEHM5zrTrI08V3vqySvWHokTDcGzXTn75+8KlmQr6ZQYAY27m14IC1Jo6OtvDMBU/aUQqnK5GHSDQynnpAzr0Oho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779227115; c=relaxed/simple;
	bh=qebFy2qPDVeMs+3/tgLPmt2uXuDojECbVJblqLLdvhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqqGCKhTlk+pAhcdTEDO+ssNOqdqqlDVgmsOdJh/BCjHVv3+mm0i0sPMqFixL9B7+5JtxRJwK4hQGkuLFQHJ/ozdxxTg69ZDxPTAEueq1Jutz67XO8Z1KJKY+AIjbnQDfbUeBPj7MSTm1+mcobpPflRCuQqItNnIDWytbC+xyW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fm14skEq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fm14skEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779227114; x=1810763114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qebFy2qPDVeMs+3/tgLPmt2uXuDojECbVJblqLLdvhk=;
  b=fm14skEqjZTF+OwXn6QNssWqqq6qMI+rmnDGmgPDy+b/9YR9oOyjCZMH
   Hgjit3kB/lnbl+r2hLGgx/SCOmo6qiHeOg3YXOAzJYPC5yPPYdzCnkjtB
   5LVRjqen8/79xMgRY8qvx/MgAWQ7Rpe++vEAdM1zcetwXhXErjWaHKVtF
   c0C7EGjJVg1hjjWi9yTfK5rAW3eWRO3yokQp6K/AVwgOfKVnzKezW2dbz
   nahDKmCXW67oHqN/cTsGHp9mOC3l6VFLvTJr9/UEHX7mFM9vUy1ieZmSU
   NkyZKqU3cPu7fnibrX9Ge+vTqO1erWy4YkTtyiez5PfhmkcgfT7zanWuF
   A==;
X-CSE-ConnectionGUID: eFhEno69QK6Bi5Tn/BPsgA==
X-CSE-MsgGUID: trEAKUuNQIaKD7ypSWYdQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="82689034"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="82689034"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 14:45:13 -0700
X-CSE-ConnectionGUID: 0mVkDn4/TwKk8Rv8RSunJQ==
X-CSE-MsgGUID: 1bMaUVs/R9WGgQUwW1deSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237293130"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 May 2026 14:45:11 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPSFR-000000001xV-08sc;
	Tue, 19 May 2026 21:45:09 +0000
Date: Wed, 20 May 2026 05:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nishanth Sampath Kumar <nissampa@cisco.com>, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	linux-kernel@vger.kernel.org, nissampa@cisco.com
Subject: Re: [PATCH] regmap-i2c: fix sparse warning in
 regmap_smbus_word_write_reg16
Message-ID: <202605200528.vTiSwokq-lkp@intel.com>
References: <20260519170836.1344260-1-nissampa@cisco.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519170836.1344260-1-nissampa@cisco.com>

Hi Nishanth,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regmap/for-next]
[also build test ERROR on linus/master v7.1-rc4 next-20260519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nishanth-Sampath-Kumar/regmap-i2c-fix-sparse-warning-in-regmap_smbus_word_write_reg16/20260520-011137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
patch link:    https://lore.kernel.org/r/20260519170836.1344260-1-nissampa%40cisco.com
patch subject: [PATCH] regmap-i2c: fix sparse warning in regmap_smbus_word_write_reg16
config: arm64-randconfig-004-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200528.vTiSwokq-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200528.vTiSwokq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200528.vTiSwokq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/regmap/regmap-i2c.c:340:33: error: expected ';' after return statement
                                            ((u16)val << 8) | addr_lo));
                                                                      ^
                                                                      ;
   1 error generated.


vim +340 drivers/base/regmap/regmap-i2c.c

   305	
   306	/*
   307	 * SMBus byte/word reg16 support for adapters that have SMBUS_BYTE_DATA
   308	 * and SMBUS_WORD_DATA but lack I2C_FUNC_I2C and I2C_FUNC_SMBUS_I2C_BLOCK,
   309	 * such as the AMD PIIX4.
   310	 *
   311	 * READ:  set 16-bit EEPROM address via write_byte_data(addr_lo, addr_hi),
   312	 *        then sequentially read bytes via read_byte() (EEPROM auto-
   313	 *        increments the address pointer).  Same as the I2C-block reg16
   314	 *        read path above.
   315	 *
   316	 * WRITE: encode the low address byte and data into a word transaction:
   317	 *        write_word_data(addr_hi, (data_byte << 8) | addr_lo).
   318	 *        Only single-byte writes are supported (one value per transaction).
   319	 */
   320	static int regmap_smbus_word_write_reg16(void *context, const void *data,
   321						 size_t count)
   322	{
   323		struct device *dev = context;
   324		struct i2c_client *i2c = to_i2c_client(dev);
   325		u8 addr_hi, addr_lo, val;
   326	
   327		/*
   328		 * data layout: [addr_hi, addr_lo, val0, val1, ...].
   329		 * Only single-byte value writes are supported; multi-byte would
   330		 * require raw I2C (or repeated word writes with incrementing address).
   331		 */
   332		if (count != 3)
   333			return -EINVAL;
   334	
   335		addr_hi = ((u8 *)data)[0];
   336		addr_lo = ((u8 *)data)[1];
   337		val = ((u8 *)data)[2];
   338	
   339		return i2c_smbus_write_word_data(i2c, addr_hi,
 > 340						 ((u16)val << 8) | addr_lo));
   341	}
   342	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
