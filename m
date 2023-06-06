Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B40566C
	for <llvm@lists.linux.dev>; Tue,  6 Jun 2023 08:53:51 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-43b4ffbaef7so693771137.3
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686041631; x=1688633631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DkYmQSdDH/7swAFbB+hh/UI/hl2M4IPq1cAE0sbjhj8=;
        b=BY9mJRXU5Uw4Wc3BYKAAcw5wT0xCZwCwxzc+YVOR57ZSjyQlIbSzuSe0xA1iDXYAaR
         u8t2ptPstyGfvNyzGy06ScIUbo+zrCIVC4wykhuQN2Pf9I5RIgMro6FdbXrsPuhehf16
         Ywke/gcYvszx5dlgXkDjLNQFN3lZeN7CRrVqsK1yVBrHKZGJKaXOMHXfDXSWsJEh/Gzy
         ukJ1x6Nu0Ds5xfktQ0KwztbGpIN8VgQeFvm1hZJ847GGPel4Oa42tiiPOaoRd1u8wSi7
         wAVRi9P6gK4zUQgIqYd0fSEt/+hjvZ4JYldH1sMs0GtIU7U/8s9N4p2RfLhUYRDuKGHO
         2h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041631; x=1688633631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkYmQSdDH/7swAFbB+hh/UI/hl2M4IPq1cAE0sbjhj8=;
        b=Xt76X7s4UX/W9x9JyuyHCsQ0Lr3/VobJMj6C6XuxMQf+IQ8klFmfZro8Tbv/xJj82N
         CGkiJmow1zBslaY+DukgLWy9NO2d/VL6Zd5U0T3Z3YVFM3DBYAcclzTvhT55znRg9SK7
         HWOl5q0MxJ9WDReZbla4z4AWZCGicWk9r2N6br0fCIU9WFSfPBCiKKgwfWdBIxngDjzP
         xr5yGiTKrcyaAyTfbN2D+O7n12RnzuAFXO2qC2iIJWtP7Czm4l7aWvTu7AevkqvU76tC
         SIpLRDWV51ZRS68sQ9cB3CYylQOiMsGzzUiQ4Pa/rvJZB5YuQAi4+ljNPK6AzlLmquLB
         vNqw==
X-Gm-Message-State: AC+VfDxexb7oR2ak/93ziStPIEQfkKK7EpJ542BCGqS0CXlkpQAUo3Zu
	iAlMc1Wtd2k3SKq0OmdJYRPkcvDJOugwvhriivmQTA==
X-Google-Smtp-Source: ACHHUZ6oosJ/AGBnPC00r6QaUMmoCBOhY+Q8RI7xPxjgWlVuISrs9TDVAfbGhiRpcu/E3MP9rBkDqdCkWA7eX9GNUpo=
X-Received: by 2002:a05:6102:410:b0:43b:1b47:670 with SMTP id
 d16-20020a056102041000b0043b1b470670mr889033vsq.20.1686041630760; Tue, 06 Jun
 2023 01:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv0a-XxXfG6bNuPZGT=fzjtEfRGEYwk3n6M1WhEHUPo9g@mail.gmail.com>
In-Reply-To: <CA+G9fYv0a-XxXfG6bNuPZGT=fzjtEfRGEYwk3n6M1WhEHUPo9g@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 6 Jun 2023 14:23:39 +0530
Message-ID: <CA+G9fYueN0xti1SDtYVZstPt104sUj06GfOzyqDNrd3s3xXBkA@mail.gmail.com>
Subject: Re: arm: shmobile_defconfig: ld.lld: error: undefined symbol: lynx_pcs_destroy
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Netdev <netdev@vger.kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, maxime.chevallier@bootlin.com
Content-Type: text/plain; charset="UTF-8"

+ netdev



On Tue, 6 Jun 2023 at 14:17, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Following build regressions found while building arm shmobile_defconfig on
> Linux next-20230606.
>
> Regressions found on arm:
>
>  - build/clang-16-shmobile_defconfig
>  - build/gcc-8-shmobile_defconfig
>  - build/gcc-12-shmobile_defconfig
>  - build/clang-nightly-shmobile_defconfig

And mips defconfig builds failed.
Regressions found on mips:

  - build/clang-16-defconfig
  - build/gcc-12-defconfig
  - build/gcc-8-defconfig
  - build/clang-nightly-defconfig



>
> ld.lld: error: undefined symbol: lynx_pcs_destroy
> >>> referenced by stmmac_mdio.c
> >>>               drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.o:(stmmac_mdio_unregister) in archive vmlinux.a
> make[2]: *** [scripts/Makefile.vmlinux:35: vmlinux] Error 1
>
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> links,
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230606/testrun/17347517/suite/build/test/gcc-12-shmobile_defconfig/history/
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230606/testrun/17347562/suite/build/test/clang-16-shmobile_defconfig/log
>
> --
> Linaro LKFT
> https://lkft.linaro.org
