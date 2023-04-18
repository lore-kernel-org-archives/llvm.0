Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F41923A7
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 18:36:29 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-247526f0eceso1204213a91.2
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681842988; x=1684434988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApsPN1GAt+bKSjbs42LxkANlc6ClVgqELeBRCapEZOY=;
        b=fcvQ6uiiAwbiDHp9ofdozAuOiqo8sbjEaS1wJfZPJdR7ku/k91ggC43xkhzyyW+7nI
         yL05D8fKTVowBu7cH7oGSbwvorwMmpZfZp+be71T12rL9TRGAsRKhgX9BtbLc+iyZwgq
         Qb48G1rKzQZjLEUD5f92333ozX9LrkHTarpi26AV6WxfUdF8E317PyK+GRvYlhJDse5Z
         MEZRohJ9XuAxL4kVb0Aft7cnNRU1ffRIyB+Hpuwglq4gprdj5r075/QYekStmw9Zcc7e
         uJaoVEg0RaJ6z9kkri0qCgyEJPxz6DZVa/1Zx09Yl/HmHiUZVgIL62G/nueZQ1DngeXx
         2F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681842988; x=1684434988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApsPN1GAt+bKSjbs42LxkANlc6ClVgqELeBRCapEZOY=;
        b=h0uZw/jaEPFqh45hR5Dqrt4h8fLI6x8XZfDv/Ui8FnNTPV7dKXUW8N3cs1vcAr1ufF
         7FJiPS1pKsgJNYU4sNwL8lciMZ5y4M+vlki+t1i5S/fO9qzOug1GD+Gwj/GA8BFhkidG
         t0cICX/ZBjlwlRuRToMTh2RCkjJxHSFj/Ur9PWWyQ7R1iFyxzKt5T24GVEegtHl4ABx+
         9AJfsoGu2IgIBGPyjDu6YhAQM3C9PpHaqBlW8BXikKGqOosYxpFz4/FlpsEcNHpYQ5Em
         S1vv8Vn9yrOCEKcZBJdG0hKGBF5Mc/fDexCBBq76BopP7Er+lTX8oqKRRv8yNNVk1ylJ
         gJzQ==
X-Gm-Message-State: AAQBX9dIq9Aoyi1uuaS/vuv2Vuf+8dHrqcgXy2tE/bsqlcrNuwXByPT2
	nnI1HVnhN1S2ChPGwd9JQR9dalt/mbLfNS74MOCNzg==
X-Google-Smtp-Source: AKy350ZShnO2tG7T/57z/jUzMW01PDWOatg+RwsX6uSLq6+zwhs8lAyWd6JaHE6qNghBF+/vCyIJp0/ga1bkMCOPgjE=
X-Received: by 2002:a17:90a:d70b:b0:246:ba3f:4f3e with SMTP id
 y11-20020a17090ad70b00b00246ba3f4f3emr605102pju.6.1681842988421; Tue, 18 Apr
 2023 11:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
In-Reply-To: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 11:36:17 -0700
Message-ID: <CAKwvOd=DeCNoQYuTJVfbd0tSddJpGVaKBTEfC-+XUN4OJ4hRRw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-meson8b: Avoid cast to
 incompatible function type
To: Simon Horman <horms@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 4:07=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> Rather than casting clk_disable_unprepare to an incompatible function
> type provide a trivial wrapper with the correct signature for the
> use-case.
>
> Reported by clang-16 with W=3D1:
>
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c:276:6: error: cast f=
rom 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible=
 function type [-Werror,-Wcast-function-type-strict]
>                                         (void(*)(void *))clk_disable_unpr=
epare,
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Simon Horman <horms@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index e8b507f88fbc..f6754e3643f3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -263,6 +263,11 @@ static int meson_axg_set_phy_mode(struct meson8b_dwm=
ac *dwmac)
>         return 0;
>  }
>
> +static void meson8b_clk_disable_unprepare(void *data)
> +{
> +       clk_disable_unprepare(data);
> +}
> +
>  static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
>                                            struct clk *clk)
>  {
> @@ -273,8 +278,7 @@ static int meson8b_devm_clk_prepare_enable(struct mes=
on8b_dwmac *dwmac,
>                 return ret;
>
>         return devm_add_action_or_reset(dwmac->dev,
> -                                       (void(*)(void *))clk_disable_unpr=
epare,
> -                                       clk);
> +                                       meson8b_clk_disable_unprepare, cl=
k);
>  }
>
>  static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>


--=20
Thanks,
~Nick Desaulniers
