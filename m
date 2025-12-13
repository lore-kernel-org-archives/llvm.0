Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B32236E8;
	Sat, 13 Dec 2025 00:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586751; cv=none; b=gWwSgg7hpQc2hsFS3bxs2CLdjm4QjjZVucK/ahDgY9+mWXu8sVzEgms+GvHbJ6tvfwuZLlVshS1+C7wr7Tk5Ipo59Y3Qv4bB76+t6aJgqI9TweQOLKjk5Gb2c1zW5Rz3qRjKyjwHsfp98yyeGI1GaU/kQhVIQSkwMZ4a0kw0cQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586751; c=relaxed/simple;
	bh=77Thi797QTL8JEfy2ZXrA6Jdr8+2Tn/Lg+2M6GKxiBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvCbnBMkrZWdcoJPQlp2UmYI5HZ2OYQU5iX17COzS8DpQmwfDhsx27v07+25JJsBElAddLmYrzEM+iJm4UDzjZ8j+We8aEOYta5HdjUzSAZQH2DiAN+lOmdmf4QkVegZuGforvXsOa4/YKNs4VfGp8yMPsXpNFQXrK7qsdquJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKfzZXEy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKfzZXEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765586750; x=1797122750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=77Thi797QTL8JEfy2ZXrA6Jdr8+2Tn/Lg+2M6GKxiBU=;
  b=TKfzZXEyGG8FUbRUUpDKR29iLywOkSnEkmETesnO+aZOVo/mHNuhnqkC
   Fm37nnJss2qKHcbQdty8AYNjZQ6U8kk1qU44N8dGaoM+sXXy+WnLhw/68
   4pZbNML6xZggmPWNj+Y2MgK3D8walOKWEVHVhcAtL0dU929VwZ5fvcrpT
   ojF3FziorcjnRjqMxPay+XfT6JcSfjnGCBFdH2cacFJrcreOugLyfdkqn
   Vhq0hQr7dFKbVCSS8759XuFWCt4QVLApbyLAXankTDca4KnTT77KmtJir
   hllQKmlgFH7OIwrOKwpuh5TQf/e6+Iv4VCL4s658UlCuPXvQs6ATJShCI
   g==;
X-CSE-ConnectionGUID: imyOjDGcRuySDC4lW+18AA==
X-CSE-MsgGUID: +rpOmTPHRuuffX5U7AEk6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71219675"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71219675"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:45:49 -0800
X-CSE-ConnectionGUID: dV9aRwUqR3iU0O1jdPcxnw==
X-CSE-MsgGUID: 011tT+MFQtaKCyXggTUimQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196290213"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 16:45:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDlW-000000006qv-1t5p;
	Sat, 13 Dec 2025 00:45:42 +0000
Date: Sat, 13 Dec 2025 08:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v21 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202512130804.vObtjguS-lkp@intel.com>
References: <20251212-imx-se-if-v21-3-ee7d6052d848@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx-se-if-v21-3-ee7d6052d848@nxp.com>

Hi Pankaj,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251212-172535
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251212-imx-se-if-v21-3-ee7d6052d848%40nxp.com
patch subject: [PATCH v21 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512130804.vObtjguS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130804.vObtjguS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130804.vObtjguS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/imx/se_ctrl.c:168:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     168 |         if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
         |             ^
   1 error generated.
--
>> drivers/firmware/imx/ele_common.c:241:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     241 |         status = RES_STATUS(msg->data[0]);
         |                  ^
   drivers/firmware/imx/se_ctrl.h:16:25: note: expanded from macro 'RES_STATUS'
      16 | #define RES_STATUS(x)                   FIELD_GET(0x000000ff, x)
         |                                         ^
   1 error generated.


vim +/FIELD_GET +168 drivers/firmware/imx/se_ctrl.c

   137	
   138	static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se_info)
   139	{
   140		struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
   141		struct soc_device_attribute *attr;
   142		u8 data[MAX_SOC_INFO_DATA_SZ];
   143		struct ele_dev_info *s_info;
   144		struct soc_device *sdev;
   145		int err = 0;
   146	
   147		/*
   148		 * This function should be called once.
   149		 * Check if the se_soc_rev is zero to continue.
   150		 */
   151		if (var_se_info.soc_rev)
   152			return err;
   153	
   154		err = ele_fetch_soc_info(priv, &data);
   155		if (err < 0)
   156			return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.");
   157		s_info = (void *)data;
   158		var_se_info.soc_rev = s_info->d_info.soc_rev;
   159		load_fw->imem.state = s_info->d_addn_info.imem_state;
   160	
   161		if (!se_info->soc_register)
   162			return 0;
   163	
   164		attr = devm_kzalloc(priv->dev, sizeof(*attr), GFP_KERNEL);
   165		if (!attr)
   166			return -ENOMEM;
   167	
 > 168		if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
   169			attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x.%x",
   170							FIELD_GET(DEV_GETINFO_MIN_VER_MASK,
   171								  var_se_info.soc_rev),
   172							FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
   173								  var_se_info.soc_rev));
   174		else
   175			attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x",
   176							FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
   177								  var_se_info.soc_rev));
   178	
   179		switch (se_info->soc_id) {
   180		case SOC_ID_OF_IMX8ULP:
   181			attr->soc_id = "i.MX8ULP";
   182			break;
   183		case SOC_ID_OF_IMX93:
   184			attr->soc_id = "i.MX93";
   185			break;
   186		}
   187	
   188		err = of_property_read_string(of_root, "model", &attr->machine);
   189		if (err)
   190			return -EINVAL;
   191	
   192		attr->family = "Freescale i.MX";
   193	
   194		attr->serial_number = devm_kasprintf(priv->dev,
   195						     GFP_KERNEL, "%016llX",
   196						     GET_SERIAL_NUM_FROM_UID(s_info->d_info.uid,
   197									     MAX_UID_SIZE >> 2));
   198	
   199		sdev = soc_device_register(attr);
   200		if (IS_ERR(sdev))
   201			return PTR_ERR(sdev);
   202	
   203		return 0;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
