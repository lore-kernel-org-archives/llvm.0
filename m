Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1E6ABD
	for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 07:06:09 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4036bd4fff1so218921cf.0
        for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 00:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692687968; x=1693292768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+BLM0MEGdVJh+GeM8RFbfl7FvS0GBuGY0HLrEk98+g=;
        b=67ZpPxdZmKHU+iKIy/rCIH+0m4sPPbuLv3JEZOkQdtA2gwADZISSzgjyJbhJbp1wli
         G/EUH+NnkpcYFhgkGACJYocyLocDqDOprM8a8om7B7RL0Sr+9V548YZFMk+xRSeavD9t
         4WOooJ+EVxQgdQ/EnV4f2YRIXq0nqF4fkRHO11j9gKoUcSEUxU4E5Y0mW+lSfSU98db3
         5XMD6rlglHsRS0sGcQpfymaPo6qEd+wSE70nHluvK2wU6g589BRkQ0vcFL9WYcVq9iAu
         TZdRzHy9sho8jv4Mlv7KHSnxe2zT4QTsqXDQ9MkZVY3ZFytz38yoz3NZCYll7zAw5Ft0
         UubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692687968; x=1693292768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+BLM0MEGdVJh+GeM8RFbfl7FvS0GBuGY0HLrEk98+g=;
        b=bfVftQm+TrzUXcln6WulSzulO+RCQ0pwANu2fSWnhK1zmpPcjGIJxUG2EgS2bTaxxJ
         cq4DLuOqMDrWe9Wbon5HISZNcSthnQYO946WDNL99O4z2xJdeLfDRwWFoDkA1Wj9M9vR
         0FZLtLrhzepr6geq1y5kQOqmr+cttXa0TkZ87c3h0TCZku2Y1yduGWgMhgO7B/IigpeC
         61jk7GEmVBPRm/+VyRRx1Z8M/Ax8IeWzkCk5n9Tf8donbV9HWYMVyJjTNOAdJW986hL4
         Z1PJpwosIySVJirQqc0/WqWUxaxn2+L6EhHJZe28PChLBx4PjR8cw7+rn7O6dk2GcR2Z
         G38Q==
X-Gm-Message-State: AOJu0YxZrKdDdMrkLPkZUvtY8qYRLVh3FDyUKj1o7yMMyeJE1r93+dfw
	TnMuo2PRuXuD3PUlyqZQZqV0lf7G8c7wAVVa0N5kQg==
X-Google-Smtp-Source: AGHT+IEtr6/EVKNg+/y3fk4iAA9e3QLd3eUcYWapQqAXgr+9utt53HzxrVcvxexkPJCnIW4avRUN+C1IkvFlz38cUgU=
X-Received: by 2002:a05:622a:144a:b0:3f2:2c89:f1ef with SMTP id
 v10-20020a05622a144a00b003f22c89f1efmr99219qtx.5.1692687967985; Tue, 22 Aug
 2023 00:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org>
In-Reply-To: <20230822065256.163660-1-denik@chromium.org>
From: Fangrui Song <maskray@google.com>
Date: Tue, 22 Aug 2023 00:05:56 -0700
Message-ID: <CAFP8O3J2pUddEfL+W2j=tpjdj1ufsQMJqjcARbYvY3+khtBPig@mail.gmail.com>
Subject: Re: [PATCH] modpost: Skip .llvm.call-graph-profile section check
To: Denis Nikitin <denik@chromium.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 11:54=E2=80=AFPM Denis Nikitin <denik@chromium.org>=
 wrote:
>
> .llvm.call-graph-profile section is added when the kernel is built with
> profiles (e.g. -fprofile-sample-use=3D<llvm.profile>).

Right. .llvm.call-graph-profile may also be added when the kernel is
built with clang -fprofile-use=3D (though instrumentation-based PGO
support is not upstreamed yet).

> The section holds
> metadata for symbols beloning to other sections and hence doesn't need
> modpost checks.

Typo: belonging.

.llvm.call-graph-profile contains edge information derived from text
sections, so .llvm.call-graph-profile itself doesn't need more
analysis as the text sections have been analyzed.

> This change fixes the kernel build with sample profiles which fails
> with:
> "FATAL: modpost: Please add code to calculate addend for this architectur=
e"
>
> Signed-off-by: Denis Nikitin <denik@chromium.org>
> ---
>  scripts/mod/modpost.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index b29b29707f10..64bd13f7199c 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -761,6 +761,7 @@ static const char *const section_white_list[] =3D
>         ".fmt_slot*",                   /* EZchip */
>         ".gnu.lto*",
>         ".discard.*",
> +       ".llvm.call-graph-profile",     /* call graph */
>         NULL
>  };
>
> --
> 2.42.0.rc1.204.g551eb34607-goog
>
>

Otherwise the change looks good to me.


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
