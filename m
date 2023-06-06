Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFD714281
	for <llvm@lists.linux.dev>; Tue,  6 Jun 2023 10:32:14 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-568ba7abc11so75530417b3.3
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 03:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047533; x=1688639533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJBagGQruk41RMozweoSMnqFuyRsRNH9Kz3lbWgCrDg=;
        b=GY59mv0o3vd4XBP4ZVikSt6Gw7hTuPX8wPQ5CvjbLK0Gv4vAlBoLDDRSPsv6f9JSAv
         gr+M8m8T1fR0CkiBpc75YtuhCYBcNF7bgYhsllc81p6GB3C2vN/6rhcMvabTvHtkLgEd
         kk80Bjpti2r0ZsmDQmJvkJM/jHFdfzbpP1FqWO35g1pBZbNlqZrcTjg0mxH4w1SYNm1b
         dNoAsRCpxhZBSadJou1R8nNrXg3lCGWyfsb8CSugypUma886gwDvH1MH704Et07b9ms2
         zqldsSVacKxjwiBdXUBKJpRf+8vxBP3ilWHU7o+fYea8MqAWq1Ju5SZ5WrBVCpH+TNUB
         fSKg==
X-Gm-Message-State: AC+VfDzXeucJiLK0xRzh7TNn9Prq6K+oh8V8JC3cdJUpqOTYDNqWy9J0
	KVfTlh1UK+BtcliBdLAK5hOnumLsXCtSMQ==
X-Google-Smtp-Source: ACHHUZ4zdUgrN0JfQwScR0Nczs5sP2e2SjLWbNE/sW2uHsZIpMTh/gomemRmCoSTcpKocfKrLMsAbg==
X-Received: by 2002:a81:dd09:0:b0:55a:12ab:a739 with SMTP id e9-20020a81dd09000000b0055a12aba739mr1910652ywn.47.1686047532986;
        Tue, 06 Jun 2023 03:32:12 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id q1-20020a818001000000b005463e45458bsm3954353ywf.123.2023.06.06.03.32.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:32:11 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-56974f42224so49052107b3.1
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 03:32:11 -0700 (PDT)
X-Received: by 2002:a0d:df91:0:b0:55a:3560:8ee0 with SMTP id
 i139-20020a0ddf91000000b0055a35608ee0mr1959649ywe.20.1686047531077; Tue, 06
 Jun 2023 03:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv0a-XxXfG6bNuPZGT=fzjtEfRGEYwk3n6M1WhEHUPo9g@mail.gmail.com>
 <CA+G9fYueN0xti1SDtYVZstPt104sUj06GfOzyqDNrd3s3xXBkA@mail.gmail.com>
 <CAMuHMdX7hqipiMCF9uxpU+_RbLmzyHeo-D0tCE_Hx8eTqQ7Pig@mail.gmail.com>
 <11bd37e9-c62e-46ba-9456-8e3b353df28f@app.fastmail.com> <CAMuHMdUH2Grrv6842YWXHDmd+O3iHdwqTVjYf8f1nbVRzGA+6w@mail.gmail.com>
 <8db9886f-e24f-44ee-8f8a-880dc3e4bf75@app.fastmail.com>
In-Reply-To: <8db9886f-e24f-44ee-8f8a-880dc3e4bf75@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jun 2023 12:31:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKL3UHzkEq3qOChMsgOsr+9uj215x55xLzbOUJWwQVzg@mail.gmail.com>
Message-ID: <CAMuHMdWKL3UHzkEq3qOChMsgOsr+9uj215x55xLzbOUJWwQVzg@mail.gmail.com>
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

On Tue, Jun 6, 2023 at 12:21=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Tue, Jun 6, 2023, at 11:28, Geert Uytterhoeven wrote:
> > On Tue, Jun 6, 2023 at 11:16=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >> On Tue, Jun 6, 2023, at 11:01, Geert Uytterhoeven wrote:
> >>
> >> This won't work when PCS_LYNX is a loadable module and
> >> STMMAC is built-in. I think we should just select PCS_LYNX
> >
> > Oops, you're right, forgot about that case.
> > What about using IS_REACHABLE() instead?
> > No, that won't work either, as DWMAC_SOCFPGA can be modular,
> > with STMMAC builtin.
>
> It would work because of the 'select PCS_LYNX' below DWMAC_SOCFPGA,

That was my first thought, but it won't work, as DWMAC_SOCFPGA=3Dm
causes PCS_LYNX=3Dm, while main STMMAC can still be builtin.

> but I think that's too fragile and would easily break when another
> dwmac front-end starts using PCS_LYNX without have the same select
> statement. I think we should always avoid IS_REACHABLE().

;-)

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
