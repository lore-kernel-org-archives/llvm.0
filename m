Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470458;
	b=O34avB7c+ZNYol0uzNdNayX921dNyWH4bBBzpENaY0oFSu7PegefN9iCdZavklhJO+N3
	 HQBepV0aBq+Uk9OfNurzYXmEjXXgVhAo3CzFrzenZZqzwrX9t3EJ9WDWCCCn+z1kbI+FD
	 fGGdtdYUIdKmx5Tu5gJh1Fexl35my2Z/JmDTGTf+Kqli8QPf2Vn58LrCar9+cRAcSntLV
	 JfrRLZE2E5LsoRN5JGJ49akxgpgpau/HW7DiAgDApvzXuQuQUBA9fKALHprVyRE/G0fqm
	 EMOAntsXpu5rWrSb0LUvJFlrxhGIAaFwxHPdHc7AsyC7SrCgK/rahw/TNpkMBDwoFPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470458;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Cm7AtxdM5CH1FUBVqHh5yaMh1nV0eZJjc/Ip3saInLw=;
	b=Uvts6GUCnwQtlf5JCZMc3mvG4HEz+Jxz3W3wVxW/6aKKrjgU7XpgPclkYRBdPnr8c9UR
	 jWoCkUzgUd0M599i1B4507Q6grouedSUB45m9FpR/gRrV641G/wtr24cirlap4q5HCGYo
	 DnXDGOMG3jiN9Q4C9VcPc1Pwgxrycz1ILlATWYytOiJfL+vz1F1o3U8pTZDir2ez/o5Ws
	 3ZZ11SdVCv8qVZ/EbnXl7DfOAYlZmyTx7O2rl9MLCxqkFOQ7J53IaN156+oCbc7eyLYSV
	 vgBJr9+vLNpjtTFKQe0z0Ikq0opYyHPuALJ1rbv9sDWD/F2dw2L3AEqg6JT/C+b9B1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NB8DUBSN;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA09606A321;
	Thu, 12 Nov 2026 08:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA09606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NB8DUBSN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Cm7AtxdM5CH1FUBVqHh5yaMh1nV0eZJjc/Ip3saInLw=; b=NB8DUBSNjgFxHyXncVqzp3mDq8
	Bep8qNMh2Xthp+6jkWveq7/mcgyypw/bmfycCoczUI20lvNEve2Qcl0sVhf3pcFPYVXoP31bnpzBj
	YYmsFQaRNEX50h+zYSqlxkhq+JyTBB5Ha8n+yb4ZpdlR2TQnH2DvONHkmfvUHYStUD9uUtczYCEug
	br+gVQGOcwr1f9GxpBD7q3cLPqUfOW+zIiCAO+Cu3f6szwPjoDuEuaQnmUF+Ys0kBFctgXawFay97
	XzUBdac1pA6lt07IJiQx7RbsvADFN6t/yjyDt8npZoPqBb4yi5Q0eoxXdsJ0hSrD67oZxQhMtgjO7
	o0YmBSXA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPjn-00000004nAB-1Aql;
	Thu, 12 Nov 2026 08:00:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2AA9130066A; Thu, 12 Nov 2026 09:00:50 +0100 (CET)
Date: Thu, 12 Nov 2026 09:00:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ben Cressey <ben@cressey.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>,
	kexec@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] x86/kexec: Type relocate_kernel() to drop __nocfi
Message-ID: <20261112080050.GZ2668804@noisy.programming.kicks-ass.net>
References: <20261111-x86-kexec-kcfi-v1-1-b4d41ea14deb@cressey.dev>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-x86-kexec-kcfi-v1-1-b4d41ea14deb@cressey.dev>

On Wed, Nov 11, 2026 at 03:26:59PM -0800, Ben Cressey wrote:
> machine_kexec() calls the control page's copy of relocate_kernel()
> indirectly. The routine has no kCFI type, so all of machine_kexec() is
> exempt since commit 2114796ca041 ("x86/kexec: Mark machine_kexec() with
> __nocfi"), and ANNOTATE_NOCFI_SYM() silences objtool.
> 
> No other call there loses its check today, but one added later would.
> Review of that mark on arm64 preferred a typed entry, and objected to
> covering a whole function, on x86 too [1].
> 
> Typing the routine was set aside in 2025 as not worth it [2]: a type
> from the caller cannot catch a prototype that drifts, and
> machine_kexec() seemed unlikely to follow a stray pointer.
> 
> Type the routine with SYM_TYPED_START(), emit an ENDBR only under
> CONFIG_FINEIBT, whose boot-time rewrite skips a function without one,
> and drop both exemptions, along with kexec as a valid use in annotate.h.
> 
> The check guards only the pointer, and not reliably under plain FineIBT,
> which checks in the callee with IBT off. A failed check panics or hangs
> with no CFI report, since load_segments() has reset GS.

I don't understand this; what?
