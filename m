Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9E127F4F5;
	Fri,  9 May 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783159; cv=none; b=kE8/YlX2WvftwwA1DwrjyDOr/6nDyLgsOeesnOwcA1jzpUSF7yGSdQPRbsrXJRTZ2fCU1QrurUZKXakEJJhJRHcpNSXBFu2xDbi7iNreLjS/fc+nOtiANuRlZSHHhBUQF7hKuVgZTfADvhftJ8RpvF40OyQyY4LEPBdQp0o9Rzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783159; c=relaxed/simple;
	bh=to0QosEpmvybTJC1yRuEMhfxmYNuDdgWm2IfnbeRBfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eoCDrETK2FOXiBwQP8eyXnY93LW/obQ4l//cKgejBCR4loO/Qaba+mmxYqpD/rYh4M9/oPzHg0jZ2qBAv90FeLhoJcRv+L3DkIuCMZNUw1fc1MIET6X/x9E7+vpPngdRm7el7rgOPo2FzuM6QhsUJ7RNlPYI5ziP7fT3kbJREfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDJuBhNk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDJuBhNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746783158; x=1778319158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=to0QosEpmvybTJC1yRuEMhfxmYNuDdgWm2IfnbeRBfE=;
  b=WDJuBhNkdAD+XGqgrPC74d67cRSy5oG0J5tVOx7AZxu6ce64JYyiAqPE
   rijNU+IQymXNIKRpAhGyVIIBwNFNQV/FnBSRsUSm7RkZgK/Q5uF1HInWy
   JoJG3BdA1jRXbnyxxPehNRFADDPWnw2/7dJqf42ELgey2EbJ4bKKd3Y7r
   oykiHwfG5NpL5LiT16Re/i+OpAOvksbpdo/ik1+TRd7b45kIIuzdufY2c
   K4eEr5YBrxclPnsNR8YyNWC8dkv6s8j6TjzF9YxtLMHaDtSK9z/J1XOBN
   muv48wbosw94FXIYjWVEWrSYVVBdCpXhs7E/qepm7UVozTHSXGxMMWEAq
   w==;
X-CSE-ConnectionGUID: JSANPgfvQJiK+IX1vCX9qA==
X-CSE-MsgGUID: kIqBTn85TrOS6GwdSBl4jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48760833"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48760833"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:32:33 -0700
X-CSE-ConnectionGUID: qYhfYHRTRX68KnPrmQpElQ==
X-CSE-MsgGUID: Z+LC82ZOSt+ptAI2k7+Piw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141779040"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 May 2025 02:32:31 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDK5k-0000VK-2u;
	Fri, 09 May 2025 09:32:28 +0000
Date: Fri, 9 May 2025 17:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 8072/9729] drivers/i2c/busses/i2c-i801.c:1180:49:
 error: no member named 'mux_pdev' in 'struct i801_priv'
Message-ID: <202505091734.6Y3SNpzo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: 27f4a0d6938a5cd3c30701f12c7454048800dbba [8072/9729] i2c: i801: don't instantiate spd5118 under SPD Write Disable
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250509/202505091734.6Y3SNpzo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091734.6Y3SNpzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091734.6Y3SNpzo-lkp@intel.com/

Note: the linux-next/master HEAD f48887a98b78880b7711aca311fbbbcaad6c4e3b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-i801.c:1180:49: error: no member named 'mux_pdev' in 'struct i801_priv'
    1180 |         if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {
         |                                                  ~~~~  ^
   1 error generated.


vim +1180 drivers/i2c/busses/i2c-i801.c

  1159	
  1160	/* Register optional targets */
  1161	static void i801_probe_optional_targets(struct i801_priv *priv)
  1162	{
  1163		/* Only register targets on main SMBus channel */
  1164		if (priv->features & FEATURE_IDF)
  1165			return;
  1166	
  1167		if (apanel_addr) {
  1168			struct i2c_board_info info = {
  1169				.addr = apanel_addr,
  1170				.type = "fujitsu_apanel",
  1171			};
  1172	
  1173			i2c_new_client_device(&priv->adapter, &info);
  1174		}
  1175	
  1176		if (dmi_name_in_vendors("FUJITSU"))
  1177			dmi_walk(dmi_check_onboard_devices, &priv->adapter);
  1178	
  1179		/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
> 1180		if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {
  1181			if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
  1182				i2c_register_spd_write_disable(&priv->adapter);
  1183			else
  1184				i2c_register_spd_write_enable(&priv->adapter);
  1185		}
  1186	}
  1187	#else
  1188	static void __init input_apanel_init(void) {}
  1189	static void i801_probe_optional_targets(struct i801_priv *priv) {}
  1190	#endif	/* CONFIG_X86 && CONFIG_DMI */
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
