Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43A34F247;
	Tue, 11 Nov 2025 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857745; cv=none; b=afsEeDwSXeyhly77VWXRRpMppi90oBArhPl+54DjOjxJZ1S2qsPuiszlCmo4DikYnCa8vb7ZGLmNUrLJc6opur222ST+iWE3E/ECXJa6BWNW1BCOerNKz1SRbVd99NdCMY+t72hKLAQsxK2B6dfvegNc35oMhxGVD3zIM2oD7hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857745; c=relaxed/simple;
	bh=EvBQ+nafnKKdJuiEBqoaBt041KfoiKj53G5fHkyybXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/LGH8fOkRmjUtxuk2v0zGMpIfgbv2s1p7cK5ro3QCiCVFi9SIYrwZBzBL3+ZLQwHq2Abr1vlk7ebCWAZPEJdlOGfeSi0O/sVd9X/sR1VcwCeAmLVAwPi8P3ehtz1NcKwXLUDTGv15mmhnA9dHlo2jqwTywJUwi1Y6d4II9Fo9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4HbQhHM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4HbQhHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762857743; x=1794393743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EvBQ+nafnKKdJuiEBqoaBt041KfoiKj53G5fHkyybXs=;
  b=A4HbQhHMiUimgJsHvccDhSKG81fNPUWQuGOce3v66HhlUy9sysXHr1Z4
   B8fCOkhfOjUe88MbB68HUwLLl9iyOHXUlmK04xB7GMi0LS2QsS44kykJ9
   RXFrLDh+yNFhTxVLveJLCAhkH5UX1UYPQaU5UzmBxsxRjDg1YIWrOmhro
   9/v+BdMDpJglK97SvlOYNQoxkG8ow0CwB2Kk4e5AkvS8jxeMbNmluBrE3
   AN3vfr4XIt/d1c6ONQpG3PZnZLNAEMGk3kxMiQj0OzylcasG2IsX7jdy1
   dnCiTDtdx487x8UYTSMkHMtwDVkiTu7ctE0n1/+k/dus3mmKPgmclszrj
   w==;
X-CSE-ConnectionGUID: dSiE2/FrQ22rhxXa97hD2g==
X-CSE-MsgGUID: 52f8nh+DT3q7mqmtZVXpTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82545876"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="82545876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 02:42:22 -0800
X-CSE-ConnectionGUID: bic6vsxET96kWEWmZy4Shw==
X-CSE-MsgGUID: RrZPJKBeTIucI3ym3xcs/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189195161"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2025 02:42:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIlpJ-00033P-36;
	Tue, 11 Nov 2025 10:42:17 +0000
Date: Tue, 11 Nov 2025 18:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Petr Oros <poros@redhat.com>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Michal Schmidt <mschmidt@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/6] dpll: zl3073x: Cache all output properties
 in zl3073x_out
Message-ID: <202511111809.FLxbtr0Z-lkp@intel.com>
References: <20251110175818.1571610-6-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110175818.1571610-6-ivecera@redhat.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dpll-zl3073x-Store-raw-register-values-instead-of-parsed-state/20251111-020236
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251110175818.1571610-6-ivecera%40redhat.com
patch subject: [PATCH net-next 5/6] dpll: zl3073x: Cache all output properties in zl3073x_out
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20251111/202511111809.FLxbtr0Z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111809.FLxbtr0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111809.FLxbtr0Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dpll/zl3073x/dpll.c:1488:43: warning: variable 'name' is uninitialized when used here [-Wuninitialized]
    1488 |                                 "%s%u is driven by different DPLL\n", name,
         |                                                                       ^~~~
   drivers/dpll/zl3073x/dpll.c:1467:18: note: initialize the variable 'name' to silence this warning
    1467 |         const char *name;
         |                         ^
         |                          = NULL
   drivers/dpll/zl3073x/dpll.c:1651:28: warning: variable 'ref' set but not used [-Wunused-but-set-variable]
    1651 |         const struct zl3073x_ref *ref;
         |                                   ^
   2 warnings generated.


vim +/name +1488 drivers/dpll/zl3073x/dpll.c

