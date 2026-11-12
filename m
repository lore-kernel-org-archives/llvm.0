Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463166;
	b=j3WunM889kQ4cRLbennMPnOqD7Q69EIBKSRm8w6HjrFvYMsHkSoXj+kknMFhfVh16vnu
	 W/7M5gaqqfIGHFVLB8ia7mfuGB9bYoWCjyPZ9b4Ti3FWAU9G7KJHmgvDnDveqn7uAMCNW
	 R2bhDwqccvspfozWtLKz+fwWjxCk8YrXvkRNdsasKrQwWiA+Dox1UwJJCLjg2Uv1ty3/q
	 PfdzJLf6rlQI0Ec5cmAKH8+x6Uwtruq/3CBFF5LwMQp6iGJ8g4PDV7Q80wlxfWcXZtBkc
	 /7dgzTtXN4oiZrxjjxGNllfYFOBrMNaKT3COJ5qwmNoPNHWjNXCB4q8O+X7fSpSGmBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463166;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=b/D0zsBG3kAacs0MLKSIQPr52pQwnIYsnGcp9zQ980E=;
	b=i/fKS6/gOoBvXAnfo5e3y/srATOOSRdXQtSFpUZtDhTpfo1A5wEneJKHspczV3sX1+A2
	 d+Kg+M2MDRKBnuP9DLbc1ws4fK78BtInB2JvV3psiWjLf0IQxb5dsSVCI8AUk31mNLmR2
	 DltKhJc7VabWZ9atqYnhZksAAsXjSZNwCaOWUCgz2FjMozL+f9tE3jyUfU8sFzPLMxhaV
	 1w1uk3IHTzv92LiqLinfyuOr+WZZUId7VbekBib1XcU1pUYr7pF5GiAe0v992WHLDuZCp
	 LiieJObftv9gkcm8nx7kUhLJsEJsxEN5qWM1+I4v4bDIhhO/+icpi8Xh3uehJ9BnZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONvgcakO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B093606A324;
	Thu, 12 Nov 2026 05:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONvgcakO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390B91F00A05;
	Thu, 12 Nov 2026 05:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794463166;
	bh=b/D0zsBG3kAacs0MLKSIQPr52pQwnIYsnGcp9zQ980E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ONvgcakO68YiyNkoeqwhUmFwhdjMLaLuDY9EACrjI0EIFNKVfr21hfsPGRZS+jJMM
	 NpXGoZ+n2iUSmrN1x6AFw7JZLXx4c3bBrr41G8IduJVSc80OptIMNtlUrwNvoi7EkH
	 k4jPNsDDpn/qquzUiQbpLscvhVq53u578vDCreLJZJWWIh/9OXD4IAdUJB6gahqe5B
	 QRbyIZh6Hx1u12MiZKkcP7kZqn6gbTIdh8CuCzhFo4nP3YbVGS4H9bdhTDmQVp0mnj
	 1Coup66T5tkN2kWTAsJxMeMatIFOF/suutt7dX7zllow6MUXxG1vrbi+wOlgIFp35T
	 g+YM1lcCIm6gA==
Date: Wed, 11 Nov 2026 21:59:23 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ben Cressey <ben@cressey.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, 
	kexec@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] x86/kexec: Type relocate_kernel() to drop __nocfi
Message-ID: <avVUv4_eeOOr7ZX_@jpoimboe>
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
Content-Type: text/plain; charset=utf-8
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
> 
> Link: https://lore.kernel.org/202609241804.BB23BF10@keescook # [1]
> Link: https://lore.kernel.org/9c41ab61efc573e3ab5a75b6e4031f81db84a846.camel@infradead.org # [2]
> Signed-off-by: Ben Cressey <ben@cressey.dev>
> ---
> This follows Kees Cook's review [1] of the arm64 kexec fix, which goes
> separately. It is not a security fix, and nothing faults here today.
> The copy gains a type hash and, with CONFIG_FINEIBT=y, an ENDBR, bare
> under cfi=kcfi or cfi=off. SYM_TYPED_FUNC_START() is not used, since it
> would put an ENDBR in every IBT build. Code built with CONFIG_CFI=n is
> unchanged. A failed check stops crash kexec too.
> 
> An LLM wrote the patch and drafted the changelog.

No objection to the change itself, but PLEASE no LLM-written changelogs
or comments, they tend to read like Rube Goldberg machines and these are
no exception...

-- 
Josh
