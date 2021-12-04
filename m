Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5308668
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 08:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0429AC341C5
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638606717;
	bh=sjxIy15k4SzsvZ32dYqzU6rAx1xmDB5EFetzASD4t8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ezgqixWE+HzC1481DeCRSEzFgzUsYiRrBsx8GNdPbuJi4ujkmIOZ+zMLKuQldHnS4
	 36mrs5SVuwDGB+AY42Y5F0fCRu0rOAanIVAI61cBNvrLUsc4YD9UM/5pPqUmlkk5kB
	 J+4ThwRtNWiXl5mXDPA4g433hCE/gECcvYmMiSviVodPgnEIAd/A5qcxmkZ/ZViOSt
	 3OP9DlcWKSqZQe18bE1tDKprVXcCPHmqj+E9GbyuWHvd2Gs8VqENS0Op1l5ycvCHWr
	 4aYQGRM1bE9X91zQmcoMof00p/pfqvYgpdjCIvg8k5TFPUo1CvZ4DUTq9zJwxyRlsL
	 t3kIanML7B4hg==
Received: by mail-oi1-f182.google.com with SMTP id bj13so10698554oib.4
        for <llvm@lists.linux.dev>; Sat, 04 Dec 2021 00:31:56 -0800 (PST)
X-Gm-Message-State: AOAM533I+8J233HuQ2nZaI5lWPsNt1CVSzfNbApdV9MRlp1KQYox3d/i
	OOExpOhNjgARHrkMTfgPikV0FbjPUYrYFPv5ipA=
X-Google-Smtp-Source: ABdhPJyn4NdGHzLPLyNqpl1/AkUOXDqgnkodOajUO6/cACrbmxliVgYb+PBdbCBD0mfwx7JzHi4Aryi8jeqgWKgstGY=
X-Received: by 2002:a05:6808:1919:: with SMTP id bf25mr14503710oib.33.1638606705790;
 Sat, 04 Dec 2021 00:31:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211202223214.72888-1-alexandr.lobakin@intel.com>
 <20211202223214.72888-6-alexandr.lobakin@intel.com> <Yanm6tJ2obi1aKv6@hirez.programming.kicks-ass.net>
 <20211203141051.82467-1-alexandr.lobakin@intel.com> <20211203163424.GK16608@worktop.programming.kicks-ass.net>
 <28856p61-r54s-791n-q6s1-27575s62r2q9@syhkavp.arg>
In-Reply-To: <28856p61-r54s-791n-q6s1-27575s62r2q9@syhkavp.arg>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 4 Dec 2021 09:31:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG-+d-ak9od9z-VxOk9Y+fp_KDSbLP=ns_ZfVEXjrzKsg@mail.gmail.com>
Message-ID: <CAMj1kXG-+d-ak9od9z-VxOk9Y+fp_KDSbLP=ns_ZfVEXjrzKsg@mail.gmail.com>
Subject: Re: [PATCH v8 05/14] x86: conditionally place regular ASM functions
 into separate sections
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Alexander Lobakin <alexandr.lobakin@intel.com>, 
	linux-hardening@vger.kernel.org, X86 ML <x86@kernel.org>, 
	Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Kristen Carlson Accardi <kristen@linux.intel.com>, Kees Cook <keescook@chromium.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Tony Luck <tony.luck@intel.com>, 
	Bruce Schlobohm <bruce.schlobohm@intel.com>, Jessica Yu <jeyu@kernel.org>, 
	kernel test robot <lkp@intel.com>, Miroslav Benes <mbenes@suse.cz>, 
	Evgenii Shatokhin <eshatokhin@virtuozzo.com>, Jonathan Corbet <corbet@lwn.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Marios Pomonis <pomonis@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	live-patching@vger.kernel.org, llvm@lists.linux.dev, hjl.tools@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Dec 2021 at 20:46, Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Fri, 3 Dec 2021, Peter Zijlstra wrote:
>
> > On Fri, Dec 03, 2021 at 03:10:51PM +0100, Alexander Lobakin wrote:
> > > From: Peter Zijlstra <peterz@infradead.org>
> > > Date: Fri, 3 Dec 2021 10:44:10 +0100
> > >
> > > > On Thu, Dec 02, 2021 at 11:32:05PM +0100, Alexander Lobakin wrote:
> > > > > Use the newly introduces macros to create unique separate sections
> > > > > for (almost) every "regular" ASM function (i.e. for those which
> > > > > aren't explicitly put into a specific one).
> > > > > There should be no leftovers as input .text will be size-asserted
> > > > > in the LD script generated for FG-KASLR.
> > > >
> > > > *groan*...
> > > >
> > > > Please, can't we do something like:
> > > >
> > > > #define SYM_PUSH_SECTION(name)    \
> > > > .if section == .text              \
> > > > .push_section .text.##name        \
> > > > .else                             \
> > > > .push_section .text               \
> > > > .endif
> > > >
> > > > #define SYM_POP_SECTION() \
> > > > .pop_section
> > > >
> > > > and wrap that inside the existing SYM_FUNC_START*() SYM_FUNC_END()
> > > > macros.
> > >
> > > Ah I see. I asked about this in my previous mail and you replied
> > > already (: Cool stuff, I'll use it, it simplifies things a lot.
> >
> > Note, I've no idea if it works. GAS and me aren't really on speaking
> > terms. It would be my luck for that to be totally impossible, hjl?
>
> Surely this would do it:
>
> http://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=451133cefa839104
>

That seems rather useful, actually. It will also fix a problem with
subsections, which are sometimes difficult to construct from a macro,
as they cannot be created using pushsection/popsection unless you know
the current section name, and the alternative syntax (.subsection /
.previous) does not permit nesting. This makes their use from a macro
risky, given that it may not be obvious to the macro's caller that it
uses a subsection under the hood.
