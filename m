Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875429;
	b=NDxPtr0contns9bDNw5tXAjngxjKQ3lrZH3km31+tnXF6FEt+pTzwFogHgHuNQsGlJjP
	 SiLVU8txlWkw9KeuYv18+ZjWbRO8LPIRVWerfLSK4xsikx9kLBb66iFvHHvueYER0bUH4
	 2jqIYFTBnIF0GWOAyc3MnL5dgUdqKy/lTfocOF2bguIzBEbSb69LZf+5b+kTnhDm//Br1
	 7/zdGuNJfQR9Qf3KiVUAHFfm0ov+QlccD1UQ4Lm1ALRClCvQv809djg9WBBJTpAEnNwsl
	 lMjErKyha92ZGLMGeLNbcHqP6boiRbqCHi1WlIUmcI8BxxJpJejeLzyh88L64aFJIaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875429;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=U2B/uabe/QmuXvbvHoYk8ZWVeldXL8jP6hg7gbVv3cw=;
	b=zNoELpe4NpnUSqm7HsVGB4k+9iyUPLDieScQpWpxyCouv6TTVM6+Y/Cz/dEaOk40UJus
	 b9eQ99UR/LX8qYpQs80IhQ9y2bIkBJ8CdBKdJCVcQ1qcxFqoFNAtF0SOdd+ADsgcWrfsh
	 jAzI/dnbP9W2UJCO6eQ3CeVWhkYg+P+ugii1GhK361GGmKRs1AEIuaf7gMKC515dGYRHC
	 YXdgkpAWBP8qovV5zgxvJyvdw8mGDEjL6xU7SVyO9pASHTkjZ0sG5wsxUmTcpIVbCBFEi
	 hoMetudum/V+QHMxEiVvzOCISRHyztwstiGx7y1KVHGYxrPOm8Cxj/bp8wDzlw+W0eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GaOC5+JJ;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53072606A31C;
	Tue, 17 Nov 2026 00:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53072606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GaOC5+JJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794875429; x=1826411429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8gVBDSdO3QnCkbysAcQxx5Ix2FP39pCUquIV8ycUM/c=;
  b=GaOC5+JJ+/9sOLtq2q8nU9Et3dEDthkP1JqORLT3X/utq69w2hGx+aY+
   3so0i7ffyQXQbqXPFFhEecybY6/YtTt8cs6+BSNNu9XAW3kZKnDsdH3wo
   KOeFL7ieQOMMKSXi0JOzlGb++HbPAXXmXgPwh00u6ePNeeUsil6xsIosC
   wNX60uygoJhc12rCwHSs5hYKWIsof79Pu65SEzDoheBgCFJHT/reSXZLu
   HtVJp/IIab0G0frzfxjs61vsRBEKxKD+nh2DKijjXShII4E6r1QN8Rnae
   uOdmNciWduGgMLIkp5vyCYoAIFP0oUGU1RmQfLxFCgrZtF0wGAP1eKdA4
   Q==;
X-CSE-ConnectionGUID: vzVNGcRlTD+HnoKgKWP2qw==
X-CSE-MsgGUID: Sc1+gDShTFOCDpQCYgjm9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3648156"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3648156"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 16:30:28 -0800
X-CSE-ConnectionGUID: VAgfbtYiRm+5yRsw4auy4A==
X-CSE-MsgGUID: fNNJQyq1Ri65VGTx7OzBtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9479561"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Nov 2026 16:30:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT75X-000000019f5-0w2K;
	Tue, 17 Nov 2026 00:30:19 +0000
Date: Tue, 17 Nov 2026 08:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, andrew@lunn.ch,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
	daniel@makrotopia.org, linux@armlinux.org.uk, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com,
	b.larsson@gmx.com, Caleb James DeLisle <cjd@cjdns.fr>
Subject: Re: [net-next v5 3/7] net: dsa: mediatek: add support for
 passthrough mode
Message-ID: <202611170845.l4X9RRsI-lkp@intel.com>
References: <20261116183332.168858-4-cjd@cjdns.fr>
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
In-Reply-To: <20261116183332.168858-4-cjd@cjdns.fr>

Hi Caleb,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-James-DeLisle/net-dsa-mt7530-get-ctrl-phy-addr-using-a-function/20261116-183326
base:   7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
patch link:    https://lore.kernel.org/r/20261116183332.168858-4-cjd%40cjdns.fr
patch subject: [net-next v5 3/7] net: dsa: mediatek: add support for passthrough mode
config: arm-randconfig-1003-20261117 (https://download.01.org/0day-ci/archive/20261117/202611170845.l4X9RRsI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170845.l4X9RRsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170845.l4X9RRsI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mt7530.c:1410 function parameter 'dp' not described in 'mt753x_upstream_port_index'
>> Warning: drivers/net/dsa/mt7530.c:1410 function parameter 'dp' not described in 'mt753x_upstream_port_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
