Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B05F125AB
	for <llvm@lists.linux.dev>; Tue,  6 Jun 2023 09:28:53 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ba1815e12efso5087317276.3
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 02:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043732; x=1688635732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZvMEy864MwTP2VbOIQdW/FR/SOtiCNc16GfTX7zCXs=;
        b=JAg+LTMZOOWVHLh+5gHgNA1oDM0ggP9G9PhSwLjmynVjUEy+MQet/r2x8MhOuhxVSG
         1K/Wdjzm22FyKhl+t5/zYfcodfP8AOcebmxxO0V3zsrJrLnri0ae3L3Ydmj2/5AqapLK
         HcJoD79CW1B4MNheV8AznOWyR2WlK3z82OzSlmsDvl3yP7xHB+bs8D1byfNdjyPxkIZo
         OEOAseqObYMVbxMC2Tn5aeU+A+n43FnYNuHCU5D4kbDo+Zq9ZFtj5ABswSowYC+FMNTu
         u9WrqJiMOm7odZcOX4cCEBGhHbKN4uhy1xVJ4/mGHFii7geaL97MdKyS3xdSquwVX0b1
         1FCA==
X-Gm-Message-State: AC+VfDzg8QYnqm9tA1mm1w2Na660wOUAJHSAKSWckUvzhUgf2Z4clpwl
	BlFWmQYbSYETLImGFyqvEWVvyOCM7KStSA==
X-Google-Smtp-Source: ACHHUZ5rQ4wAx0/G65jDeNcuiSA8WoDGmgBf6NbAnfR186b5xWrKEtADvxrcaKDfQDLxP+dvY0Picw==
X-Received: by 2002:a0d:cd06:0:b0:55a:8e38:7d5f with SMTP id p6-20020a0dcd06000000b0055a8e387d5fmr1095479ywd.39.1686043731926;
        Tue, 06 Jun 2023 02:28:51 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id j7-20020a816e07000000b00552df52450csm3923054ywc.88.2023.06.06.02.28.50
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:28:50 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-ba818eb96dcso5103155276.0
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 02:28:50 -0700 (PDT)
X-Received: by 2002:a0d:cb47:0:b0:565:c96b:f526 with SMTP id
 n68-20020a0dcb47000000b00565c96bf526mr1400799ywd.19.1686043729823; Tue, 06
 Jun 2023 02:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv0a-XxXfG6bNuPZGT=fzjtEfRGEYwk3n6M1WhEHUPo9g@mail.gmail.com>
 <CA+G9fYueN0xti1SDtYVZstPt104sUj06GfOzyqDNrd3s3xXBkA@mail.gmail.com>
 <CAMuHMdX7hqipiMCF9uxpU+_RbLmzyHeo-D0tCE_Hx8eTqQ7Pig@mail.gmail.com> <11bd37e9-c62e-46ba-9456-8e3b353df28f@app.fastmail.com>
In-Reply-To: <11bd37e9-c62e-46ba-9456-8e3b353df28f@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jun 2023 11:28:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUH2Grrv6842YWXHDmd+O3iHdwqTVjYf8f1nbVRzGA+6w@mail.gmail.com>
Message-ID: <CAMuHMdUH2Grrv6842YWXHDmd+O3iHdwqTVjYf8f1nbVRzGA+6w@mail.gmail.com>
Subject: Re: arm: shmobile_defconfig: ld.lld: error: undefined symbol: lynx_pcs_destroy
To: Arnd Bergmann <arnd@arndb.de>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-next <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Netdev <netdev@vger.kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, maxime.chevallier@bootlin.com, 
	Simon Horman <simon.horman@corigine.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, Jun 6, 2023 at 11:16=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Tue, Jun 6, 2023, at 11:01, Geert Uytterhoeven wrote:
> > On Tue, Jun 6, 2023 at 10:53=E2=80=AFAM Naresh Kamboju
> > <naresh.kamboju@linaro.org> wrote:
> >> On Tue, 6 Jun 2023 at 14:17, Naresh Kamboju <naresh.kamboju@linaro.org=
> wrote:
> >> > Following build regressions found while building arm shmobile_defcon=
fig on
> >> > Linux next-20230606.
> >> >
> >> > Regressions found on arm:
> >> >
> >> >  - build/clang-16-shmobile_defconfig
> >> >  - build/gcc-8-shmobile_defconfig
> >> >  - build/gcc-12-shmobile_defconfig
> >> >  - build/clang-nightly-shmobile_defconfig
> >>
> >> And mips defconfig builds failed.
> >> Regressions found on mips:
> >>
> >>   - build/clang-16-defconfig
> >>   - build/gcc-12-defconfig
> >>   - build/gcc-8-defconfig
> >>   - build/clang-nightly-defconfig
> >
> > Please give my fix a try:
> > https://lore.kernel.org/linux-renesas-soc/7b36ac43778b41831debd5c30b5b3=
7d268512195.1686039915.git.geert+renesas@glider.be
>
> This won't work when PCS_LYNX is a loadable module and
> STMMAC is built-in. I think we should just select PCS_LYNX

Oops, you're right, forgot about that case.
What about using IS_REACHABLE() instead?
No, that won't work either, as DWMAC_SOCFPGA can be modular,
with STMMAC builtin.

> unconditionally from stmmac even if no front-end driver
> using it is enabled.
>
> I tried to come up with a way to move the dependency into
> the altera specific front-end, but couldn't find an obvious
> or simple way to do this.
>
> Having a proper abstraction for PCS drivers instead of
> directly calling into exported driver symbols might help
> here, but that would add complexity elsewhere.

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
