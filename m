Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF7A27E7FD;
	Fri,  8 Aug 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754664972; cv=none; b=icghyPnhp8Q2HbPd3J26hJOREfgZU4M/NE8pSKksIXSvyLd0HN38N/CL+EekFrotNr8eg3N6wmGvt9gLLgLg2EMywxefcYhQLjutS1N8nQsT7LBpD2JCqCYbg+puasjYXHIxx5Sb+I+1wlQiI07r8dnGTiZ8wLiAnINwqn8Spyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754664972; c=relaxed/simple;
	bh=9cmQQnt+5Vh9t9k0T6ZjOC/Hqj03S1Kl6bmJEzpiMNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0SJZPOjf548De+hYS13b4MK6TZlRPted5+saDfaQPuJmZS8t6vd21yN4IRidHeEjkmNm+X0Gm6U+0imivWEEWny3vgARK3ozgsm+csG35mo0AsaqLpgaKMboRQG6Ej1U3UE7RjEFKUrLp/Xl9pADgi6s3lRzsbuP0lKOVPoMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zd2mACpo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zd2mACpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754664970; x=1786200970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9cmQQnt+5Vh9t9k0T6ZjOC/Hqj03S1Kl6bmJEzpiMNY=;
  b=Zd2mACpoCcwsbpxa3cPghR2jMl4pIoVSi6HA/J0oxQ3uVMyQ0h8IyP2Z
   pZ1BXMPSmsjWOSOtLPuNi4xAVH7Y9+jLXBYGQcA4kqFt7gA+2aBGKYONb
   TrJ+XJ1HDdPV4MT+igZGG1NgzH9trAIdRFHCtuOIcQQknwijslgpxHJN+
   T/t+7ceMH44ZHxx3LTOPjxN3pCKvKPSDz5Ff+duiiGhGj5Blf+prvnpXt
   mAu1PZCDjjyYG+S89JwvPq0lPOtcsEzUXx9VFQ8W/Pk0OnPqpx6b5OfKt
   D+HKKiouFBNK25BJhvmYRDudrTlus65nkYXbSevYNZQHlgvWL3hlZfg3u
   w==;
X-CSE-ConnectionGUID: lFhZ88yISX6S543GFFRJvQ==
X-CSE-MsgGUID: hVmrJmFqRsmt20CV+OBz8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68379120"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68379120"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 07:56:08 -0700
X-CSE-ConnectionGUID: X6Yod+yjSSeDE8W/x5Ojgg==
X-CSE-MsgGUID: VWgRjysaSEilNZcCFOMK9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164583186"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2025 07:56:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukOVn-000420-0B;
	Fri, 08 Aug 2025 14:56:03 +0000
Date: Fri, 8 Aug 2025 22:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
Message-ID: <202508082259.wdaPWdYV-lkp@intel.com>
References: <20250807151434.5241-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807151434.5241-10-wsa+renesas@sang-engineering.com>

Hi Wolfram,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-devel/next]
[also build test ERROR on linus/master next-20250808]
[cannot apply to v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/arm64-dts-renesas-r9a08g045-Add-I3C-node/20250807-231733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250807151434.5241-10-wsa%2Brenesas%40sang-engineering.com
patch subject: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
config: arm64-randconfig-001-20250808 (https://download.01.org/0day-ci/archive/20250808/202508082259.wdaPWdYV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508082259.wdaPWdYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508082259.wdaPWdYV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi:127.1-5 Label or path i3c not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
