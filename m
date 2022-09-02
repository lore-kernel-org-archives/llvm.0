Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E97E
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3wmDkHV8HYzOWhuknNT6kESrRfuVs+ZalyBRjyshycQ=; b=QOPYTLQQBdugxke0Jed5tVajAz
	BHPcuU41BYkmsix8MMuJUralRZ3s0p+44/b3ai+cSnTWEw1Gx9mur7o9Ms2j7PzjxJ5QyvBrAMeDf
	Fh9w3eCylClGKxuqaLtvAqJVbHRnqdJvQh4KRWzc6wmrt/ax6BPlHpLRLsy1myKQcs4xt5HljQDIK
	gvaG6z+LHA3AMZR6TKAaSx90YNElwX3eF0tLzTjKjjTma64WahqyKGk9Sgm25QgMVqbgq6FG6iUMk
	SdmCWero8BR0uy5sSyKM3rpnQAREjnY5thyFMsYtsOy9p30NuzvO/v3UOcRnsGSN8q3waHtImiccj
	vnyGe4yA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1So-008cEY-St; Fri, 02 Sep 2022 07:51:43 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2F7BB30010B;
	Fri,  2 Sep 2022 09:51:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E75CB2B852D7E; Fri,  2 Sep 2022 09:51:41 +0200 (CEST)
Date: Fri, 2 Sep 2022 09:51:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>, X86 ML <x86@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v4 00/21] KCFI support
Message-ID: <YxG2DUEBnIpAMKF2@hirez.programming.kicks-ass.net>
References: <20220830233129.30610-1-samitolvanen@google.com>
 <YxEh+pLyOyPalW1u@dev-arch.thelio-3990X>
 <CABCJKucP5nXGiCTTCEPUGYo5Z9A9qaQkJ6_kXTOfw-o-=TYH0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKucP5nXGiCTTCEPUGYo5Z9A9qaQkJ6_kXTOfw-o-=TYH0g@mail.gmail.com>

On Thu, Sep 01, 2022 at 05:33:29PM -0700, Sami Tolvanen wrote:

> > I do see a few new objtool warnings as well:
> >
> > vmlinux.o: warning: objtool: apply_relocate_add+0x34: relocation to !ENDBR: memcpy+0x0
> > vmlinux.o: warning: objtool: ___ksymtab+__memcpy+0x0: data relocation to !ENDBR: memcpy+0x0
> > vmlinux.o: warning: objtool: ___ksymtab+memcpy+0x0: data relocation to !ENDBR: memcpy+0x0
> 
> That's interesting. I can only reproduce this warning with
> allmodconfig+LTO, even though the relocation exists in all builds (the
> code makes an indirect call to memcpy) and memcpy (aliased to
> __memcpy) doesn't start with endbr. I'll have to take a closer look at
> why this warning only appears with LTO.

From just looking at the patches I'd say patch #19 breaks it. IIRC you
forgot to make the SYM_TYPED_FUNC things emit ENDBR.

Look at how x86/asm/linkage.h is overriding SYM_FUNC_START*().

You might have the same bug vs ARM64 BTI, they do the same thing.
