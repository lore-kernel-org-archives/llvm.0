Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9C4244692;
	Wed,  3 Dec 2025 20:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764793957; cv=none; b=qrjuOmBcF8cBjD89UPNOAPj0qJPnvHWkqQE97txXSMxBbvgEHNzTQg3W+L4RfkXvwg4nBHcGJgkfnHxNA5pviN8YDD8PnTNYIqDl/iATnS3in7dUQkztAfgbX0L/OIzDpMvItzQEoDu0SPPLN7rurHOK6GoymhC9NiBupPwi6wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764793957; c=relaxed/simple;
	bh=tsSaRr99CRPI1+FO8kt26rUX633ovCV5eBM115B8HsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUK8kEgoS9w6/tz/nsyxZFzTh3kvKaREYa5aGi2dI/SjNNHJ/5ka9eArbdtJJ6RAK/RUhtHzJjlyaQbHm6sivOshKBSI7LxnAMnzknzso53rySVJz+gaBdcmu51n8WthnasdqqujseTJeLomrlCdcFfHQfAeQjSM6bRVbhmNLb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWb9zYmG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWb9zYmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764793955; x=1796329955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tsSaRr99CRPI1+FO8kt26rUX633ovCV5eBM115B8HsM=;
  b=XWb9zYmGmNrasY5HrKUz2T0DgH9omRg1KuXtZEwTIWnVNI3Ny4s4n6pD
   SbcETkuFR0jZka2piXdGWrrmsthFzkK1cdFvY6Cf9iydDjqI3XdG+b1VW
   ibdyF3Bwo4pcjphAm+piopKTAk4O3fhcEoS5cSkfa3L/73cLuBCmLU3mg
   TGjhHwFFW4XHltU+ynxox5QOVW0u45Sh/E7fDa+ORg6PxUWSUlqZ6fCfz
   9oopRFuc34bYAshtUtK+rLICUWX1a606QRVywit4XPIw/IPp6H8pQahDd
   lROBc1LVE68e03Q73fX4WN4uoddHMo5LKwZ+9dnb8hkJL79OIMQBu0eqx
   g==;
X-CSE-ConnectionGUID: xddys36zSteZxGIVcElXUw==
X-CSE-MsgGUID: quplq3A9TwWMVgQhVK/uCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77482831"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="77482831"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 12:32:34 -0800
X-CSE-ConnectionGUID: HDhMarZ1QxGHZfzz+a1Jmg==
X-CSE-MsgGUID: iGAmmzcsRoOgwvduB7pe2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="199737567"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Dec 2025 12:32:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQtWX-00000000D7d-0yuD;
	Wed, 03 Dec 2025 20:32:29 +0000
Date: Thu, 4 Dec 2025 04:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Lobanov <m.lobanov@rosa.ru>,
	"David S. Miller" <davem@davemloft.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Mikhail Lobanov <m.lobanov@rosa.ru>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Bauer <mail@david-bauer.net>,
	James Chapman <jchapman@katalix.com>, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH net-next v6] l2tp: fix double dst_release() on
 sk_dst_cache race
Message-ID: <202512040433.TgRZXwYf-lkp@intel.com>
References: <20251202180545.18974-1-m.lobanov@rosa.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202180545.18974-1-m.lobanov@rosa.ru>

Hi Mikhail,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Mikhail-Lobanov/l2tp-fix-double-dst_release-on-sk_dst_cache-race/20251203-021549
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251202180545.18974-1-m.lobanov%40rosa.ru
patch subject: [PATCH net-next v6] l2tp: fix double dst_release() on sk_dst_cache race
config: x86_64-buildonly-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251204/202512040433.TgRZXwYf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040433.TgRZXwYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040433.TgRZXwYf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ip_options_build" [net/l2tp/l2tp_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
