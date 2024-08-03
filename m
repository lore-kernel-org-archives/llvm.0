Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD6349647;
	Sat,  3 Aug 2024 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722671924; cv=none; b=bHVvV3KSsDWIDbGlSGi+yR8kx/N1qMTNmprS8F5wAAQyH/wfhx94PwPmgfcPX04OT5pQHUFB4X/5/PlznQ2orefTYMvXq6r5440SzHF3r/Jsi8YlCdnBkydBL+23HgVqrbz50IVe1h5HqGhKVV2g5miT926VBHrCL6ktL9luY/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722671924; c=relaxed/simple;
	bh=Tmhy9x28m4fqBFRPAkuSRtvypk1CzkzPz54QUFusO6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8XOx2/ttFFtpEwoQU8Ak1pOmtFgKBmUVYzatm2JGvEbW2ktb0UdMHDz1bmsoJsJb2a+09/UIGAF66xbl8w6gVicrOfdj1EYCs+XrSyHlUGeBBxvnfbs+CJ+Av63kfZyfTFLR1DwtWXkwObl3I37zRXh3bmIGJJn7w3mSu5fJEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTvVnCsH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTvVnCsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722671922; x=1754207922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tmhy9x28m4fqBFRPAkuSRtvypk1CzkzPz54QUFusO6Q=;
  b=jTvVnCsHY49Pq5iGkljQMwiy4wFLZXpIzKJR5ktIEX2/UU/gc8oZpG7D
   F2VkOqpTalx3sfmqejgkaOHOl2QP1UKULGvka28pWgRcCILQQIup+nhLG
   RGN/POTLB531Cu3lrkyxQRMRiSbD5TXE/AHQO+ohcVgMyO1PwWIUn6gzC
   YxKRH/c6PciexN6TRIzYH6zol+XlH34gcoykotST0nHa6Hbc2Oyea94Wc
   3Ke5nDVxi9XOsdBeigKj2OLz/2xAR+bCK6EDr4g1NMg+mmkdwlLAVDvEU
   lW6nhwKSzUCfYyr7W61xwVKmHH7/vRmKodZFt6ADvVUxWwOefuso8Mc4D
   w==;
X-CSE-ConnectionGUID: OK42pvfnQFSkXHr/LtKjpQ==
X-CSE-MsgGUID: yEdaogJWSm+JUWCp3/fOcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20642858"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20642858"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 00:58:34 -0700
X-CSE-ConnectionGUID: Ayavin1uQwWLLq0B/yzZ6g==
X-CSE-MsgGUID: x2mHZiK/Sy+IPb4BELHYJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="55310305"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Aug 2024 00:58:32 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa9eI-0000Ha-0Z;
	Sat, 03 Aug 2024 07:58:09 +0000
Date: Sat, 3 Aug 2024 15:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Swenson <kyle.swenson@est.tech>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [netdev-net:main 4/5] drivers/net/pse-pd/tps23881.c:755:6: error:
 call to undeclared function 'FIELD_GET'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202408031528.M5Qden7Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
head:   fba917b169bea5f8f2ee300e19d5f7a6341a5251
commit: 89108cb5c28527c1882df2987394e5c261a1f4aa [4/5] net: pse-pd: tps23881: Fix the device ID check
config: i386-randconfig-003-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031528.M5Qden7Z-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031528.M5Qden7Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031528.M5Qden7Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/pse-pd/tps23881.c:755:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     755 |         if (FIELD_GET(TPS23881_REG_DEVID_MASK, ret) != TPS23881_DEVICE_ID) {
         |             ^
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
