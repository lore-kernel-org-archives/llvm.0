Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A27D3EA973;
	Thu,  2 Jul 2026 11:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990963; cv=none; b=f1JL82bkZFbIHzN1P6DEUdWfMlaHq4Vuch+jX9htsZO0Ayk4pssYrYAmFsa0DZqc2LAcy1nTRC7LBAW72ql4yCdZRfX1Rgee8g1gwiTg/sUg86L4LqfyTjG2kdMqWg0qbpWPUPq4jfbEZ2z+GJMQqiAO2MYvyVo4crEhszP3C64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990963; c=relaxed/simple;
	bh=+j7Dg+4wLyRRgyNcRm06Vf9B4Ztj0vLLV32bRyxicNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4EaMQ79hYG2zisi0oOil3Awuw19mDlmzCLNSSGLGXtr2VfjRw1RblCfPXQ7flgpPXEGY745MdSI3Up26XBFFkVe81ND1lrLPIsolijCyRi0U6YisNvr2G0lKMN9z2AKN8VQl3VGobk81FQKGxweo7+I75tc2GQT8nH3gtFFkEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mdqxxHTW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mdqxxHTW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ep/0PW5gCyrjG/ZsuNrOyeJriCOwvC2nXxxw3HQJfIE=; b=mdqxxHTWWGx8W6NSWKl1Q9il3e
	psxJEqB/CablNpkmxcqKk0Yl/2vkEiCCWPMPXrKrR9wFZ3Tv1+Nd7jtHrAj44I1xs9vEOawLwPLMK
	OaB57OL4gAId5tFQ137y8jM7mO/iIU27E2RdS68VQhuhslcEEIfN0s8YM495K0uHqNiDTfkbJCwa2
	Jj2mbic2xu9x8o1MtlekzpGVTdU9lfDe4RvY10dY/ZJcYHSYLh9BUFygZTJJf3HgCZ/Z6qER0xZ3S
	EfSpV9zJ0fnMZkNs96+eWfSLhAZx/StSSsJNj+Qz0hfqXSIOYrTNLG5Kus/CFVcDFi1bjupICGqwo
	eWG8gNGA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFOZ-00000008QVD-2jHo;
	Thu, 02 Jul 2026 11:15:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 93272300128; Thu, 02 Jul 2026 13:15:50 +0200 (CEST)
Date: Thu, 2 Jul 2026 13:15:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dmitry Voytik <voytikd@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-toolchains@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
Message-ID: <20260702111550.GH751831@noisy.programming.kicks-ass.net>
References: <20260701125151.352632-1-voytikd@gmail.com>
 <20260702025342.GJakXStrsCmIRnEwFD@fat_crate.local>
 <CAAX90H0V-=Gy1FyBT9qop2=RvhBxbOPLu6+DYpPH2pTehT=nRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAX90H0V-=Gy1FyBT9qop2=RvhBxbOPLu6+DYpPH2pTehT=nRw@mail.gmail.com>

