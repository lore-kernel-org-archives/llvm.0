Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6512737F3
	for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566092; cv=none; b=rIAIicCsdZPK0I1bQAnvx69OWIJmylV9v7OfYFDcINOopFRj8knjKFcM4/bnENTN7DK0XDTzQqQnBTTZA66zhYaeNPRO5gM+dTQkIUmSCCDhmoKvZH7mncI8qNBh9kvsOp5fCslMiHjl1B+Qawpkcz0RxTKIFN1n119QAqCICA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566092; c=relaxed/simple;
	bh=Pq1xH++JiVd/V7td2oGk1qfykn3VwLeCHjx+lhtpWno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoMWgrqvJb4vsHZNdzz4pg4h4An/VvS7sqEAEtinSIObO8zXHSZUfftto4UQWwzgIXmA17eFTTg8VZJ7bIWBDJGlYHss4MoLB+767hzUXReLRGRhyqqtWE3t5OBHhX2MkpCCh/PumiogeBZdWE8f6GT/ADPJ1QLfE/yaTPyWSrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjkVxy5z; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjkVxy5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752566091; x=1784102091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pq1xH++JiVd/V7td2oGk1qfykn3VwLeCHjx+lhtpWno=;
  b=UjkVxy5z8SujgoQKFtjSIChXhEtutL1cES9HN512jY823pRElAa/lphE
   R5hy0Z9RH0KY1/iSVGCUTpzPTEZKfkob0iXXtZy/AOjRNj+U9DjjUXU/A
   t6FTvCmlQ0TX081nTlm9TICY1Cici7ksuGF+61fatVOmNFti/kdTE/hW0
   2VMPPkN7oqvSMrKpsi4NjUcg2YThdywU8wFlpgy8An3N1geItc4WBdXS/
   KRD7L/Zrz+s0iK4wqwoQnTkiFsfnauN88/YAhDXs4BzddJY2uM/+QA0ZA
   48R/Ji+ajY5lpo3iRGJjVJ3v69aBDLeLrAJhJz4tSxUzs4qLRYv3YVUAW
   A==;
X-CSE-ConnectionGUID: EsINvRgWRviWRDmo7YydHg==
X-CSE-MsgGUID: bz8TQIzcTau6gKjA7XKmNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66224312"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="66224312"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:54:51 -0700
X-CSE-ConnectionGUID: Xew4MyEVQFabbdvmdJngRg==
X-CSE-MsgGUID: cv0lbx9dSkKQcWLfPwFzrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="156564091"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:54:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubaUu-0000000Faa0-0Nco;
	Tue, 15 Jul 2025 10:54:44 +0300
Date: Tue, 15 Jul 2025 10:54:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] locking/lockdep: Move pmd_to_hmm_pfn_flags() to
 the respective #ifdeffery
Message-ID: <aHYJQwZkSsJMz1ut@smile.fi.intel.com>
References: <20250710082257.663850-1-andriy.shevchenko@linux.intel.com>
 <20250714143705.GG1870174@ziepe.ca>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714143705.GG1870174@ziepe.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 14, 2025 at 11:37:05AM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 10, 2025 at 11:22:57AM +0300, Andy Shevchenko wrote:

...

> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thank you! There was already a v2 with fixed Subject prefix.

-- 
With Best Regards,
Andy Shevchenko


