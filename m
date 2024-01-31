Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA275221;
	Wed, 31 Jan 2024 01:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706666399; cv=none; b=TPUV4y5X86pKcRib1rTdo6+ro3xuD1lLGQvtWCfeloiZ9NgZPXHYQIiOQco3SqsFUuyxATpwewca2x6B3JaGRRCX/MuQO7yL3hchUXG7EwuYfz+7zVuq20qCni/ky/11j+iwd4n1rpBmqbT/ruIWSsoDF/VSqk51ttFjbiQ153c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706666399; c=relaxed/simple;
	bh=tmUrzxST36JHo4nuv7XAd0uSurVbGZuCand1aR9F5oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huwVaTKu9/mByRVbJr+mKnQgBBE8Vg6BJYc1XPr+a//2WXPVe1eTECanCTlWfJ51mV3q7wT2hodioNL39VmFQIuLz9mFQ1AYvxjpbHmA1mde08MJS2Juv3EOny+homQxNGomlEBJb0sYxImFcxOcuBotjSb79Ai1RAoBNNYec+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wzru28fA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wzru28fA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706666398; x=1738202398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tmUrzxST36JHo4nuv7XAd0uSurVbGZuCand1aR9F5oM=;
  b=Wzru28fAJ5/OjWRFvwAdCayXyAb3dk7LxI0bQD8nEMznZ7yMr6Sh+41b
   WNZhTd95iIJDPKL1scHO9mpwmArfRClOSh/SjFtTdTiUN05Zg3jqYcJzW
   04CkcMRbXDWS8nukF2pKDtl5qvsQh7Bmulg/0U8aXMoE0UtRCswfBiLz4
   27WhOJHSwaM+vvx9ORvfFM5iQ3TuskmD3pn/1G/9+bbKL322dcFeH7DYc
   X8ykHQGAlnEhmgLPqfQOW3RoItxnt5hQ1JzrtCSzrfGU+6ja4hSnSOn1P
   5NhVgJfyiBIljgyLsgZihU1X9J9g7KUQAdkW6jvibnGHegBnHx29RhX5Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10846251"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10846251"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 17:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911633624"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="911633624"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2024 17:59:49 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUztD-00012c-1C;
	Wed, 31 Jan 2024 01:59:47 +0000
Date: Wed, 31 Jan 2024 09:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	daniel.lezcano@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	miquel.raynal@bootlin.com, rafael@kernel.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, support.opensource@diasemi.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, amitk@kernel.org,
	thara.gopinath@gmail.com, niklas.soderlund@ragnatech.se,
	srinivas.pandruvada@linux.intel.com,
	angelogioacchino.delregno@collabora.com,
	baolin.wang@linux.alibaba.com, u.kleine-koenig@pengutronix.de,
	hayashi.kunihiko@socionext.com, d-gole@ti.com,
	linus.walleij@linaro.org, DLG-Adam.Ward.opensource@dm.renesas.com,
	error27@gmail.com, heiko@sntech.de, hdegoede@redhat.com,
	jernej.skrabec@gmail.com, f.fainelli@gmail.com, bchihi@baylibre.com
Subject: Re: [PATCH v1 03/18] thermal: Directly use
 thermal_zone_platform_params for thermal_zone_device
Message-ID: <202401310951.fIhw4NC9-lkp@intel.com>
References: <20240130111250.185718-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130111250.185718-4-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on linus/master v6.8-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/thermal-core-Change-governor-name-to-const-char-pointer/20240130-192357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20240130111250.185718-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 03/18] thermal: Directly use thermal_zone_platform_params for thermal_zone_device
config: x86_64-buildonly-randconfig-005-20240131 (https://download.01.org/0day-ci/archive/20240131/202401310951.fIhw4NC9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310951.fIhw4NC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310951.fIhw4NC9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c:61:69: error: no member named 'type' in 'struct thermal_zone_device'
      61 |         dev_dbg(&zone->device, "%s: critical temperature reached\n", zone->type);
         |                                                                      ~~~~  ^
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   1 error generated.


vim +61 drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c

5fbf7f27fa3da2 drivers/thermal/int340x_thermal/int340x_thermal_zone.c       Srinivas Pandruvada 2015-01-16  58  
dd47366aaa9b93 drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c Kai-Heng Feng       2020-12-22  59  static void int340x_thermal_critical(struct thermal_zone_device *zone)
dd47366aaa9b93 drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c Kai-Heng Feng       2020-12-22  60  {
dd47366aaa9b93 drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c Kai-Heng Feng       2020-12-22 @61  	dev_dbg(&zone->device, "%s: critical temperature reached\n", zone->type);
dd47366aaa9b93 drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c Kai-Heng Feng       2020-12-22  62  }
dd47366aaa9b93 drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c Kai-Heng Feng       2020-12-22  63  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
