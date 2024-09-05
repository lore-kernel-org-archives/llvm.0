Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB0D197A9F
	for <llvm@lists.linux.dev>; Thu,  5 Sep 2024 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725573948; cv=none; b=EFOwZWZYphDlD8gwMgYwWp84G9oWorV7cV4km1PzSN9ZByT9pqLvYbuWJNvLmqvQd5sUwt2UCffMwvj30SpnBvhNOUElxpOoWLY52iNv/B45n3LuNczsEiNkYa2Vnz6nMr8eqm/O/FCCaRJNyUiXEfvtjq/MwpHKvAQhVmMRAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725573948; c=relaxed/simple;
	bh=tZIszrxdMpyxYV8DYgA6xtvpR7JoghxuV8nZeM0115s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4lIjSRcvxTLjl9nLyEAAmteMzakugg8k6VF2pYxVqT+Mq2s7R8Cjvj2WndFUPvvShZag4bHspHRbzC9yQ/QuDgUhWSyRPQZF5WCcydqybM3MlXbH1sEk4erApEz/XqXgvrUMGFqswo6OB53jmiy4aNSNIXvWMBs76zaoiIlOwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id f4f752b3-6bd2-11ef-8e98-005056bd6ce9;
	Fri, 06 Sep 2024 01:05:27 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 6 Sep 2024 01:05:26 +0300
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] mm/page_alloc: Mark has_unaccepted_memory() with
 __maybe_unused
Message-ID: <ZtorJmTrerLhO5Xv@surfacebook.localdomain>
References: <20240905171553.275054-1-andriy.shevchenko@linux.intel.com>
 <20240905142220.49d93337a0abce5690e515d9@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905142220.49d93337a0abce5690e515d9@linux-foundation.org>

Thu, Sep 05, 2024 at 02:22:20PM -0700, Andrew Morton kirjoitti:
> On Thu,  5 Sep 2024 20:15:53 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > When has_unaccepted_memory() is unused, it prevents kernel builds
> > with clang, `make W=1` and CONFIG_WERROR=y:
> > 
> > mm/page_alloc.c:7036:20: error: unused function 'has_unaccepted_memory' [-Werror,-Wunused-function]
> >  7036 | static inline bool has_unaccepted_memory(void)
> >       |                    ^~~~~~~~~~~~~~~~~~~~~
> > 
> > Fix this by marking it with __maybe_unused (all cases for the sake of
> > symmetry).
> > 
> > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > inline functions for W=1 build").
> 
> has_unaccepted_memory() has no callers if CONFIG_UNACCEPTED_MEMORY=n. 
> Can't we do this better thing?

Sure! Please, use your patch, I'm fine with that
Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


