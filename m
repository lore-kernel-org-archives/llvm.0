Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76C129CA
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 12:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A05C34609
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639486679;
	bh=fPLzgAM5zZtvxYbuMSdvyPFHt7Io9bVbB3QgwMTW9qg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lr56zdM1DlSJ/z8DBEHmYIZk8afgszG9CIi5DU8EIHGEydyBxLyKvUyOm+/AkUV9A
	 aMAwPwFqfeFeOcHWuOQoVlhWhMFGmqxr96B2ntHTaNVZT7mivc807HO79LTx1oOYwe
	 J8DpehzRHoLN4hnwGsKBZgZHUJ1cp1kyy+tQVzaI4jWWpMVyEAh+vDeoKGVwqTLwv4
	 105VckNOOcYKUAbKGOVHmN2SdnShVQwAmf82FbgOu0PUHRZ8uyh20OCoy3shO6gokY
	 hXTZtmIS1k9fHG+snY4ceC1rF8i2jL9y+mRjnLcRky+/vtIoAKHoQyI6cAa3dm9cN+
	 j6DrzdUtqhqrw==
Received: by mail-oi1-f181.google.com with SMTP id s139so27003659oie.13
        for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 04:57:59 -0800 (PST)
X-Gm-Message-State: AOAM532Lb/2OSGS7bD7/m80++kGcdXdUcUgiCNddiTUoi4c9M2QdjO1r
	TEryO6Nz/wb7aB0IkVWQBuSy6tLUODnnWue7HAA=
X-Google-Smtp-Source: ABdhPJzs5O4ABCAFC/pS+qQWblhbzf6ey4r6qkA99C/F9P/HFftEzrvzbESxd+BvKMj8PHnYU68mNAUZmy7z78cn+ek=
X-Received: by 2002:a05:6808:1919:: with SMTP id bf25mr4280185oib.33.1639486678759;
 Tue, 14 Dec 2021 04:57:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211213140252.2856053-1-ardb@kernel.org> <YbgDR461O9gCEi+Q@archlinux-ax161>
 <CAMj1kXFKuHuzsrDBcUjbaVO6-NQkj8J+vMty_qU3Y0pDwT905w@mail.gmail.com>
 <CAMj1kXGadU-_dM9OtXzy6OqKqReYyzEB-F6NVwDOEodpzwtemw@mail.gmail.com> <YbiBuI0XvpWXqbki@arm.com>
In-Reply-To: <YbiBuI0XvpWXqbki@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Dec 2021 13:57:47 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGgnZvYG16u3Jw3xmgJMMRFODkAATSWTdqR8CL-Sjc3Qw@mail.gmail.com>
Message-ID: <CAMj1kXGgnZvYG16u3Jw3xmgJMMRFODkAATSWTdqR8CL-Sjc3Qw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64/xor: use EOR3 instructions when available
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Dec 2021 at 12:36, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Tue, Dec 14, 2021 at 12:05:34PM +0100, Ard Biesheuvel wrote:
> > On Tue, 14 Dec 2021 at 09:19, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > + Arnd
> > >
> > > On Tue, 14 Dec 2021 at 03:37, Nathan Chancellor <nathan@kernel.org> wrote:
> > > >
> > > > Hi Ard,
> > > >
> > > > On Mon, Dec 13, 2021 at 03:02:52PM +0100, Ard Biesheuvel wrote:
> > > > > Use the EOR3 instruction to implement xor_blocks() if the instruction is
> > > > > available, which is the case if the CPU implements the SHA-3 extension.
> > > > > This is about 20% faster on Apple M1 when using the 5-way version.
> > > > >
> > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Our CI reported that this patch as commit ce9ba49a2460 ("arm64/xor: use
> > > > EOR3 instructions when available") in the arm64 tree breaks
> > > > allyesconfig:
> > > >
> > > > https://github.com/ClangBuiltLinux/continuous-integration2/runs/4514540083?check_suite_focus=true
> > > >
> > > > I also see this when building with GCC 11.2.0:
> > > >
> > > > WARNING: modpost: EXPORT symbol "xor_block_inner_neon" [vmlinux] version ...
> > > > Is "xor_block_inner_neon" prototyped in <asm/asm-prototypes.h>?
> > > > aarch64-linux-gnu-ld: arch/arm64/lib/xor-neon.o: relocation R_AARCH64_ABS32 against `__crc_xor_block_inner_neon' can not be used when making a shared object
> > >
> > > I suspect this is another genksyms crash, preventing the
> > > __crc_xor_block_inner_neon symbol from ever being emitted.
> > >
> > > This is a recurring annoyance and I am not sure how to address this
> > > properly. Arnd might have some thoughts on the matter as well.
> >
> > I managed to reproduce this: it's not a crash but definitely a bug in
> > genksyms, as it simply fails to produce the output containing the
> > assignment of __crc_xor_block_inner_neon.
> >
> > Moving the definition of xor_block_inner_neon as below works around the issue.
> >
> > Catalin: would you like me to spin a v3? Or do your prefer to just
> > fold this into the existing one?
>
> I'll fold it in. Thanks.
>

The root cause appears to be that genksyms gives up when it encounters

static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
{

because the types are not defined. This is because our
asm/neon-intrinsics.h header avoids #include'ing arm-neon.h in the
context of genksyms, as doing so does result in a genksyms crash.

I have very little motivation to go and figure out why genksyms
crashes in that case, so I think for now, we can stick with the fix I
proposed. Alternatively, we could typedef uint64x2_t to something
arbitrary if __GENKSYMS__ is defined, or use a macro instead of a
static inline for eor3()
