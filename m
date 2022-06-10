Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328B7C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 23:40:29 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id j20so663384ljg.8
        for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TS2dWkXH8XlZd5sL60zfsL+sc90yCJgLJMyjv2lHnXE=;
        b=oHik6Hczo89wBPZ/dDgD5TFhvpe+fyOMAOoTAMjJs65nr0gDLGEPoSsraJU0Q7oOtM
         O2ukn6J/kan5d1pizuTACOyL4AJMqq0TFSLAp9Nt2lKgu3kqQZW9UxvT0qNjLOLxVo2L
         VdOGNPR6TPWNd/CtXdpIJ7N2EBt48nIvTZG9aKik7rJCTjhAkUV4z93XCIDKCDjjb4xr
         Eka0ieDZibKew3gntWlhI1epJPmtu91/TEYdSYVyLPLxmXVPx/Ud5NTxrwHMoq7M8LXI
         Yay127WCX0aUnUu0ll1oXJYUbRIJB+uwqsk/wtall2ha0sXClujatVgr8lf3Ylw7R7On
         8Sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TS2dWkXH8XlZd5sL60zfsL+sc90yCJgLJMyjv2lHnXE=;
        b=CORnScUVTXtqnRGHqytS62BcfMsC+BeImiw46FU5ZAU55CV3JbAsC8+fpICTcj+Ju7
         /S1+79GEtbS3Oc9/X9E/hVXv5Yj+RplRxpw/MS/o7CW/oUxrVJnA+h7QpDpM9RK/ZD1B
         x7udfuEEEs/hwysPaUHe/1Y0zd56ojAD9Od7TraWK2DMtG3JBki8R1SkNzk5cWwcKG1j
         K6D+gb9dv5UDKbWM9fYZbnoScxf8MIvfjwJku2Bbn1h/O+vm5P9CnPmsheVKPt5s9yy9
         s/RHkRxqSsGiNMHg++kGxDXLTGyvrI/bKs/W3o6RlrHSPp6/I/ghnRRK9yqH0ra2W0zy
         1nrQ==
X-Gm-Message-State: AOAM532eDdigvGg7qhWi6oKD9GAcSVq7JJivkVDcpvdi+GuV/34ohsT3
	VXAcubddlGwPYvCNRwRO6sNRtFyyCHv3JwxvZMoehw==
X-Google-Smtp-Source: ABdhPJw86FbfqG8WmSA2UZEs9tshGtQTRPcCpdyUo1Eq8v8++ykofWmHBq3OGcBcqBQ711Hi3BEoaiAVfzLB2UfnGtw=
X-Received: by 2002:a2e:7802:0:b0:258:e918:23f0 with SMTP id
 t2-20020a2e7802000000b00258e91823f0mr2695378ljc.400.1654904427866; Fri, 10
 Jun 2022 16:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com> <20220610233513.1798771-17-samitolvanen@google.com>
In-Reply-To: <20220610233513.1798771-17-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 10 Jun 2022 16:40:16 -0700
Message-ID: <CAKwvOdm1Abmu+NQ82ZLgX3O5g4vYPni23A9c4FJ+xeSYVwPtJw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 16/20] kallsyms: Drop CONFIG_CFI_CLANG workarounds
To: Sami Tolvanen <samitolvanen@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 10, 2022 at 4:35 PM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> With -fsanitize=kcfi, the compiler no longer renames static
> functions with CONFIG_CFI_CLANG + ThinLTO. Drop the code that cleans
> up the ThinLTO hash from the function names.

Good riddance!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  kernel/kallsyms.c | 17 -----------------
>  1 file changed, 17 deletions(-)
>
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index fbdf8d3279ac..2fbb94817e02 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -179,7 +179,6 @@ static bool cleanup_symbol_name(char *s)
>          * character in an identifier in C. Suffixes observed:
>          * - foo.llvm.[0-9a-f]+
>          * - foo.[0-9a-f]+
> -        * - foo.[0-9a-f]+.cfi_jt
>          */
>         res = strchr(s, '.');
>         if (res) {
> @@ -187,22 +186,6 @@ static bool cleanup_symbol_name(char *s)
>                 return true;
>         }
>
> -       if (!IS_ENABLED(CONFIG_CFI_CLANG) ||
> -           !IS_ENABLED(CONFIG_LTO_CLANG_THIN) ||
> -           CONFIG_CLANG_VERSION >= 130000)
> -               return false;
> -
> -       /*
> -        * Prior to LLVM 13, the following suffixes were observed when thinLTO
> -        * and CFI are both enabled:
> -        * - foo$[0-9]+
> -        */
> -       res = strrchr(s, '$');
> -       if (res) {
> -               *res = '\0';
> -               return true;
> -       }
> -
>         return false;
>  }
>
> --
> 2.36.1.476.g0c4daa206d-goog
>


-- 
Thanks,
~Nick Desaulniers
