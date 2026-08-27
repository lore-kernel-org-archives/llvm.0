Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E730FF1D;
	Thu, 27 Aug 2026 00:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787790400; cv=none; b=BQyl8ZgNYk3GC+JvTn5tdQJETUM1E2a0Sgp5oltX2FpcqXUrV5oTq/41YVR6qynL+dWHfmzIaWOZb//ai4WYAztLk75IrXMuDMNLbe8OODPLaYZRs2LGuY9Bs2xaOTAibKGWNjfILfSLZ6LLJe9ErrE+k+vjXyMh9WiCqu2Bamo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787790400; c=relaxed/simple;
	bh=RWl61psusYhg+K9N28p+tNmCy6tub0XUnozFzHC7HtY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BW7ZwS6huURicpcTwjIQj1dbW832qJLhoy58lEGuS++pumxa22cD9v1/dgt7B922XcPgsQj5Dg7ruszacB8W8YIp6ZMPpoF3kaGlDcW7pqc8mGYYX5Wun56rIIPXCs+0/8PA+tV9ZT9+iWXoqItY6bsxoupObnD+E4zYGnxfR/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TO35JYKH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TO35JYKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787790398; x=1819326398;
  h=date:from:to:cc:subject:message-id;
  bh=RWl61psusYhg+K9N28p+tNmCy6tub0XUnozFzHC7HtY=;
  b=TO35JYKHpF5C0/pVJJGYSypICkf89j9fWpJhuRASufHduK90e6DNu3MK
   /YDnox3gL0gvHaFsbE/XrPtR6zrk9KtFXRByxtCz8T+EByx/jXWLxqGFH
   qZAtkzCupAsCKVORM9UA4LahwARTJsrWaOMzgtgJKodUEK8fgFqd5PtGn
   N5xZdqrjTr3w2fUtzyLSZo5SfAiDru3q2bPki9Cs4lcPq6pdhk3eKj7q7
   Xap/P/NnRVC//veJzW6dvYA2nsiDULE4CHBomGstmHOEhlHwX0xqG0mne
   3ZntJYbRveH20PHEPfK05wg8H6mjb4o88z+KI1rgeklnBknhR6OOxClGo
   g==;
X-CSE-ConnectionGUID: 0VbRInWRQwKcnWsE31AOug==
X-CSE-MsgGUID: v7xDarW9S+uFhuEBU1/MLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98954697"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="98954697"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:26:36 -0700
X-CSE-ConnectionGUID: sw9xYrhlTuO92a8SUfqEHw==
X-CSE-MsgGUID: DmY5NhrBQI+ldSxsLsNuvw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Aug 2026 17:26:34 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzNwu-000000008hX-0FK4;
	Thu, 27 Aug 2026 00:26:32 +0000
Date: Thu, 27 Aug 2026 08:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Alyssa Milburn <amilburn@zall.org>
Subject: [asahilinux:bits/260-spmi-typec 13/13]
 drivers/usb/typec/tipd/spmi.c:176:26: warning: cast to smaller integer type
 'enum tipd_hw_variant' from 'const void *'
Message-ID: <202608270849.G0CjUC7w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/260-spmi-typec
head:   41abbd4a14cc0f4c24128042de99a658a83e1dde
commit: 41abbd4a14cc0f4c24128042de99a658a83e1dde [13/13] usb: typec: tipd: Add sn201202x support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260827/202608270849.G0CjUC7w-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 771bdfdab2d66a4eb85b8ea7673cfa30152718b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608270849.G0CjUC7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270849.G0CjUC7w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tipd/spmi.c:176:26: warning: cast to smaller integer type 'enum tipd_hw_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     176 |         data = tipd_hw_variants[(enum tipd_hw_variant)match->data];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +176 drivers/usb/typec/tipd/spmi.c

   163	
   164	static int sn201202x_probe(struct spmi_device *device)
   165	{
   166		const struct of_device_id *match;
   167		const struct tipd_data *data;
   168		struct sn201202x *sn;
   169		struct tps6598x *tps;
   170		int irq_select, irq_sleep, irq_wake;
   171		int ret;
   172	
   173		match = of_match_device(sn201202x_of_match, &device->dev);
   174		if (!match)
   175			return -EINVAL;
 > 176		data = tipd_hw_variants[(enum tipd_hw_variant)match->data];
   177	
   178		sn = devm_kzalloc(&device->dev, data->tps_struct_size, GFP_KERNEL);
   179		if (!sn)
   180			return -ENOMEM;
   181		sn->sdev = device;
   182		tps = &sn->cd.tps;
   183	
   184		mutex_init(&tps->lock);
   185		tps->dev = &device->dev;
   186		tps->data = data;
   187	
   188		tps->irq = of_irq_get_byname(device->dev.of_node, "irq");
   189		if (tps->irq < 0)
   190			return tps->irq;
   191		irq_select = of_irq_get_byname(device->dev.of_node, "select");
   192		if (irq_select < 0)
   193			return irq_select;
   194		irq_sleep = of_irq_get_byname(device->dev.of_node, "sleep");
   195		if (irq_sleep < 0)
   196			return irq_sleep;
   197		irq_wake = of_irq_get_byname(device->dev.of_node, "wake");
   198		if (irq_wake < 0)
   199			return irq_wake;
   200	
   201		init_completion(&sn->select_completion);
   202		init_completion(&sn->sleep_completion);
   203		init_completion(&sn->wake_completion);
   204	
   205		ret = devm_request_irq(&device->dev, irq_select, sn201202x_irq,
   206				       0, NULL, &sn->select_completion);
   207		if (ret)
   208			return ret;
   209		ret = devm_request_irq(&device->dev, irq_sleep, sn201202x_irq,
   210				       0, NULL, &sn->sleep_completion);
   211		if (ret)
   212			return ret;
   213		ret = devm_request_irq(&device->dev, irq_wake, sn201202x_irq,
   214				       0, NULL, &sn->wake_completion);
   215		if (ret)
   216			return ret;
   217	
   218		spmi_device_set_drvdata(device, tps);
   219		tps->regmap = devm_regmap_init_sn201202x(device, &tps6598x_regmap_config);
   220		if (IS_ERR(tps->regmap))
   221			return PTR_ERR(tps->regmap);
   222	
   223		ret = spmi_command_wakeup(device);
   224		if (ret)
   225			return ret;
   226		if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies(100)))
   227			return -ETIMEDOUT;
   228	
   229		ret = tipd_init(tps);
   230		if (ret)
   231			spmi_command_sleep(device);
   232		return ret;
   233	}
   234	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
