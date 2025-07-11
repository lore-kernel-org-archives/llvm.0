Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E81B625
	for <llvm@lists.linux.dev>; Fri, 11 Jul 2025 05:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752212100; cv=none; b=axqITkZS6R15JsSs9EkOW6phSC5/9q/LaTwTEDOt4YLqaxRBjrGbenZLgsWPdQwQQSQi0XYurQYztP5dgTXpVkFgqNEgAAcJ/I4MCcn+DcBwOszOiRPDGuIsN4LPOf1qRWqESYCorCg9mPEzi7q3WZwV0z5BibfSjjz4aoZgYqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752212100; c=relaxed/simple;
	bh=Rkkzr1JNQrtqP/eOaaEnhMbpJc2uhM/lz5zcM3e8+QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKGaBFPcmeNnDhs2d5krOq5Z0AXjCS3eJkiY1B8azUzUoMYqU4/9ubhM39HkVfG9kMp0CkY11yOUnNfYWsaMUo4sN0+Wt7Ng+inSiOYFPV1nKAjCnNcaE9efxXURrznz6kAocjH0s1+5kljQ5b9v42qORnICe0ktaX41n4ZwJYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMVO5yoL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMVO5yoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752212099; x=1783748099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rkkzr1JNQrtqP/eOaaEnhMbpJc2uhM/lz5zcM3e8+QY=;
  b=lMVO5yoLf469lF1GLRsqSWEy+C0RFy1iqzBKHHOIpxWtxpQTvzqQ5DeS
   tb4sy+DRr/sBKxwv8OvTThVtNPTvAMBaqvoIzsc/guEk1BcxDeLFgpPLs
   aO9vGhZibWBZJo6XXTrh38cC4d7stYclm5wcEM+IBW/oyrVonA2rl0+by
   qnYMa3nUf/kmOC4Vb+AtKZ35zL3SW9AKe5ERzLGCTsmXIQPHfOahL6BPd
   eQkBnVTgXmMWtua8C4FwniZSAxMmkOLuLwSQY24s45WfrZVbmRy06T4C3
   QHIF5RfjRBTxT0VpQHNDjNn0tcJtNFqoN7kMklurHSxFEBNBYoXwJ34GA
   w==;
X-CSE-ConnectionGUID: Dn1SRcKORvyk4b+O5EIH1w==
X-CSE-MsgGUID: EDTJ49J4QkGU3NGLsN9ukA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54359795"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="54359795"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 22:34:58 -0700
X-CSE-ConnectionGUID: xYIRpqcUTqaPjOqFVZetgw==
X-CSE-MsgGUID: sksYXizAT/uZGtntblvMhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="155693108"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 22:34:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ua6PL-0000000EQT6-2CVV;
	Fri, 11 Jul 2025 08:34:51 +0300
Date: Fri, 11 Jul 2025 08:34:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2 1/1] mm/hmm: Move pmd_to_hmm_pfn_flags() to the
 respective #ifdeffery
Message-ID: <aHCie4QH9fUznga1@smile.fi.intel.com>
References: <20250710082403.664093-1-andriy.shevchenko@linux.intel.com>
 <wcaeymjmxwdm6gwlpwyklgq4hqzj4bheml3pe7ri7mc7jbjf7n@yjtixgld2ojm>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wcaeymjmxwdm6gwlpwyklgq4hqzj4bheml3pe7ri7mc7jbjf7n@yjtixgld2ojm>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 11, 2025 at 09:35:49AM +1000, Alistair Popple wrote:
> Shouldn't the Fixes tag be for the commit that introduced the #ifdeffery in the
> first place? Ie: 992de9a8b751 ("mm/hmm: allow to mirror vma of a file on a DAX
> backed filesystem")

Looks indeed better, I was lost in the maze of the history of mm/hmm.c changes.

Fixes: 992de9a8b751 ("mm/hmm: allow to mirror vma of a file on a DAX backed filesystem")

The problem is that backporting to that, if needed, requires a bit of adaptation.
Nevertheless, I added it above, and we actually can have two Fixes tags to make
backporting easier for those (we don't have LTS kernels older that the second
commit anyway),

Andrew, can you add the above tag as well?

> As far as I can tell that is what would have introduced the warning. Other than
> that it looks good though so feel free to add:
> 
> Reviewed-by: Alistair Popple <apopple@nvidia.com>

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko


