Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395EA14659C;
	Tue, 30 Jul 2024 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722309085; cv=none; b=aGSQ9JOk1qMSlktNayxxpavRmxjMryuTr1E+CxP/ZszfHcekJigQDv/Cry4e1j6alN7ZCBvU/QYKQ103LO6k7nQNdSFgsDMFn0wrkM98RQzNvHU7tpnKRj98YqI1mZGkHxJukKpViVCqr/y9YFS3anwIsdBtyBvEfJIFwlHunh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722309085; c=relaxed/simple;
	bh=yWuPHpd5wzMhwNUcpnURixCcHhTrI6bkp3+P6v7Ehgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhzSj58UwE5oeIC4qD7Ikd0/dceJfkH3i+o2axe1wVPH04gLfbiszsmkvHP8CLYNt/Hg/FdafO5Lc7mrqcRCOwqelN25DORxywNcite8aJ4vGws9SXq/ViAzczxEK6AseseXUM4GnkDbABTVrV+Vm+4nqvGf9BJu7THiL6MJc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6whQ4QR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6whQ4QR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722309084; x=1753845084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yWuPHpd5wzMhwNUcpnURixCcHhTrI6bkp3+P6v7Ehgc=;
  b=H6whQ4QRf6JcY8kohBqMiqEosHDfqTJIeo87rUxvnuA46FMgnWMJHKSj
   xIs6GdB6u0I231XFrnS9YXRdUKaq1wPMCaYEHbO9qJ44rB0OgtbOeH4+9
   XbB5J6k0Ng0TQRdfK+N3hkZeyWIKowAD0kB3n2n8dBZBndLB5+dDead6g
   mZtpvyl6TcnIcCbqJPYXMMqhKN5DwH8N6NhFgw9TWCHdMI67WfuXmfbxQ
   +N/cCeu+4IqIUr2MJKUdV/Q0+HzLFdaYY7AdAl1Bhf6m/RiksVLHoJqqy
   guzV+dYdeBavdDs5Ga+kYW24A3WLCz973hwfPunt1bQGID//43Cw6/STh
   A==;
X-CSE-ConnectionGUID: YP7VhgEURB6GEezjyxWHoQ==
X-CSE-MsgGUID: E7xpalDcQQ6BNyux5PYjGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20050017"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20050017"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 20:11:23 -0700
X-CSE-ConnectionGUID: ENmaCYy5T1OsMD3tYIK+Bg==
X-CSE-MsgGUID: DLWVxsHaR6S+zwNdVSyfWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54152975"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jul 2024 20:11:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYdGe-000sPQ-0I;
	Tue, 30 Jul 2024 03:11:16 +0000
Date: Tue, 30 Jul 2024 11:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v1 32/36] soc: fsl: qe: Add resource-managed muram
 allocators
Message-ID: <202407301032.M27FlsV4-lkp@intel.com>
References: <20240729142107.104574-33-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729142107.104574-33-herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.11-rc1 next-20240729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/soc-fsl-cpm1-qmc-Update-TRNSYNC-only-in-transparent-mode/20240730-001631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240729142107.104574-33-herve.codina%40bootlin.com
patch subject: [PATCH v1 32/36] soc: fsl: qe: Add resource-managed muram allocators
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240730/202407301032.M27FlsV4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301032.M27FlsV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301032.M27FlsV4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/fsl/qe/qe_common.c:217:7: error: call to undeclared function 'devres_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     217 |         dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
         |              ^
   drivers/soc/fsl/qe/qe_common.c:217:7: note: did you mean 'msrs_alloc'?
   arch/x86/include/asm/msr.h:328:22: note: 'msrs_alloc' declared here
     328 | struct msr __percpu *msrs_alloc(void);
         |                      ^
>> drivers/soc/fsl/qe/qe_common.c:217:5: error: incompatible integer to pointer conversion assigning to 's32 *' (aka 'int *') from 'int' [-Wint-conversion]
     217 |         dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/fsl/qe/qe_common.c:224:3: error: call to undeclared function 'devres_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     224 |                 devres_add(dev, dr);
         |                 ^
>> drivers/soc/fsl/qe/qe_common.c:226:3: error: call to undeclared function 'devres_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     226 |                 devres_free(dr);
         |                 ^
   drivers/soc/fsl/qe/qe_common.c:277:7: error: call to undeclared function 'devres_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     277 |         dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
         |              ^
   drivers/soc/fsl/qe/qe_common.c:277:5: error: incompatible integer to pointer conversion assigning to 's32 *' (aka 'int *') from 'int' [-Wint-conversion]
     277 |         dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/fsl/qe/qe_common.c:284:3: error: call to undeclared function 'devres_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |                 devres_add(dev, dr);
         |                 ^
   drivers/soc/fsl/qe/qe_common.c:286:3: error: call to undeclared function 'devres_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     286 |                 devres_free(dr);
         |                 ^
   8 errors generated.


vim +/devres_alloc +217 drivers/soc/fsl/qe/qe_common.c

   196	
   197	/**
   198	 * devm_cpm_muram_alloc - Resource-managed cpm_muram_alloc
   199	 * @dev: Device to allocate memory for
   200	 * @size: number of bytes to allocate
   201	 * @align: requested alignment, in bytes
   202	 *
   203	 * This function returns a non-negative offset into the muram area, or
   204	 * a negative errno on failure as cpm_muram_alloc() does.
   205	 * Use cpm_muram_addr() to get the virtual address of the area.
   206	 *
   207	 * Compare against cpm_muram_alloc(), the memory allocated by this
   208	 * resource-managed version is automatically freed on driver detach and so,
   209	 * cpm_muram_free() must not be called to release the allocated memory.
   210	 */
   211	s32 devm_cpm_muram_alloc(struct device *dev, unsigned long size,
   212				 unsigned long align)
   213	{
   214		s32 info;
   215		s32 *dr;
   216	
 > 217		dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
   218		if (!dr)
   219			return -ENOMEM;
   220	
   221		info = cpm_muram_alloc(size, align);
   222		if (info >= 0) {
   223			*dr = info;
 > 224			devres_add(dev, dr);
   225		} else {
 > 226			devres_free(dr);
   227		}
   228	
   229		return info;
   230	}
   231	EXPORT_SYMBOL(devm_cpm_muram_alloc);
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
