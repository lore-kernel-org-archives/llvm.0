Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057163;
	b=jTOdqv+hLo5A43fmGN4cc0YOKUwDJ77xcO4zQ53/CaoO2AhqPCsh/aauh8keIlffr+vJ
	 OpaDrelnZvKQWVPVj1pg0ZOBrylqXd/X4Vzk1fIyYtHbC97ZHZ3e027bRyxuTL6+7NiGt
	 9QOAR/a1xGgEp/zeNJYh4mqKnmR2Q8cO1DtdvvCBJ6KEAxoPI9rCX/QXgTsjwuq30IKOo
	 R6474e+KTVHsjgMpkCgOKJaDooRAzVo0oJoV6IfadM6pDK7+VOcAkEjPBgNxrwNDjebk1
	 IvpQ61SqR98aWRXDzafWXAsaEb+ZjignwSlFDhKH0u7Jr7rUztFmhiebCIzJtdYeTag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057163;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=h2Eny9FxiErINLKHHB+LsOS3lNpf4KzhrBwDKF7vmi0=;
	b=JRYb95qs38S2mJsIMO+UqCWtF/msIXuyRDp+O32HmOiH1faV5803KSfZYE0Am17YDoqb
	 b8NoGgz0siCXVMowGjbTHpIFO3+Q3DnFehKYa+yHcNwAwqCNY/zCUa7gIILHaPtP6xUYI
	 HNGoMeMWyfcrn3tp44hm2X7kFFGIMYITpP4Q/yC3czQAEQ87moIOwSmZYWbqn7E6a7rG9
	 oBwtNP9jc2Ec6acKb7fLpH65HKs9YhuKXD8DAOxB6BkkyWfqRS3Mntl0veX40wKccLfxD
	 LQ9bz/TCjbPEd3f+Z5HNxz9yS6uEm2ceMTnkEtPIqYZOBIOtwyQoMM3op/vXMmhurtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQf0Qkxd;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF336606A326;
	Sat,  7 Nov 2026 13:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF336606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQf0Qkxd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794057161; x=1825593161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vu7IQNdMRbB0dIkqRFXuGnUsBbyW4fu+qslSq5Yf8QY=;
  b=MQf0QkxdW+ABXm1z2K0WtwC9i00QODqxQ4VjZNfVjrZ+XmeWUkqEkj5v
   3Is726UbRSTbR/y1g2HAL2NIdxAqMTe6v4lr/RHS+9x3+ASEnW7hpUuFf
   7bOaZzxeheYtbZ4JtkKdEAe6EkNPVplg47y5Jm5k1lTUh6sNspNBGO/u8
   IN+Fp/uk+PkXB3yEl4N2VBYw62pdDp8pcotX/KZDrC8TPvzwtsjkVmMnA
   rjuxYr0gkRKUUyiYbhjU9XjWzEoOFpys2m9/lJVJP+w7hpJ+3hRt6OVkj
   iJ8yIx9F/uVcUlpNqQWJkG4zDzSBp/n4KMhQ9pubib1yFBxg294oCWdM3
   g==;
X-CSE-ConnectionGUID: chawbyOQR3qALHiOMV1Wqg==
X-CSE-MsgGUID: 0GDj3j9wT5WqEdg9do6iow==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2878071"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2878071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 05:12:40 -0800
X-CSE-ConnectionGUID: 9HcWSSIqScq7cK/DZEKUIw==
X-CSE-MsgGUID: gMLGUiA3T3KMQeZSdW6Kdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7382053"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Nov 2026 05:12:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPgDi-00000000qrv-2xXd;
	Sat, 07 Nov 2026 13:12:34 +0000
Date: Sat, 7 Nov 2026 21:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, gary.yang@cixtech.com
Subject: Re: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
Message-ID: <202611072135.EulyUBtA-lkp@intel.com>
References: <20261107011012.3655873-3-gary.yang@cixtech.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107011012.3655873-3-gary.yang@cixtech.com>

Hi Gary,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-usb-add-Realtek-RTS5453H-Type-C-port-controller/20261107-091009
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261107011012.3655873-3-gary.yang%40cixtech.com
patch subject: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261107/202611072135.EulyUBtA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072135.EulyUBtA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072135.EulyUBtA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/typec/cix_pd.c:628:3: error: call to undeclared function 'irq_set_status_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     628 |                 irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
         |                 ^
>> drivers/usb/typec/cix_pd.c:628:37: error: use of undeclared identifier 'IRQ_DISABLE_UNLAZY'
     628 |                 irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
         |                                                   ^
   2 errors generated.


vim +/irq_set_status_flags +628 drivers/usb/typec/cix_pd.c

   587	
   588	static int cix_pd_probe(struct i2c_client *client)
   589	{
   590		struct cix_pd *rts;
   591		int ret;
   592	
   593		dev_dbg(&client->dev, "IRQ %d supplied\n", client->irq);
   594		rts = devm_kzalloc(&client->dev, sizeof(*rts), GFP_KERNEL);
   595		if (!rts)
   596			return -ENOMEM;
   597	
   598		rts->dev = &client->dev;
   599		rts->irq = client->irq;
   600		mutex_init(&rts->lock);
   601		mutex_init(&rts->irq_lock);
   602		cix_pd_typec_init_state(rts);
   603	
   604		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
   605			return dev_err_probe(&client->dev, -ENODEV,
   606					     "i2c check functionality failed\n");
   607	
   608		rts->regmap = devm_regmap_init_i2c(client, &cix_pd_regmap_config);
   609		if (IS_ERR(rts->regmap))
   610			return dev_err_probe(&client->dev, PTR_ERR(rts->regmap),
   611					     "failed to init regmap\n");
   612	
   613		i2c_set_clientdata(client, rts);
   614	
   615		ret = cix_pd_init_ports(rts);
   616		if (ret)
   617			return ret;
   618	
   619		ret = cix_pd_event_handler(rts, 0);
   620		if (ret) {
   621			dev_err(&client->dev, "failed to read initial status: %d\n", ret);
   622			if (ret == -ESHUTDOWN)
   623				ret = -EIO;
   624			goto err_unregister_ports;
   625		}
   626	
   627		if (client->irq > 0) {
 > 628			irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
   629			ret = request_threaded_irq(client->irq, NULL, cix_pd_irq_handle,
   630						   IRQF_SHARED | IRQF_ONESHOT,
   631						   dev_name(&client->dev), rts);
   632			if (ret) {
   633				dev_err(&client->dev, "failed to request irq: %d\n", ret);
   634				goto err_unregister_ports;
   635			}
   636			rts->irq_requested = true;
   637		}
   638	
   639		ret = device_create_file(&client->dev, &dev_attr_disable_pd_interrupt);
   640		if (ret)
   641			dev_warn(&client->dev,
   642				 "Failed to create sysfs attribute, ret = %d\n", ret);
   643	
   644		device_set_wakeup_capable(&client->dev, true);
   645	
   646		return 0;
   647	
   648	err_unregister_ports:
   649		cix_pd_unregister_ports(rts);
   650		return ret;
   651	}
   652	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
