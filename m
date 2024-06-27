Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346C2D030;
	Thu, 27 Jun 2024 06:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719468200; cv=none; b=jt0pFMO7qrmP7UF4rlgowg56mj1+bhnEgzGUNxgrGJI70Q4eG2r6GkHVFvZkV72UsEa1BM+gpCoRvcCJFiRl36d22E55M7+h5nEPdgWlarERe2fZtq5JmKqbinfbqFJ2I4Peeaxw+t59WRFXIBpKntwd2NT/lz5LjgtEzW8M7hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719468200; c=relaxed/simple;
	bh=4CqwC/h8Hq99XyzmVd2N3YYjezUQfz9NB1gbjL7hLIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tkMpP88D8Q/a3GNa5h+tKItOaT4SXkbOBeuuaaNbu54Ejl2Vot3ACnuDjfKlQnhg/uXG+EkmYaR0Gxw/jxXD0HM+19go3fQeIRSEoaGbhBTGrFolThA7UHvWksGme+RS0W2Zt3xF5jeYzT0N5Rlyw/1RvqEBfR9YjaF8sNDNOL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myhSuC/O; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myhSuC/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719468198; x=1751004198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CqwC/h8Hq99XyzmVd2N3YYjezUQfz9NB1gbjL7hLIo=;
  b=myhSuC/OrZpqROkksa/8ob1lv5Fr6Zd5pxkXWTLmf5pSX7K48cIdxMHN
   tWt8x5P7IuaPx2/AESm8cm9f91jKwOGPo3K39UkjpyCybWPT57KmGwq3s
   BI+KvxrI9TkWPXgrK4VgIW/bH5bfLuxTU2Cn86+7ULPIOYd0aTDVdsiVa
   CDsxgjYUZEf0+28b2WQqJNzPvcYEMxQoTHO6V+a7PvzWHM00YaP/dc0sk
   liFJZGIqzbUzaNrHC7DCmMev7npmEtL8VVBez7TlKdJI+cp4pb6DQLG86
   Xh1zzHult9hTWD1DE3AUB+Eq/dWpQlRDehH7g+m0xEE1oyfe5W1bHp49L
   g==;
X-CSE-ConnectionGUID: PgO79wGZSjKhBxs6M0skUQ==
X-CSE-MsgGUID: q1kkK9LcTRCo0Htr1Bd7Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16719829"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16719829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 23:03:18 -0700
X-CSE-ConnectionGUID: l8yesZsUQtqWf5ridgwqzA==
X-CSE-MsgGUID: dWeeFWuaReCNOxLLg4ytZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="81814004"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jun 2024 23:03:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMiDy-000Fxm-0T;
	Thu, 27 Jun 2024 06:03:14 +0000
Date: Thu, 27 Jun 2024 14:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Clark <robdclark@chromium.org>
Subject: [drm-msm:msm-next-robclark 2/9]
 drivers/gpu/drm/msm/adreno/adreno_gpu.c:1070:6: warning: unused variable
 'fcode'
Message-ID: <202406271326.VtVZv0d9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-robclark
head:   52a9d1d57df039b7a9b0bb879b516df7a3c7a04f
commit: 6b0a29e37296e9f22e1d58b75466ac0bb19b7fd1 [2/9] drm/msm/adreno: Implement SMEM-based speed bin
config: i386-buildonly-randconfig-005-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271326.VtVZv0d9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271326.VtVZv0d9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271326.VtVZv0d9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/adreno_gpu.c:1070:6: warning: unused variable 'fcode' [-Wunused-variable]
    1070 |         u32 fcode;
         |             ^~~~~
   1 warning generated.


vim +/fcode +1070 drivers/gpu/drm/msm/adreno/adreno_gpu.c

  1066	
  1067	int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
  1068				 struct device *dev, u32 *fuse)
  1069	{
> 1070		u32 fcode;
  1071		int ret;
  1072	
  1073		/*
  1074		 * Try reading the speedbin via a nvmem cell first
  1075		 * -ENOENT means "no nvmem-cells" and essentially means "old DT" or
  1076		 * "nvmem fuse is irrelevant", simply assume it's fine.
  1077		 */
  1078		ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", fuse);
  1079		if (!ret)
  1080			return 0;
  1081		else if (ret != -ENOENT)
  1082			return dev_err_probe(dev, ret, "Couldn't read the speed bin fuse value\n");
  1083	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
