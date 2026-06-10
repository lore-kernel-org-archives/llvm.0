Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC25E40D592;
	Wed, 10 Jun 2026 22:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781131676; cv=none; b=iGjCD4WOAnbX3iCjr7BDcePA1ObKXnzqB7QbGVJ/SfO5f/MA9JIaY+30uVYb+pHWLnrHrrfQo45RNyVeTUxUlw0uH+NFTHZZvGCOpm993OeYINNeuvKAfmK6KXijFZLiTJ8RUqhmX3YyANAtzdxSU8SF0Zkkkex0C4d4dYL9Kq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781131676; c=relaxed/simple;
	bh=gLLCtpu1HW4y48WvsCoQTVPgxaeKpCOnu7uRUsWxsfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBnZoETdSBZoeFlyYR+ZKUtTjM1/nK1sICxso80ywVzN1S2JSgF2TW8tdwaImSLfQy8eB3Sv9K/Y5a2N/5oxfbWMO9gQwtaoQCiQ9yRtrcaB7P1GCy1HL05CA7WeF6dB/R0EIco3H+xHQS5vzwc7cv0lfxY3O69N8YycyIuWlrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpJZT38u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpJZT38u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4AA1F00893;
	Wed, 10 Jun 2026 22:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781131675;
	bh=GRvgTXlPZl11xkQBcRqK4OFLDdU04M2262Jxs4ZW4C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gpJZT38uyfsTpqy3Gr+HepAiLDv+DSwP8ChARazi3xh01rFNGozsQmbelEOh3xDXC
	 /4htzP9ffXXPqdLLnzPsShgEFi3hOianssEDcaVG8hRX4yICacLhA5ZntbhvD9+dZB
	 rSl4pGs3qS9zFdINT7SXpB1/idWtIwIqofWRWsvH1UYFw/iJoWi9ijwFGtFeg4dyxz
	 cm0qCW7trDQVzPSqJw6M9TsRwnKbJwZUEJoEhnImqQ5/vI01Xq2zY/BXFOzBvObcgL
	 Vpmdiv0o7rHK3l/9Pi9UbbR8gCp+38+y1FyYc1ylkpQyFBo3Ew1jQC+miwSlW/7J6c
	 EFLH4+mi/KUoA==
Date: Wed, 10 Jun 2026 15:47:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: [PATCH] MIPS: VDSO: Avoid including .got in dynamic segment
Message-ID: <20260610224745.GA2820589@ax162>
References: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>
 <20260610093311-dcb6efd5-6921-48a6-a97a-8739fe7d3417@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610093311-dcb6efd5-6921-48a6-a97a-8739fe7d3417@linutronix.de>

On Wed, Jun 10, 2026 at 09:45:08AM +0200, Thomas Weißschuh wrote:
> On Tue, Jun 09, 2026 at 06:31:21PM -0700, Nathan Chancellor wrote:
> > The fixes tag feels a little strong since it seems like it has just been
> > luck up until this point that there has been no warning but I decided to
> > be conservative and include it regardless. Feel free to remove it if you
> > see fit.
> 
> I have seen this issue independently from the commit blamed above.
> It occurs at least on commit 2b7a25df823d ("Merge tag 'mm-nonmm-stable-2026-02-18-19-56'
> of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm").
> If you want I can investigate more, but the Fixes above works for me, too.

Maybe it would be better to blame the original vDSO commit then?

Fixes: ebb5e78cc634 ("MIPS: Initial implementation of a VDSO")

I cannot build with LLVM back that far but something tells me that this
could happen back then too just because .got is not described there. I
don't have a strong opinion though, this does not appear to be a
functional issue since llvm-readelf just falls back to using .dynamic
directly IIUC. I guess tglx could make the call during application if he
is okay with that?

-- 
Cheers,
Nathan
