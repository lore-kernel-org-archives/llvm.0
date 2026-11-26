Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654527;
	b=NgU5MsY0FhTQ6Uko0XVL5iPyMlqYRkldKooVMchrLeSn/qU8mCCcj+RKsk0k7lQ63Ubu
	 WprYG+9gI6U6JcRVaA+VU5xspcVHZOCN9FvKM49YTCVwZPBXW1HD9+SmaaN/lTozCassY
	 n45+2BsjkEwZAnGcjh5LD60oaG6h5W/+hHCfZKlXwC4hzowTWnlk1E7ftWwmig0fvB+lN
	 vSUvW53SRMTVvcpotDbxGgO7NnMMFVm7ZfjocaTYFM0SDTwCi7EfRagTISScJHfX8n+Jf
	 eHeHJfTWzJfF1ZA7/lrGcIw/CwIjX/MzalbiHxrTJuS/tSZdi0o/2iTeSANii0tu7nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654527;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2A9j+BDLkFG4cOZ+8gKgGAgg/4bYCsSFwMlWi8oGZEA=;
	b=NBZpXC1BN94UXL2K619iOBMX0IObKP6r7rY5W54pKiuXmG76VUpKPKgYgMH6gGpFtubt
	 FuTOXuYgMhjUmyA9VhpnbVcma6HIdHV5o8I9zJMjz0bXiZwkLZDUARbzwiHPKXONhGNLp
	 zlUkWSKUaVE7fgTU86r49qSuXSsDyWhI3Y77z0RIR1j7nsuS4To7A6/sVK/pj2HVJq+Xs
	 APsHDa3OGy5XleNVwBe8IvVy86RTGadCqDYnKd2MvnbFyxtCQtU4JsetV3IzvZqjhKdvC
	 BrZe9p5Oho+OC/wKoIOld0//L9/ACslJkRi0vSYfnacTLkFDKbmYGJGnBuRvpS+PgcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nxM0GarR;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA673606A31E;
	Thu, 26 Nov 2026 00:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA673606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nxM0GarR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795654527; x=1827190527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pcikDXyhr+ETo28SOe5c+PfM88gq+rI74IfSFjRbHHU=;
  b=nxM0GarRM8P4yW/SgLkh6lmY8qdKVevSRVpp65Nwu43iAQM0IcZjb5TQ
   PiKuR4W2OQhdYfyStis2sU+ZJJvPS10J5RmLmEVxrTNeXJQ2KetolWZ4i
   QLujG5Oupy3n6qKd8fL/GJ4LGqr6LfpdzdC3kLyn5LVaTXgDfb+lSm5Bi
   qPbXBU0A6VPIMhKpvQw6pUX3a6GMdTI2DNcUyyi0V76rmjxSuGtPjU/Dy
   zIm6glVUfJbxHExLOgS32RaB4s2xCeOXrmHv637lEHodh0kRBflABvSgr
   Jj/qgldPp5MLHZ03ujAivK+8UiHX4CRYOLT8zXXs3mUtaFWgl+Qcc0AtH
   g==;
X-CSE-ConnectionGUID: j+taNb4MQi+2IshxJhloyg==
X-CSE-MsgGUID: YeSmbivHTpO/t5Kt1kyQYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4616890"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4616890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:55:27 -0800
X-CSE-ConnectionGUID: 8km/F1/dTYq0GpiF8yiFpg==
X-CSE-MsgGUID: j7yqNdtxTZeXhTmc/G+OGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12023056"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 16:55:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWNli-00000001T1O-2ucd;
	Thu, 26 Nov 2026 00:55:22 +0000
Date: Thu, 26 Nov 2026 08:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] spmi: Drop struct spmi_device_id
Message-ID: <20261126085245.HG2kUp4p-lkp@intel.com>
References: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>
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
In-Reply-To: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3dd8c790a7b7027abdd568e36db5e82ffaea7c77]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/spmi-Drop-struct-spmi_device_id/20261125-122152
base:   3dd8c790a7b7027abdd568e36db5e82ffaea7c77
patch link:    https://lore.kernel.org/r/20261125112158.938835-2-u.kleine-koenig%40baylibre.com
patch subject: [PATCH v1] spmi: Drop struct spmi_device_id
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261126/20261126085245.HG2kUp4p-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126085245.HG2kUp4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126085245.HG2kUp4p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spmi/spmi.c:68:11: error: use of undeclared identifier 'SPMI_NAME_SIZE'
      68 |                                SPMI_NAME_SIZE) == 0;
         |                                ^~~~~~~~~~~~~~
   1 error generated.


vim +/SPMI_NAME_SIZE +68 drivers/spmi/spmi.c

5a86bf343976b9c Kenneth Heitke     2014-02-12  60  
d69d804845985c2 Greg Kroah-Hartman 2024-07-01  61  static int spmi_device_match(struct device *dev, const struct device_driver *drv)
5a86bf343976b9c Kenneth Heitke     2014-02-12  62  {
5a86bf343976b9c Kenneth Heitke     2014-02-12  63  	if (of_driver_match_device(dev, drv))
5a86bf343976b9c Kenneth Heitke     2014-02-12  64  		return 1;
5a86bf343976b9c Kenneth Heitke     2014-02-12  65  
5a86bf343976b9c Kenneth Heitke     2014-02-12  66  	if (drv->name)
5a86bf343976b9c Kenneth Heitke     2014-02-12  67  		return strncmp(dev_name(dev), drv->name,
5a86bf343976b9c Kenneth Heitke     2014-02-12 @68  			       SPMI_NAME_SIZE) == 0;
5a86bf343976b9c Kenneth Heitke     2014-02-12  69  
5a86bf343976b9c Kenneth Heitke     2014-02-12  70  	return 0;
5a86bf343976b9c Kenneth Heitke     2014-02-12  71  }
5a86bf343976b9c Kenneth Heitke     2014-02-12  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
