Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F93822DC29;
	Tue, 14 Jan 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848324; cv=none; b=GYL6WN+OPeEVvmSTlKeJvBSGDpnMdbbdVsalL11AkMnZ/lL5dU3j/yuLYZtWHiYXsU1oeAYNZJiHF2EuDCH1YizuRby6JvJv88yTJv+aoDEwZSse9VE1MMbG2DYJuc0dBcPbhCbnlnTRx5ofui6z3onrOoEIkyobvtgw03vmkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848324; c=relaxed/simple;
	bh=0lEu6+jAX5q0y6bA8IbaktrRWd8GW2sO12TW2G5gGrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTkSqmTRhX+sjSsNikEbzC+h6mTixbiicKH8iC6hMEvUzWx7gD6rckDyaxKUztb1DztczCHL2DoxJxYPSp0pu6FmJ8cjpCJ4jp8hjT+fh7u32ZDaozDX0CbEGE8m/o8N3NLVPa2A1qRPe1T3vschlgFMCkzCKjygE2iDgIEgmLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tG/wVnhM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tG/wVnhM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1DCC4CEE0;
	Tue, 14 Jan 2025 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736848323;
	bh=0lEu6+jAX5q0y6bA8IbaktrRWd8GW2sO12TW2G5gGrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tG/wVnhM+D60NehqGfc43Bbo+ihPGsVHas3P/l9+sVXQ1rVQLbThkbiVTuqCjf8ba
	 g9SBwZctSRbSh+QDDSCjJXKMQ+lBKT1/64dJLylan9WXgivfTAFklnlWL5M+qDNhOJ
	 ZXTkBI8JzjrRjtibw6wsxiui3FVFAdonxIO0AnbXvWJBOPsqbHGfwpCvQkl7mV8OWV
	 c08zKHRvSUw6jOtGovlDcKI18yxMVgF5gDJWO2rBiDguKMUek7Svs+paOATfUcFS8D
	 wkK/09fiF0mo8tpg7lTtMENePnkOTuHLErwX/arzXldPnNnEu327UQn/1pQeuhXxqD
	 klUPhPpxDHMzQ==
Date: Tue, 14 Jan 2025 02:51:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Klaus Kusche <klaus.kusche@computerix.info>, peterz@infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: "Bad or missing .orc_unwind table. Disabling unwinder." Clang 19
 problem? 6.12.8 problem?
Message-ID: <20250114095159.GA1580513@ax162>
References: <b248a0fb-e182-42e3-abf5-83945ee992f6@computerix.info>
 <20250113214122.g4lluwpzj3tnamx3@jpoimboe>
 <20250113235835.vqgvb7cdspksy5dn@jpoimboe>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113235835.vqgvb7cdspksy5dn@jpoimboe>

Hi Josh,

On Mon, Jan 13, 2025 at 03:58:35PM -0800, Josh Poimboeuf wrote:
> On Mon, Jan 13, 2025 at 01:41:24PM -0800, Josh Poimboeuf wrote:
> > On Mon, Jan 13, 2025 at 06:29:10PM +0100, Klaus Kusche wrote:
> > > 
> > > Hello,
> > > 
> > > I've submitted a bug report to kernel bugzilla,
> > > but it was closed with a hint that I should contact
> > > the maintainers and LKML.
> > > 
> > > https://bugzilla.kernel.org/show_bug.cgi?id=219685
> > > 
> > > You are listed as the maintainers for x86 stack unwinding.
> > > Any ideas about that problem before I submit it to LKML?
> > > 
> > > Is it possibly related to 
> > > 
> > > https://bugzilla.kernel.org/show_bug.cgi?id=219686
> > > 
> > > which appeared at the same time?
> > > Should it go to the clang maintainers?
> > 
> > Hi Klaus,
> > 
> > Thanks for reporting it.  Indeed it's probably related to the build
> > warning:
> > 
> >   vmlinux.o: warning: objtool: start_unlink_intr+0xb7: can't find switch jump table
> > 
> > It's probably a kernel bug, possibly triggered by the new compiler.
> > I'll see if I can recreate.
> 
> [adding some folks]

Thanks for the CC, there was also an issue filed on our GitHub but I
have not had the chance to reply to it yet.

https://github.com/ClangBuiltLinux/linux/issues/2064

> Nathan, I think this is a Clang 19 issue, where one of the jump table
> entries is pointing past the end of the function.  When we saw this in
> the past I think it was due to some leftover optimization, where the
> jump table entry ended up unused so it was harmless.  Are you aware of
> any recent bugs in that area?

I am not aware of any recent bugs there but if you or Klaus have a
configuration file that triggers this, I would be happy to bisect LLVM
to see what change introduced it to give us a better understanding of
what is happening here.

> Maybe objtool should just ignore such entries?

This may be worth doing, especially in the face of the --Werror flag
that is being proposed.

Cheers,
Nathan