75a71ecc24125f9 Ivan Vecera 2025-07-04  1446  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1447  /**
75a71ecc24125f9 Ivan Vecera 2025-07-04  1448   * zl3073x_dpll_pin_is_registrable - check if the pin is registrable
75a71ecc24125f9 Ivan Vecera 2025-07-04  1449   * @zldpll: pointer to zl3073x_dpll structure
75a71ecc24125f9 Ivan Vecera 2025-07-04  1450   * @dir: pin direction
75a71ecc24125f9 Ivan Vecera 2025-07-04  1451   * @index: pin index
75a71ecc24125f9 Ivan Vecera 2025-07-04  1452   *
75a71ecc24125f9 Ivan Vecera 2025-07-04  1453   * Checks if the given pin can be registered to given DPLL. For both
75a71ecc24125f9 Ivan Vecera 2025-07-04  1454   * directions the pin can be registered if it is enabled. In case of
75a71ecc24125f9 Ivan Vecera 2025-07-04  1455   * differential signal type only P-pin is reported as registrable.
75a71ecc24125f9 Ivan Vecera 2025-07-04  1456   * And additionally for the output pin, the pin can be registered only
75a71ecc24125f9 Ivan Vecera 2025-07-04  1457   * if it is connected to synthesizer that is driven by given DPLL.
75a71ecc24125f9 Ivan Vecera 2025-07-04  1458   *
75a71ecc24125f9 Ivan Vecera 2025-07-04  1459   * Return: true if the pin is registrable, false if not
75a71ecc24125f9 Ivan Vecera 2025-07-04  1460   */
75a71ecc24125f9 Ivan Vecera 2025-07-04  1461  static bool
75a71ecc24125f9 Ivan Vecera 2025-07-04  1462  zl3073x_dpll_pin_is_registrable(struct zl3073x_dpll *zldpll,
75a71ecc24125f9 Ivan Vecera 2025-07-04  1463  				enum dpll_pin_direction dir, u8 index)
75a71ecc24125f9 Ivan Vecera 2025-07-04  1464  {
75a71ecc24125f9 Ivan Vecera 2025-07-04  1465  	struct zl3073x_dev *zldev = zldpll->dev;
75a71ecc24125f9 Ivan Vecera 2025-07-04  1466  	bool is_diff, is_enabled;
75a71ecc24125f9 Ivan Vecera 2025-07-04  1467  	const char *name;
75a71ecc24125f9 Ivan Vecera 2025-07-04  1468  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1469  	if (dir == DPLL_PIN_DIRECTION_INPUT) {
b35db42141ccf2a Ivan Vecera 2025-11-10  1470  		u8 ref_id = zl3073x_input_pin_ref_get(index);
b35db42141ccf2a Ivan Vecera 2025-11-10  1471  		const struct zl3073x_ref *ref;
75a71ecc24125f9 Ivan Vecera 2025-07-04  1472  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1473  		/* Skip the pin if the DPLL is running in NCO mode */
75a71ecc24125f9 Ivan Vecera 2025-07-04  1474  		if (zldpll->refsel_mode == ZL_DPLL_MODE_REFSEL_MODE_NCO)
75a71ecc24125f9 Ivan Vecera 2025-07-04  1475  			return false;
75a71ecc24125f9 Ivan Vecera 2025-07-04  1476  
b35db42141ccf2a Ivan Vecera 2025-11-10  1477  		name = "REF";
b35db42141ccf2a Ivan Vecera 2025-11-10  1478  		ref = zl3073x_ref_state_get(zldev, ref_id);
b35db42141ccf2a Ivan Vecera 2025-11-10  1479  		is_diff = zl3073x_ref_is_diff(ref);
b35db42141ccf2a Ivan Vecera 2025-11-10  1480  		is_enabled = zl3073x_ref_is_enabled(ref);
75a71ecc24125f9 Ivan Vecera 2025-07-04  1481  	} else {
75a71ecc24125f9 Ivan Vecera 2025-07-04  1482  		/* Output P&N pair shares single HW output */
75a71ecc24125f9 Ivan Vecera 2025-07-04  1483  		u8 out = zl3073x_output_pin_out_get(index);
75a71ecc24125f9 Ivan Vecera 2025-07-04  1484  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1485  		/* Skip the pin if it is connected to different DPLL channel */
65b8e8e3bf41fda Ivan Vecera 2025-11-10  1486  		if (zl3073x_dev_out_dpll_get(zldev, out) != zldpll->id) {
75a71ecc24125f9 Ivan Vecera 2025-07-04  1487  			dev_dbg(zldev->dev,
75a71ecc24125f9 Ivan Vecera 2025-07-04 @1488  				"%s%u is driven by different DPLL\n", name,
75a71ecc24125f9 Ivan Vecera 2025-07-04  1489  				out);
75a71ecc24125f9 Ivan Vecera 2025-07-04  1490  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1491  			return false;
75a71ecc24125f9 Ivan Vecera 2025-07-04  1492  		}
75a71ecc24125f9 Ivan Vecera 2025-07-04  1493  
11e61915b41b996 Ivan Vecera 2025-11-10  1494  		name = "OUT";
65b8e8e3bf41fda Ivan Vecera 2025-11-10  1495  		is_diff = zl3073x_dev_out_is_diff(zldev, out);
65b8e8e3bf41fda Ivan Vecera 2025-11-10  1496  		is_enabled = zl3073x_dev_output_pin_is_enabled(zldev, index);
75a71ecc24125f9 Ivan Vecera 2025-07-04  1497  	}
75a71ecc24125f9 Ivan Vecera 2025-07-04  1498  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1499  	/* Skip N-pin if the corresponding input/output is differential */
75a71ecc24125f9 Ivan Vecera 2025-07-04  1500  	if (is_diff && zl3073x_is_n_pin(index)) {
75a71ecc24125f9 Ivan Vecera 2025-07-04  1501  		dev_dbg(zldev->dev, "%s%u is differential, skipping N-pin\n",
75a71ecc24125f9 Ivan Vecera 2025-07-04  1502  			name, index / 2);
75a71ecc24125f9 Ivan Vecera 2025-07-04  1503  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1504  		return false;
75a71ecc24125f9 Ivan Vecera 2025-07-04  1505  	}
75a71ecc24125f9 Ivan Vecera 2025-07-04  1506  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1507  	/* Skip the pin if it is disabled */
75a71ecc24125f9 Ivan Vecera 2025-07-04  1508  	if (!is_enabled) {
75a71ecc24125f9 Ivan Vecera 2025-07-04  1509  		dev_dbg(zldev->dev, "%s%u%c is disabled\n", name, index / 2,
75a71ecc24125f9 Ivan Vecera 2025-07-04  1510  			zl3073x_is_p_pin(index) ? 'P' : 'N');
75a71ecc24125f9 Ivan Vecera 2025-07-04  1511  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1512  		return false;
75a71ecc24125f9 Ivan Vecera 2025-07-04  1513  	}
75a71ecc24125f9 Ivan Vecera 2025-07-04  1514  
75a71ecc24125f9 Ivan Vecera 2025-07-04  1515  	return true;
75a71ecc24125f9 Ivan Vecera 2025-07-04  1516  }
75a71ecc24125f9 Ivan Vecera 2025-07-04  1517  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
