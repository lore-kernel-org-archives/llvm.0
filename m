Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F602C80
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 16:51:41 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id p13so3472185pfw.2
        for <llvm@lists.linux.dev>; Fri, 03 Dec 2021 08:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gwi5v9qtUWNkWjS5o3WH11GAvDMXz6rWxjTjENaT30s=;
        b=LZeUpNxTPd0EXcLHcrWRi/2ayZQyrQjvM+/qr0rP8vFQqb4dFzLJtXIAS8fhWqfz9f
         u1oWDEobPzQQtl4sAxYhAzVcUlTaSIdS/RN3TsMo2tPjWsg6/O5irwdrxi/yr89yu50E
         6zskiZouyvljrobD5PWLduCSy0zTsly404ZX7IJBw2DNkxnYqZeUyRBRrsWpTcMd+ZOe
         u1/GkzbymXp1qYCuYPt3RFusJEn7GGYcymFLp6jRYiwZj4ZIHFEnMEUeMVwsO29ud72z
         rJ/Dqy8ky6YIag0E1te+Aq274vMY7wxxiQdKiWqUxQ3ikCW0Z7IXRKTPyUha8nqjTSIW
         8OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gwi5v9qtUWNkWjS5o3WH11GAvDMXz6rWxjTjENaT30s=;
        b=qdBRIviPStHIGbSbdhuCQkVScDXBfKuV0ApV/R0kwa+CUUvFDFbyM8UPZaLgdOJ8jm
         JE9AE8nDxIU5GAG6Xik70yiw2jQMaVaQrnaztjoWqnYC9HX9/jNNDQ6xhTbnU5NP3/5m
         /h3PjNz4hz48TWS3J3t/c2FHG0vMG8zRR8uPG3sMmNytXodWf3cC+TgiOznwsrd2H7CD
         63fY1pg3ZS8PuVq/eBFwgK1gY4YhBXaXRh+/MJCIyHOyrxYTPboLh+hmYGCLOGScmq5V
         UVhevNaBIwnoPQFITX+T8jAvCnR1TZug2PA9wfVMARF43LDY3g8HoiK8pNNierWQy9GX
         Y61Q==
X-Gm-Message-State: AOAM531a/nm85ekAP/1QCPiHt/lKqpr5cFydmxGF7ZU50E5ea59avNsB
	oLUfvmqMu7onPCsXtq4KGM/ZTWrPyW/EPQTQJm4=
X-Google-Smtp-Source: ABdhPJzpOHOaaZjZjKrJWMwkfziEkarJeedQt9d36XOYqS8Ki8b+NdSRElS4KnL2lchHl3m6MaWEIlKOo0gdxOnjdrc=
X-Received: by 2002:a63:4f42:: with SMTP id p2mr5374964pgl.381.1638550300680;
 Fri, 03 Dec 2021 08:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211202223214.72888-1-alexandr.lobakin@intel.com>
 <20211202223214.72888-6-alexandr.lobakin@intel.com> <Yanm6tJ2obi1aKv6@hirez.programming.kicks-ass.net>
 <20211203141051.82467-1-alexandr.lobakin@intel.com> <20211203163424.GK16608@worktop.programming.kicks-ass.net>
In-Reply-To: <20211203163424.GK16608@worktop.programming.kicks-ass.net>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Fri, 3 Dec 2021 08:51:04 -0800
Message-ID: <CAMe9rOrVnb3oVRn5igjwimBbE6QH-v0tuHk-kjRz7osbJMQd1w@mail.gmail.com>
Subject: Re: [PATCH v8 05/14] x86: conditionally place regular ASM functions
 into separate sections
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>, linux-hardening@vger.kernel.org, 
	"the arch/x86 maintainers" <x86@kernel.org>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Kristen Carlson Accardi <kristen@linux.intel.com>, Kees Cook <keescook@chromium.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>, 
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
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	live-patching@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 8:34 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Dec 03, 2021 at 03:10:51PM +0100, Alexander Lobakin wrote:
> > From: Peter Zijlstra <peterz@infradead.org>
> > Date: Fri, 3 Dec 2021 10:44:10 +0100
> >
> > > On Thu, Dec 02, 2021 at 11:32:05PM +0100, Alexander Lobakin wrote:
> > > > Use the newly introduces macros to create unique separate sections
> > > > for (almost) every "regular" ASM function (i.e. for those which
> > > > aren't explicitly put into a specific one).
> > > > There should be no leftovers as input .text will be size-asserted
> > > > in the LD script generated for FG-KASLR.
> > >
> > > *groan*...
> > >
> > > Please, can't we do something like:
> > >
> > > #define SYM_PUSH_SECTION(name)      \
> > > .if section == .text                \
> > > .push_section .text.##name  \
> > > .else                               \
> > > .push_section .text         \
> > > .endif
> > >
> > > #define SYM_POP_SECTION()   \
> > > .pop_section
> > >
> > > and wrap that inside the existing SYM_FUNC_START*() SYM_FUNC_END()
> > > macros.
> >
> > Ah I see. I asked about this in my previous mail and you replied
> > already (: Cool stuff, I'll use it, it simplifies things a lot.
>
> Note, I've no idea if it works. GAS and me aren't really on speaking
> terms. It would be my luck for that to be totally impossible, hjl?

What exactly do you want assembler to do?

-- 
H.J.
