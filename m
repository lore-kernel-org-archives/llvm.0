Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3AF1939F
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 20:30:29 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-64a5bc52b0aso8207756d6.3
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 13:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692995428; x=1693600228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHo81x/JmukZO8gE5tk4SvnfHEU3I2tLttHg81tYXVw=;
        b=v3IJd2QKhkAoDRx+SCj8UFxDBtnHnoIjPjsQNuKlvnUb4uG+9FfegdupX/tiJ95kOM
         fg2ie5HDxlXPlUeflkjcx2GKdQfsPnM4N9a4pq8Ys4Xy+kN3O0MyLW7gr75469y+YrBt
         3d7cC5Z7MZj4SH5eqfw3V/7MmZaJRG5U4mctpKRCi68L788f/UmracZPMlZCfkc9kgvn
         76sH6rRwnYk0kKVEZxPlumNSA4pCUWRzJywQisvFUXKpkEkAjg+vB9Ol1l3s1Yc76ord
         lqG8lcGAT8l1gD4wLbj/N3lnd9/K7nZ7uFU/ZyyyV9zfnAEZ3ylu71CnMSUdSCec3LGM
         ZsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692995428; x=1693600228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHo81x/JmukZO8gE5tk4SvnfHEU3I2tLttHg81tYXVw=;
        b=gi+N+nCAyvdYblpkFjI1Pdhj43fgnD4wDPG01BzgZAB52oqGDfTOt8qJK1B/84nrvB
         10b/xBeMMFyevVpuZwtC+U2/n0TfiSq9KEONo2b+wxeeriQopKXD1RzPDPvjwE8eqOsd
         1Nlc5wTLFrpIIEetLM0LvOmZhTDM7iRJN2FcsLsX1kw8W1dASmfmCBXGk9XjsnfubqZB
         zDpcwUYCYXXUaclwedFhQnguDZMZk42k7DktDg4IYqKhq0k1tz25KGeDO0s/bLaKIzyf
         VZCb0UqdHzZLrtrtMh2gkzIex2iShLmJ3jJlE6yGJsdsjBulCUrha7BkmOJVTDy+cmoE
         zpbg==
X-Gm-Message-State: AOJu0YyI4v6VVwdEJw196SFWWsvBkNIHFGh3jmMMARH8OpX0Huz+0+Gd
	LOOEvMeFh9deCFdW3d4EdRfP1QQRguNiZI3CVbZdGg==
X-Google-Smtp-Source: AGHT+IFGDySnNWFt9z2lRgi5x4Xhzy+WUuSM6sIKA0ancu77LgK+zbUkDmKjPlGs0wy0x4yGXqpeYWwG4CoQzbo5+Ls=
X-Received: by 2002:a0c:e1d4:0:b0:64d:254a:63dc with SMTP id
 v20-20020a0ce1d4000000b0064d254a63dcmr20718613qvl.19.1692995428387; Fri, 25
 Aug 2023 13:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230825202036.441212-1-yonghong.song@linux.dev>
In-Reply-To: <20230825202036.441212-1-yonghong.song@linux.dev>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Aug 2023 13:30:16 -0700
Message-ID: <CAKwvOd=QsgEBFs1ie0bhMMJaUk_pYZ9tQcPud9aRStaG-1uOEg@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: Change func signature for cleanup_symbol_name()
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>, Song Liu <song@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Fangrui Song <maskray@google.com>, kernel-team@fb.com, 
	Leizhen <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 1:20=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
> All users of cleanup_symbol_name() do not use the return value.
> So let us change the return value of cleanup_symbol_name() to
> 'void' to reflect its usage pattern.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>

LGTM; thanks!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  kernel/kallsyms.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> NOTE:
> This patch needs to be applied after the following patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=
=3D33f0467fe069
>
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index e12d26c10dba..18edd57b5fe8 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -163,12 +163,12 @@ unsigned long kallsyms_sym_address(int idx)
>         return kallsyms_relative_base - 1 - kallsyms_offsets[idx];
>  }
>
> -static bool cleanup_symbol_name(char *s)
> +static void cleanup_symbol_name(char *s)
>  {
>         char *res;
>
>         if (!IS_ENABLED(CONFIG_LTO_CLANG))
> -               return false;
> +               return;
>
>         /*
>          * LLVM appends various suffixes for local functions and variable=
s that
> @@ -178,12 +178,10 @@ static bool cleanup_symbol_name(char *s)
>          * - foo.llvm.[0-9a-f]+
>          */
>         res =3D strstr(s, ".llvm.");
> -       if (res) {
> +       if (res)
>                 *res =3D '\0';
> -               return true;
> -       }
>
> -       return false;
> +       return;
>  }
>
>  static int compare_symbol_name(const char *name, char *namebuf)
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
