Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284CB377EAF;
	Tue,  6 Oct 2026 05:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791263457; cv=none; b=GlGjk0iBbPrZXbs9d/Z7f9OJ3J/D6LHEV2u0WVAO8EAzJLdYzOAmNcJLQxqFBMHddCcey4yHnjNzlb/EnteIaRdKFl+uWo3lroCqmTKcBObjUQ6PEmVHq7DE9N+Jbw8x68hnRZgZ3xMwoBHCQ419dFoA21wrFRt/Wglck8SOY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791263457; c=relaxed/simple;
	bh=gMzRaq3DDfNLKdRRoGwGMBdwUs1hP7ONJIUqEWtCFpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azaBpcI1utTKECRHUgMNcK4kogdUxdghZ4BACihQW4hhZ+tgZ0R9zquwKAWCXBepjnbNwTgZcdAHhdYCTK8PBLg0DGUeqPGYcIsGZrcwxPz3YvWoToEHjoQpywweXixtuGvWRXexm3szbwWaKI90CT00BS6hZB7MQPF7e9jzr98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHvSQazN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHvSQazN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791263455; x=1822799455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMzRaq3DDfNLKdRRoGwGMBdwUs1hP7ONJIUqEWtCFpU=;
  b=bHvSQazNV+1Gtmta13IwaFU/Dl9dRQb2oeGX8O+VRtBom1GVFjvrl2gn
   7kprxJARWET7QBTzn+HkgjFkTByLNM7PPSsAeJLDzkJQyd1U3nCxCY+r2
   /05TBMjI8x6NsaEMjhXC9G7lY2BvQY/OXbm8xEN3TF5/EdL8r0chxUnw6
   GkKHBiWQENj+eBf5WmaimrIty7/kIXl2KCN47YrJY1HiUoCVqndhmYnGO
   Qylcmgqc7b+lYfe6G5tryc4yIOwTRafTzZRaq9ScoBRmbE1M6Ju3gphID
   HQsSEoKPxqo59faQyVdmPnB94Y2T2N5OAOR8b4wRu0wdFDhCJrfQXf7Je
   Q==;
X-CSE-ConnectionGUID: VJRjdWDDQpOk2DWM/WtMTQ==
X-CSE-MsgGUID: 6w6lFHvzTXG2P3fuFXSRaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102461420"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102461420"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 22:10:55 -0700
X-CSE-ConnectionGUID: TymkvGTZT7aRvlsDydv3Pg==
X-CSE-MsgGUID: O2fiyGz8RdCO8RmoZxmP3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276551934"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Oct 2026 22:10:52 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDxRx-000000001BQ-1ziK;
	Tue, 06 Oct 2026 05:10:49 +0000
Date: Tue, 6 Oct 2026 13:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: Habil Eren =?iso-8859-1?Q?T=FCrker?= <habilerenturker@hotmail.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Habil Eren =?iso-8859-1?Q?T=FCrker?= <habilerenturker@hotmail.com>
Subject: Re: [PATCH v2 2/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() in x86_fwspec_is_hpet()
Message-ID: <202610061356.8VHVO1CY-lkp@intel.com>
References: <20261005163213.6515-3-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005163213.6515-3-habilerenturker@hotmail.com>

Hi Habil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on linus/master v7.3-rc6 next-20261005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Habil-Eren-T-rker/x86-apic-Replace-deprecated-simple_strtol-with-sscanf-for-robust-parsing/20261005-163219
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20261005163213.6515-3-habilerenturker%40hotmail.com
patch subject: [PATCH v2 2/2] x86/apic: Replace deprecated simple_strtol() with sscanf() in x86_fwspec_is_hpet()
config: x86_64-buildonly-randconfig-1003-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061356.8VHVO1CY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061356.8VHVO1CY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061356.8VHVO1CY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/apic/vector.c:700:10: warning: comparison between pointer and integer ('unsigned int' and 'u32 *' (aka 'unsigned int *')) [-Wpointer-integer-compare]
     700 |             val == fwspec->param)
         |             ~~~ ^  ~~~~~~~~~~~~~
   1 warning generated.


vim +700 arch/x86/kernel/apic/vector.c

   685	
   686	int x86_fwspec_is_hpet(struct irq_fwspec *fwspec)
   687	{
   688		const char *fwname;
   689		unsigned int val;
   690	
   691		if (fwspec->param_count != 1)
   692			return 0;
   693	
   694		if (!is_fwnode_irqchip(fwspec->fwnode))
   695			return 0;
   696	
   697		fwname = fwnode_get_name(fwspec->fwnode);
   698	
   699		if (fwname && sscanf(fwname, "HPET-MSI-%u", &val) == 1 &&
 > 700		    val == fwspec->param)
   701			return 1;
   702	
   703		return 0;
   704	}
   705	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
