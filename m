Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EA9173
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 11:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E65C34605;
	Tue, 14 Dec 2021 11:36:27 +0000 (UTC)
Date: Tue, 14 Dec 2021 11:36:24 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] arm64/xor: use EOR3 instructions when available
Message-ID: <YbiBuI0XvpWXqbki@arm.com>
References: <20211213140252.2856053-1-ardb@kernel.org>
 <YbgDR461O9gCEi+Q@archlinux-ax161>
 <CAMj1kXFKuHuzsrDBcUjbaVO6-NQkj8J+vMty_qU3Y0pDwT905w@mail.gmail.com>
 <CAMj1kXGadU-_dM9OtXzy6OqKqReYyzEB-F6NVwDOEodpzwtemw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGadU-_dM9OtXzy6OqKqReYyzEB-F6NVwDOEodpzwtemw@mail.gmail.com>

On Tue, Dec 14, 2021 at 12:05:34PM +0100, Ard Biesheuvel wrote:
> On Tue, 14 Dec 2021 at 09:19, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > + Arnd
> >
> > On Tue, 14 Dec 2021 at 03:37, Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Hi Ard,
> > >
> > > On Mon, Dec 13, 2021 at 03:02:52PM +0100, Ard Biesheuvel wrote:
> > > > Use the EOR3 instruction to implement xor_blocks() if the instruction is
> > > > available, which is the case if the CPU implements the SHA-3 extension.
> > > > This is about 20% faster on Apple M1 when using the 5-way version.
> > > >
> > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Our CI reported that this patch as commit ce9ba49a2460 ("arm64/xor: use
> > > EOR3 instructions when available") in the arm64 tree breaks
> > > allyesconfig:
> > >
> > > https://github.com/ClangBuiltLinux/continuous-integration2/runs/4514540083?check_suite_focus=true
> > >
> > > I also see this when building with GCC 11.2.0:
> > >
> > > WARNING: modpost: EXPORT symbol "xor_block_inner_neon" [vmlinux] version ...
> > > Is "xor_block_inner_neon" prototyped in <asm/asm-prototypes.h>?
> > > aarch64-linux-gnu-ld: arch/arm64/lib/xor-neon.o: relocation R_AARCH64_ABS32 against `__crc_xor_block_inner_neon' can not be used when making a shared object
> >
> > I suspect this is another genksyms crash, preventing the
> > __crc_xor_block_inner_neon symbol from ever being emitted.
> >
> > This is a recurring annoyance and I am not sure how to address this
> > properly. Arnd might have some thoughts on the matter as well.
> 
> I managed to reproduce this: it's not a crash but definitely a bug in
> genksyms, as it simply fails to produce the output containing the
> assignment of __crc_xor_block_inner_neon.
> 
> Moving the definition of xor_block_inner_neon as below works around the issue.
> 
> Catalin: would you like me to spin a v3? Or do your prefer to just
> fold this into the existing one?

I'll fold it in. Thanks.

-- 
Catalin
