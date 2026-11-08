Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180769;
	b=innaM+jaASFntN4BK6bVuMamm6P0Y6tnW18jHLexZBIzlj7ErdtPXrds4G0MzemykVRs
	 ZtH7br3ICuljnMbBT+6JLCsBv7x4qC7rHZpG8nDn4nqcMKoUQKfnUVd3d56q2c6n2cUWS
	 mGo+pgsl42gU86LVL4qVXS19KhBgljE5O8kh9mSGe8ww3tcIvdYAoLHSuFJ/3QPsQmt5T
	 /vdgEqgJvlAfez4CYdB03gHzxgd+rDAhPbqoL1KlBSr2iIAEDobgcgkBALaJiKFEl5jkX
	 qWxzMwZunPAOUypIO6BKnkigsBvSP2tDKDy0XF6xPqJGW5LW3eQuBa1QnJW8H1GBMqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180769;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RIAxd3jomjJTAeBATxn+eqNDxCWaLYEphq5oj8QW39o=;
	b=YONKzx6liCjyaiWM9ac48SSoCXcP4Nz4hO0haYT7uL2cLHifoMVoIENX+stYpZMG8bkr
	 InixMcqbIidz2JxjQp9i331PmEXvWVk1jO4SngehWOcjTVo3vwPda1BcLLplIcU+nzNur
	 40dkRfUTMdyEHw+R9hScRwngsPmTrPtKTmQqpgmU8CLI8zsA7EfmF7hJ6u95UwnYssdJv
	 HQ+Yn0DMv6YBC/2aljfehV+VUOJYb46wiY3Gy4Z0TWtVVBa0ixLgmMyZJYTJ2sPI9RI7c
	 kF2BIQQ1ZPkM+NSHHyfU83sMuXf1wW4o3QZhmXCU/XcFG79R3s/wDSX4Gps5mbcqSVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="njl/gkPF";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D55606A320;
	Sun,  8 Nov 2026 23:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D55606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=njl/gkPF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794180768; x=1825716768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fi54V+VFdqsG4yBOFRiGtGx1WzCG1Fe17uVh8OseR/Q=;
  b=njl/gkPFRa/M774rjksgEhDasOG/T0QQ2ESVUlNqMJTbH09Zd/y2qpoN
   juf7xhnMvzIE2FNUt11qMYWF+tQcN9KGn+J5O5p4co5JyMiGmdesmODhS
   jZbe20cGaxc6/67RYmqpNMxAJiuF2kQGn1oKCOoiVv10WFkT4SL9khI5h
   CeWUvgyzkTCrHRrmCf0HhYUPP+Ql87rs6cZBxEBKpwWGKot+VNXGGwgvC
   AJ2SVKEm1meI5T0olG7gnrdvAac9nK8vPu9KuCzilf1LopK2dExdmiW/e
   cIaaW6hHBuAUNNgwKaV7UVE5ApQ+reK9i2E87wG65jJfGDkd0gzVV4+PD
   Q==;
X-CSE-ConnectionGUID: /LItd3yPTUKyvLzdKNjxnw==
X-CSE-MsgGUID: IJYpn8zFRaiO37edGOXs+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2909845"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2909845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 15:32:47 -0800
X-CSE-ConnectionGUID: JYca/77zS7yncDSYRey/VA==
X-CSE-MsgGUID: OTEb+65GRAGJzDOpXDgMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7605594"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2026 15:32:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQCNM-00000000tX3-3EMA;
	Sun, 08 Nov 2026 23:32:40 +0000
Date: Mon, 9 Nov 2026 07:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
Message-ID: <202611090709.TnLL9fnj-lkp@intel.com>
References: <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
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
In-Reply-To: <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein/dt-bindings-phy-atcphy-Add-M3-series/20261108-164340
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261108-t8122-phy-v1-3-c2783b2a53a8%40chaosmail.tech
patch subject: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261109/202611090709.TnLL9fnj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090709.TnLL9fnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090709.TnLL9fnj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/phy/apple/atc.c:678 struct member 'hw' not described in 'apple_atcphy'
>> Warning: drivers/phy/apple/atc.c:678 struct member 'hw' not described in 'apple_atcphy'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
