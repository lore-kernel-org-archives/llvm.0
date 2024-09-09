Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36DE1B29BE
	for <llvm@lists.linux.dev>; Mon,  9 Sep 2024 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725874875; cv=none; b=qKoNvjclPpx5ojRqN8NFgSVj5RhtwNMRYrNKZyxjPgHWC5gDTZwlFtw3jUVL8SnboJrIGUOmDWAvIX2WdwaUvRlP4fqvqWsaFJGLNzI22Is0bwGEcAeKwx2wwA7O+GY9UOhpf06ILp/Zh1yQQR7rdcV1CskkQkr2SPY3EYfyObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725874875; c=relaxed/simple;
	bh=4YV1lIr+oVBfNZQiTie6byKhledoEDNtZwQGooik3TE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1U0cKhnYvcmcQTo5kQS3RG2umDgkFOhTeQTxkKwRiQi22ECwVmHVOqVNZmRmmkIaIQMAsbXIPx9oR1pDROTrsdQWurDq6siYuufwEvIwxJ5chEdPfHilE3E7km7PClW7WjtFChJGLCvFhoAn03r2z1T+n7Xl7++vxL3FN4s3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jl7gQpbK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jl7gQpbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725874874; x=1757410874;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=4YV1lIr+oVBfNZQiTie6byKhledoEDNtZwQGooik3TE=;
  b=Jl7gQpbKAKGtpVc1jDjc+MSplZ3bja1ltlKRNKZMtJ43htzYhg5e36O4
   /QorsnGDNAEzhj+fvJWJDh2+Ffce5UUA4quqhaIesXFJTwmcr8SamxVeO
   DDu2iofbXjzz7ZoVDdypx8s9EZl0c7yAAa4Bce8Xq0dXDQkvDKPruo5NI
   HsadbKNzS7lP/pNP2c8OO3tx44iRtAquJRhUCmImsmEKirSXfubMspcOv
   +zHyB7Ci2mgXRvW+T8ZFr0ah5KIwVW62k9Ipr7aufFH7ogTzD7jSqbR+B
   HN+XKUp55poLd303ZMDZV8HhM/Nfb/K5VE3DFfdCjt6ClIuKEpNZ9gdvk
   w==;
X-CSE-ConnectionGUID: WX2zF+SJTIyJRbIbMHAB+Q==
X-CSE-MsgGUID: Wi9jFAanTUyKJRxz9qv7cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24061621"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24061621"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:41:13 -0700
X-CSE-ConnectionGUID: dNuGKQIrS0y3F6NTAiDIlQ==
X-CSE-MsgGUID: sysE44PuTxKL9UM1ooUrtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66664740"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 02:41:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1snatO-00000006joC-4AOT;
	Mon, 09 Sep 2024 12:41:06 +0300
Date: Mon, 9 Sep 2024 12:41:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] maple_tree: Drop unused functions to fix the build
Message-ID: <Zt7Cssu9SQury1bU@smile.fi.intel.com>
References: <20240906150533.568994-1-andriy.shevchenko@linux.intel.com>
 <krsjmi43ziyojqicc4pxzwfwbffqrnk5npbuoq6l2cnq5eovkd@afofyteb5wo3>
 <ZtsjJoGKRxszp-m6@smile.fi.intel.com>
 <3murs2k4mouy5gkzyav4ttrqanhsc7v4hpghmuutkokvah2o2v@pkddt5ziu33o>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3murs2k4mouy5gkzyav4ttrqanhsc7v4hpghmuutkokvah2o2v@pkddt5ziu33o>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 06, 2024 at 04:05:47PM -0400, Liam R. Howlett wrote:
> * Andy Shevchenko <andriy.shevchenko@linux.intel.com> [240906 11:43]:
> > On Fri, Sep 06, 2024 at 11:26:26AM -0400, Liam R. Howlett wrote:
> > > This exists to stop people from using the bits while the feature is in
> > > active development.  We had the same patch a few days (weeks?) ago.
> > 
> > This breaks build. Can you propose better solution, please?
> 
> Can you please provide the config file and clang version that fails on
> this error?

I believe any of them where this module is marked to compile
(and since it's listed as lib-y, means _any_ configuration will fail).
For your convenience it's x86_64_defconfig in the source tree.

Have you had a chance to read the referred commit?

-- 
With Best Regards,
Andy Shevchenko


