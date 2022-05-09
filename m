Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E3A1FC0
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 17:09:11 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id b18so24932422lfv.9
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qmNh/UlR00KzKm2embL/8KXGrDJlEF5LNSh8Qse0tHI=;
        b=XlxYVyti/+Q7NqrSdb22SAIl6Y2j55Yg5g2k37ctvzV1ktFvUd3+GBrrXaqN+9NFeY
         6EJHldsP4pwcrjQ2xzBRUlRSmr1Qray+IZ0Azb6pH9oGWAA6cH1MqKDYqSoobESAB3Tt
         eRGYGGgOM/icKjcAIArV0t0cRsOS98O3uc3oCmKTiATpvxAJt2dw7pFRGKnsUp5Fy6+q
         XIPCiWfYfE/TS6cBhvExSO/fG7/pxV+Gc6ing+pOzWL/ysqhEjHBgLIYNRnpXIBuNHwt
         4ZGKV+R/g8mxG2EAM+mfZqER4WmDuwtD4WjdICN3razEbRrdkjkeh/S/AOCAatbdqrDm
         dp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qmNh/UlR00KzKm2embL/8KXGrDJlEF5LNSh8Qse0tHI=;
        b=jRDZigOFWYrp0BCun1UfjVkd8mFXGOoD8a1wjU29aohnur4yPayR8MnDTrURvUBqLT
         j8MWJ6Tv0WIT4+9ooHJEjAMWZxf4dPMKZaQQt8i9TactO/JD1nKuM/AhW0sUx5KwClM9
         cL3elIDEwJPAyh3qbdH+TI6cr0Ktaq+UsRUHFeT/1Glcs9Tcv5N/MLJ8C2SrdyOBWtL3
         hRTOKc3piN56tZrFWbzAA6lUITM25QhF5E0Uyn6s7i6syIG8X3QsaQ3lbKJniit5xzm1
         yBgf+15UjF6bheCdWvGoc5QqZMnvgg3iI+2USLnnJj6AMclKjaumr4hObs7UUBCUotSR
         SLaQ==
X-Gm-Message-State: AOAM531lmjZmE44SBttpib1OqVneZCK9hJDH0skc9PGgjQeGkNBhnjNn
	X4Vw3UadcwdVADgKwak58+8hNZZDgPq0ljWy5Rm7hQ==
X-Google-Smtp-Source: ABdhPJwxw3I1e8oaAvfUjbq5Ev4Yd8NjV0buUyZoAzr7cbILcvl2TRmROPbsKEb/6HUIdbYLzAigXpP3dNIEtdsX6aE=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr13052968lfp.392.1652116149145; Mon, 09
 May 2022 10:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org> <20220508190631.2386038-2-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-2-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 10:08:57 -0700
Message-ID: <CAKwvOdnawYY05Boy6FNUtBoi11z8yyMnfDzGUw0CDMT3vKuP5w@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] modpost: remove left-over cross_compile declaration
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Zijlstra <peterz@infradead.org>, linux-modules@vger.kernel.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 8, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is a remnant of commit 6543becf26ff ("mod/file2alias: make
> modalias generation safe for cross compiling").
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch! (I wonder if we should put our old mailing list
in .mailmap?)
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v4:
>   - New patch
>
>  scripts/mod/modpost.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index cfa127d2bb8f..d9daeff07b83 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -174,7 +174,6 @@ static inline unsigned int get_secindex(const struct elf_info *info,
>  }
>
>  /* file2alias.c */
> -extern unsigned int cross_build;
>  void handle_moddevtable(struct module *mod, struct elf_info *info,
>                         Elf_Sym *sym, const char *symname);
>  void add_moddevtable(struct buffer *buf, struct module *mod);
> --

-- 
Thanks,
~Nick Desaulniers
