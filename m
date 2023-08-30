Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437C1872
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 08:25:11 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d776e1f181bso5103786276.3
        for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 01:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693383910; x=1693988710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG62sgnGcJnF0tJvK3oQY2fo6A4TDxZZoS0niAlQiv4=;
        b=A892/KwwStwq5du86nGH2MLAUoWwFCLls6nxnjm6OU9CS/kMDZyHPcYAod5IozmnrJ
         funTir/M6KgObTOLCWghZmgL0spmOO4k/BD+jdc2mBVT82mZTu57g1EkqYpyksyZiikL
         2PWCAmU7fGpdatjIu/uJ6Z+riG4HjddXAtEctJ/Wr7SKMw5hDIq8Hh97jOlwkfvqiYi7
         IS67Ntjc69SHNKDn7cQpWaVVbypFeXJHtsCe+Z0wegz+SpoBSsT98t6W5OHt/pd9y6rs
         imEVFWCau0sTMkHEU9C6AXX92s9q/TsFNU5M9ywbzHedZkukj3XmyZfvTe1yBBx48N9Q
         jWbw==
X-Gm-Message-State: AOJu0YxBYZ1eszDqmktiEuHFIK/er0QgSXt2DQrRtPv1CYATfW/D3kax
	10FPYzy0Wo39iMd16zz8b0U0SzSbov30eg==
X-Google-Smtp-Source: AGHT+IEkQGyBrYudd55d8ZrIUQQy6D2vayuAVduGzW5jjXdaITSAA1c1rCsuVmmsJ8veKuicyBPnjA==
X-Received: by 2002:a5b:60a:0:b0:d7a:c493:ef35 with SMTP id d10-20020a5b060a000000b00d7ac493ef35mr1360462ybq.58.1693383910067;
        Wed, 30 Aug 2023 01:25:10 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 188-20020a2506c5000000b00d17586ff1f7sm2615279ybg.28.2023.08.30.01.25.09
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 01:25:09 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d7b91422da8so982524276.2
        for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 01:25:09 -0700 (PDT)
X-Received: by 2002:a25:dcf:0:b0:d6b:8ea4:b8a1 with SMTP id
 198-20020a250dcf000000b00d6b8ea4b8a1mr1475047ybn.12.1693383909143; Wed, 30
 Aug 2023 01:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230814-void-drivers-soc-renesas-rmobile-sysc-v1-1-6648dfd854de@google.com>
In-Reply-To: <20230814-void-drivers-soc-renesas-rmobile-sysc-v1-1-6648dfd854de@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Aug 2023 10:24:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiC4v9fctp18bRrEH-m_-0VjMg9+XpON8vdRYwniTU3g@mail.gmail.com>
Message-ID: <CAMuHMdWiC4v9fctp18bRrEH-m_-0VjMg9+XpON8vdRYwniTU3g@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: fix -Wvoid-pointer-to-enum-cast
 warning
To: Justin Stitt <justinstitt@google.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Justin,

On Tue, Aug 15, 2023 at 12:11=E2=80=AFAM Justin Stitt <justinstitt@google.c=
om> wrote:
> When building with clang 18 I see the following warning:
> |      drivers/soc/renesas/rmobile-sysc.c:193:22: warning: cast to smalle=
r integer
> |               type 'enum pd_types' from 'const void *' [-Wvoid-pointer-=
to-enum-cast]
> |        193 |                 add_special_pd(np, (enum pd_types)id->data=
);
>
> This is due to the fact that `id->data` is a void* and `enum pd_types`
> has the size of an integer. This cast from pointer-width to int-width
> causes truncation and possible data loss. Instead, cast to `uintptr_t`
> which has the same width as void*.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>

scripts/checkpatch.pl:

    WARNING: Reported-by: should be immediately followed by Closes:
with a URL to the report

Hence changing the Link: tag to a Closes: tag.

> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: It should be noted that there is likely no data loss occurring in
> this case since the enum only has a few fields. The narrowing cast from
> pointer to int will not lose any data.

Indeed, the theoretical narrowing could only happen on a 64-bit
platform, while this driver is only used on arm32.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.7.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
