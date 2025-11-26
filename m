Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4191D329E59;
	Wed, 26 Nov 2025 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170295; cv=none; b=nYoJQo8jGLzbuMr7ror2d6njSXcV2XVcui6ewiK/EvtpPjesUUya/bTBalifzAHXsWUMfpzQbM0GTa0Dst8teFVn2VELrvxP+4isNeXcsrqZFDzzqLargqH8M90plAflZTMIhuBqfKdeUGwjEsrcl9ZC8cnpkVlczl8YEieiNjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170295; c=relaxed/simple;
	bh=OAQISPswKJq25SzgGqswUw+2peV2QjQp+1X2kjl7i/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNslpDQvf+wCVImbv8y9u+v356LJjN9TYu7vetRKou3x02FYWI0QI3lEjPuw7C80iCbYuWAesFUriq7Vrmhb3PouCjHmVxX5RLUJDb8nUlDCsDFdhfLno2MsRGnjpl5FDsoW22v4NymApwcAkfKj1rbMRb1NXKhA0o5Gz2kSp80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxczgLMH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxczgLMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764170293; x=1795706293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OAQISPswKJq25SzgGqswUw+2peV2QjQp+1X2kjl7i/E=;
  b=mxczgLMH8apNTjeFtbq5NkEo8ZpAoIrl7RivdN8IkgaF9m/35C/Y7d/9
   usw7lQS9nnZZPpwWFSm2LCmVNtSTHOLeqDB1hCNjTv6wPX/+F70KiK+aZ
   XAqPDwAzIc+NDvFB6o038ZjOiFyTEj6/Y5J/CjbEPdSujqJYE/TrX6Yfs
   BGbkUeG4FxEmnLOsuEVnhrHh3iCa4GEr4nzpWoYPQoAQZxpppyJyJT5m+
   lXZnbtZl/wGrABPOouRr+XUo8rBL4FU2V7tWkTLHoxbEFbFyDeznIpoq4
   QzBTlEhrCfOIUvXjLqHy//jVYf4wi0PZhnlJ8DMdgwD0gU7tcrOUF0gZ8
   g==;
X-CSE-ConnectionGUID: O1CgCmfLSwSr37WvbBT3hQ==
X-CSE-MsgGUID: sQmH82FsToStgUjweT7rpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76534659"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76534659"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:18:08 -0800
X-CSE-ConnectionGUID: xKcInju7QGe/+joUlWElfA==
X-CSE-MsgGUID: S+2yY/40TsKNxFP41vkcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192851038"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2025 07:18:02 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOHHM-0000000032V-21UG;
	Wed, 26 Nov 2025 15:18:00 +0000
Date: Wed, 26 Nov 2025 23:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH net-next 7/9] net: pcs: xpcs: allow lane polarity
 inversion
Message-ID: <202511262216.TzyLet3B-lkp@intel.com>
References: <20251122193341.332324-8-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122193341.332324-8-vladimir.oltean@nxp.com>

Hi Vladimir,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/dt-bindings-phy-rename-transmit-amplitude-yaml-to-phy-common-props-yaml/20251123-033900
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251122193341.332324-8-vladimir.oltean%40nxp.com
patch subject: [PATCH net-next 7/9] net: pcs: xpcs: allow lane polarity inversion
config: arm-spear6xx_defconfig (https://download.01.org/0day-ci/archive/20251126/202511262216.TzyLet3B-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262216.TzyLet3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511262216.TzyLet3B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phy_get_rx_polarity
   >>> referenced by pcs-xpcs.c:821 (drivers/net/pcs/pcs-xpcs.c:821)
   >>>               drivers/net/pcs/pcs-xpcs.o:(xpcs_do_config) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: phy_get_tx_polarity
   >>> referenced by pcs-xpcs.c:829 (drivers/net/pcs/pcs-xpcs.c:829)
   >>>               drivers/net/pcs/pcs-xpcs.o:(xpcs_do_config) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