On Thu, Jul 02, 2026 at 12:41:09PM +0200, Dmitry Voytik wrote:
> Hi Borislav,
> 
> On Thu, Jul 2, 2026 at 4:54 AM Borislav Petkov <bp@alien8.de> wrote:
> >
> > On Wed, Jul 01, 2026 at 02:51:51PM +0200, Dmitry Voytik wrote:
> > > This patch fixes broken builds with defconfig + CONFIG_KMSAN +
> > > CONFIG_DEBUG_INFO_*.
> > >
> > > To reproduce the issue before the fix:
> > >   make mrproper
> > >   make LLVM=1 defconfig
> > >   ./scripts/config -e CONFIG_KMSAN \
> > >     -e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > >   make LLVM=1 olddefconfig
> > >   make LLVM=1 -j(nproc) vmlinux
> > >   ...
> > >     LD      vmlinux.o
> > >   vmlinux.o: warning: objtool: folio_zero_user+0x801: undefined stack state
> > >   vmlinux.o: error: objtool: folio_zero_user+0x801: unknown CFA base reg -1
> > >   make[2]: *** [scripts/Makefile.vmlinux_o:76: vmlinux.o] Error 255
> > >
> > > objtool in verbose mode shows how the frame pointer is omitted:
> > >   make LLVM=1 OBJTOOL_VERBOSE=1 -j(nproc) vmlinux
> > >   ...
> > >   b15a2c:  folio_zero_user+0x7fc      xor    %eax,%eax
> > >   b15a2e:  folio_zero_user+0x7fe      mov    %rcx,%rsp
> > >   b15a31:  folio_zero_user+0x801      mov    %r14,%rdi
> > >   b15a34:  folio_zero_user+0x804      mov    %rbx,%rcx
> > >   b15a37:  folio_zero_user+0x807      call   0xb15a3c <__clear_pages_unrol
> > >
> > > After the fix, the frame pointer is back:
> > >   b15a37: 31 c0                       xor    %eax,%eax
> > >   b15a39: 48 89 ec                    mov    %rbp,%rsp
> > >   b15a3c: 4c 89 f7                    mov    %r14,%rdi
> > >   b15a3f: 48 89 d9                    mov    %rbx,%rcx
> > >   b15a42: e8 00 00 00 00              call   b15a47 <folio_zero_user+0x817>
> > >
> > > It seems the issue was introduced by
> > > commit 54a6b89a3db2 ("x86/mm: simplify clear_page_*")
> > >
> > > The actual fix is to revert the change how ASM_CALL_CONSTRAINT is
> > > positioned.
> >
> > Why?
> >
> > Where does it say that the current stack ptr dependency needs to be the first
> > asm input operand?
> 
> Very good question. My uneducated guess - bugs in clang.
> Out of curiosity, I compared (see below) what clang and gcc do when
> ASM_CALL_CONSTRAINT moves around, and it indeed affects generated
> code, which is weird.
> I might just be holding it wrong, like optimization must be on, etc.
> 
> > If that were the case, we have a bunch more of those bugs around the tree.
> 
> At least, it makes objtool happy for the defconfig + KMSAN.

Yeah, for all the wrong reasons. AFAICT it is one clang bug causing
another clang bug to manifest less onerous.

This ASM_CALL_CONSTRAINT placement is, for some reason, forcing a stack
frame (which is not in fact required), but having a stack frame then
avoids the absolutely retarded:

	mov %rsp, %rcx;
1:	mov %rcx, %rsp
	...
	mov %rsp, disp(%rsp)
	call __msam_foo
	mov disp(%rsp), %rcx
	test
	je 1b

construct. Becaus having the stack frame (rbp) then makes all the rsp
juggling less of a problem.

So on the one hand the __msan 'functions' are special annotated in clang
to force re-align the stack. Then it notices the stack is already
properly aligned and the actual stack alignment code goes missing, BUT
it keeps the save/restore rsp (for raisins). It then furher compounds
the failure by spilling the RSP copy onto the stack, and voila, total
and utter insanity.

I suspect you can simply remove that magic annotate for KMSAM, kernel
stacks are always aligned, there no point, what-so-ever, to do the whole
save/align/restore thing.

There is also this thread from last year, which looks to be a
similar/same problem:

  https://lore.kernel.org/174108458405.14745.4864877018394987266.tip-bot2@tip-bot2

those patches never made it in, Josh was going to rework, but that never
quite happened either.

And I think we need to, at least temporarily, deal with this, until a
fixed clang is released and we can make KMSAN depend on that version,
but I worry about the impact of this change on !KMSAN builds.

A quick test with folio_zero_user() seems to suggest the
ASM_CALL_CONSTRAINT movement (your patch) generates the same code for
defconfg as does the unmodified code. The change from the thread linked
above (input constraint on __builtin_frame_address(0)) generates
different code.

A third option is to force FRAME_POINTER=y for KMSAN builds -- for now,
until clang is taught to be less insane.
