Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB65D1FC7
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KwpwEmg3Ay1xR1OpUdJFEpmOJDMHbZm34VOni0D55fE=; b=bxlC7Hk92JLtUG4P6uFvkF7ZwT
	vV5rij/EihMTPNuwhQTsQAced9u7zDEOR0fWZpIPvIIvrQj34YxJ165OYQeezvzA2OyHHwr1u4LPD
	2YDycurAhC69LeI7uOc7aUsrNn1ACcbOpIjL3AgPwTecM99I1r/0iNCo2zm4QYOC4dAJ0SJse8CV8
	Cl2J4CZhJzSMEHdke3Ez9Zf2AO6gPBgzAq5qnVDIpGSkD3KadBZqlloUf/huUnvlOQlnSAiXGgmOL
	9NXiA4XzKLSYk0o+ZDFfqv9extucWJOaiZq9tcqIHKApT2yei6Fbc9AzeUcwt5POhEElpYxowOLpm
	+oD0CeBg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKJMH-00AIir-8L; Wed, 16 Feb 2022 12:24:33 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 08BA9986ACA; Wed, 16 Feb 2022 13:24:30 +0100 (CET)
Date: Wed, 16 Feb 2022 13:24:29 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <keescook@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Joao Moreira <joao@overdrivepizza.com>, X86 ML <x86@kernel.org>,
	hjl.tools@gmail.com, Josh Poimboeuf <jpoimboe@redhat.com>,
	andrew.cooper3@citrix.com, LKML <linux-kernel@vger.kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
Message-ID: <20220216122429.GB86719@worktop.programming.kicks-ass.net>
References: <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com>
 <202202082003.FA77867@keescook>
 <9ea50c51ee8db366430c9dc697a83923@overdrivepizza.com>
 <20220211133803.GV23216@worktop.programming.kicks-ass.net>
 <CABCJKuciRBnz4JxBDJC=+kuJn4pU2uBkWPBov7-VL2o2j0F4SA@mail.gmail.com>
 <20220214222550.GB23216@worktop.programming.kicks-ass.net>
 <CABCJKuf-wouSCh4u43GPQHPPgG=mqOGboSoHPQRfmgQSBkFrMg@mail.gmail.com>
 <202202151129.1A5C5FE42@keescook>
 <20220215210550.GD23216@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215210550.GD23216@worktop.programming.kicks-ass.net>

On Tue, Feb 15, 2022 at 10:05:50PM +0100, Peter Zijlstra wrote:

> > Peter, is there a reason you want things in the specific order of:
> > 
> > cmp, je-to-call, trap, call
> > 
> > Isn't it more run-time efficient to have an out-of-line failure of
> > the form:
> > 
> > cmp, jne-to-trap, call, ...code..., trap, jmp-to-call
> > 
> > I thought the static label stuff allowed the "default out of line"
> > option, as far as pessimizing certain states, etc? The former is certainly
> > code-size smaller, though, yes, but doesn't it waste space in the cache
> > line for the unlikely case, etc?
> 
> Mostly so that we can deduce the address of the trap from the retpoline
> site, also the above has a fairly high chance of using jcc.d32 which is
> actually larger than jcc.d8+ud2.

Also; and I think I mentioned this a few emails back, by having the
whole CFI thing as a single range of bytes it becomes easier to patch.
