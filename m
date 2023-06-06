Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413E328C07
	for <llvm@lists.linux.dev>; Tue,  6 Jun 2023 09:01:59 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-bacfa9fa329so6056387276.0
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 02:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686042118; x=1688634118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsblPXknZ5GIdBcvT6axVzmA1IISIV/7YdlNXuNCOIg=;
        b=kuC5LQwCOii9NzR1hv4SWsZZw0tCQuKVDIKatm90lFNck2lHluUsBLSPbV2/9tQCx8
         PoEl8jcWi3ggjBjWchqXhK016d7Cq7PRK/4+r/ViBT0jl19x9hgzw2/z4F+/rk6nYQQG
         /AGXlGC6/V1nPmVmwzjqbF2j88Wo++2M+m80McIh8jKq+nK5pZS+JqVE+aOtK9TPEIGb
         x+8H344adTSkTC2UO+USdQrxVna0yx9t9eu5fp4FOrCmZsuF6TFcQ12JndCD8L4w6cWC
         RRgUVn0PT8Gq4OFiUvtQXj/tXckcZGH8eHYLaK0ZTIHv/UqfkSqhujU6zwC4FyIdmXC6
         k9pg==
X-Gm-Message-State: AC+VfDyyDfH6CgdCjHSt4nC1+sejlZnrzChEnyVpywq67b7Dqmm/3N3+
	9Embx8C6/BEX5XqfOEfICU6H4OsU+1p8wA==
X-Google-Smtp-Source: ACHHUZ5RtnEEUa5pQZuf8wIz6ksRP+atXyEJaxv1t1Xowbuz6hHtGmMVBaduTiVC+gyQydPYcmoT/w==
X-Received: by 2002:a25:e006:0:b0:ba7:7cbe:1080 with SMTP id x6-20020a25e006000000b00ba77cbe1080mr1590092ybg.62.1686042117777;
        Tue, 06 Jun 2023 02:01:57 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id b64-20020a253443000000b00bb0cb0fe17csm3112242yba.41.2023.06.06.02.01.56
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:01:56 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ba81deea9c2so6035877276.2
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 02:01:56 -0700 (PDT)
X-Received: by 2002:a0d:df90:0:b0:55a:26cf:33e with SMTP id
 i138-20020a0ddf90000000b0055a26cf033emr1300837ywe.42.1686042115920; Tue, 06
 Jun 2023 02:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv0a-XxXfG6bNuPZGT=fzjtEfRGEYwk3n6M1WhEHUPo9g@mail.gmail.com>
 <CA+G9fYueN0xti1SDtYVZstPt104sUj06GfOzyqDNrd3s3xXBkA@mail.gmail.com>
In-Reply-To: <CA+G9fYueN0xti1SDtYVZstPt104sUj06GfOzyqDNrd3s3xXBkA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jun 2023 11:01:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7hqipiMCF9uxpU+_RbLmzyHeo-D0tCE_Hx8eTqQ7Pig@mail.gmail.com>
Message-ID: <CAMuHMdX7hqipiMCF9uxpU+_RbLmzyHeo-D0tCE_Hx8eTqQ7Pig@mail.gmail.com>
Subject: Re: arm: shmobile_defconfig: ld.lld: error: undefined symbol: lynx_pcs_destroy
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Netdev <netdev@vger.kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, maxime.chevallier@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Tue, Jun 6, 2023 at 10:53=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
> On Tue, 6 Jun 2023 at 14:17, Naresh Kamboju <naresh.kamboju@linaro.org> w=
rote:
> > Following build regressions found while building arm shmobile_defconfig=
 on
> > Linux next-20230606.
> >
> > Regressions found on arm:
> >
> >  - build/clang-16-shmobile_defconfig
> >  - build/gcc-8-shmobile_defconfig
> >  - build/gcc-12-shmobile_defconfig
> >  - build/clang-nightly-shmobile_defconfig
>
> And mips defconfig builds failed.
> Regressions found on mips:
>
>   - build/clang-16-defconfig
>   - build/gcc-12-defconfig
>   - build/gcc-8-defconfig
>   - build/clang-nightly-defconfig

Please give my fix a try:
https://lore.kernel.org/linux-renesas-soc/7b36ac43778b41831debd5c30b5b37d26=
8512195.1686039915.git.geert+renesas@glider.be

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
