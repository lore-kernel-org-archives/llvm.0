Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E718F3FC7
	for <llvm@lists.linux.dev>; Mon,  4 Oct 2021 10:46:43 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b8so28544416edk.2
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IxNHYqpx71SK8KsCu4OkkYu0KJdlZ7YtGsY3wp3JnYA=;
        b=HMQLUmPKfVhqzx0IhQSd8/KHpfSiJaBjykG7tH17fIAsFWTwW0i2LNeydupuH5XK4u
         2tSC0wM3PvqmW8lWM1mMiA0r9VpRmRWU+7ouFJqZoN8S5H5Ej1531olM2MkYwsiTwRcE
         DWyrA0AI5d1S+ClfgbRH2HWI6c+WCVItVi21duczJ27mDaFBnUsmC5Lhs9Ygi5KhfO9x
         dqta/WOEifTF3Arw+Yz6KelSoGVqAahCQRwFAAry8C9micUtRgTUlC850FFx/AlHlUAP
         CuvDKWgxwUtXIwH8utaWAS4U0Jd0/2d6erOErbBUf5p8zhRSasXX0M54/x/pFFeNJ7Iu
         RmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IxNHYqpx71SK8KsCu4OkkYu0KJdlZ7YtGsY3wp3JnYA=;
        b=nCJwECfT5+nPUVdjh5NywxTFQLoWhHFyB50Zyz4u8/2rO6RiCDWidYU47CMXaoLqm7
         YaufBKI6DoFjBDOFcIOPvHXuWzKXdhpenOF7trw6Unqlny91ChJedWv/HUX5+yNIgCkH
         DK9xqgylnBwQEvEPp8gKqtbQ8gJ9J0Bx1brMld2rmdFKiLzzlKjx1zx+EtitAUcfxeUB
         F/W6xF4wMI4gw4AEGHCCyG9XTQj2VyVsddcHjjDyEGbQSLVKyTkatuYT18MQBp9NS2lN
         IN9S4+Hxsqk2CTTGCARJqSsY4YzrHETwbjK29STaFJl//vhQOVWF+fr69AkVRk1RnCvB
         WSoQ==
X-Gm-Message-State: AOAM533bO2X6I6hH9iySPGU1NuFdhG1frHNqEYuQA68pRLLsZDz3nezt
	PpqLtwW2BwTSz5M7bcL8hvJZjuRDXg/DofZFJvw=
X-Google-Smtp-Source: ABdhPJyYqRAk3TskMhMpUSaogTcj5/iexRMvU/Ie9auB6P+p2EkmJSp8B17AypHvmorRT/NOJq21bg==
X-Received: by 2002:a17:906:2708:: with SMTP id z8mr15848417ejc.309.1633344401849;
        Mon, 04 Oct 2021 03:46:41 -0700 (PDT)
Received: from pswork ([62.96.250.75])
        by smtp.gmail.com with ESMTPSA id r3sm335354ejr.79.2021.10.04.03.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 03:46:41 -0700 (PDT)
Date: Mon, 4 Oct 2021 12:46:40 +0200
From: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
To: ndesaulniers@google.com, Sami Tolvanen <samitolvanen@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>, "KE . LI" <like1@oppo.com>,
	Fangrui Song <maskray@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>, Jessica Yu <jeyu@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
	Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5] kallsyms: strip LTO suffixes from static functions
Message-ID: <20211004104640.GA27368@pswork>
References: <CABCJKue5Ay6_+8sibzh5wRh3gPzV1g72gJ9m2ot4E1ezj8bpHA@mail.gmail.com>
 <20211001195823.581937-1-ndesaulniers@google.com>
 <CABCJKufdncRjVLy9iq6fk8VbZrhyfr_rw0DiNwdJXkJrzxxGNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKufdncRjVLy9iq6fk8VbZrhyfr_rw0DiNwdJXkJrzxxGNg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Oct 01, 2021 at 01:05:44PM -0700, Sami Tolvanen wrote:
