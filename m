Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD872D8375;
	Wed,  4 Feb 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210429; cv=none; b=TM7myZMxY0WrtM/p9VHzCaQ812cgamVeY88ZjvEHZMGfc9j+R9YwdU7gfJxKgkmDXA93jPx6jgdwc0+R2GpcqunJteYZiSqcHO4hzqzWvkw7lYwZGPJN0rQH0LQD//dhKJDkiYrykCSrLDETuPeu7ftoY3Ycx8NWeTavS7AUuP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210429; c=relaxed/simple;
	bh=IG7z+rMybMa4HuzoAClaZJTClqKa1ijErCJG0QFQoWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzgnlJzvTdBpVMVovCTChYLL63ph6kXVLwUG2YPHo0/xIcgwjf9jlEuZRZaP2mdmiSWlBOfbmY3GtaoZy/7SrcTi/gi37a2Lk9E63S+qJ+uARLdQNYcZUez28wupNuUdmDnjX1YmYr3nSkPVuQSN3m26RevpjEBaVcs3KcgUMLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JnNmj20m; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JnNmj20m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IG7z+rMybMa4HuzoAClaZJTClqKa1ijErCJG0QFQoWY=; b=JnNmj20mm0cT/SAQkT0IEJ72Jn
	yFL0UFRybqecdOVM/1xS8zNEz1CsA2VmJqWKJL3pxSz/3Eb2QQee1rOZVnsoWdN+d67Q12Xe7aLog
	Ed3/oC2V3ikJ7KOnUEvk3UE2dvpREAv4XJym9QeEGR+lPtkcpb8Z8Mp0nqyqJ4++32t1lIVBU/dIZ
	QP4uqO2SDYDTum3xaUZR9zNluxP4M84YOZdgXelOkAE0NgSQ/beE75OCCIB2t8Efrte/uLOGy8Nb0
	CasrpB2NDBcpW0kyHSlgGeA0BtuQlhgFzv6a/uvF22OLPZsgx09OPvQ496GWarL+3HLP2b/orH+kv
	ylDfNAGA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncas-000000026VB-09Dm;
	Wed, 04 Feb 2026 13:06:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7D24B302F8E; Wed, 04 Feb 2026 14:06:53 +0100 (CET)
Date: Wed, 4 Feb 2026 14:06:53 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, officialTechflashYT@gmail.com,
	Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] rust: Add PowerPC support
Message-ID: <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
 <aYMiXcy33YEVkgYM@google.com>
 <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net>
 <aYNBtc2Jbtg9sLIE@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYNBtc2Jbtg9sLIE@google.com>

On Wed, Feb 04, 2026 at 12:55:17PM +0000, Alice Ryhl wrote:

> Is there any reason to not make it Rust-only but for all Rust code?
> Making the / operator work seems like it would be a good idea.

Why would it be a good idea to have it work on non-native types in Rust?

The reason we don't have them in C is because non-native divisions are
expensive and doing them should be a conscious choice. The very same
argument should be true for Rust code too.
