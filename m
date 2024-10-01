Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB36BA37;
	Tue,  1 Oct 2024 03:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727751954; cv=none; b=GMSvp+sBWLPmvsu3vNkOf4TA/7L/iCC1t6ebdSKtNq4TyExvmbJFsBHpqweXtrlSTUW+qV2HDbD3wIzaT7pLaMB/84DHx7S7T6rmrCnjzDR8ZmOjupeTFb/Zf1uVhU31YDF9Ea2Jua87PBlTSkHXpGPCeCHdNmv9XrG49nbZHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727751954; c=relaxed/simple;
	bh=irPUzE0q3LMoztClPUKr1FGEat0NuPzhHFsvqqzyfBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNoKmDrB82XNO4uM3hq2EnOo41c8Kstzfz6PPYafMoxwMa4S+swDHboTv5Kb7JQxaVDSq246bO8+j0IiqyXI7zo9dRDoh5Bycmc47Ntg+CynmXNUvx49Xqe/HLOA8sJIHBT+xTnJPN+pkOXEXbn35xiTCBVNc6HRfZZrZbVzmBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LamGV30P; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LamGV30P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727751953; x=1759287953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=irPUzE0q3LMoztClPUKr1FGEat0NuPzhHFsvqqzyfBA=;
  b=LamGV30PvhLe+GIz5drnCEJzdkzZV1/aN+ZBc9Pm7KvjRhWH0vQEYYKZ
   nV+Ka5gDfNUTT38vyw9r4TNzyfBvLfnC3vI2hX8BwCZxYo6ABGCVS8e1q
   0ONbXelzxcKAjn3wFo7QbN88Fsr+3TszYeOJBqJK/aRX1KEKeCr2e0Rz9
   N3/nZHsb9dr8HrAjhFYajfOWMDxx0CK2Jp9HDDu34sI+Nv01rCqRf6KlM
   kvZEEAnjcXquulf5rKGrB0EW2EPTpaKgJrB91Bc83Y+sMgWdVyMOxpnxc
   Jh2E5tpDs2Qkp4xWBYpIG957GPZO89cwHZ8lrxjXieN4uvqiqPmt67t9d
   g==;
X-CSE-ConnectionGUID: /FR0NixATeaZaRL3K1hCKQ==
X-CSE-MsgGUID: QSCVMLE0S1+xg9fhBricyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26323574"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26323574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 20:05:51 -0700
X-CSE-ConnectionGUID: m1HjSWqcQx233YTGxemSFw==
X-CSE-MsgGUID: RlJkglm2TKe4eRVyXvZg3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="77579063"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2024 20:05:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svTCu-000QBZ-0b;
	Tue, 01 Oct 2024 03:05:48 +0000
Date: Tue, 1 Oct 2024 11:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:filekCZcLQ 7/13] sound/soc/codecs/rt1320-sdw.c:564:14:
 warning: result of comparison of constant 4295491583 with expression of type
 'unsigned int' is always false
Message-ID: <202410011159.InLKFd40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filekCZcLQ
head:   4649cbd97fdae5069e9a71cd7669b62b90e03669
commit: d72498fad93abf1817c4998d172a3d7f98f76bbe [7/13] ASoC: rt1320: reads patch code from firmware file
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241001/202410011159.InLKFd40-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011159.InLKFd40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011159.InLKFd40-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt1320-sdw.c:564:14: warning: result of comparison of constant 4295491583 with expression of type 'unsigned int' is always false [-Wtautological-constant-out-of-range-compare]
     564 |                                 if (addr > 0x10007ffff || addr < 0x10007000) {
         |                                     ~~~~ ^ ~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +564 sound/soc/codecs/rt1320-sdw.c

   527	
   528	/*
   529	 * The 'patch code' is written to the patch code area.
   530	 * The patch code area is used for SDCA register expansion flexibility.
   531	 */
   532	static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
   533	{
   534		struct sdw_slave *slave = rt1320->sdw_slave;
   535		const struct firmware *patch;
   536		const char *filename;
   537		unsigned int addr, val;
   538		const unsigned char *ptr;
   539		int ret, i;
   540	
   541		if (rt1320->version_id <= RT1320_VB)
   542			filename = RT1320_VAB_MCU_PATCH;
   543		else
   544			filename = RT1320_VC_MCU_PATCH;
   545	
   546		/* load the patch code here */
   547		ret = request_firmware(&patch, filename, &slave->dev);
   548		if (ret) {
   549			dev_err(&slave->dev, "%s: Failed to load %s firmware", __func__, filename);
   550			regmap_write(rt1320->regmap, 0xc598, 0x00);
   551			regmap_write(rt1320->regmap, 0x10007000, 0x67);
   552			regmap_write(rt1320->regmap, 0x10007001, 0x80);
   553			regmap_write(rt1320->regmap, 0x10007002, 0x00);
   554			regmap_write(rt1320->regmap, 0x10007003, 0x00);
   555		} else {
   556			ptr = (const unsigned char *)patch->data;
   557			if ((patch->size % 8) == 0) {
   558				for (i = 0; i < patch->size; i += 8) {
   559					addr = (ptr[i] & 0xff) | (ptr[i + 1] & 0xff) << 8 |
   560						(ptr[i + 2] & 0xff) << 16 | (ptr[i + 3] & 0xff) << 24;
   561					val = (ptr[i + 4] & 0xff) | (ptr[i + 5] & 0xff) << 8 |
   562						(ptr[i + 6] & 0xff) << 16 | (ptr[i + 7] & 0xff) << 24;
   563	
 > 564					if (addr > 0x10007ffff || addr < 0x10007000) {
   565						dev_err(&slave->dev, "%s: the address 0x%x is wrong", __func__, addr);
   566						goto _exit_;
   567					}
   568					if (val > 0xff) {
   569						dev_err(&slave->dev, "%s: the value 0x%x is wrong", __func__, val);
   570						goto _exit_;
   571					}
   572					regmap_write(rt1320->regmap, addr, val);
   573				}
   574			}
   575	_exit_:
   576			release_firmware(patch);
   577		}
   578	}
   579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
