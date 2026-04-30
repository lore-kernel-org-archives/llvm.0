Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E91D2F9D98;
	Thu, 30 Apr 2026 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562792; cv=none; b=ISrniqMkcEux3v5lvbkRBaoAttSLTZ+qT8uUW+d/BoKmjvndJ+cLZkmsF7YJSXhpXGHtwzoJMWqdHedEspKaq6DuiNLq7n9zeecZSk14wesTJlJoUZD4YfagOmdqTUcXB5mk5BN6lOYakDPvrgbmg/XmXdUduzYcPMjNW2SDsxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562792; c=relaxed/simple;
	bh=jrMLhTOFazqSf/nfKlZBcGdopmTfk+jWZBTd7xfe2u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUIVQAueNMHvgRY9J5EDv65LK7Z9vxb/G+xy40psLChGqFnTIwwIYYjNA7txa9eMfkMnWMwGlfmv4zfEN0RzpDDRasPiva8HElPX6Wsfpt3gvl6NQpDrLQ5tdUh7QkgV9/l488xFk6BiozkBZ8uv8AmmiFXLBtdZOdBfybRDxUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/hv93UY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/hv93UY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777562790; x=1809098790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jrMLhTOFazqSf/nfKlZBcGdopmTfk+jWZBTd7xfe2u4=;
  b=k/hv93UYYApgX+Ra6jJkDQ6J6dUCZE4Ane2CYptERqV4u0eOLPMxfg24
   mynJErhV/lacdheUj1V6SX7RGZWJWA1BRvyTHSt7ezeqahJKlKODlHkFL
   MDdEkx8TrxtWohKeku/hjSGFm5P898laSyU0XZ42Mksa8SqO/WlI1j2ti
   HA6+JufdbSzuLG8z6VlEiLK7ILOfxYpnU6V0nxw/IudDHCdW6GCvGqaz8
   UP+vcQtZI8AfqWexXDyvyvit+OAsyIMwSURX2AMy58HKMi5z/zybzLVSw
   UfllbJ49E87vGN8CwZ4gnJRIrsBwPVLlHgio2pebdP+YSjDFpQtoOE27r
   A==;
X-CSE-ConnectionGUID: dT/OUDILSqC179IOxl5TYg==
X-CSE-MsgGUID: CkysEIltQi6iTlkhmDmc0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82122328"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="82122328"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 08:24:39 -0700
X-CSE-ConnectionGUID: Eik7u7RfRH6c6Mk4x3XHBw==
X-CSE-MsgGUID: BRvchASGQ5il6tA77o+T7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234500215"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2026 08:24:36 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wITFh-00000000CWK-210q;
	Thu, 30 Apr 2026 15:24:33 +0000
Date: Thu, 30 Apr 2026 23:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	atish.patra@linux.dev, anup@brainfault.org, will@kernel.org,
	palmer@dabbelt.com, pjw@kernel.org, cuiyunhui@bytedance.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	yuanzhu@bytedance.com,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: Re: [PATCH] drivers/perf: riscv: do not restart throttled events
 after overflow
Message-ID: <202604302308.Wa7Tg3es-lkp@intel.com>
References: <20260415032017.10712-1-zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415032017.10712-1-zhangzhanpeng.jasper@bytedance.com>

Hi Zhanpeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhanpeng-Zhang/drivers-perf-riscv-do-not-restart-throttled-events-after-overflow/20260416-205442
base:   linus/master
patch link:    https://lore.kernel.org/r/20260415032017.10712-1-zhangzhanpeng.jasper%40bytedance.com
patch subject: [PATCH] drivers/perf: riscv: do not restart throttled events after overflow
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260430/202604302308.Wa7Tg3es-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302308.Wa7Tg3es-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302308.Wa7Tg3es-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/riscv_pmu_sbi.c:65:33: error: use of undeclared identifier 'MAX_INTERRUPTS'
      65 |         return event->hw.interrupts == MAX_INTERRUPTS;
         |                                        ^~~~~~~~~~~~~~
   1 error generated.


vim +/MAX_INTERRUPTS +65 drivers/perf/riscv_pmu_sbi.c

    61	
    62	PMU_FORMAT_ATTR(event, "config:0-55");
    63	static inline bool rvpmu_perf_event_is_throttled(struct perf_event *event)
    64	{
  > 65		return event->hw.interrupts == MAX_INTERRUPTS;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
