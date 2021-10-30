Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C2B2C81
	for <llvm@lists.linux.dev>; Sat, 30 Oct 2021 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oOr5b74ov6pX5O7+DCjQEMYj0/uvSmNv3j5bSHbVk/Y=; b=Q0jrwA1BtOPvifDot7sLVzALrr
	5w2Kylbc2r22f7iEsNXzEX6AT/3HxBNm0LMqEAJAOEmr7uRJrYXcORSVEDA/E1lXBf9hWjsvkUlmC
	5v6AVq5S177j7kg3fnYFrMKxKCIecEtrHL7yKLXtOGo1wZ1lWzWd612sBpcH56zc1ztPNmRvg+vIS
	jS5A74DKguVtKjuW9C73c2SAXrw7K707NJCSMtfjFt8Bt9qPC2tONdKD6jGraG2aZnTIZpSeZARjH
	eHbS3R9gisuI0wuUFhDcN2AKZa7NWkBlLHR0quvnofl9phNbrCqW0sbYEhktRy5gY1PGAB1gPqyrG
	MDBAEd8A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgsgt-00DGXT-TK; Sat, 30 Oct 2021 18:02:52 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id DB2EB9816BA; Sat, 30 Oct 2021 20:02:49 +0200 (CEST)
Date: Sat, 30 Oct 2021 20:02:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, X86 ML <x86@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] static_call,x86: Robustify trampoline patching
Message-ID: <20211030180249.GU174703@worktop.programming.kicks-ass.net>
References: <CAMj1kXEx10gC8eH7rV-GbZZj2M3uDue6HYsKb+A5J01zOxm_FA@mail.gmail.com>
 <20211027124852.GK174703@worktop.programming.kicks-ass.net>
 <YXlOd1lyKZKAcJfA@hirez.programming.kicks-ass.net>
 <CAMj1kXHKh7wv6JqusVnoiQDMm7ApFq2ujzbfWmM9AzLKFehhAA@mail.gmail.com>
 <YXlcMluaysPBF92J@hirez.programming.kicks-ass.net>
 <CAMj1kXECTdDLVMk2JduU5mV2TR0Cv=hZ9QOpYRsRM1jfvvNikw@mail.gmail.com>
 <CABCJKufpS4jJxHqk8=bd1JCNbKfmLDKBbjbhjrar2+YQJFiprg@mail.gmail.com>
 <20211029200324.GR174703@worktop.programming.kicks-ass.net>
 <20211030074758.GT174703@worktop.programming.kicks-ass.net>
 <CAMj1kXEJd5=3A_6Jhd4UU-TBGarnHo5+U76Zxxt7SzXsWp4CcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEJd5=3A_6Jhd4UU-TBGarnHo5+U76Zxxt7SzXsWp4CcA@mail.gmail.com>

On Sat, Oct 30, 2021 at 07:19:53PM +0200, Ard Biesheuvel wrote:
> I just realized that arm64 has the exact same problem, which is not
> being addressed by my v5 of the static call support patch.

Yeah, it would.

> As it turns out, the v11 Clang that I have been testing with is broken
> wrt BTI landing pads, and omits them from the jump table entries.
> Clang 12+ adds them properly, which means that both the jump table
> entry and the static call trampoline may start with BTI C + direct
> branch, and we also need additional checks to disambiguate.

I'm not sure, why would the static_call trampoline need a BTI C ? The
whole point of static_call() is to be a direct call, we should never
have an indirect call to the trampoline, that would defeat the whole
purpose.
