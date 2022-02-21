Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFA47B
	for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 08:15:52 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id cp23-20020a17090afb9700b001bbfe0fbe94so4872796pjb.3
        for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 00:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jCMFZ1ObGRig15tyTu88rTtsxKXlSOJnhDbMsM3o11A=;
        b=aC2WbzoDwzo53ITq/Crucnqd1RgUMblO4+fef9vofdV+S6f1wA2IcoTIjXcBkznw5G
         0J0/307ObK3ulR191AeJyKvfOOKs5U1BHefROXvi7gcuvGVGssS0Ixn4fP7YZE11rA8/
         HqWIqOT6/s1YYZ7nd5tpBxX1QAvWWbs7grA7U+hhM6YynIM+1pnz9qABisLUhWN5oFxy
         7uwVbBOA2k14IbcSf/L31Q/LP4hjBomDfecNhvdT8VtpMjuRQUdcgPu2AL2fZ4TsLxrd
         msVnbsF1OSijaiPNwhVCDtFTWDsT5KHc5wTx6JhDJVRRSh2ftaupZI5uC2ww7+l7yKxN
         7wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCMFZ1ObGRig15tyTu88rTtsxKXlSOJnhDbMsM3o11A=;
        b=2eiZJfLP7+P+uqcaCgyWwv4hot5ZcMczA3FgcqdZI0kMfpd/TUAxbmztpJdw/3Wouv
         dVuIzUJ4blOzs+QmfXz+X0VmfB1+xhaZqpACqKMMRaiGj7q0+I4B+7hC6HvDNi0vPMmu
         3eeKnIUfXkxdfROJyZHhdUzYuc/+aXR81W4Z6PFyvlwdJwlEE9ryOAejLnn5V5YaVJe8
         2BynzCCNtF3PdZQLkFnFJTVuiEioBg8f4eFinOx49h3DF6zSeRT61wMUpCpjl+ye1mbs
         VcAS3lsD9GBnMn9OZn/j0HjT1U+mYjHNIM5xeSF0VQg7PnjdKaFcnX+77wv5L0xjoD91
         /C3w==
X-Gm-Message-State: AOAM5311MHmDrYoPrGfp3tjPDUCzWMFPR2VPgG3Q6sB7XMQtvrxQOlU+
	m8USdtXTr+dPeH6gzKBzbmfXJUskZnxXXcEQXea6cg==
X-Google-Smtp-Source: ABdhPJxqC8IntWTGIkwxaSbzZlf/e1TQHc/VvskdwImTwOoOP/5GwmVmHHvTd974hpZ3kK5UHqfiBwsHYiMShNsWHfQ=
X-Received: by 2002:a17:90a:b785:b0:1b9:d80e:5f55 with SMTP id
 m5-20020a17090ab78500b001b9d80e5f55mr20294119pjr.209.1645431351860; Mon, 21
 Feb 2022 00:15:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220219152912.93580-1-jrdr.linux@gmail.com>
In-Reply-To: <20220219152912.93580-1-jrdr.linux@gmail.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 21 Feb 2022 09:15:16 +0100
Message-ID: <CAMZdPi_t3__yRNJLZ1k-KO5ZOunfmcsX4_zSp5-9QbrFcgYY0Q@mail.gmail.com>
Subject: Re: [PATCH] wcn36xx: Initialize channel to NULL inside wcn36xx_change_opchannel()
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: kvalo@kernel.org, davem@davemloft.net, kuba@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, ryan.odonoghue@linaro.org, 
	wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Feb 2022 at 16:29, Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
>
> Kernel test robot reported below warning ->
> drivers/net/wireless/ath/wcn36xx/main.c:409:7: warning: Branch
> condition evaluates to a garbage value
> [clang-analyzer-core.uninitialized.Branch]
>
> Also code walk indicates, if channel is not found in first band,
> it will break the loop and instead of exit it will go ahead and
> assign a garbage value in wcn->channel which looks like a bug.
>
> Initialize channel with NULL should avoid this issue.
>
> Fixes:  d6f2746691cb ("wcn36xx: Track the band and channel we are tuned to")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>



> ---
>  drivers/net/wireless/ath/wcn36xx/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
> index 75661d449712..1a06eff07107 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -394,7 +394,7 @@ static void wcn36xx_change_opchannel(struct wcn36xx *wcn, int ch)
>         struct ieee80211_vif *vif = NULL;
>         struct wcn36xx_vif *tmp;
>         struct ieee80211_supported_band *band;
> -       struct ieee80211_channel *channel;
> +       struct ieee80211_channel *channel = NULL;
>         unsigned long flags;
>         int i, j;
>
> --
> 2.25.1
>
