Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905CB3DCD88
	for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351580; cv=none; b=mKICamLPGQuLU9RLaEEg5GkHskQm38zGyrqMAg7jOrZV44Wv4eW1XKDYgkGPAsCUxuXyrbxUAFuD7DFiEzUJH2wpmwu36+X90aNkU9dzdt0FdOsMRdJWWZY39j5lhaR5fhLc1jd0pl3MEYxampZqyK9k121h+2+exqy3cN5jMBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351580; c=relaxed/simple;
	bh=V8P9+0m7dMCFbh51hcNuxbSZqtbernirfU0Akvtzmu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbegxVc1c6GfzCupQA5HljMVQiy7Iv5hsHO5+EbTBzRqCWgBjIVMmIfsJhhNYBwO0BOFOURKvzbQQVLYvXBzLdOzcfin9/f/v8v4i0Um/RP/r/LNcs1WykuUWJpVMuNYQ6nbXW/SA1yJ2r1iDIXSWqRypa+sCmKP9daZc0mIzP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ist3LlDq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ist3LlDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774351580; x=1805887580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V8P9+0m7dMCFbh51hcNuxbSZqtbernirfU0Akvtzmu8=;
  b=Ist3LlDqtvgaHxLXVcpFsvBSt5GVAUSJjBO228ibr6xwkckVXn+IiAzt
   lX40GJuQQ0TiGmEYI45PtZ3dSQ3khQKnHa63AWRPhuBOELBX8fRc1+zq3
   eWMhzpyZqbuOWv3ZA1C8xPSImSuYz6RYpQj8XFtn9ux4DzGgHQgfCS4wV
   y/ctqmPSlHn7Qjt/n9s7NwEoQ8ygP6zGuU54n2KyzFjumyvBuuOnFlRq6
   82BcJ8w/MVkGuiLnA5H2uY/VnCOcg1kZk+7f7IimhlpWn6uXJpQ/2ocLE
   h9lWbKtVitNtkXeDMYBXbESs+4wubJBT5iovFL5fH6zuwReMJk7xThG0j
   Q==;
X-CSE-ConnectionGUID: J+Gfyu/iSua4a9j8/wf35Q==
X-CSE-MsgGUID: iCNE5831TdSBxTLT3XMZbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75077836"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75077836"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:26:20 -0700
X-CSE-ConnectionGUID: A1+v1903S+6gQD18/dj7MQ==
X-CSE-MsgGUID: G/z/63ksSyiFw5VfajfJwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228804616"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:26:15 -0700
Date: Tue, 24 Mar 2026 13:26:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] bug: shut up format attribute warning for clang as well
Message-ID: <acJ01RZ1UPdSnjyH@ashevche-desk.local>
References: <20260320211528.2474389-1-arnd@kernel.org>
 <DHA3U3U4ZZXQ.2RPHOFNQJ70JQ@google.com>
 <cf40b3d8-9a69-40b7-b885-aff87e85de68@app.fastmail.com>
 <20260323134540.5de3cf098cc9858486462f08@linux-foundation.org>
 <ca8b75f5-c342-469e-b596-510177863272@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca8b75f5-c342-469e-b596-510177863272@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 09:56:31PM +0100, Arnd Bergmann wrote:
> On Mon, Mar 23, 2026, at 21:45, Andrew Morton wrote:
> > On Mon, 23 Mar 2026 16:38:14 +0100 "Arnd Bergmann" <arnd@arndb.de> wrote:
> >> On Mon, Mar 23, 2026, at 11:54, Brendan Jackman wrote:
> >> > On Fri Mar 20, 2026 at 9:14 PM UTC, Arnd Bergmann wrote:
> >> >
> >> > There is actually a superior fix for this warning that Andy Schevchenko
> >> > posted here (mine just happened to get merged first):
> >> >
> >> > https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u
> >> >
> >> > Should we just switch over to that? Looks like it should work for both
> >> > compilers.
> >> 
> >> Right, I tried that again and it works. I had confused it with the
> >> similar logic to disable the warning on va_format(), which is
> >> not that easy to avoid.
> >
> > What I think I'm hearing is that we should revert Brendan's
> > d36067d6ea00 ("bug: Hush suggest-attribute=format for __warn_printf()")
> > then apply Andy's
> > https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u,
> > yes?
> >
> > Could someone please prepare a suitably changelogged and tested patch
> > for that?
> 
> I now sent the version that I had in my tree already as a v2
> of my patch. I tested this with gcc-16 and clang-22 in random
> configurations.

Thank you!

-- 
With Best Regards,
Andy Shevchenko


