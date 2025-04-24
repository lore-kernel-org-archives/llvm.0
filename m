Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA3F502BE
	for <llvm@lists.linux.dev>; Thu, 24 Apr 2025 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745515361; cv=none; b=XVJEZgBMsIj6AtV152Ir7qJD6JuMLK1iiBnK0Sa1qQFuVHpQ8Pmw5dVT+ygOjfx+my1uQheJONoO8aNyvbdPSzCDgajY2nA4xqhvs1ngUlq5o3QpH/8O3aYp96PdkA8+6XTmsYoYT2I6uO/54VRtMsUcQ1JaEdagHemx61I3Vhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745515361; c=relaxed/simple;
	bh=5mUMu6rbhZGdHK9UQ3fq199ViRrbpnMG+Pe7EeSBYHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qViDiOwSj9GlCJXzGGG+V7mW/bZyix1E6UvGbPBkUlahYAn0T+NUm4Yjy1jmXl/dAc6CFp5p977QOvRsfAHZHYdfML59iyHCfF0l/Fuyln7yx77DhMyqLtovYaY4VCgXJKp68PNm9hNnl2TI3Y1jIBHkVNEKL51cP28uR06LZ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdhFuXCb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdhFuXCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745515359; x=1777051359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5mUMu6rbhZGdHK9UQ3fq199ViRrbpnMG+Pe7EeSBYHk=;
  b=CdhFuXCbR2767AEtdwbQyhApUyefreDBlA7ZBiyirOn/JOBcSXlA7Mgr
   0zv5jpmmZdx0pPtZkYSYblpiuHw3MD3Vu7c/JQewV8IKd9vhBUeF73zHU
   U5D2qMSf1Y9dU5BelSJDwC5EDmEVMM5mk0Iymawa4IG+fkqn7KBKbXp0k
   bIu27XuoW/G4Gca3Zci1ll7xFpXqM1V47ug4YP8bciGIXtxbaGaJhHNVt
   oHDTZG40YwKFkuSNMltAUkjyxlc0inal6+eGd9awcrKKRVVF9BmAyo78Q
   WNTh/hSPkaKhNuqViQuyL/m2oLMLy89sPACvAgiabmEfNehoFR1Eb5C9z
   A==;
X-CSE-ConnectionGUID: JIarjDw6SDyMEir8nyrvng==
X-CSE-MsgGUID: TbVHeDOOTluEcaOm1/U6+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47337798"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="47337798"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 10:22:38 -0700
X-CSE-ConnectionGUID: tD2Gso2KSRuNHJoaLB2hYg==
X-CSE-MsgGUID: LaysRMefQBqWQKcbLmi1ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132553866"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 10:22:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u80HP-000000003Ju-1XjY;
	Thu, 24 Apr 2025 20:22:31 +0300
Date: Thu, 24 Apr 2025 20:22:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH v1 1/1] mm, slab: fold need_slab_obj_ext() into its only
 user
Message-ID: <aApzV7Xaq7akuo6m@smile.fi.intel.com>
References: <20250424164800.2658961-1-andriy.shevchenko@linux.intel.com>
 <691b0ba9-7587-4663-8aa3-8ce63ef509c6@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <691b0ba9-7587-4663-8aa3-8ce63ef509c6@suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 24, 2025 at 07:15:00PM +0200, Vlastimil Babka wrote:
> On 4/24/25 18:48, Andy Shevchenko wrote:
> > need_slab_obj_ext() is used only in one place, fold it into there.
> > Without that, clang can't build kernel with `make W=1` when
> > CONFIG_WERROR=y, which is default in the x86 configurations.
> 
> Note that gcc doesn't warn on this even with W=1.
> 
> Is really clang + W=1 + CONFIG_WERROR building ok these days except this one
> unused function?

Almost, I'm working towards having it clean on x86 defconfigs that are in the
Linux kernel. There are only few left to address. GCC, FWIW, complains on bunch
of other things :-)

> > mm/slub.c:2079:20: error: unused function 'need_slab_obj_ext' [-Werror,-Wunused-function]
> > 
> > To solve this, fold need_slab_obj_ext() into its only user.
> > 
> > Fixes: e33b7ae3d802 ("mm, slab: clean up slab->obj_exts always")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks, I've folded the fix in.

Thank you!

-- 
With Best Regards,
Andy Shevchenko


