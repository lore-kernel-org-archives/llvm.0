Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C68B2D9EE7;
	Wed, 26 Aug 2026 22:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784749; cv=none; b=PDzHZ8NmcXraGIzfZgFNkpGtquSzDxnJeB/lKl7SbjUMcg45WgsbE2hwTheWpVotFKy9WnuzGhd82W8e/on5wDIIXeULHhb3xL1PK9q60e4DmQNVucFy6Cs1S1jBSUzCySdDTlOtosXN2ZkTs9t3CVupiBa3M3n3XFAljfkStu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784749; c=relaxed/simple;
	bh=HyX45RHyXieN3SLWy0zt6rf8dNynPToEUQiPNfGPwr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dw/wAx2/r/LlCVYOe9mcJwUyaNyyN0T28DwjlhBIPXTUH/k4xK6qnd16K7p5gYcOwIqUOTwYvnMFDfapW+QjYTr1nE6RVxbZJrGYNMPF/R2vebU8GHxnk9+ghgrOrs+iaApKa5sSL+2EPWzeZplByF/Kb1LYsB7Tse/QSW6nDuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkesHDXD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkesHDXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787784747; x=1819320747;
  h=date:from:to:cc:subject:message-id;
  bh=HyX45RHyXieN3SLWy0zt6rf8dNynPToEUQiPNfGPwr4=;
  b=JkesHDXD/bJRXXDVUwrB3GM5C9kd2LpjFmVKHlOkFg9SKjs5+vYTdg76
   PdaOEe4ldNn+Y0Ep/KLyScxEO1RVJiUBhPyqRNsZUb8wgcrd0YotgjpgX
   0Gc3tiZ2whk6aS7hFGrQS3arsBBA196BqdXTv/S5vjTvmTELIy77DKpny
   J3XoPeNm6pqOLilIq9IkK5IreMpCDak90AX0ReDEE2GnnqSlZwKascB9A
   bgLjd2Yic0z5cS5JLvNZa7HlJhYD2puObLA1Qcd/08Fa1wZzz1Otw1S5A
   c7FyGonnCLE6X7+vXKqw3AXuWt63ZOq8YO0WJoORkwPtcFXFE8irVq+P9
   w==;
X-CSE-ConnectionGUID: oQcRpqgaQYyn5WW0wQDvwA==
X-CSE-MsgGUID: wribaRH9QdClnsRzHsDcMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87223393"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="87223393"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 15:52:25 -0700
X-CSE-ConnectionGUID: JLR+OCfCQuO096osuFPUxQ==
X-CSE-MsgGUID: AGVm3YJQQJqhGSBgLq4zMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="271907724"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Aug 2026 15:52:23 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzMTk-000000008aL-219o;
	Wed, 26 Aug 2026 22:52:20 +0000
Date: Thu, 27 Aug 2026 06:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Alyssa Milburn <amilburn@zall.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <k@chaosmail.tech>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [asahilinux:bits/260-spmi-typec 12/13]
 drivers/usb/typec/tipd/i2c.c:21:12: warning: cast to smaller integer type
 'enum tipd_hw_variant' from 'const void *'
Message-ID: <202608270643.2aUXW1ea-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/260-spmi-typec
head:   41abbd4a14cc0f4c24128042de99a658a83e1dde
commit: c11cad9077f1a6d06b63e14a9ed37a2e8734e2c5 [12/13] usb: typec: tipd: Factor out i2c specifics
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260827/202608270643.2aUXW1ea-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 771bdfdab2d66a4eb85b8ea7673cfa30152718b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608270643.2aUXW1ea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270643.2aUXW1ea-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tipd/i2c.c:21:12: warning: cast to smaller integer type 'enum tipd_hw_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
      21 |         variant = (enum tipd_hw_variant)i2c_get_match_data(client);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +21 drivers/usb/typec/tipd/i2c.c

    13	
    14	static int tps6598x_probe_i2c(struct i2c_client *client)
    15	{
    16		enum tipd_hw_variant variant;
    17		const struct tipd_data *data;
    18		struct tps6598x *tps;
    19		int ret;
    20	
  > 21		variant = (enum tipd_hw_variant)i2c_get_match_data(client);
    22		if (!variant || variant >= TIPD_VARIANT_MAX)
    23			return -EINVAL;
    24		data = tipd_hw_variants[variant];
    25	
    26		tps = devm_kzalloc(&client->dev, data->tps_struct_size, GFP_KERNEL);
    27		if (!tps)
    28			return -ENOMEM;
    29	
    30		mutex_init(&tps->lock);
    31		tps->dev = &client->dev;
    32		tps->data = data;
    33		tps->irq = client->irq;
    34	
    35		tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
    36		if (IS_ERR(tps->regmap))
    37			return PTR_ERR(tps->regmap);
    38	
    39		/*
    40		 * Checking can the adapter handle SMBus protocol. If it can not, the
    41		 * driver needs to take care of block reads separately.
    42		 */
    43		if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
    44			tps->i2c_protocol = true;
    45	
    46		ret = tipd_init(tps);
    47	
    48		if (ret == 0)
    49			i2c_set_clientdata(client, tps);
    50	
    51		return ret;
    52	}
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
