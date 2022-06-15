Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC457A
	for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 17:33:25 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id c4so19967980lfj.12
        for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hd/cGjQ2Xjd6LDpefMqiTBtHv/N383B1PfAFMpFqhy4=;
        b=ASUCE8+CrV643MgfwX5XdEPd6FlLM4uc/R29PsZSfVTEMoidZJyYKETJnkcSaq/IKA
         +eA9/hNGuhv7cKf6dfWNuj4XaVHGdkVdkHgMAK3VvbsHc6Ih/EKXWeKHparRqcsI/5tD
         koAls765sRUN+OJPW9AHvNm29+2wv7BtO0IfMeM/5ontyyEdZFRx49y3t/W4LoS6fLwh
         ttAr+WadM4xaq8cgT0beYDVpS/PhrA6VwMgdHs/TByUlpS2kAR//ZUAYQs2ndtDDtA9z
         3J/rC2KnaSpWtoz+CeJs1NgAKvoITWJyMMcHJNuAU/TOWnZY4AFQoYDw8Llgg3q7LDzw
         MJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hd/cGjQ2Xjd6LDpefMqiTBtHv/N383B1PfAFMpFqhy4=;
        b=najuv4gON0fHRlCVhcUiHZsa1zsS4DVTUIsGnsLyPttPz+iijY8AwFtvoK5h4i9Qm0
         jTWsuqAa+PflFtZvCBG6vQn2LBT+HeNKFpRcZSd4Yk3f4EPMjbSn9qTfskvcFZ8uT55E
         qq4ko6KVMDzkarvvLv59yPU/qQUam4eBtRvURRWgvSN5w4nOKFysutzVVDdvEeO08HOa
         04es/pWJp3V3XIGuJaochQMyVFjSgr/1bPuIJKhrJYTT0DNv5Gg4mEEyBNv0RsIc0k/G
         aDnPwvcAFJ6OrSCLMKBTbAdUM8KQNHXe6nPel18ijuuU4psRWoQkOe3POz4Swc/spVg7
         WnKA==
X-Gm-Message-State: AJIora+IjQHBctYbIBrOE5f6jI/58syrQzUltrflCke3KI6DYTsCZSsx
	hLiw6KY+HR3K8VzpF9+dcYM+A5sQzPqkqbYj/pnGZg==
X-Google-Smtp-Source: AGRyM1u27a6LLCUdFJko6UXeDFBM5BXqgpTxDSyczmVj+igLdaSx3S3Mb5URwhYMTRmr6Cgd3jmIJBj/PuRWV1ddR3A=
X-Received: by 2002:ac2:47f1:0:b0:479:7517:d41 with SMTP id
 b17-20020ac247f1000000b0047975170d41mr354755lfp.254.1655314403472; Wed, 15
 Jun 2022 10:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608152757.82529-1-nathan@kernel.org>
In-Reply-To: <20220608152757.82529-1-nathan@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Jun 2022 10:32:46 -0700
Message-ID: <CAPDyKFpx+s5noi69MhqMY6YqVXKkV5ALRZGuB1yVaFk9YzQ8Kw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-brcmstb: Initialize base_clk to NULL in sdhci_brcmstb_probe()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Al Cooper <alcooperx@gmail.com>, 
	Kamal Dasu <kdasu.kdev@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Justin Stitt <jstitt007@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jun 2022 at 08:28, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns a few times along the lines of:
>
>   drivers/mmc/host/sdhci-brcmstb.c:302:6: warning: variable 'base_clk' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>           if (res)
>               ^~~
>   drivers/mmc/host/sdhci-brcmstb.c:376:24: note: uninitialized use occurs here
>           clk_disable_unprepare(base_clk);
>                                 ^~~~~~~~
>
> base_clk is used in the error path before it is initialized. Initialize
> it to NULL, as clk_disable_unprepare() calls clk_disable() and
> clk_unprepare(), which both handle NULL pointers gracefully.
>
> Fixes: 2cecaac1b21c ("mmc: sdhci-brcmstb: Add ability to increase max clock rate for 72116b0")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1650
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-brcmstb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index f8dff8537920..28e9cf995c41 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -256,7 +256,7 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>         struct sdhci_host *host;
>         struct resource *iomem;
>         struct clk *clk;
> -       struct clk *base_clk;
> +       struct clk *base_clk = NULL;
>         int res;
>
>         match = of_match_node(sdhci_brcm_of_match, pdev->dev.of_node);
>
> base-commit: 10980053142d8a3e86eb4d3014574424b42b7a45
> --
> 2.36.1
>
