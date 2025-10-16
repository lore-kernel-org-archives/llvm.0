Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9893451A8;
	Thu, 16 Oct 2025 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626147; cv=none; b=QbDmQzcY6dOxaRJ5lPqeoR9VwphtV7iDIdM/zKXyy0VM0SxC0jTz7Me3xbrsvZ4EAemN8qqAxcY60joLxfkHJYkbm+qVop3QLccGidtryal37N4Qp9Naz4XxV4mstoEHHmXfZHBN1EuoIeTdM6cF8PEVqo6yDGpgGM2ErRX72iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626147; c=relaxed/simple;
	bh=UuaSQVv6dm0D0kN6ZVf9PFfmOCcnIoxeV4OMPhiTiIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2QFlFQCKcBLo7yU3VG59A0xSpbGxSNVsoPmBTj0Rhb1FAZ1sCWyO3HZVw73s/WwKhkQ6o9lJtK3FdibCe0SA8yAulTky5s0SJKn1fPSWsLx0EI+ByWAVaFEnbHOavkH/ARUkbOKhjdrr7QGyoFCSDJK7zjQdG1cUtUZTiLJGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGwEiQlP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGwEiQlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760626138; x=1792162138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UuaSQVv6dm0D0kN6ZVf9PFfmOCcnIoxeV4OMPhiTiIk=;
  b=RGwEiQlP07ZZX2zM2cLqbhzOjpmYqeyBcoMZgVw0TkistebBR7PzOpfa
   C+RoRhHwJBEE1EhvbjAXSPmlQf2aRSHdgXrgLrhxMORn9c4d8QKvJCi4x
   utUZJ7Gm5Cqj13u1aVSFZvAXFTML+kfzXCI4aw2NPh9HkMsDjmXBojWtJ
   amejn73ENXOYjSr7bThdL4YDRgAA5f1VrDLNDPLBf7ODc/1o5Yq5ZK6rU
   6EpUbsKIl6iOerZYLAulgMWbuiD53Ugvj+pGU5+sWMmKkBns6itMd2YCa
   1ECJTHfSqqH2X9q9lQD5CBy7V8doyVbD49eJPleVGSpuvZNS2frcc10OO
   g==;
X-CSE-ConnectionGUID: utTlC5sMTJSt7cgp/JR9Vg==
X-CSE-MsgGUID: 77NIn56PRMGhezg/yFJeUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65435739"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="65435739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 07:48:53 -0700
X-CSE-ConnectionGUID: txGvphJxSIe+Wkrpx74r1A==
X-CSE-MsgGUID: vPVOaWWKReulJ8C0yPEhtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="186746061"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2025 07:48:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9PHZ-0004vD-1i;
	Thu, 16 Oct 2025 14:48:45 +0000
Date: Thu, 16 Oct 2025 22:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] iio: adc: Add support for the Renesas RZ/N1 ADC
Message-ID: <202510162222.Fe1rY5aB-lkp@intel.com>
References: <20251015142816.1274605-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015142816.1274605-3-herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on geert-renesas-devel/next linus/master v6.18-rc1 next-20251015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-Schneider-Electric/dt-bindings-iio-adc-Add-the-Renesas-RZ-N1-ADC/20251015-223254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20251015142816.1274605-3-herve.codina%40bootlin.com
patch subject: [PATCH 2/4] iio: adc: Add support for the Renesas RZ/N1 ADC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251016/202510162222.Fe1rY5aB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510162222.Fe1rY5aB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510162222.Fe1rY5aB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/rzn1-adc.c:243:35: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     243 |                 vc |= RZN1_ADC_VC_ADC1_ENABLE | RZN1_ADC_VC_ADC1_CHANNEL_SEL(adc1_ch);
         |                                                 ^
   drivers/iio/adc/rzn1-adc.c:53:42: note: expanded from macro 'RZN1_ADC_VC_ADC1_CHANNEL_SEL'
      53 | #define RZN1_ADC_VC_ADC1_CHANNEL_SEL(_c)        FIELD_PREP(RZN1_ADC_VC_ADC1_CHANNEL_SEL_MASK, _c)
         |                                                 ^
