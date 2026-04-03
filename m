Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405662D0C9C;
	Fri,  3 Apr 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205602; cv=none; b=NO01YBXGk0vV3V1AeMRtS8QKMGUUGlvknZzNcteyANc7HdNgYd+6yooRHWW/sjK3ZN09PHHgMJkFFM3bwJ/o3/StZ4z3S9SUfsfrKxLHJ92vdcWWw2MH9GlTLz0VRTaUV8MW0URB1e9EvveEYn47/nI8ZPNd5ZwEHW+VgWpLibE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205602; c=relaxed/simple;
	bh=W6AAC1cFGrVaftZaq2zuawySYDraS9aSNOJr+kIsTgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ocwl9JOEmOjFO3yx/Z8QW18u1vTIyoBO0adOMPv0pD/nGlKJ27+nS1WIXgJ0WV1klaif0cgueof/FMtbn9aDJDxe2We6MRbu9xzq5TfnSfcF7fk5ovbT3Did4FUPQDWoEK4SA8k6WWx8gZbaasqWXJ1WYbfR8oy8qCW9biuD43o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zi3AlIWD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zi3AlIWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205602; x=1806741602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=W6AAC1cFGrVaftZaq2zuawySYDraS9aSNOJr+kIsTgY=;
  b=Zi3AlIWD3wOa/pECFl5CD9u6WFEDc6GewF2BCTBw1MyxpX62n99zr1A7
   lTNroSTdDFzQHLD4cF4xBd2lCgNbtNBsWswu41JUebNesxvxCIB0wm8/w
   W7dV2qLY+gsBwSnFM8R6aDWVux8VbpX2kubLZid6B6UEWBTz+R/CK9o2M
   pVRQQ0vHWw9SqffZP68xAmqetI+bg6XsOeQ1eSxVcLLV/w1ACUHiqkaA3
   wXS20+wfBuOe6sIUIu1blpYXLHF5CGXiTUnPIAZ9K6A8Ka8sEdXDOHer+
   ZDolNF4C1KaR4nkSODDEg29Wxzh21Av8d08ovit/bfMvcjDhZ8NlR19Du
   g==;
X-CSE-ConnectionGUID: FnVBTTA9QhCi3Lb8iFXBuA==
X-CSE-MsgGUID: CRgyDY94TuqvZ/PCTS+WIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76153056"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76153056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:39:59 -0700
X-CSE-ConnectionGUID: O1ijKYzWRyyhp/jUp/q4aw==
X-CSE-MsgGUID: AmcFNb/UTg+SshydyO7axw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="257678123"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Apr 2026 01:39:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a4H-0000000011X-3GiD;
	Fri, 03 Apr 2026 08:39:53 +0000
Date: Fri, 3 Apr 2026 16:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jani Nikula <jani.nikula@linux.intel.com>,
	=?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH v1 08/16] drm/i915/bios: support VS/PE Override per each
 ddi port
Message-ID: <202604021026.aZi3LxDW-lkp@intel.com>
References: <20260331183332.1773886-9-michal.grzelak@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331183332.1773886-9-michal.grzelak@intel.com>

Hi Michał,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next]
[also build test ERROR on drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc6 next-20260331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Grzelak/drm-i915-lt-align-xe3plpd-with-VS-PE-Override-layout/20260401-092928
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260331183332.1773886-9-michal.grzelak%40intel.com
patch subject: [PATCH v1 08/16] drm/i915/bios: support VS/PE Override per each ddi port
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260402/202604021026.aZi3LxDW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021026.aZi3LxDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021026.aZi3LxDW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_bios.c:2767:34: error: cast to union type from type 'int' not present in union
    2767 |         devdata->vswing_preemph.index = (union ddi_vswing_preemph_index) -1;
         |                                         ^                                ~~
   drivers/gpu/drm/i915/display/intel_bios.c:3178:4: error: cast to union type from type 'int' not present in union
    3178 |                         (union ddi_vswing_preemph_index) -1;
         |                         ^                                ~~
   2 errors generated.


vim +/int +2767 drivers/gpu/drm/i915/display/intel_bios.c

  2761	
  2762	static void override_vswing_preemph(struct intel_bios_encoder_data *devdata)
  2763	{
  2764		struct intel_ddi_buf_trans *buf_trans;
  2765	
  2766		devdata->vswing_preemph.buf_trans = NULL;
> 2767		devdata->vswing_preemph.index = (union ddi_vswing_preemph_index) -1;
  2768	
  2769		if (!intel_bios_encoder_overrides_vswing(devdata))
  2770			return;
  2771	
  2772		buf_trans = kzalloc(sizeof(*buf_trans), GFP_KERNEL);
  2773		devdata->vswing_preemph.buf_trans = buf_trans;
  2774	}
  2775	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
