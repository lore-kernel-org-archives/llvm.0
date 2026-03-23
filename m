Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB5A3E4C70;
	Mon, 23 Mar 2026 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298741; cv=none; b=a1KsRZCcmTyKfowlZPsHMvMsX2iJTfOhT/JPl7BFr6TWxArgY1xTNVXdoYHLZd8+ca1iRfpR7KH5+bFNSEN35yC04cJO1K4huXkrfk1W/D3qegjEvs552WHhRpg3nBFVcPPTaQ0EgtGbjHaR60q4Dac1XTWSqeUxq/hudsjSjHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298741; c=relaxed/simple;
	bh=KdIFZMZJZbOqJyLbGUqPRhh3LUMMYviFH69mfZ8SbpU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QoDaA3txz5BPyqcHlGgBitBVpCvFiK0uU7v8iyz3kvl1CHZTxASO3ODqVuh0dg47rTAhTF6FfLmi0deAc97+OC7w5RMcppCStbLS9CeFNLv/Kn7cJSFokm/nWmI0DggeeAVoxTGTWC/DXWDL+Yj2piLKQbcsRV/s86oyoRYVxZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WeNVm8PK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WeNVm8PK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33E6C4CEF7;
	Mon, 23 Mar 2026 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774298741;
	bh=KdIFZMZJZbOqJyLbGUqPRhh3LUMMYviFH69mfZ8SbpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WeNVm8PKHOXogJ6HGN1aexTUvvOPbjyOktAqsXBq+2il/bJMhhsBoqsRqhoKpfgax
	 aoHXg7cUfO1QGnO9QIavsnRESpnz2CWLC7HRHZlwOT8MWDwI4Czd9p+rqZ1jMETGn7
	 toWdv8KukeswXSjrvgkOWx8Qw+SmIEfZ0vOW8GDk=
Date: Mon, 23 Mar 2026 13:45:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Brendan Jackman" <jackmanb@google.com>, "Arnd Bergmann"
 <arnd@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH] bug: shut up format attribute warning for clang as well
Message-Id: <20260323134540.5de3cf098cc9858486462f08@linux-foundation.org>
In-Reply-To: <cf40b3d8-9a69-40b7-b885-aff87e85de68@app.fastmail.com>
References: <20260320211528.2474389-1-arnd@kernel.org>
	<DHA3U3U4ZZXQ.2RPHOFNQJ70JQ@google.com>
	<cf40b3d8-9a69-40b7-b885-aff87e85de68@app.fastmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Mar 2026 16:38:14 +0100 "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Mon, Mar 23, 2026, at 11:54, Brendan Jackman wrote:
> > On Fri Mar 20, 2026 at 9:14 PM UTC, Arnd Bergmann wrote:
> >
> > There is actually a superior fix for this warning that Andy Schevchenko
> > posted here (mine just happened to get merged first):
> >
> > https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u
> >
> > Should we just switch over to that? Looks like it should work for both
> > compilers.
> 
> Right, I tried that again and it works. I had confused it with the
> similar logic to disable the warning on va_format(), which is
> not that easy to avoid.
> 

What I think I'm hearing is that we should revert Brendan's
d36067d6ea00 ("bug: Hush suggest-attribute=format for __warn_printf()")
then apply Andy's
https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u,
yes?

Could someone please prepare a suitably changelogged and tested patch
for that?
