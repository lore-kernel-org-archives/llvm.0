Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D821FDE39;
	Thu, 15 Jan 2026 06:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768457996; cv=none; b=Ely4IXzDwAdV1dute9zUZdb/JbAGtb0yLZJsZ1BBoHL7e+KsCaJ22SzLiuLSgD/P/RmJyv/uPT1Lgul07oRqoMBQriS/Eiq7ZXB6yLnMYI0imFZ7e/2gom83OzVmJuwNydiX3loMyfyJ7wwS+tr/zVqcstY1E9M5Hm3OAsuZuqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768457996; c=relaxed/simple;
	bh=bpp8jtdFQ8kAIB0QGTZOIG6j0EVnnFiTl/Izans+4Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgzpbxPB2TQOXFaf86p96hu6svMk+9djMY6LKi2GlrcJj0S/0AqM9Rat85k9MnB5exf1kzwgDBgIY+d5UDZbA6ZuSXCyHYWkpOhOfxWiU6fJ0ivnxl3XGMqug3CIY467S9/uBlsZglnxDhNgoK2IlW4qigx5WmfFRx/Pl3QnSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNBw59/T; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNBw59/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768457995; x=1799993995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bpp8jtdFQ8kAIB0QGTZOIG6j0EVnnFiTl/Izans+4Sc=;
  b=iNBw59/TMb6ICuAdszZD8Btb9DKNDc4MtWB8ywXDx3+O+r9ZevPxeP4X
   9+OJOdK68twYMP5h3F+MdWB6z3lh5od7mRGthf2tFx5RniSpFJL7HuW5x
   OomS3p58Kh42Cnx1DSm5hEFlis1XhTM1Y2ytZ74Yq9FnkKFO7DSAXODsx
   ru0L2q9oDF3OSYxjMSZrfJJmU+0iSYNTDFcTSQyr0+D6x5wQ1H2r4uwM4
   1Kds7xRoQv3/8cUYV3KX4/38lP69LKjNB7IMJ+dZH8mmYy8/mdUeKjV1R
   JThBO4rydWiUnryUxbwCdAoj8zHwFfe5YCDvXZqLndU7Lof4qJpvZRYxz
   g==;
X-CSE-ConnectionGUID: QuW5mCQiQtiNJ5HT5rvfng==
X-CSE-MsgGUID: lt6Xwsp0Tm64a7BRyHJU3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69811871"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69811871"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 22:19:54 -0800
X-CSE-ConnectionGUID: bxldMNgSTYOBzneZ0/zV4Q==
X-CSE-MsgGUID: PeDn7z8VQhWAMmzvHvJ/aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204497410"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jan 2026 22:19:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgGhv-00000000Hei-3CcF;
	Thu, 15 Jan 2026 06:19:47 +0000
Date: Thu, 15 Jan 2026 14:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: Re: [PATCH v4 5/5] thermal: renesas: rzg3e: add support for RZ/T2H
 and RZ/N2H
Message-ID: <202601151305.gz45Wzg5-lkp@intel.com>
References: <20260108165324.11376-6-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108165324.11376-6-cosmin-gabriel.tanislav.xa@renesas.com>

Hi Cosmin,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on linus/master v6.19-rc5 next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/thermal-renesas-rzg3e-make-min-and-max-temperature-per-chip/20260109-015424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20260108165324.11376-6-cosmin-gabriel.tanislav.xa%40renesas.com
patch subject: [PATCH v4 5/5] thermal: renesas: rzg3e: add support for RZ/T2H and RZ/N2H
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260115/202601151305.gz45Wzg5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151305.gz45Wzg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151305.gz45Wzg5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/renesas/rzg3e_thermal.c:371:23: error: variable has incomplete type 'struct arm_smccc_res'
     371 |         struct arm_smccc_res local_res;
         |                              ^
   drivers/thermal/renesas/rzg3e_thermal.c:371:9: note: forward declaration of 'struct arm_smccc_res'
     371 |         struct arm_smccc_res local_res;
         |                ^
>> drivers/thermal/renesas/rzg3e_thermal.c:373:2: error: call to undeclared function 'arm_smccc_smc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     373 |         arm_smccc_smc(RZ_SIP_SVC_GET_SYSTSU, OTP_TSU_REG_ADR_TEMPLO,
         |         ^
   2 errors generated.


vim +371 drivers/thermal/renesas/rzg3e_thermal.c

   368	
   369	static int rzg3e_thermal_get_smc_trim(struct rzg3e_thermal_priv *priv)
   370	{
 > 371		struct arm_smccc_res local_res;
   372	
 > 373		arm_smccc_smc(RZ_SIP_SVC_GET_SYSTSU, OTP_TSU_REG_ADR_TEMPLO,
   374			      0, 0, 0, 0, 0, 0, &local_res);
   375		priv->trmval0 = local_res.a0 & TSU_CODE_MAX;
   376	
   377		arm_smccc_smc(RZ_SIP_SVC_GET_SYSTSU, OTP_TSU_REG_ADR_TEMPHI,
   378			      0, 0, 0, 0, 0, 0, &local_res);
   379		priv->trmval1 = local_res.a0 & TSU_CODE_MAX;
   380	
   381		return 0;
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
