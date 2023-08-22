Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6202B545
	for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 17:51:15 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4036bd4fff1so41401cf.0
        for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692726674; x=1693331474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTQHxKG2D5LbRoD1UXRmuUXHuB7AJbXnzw+23CsotMg=;
        b=BFKbjhidrHsnQIwzb82AQGRT2a0QCnLlD78C+BChYGJ+4KywPdEVN7H9NkYWTSENtV
         PpQiOiKA8vCLtQb26ZmoX+9N9ba6VlbEiLIMpiesyYZhYW6svghc0Yv/cTEWeln8Ux3H
         0Gn3QFi6JvwghAXDJlLQSSN3D4ZhK1t4U1VYIlxAXsTMGM0UEbjimlZQA+q03aWZJih9
         8Aws/YLO8+VCX06ywZAWCT86oEomaGyX9RTa/72fz+I1TSEzyaovPUArABUmTXyV5UKA
         aPiO45OACjhSujvGPthBRtFfQtAXiiGxjVWhFoFpWgbGuuLas9TF1FWxPzuKdkYlt7Nf
         TE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692726674; x=1693331474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTQHxKG2D5LbRoD1UXRmuUXHuB7AJbXnzw+23CsotMg=;
        b=KYJh05M2K4biGAjmA0qdjLFQsdqClMNQVo03Ryb5h4IPGE6P8dBxuRrLseMBgyaPEE
         WqgY3+PXZ/0ASZ5VB7vetqHJTF7rV0SlvjbNpAoUDA9skovV5l8C4j5bBv59Ct9Ed8M6
         d+IjinmwQ3mcblADa0Ni++6TuxRb0n2X4MGnlEthylH8zggK3wUled7R5ZkP7h5beNDL
         aCH2YYppMcRXGOS0pYh68XusK8jddoaDgCjKXY2rNg5gKfFKoX+wJRKy5DAEBVfxZGcw
         fOBP/bEgxA9hA6WdBHbTE6pWuVYmpjl8+ynjbpUkwqhpHJJbg8qcTISrKAnDogxZKJGK
         y6qg==
X-Gm-Message-State: AOJu0YyAg024sM0FdhPi5SBS9MNMEAeQJ/l6F1vRBu0DwG6T/LmMZCIF
	ZxpXBkKKLDp6pPCNLuSEUElZqGK9+t++74aJDUfh+A==
X-Google-Smtp-Source: AGHT+IH8CcGn1FXMoAKRlf73hzf0gvM8a+jzi/t6hcmvWwSTQP9yOtL9F6zEdJuVNx2nfT4ZMWZ+QL4DMpachfRO/Rw=
X-Received: by 2002:a05:622a:1a90:b0:3ef:302c:319e with SMTP id
 s16-20020a05622a1a9000b003ef302c319emr347014qtc.8.1692726674341; Tue, 22 Aug
 2023 10:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <20230822174835.253469-1-denik@chromium.org>
In-Reply-To: <20230822174835.253469-1-denik@chromium.org>
From: Fangrui Song <maskray@google.com>
Date: Tue, 22 Aug 2023 10:51:03 -0700
Message-ID: <CAFP8O3KunP9CzT_U2cj1_oysojTxCNJRWX_kvvu_wOx4tbYHug@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Skip .llvm.call-graph-profile section check
To: Denis Nikitin <denik@chromium.org>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 10:49=E2=80=AFAM Denis Nikitin <denik@chromium.org>=
 wrote:
>
> .llvm.call-graph-profile section is added by clang when the kernel is
> built with profiles (e.g. -fprofile-sample-use=3D or -fprofile-use=3D).
>
> The section contains edge information derived from text sections,
> so .llvm.call-graph-profile itself doesn't need more analysis as
> the text sections have been analyzed.
>
> This change fixes the kernel build with clang and a sample profile
> which currently fails with:
>
> "FATAL: modpost: Please add code to calculate addend for this architectur=
e"
>
> Signed-off-by: Denis Nikitin <denik@chromium.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks. The new commit message looks good to me.

Reviewed-by: Fangrui Song <maskray@google.com>

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


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
