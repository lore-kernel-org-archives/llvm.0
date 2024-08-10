Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA408101EE;
	Sat, 10 Aug 2024 03:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723259723; cv=none; b=F8+EJFGsMWgWsQo4bmj9gZPBj6YBZENEKRFZt14P8TL67IibuW2noO8r/At+Ejvv6ZjANbs123pPSNRe7rpjPc18ZfokUOUm3yenjnTWvZDuB29tKhJ7yE623BNcTWdaCnfHLoWrOo7iaaafwFCDI7NpfoskS9JSbzBJ6ggm5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723259723; c=relaxed/simple;
	bh=+AXxAZeQ3+cVCkfGUCeK9JbEtr3eBwtUrQPCfK/pNME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjZIwBsfaYMyKZezIt0jMDbhhiojhGO8x2ZJ/7P++9x8DtLc35wjcR1BYPvCvRjqyS/YllL6xEyTmx1EzbHrYqgzBZlyPkvI9iDzSPR1O13FHL+JMifP4eHqQr8KYflEsdr5w2wBfYm4xdnue1ycU8wFKmgYWUjdwFn1BkcHSSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOKWA0Oq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOKWA0Oq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723259722; x=1754795722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+AXxAZeQ3+cVCkfGUCeK9JbEtr3eBwtUrQPCfK/pNME=;
  b=YOKWA0OqMaKmk5fWff2GHqXlfUsKtxHZALQelf5kjB0OGKHUkUIKlRZC
   2dfJKwunexjgAytGl6uVDK5kQnJmlMGl774BEDEqFbewepj4sqxY01s1j
   pFiaa9bPrl3MrtWiSHv1h36Et3ib9on48ipNYRqw9eUvwBm+Yy7gF3YZe
   zgFya/eOzP5y1ORgG6yHjNKg07E8pNJBN4XDPcyOFmF/F/t6fhANXwX/s
   ka16TMVtts/eJhvvwiuq+PTBwS8z5axMgtTABbmr2w28v0sPBkoU2kIqq
   syY/HyGRthO2Bv6yQjkVztgsRqzgDAlfTWb+Xri4eWYuHmo1b88rNcCBK
   w==;
X-CSE-ConnectionGUID: DPkFaHeDTW6dtXHXUyyc0A==
X-CSE-MsgGUID: 4GABFNt4QG66rzqhAUgVhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25309830"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="25309830"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 20:15:21 -0700
X-CSE-ConnectionGUID: WMgszYBxQEyUrRXCxfcFaQ==
X-CSE-MsgGUID: T4es5DIkSlaeJb1iNUhuNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="61883466"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 09 Aug 2024 20:15:20 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sccZZ-0009Yh-2p;
	Sat, 10 Aug 2024 03:15:17 +0000
Date: Sat, 10 Aug 2024 11:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: William Qiu <william.qiu@starfivetech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14] pwm: opencores: Add PWM driver support
Message-ID: <202408101110.MQacUqc7-lkp@intel.com>
References: <20240809103831.156436-1-william.qiu@starfivetech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809103831.156436-1-william.qiu@starfivetech.com>

Hi William,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on thierry-reding-pwm/for-next v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Qiu/pwm-opencores-Add-PWM-driver-support/20240809-213210
base:   linus/master
patch link:    https://lore.kernel.org/r/20240809103831.156436-1-william.qiu%40starfivetech.com
patch subject: [PATCH v14] pwm: opencores: Add PWM driver support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240810/202408101110.MQacUqc7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101110.MQacUqc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408101110.MQacUqc7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pwm/pwm-ocores.c:19:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pwm/pwm-ocores.c:19:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pwm/pwm-ocores.c:19:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/pwm/pwm-ocores.c:132:3: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
     132 |                 ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_HRC, (u32)duty_data);
         |                 ^
   drivers/pwm/pwm-ocores.c:130:2: note: previous statement is here
     130 |         else if (duty_data > U32_MAX)
         |         ^
>> drivers/pwm/pwm-ocores.c:133:2: error: expected expression
     133 |         else
         |         ^
   7 warnings and 1 error generated.


vim +133 drivers/pwm/pwm-ocores.c

   106	
   107	static int ocores_pwm_apply(struct pwm_chip *chip,
   108				    struct pwm_device *pwm,
   109				    const struct pwm_state *state)
   110	{
   111		struct ocores_pwm_device *ddata = chip_to_ocores(chip);
   112		u32 ctrl_data = 0;
   113		u64 period_data, duty_data;
   114	
   115		if (state->polarity != PWM_POLARITY_INVERSED)
   116			return -EINVAL;
   117	
   118		period_data = mul_u64_u32_div(state->period, ddata->clk_rate, NSEC_PER_SEC);
   119		if (!period_data)
   120			return -EINVAL;
   121	
   122		if (period_data > U32_MAX)
   123			period_data = U32_MAX;
   124	
   125		ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_LRC, (u32)period_data);
   126	
   127		duty_data = mul_u64_u32_div(state->duty_cycle, ddata->clk_rate, NSEC_PER_SEC);
   128		if (duty_data <= U32_MAX)
   129			ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_HRC, (u32)duty_data);
   130		else if (duty_data > U32_MAX)
   131			duty_data = U32_MAX;
 > 132			ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_HRC, (u32)duty_data);
 > 133		else
   134			return -EINVAL;
   135	
   136		ctrl_data = ocores_pwm_readl(ddata, pwm->hwpwm, REG_OCPWM_CTRL);
   137		if (state->enabled)
   138			ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_CTRL,
   139					  ctrl_data | REG_OCPWM_CNTR_EN | REG_OCPWM_CNTR_OE);
   140		else
   141			ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_CTRL,
   142					  ctrl_data & ~(REG_OCPWM_CNTR_EN | REG_OCPWM_CNTR_OE));
   143	
   144		return 0;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
