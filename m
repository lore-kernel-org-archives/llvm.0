Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A00318146;
	Wed,  5 Nov 2025 18:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762368719; cv=none; b=dNxbCbPS6kVooNdgkbUHjEFa6q2iIN0SA35jQ/pWF5hGE6JO3HkTgD20mZwR7r+vwJCiIBq+3kivVKjlcpylVNFQZKF72g08vo9D+uESMLl9kwxaklJ5LyiWnw0QNZlBUMdNqs7VwkB28Gf09riyMdQ6F1SdlbyF3t8JYyxoCtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762368719; c=relaxed/simple;
	bh=hD0/McD68PyBa+dj++HMH8vhSjmG0wLiAUBAv1ByDuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQ49Jii4btoPiZpOBlpvsIyXvOyaCrtCFsCNaoQGd7QpP0v+qlLkjPLK6p7hIr9tNlOGSixKW2nuCZQjffi/h+ACR1k4ytwLvH+u5EyEeaVJhitCZgp1xKAkRlZDK7t4lRWa4kZuCTYCYVub4Lz+pFof1NkAZ3ilPI41Cl9smdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m39aFON1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m39aFON1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762368717; x=1793904717;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hD0/McD68PyBa+dj++HMH8vhSjmG0wLiAUBAv1ByDuY=;
  b=m39aFON1X+QiDG+ZtULbXovDjYQAGpODNEHFevL2GiJpny8KeHX9RB5G
   03f77o+auNTHHCpOcAV6MYvcZO+jyenjdZNdG0BBGgOo+LiYh0gNsj56A
   egZcFJplEVRXE/LYsEX/rjpV5DjPv2u3U7+1S0h5v7s5L1hYcZjfdg7zM
   hVqASg4Q9XbYGM+w30T6GD5M9T6QFp4qohZipiUnaLRgMvMPYLy8xwDW7
   4OVe/+tS1kbEJ07TrEQS+sjUW9JH0XNcvm5kBANH/DGptC2OwkRB+TmKa
   byILeyPS9p22KX4Ak+Ef0A84gfdsZNS+MVuiP1RtcYJY9pOb9xD34G5uW
   g==;
X-CSE-ConnectionGUID: 0r6mEMIIRyu0EOHtnE2r3w==
X-CSE-MsgGUID: WwFZRNRGRDue/HtpSDituQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="82123139"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="82123139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 10:51:56 -0800
X-CSE-ConnectionGUID: XZFX++rnQSOGeCixIC6nmQ==
X-CSE-MsgGUID: PsVuI6AGTL6kp+L0JIj+DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="187200398"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.110.242]) ([10.125.110.242])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 10:51:55 -0800
Message-ID: <d3d1757a-20b1-49e4-90fe-8a1751c40c59@intel.com>
Date: Wed, 5 Nov 2025 11:51:54 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4 v5] cxl/core: Add helpers to detect Low Memory Holes
 on x86
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
 linux-cxl@vger.kernel.org, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Gregory Price <gourry@gourry.net>, Robert Richter <rrichter@amd.com>,
 Cheatham Benjamin <benjamin.cheatham@amd.com>
References: <20251006155836.791418-3-fabio.m.de.francesco@linux.intel.com>
 <202510102229.iFcGqbMH-lkp@intel.com> <2093111.UnXabflUDm@fdefranc-mobl3>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <2093111.UnXabflUDm@fdefranc-mobl3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/5/25 11:20 AM, Fabio M. De Francesco wrote:
> On Friday, October 10, 2025 4:49:01 PM Central European Standard Time kernel test robot wrote:
>> Hi Fabio,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on 46037455cbb748c5e85071c95f2244e81986eb58]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/cxl-core-Change-match_-_by_range-signatures/20251010-111627
>> base:   46037455cbb748c5e85071c95f2244e81986eb58
>> patch link:    https://lore.kernel.org/r/20251006155836.791418-3-fabio.m.de.francesco%40linux.intel.com
>> patch subject: [PATCH 2/4 v5] cxl/core: Add helpers to detect Low Memory Holes on x86
>> config: i386-randconfig-011-20251010 (https://download.01.org/0day-ci/archive/20251010/202510102229.iFcGqbMH-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510102229.iFcGqbMH-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202510102229.iFcGqbMH-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/cxl/core/platform_quirks.c:70:36: warning: result of comparison of constant 4294967296 with expression of type 'const resource_size_t' (aka 'const unsigned int') is always true [-Wtautological-constant-out-of-range-compare]
>>       70 |             res->end < r->end && res->end < (LMH_CFMWS_RANGE_START + SZ_4G) &&
>>          |                                  ~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    1 warning generated.
>>
> Unavoidable warning wherever res->end is an u32 variable:
> 
> /* include/linux/types.h */
> 
> #ifdef CONFIG_PHYS_ADDR_T_64BIT
> typedef u64 phys_addr_t;
> #else
> typedef u32 phys_addr_t;
> #endif
> 
> typedef phys_addr_t resource_size_t;
> 
> /* include/linux/ioport.h */
> 
> struct resource {
> 	resource_size_t start;
> 	resource_size_t end;
> };
> 
> I think we should ignore this report.

Maybe try casting res->end to (u64) and see if it shuts the warning up?

DJ

> 
> Fabio
>>
>> vim +70 drivers/cxl/core/platform_quirks.c
>>
>>     50	
>>     51	/**
>>     52	 * platform_region_matches_cxld() - Platform quirk to match a CXL Region and a
>>     53	 * Switch or Endpoint Decoder. It allows matching on platforms with LMH's.
>>     54	 * @p: Region Params against which @cxled is matched.
>>     55	 * @cxld: Switch or Endpoint Decoder to be tested for matching @p.
>>     56	 *
>>     57	 * Similar to platform_cxlrd_matches_cxled(), it matches regions and
>>     58	 * decoders on platforms with LMH's.
>>     59	 *
>>     60	 * Return: true if a Decoder matches a Region, else false.
>>     61	 */
>>     62	bool platform_region_matches_cxld(const struct cxl_region_params *p,
>>     63					  const struct cxl_decoder *cxld)
>>     64	{
>>     65		const struct range *r = &cxld->hpa_range;
>>     66		const struct resource *res = p->res;
>>     67		int align = cxld->interleave_ways * SZ_256M;
>>     68	
>>     69		if (res->start == LMH_CFMWS_RANGE_START && res->start == r->start &&
>>   > 70		    res->end < r->end && res->end < (LMH_CFMWS_RANGE_START + SZ_4G) &&
>>     71		    IS_ALIGNED(range_len(r), align))
>>     72			return true;
>>     73	
>>     74		return false;
>>     75	}
>>     76	
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>>
>>
> 
> 
> 
> 

