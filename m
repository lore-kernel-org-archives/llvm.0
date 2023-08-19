Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE714A54;
	Sat, 19 Aug 2023 05:49:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3159b524c56so372130f8f.1;
        Fri, 18 Aug 2023 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692424161; x=1693028961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GDooX7y6opYRgfOUyrqtxnmqnDr/SH0R0pIwWzOytOo=;
        b=ROXIAov9Bl/vtXJf0tkYoIqoEQuFrdU8qlt6c9PFS4LxO8R1E5oWqoeTyhisCbdzg9
         np6YTzFcXIQex4Ijwg42qrFLzvxQO1FVbL0JETCv1G0/CpTkn+IrO8bsaUIQkYlu/0q8
         7A8tpQ8kupjdea2oVtAmS73qctEEJ8lHpNXcaMNgGx1T3iX1uMUPBA9QEprCHuGdOiTc
         mbuHZdDF/vXSRsW/JlTHhKMIiiOu6mF4ObcB0hTjQK6CyI6nJaWM17y56WDHLxCVULvP
         ZJSeU5bY1RMX/yT82GO2S8kqMit36OMaS0bG3bOZd0MQ8h/kHzb4fgv+eC0ds3BXDRc6
         2aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692424161; x=1693028961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDooX7y6opYRgfOUyrqtxnmqnDr/SH0R0pIwWzOytOo=;
        b=WGUWOubMwOPFrYE+L8rv1P/HUUTniV6vREz/LqHXfp4ocvAdoWCAtmkzAppL26nra0
         eBOPsDk3jGP85VUjvPa7+DXKgQZlSEg9PnXWkAnUn77KV/o0KN5IdXYTvgeczbvqRpnL
         poK+NNtti2DseIhQ7bZFdwVpYZzgrRGAs9xvTgyOGGbDQZGjEdXAlecnv16Op3Q11SCs
         4BNHtjNwCoSPnBHXFGVw2OMKuDbLpiFsK2MW0mSfxFOahdfljQH1hYbN+tAYMSY62mtc
         xtYM+T/oMtuImpwVmtUr5+T1A7ClPWCYR8Yhr3moFVK0c0pv1mzZgzhDktRiCai/636h
         2UQA==
X-Gm-Message-State: AOJu0YygtwbgrvoVxNRRS24e4hxoXFbgec0NiUdyzXu8cPTiZ0eQkO0U
	PJ5VuOfn0TLoPWEMuo/qlaQ=
X-Google-Smtp-Source: AGHT+IHmuj65VHkTwaHKhiexS5RVDQnXf6GhithcHiUsDTuTB7U+bi7kvEsm+aEY53Yu2BT+UHYeRQ==
X-Received: by 2002:adf:fc42:0:b0:31a:e29f:5eab with SMTP id e2-20020adffc42000000b0031ae29f5eabmr646983wrs.7.1692424160702;
        Fri, 18 Aug 2023 22:49:20 -0700 (PDT)
Received: from [192.168.0.100] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id p11-20020adfe60b000000b003176c6e87b1sm5079305wrm.81.2023.08.18.22.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 22:49:20 -0700 (PDT)
Message-ID: <86235749-8629-230b-74f6-2b2a29af19f9@gmail.com>
Date: Sat, 19 Aug 2023 07:49:18 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] staging: rtl8192e: Annotate struct rtllib_txb with
 __counted_by
To: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Yogesh Hegde <yogi.kernel@gmail.com>, Sumitra Sharma
 <sumitraartsy@gmail.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230817204523.never.034-kees@kernel.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230817204523.never.034-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/23 22:45, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct rtllib_txb.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   drivers/staging/rtl8192e/rtllib.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index c5a692dfcd17..543d8671281d 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -818,7 +818,7 @@ struct rtllib_txb {
>   	u16 reserved;
>   	__le16 frag_size;
>   	__le16 payload_size;
> -	struct sk_buff *fragments[];
> +	struct sk_buff *fragments[] __counted_by(nr_frags);
>   };
>   
>   #define MAX_SUBFRAME_COUNT		  64

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
