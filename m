Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A6360;
	Sun,  9 Jun 2024 00:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717892077; cv=none; b=iewyinw3Vgfk7xCX4uZ5l7fbLdxwtFMKo5bLk/TJhZp8QYkceeXgboPDBFXarCTRHNTrrgNg/2lBlqXdWNurLSEG4rw/E5xgmnlRmKUb2KUgbRZ6eNsWh2QoOjxL0D25esHcW9KwzgZ/llRCOMTUwCU+/CBcQ88vDXi6ospITco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717892077; c=relaxed/simple;
	bh=IOI6lXsi7wVXPFob3pgoF6jGNtr1tt6o0DZPgu/mUzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K1PrWwaokDB4KveREttVsx9Higcte3Oq47SPteu/cEJ7IKKIEhnLBongy8IALoW7ljqOsC/I/LFMZwFyHO6vUl+2pLI955HlmxGb6awhNubC7MN0FbQRrnSKCh14FSawd8UAz47JD2OEBKfKppZVZtVyU/aNeDdYTGSVWx5/H0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKKN8wx3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKKN8wx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717892075; x=1749428075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IOI6lXsi7wVXPFob3pgoF6jGNtr1tt6o0DZPgu/mUzk=;
  b=hKKN8wx3D8/Ohzq6/TjG5z5YfTqX17kS1PER2rZ2VxvXBXuiO56iu2ZO
   4ZRYzbfhD/v0F30oQs/NSy2ivZC8jANhn/b/sRAVM2DnOGK4g6MpR79ft
   eJ9mr7ngu/mgRcbxdCKePCCGAqGX6Di8oUvBcIwdAxXrssz8WGNxfEdD0
   jfAmhVLxooltsBStiExSElxljcHXdtp4WVuzrp23X526Xku7mxfgNZwRG
   1iUGwsSyl4MoQM8uIHdwUwo1OKkYKwX1W1sU6tSl14m17Ww1K25p7r3Ro
   huG5RPqomp8PD4RW9gCcknfSJHKec/FnBaSHuMM3Dk7tQ5d9fcPp7zOEk
   g==;
X-CSE-ConnectionGUID: 9IUh8u/gRACg98ONnKiU1w==
X-CSE-MsgGUID: T36nI3X+S2+v13k75VYoFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14722124"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14722124"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 17:14:35 -0700
X-CSE-ConnectionGUID: OsYbLfgpTRCOlXTO9uYP/w==
X-CSE-MsgGUID: nGyND92YTkKOyrN7WIG2pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43239392"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 17:14:33 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG6Cd-0000fo-1G;
	Sun, 09 Jun 2024 00:14:31 +0000
Date: Sun, 9 Jun 2024 08:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:pr/299 1/2] drivers/hwmon/macsmc-hwmon.c:140:9: error:
 call to undeclared function 'apple_smc_read_ioft_scaled'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202406090855.tnxjdraL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/299
head:   c747afcb4faf15ecaef3f3785074c54e20de3435
commit: 440f66645a8489ecd8d10e212a227557e42261f8 [1/2] hwmon: add macsmc-hwmon driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240609/202406090855.tnxjdraL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090855.tnxjdraL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090855.tnxjdraL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/macsmc-hwmon.c:140:9: error: call to undeclared function 'apple_smc_read_ioft_scaled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |                 ret = apple_smc_read_ioft_scaled(smc, sensor->macsmc_key, &ioft,
         |                       ^
   drivers/hwmon/macsmc-hwmon.c:140:9: note: did you mean 'apple_smc_read_f32_scaled'?
   include/linux/mfd/macsmc.h:83:5: note: 'apple_smc_read_f32_scaled' declared here
      83 | int apple_smc_read_f32_scaled(struct apple_smc *smc, smc_key key, int *p, int scale);
         |     ^
   1 error generated.


vim +/apple_smc_read_ioft_scaled +140 drivers/hwmon/macsmc-hwmon.c

   113	
   114	/*
   115	 * The SMC has keys of multiple types, denoted by a FourCC of the same format
   116	 * as the key ID. We don't know what data type a key encodes until we poke at it.
   117	 *
   118	 * TODO: support other key types
   119	 */
   120	static int macsmc_hwmon_read_key(struct apple_smc *smc,
   121					struct macsmc_hwmon_sensor *sensor, int scale,
   122					long *val)
   123	{
   124		int ret = 0;
   125	
   126		switch (sensor->info.type_code) {
   127		/* 32-bit IEEE 754 float */
   128		case _SMC_KEY("flt "): {
   129			u32 flt_ = 0;
   130	
   131			ret = apple_smc_read_f32_scaled(smc, sensor->macsmc_key, &flt_,
   132							scale);
   133			*val = flt_;
   134			break;
   135		}
   136		/* 48.16 fixed point decimal */
   137		case _SMC_KEY("ioft"): {
   138			u64 ioft = 0;
   139	
 > 140			ret = apple_smc_read_ioft_scaled(smc, sensor->macsmc_key, &ioft,
   141							scale);
   142			*val = ioft;
   143			break;
   144		}
   145		default:
   146			return -EOPNOTSUPP;
   147		}
   148	
   149		if (ret)
   150			return -EINVAL;
   151	
   152	
   153		return 0;
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
