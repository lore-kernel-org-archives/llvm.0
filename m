Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255100;
	b=ggEaOoHj4P+bssXnLB+3/4FYFlA3wb4g+haqTjIPrk3Mw8d6C/Awzqh9DgMPdPxy9BSk
	 8FsBh0Qajjvv2ekYoytwC0r8Nh0jbrgcLCHxbuvuYHyoPWf3Yb71A6LUAnQS+KkqN8Ryl
	 5C8avF11fBHh/bU3KJeA/lmQXoxs/UADCQL07anCzAM/gl1moPJB1IojgE+FlspKD/sVC
	 XLFNd30WKi1Tj7/DkzvcHXSoXqSZDJoSxuMGFp2WXli7okN1uDcyGqraIds86hnYfzO+d
	 puiNjGVGHRqUVMeOFZLlWGZnUWIU4e8jwV2aSvBRL4JMqlZGTMAxjh0DRMZDJrb7u7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255100;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GoWcFfV9M2fId+2o3IT2LxfxmhwYOP2ZbBx5GEYSW/g=;
	b=D5Fs3ZNIrEkIBWo2woZ/IW416xu9zZgtg/Nc/S6rYEacYU9X8q7gWH2ONQhygkyPjkw4
	 4UhdbgrVUw4dmVxulMbn/fHpNkeE121wCtIyD0Xm3NtFduoj87ZNMoKs/pP0pwBBwlYgr
	 m0WvmFDiB8lky2PHe2q8zTgKHMmpaeneOPxC4rLaen+IJWVC3ilTwqMPTRQFHGipyouUW
	 5bwnFG9a7cqjVR6kbXO6ufqDFqMJav28iyItK/BwincTvQFXzwhEGbnL31ZvACZ98R+qb
	 WKCZXnUEaWBNvdz3r7ywxIBKjxa1ORYSak3MY63KCDxTBSSC6TiUfEpgLk9OOyu3hpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nScnmFMC;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B2D606A31D;
	Thu, 29 Oct 2026 06:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0B2D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nScnmFMC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793255093; x=1824791093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iSIBsFr6RspUk/5LZrqwFhSWs4iU4YOkCBQI/UmN6tA=;
  b=nScnmFMCF6UvkehtH3kp1qagJftoSK4R2/fSXkp9KNdNdQaC5qha5KFP
   paUKALxFjYkOrThv4eCuCP1zUR5OQFk0nRgNQA/15gs4GCZUp9kmy3UTZ
   KOcHPHq3Ce1699QfHdSPz9OWDZvBQfvoAa/50E1bo80tPD+oimIBF/nYO
   3eibgyfYovJxGBWzlSiYZ8wBLSCf/CBl7gz8fcZd0FjSXYa2ZP1zbP0e4
   Fo6XMgXzof2iKBQPAbr4KO5TSSFikwkRHkj7YDveaHYcJBVMm3MFErWVe
   1x7JinFidTAmel6g7uJH4mZiXYfnP/wiU2zQo4IdIoErI3HxHWhxz8043
   A==;
X-CSE-ConnectionGUID: ZZKNDieHQFabXxSuxkYaiA==
X-CSE-MsgGUID: fKMZzkb9RVesPB1+p6cG7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1901723"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1901723"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 23:24:52 -0700
X-CSE-ConnectionGUID: CsEknmunREmuJ83o0a3MNw==
X-CSE-MsgGUID: ObcGxGaXSb2D3wwGb1/fdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6880887"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 28 Oct 2026 23:24:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMJZ8-00000000ZgW-1itp;
	Thu, 29 Oct 2026 06:24:46 +0000
Date: Thu, 29 Oct 2026 14:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Morgan <macroalpha82@gmail.com>, linux-pm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, sre@kernel.org, t.schramm@manjaro.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/3] power: supply: cw2217: Add support for Cellwise
 cw2217
Message-ID: <202610291456.pByroJTe-lkp@intel.com>
References: <20261027131751.1724448-3-macroalpha82@gmail.com>
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
In-Reply-To: <20261027131751.1724448-3-macroalpha82@gmail.com>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on sre-power-supply/for-next]
[also build test ERROR on rockchip/for-next amd-pstate/linux-next amd-pstate/bleeding-edge linus/master v7.3 next-20261028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-power-cw2015-add-cw2215-cw2217-and-cw2218/20261027-081749
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20261027131751.1724448-3-macroalpha82%40gmail.com
patch subject: [PATCH 2/3] power: supply: cw2217: Add support for Cellwise cw2217
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261029/202610291456.pByroJTe-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1da436a23e613c425fc9b868fc8deb979ede47a4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291456.pByroJTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291456.pByroJTe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/power/supply/cw2217_battery.c:261:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     261 |         fw_ver = FIELD_GET(CW2217_ID_MASK, cw_bat->fw_version);
         |                  ^
   drivers/power/supply/cw2217_battery.c:465:12: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     465 |                                        FIELD_GET(CW2217_IC_READY_MASK, reg) == CW2217_IC_READY,
         |                                        ^
   drivers/power/supply/cw2217_battery.c:491:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     491 |         if (FIELD_GET(CW2217_CONFIG_ACT_MSK, reg)) {
         |             ^
   3 errors generated.


vim +/FIELD_GET +261 drivers/power/supply/cw2217_battery.c

   231	
   232	/*
   233	 * Current is a signed 16bit register (0x0E 0x0F) that reports current A/D
   234	 * converter result of the voltage across the current sense resistor,
   235	 * 10mohm typical. The register value should be divided by the sense
   236	 * resistance to convert to amperes. The value of the sense resistor
   237	 * determines the resolution and the full-scale range of the current readings.
   238	 * The LSB of 0x0F is (52.4/32768)uV for CW2215 and CW2217. The LSB of 0x0F is
   239	 * (125/32768)uV for CW2218.
   240	 */
   241	static int cw2217_get_current(struct cw2217_battery *cw_bat)
   242	{
   243		s32 cw_current;
   244		__be16 reg;
   245		u8 fw_ver;
   246		int ret;
   247	
   248		if (cw_bat->fw_version == 0) {
   249			cw_bat->cw_current = 0;
   250			dev_err(cw_bat->dev, "Error! CW2217 firmware read error!\n");
   251			return -EIO;
   252		}
   253	
   254		ret = regmap_bulk_read(cw_bat->regmap, CW2217_CURRENT_H,
   255				       &reg, sizeof(reg));
   256		if (ret)
   257			return ret;
   258	
   259		cw_current = (s16)be16_to_cpu(reg);
   260	
 > 261		fw_ver = FIELD_GET(CW2217_ID_MASK, cw_bat->fw_version);
   262		switch (fw_ver) {
   263		case CW2215_ID:
   264		case CW2217_ID:
   265			cw_current = (cw_current * 1600) / (cw_bat->user_rsense / 1000);
   266			cw_bat->cw_current = cw_current * 1000;
   267			break;
   268		case CW2218_ID:
   269			cw_current = (cw_current * 3815) / (cw_bat->user_rsense / 1000);
   270			cw_bat->cw_current = cw_current * 1000;
   271			break;
   272		default:
   273			cw_bat->cw_current = 0;
   274			dev_err(cw_bat->dev, "Error! CW2217 firmware read error!\n");
   275			return -EIO;
   276		}
   277	
   278		return 0;
   279	}
   280	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
