Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC05224;
	Wed, 31 Jan 2024 01:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706666400; cv=none; b=grbBqyAY2kvUPQn58gmcClPHFqlMtOCfZk1BlSpnE9nOMY+NJdIUuDjuFl0yQpjqy1fSPJ4xze2jDyOPrz0k+tCyD5ZgWGpRcEANpSgFsMrVk1PiCZq2+1EDcOJjcammikH/3c1Lb9wfGVCxbiBqvz1XMaGzp9S7dXrWIj5gGN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706666400; c=relaxed/simple;
	bh=Sly6i4L/PZKqerAHJVDGXuTiOr+6F11+7AdebV2ul2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksEr8KIvp67IjafVN5lI8ZuVLewSIMPhLWfO7VC6tKWrE4P+D50Ft44qWsrVAiG5B7w8DqET+LZX4iheCu+ywtl3ZK+rUQ59Z/crKSh0xSqLG9mA1v9k0RSU5KJ+dDknny49cGohIN4YspVbmYNrCPLHVwdYKQSxUgNh7/X1EHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKxzpS9Y; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKxzpS9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706666399; x=1738202399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sly6i4L/PZKqerAHJVDGXuTiOr+6F11+7AdebV2ul2w=;
  b=KKxzpS9YRBNHraj+Xi5JiKP1mhWbTjuMdgj0h1Es3Uh7ik0je+f2BZ67
   WPOjMvnBhb/+uUdLFL8DMLfwXeu7t3CUnKRemiGVLuw7Y85mmWJ3dC9Km
   69AVmpHLIj0+ScL+nodYFQxXPsjzcxkg5Zt9p+3upzNC3oceX7o2Dy9Li
   WNS+bx7pr71Tcbxd8FSn5psQU8+A/hV1nh31SVTsq5KvX9RUD4vCNzT9r
   OSSKdgSpGc++WOn8NeY80POpoBpS7CH3axgj20gJ6NtWi2+EefGxBM2kE
   yPf9Umb/XkXPqknT3XAonyK9mBhoTxH2Opb15qwF/q9GQZYeeYvDqgUOU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10846270"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10846270"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 17:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911633626"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="911633626"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2024 17:59:49 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUztD-00012W-11;
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
Message-ID: <202401310926.5pvZlTR0-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20240131 (https://download.01.org/0day-ci/archive/20240131/202401310926.5pvZlTR0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310926.5pvZlTR0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310926.5pvZlTR0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/thermal_netlink.c:309:50: error: no member named 'type' in 'struct thermal_zone_device'
     309 |         struct param p = { .tz_id = tz->id, .name = tz->type };
         |                                                     ~~  ^
   drivers/thermal/thermal_netlink.c:415:57: error: no member named 'type' in 'struct thermal_zone_device'
     415 |             nla_put_string(msg, THERMAL_GENL_ATTR_TZ_NAME, tz->type))
         |                                                            ~~  ^
   2 errors generated.


vim +309 drivers/thermal/thermal_netlink.c

1ce50e7d408ef2 Daniel Lezcano    2020-07-06  306  
2f521890aa5b8a Rafael J. Wysocki 2024-01-03  307  int thermal_notify_tz_create(const struct thermal_zone_device *tz)
1ce50e7d408ef2 Daniel Lezcano    2020-07-06  308  {
2f521890aa5b8a Rafael J. Wysocki 2024-01-03 @309  	struct param p = { .tz_id = tz->id, .name = tz->type };
1ce50e7d408ef2 Daniel Lezcano    2020-07-06  310  
1ce50e7d408ef2 Daniel Lezcano    2020-07-06  311  	return thermal_genl_send_event(THERMAL_GENL_EVENT_TZ_CREATE, &p);
1ce50e7d408ef2 Daniel Lezcano    2020-07-06  312  }
1ce50e7d408ef2 Daniel Lezcano    2020-07-06  313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
