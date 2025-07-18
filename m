Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F397B1C36;
	Fri, 18 Jul 2025 16:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856055; cv=none; b=dN4hNoJTvN7Qq8HmoYX1r7XPMVxnt1UANWUNJQjqE3xyzAm6nFDMPeMguFu9CgpccMLjyI+uHPEHaUExOxQzCdnfrKwwMP+VsCviE0m6TLDwUpnAaAeArAq4gCIn9tzm+fvg0Lb68f8o1FVajrPM5FmHht7DHtn9pAvo5pox4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856055; c=relaxed/simple;
	bh=vycpYZevtKVsadKdhhrXR9RuW0T6yEjXnXehnrH8ZdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRde0ZHTKdHPth0HXUkTiNW6SMQ7cX0snBiXj4jsjSUf/EGr5PXrumnZTT5ERphHwTK/4knW0X0o9mj5Zst3bxlYMwhojdUsHvJhLusajJca7S6D6yGbLlAUQ5Egz5bmYyr6uga6EEtPpLuEhXGT8nhK1Xe8oBXryDHxl3Lu0mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huROMMv8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huROMMv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752856054; x=1784392054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vycpYZevtKVsadKdhhrXR9RuW0T6yEjXnXehnrH8ZdE=;
  b=huROMMv8RIcK4Z99uzTCZzMa5eSHEYM+iqPbgv1WMe+qABGIZxjy/fJy
   Ur43tuvEKfME2hNPTCy8vAoXurFtqtp0c+HVUBedGhA714RnW/hsAKP12
   xF8r8w4BtAERXYtZgSHXeaDVCASqjmPmrQgRY8zUCuk+LJ0zuTJETgyht
   1Pku9m5SFLWz+bPRw9T+Rjds4/+h2oqf12qCleDWXfEoMHCmoUv2nw5LZ
   j68wNoFLID/f3dFtZUale/hTu/Cpn1xb/NnHZ8Kz7DnAXDh0TUAkgMLeR
   H4lb+JXRaLxh2xTILuLEEau58eYTKK9fJXjduxPh/l8ke7WKE0YOZ3DuR
   Q==;
X-CSE-ConnectionGUID: Mbj/kJ87R0S/kmN65t/nAw==
X-CSE-MsgGUID: pSfjKB1vRc+1Gv0gnxAcyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66219289"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="66219289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 09:27:33 -0700
X-CSE-ConnectionGUID: owz6bJTUQSCg31NsUrQ/Xg==
X-CSE-MsgGUID: rqRJnW/tTw+L4l8Llq9Alg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="189050155"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2025 09:27:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucnvl-000Eqb-0Q;
	Fri, 18 Jul 2025 16:27:29 +0000
Date: Sat, 19 Jul 2025 00:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:string-helper-2025-07-18 119/157]
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c:241:4: error: call to
 undeclared function 'str_enabling_disabling'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202507190056.HlVj24NA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux string-helper-2025-07-18
head:   ea52943b017c3b53f3f8c9ff679ccfb8eaae222a
commit: a608a1e244d8bfa8a06b0e9abd9a3f0d364cb091 [119/157] media: platform: cros-ec: use string choices helper
config: hexagon-randconfig-002-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190056.HlVj24NA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190056.HlVj24NA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190056.HlVj24NA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/cec/platform/cros-ec/cros-ec-cec.c:241:4: error: call to undeclared function 'str_enabling_disabling'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     241 |                         str_enabling_disabling(enable), ret);
         |                         ^
>> drivers/media/cec/platform/cros-ec/cros-ec-cec.c:241:4: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
     240 |                         "error %s CEC on EC: %d\n",
         |                                ~~
         |                                %d
     241 |                         str_enabling_disabling(enable), ret);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning and 1 error generated.


vim +/str_enabling_disabling +241 drivers/media/cec/platform/cros-ec/cros-ec-cec.c

   223	
   224	static int cros_ec_cec_adap_enable(struct cec_adapter *adap, bool enable)
   225	{
   226		struct cros_ec_cec_port *port = adap->priv;
   227		struct cros_ec_cec *cros_ec_cec = port->cros_ec_cec;
   228		struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
   229		struct ec_params_cec_set params = {
   230			.cmd = CEC_CMD_ENABLE,
   231			.port = port->port_num,
   232			.val = enable,
   233		};
   234		int ret;
   235	
   236		ret = cros_ec_cmd(cros_ec, 0, EC_CMD_CEC_SET, &params, sizeof(params),
   237				  NULL, 0);
   238		if (ret < 0) {
   239			dev_err(cros_ec->dev,
   240				"error %s CEC on EC: %d\n",
 > 241				str_enabling_disabling(enable), ret);
   242			return ret;
   243		}
   244	
   245		return 0;
   246	}
   247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
