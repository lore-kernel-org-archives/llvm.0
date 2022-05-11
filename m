Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C653218
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 22:31:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id w19so5931511lfu.11
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 15:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fbUOy/LO7pce3syrWgaW4CEkFhXFi5vc0wZxMBvogMQ=;
        b=b252l7y6kIta/PlC/sxvJu7dt3E+UghECcSvUXYwF4kkihtszWpLzwdXtBPGpv5Y6j
         P1rdxKBxSO7vcvrTcBuE7FapkycaYlYze9EOHE9VPJbL4KMZgx2dtHF8MpxxlqxLp0EE
         DoJuYppCH6NfeB3ZHBWd9BvozYAA+tVIcOaJNbvz5ejIJh/yqF1DZ6Sb07UJGUgLb8Kb
         ZexJRIcTGCi7/R6ZGcE+prpQ5SUtlZCq53XEtdnuRmC5KVNRt3nDps6lDgzUVvSIB0xr
         ahjfrP5z+rRM5kNK+cD4e9om1Pj7E5GC+IlIybW5nCwwUYIcTUKV/xfOuBrvQ5V22s3k
         CADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fbUOy/LO7pce3syrWgaW4CEkFhXFi5vc0wZxMBvogMQ=;
        b=unMfOXZq3nCn+aHvWX7ZaFRR3Z59EYz+yD6qmWMTYgZ9FtvGUyUKmWkabOulqP0may
         xPoWGbsl+6SMTxVFEc8QMuYRf8uaBw0bvpPq0WaDWxmVelIxNw2/CyXW2R2ny+4yUgOH
         mdNfb7Ehw1rX8WLEXZ8ro9GqrsONr2iqLbPCyyMRKuuWDVzUTz0F7y+PCkkymb3YppLR
         wpWPGwz7OzD3VM6tHxaLs68oLdbD7ZhY05/3S/iWhiJbY0K7o1xPWOiqgUTX4vtcYITW
         KE8S2tEEueeXKVnVDfntCqcSQOq3AlaQXJwhXqGu0tLCqetfFrRxMKxXYangEBD1vV6C
         dXIg==
X-Gm-Message-State: AOAM530ia061qACW5Jn48439QIDRnyCaZROCkUaaNgmL/uAjvwfQ3Y5r
	sgPmJw4xOooUAOm3LmHfo1z8pqupJVzoq8fzOzjiUA==
X-Google-Smtp-Source: ABdhPJyrwg+caXPdLDJxrd+N/bnHoW3wXGl79dd3Ws8+i8WDRdA2wjLtLJ9Q7N0Q+nZdmhVnty5QrvsXc+kvgfzIxnA=
X-Received: by 2002:a19:4303:0:b0:473:f5fb:27b2 with SMTP id
 q3-20020a194303000000b00473f5fb27b2mr20535287lfa.626.1652308279822; Wed, 11
 May 2022 15:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511164514.2741934-1-masahiroy@kernel.org> <20220511164514.2741934-2-masahiroy@kernel.org>
In-Reply-To: <20220511164514.2741934-2-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 15:31:08 -0700
Message-ID: <CAKwvOdkMqyssbZ9imYM8Re+NL4U1K2tYj37_1XUtmjj8LSt5GQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] modpost: split the section mismatch checks into section-check.c
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Zijlstra <peterz@infradead.org>, linux-modules@vger.kernel.org, llvm@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 11, 2022 at 9:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> -/* sections that we do not want to do full section mismatch check on */
> -static const char *const section_white_list[] =
> -{
> -       ".comment*",
> -       ".debug*",
> -       ".cranges",             /* sh64 */
> -       ".zdebug*",             /* Compressed debug sections. */
> -       ".GCC.command.line",    /* record-gcc-switches */
> -       ".mdebug*",        /* alpha, score, mips etc. */
> -       ".pdr",            /* alpha, score, mips etc. */
> -       ".stab*",
> -       ".note*",
> -       ".got*",
> -       ".toc*",
> -       ".xt.prop",                              /* xtensa */
> -       ".xt.lit",         /* xtensa */
> -       ".arcextmap*",                  /* arc */
> -       ".gnu.linkonce.arcext*",        /* arc : modules */
> -       ".cmem*",                       /* EZchip */
> -       ".fmt_slot*",                   /* EZchip */
> -       ".gnu.lto*",
> -       ".discard.*",
> -       NULL
> -};


> -/**
> - * Whitelist to allow certain references to pass with no warning.
> - *
> - * Pattern 1:
> - *   If a module parameter is declared __initdata and permissions=0
> - *   then this is legal despite the warning generated.
> - *   We cannot see value of permissions here, so just ignore
> - *   this pattern.
> - *   The pattern is identified by:
> - *   tosec   = .init.data
> - *   fromsec = .data*
> - *   atsym   =__param*
> - *
> - * Pattern 1a:
> - *   module_param_call() ops can refer to __init set function if permissions=0
> - *   The pattern is identified by:
> - *   tosec   = .init.text
> - *   fromsec = .data*
> - *   atsym   = __param_ops_*
> - *
> - * Pattern 2:
> - *   Many drivers utilise a *driver container with references to
> - *   add, remove, probe functions etc.
> - *   the pattern is identified by:
> - *   tosec   = init or exit section
> - *   fromsec = data section
> - *   atsym = *driver, *_template, *_sht, *_ops, *_probe,
> - *           *probe_one, *_console, *_timer
> - *
> - * Pattern 3:
> - *   Whitelist all references from .head.text to any init section
> - *
> - * Pattern 4:
> - *   Some symbols belong to init section but still it is ok to reference
> - *   these from non-init sections as these symbols don't have any memory
> - *   allocated for them and symbol address and value are same. So even
> - *   if init section is freed, its ok to reference those symbols.
> - *   For ex. symbols marking the init section boundaries.
> - *   This pattern is identified by
> - *   refsymname = __init_begin, _sinittext, _einittext
> - *
> - * Pattern 5:
> - *   GCC may optimize static inlines when fed constant arg(s) resulting
> - *   in functions like cpumask_empty() -- generating an associated symbol
> - *   cpumask_empty.constprop.3 that appears in the audit.  If the const that
> - *   is passed in comes from __init, like say nmi_ipi_mask, we get a
> - *   meaningless section warning.  May need to add isra symbols too...
> - *   This pattern is identified by
> - *   tosec   = init section
> - *   fromsec = text section
> - *   refsymname = *.constprop.*
> - *
> - * Pattern 6:
> - *   Hide section mismatch warnings for ELF local symbols.  The goal
> - *   is to eliminate false positive modpost warnings caused by
> - *   compiler-generated ELF local symbol names such as ".LANCHOR1".
> - *   Autogenerated symbol names bypass modpost's "Pattern 2"
> - *   whitelisting, which relies on pattern-matching against symbol
> - *   names to work.  (One situation where gcc can autogenerate ELF
> - *   local symbols is when "-fsection-anchors" is used.)
> - **/

Losing the ability to git blame (from the top level) the above lines
does cause me grief and mental anguish though. It's not gone, just
buried a bit deeper.
-- 
Thanks,
~Nick Desaulniers
