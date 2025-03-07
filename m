Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5046F16F282;
	Fri,  7 Mar 2025 02:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741313804; cv=none; b=VIZ9dc/eQDCaC1j7xN6ISuvdnFhjbzAgZQxw7KV4fr8w70QTUcrAdDdPiCv0fT5E6y7NfRN+g4+LWOnce0ae39jTFx99odHjz8PJCJ5NjvOFJTfYfKEfNPPyRnRBpSXRe3S05YL4OhgURMeUyTn0QXLrMy8xpkB91x5aMcB13RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741313804; c=relaxed/simple;
	bh=gu+QJDY2pWWTuEG0rRShXMEZDI3edprwca9TzGQuaVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEDGlCwrjn01eD9e9NsBEGGUSfVVT6fwE6wMN8IulMFr1WCANRGo/mNOPbYPAp2gH7n9xKEb94OTUI7g0nE2lt08CALZ81aakUYf/koNQhEZearE5QSjU6oiO0XdwT7szgBPDcIgMXzNUdFlBICo4PqAOc9y2runt59LrVDUbyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDHpK9U1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDHpK9U1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741313802; x=1772849802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gu+QJDY2pWWTuEG0rRShXMEZDI3edprwca9TzGQuaVM=;
  b=VDHpK9U1az6KpjKHHPKuJNEmh2YeXkgQd/lOeMry1zkF/lM7TH2ne6wx
   ayMMXwsP/7JWUolcTc7dESh8Q4pn6uAvOhwZGIoanlqNWbQFN/BG1hd5t
   QlC4bx6LgG25pKDcYxOS3WoQVPPEf68wN3lorKQRCqqECpjOnqaM0L4Nt
   5PRqQVHQuA9bBr/l/x+D+OKXRxFX+f3mnBzbtGHG14CYuFFpiPwTVjgcQ
   vle0oNj5YQwLE6rn2y/gUqymAfSLnEuwTGYo5MbpJjVnbClEl9rv7Ub23
   1u/0pf1r9ySWBjwjuOKSwTrDtKgf/R7mfUnSlXFI5ScmzS1YQpJVsvwlU
   A==;
X-CSE-ConnectionGUID: DVhSghfhR72ce/B6+oq+dA==
X-CSE-MsgGUID: g6qAzT1aTMi6ZEh41YZcvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41603431"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="41603431"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 18:16:40 -0800
X-CSE-ConnectionGUID: BKAsNCMCR/SeluRiWgeLdg==
X-CSE-MsgGUID: LIBcbshXSMu1pzoolUAAKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119715703"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2025 18:16:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqNGP-000Nw4-0F;
	Fri, 07 Mar 2025 02:16:37 +0000
Date: Fri, 7 Mar 2025 10:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: alison.schofield@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] cxl/region: Translate DPA->HPA in unaligned MOD3
 regions
Message-ID: <202503070931.7aNcyFaJ-lkp@intel.com>
References: <20250306194328.2600429-1-alison.schofield@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306194328.2600429-1-alison.schofield@intel.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 26600bf10173beda5358d194ec425a1cfafa2fe2]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-schofield-intel-com/cxl-region-Translate-DPA-HPA-in-unaligned-MOD3-regions/20250307-034424
base:   26600bf10173beda5358d194ec425a1cfafa2fe2
patch link:    https://lore.kernel.org/r/20250306194328.2600429-1-alison.schofield%40intel.com
patch subject: [RFC PATCH] cxl/region: Translate DPA->HPA in unaligned MOD3 regions
config: arm-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503070931.7aNcyFaJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070931.7aNcyFaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070931.7aNcyFaJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/region.c:2976:3: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
    2975 |         dev_dbg(&cxld->dev, "fail dpa:%#llx start:%#llx pos:%d\n", dpa,
         |                                                   ~~~~~
         |                                                   %#x
    2976 |                 p->res->start, pos);
         |                 ^~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   1 warning generated.


vim +2976 drivers/cxl/core/region.c

  2932	
  2933	/*
  2934	 * unaligned_dpa_to_hpa() translates a DPA to HPA when the region resource
  2935	 * start address is not a multiple of the Host Bridge interleave ways.
  2936	 *
  2937	 * Unaligned address translation is only supported for regions built upon
  2938	 * 3-way HB interleaves, 1+1+1 2+2+2 4+4+4+4, and will fail on any other
  2939	 * unaligned regions. ie. if a 4-way region appears with an unaligned start
  2940	 * address it fails at the decode_pos().
  2941	 */
  2942	static u64 unaligned_dpa_to_hpa(struct cxl_decoder *cxld,
  2943					struct cxl_region_params *p, int pos, u64 dpa)
  2944	{
  2945		int ways_port = p->interleave_ways / cxld->interleave_ways;
  2946		int gran_port = p->interleave_granularity;
  2947		int gran_hb = cxld->interleave_granularity;
  2948		int ways_hb = cxld->interleave_ways;
  2949		u64 hpa, hpa_port = 0;
  2950		int pos_port, pos_hb;
  2951	
  2952		/* Decode an endpoint 'pos' into port and host-bridge components */
  2953		if (decode_pos(p->interleave_ways, pos, &pos_port, &pos_hb)) {
  2954			dev_dbg(&cxld->dev, "not supported for region ways:%d\n",
  2955				p->interleave_ways);
  2956			return ULLONG_MAX;
  2957		}
  2958		/* Restore the port parent address if needed */
  2959		/* This could also be 'if (region ways > 3)' for this limited soln */
  2960		if (gran_hb != gran_port)
  2961			hpa_port = restore_parent(dpa, pos_port, gran_port, ways_port);
  2962	
  2963		/*
  2964		 * Complete the HPA reconstruction by restoring the address as if
  2965		 * each HB position is a candidate. Test against expected pos_hb
  2966		 * to confirm match.
  2967		 */
  2968		for (int index = 0; index < ways_hb; index++) {
  2969			hpa = restore_parent(hpa_port, index, gran_hb, ways_hb);
  2970			hpa += p->res->start;
  2971			if ((hpa / gran_hb) % ways_hb == pos_hb)
  2972				return hpa;
  2973		}
  2974	
  2975		dev_dbg(&cxld->dev, "fail dpa:%#llx start:%#llx pos:%d\n", dpa,
> 2976			p->res->start, pos);
  2977		dev_dbg(&cxld->dev, "     port-w/g/p:%d/%d/%d hb-w/g/p:%d/%d/%d\n",
  2978			ways_port, gran_port, pos_port, ways_hb, gran_hb, pos_hb);
  2979	
  2980		return ULLONG_MAX;
  2981	}
  2982	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
