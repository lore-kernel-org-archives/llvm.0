Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD9F18C11
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 12:09:23 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-76c64da0e46so137954439f.0
        for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1695470963; x=1696075763; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAvg21g6nbbw1h+/pTYxIjGaQhk7mPIWAIow3O+el8w=;
        b=NuSF1v3rZ+3K81w1j01AM+MtEXCBnKkAK2zjHSTSLRPQWC2+2w+L6bGthwpDJxjsjm
         eFAgE+Jeuq+Vi7RIIQ5aWXGv4dA73HTPzub0j+DTOQbUXYLpbwKVb5L0CbAtDGuXRSKp
         pCBoqiZ0OJCk9XkBuLxqP1gD9uVN/4HBFM1HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695470963; x=1696075763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAvg21g6nbbw1h+/pTYxIjGaQhk7mPIWAIow3O+el8w=;
        b=XSr3f74OJ73//jFuT0SiWtnOuR1Uk2h4pTSvs8WsGL3AitJJEg1rRz7XkdjySTW3jK
         ToyR5UNigDNga2wEvE5kGiKE/0BPqqfm0F1+Q7PpKsexoy3Ob+Ujj1l3KyX6nuQ4I0A+
         QVtvUfhk3xsbw8Peds47gxzHpvLbPxc7qesNDvbSGYOOuy85UtGNLWvyYMa/BmIyOGmX
         YHTgJYBLiOAwlhTOpbJbec+Slv9WjC2cYqPBNtAUCWxKEUEnA/SK6lXqTm81s6J6XLC2
         49tuN2NVEgQy5OUjfaB1DHgYqyaH8W/P3Yr+5f0pKOjtn6M19gmyRcPdRZ39eG9cUm+r
         /YIQ==
X-Gm-Message-State: AOJu0YxdZjz9AhDR36TnxnMbODM0Sh+9d5jqe1aK07e3kSiMI/GveRC+
	6ppRVt3vQKmK5jh71NpOipaoUg==
X-Google-Smtp-Source: AGHT+IFsU/+zIHTFsRo6MskEzPa2bwVmahshwKY2z15uRkbrNeJwUhIadfi6G6UMDY5d9luXaBJ4hQ==
X-Received: by 2002:a5e:8d0c:0:b0:790:f866:d71b with SMTP id m12-20020a5e8d0c000000b00790f866d71bmr2106815ioj.13.1695470963122;
        Sat, 23 Sep 2023 05:09:23 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id ft16-20020a056638661000b0043a21abd491sm1610905jab.120.2023.09.23.05.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 05:09:21 -0700 (PDT)
Message-ID: <6f52f36c-be16-2427-c19f-0e8b3dd2ff5f@ieee.org>
Date: Sat, 23 Sep 2023 07:09:19 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 08/14] net: ipa: Annotate struct ipa_power with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>
Cc: Alex Elder <elder@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>,
 David Ahern <dsahern@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Ajay Sharma <sharmaajay@microsoft.com>, Pravin B Shelar <pshelar@ovn.org>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 dev@openvswitch.org, linux-parisc@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922172449.work.906-kees@kernel.org>
 <20230922172858.3822653-8-keescook@chromium.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230922172858.3822653-8-keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/23 12:28 PM, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ipa_power.

Looks good, thanks.

Reviewed-by: Alex Elder <elder@linaro.org>

Note that there is some interaction between struct ipa_power_data
and struct ipa_power (the former is used to initialize the latter).
Both of these contain flexible arrays counted by another field in
the structure.  It seems possible that the way these are initialized
might need slight modification to allow the compiler to do its
enforcement; if that's the case, please reach out to me.

					-Alex


> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Alex Elder <elder@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   drivers/net/ipa/ipa_power.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
> index 0eaa7a7f3343..e223886123ce 100644
> --- a/drivers/net/ipa/ipa_power.c
> +++ b/drivers/net/ipa/ipa_power.c
> @@ -67,7 +67,7 @@ struct ipa_power {
>   	spinlock_t spinlock;	/* used with STOPPED/STARTED power flags */
>   	DECLARE_BITMAP(flags, IPA_POWER_FLAG_COUNT);
>   	u32 interconnect_count;
> -	struct icc_bulk_data interconnect[];
> +	struct icc_bulk_data interconnect[] __counted_by(interconnect_count);
>   };
>   
>   /* Initialize interconnects required for IPA operation */

