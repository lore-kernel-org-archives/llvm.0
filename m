Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057599;
	b=YPkqsEOgBlkmV4y05uazt4DKNrJE66CE005ibMt8jSu2k3ahMutYgzkHWwYzfOmYtWS7
	 F1nXpjBWw3jojYvvGw7osmSDzmxAhv5E9u4fW78nN9uZm5+cMY2j2gJz1lypuBPDwyHoI
	 aw08e475ou8/imr67h2dfywVqbdiPj4aIShlwJYwtkyu70D78BfUmw16JDK6snDUTYe0F
	 r1m2/LAf/1UV+By2WiguBr4Lum+foUAle0VjQHJNaREuHo4OM51Z5QThjaHFx0/UTI033
	 RJUpwHMpp8Mb7cyPKmrB8ANej0Jui0NOlaQoLIaXLHVrLwBAlO2jODEOV1tZDRqA2iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057599;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gR1qLIaMHhI3YBZAln/1xyLff0Ct3bEmnohy1kd4w4Q=;
	b=sSyIAPiWxxPeI6DeH3ggx0t4sdzJNS7gmZ2ofThHMeFG+4mybX4c7p8rXUwiEPgvzBZG
	 qVo21+Ad9ACHgTAKYabHk3bcm/UJDD5HcSHJiH0VN/0M20XAqZ/xuiQh5Q5IMbiKDSn9x
	 NCGZ/IzH1tQGp0Vwpr7/BU4hpaolL7d3ukBdyVzd5uByGP08EP/xZA0aRvOfEWptUba8a
	 WwSN4ky95OvCJdc86cNFaOd8zUkFlOtMifc9cc0KjKOTkKBRnoCZSTOzXAMCtGeVCXUBi
	 nsDi6aiOhSZO3LS6iybY7Ewz3KCopppRfzc0lzcHwzQmGQ7gdSg+moIlX+p5CneG9uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aGtI849h;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914C560A2601;
	Thu, 19 Nov 2026 03:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 914C560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aGtI849h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795057597; x=1826593597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EfvJartN0GQTYOS8WukorNhnfCAqMp3jN6Awhu42mQU=;
  b=aGtI849hLB/ANrmA/q18GSw9grdCF44Im+zOhkNUJJsxDTHmB1WuhNwK
   9Mm9hO1PmxvqqWnaFq9o80FrE+P2H/VZXc6QfXDcp3/KvEnWrImqeFfFK
   jtyVDRunGV0ujAj0AjcjTjMxrkZJMFqgPr0f9X2lBZcGSCVAbxc4rKiJb
   NM/g75H1uPKKCxnvDhWmM5o9Ug+oteRRtefMyf7Z4WyIVySzZWI0UN9UD
   cH0g6+Uvre7R2glMR22/Br7RlcNAfAjY1CoNRAL6Lu8eae9pvSuD1018L
   y5YJPsZA94VjFNcruhKJfBmf7sDTRLea+7L2Hgi6ivSRGfcts9bD0S9qw
   g==;
X-CSE-ConnectionGUID: yk3Acm3vSZinLjU4AkTCFQ==
X-CSE-MsgGUID: A+oUn+vQRPWs0rH4xCvVKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3906185"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3906185"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 19:06:36 -0800
X-CSE-ConnectionGUID: t+eZmWpVQtWw0a8Ltad/lg==
X-CSE-MsgGUID: cTqBNtlNTRSr8YPa6eNoPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10190438"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Nov 2026 19:06:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTsTn-00000001Ev8-1pXM;
	Thu, 19 Nov 2026 03:06:31 +0000
Date: Thu, 19 Nov 2026 11:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, git@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
Message-ID: <202611191027.Md4LUs3M-lkp@intel.com>
References: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
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
In-Reply-To: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.4-rc3]
[also build test ERROR on linus/master next-20261116]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Simek/media-xilinx-vip-Make-use-of-the-devm_clk_get_enabled/20261118-103132
base:   v7.4-rc3
patch link:    https://lore.kernel.org/r/abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek%40amd.com
patch subject: [PATCH] media: xilinx: vip: Make use of the devm_clk_get_enabled()
config: loongarch-randconfig-1001-20261119 (https://download.01.org/0day-ci/archive/20261119/202611191027.Md4LUs3M-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 67ab6538dff0ed2593b90166214d93e992c74905)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611191027.Md4LUs3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611191027.Md4LUs3M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-vip.c:215:14: error: call to undeclared function 'devm_clk_get_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                     ^
   drivers/media/platform/xilinx/xilinx-vip.c:215:14: note: did you mean 'devm_clk_get_enabled'?
   include/linux/clk.h:632:13: note: 'devm_clk_get_enabled' declared here
     632 | struct clk *devm_clk_get_enabled(struct device *dev, const char *id);
         |             ^
>> drivers/media/platform/xilinx/xilinx-vip.c:215:12: error: incompatible integer to pointer conversion assigning to 'struct clk *' from 'int' [-Wint-conversion]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_clk_get_enable +215 drivers/media/platform/xilinx/xilinx-vip.c

   206	
   207	int xvip_init_resources(struct xvip_device *xvip)
   208	{
   209		struct platform_device *pdev = to_platform_device(xvip->dev);
   210	
   211		xvip->iomem = devm_platform_ioremap_resource(pdev, 0);
   212		if (IS_ERR(xvip->iomem))
   213			return PTR_ERR(xvip->iomem);
   214	
 > 215		xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
   216		if (IS_ERR(xvip->clk))
   217			return PTR_ERR(xvip->clk);
   218	
   219		return 0;
   220	}
   221	EXPORT_SYMBOL_GPL(xvip_init_resources);
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
