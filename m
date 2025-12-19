Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B766A2D4B77;
	Fri, 19 Dec 2025 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138231; cv=none; b=bhcATFvtLAzyWo1pyAodzG9L/Kbadr6UotYM/JmCmM3JpAR2BanNFvyG0ZVSbfbjs3MdG8jhfR/+mGKnd9yzWMnhBtXFAG0YF++H4HVyCMfAFe6jrcOvlETqOfYh/OtpJEKIeWmtsJiffAgaSMLkqjpuONwub9INHGb4xjsAqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138231; c=relaxed/simple;
	bh=u89IDNdrVN1pKbu3Ux1Nks5TsvnFdS55bJYVAlc8Vmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2I0NHf9E/4JbuVlXBVbhrQwQdywCYFGXjSdCLiDC9LAzXThltabC/aYyIi+wbaaYEfnP0XsqpZ0f12KvPEb4QC+1l/80Oy9zdh3ufyd8BA6nULLvTWz3klqE55ofqj5KyvLa0RfTEfglKbCIQg8yksJJgOLBnd9AhFEfqjdjkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzrZeYeu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzrZeYeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138229; x=1797674229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u89IDNdrVN1pKbu3Ux1Nks5TsvnFdS55bJYVAlc8Vmk=;
  b=jzrZeYeuD3/ND6kPZhVAT107TR2HBZmPtPkSRfV9mQmIbsyMn2u1eCTP
   RxIaHNNioTTBQAEw1C3B7ZEOjKJ36apx1hsarxM5qgSBpyVb7pqYGNPgI
   F+LsEGO06zccW7BLPLrQbMcInOFhCPovEjkcikYZOyxc4hBdX8e4LelwA
   Z1sD3+T68AOS+llGd3+eQLcc0EMhUUeMUmm039+NonFcJQKK6aogGa52d
   Ww+bms2mhKTiJ+81Kw6HEf3wBzAoTqJK46sC2oA0bW+fyKMbsBeBJtKZS
   DtlcdlS5BQ2wnKN4eKOTZkVSUpoaAlHwvRpx70pzLr5aYphpLz/npb8Ux
   Q==;
X-CSE-ConnectionGUID: oBOCy7orTTqvLo6Fx/Rubw==
X-CSE-MsgGUID: tZwPMsVLTGuGUzwzClPmRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79219290"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="79219290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:57:09 -0800
X-CSE-ConnectionGUID: 0Ue14b+bQUusScmFZuptnw==
X-CSE-MsgGUID: kblD3U/3TUyAgN69cDlMYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229862036"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Dec 2025 01:57:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWXEO-000000003Kt-3q9u;
	Fri, 19 Dec 2025 09:57:04 +0000
Date: Fri, 19 Dec 2025 17:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 2070/2671] sound/soc/codecs/rt1320-sdw.c:1389:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202512191711.wY6XU796-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: da1682d5e8b53a51072552844c551b1b784e52c2 [2070/2671] ASoC: rt1320: support calibration and temperature/r0 loading
config: i386-randconfig-001-20251219 (https://download.01.org/0day-ci/archive/20251219/202512191711.wY6XU796-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191711.wY6XU796-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191711.wY6XU796-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> sound/soc/codecs/rt1320-sdw.c:1389:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
1389 |         if (!fw_ready) {
|             ^~~~~~~~~
sound/soc/codecs/rt1320-sdw.c:1423:9: note: uninitialized use occurs here
1423 |         return ret;
|                ^~~
sound/soc/codecs/rt1320-sdw.c:1389:2: note: remove the 'if' if its condition is always false
1389 |         if (!fw_ready) {
|         ^~~~~~~~~~~~~~~~
1390 |                 dev_warn(dev, "%s, DSP FW is NOT readyn", __func__);
|                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1391 |                 goto _exit_;
|                 ~~~~~~~~~~~~
1392 |         }
|         ~
sound/soc/codecs/rt1320-sdw.c:1368:9: note: initialize the variable 'ret' to silence this warning
1368 |         int ret;
|                ^
|                 = 0
1 warning generated.
--
>> ERROR: modpost: "__udivdi3" [sound/soc/codecs/snd-soc-rt1320-sdw.ko] undefined!
>> ERROR: modpost: "__umoddi3" [sound/soc/codecs/snd-soc-rt1320-sdw.ko] undefined!


vim +1389 sound/soc/codecs/rt1320-sdw.c

  1361	
  1362	static int rt1320_t0_load(struct rt1320_sdw_priv *rt1320, unsigned int l_t0, unsigned int r_t0)
  1363	{
  1364		struct device *dev = &rt1320->sdw_slave->dev;
  1365		unsigned int factor = (1 << 22), fw_ready;
  1366		int l_t0_data[38], r_t0_data[38];
  1367		unsigned int fw_status_addr;
  1368		int ret;
  1369	
  1370		switch (rt1320->dev_id) {
  1371		case RT1320_DEV_ID:
  1372			fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
  1373			break;
  1374		case RT1321_DEV_ID:
  1375			fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
  1376			break;
  1377		default:
  1378			dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
  1379			return -EINVAL;
  1380		}
  1381	
  1382		regmap_write(rt1320->regmap,
  1383				SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
  1384					RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
  1385		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
  1386	
  1387		regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
  1388		fw_ready &= 0x1;
> 1389		if (!fw_ready) {
  1390			dev_warn(dev, "%s, DSP FW is NOT ready\n", __func__);
  1391			goto _exit_;
  1392		}
  1393	
  1394		rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 3, &l_t0_data[0], sizeof(l_t0_data));
  1395		rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 4, &r_t0_data[0], sizeof(r_t0_data));
  1396	
  1397		l_t0_data[37] = l_t0 * factor;
  1398		r_t0_data[37] = r_t0 * factor;
  1399	
  1400		dev_dbg(dev, "%s, write LR t0=0x%x, 0x%x\n", __func__, l_t0_data[37], r_t0_data[37]);
  1401	
  1402		rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 3, &l_t0_data[0], sizeof(l_t0_data));
  1403		rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 4, &r_t0_data[0], sizeof(r_t0_data));
  1404		ret = rt1320_check_fw_ready(rt1320);
  1405		if (ret < 0)
  1406			dev_err(dev, "%s: Failed to set FW param 3,4!\n", __func__);
  1407	
  1408		rt1320->temp_l_calib = l_t0;
  1409		rt1320->temp_r_calib = r_t0;
  1410	
  1411		memset(&l_t0_data[0], 0x00, sizeof(l_t0_data));
  1412		memset(&r_t0_data[0], 0x00, sizeof(r_t0_data));
  1413		rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 3, &l_t0_data[0], sizeof(l_t0_data));
  1414		rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 4, &r_t0_data[0], sizeof(r_t0_data));
  1415		dev_dbg(dev, "%s, read after writing LR t0=0x%x, 0x%x\n", __func__, l_t0_data[37], r_t0_data[37]);
  1416	
  1417	_exit_:
  1418		regmap_write(rt1320->regmap,
  1419				SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
  1420					RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
  1421		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
  1422	
  1423		return ret;
  1424	}
  1425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