>> drivers/iio/adc/rzn1-adc.c:304:16: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     304 |                 *adc1_data = RZN1_ADC_ADCX_GET_DATA(data_reg);
         |                              ^
   drivers/iio/adc/rzn1-adc.c:58:38: note: expanded from macro 'RZN1_ADC_ADCX_GET_DATA'
      58 | #define RZN1_ADC_ADCX_GET_DATA(_reg)    FIELD_GET(RZN1_ADC_ADCX_DATA_DATA_MASK, _reg)
         |                                         ^
   drivers/iio/adc/rzn1-adc.c:309:16: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     309 |                 *adc2_data = RZN1_ADC_ADCX_GET_DATA(data_reg);
         |                              ^
   drivers/iio/adc/rzn1-adc.c:58:38: note: expanded from macro 'RZN1_ADC_ADCX_GET_DATA'
      58 | #define RZN1_ADC_ADCX_GET_DATA(_reg)    FIELD_GET(RZN1_ADC_ADCX_DATA_DATA_MASK, _reg)
         |                                         ^
   3 errors generated.


vim +/FIELD_PREP +243 drivers/iio/adc/rzn1-adc.c

   236	
   237	static void rzn1_adc_vc_setup_conversion(struct rzn1_adc *rzn1_adc, u32 ch,
   238						 int adc1_ch, int adc2_ch)
   239	{
   240		u32 vc = 0;
   241	
   242		if (adc1_ch != -1)
 > 243			vc |= RZN1_ADC_VC_ADC1_ENABLE | RZN1_ADC_VC_ADC1_CHANNEL_SEL(adc1_ch);
   244	
   245		if (adc2_ch != -1)
   246			vc |= RZN1_ADC_VC_ADC2_ENABLE | RZN1_ADC_VC_ADC2_CHANNEL_SEL(adc2_ch);
   247	
   248		writel(vc, rzn1_adc->regs + RZN1_ADC_VC_REG(ch));
   249	}
   250	
   251	static int rzn1_adc_vc_start_conversion(struct rzn1_adc *rzn1_adc, u32 ch)
   252	{
   253		u32 val;
   254	
   255		val = readl(rzn1_adc->regs + RZN1_ADC_FORCE_REG);
   256		if (val & RZN1_ADC_FORCE_VC(ch))
   257			return -EBUSY;
   258	
   259		writel(RZN1_ADC_FORCE_VC(ch), rzn1_adc->regs + RZN1_ADC_SET_FORCE_REG);
   260	
   261		return 0;
   262	}
   263	
   264	static void rzn1_adc_vc_stop_conversion(struct rzn1_adc *rzn1_adc, u32 ch)
   265	{
   266		writel(RZN1_ADC_FORCE_VC(ch), rzn1_adc->regs + RZN1_ADC_CLEAR_FORCE_REG);
   267	}
   268	
   269	static int rzn1_adc_vc_wait_conversion(struct rzn1_adc *rzn1_adc, u32 ch,
   270					       u32 *adc1_data, u32 *adc2_data)
   271	{
   272		u32 data_reg;
   273		int ret;
   274		u32 v;
   275	
   276		/*
   277		 * When a VC is selected, it needs 20 ADC clocks to perform the
   278		 * conversion.
   279		 *
   280		 * The worst case is when the 16 VCs need to perform a conversion and
   281		 * our VC is the lowest in term of priority.
   282		 *
   283		 * In that case, the conversion is performed in 16 * 20 ADC clocks.
   284		 *
   285		 * The ADC clock can be set from 4MHz to 20MHz. This leads to a worst
   286		 * case of  16 * 20 * 1/4Mhz = 80us.
   287		 *
   288		 * Round it up to 100us
   289		 */
   290	
   291		/*
   292		 * Wait for the ADC_FORCE_VC(n) to clear.
   293		 *
   294		 * On timeout, ret is -ETIMEDOUT, otherwise it will be 0.
   295		 */
   296		ret = readl_poll_timeout_atomic(rzn1_adc->regs + RZN1_ADC_FORCE_REG,
   297						v, !(v & RZN1_ADC_FORCE_VC(ch)),
   298						0, 100);
   299		if (ret)
   300			return ret;
   301	
   302		if (adc1_data) {
   303			data_reg = readl(rzn1_adc->regs + RZN1_ADC_ADC1_DATA_REG(ch));
 > 304			*adc1_data = RZN1_ADC_ADCX_GET_DATA(data_reg);
   305		}
   306	
   307		if (adc2_data) {
   308			data_reg = readl(rzn1_adc->regs + RZN1_ADC_ADC2_DATA_REG(ch));
   309			*adc2_data = RZN1_ADC_ADCX_GET_DATA(data_reg);
   310		}
   311	
   312		return 0;
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
