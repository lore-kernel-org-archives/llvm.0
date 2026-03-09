Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038F53A962D;
	Mon,  9 Mar 2026 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072411; cv=none; b=Kx8HTeiaXYpAN6kAlo1p+aP1lGDYfS1FO6Fx/UHRCys69DDB2z8N7KCZzLl94BfqClHZj2nj6Zw0FNHA3JdDNkQj/twf02EmXj23gF2yuYN9ekf1rDzQZN7xgxlK9pumd7rJX1FKE9/uUIxmmoTiKjDSwno69QbArjGVyVTex5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072411; c=relaxed/simple;
	bh=Nrs4LfI0MkcALVaXmDTIrClgexDio6vlH3HqaNPh4MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crBc+8x7Era1jeWVjozdk6txc/Qu5HPbHSr6byYm/oZ5BmXAHCLwdN8m5GACkWNkbMOdeCJN5PEDo5NrUTZutzwc03DiTWLPOxd/lF3QdTYnDiy6mvIIobLIRMdhW+VZX/jmdsuQ3xTXu1E8o3TmMqoqs7pVeeRtQIGe0UFj4Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEsnTlSi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEsnTlSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773072410; x=1804608410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nrs4LfI0MkcALVaXmDTIrClgexDio6vlH3HqaNPh4MU=;
  b=BEsnTlSivHogW3HftUY0wlhmN4QiEwEnpyiaHyjBY7T8cv54mVbC/eqV
   vxDxh2dczLTs4rp6t+184IGtwIpzXK92EySTC72lqAli60BjeTtqfgQ6M
   eMxN3PNO8xTMfFlx+omJ5LSsXD+3/daChW8qhJkpuXiJXBrkvMGze/r/G
   7GRDefLmqAp/ENH+ZB5rmoM8Mt45QMeGmZR8eX4e2tBf09j2nutZo3rNl
   td425Mi4F66rz01ORSsaGOxqs+DDTtCWYhhT1dwY3DLJeL7QkKq5Qsg3G
   IsfSLHmTPCbsW+H8ROZzVocZM0mWSFFkMsiMJbMv0/AiQ+LuDmm4u+QVA
   g==;
X-CSE-ConnectionGUID: l/xG7WUbS+66u+3JuwLt1Q==
X-CSE-MsgGUID: GTo/nUB2TkKLkG7sol/55A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="96719263"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="96719263"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 09:06:45 -0700
X-CSE-ConnectionGUID: hw1L35B7TIyOZphvn6wKCQ==
X-CSE-MsgGUID: OGQZLM0ORGWW8SB/mTnf1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219009509"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2026 09:06:41 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzd7u-000000000Uu-2bLU;
	Mon, 09 Mar 2026 16:06:38 +0000
Date: Tue, 10 Mar 2026 00:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Maimon <maimon.sagi@gmail.com>, jonathan.lemon@gmail.com,
	vadim.fedorenko@linux.dev, richardcochran@gmail.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: Re: [PATCH v2] ptp: ocp: Add support for Xilinx-based Adva TimeCard
 variant
Message-ID: <202603100054.UoKwTVMf-lkp@intel.com>
References: <20260308080944.5200-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308080944.5200-1-maimon.sagi@gmail.com>

Hi Sagi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v7.0-rc3 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sagi-Maimon/ptp-ocp-Add-support-for-Xilinx-based-Adva-TimeCard-variant/20260308-161130
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260308080944.5200-1-maimon.sagi%40gmail.com
patch subject: [PATCH v2] ptp: ocp: Add support for Xilinx-based Adva TimeCard variant
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260310/202603100054.UoKwTVMf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100054.UoKwTVMf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100054.UoKwTVMf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_ocp.c:438:32: warning: tentative definition of variable with internal linkage has incomplete non-array type 'const struct ocp_sma_op' [-Wtentative-definition-incomplete-type]
     438 | static const struct ocp_sma_op ocp_adva_sma_op;
         |                                ^
   drivers/ptp/ptp_ocp.c:84:15: note: forward declaration of 'struct ocp_sma_op'
      84 |         const struct ocp_sma_op         *sma_op;
         |                      ^
   drivers/ptp/ptp_ocp.c:439:32: warning: tentative definition of variable with internal linkage has incomplete non-array type 'const struct ocp_sma_op' [-Wtentative-definition-incomplete-type]
     439 | static const struct ocp_sma_op ocp_adva_x1_sma_op;
         |                                ^
   drivers/ptp/ptp_ocp.c:84:15: note: forward declaration of 'struct ocp_sma_op'
      84 |         const struct ocp_sma_op         *sma_op;
         |                      ^
   2 warnings generated.


vim +438 drivers/ptp/ptp_ocp.c

   437	
 > 438	static const struct ocp_sma_op ocp_adva_sma_op;
   439	static const struct ocp_sma_op ocp_adva_x1_sma_op;
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
