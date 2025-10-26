Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA19E17BA6;
	Sun, 26 Oct 2025 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761471831; cv=none; b=STxpedoFvMIqWfUkmfi+RFwiZcRlHr7jKZrxgNG5Npo/yQo+/sNMoW7vb+W/QYvcuFBl2RFpYlEz651tsFYbiXvaRbTUsMtc50JLpzZNqxp4UdlUtuvkQLgc/k76nyDiw1kAW0T1xVZO1tVDvADkEmvlNIJb6v4KT7oCHjQ/wVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761471831; c=relaxed/simple;
	bh=MyRDkkeM1WniRrNwIECJAWX6rR/HsGtbFOS5K7hsaLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uB5t2UGU+yNvDb4hcvHX6nY8YRjD6NxONHwzBpxhUdtLrMBZvjBsHKu2OPC8Sqj33sTv0G8MeVlYYNL1IzFIdHdngQxdIs/ywclKWn7rYgG9t3wzntK/21ThpdIIJ7Bk+qXeRsiF9ThVbfc26ZFY1F843NnXLmXN1nYNBX2AHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2cpkLtx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2cpkLtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761471830; x=1793007830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MyRDkkeM1WniRrNwIECJAWX6rR/HsGtbFOS5K7hsaLo=;
  b=S2cpkLtxga2aoYQoSAUYGHefRaoCxfxZfMin1a8umubTHTf/0hDF+Q25
   BXsdBl0aV6bGpue3F5/cBGLGWBaj5lqW3GfxFOxHqq3QlC7cVRRHPIgLp
   bG+yxv4ZAVZradH76PSAKr/JF7TXtBWylsPcXovNbuEI5x8ah99fI3JnL
   Aws82GDsUgBJ2DM8jhfB1fLTljEzpB8RollMViVKRSqtf8qOVCeVfk2FB
   84vHk+tGfjObm3WkXaO4gz2eQlwU/bSGyGe47gWMoVHwx4UH9mDB6xP8U
   vpXRIlU1QQtZGzXNRAZww2PapvCCbycKiW3YAi76SyEgbaEy/mcdeg8Uv
   g==;
X-CSE-ConnectionGUID: 4RsFP765T5uOm1Gih2ibBQ==
X-CSE-MsgGUID: YbomtsHVSq+JV/LkJnxkWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67224533"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="67224533"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 02:43:50 -0700
X-CSE-ConnectionGUID: RJXJrLBXRruANBTCQE/mPQ==
X-CSE-MsgGUID: sgB1CLxGQzyoEeuxq8N8/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184877434"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2025 02:43:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCxHr-000G1x-2v;
	Sun, 26 Oct 2025 09:43:43 +0000
Date: Sun, 26 Oct 2025 17:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Coia Prant <coiaprant@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the X3568 v4
Message-ID: <202510261750.glZ5VRca-lkp@intel.com>
References: <20251025203711.3859240-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025203711.3859240-1-coiaprant@gmail.com>

Hi Coia,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on krzk-dt/for-next linus/master v6.18-rc2]
[cannot apply to rockchip/for-next next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Coia-Prant/arm64-dts-rockchip-Add-devicetree-for-the-X3568-v4/20251026-043855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20251025203711.3859240-1-coiaprant%40gmail.com
patch subject: [PATCH] arm64: dts: rockchip: Add devicetree for the X3568 v4
config: arm64-randconfig-002-20251026 (https://download.01.org/0day-ci/archive/20251026/202510261750.glZ5VRca-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261750.glZ5VRca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261750.glZ5VRca-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: missing overlay file(s)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
