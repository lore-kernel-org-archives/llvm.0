Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D03157A67
	for <llvm@lists.linux.dev>; Sat,  5 Apr 2025 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743872318; cv=none; b=omzALgyhrdjy17YW83Ac6a6a24RrCTuaNErN7qW/uiD7QY7yznIrWV4LN6OijftZt4lxGHoaX4ifzD+DrJN3y/dILD26aQswrzmpRKaL/Zypw1znriTQ5R/1dUh4SoZBgIQkFl051pnfF42dyaTKHO0QVGV8cRyrf6lX3apBdv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743872318; c=relaxed/simple;
	bh=7zqQATNtcMuf8kuuQ1J4Uj5NGNLcqvtOgnurkLSLZMM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sULfoTHn6XYQwi/1zpm541Wlz55CinxXxLWY2/HtmsFFbGU5rhD7VFsi1GO5rLCqfUoDLMv4s10nXr2Lq4K644KONyW4YT27BQt+qP+ryqCTTMFuH7tdYss4LzDQKaDF7JbqgFsW6fhB/mbYz9YTa0/CsqYLx3i9AulNznd/tu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 2fca9e7a-123f-11f0-9b84-005056bdf889;
	Sat, 05 Apr 2025 19:58:24 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Apr 2025 19:58:24 +0300
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] vsprintf: Use __diag macros to disable
 '-Wsuggest-attribute=format'
Message-ID: <Z_FhMJRlBXOKeetD@surfacebook.localdomain>
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
 <Z_FflEgssFzw0tzC@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_FflEgssFzw0tzC@surfacebook.localdomain>

Sat, Apr 05, 2025 at 07:51:32PM +0300, Andy Shevchenko kirjoitti:
> Fri, Apr 04, 2025 at 03:10:01PM -0700, Nathan Chancellor kirjoitti:
> > Hi all,
> > 
> > This is a follow up to the complaint that Linus made at [1] about how
> > the #pragma and #ifdef to disable -Wsuggest-attribute=format is
> > currently ugly. Convert the #pragma and #ifdef to the existing __diag()
> > infrastructure in the kernel to hide some of the ugliness.
> > 
> > I am sending it to both the vsprintf maintainers/reviewers and Linus, in
> > case he wants to apply it himself (since it is pretty simple).
> 
> Hmm... You haven't put my tag, nor added me to Cc list...

Ah, now I see it, it was send to the @linux.intel.com address. What is strange
is that lore web UI doesn't show it for me:

https://lore.kernel.org/all/?q=%22Andy+Shevchenko%22+-f%3A%22Andy+Shevchenko%22

> > [1]: https://lore.kernel.org/CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com/

-- 
With Best Regards,
Andy Shevchenko


