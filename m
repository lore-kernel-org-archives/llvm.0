Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0153D90
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 07:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MEwOrql2CJ8ARZnwIYvEKozhyGDGiEqWcdZBHjO1eK4=; b=BKnAtAgBdBYP6A5mxCfLXR4gjN
	A/aRGwIT14O8GtCkN+n6oFDsI5YuuzJAEZXUyPhAce1YRKe2OfmOIg8nIesAIAr+hVeP5ytMS//1V
	YU1UH5bk/cTQATcd5xDpOQ/n9QtUq9i8EL1UEYxPkQxb6ecekqAKtPI1F7++7uZioqUMQfuNxD+3v
	dAoQAvi4iDz+A8fT+taz6vE8je1IO24zLrnJGmxk3B3j1iQ2i4ISvdSFdzX5QoIai2sFzvcpP1Itm
	W8J1R2tR98dAkWwcBtVyUhK+YBiPPO5h8JcHxy71u5oB9yvkccrG9zQrjedNEAXDkhK4HWT2NYkbj
	vkq333pw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qjE5Q-00AXQj-Cs; Thu, 21 Sep 2023 07:26:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 915B23002E3; Thu, 21 Sep 2023 09:26:55 +0200 (CEST)
Date: Thu, 21 Sep 2023 09:26:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fangrui Song <maskray@google.com>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] x86/speculation, objtool: Use absolute relocations for
 annotations
Message-ID: <20230921072655.GA14803@noisy.programming.kicks-ass.net>
References: <20230920001728.1439947-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920001728.1439947-1-maskray@google.com>

On Tue, Sep 19, 2023 at 05:17:28PM -0700, Fangrui Song wrote:
> .discard.retpoline_safe sections do not have the SHF_ALLOC flag.  These
> sections referencing text sections' STT_SECTION symbols with PC-relative
> relocations like R_386_PC32 [0] is conceptually not suitable.  Newer
> LLD will report warnings for REL relocations even for relocatable links
> [1].
> 
>     ld.lld: warning: vmlinux.a(drivers/i2c/busses/i2c-i801.o):(.discard.retpoline_safe+0x120): has non-ABS relocation R_386_PC32 against symbol ''

What, why ?!? Please explain more.

> Switch to absolute relocations instead, which indicate link-time
> addresses.  In a relocatable link, these addresses are also output
> section offsets, used by checks in tools/objtool/check.c.  When linking
> vmlinux, these .discard.* sections will be discarded, therefore it is
> not a problem that R_X86_64_32 cannot represent a kernel address.
> 
> Alternatively, we could set the SHF_ALLOC flag for .discard.* sections,
> but I think non-SHF_ALLOC for sections to be discarded makes more sense.
> 
> Note: if we decide to never support REL architectures (e.g. arm, i386),

We have explicit support for REL (as opposed to RELA) architectures, so
I don't think we can do that.

