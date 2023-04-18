Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7857BAFE6
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 18:44:40 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b50a02bffso2163555b3a.2
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 11:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681843480; x=1684435480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/h0Ye4YzfuTyVJhc3KWw9FhoYxdOlS0tgXzf1S8Y6JY=;
        b=hwr4DfGlA0LVFdLW955zFp7mTAHAENcrEHsi6IwXYBYqhH5DmANidRKqkGi/i4e6Z5
         mQpOvJYJup+h6qXClSv+sncQdafdVcwTQH8HqTiwZ63gZOrFVOLgP2iv6DSHeFNcmhZf
         J4ItVEF7/OPio/GHJS3thEifa2RDAmJKdin63BzsME6o7Xaqk0Bwr68waO+IGxSxPDEZ
         OHPWWAUT443n7YLma2AAKHk5DVl8I6/202vfBbucgg26uvKcsqhBNe38ChlO0N2UPRFW
         q8fH0Tkjoiqu5yPrfp2IAg2a3uVELg4ZJnRh5+XYvndU40DEQEQrE5lehVLU0p+VOp32
         5mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681843480; x=1684435480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/h0Ye4YzfuTyVJhc3KWw9FhoYxdOlS0tgXzf1S8Y6JY=;
        b=g8wuLYqduMigwthby2iHNbrcItCAyFffWl6pk2PmXIZ2FgL3i/ZacmnyUcls869MFE
         0O0saa1bZJVF7/O9pP0jMUuiDAsvD5UJxfJIIlZ9YZGm5bRzdy9Lge7VawGzv9kzyFex
         uEu5yIHexUkEsnUmfIG4AKpSpSC/c+NnSK0vZC80nPG5cLybNseNMUoJetw0EjCUJiy7
         QVWvKf+8X34hCjEv6hbaEqtJsNKGpTrNsHhj7yn6xPtLWrKzzZphkYslNpjHgA5ytSvQ
         6rOXz76J83LeT256UjqooVQc6mCL6OwDlHsGcrzKYJ/1SSEBDfNWMGm3Ks8xrukf+vxg
         hq9g==
X-Gm-Message-State: AAQBX9flBVsmBvIrUaBFRzJGOKhFa5DKtoja1fcHvwgj0CwzzPfe7fkw
	R1scUaG39UaTo7SwE2tXkxFuBHH5NG+nketNN5hkYA==
X-Google-Smtp-Source: AKy350YmXyurrrdutX3TxFOkZkZRSQwtF8YI9jpYLN30ZWVx/yRDmwS1d5gzSB8AfjG6MGZpUIMnfzIKD84qWtJarOY=
X-Received: by 2002:a17:902:eccf:b0:1a6:9671:253e with SMTP id
 a15-20020a170902eccf00b001a69671253emr3279751plh.47.1681843479724; Tue, 18
 Apr 2023 11:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418-pruss-clk-cb-v1-1-549a7e7febe4@kernel.org>
In-Reply-To: <20230418-pruss-clk-cb-v1-1-549a7e7febe4@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 11:44:28 -0700
Message-ID: <CAKwvOdnj7rNeh0YeX2NPcbkoJBnRwXb9Dt0SF9mHaMKYVLjCjw@mail.gmail.com>
Subject: Re: [PATCH] soc: ti: pruss: Avoid cast to incompatible function type
To: Simon Horman <horms@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 4:41=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> Rather than casting clk_unregister_mux to an incompatible function
> type provide a trivial wrapper with the correct signature for the
> use-case.
>
> Reported by clang-16 with W=3D1:
>
>  drivers/soc/ti/pruss.c:158:38: error: cast from 'void (*)(struct clk *)'=
 to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wca=
st-function-type-strict]
>          ret =3D devm_add_action_or_reset(dev, (void(*)(void *))clk_unreg=
ister_mux,
>
> No functional change intended.
> Compile tested only.

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Here's some more suspects to look at, if you have cycles:
drivers/base/devres.c:734:int __devm_add_action(struct device *dev,
void (*action)(void *), void *data, const char *name)
drivers/i2c/busses/i2c-mchp-pci1xxxx.c:1159: ret =3D
devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
drivers/soc/ti/pruss.c:96: ret =3D devm_add_action_or_reset(dev,
(void(*)(void *))clk_unregister_mux,
drivers/mmc/host/meson-mx-sdhc-mmc.c:791: ret =3D
devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
drivers/pci/controller/pcie-microchip-host.c:866:
devm_add_action_or_reset(dev, (void (*) (void
*))clk_disable_unprepare,

>
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/soc/ti/pruss.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
> index 6882c86b3ce5..e68441bd7b30 100644
> --- a/drivers/soc/ti/pruss.c
> +++ b/drivers/soc/ti/pruss.c
> @@ -38,6 +38,11 @@ static void pruss_of_free_clk_provider(void *data)
>         of_node_put(clk_mux_np);
>  }
>
> +static void pruss_clk_unregister_mux(void *data)
> +{
> +       clk_unregister_mux(data);
> +}
> +
>  static int pruss_clk_mux_setup(struct pruss *pruss, struct clk *clk_mux,
>                                char *mux_name, struct device_node *clks_n=
p)
>  {
> @@ -93,8 +98,7 @@ static int pruss_clk_mux_setup(struct pruss *pruss, str=
uct clk *clk_mux,
>                 goto put_clk_mux_np;
>         }
>
> -       ret =3D devm_add_action_or_reset(dev, (void(*)(void *))clk_unregi=
ster_mux,
> -                                      clk_mux);
> +       ret =3D devm_add_action_or_reset(dev, pruss_clk_unregister_mux, c=
lk_mux);
>         if (ret) {
>                 dev_err(dev, "failed to add clkmux unregister action %d",=
 ret);
>                 goto put_clk_mux_np;
>


--=20
Thanks,
~Nick Desaulniers