> On Fri, Oct 1, 2021 at 12:58 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Similar to:
> > commit 8b8e6b5d3b01 ("kallsyms: strip ThinLTO hashes from static
> > functions")
> >
> > It's very common for compilers to modify the symbol name for static
> > functions as part of optimizing transformations. That makes hooking
> > static functions (that weren't inlined or DCE'd) with kprobes difficult.
> >
> > LLVM has yet another name mangling scheme used by thin LTO.
> >
> > Combine handling of the various schemes by truncating after the first
> > '.'.  Strip off these suffixes so that we can continue to hook such
> > static functions.  Clang releases prior to clang-13 would use '$'
> > instead of '.'
> >
> > Link: https://reviews.llvm.org/rGc6e5c4654bd5045fe22a1a52779e48e2038a404c
> > Reported-by: KE.LI(Lieke) <like1@oppo.com>
> > Suggested-by: Fangrui Song <maskray@google.com>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Suggested-by: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
> > Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Changes v4 -> v5:
> > * Absorb Padmanabha Srinivasaiah's patch from
> >   https://lore.kernel.org/lkml/20210814124224.8551-1-treasure4paddy@gmail.com/.
> > * Add Padmanabha's Suggested-by tag.
> > * Rewrite the patch to truncate after first '.', as per Sami's comment
> >   from
> >   https://lore.kernel.org/lkml/CABCJKue5Ay6_+8sibzh5wRh3gPzV1g72gJ9m2ot4E1ezj8bpHA@mail.gmail.com/.
> > * Add Sami's Suggested-by tag.
> > * Verify that the '$' delimiter only appears for
> >   thin LTO + CFI + clang <= 12, use __clang_minor__ to check.
> > * Update comments as per Nathan + Fangrui, add their Suggested-by tags.
> > * While Nathan + Fangrui did review v4, v5 is too different IMO to carry
> >   those tags forward.
> >
> > Changes v3 -> v4:
> > * Convert this function to use IS_ENABLED rather than provide multiple
> >   definitions based on preprocessor checks.
> > * Add Nathan's suggested-by.
> >
> > Changes v2 -> v3:
> > * Un-nest preprocessor checks, as per Nathan.
> >
> > Changes v1 -> v2:
> > * Both mangling schemes can occur for thinLTO + CFI, this new scheme can
> >   also occur for thinLTO without CFI. Split cleanup_symbol_name() into
> >   two function calls.
> > * Drop KE.LI's tested by tag.
> > * Do not carry Fangrui's Reviewed by tag.
> > * Drop the inline keyword; it is meaningless.
> >
> >  kernel/kallsyms.c | 45 ++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 13 deletions(-)
> >
> > diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> > index 0ba87982d017..3e4766204b07 100644
> > --- a/kernel/kallsyms.c
> > +++ b/kernel/kallsyms.c
> > @@ -164,26 +164,45 @@ static unsigned long kallsyms_sym_address(int idx)
> >         return kallsyms_relative_base - 1 - kallsyms_offsets[idx];
> >  }
> >
> > -#if defined(CONFIG_CFI_CLANG) && defined(CONFIG_LTO_CLANG_THIN)
> > -/*
> > - * LLVM appends a hash to static function names when ThinLTO and CFI are
> > - * both enabled, i.e. foo() becomes foo$707af9a22804d33c81801f27dcfe489b.
> > - * This causes confusion and potentially breaks user space tools, so we
> > - * strip the suffix from expanded symbol names.
> > - */
> > -static inline bool cleanup_symbol_name(char *s)
> > +static bool cleanup_symbol_name(char *s)
> >  {
> >         char *res;
> >
> > +       if (!IS_ENABLED(CONFIG_LTO_CLANG))
> > +               return false;
> > +
> > +       /*
> > +        * LLVM appends various suffixes for local functions and variables that must
> > +        * be promoted to global scope as part of LTO.  This can break hooking of
> > +        * static functions with kprobes. '.' is not a valid character in an
> > +        * identifier in C. Suffixes observed:
> > +        * - foo.llvm.[0-9a-f]+
> > +        * - foo.[0-9a-f]+
> > +        * - foo.[0-9a-f]+.cfi_jt
> > +        */
> > +       res = strchr(s, '.');
> > +       if (res) {
> > +               *res = '\0';
> > +               return true;
> > +       }
> > +
> > +       if (!IS_ENABLED(CONFIG_CFI_CLANG) || !IS_ENABLED(CONFIG_LTO_CLANG_THIN) ||
> > +           __clang_major__ >= 13)
> > +               return false;
> > +
> > +       /*
> > +        * Prior to LLVM 13, the following suffixes were observed when thinLTO
> > +        * and CFI are both enabled:
> > +        * - foo$[0-9]+
> > +        */
> >         res = strrchr(s, '$');
> > -       if (res)
> > +       if (res) {
> >                 *res = '\0';
> > +               return true;
> > +       }
> >
> > -       return res != NULL;
> > +       return false;
> >  }
> > -#else
> > -static inline bool cleanup_symbol_name(char *s) { return false; }
> > -#endif
> 
> Thanks for sending the patch, Nick. This looks correct to me.
> 
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> 
> Sami

Nick, Thanks for absorbing the patch and sharing same.
Sami, Thanks for reviewing and yours inputs
