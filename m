Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C166D31A803
	for <llvm@lists.linux.dev>; Fri, 24 Oct 2025 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761310991; cv=none; b=S6CvyLM2kpaXwguOLUL0Dzs2c1HNkSAHoItpB4OZqLTJYfTR0ne6IiWe93qeUgYXnpFw9Oh+ozkGzJAIYjJg6InLJajTvZ4PGaajZsMM9uA+rXeVNJjTGOFud3qUap0nUm1hozpRViL6ooxgb4n32d1eQABhd0cez8RUTuQucRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761310991; c=relaxed/simple;
	bh=lpokBpTve9nKXGXDGJUc9rhB1uIH9BOEiKuUQcu2aKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NExM43SrS4yrKbqGRGajiTNFvZzzFfrrAQt6EwhEeiqzmG/rx2Pib/eqGogsh+j5q+QN6bv/BPuF0f1f1Si3dN1WTL746TSdEdKiU5tTeXSKvKzYtBbqKtqaKv4yAViv64aReD+jJduVwic7VxjyQZ2yGLo6w9a+jlsUQEnMnMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYkam/QU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYkam/QU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761310989; x=1792846989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lpokBpTve9nKXGXDGJUc9rhB1uIH9BOEiKuUQcu2aKg=;
  b=YYkam/QUmA8pJPMSGzWJe6ZMM83Gqbjezqml3qeeLRLWHLuOCERwNxHu
   tva8nJgn+/OJ1X2HCoAd97g0mAfy6FniSxhC4Eb2UR0fZMQOrNOvMPnlD
   5fwhPYF92dQJ2A3LxQMXcfhqot+G55nEUC9xrRMuAh4rfNxavdNI1ameB
   o+VP1Jnf5nV/w4LqeKexb48pdG3neGwpTD2ncCZeW18U2xi0eLkvV0exs
   rJ8sm9ZEPXR/wvxvpucsCGpBvgrHk5WAclk2YtR0zq6QjGUVJqckvIodh
   rIE55YvHxA4p72g0wwJf8LfAvEDZzR1qpYHVAvww4yGqu0hlkbdNPYdGb
   A==;
X-CSE-ConnectionGUID: B5NSqUBCQVGxDovpxm71Dw==
X-CSE-MsgGUID: i4RNU2msQnC9AwIxp4Pgeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51069107"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="51069107"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 06:03:08 -0700
X-CSE-ConnectionGUID: QUAK2y9xSO+DNF5Ut+WrKA==
X-CSE-MsgGUID: 7SxJscIBTjyYzwQSSwUSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184137908"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2025 06:03:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 73BE796; Fri, 24 Oct 2025 15:03:05 +0200 (CEST)
Date: Fri, 24 Oct 2025 15:03:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Justinien Bouron <jbouron@amazon.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [resend, PATCH v2 1/1] kexec: Remove unused code in
 kimage_load_cma_segment()
Message-ID: <aPt5CYz5Cc-7St6L@black.igk.intel.com>
References: <20250916125124.3094021-2-andriy.shevchenko@linux.intel.com>
 <aNLd_6CO6YMvm2MN@80a9970eed1e>
 <aO1lmNyLCVUhL_kO@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO1lmNyLCVUhL_kO@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 13, 2025 at 11:48:24PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 23, 2025 at 10:50:55AM -0700, Justinien Bouron wrote:
> > On Tue, Sep 16, 2025 at 02:51:09PM +0200, Andy Shevchenko wrote:
> > > clang is not happy about set but unused variable:
> > > 
> > > kernel/kexec_core.c:745:16: error: variable 'maddr' set but not used [-Werror,-Wunused-but-set-variable]
> > >   745 |         unsigned long maddr;
> > >       |                       ^
> > > 1 error generated.
> > > 
> > > Fix the compilation breakage (`make W=1` build) by removing unused variable.
> > > 
> > > As Nathan noted, GCC 16 produces the similar warning;
> > > 
> > > Fixes: f4fecb50d6e1 ("kexec_core: remove superfluous page offset handling in segment loading")
> > FYI the commit this patch is fixing (i.e. f4fecb50d6e1) is going to need a
> > second revision as well (I haven't submitted it yet, still working on it), this
> > means that your "Fixes:" tag will need to be changed again, requiring a 3rd
> > revision.
> > 
> > I am not sure what is the proper way forward here. Should I:
> >     - Send my v2, without fixing the unused variable and then you send your v3
> >       with the updated "Fixes:" tag pointing to my v2.
> >     - OR fixing the unused variable in my v2 (i.e. "absorb" this patch in my
> >       v2).
> 
> Second is the best (integrate this fix into yours v2).
> 
> > In the latter case, I am not sure how I am supposed to credit the work in this
> > case? Do I need to add another "Signed-off-by: Andy Shevchenko" besides mine?
> 
> Just in the comment block (after the cutter '---' line and before the diff) in
> a free words. No need for any special tags for this in such a case.
> 
> > I'm still learning the ropes on how to contribute through the mailing list so I
> > would be grateful if you could share your input on what's the proper way forward
> > here.

Any news, folks, please? The bug is still in Linux Next and prevents me from
building my stuff cleanly.

-- 
With Best Regards,
Andy Shevchenko


