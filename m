Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0798817625F;
	Tue,  6 Aug 2024 23:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722987475; cv=none; b=gRlXXqmfMftZorEWTd71EpbgQqlyR7uT8ZMyI8cHnrp7uB0BbMgsxr11gtT8MtrhfzadAmVyy18qz05Mv9jFVxeLWcj6O4UZ+ghf8c59KIV6eg8wzlk1eMAFX5nQm0pjH2qbt+lJQEAiFBAG34TnowfxbMmrrB4eeqOIy6Q99fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722987475; c=relaxed/simple;
	bh=pVU0n7ci3F6+UFfQP8dV4uYLwTh32rVMpJkGCk06Uc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LeUX9EBByovN3PXJntzkCMw3sBOC/dsdLeUatm1T1Pg/tcfpsZZvHUPBQFBY/2r+/lhqzhznGxvI23HRFuhGs9g3rJIaAKPdJTdKhBE2KOl/cQBVQwtWjhzw4d/k5RMYzWqsWZXA/qDjUtaNCQIoTWApZMRSZ03DzrXhOmNlZTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGRSrd5Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGRSrd5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722987474; x=1754523474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pVU0n7ci3F6+UFfQP8dV4uYLwTh32rVMpJkGCk06Uc0=;
  b=nGRSrd5ZowMBpEMgDMHbCtLbprSDWRgE5vxp7fWgEQECww9fOnPMShs3
   l3hUPrQWF9Iqj2td8N+W5Nqk9z5u92dFU4miuB9E1bJvKOpWX200ZaJUg
   5haMfzpzZVUdZ8csbReFXU2hs3RA3wmw2p0SV02PB+YhynCGmTHXUQEGa
   gxRkd04e1io+Ijh0Cq/Kr2n5EZvjaSxwrBaIq8/Du7VuDOY/vdMGQfXbu
   +y8MSMXlSWLerEL3zt2WZirmcwSmnuSczhmstvxOsBNqnxGOXrDYFB6im
   aNYBVL+j/Vl9kahgjrssdzk1MwAE/+I43izG+oTNjUDvrP0WdAqcDJtb1
   g==;
X-CSE-ConnectionGUID: x1uH6xp+T6CyAtbSpT3a4Q==
X-CSE-MsgGUID: WZ3y5jFnTE+JbXDobiKETw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21179042"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21179042"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 16:37:53 -0700
X-CSE-ConnectionGUID: rvOtBKaZSYe6IZxrgsCYgA==
X-CSE-MsgGUID: Z7QUpPY8Tp2UJQrmC83HoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61611107"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2024 16:37:51 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbTkQ-0004uk-16;
	Tue, 06 Aug 2024 23:37:47 +0000
Date: Wed, 7 Aug 2024 07:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Swenson <kyle.swenson@est.tech>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [linux-next:master 2649/3348] drivers/net/pse-pd/tps23881.c:755:6:
 error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202408070727.jLebkEWg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1e391b34f6aa043c7afa40a2103163a0ef06d179
commit: c4b28e5699d2a789fc9464e7ce89f2a1e9d5085d [2649/3348] net: pse-pd: tps23881: Fix the device ID check
config: powerpc64-randconfig-001-20240807 (https://download.01.org/0day-ci/archive/20240807/202408070727.jLebkEWg-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070727.jLebkEWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070727.jLebkEWg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/pse-pd/tps23881.c:755:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           if (FIELD_GET(TPS23881_REG_DEVID_MASK, ret) != TPS23881_DEVICE_ID) {
               ^
   1 error generated.


vim +/FIELD_GET +755 drivers/net/pse-pd/tps23881.c

   734	
   735	static int tps23881_i2c_probe(struct i2c_client *client)
   736	{
   737		struct device *dev = &client->dev;
   738		struct tps23881_priv *priv;
   739		int ret;
   740		u8 val;
   741	
   742		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
   743			dev_err(dev, "i2c check functionality failed\n");
   744			return -ENXIO;
   745		}
   746	
   747		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   748		if (!priv)
   749			return -ENOMEM;
   750	
   751		ret = i2c_smbus_read_byte_data(client, TPS23881_REG_DEVID);
   752		if (ret < 0)
   753			return ret;
   754	
 > 755		if (FIELD_GET(TPS23881_REG_DEVID_MASK, ret) != TPS23881_DEVICE_ID) {
   756			dev_err(dev, "Wrong device ID\n");
   757			return -ENXIO;
   758		}
   759	
   760		ret = tps23881_flash_sram_fw(client);
   761		if (ret < 0)
   762			return ret;
   763	
   764		ret = i2c_smbus_read_byte_data(client, TPS23881_REG_FWREV);
   765		if (ret < 0)
   766			return ret;
   767	
   768		dev_info(&client->dev, "Firmware revision 0x%x\n", ret);
   769	
   770		/* Set configuration B, 16 bit access on a single device address */
   771		ret = i2c_smbus_read_byte_data(client, TPS23881_REG_GEN_MASK);
   772		if (ret < 0)
   773			return ret;
   774	
   775		val = ret | TPS23881_REG_NBITACC;
   776		ret = i2c_smbus_write_byte_data(client, TPS23881_REG_GEN_MASK, val);
   777		if (ret)
   778			return ret;
   779	
   780		priv->client = client;
   781		i2c_set_clientdata(client, priv);
   782		priv->np = dev->of_node;
   783	
   784		priv->pcdev.owner = THIS_MODULE;
   785		priv->pcdev.ops = &tps23881_ops;
   786		priv->pcdev.dev = dev;
   787		priv->pcdev.types = ETHTOOL_PSE_C33;
   788		priv->pcdev.nr_lines = TPS23881_MAX_CHANS;
   789		ret = devm_pse_controller_register(dev, &priv->pcdev);
   790		if (ret) {
   791			return dev_err_probe(dev, ret,
   792					     "failed to register PSE controller\n");
   793		}
   794	
   795		return ret;
   796	}
   797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
