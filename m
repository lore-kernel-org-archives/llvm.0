Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675921375
	for <llvm@lists.linux.dev>; Sun, 24 Sep 2023 11:48:30 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so4431764f8f.1
        for <llvm@lists.linux.dev>; Sun, 24 Sep 2023 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695556108; x=1696160908; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WxrXzUZdFoEnyidf/9NrxADttmtIpVLpZeUKjXRx3Xc=;
        b=JqDleGzDMnS85qzp/2rm9PJRQ/ZZNLQJGGtW7i1MCEvVcQ6BK5RJmrPXcBOgKfeZzd
         fUXCWIB/Uuo12tPbrX3Oi9lpT04acvGF7Z/ZqnZ2Pldgm5IhUOcltBK4Ww4mDfxYSkWZ
         xjh/EblIsDkDaBp2thz7uud/Y7ytYe8QH3exlngHd1Prox06CAO5NipMN5NUfHKAVm46
         JMP7COCFIiIvymnpLCErWqcx74W31ZiRleYzXtDI7NIztNpf/ijrtvEukldXy/oIOXnZ
         LJXNMOMF2sWGgp2wZQskBwUYFrNuBTYo3yS63Mh2EZ9u1rEpqC8giPaUtNQTNYLoN9cc
         txmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695556108; x=1696160908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxrXzUZdFoEnyidf/9NrxADttmtIpVLpZeUKjXRx3Xc=;
        b=InYsFmHcYy9mL8eQCpz5wa/aruL03iKiYf+RHcLlJ/FHZIbJPJVY1oAe6p745Ec8aS
         3Uxb9S+KRTPx16it+c4FK/rJQRazCKZrfKnEKJHJ5szgk6krPkEMX/czkhrhhPIzgKL5
         VmMcrlLwnlVFsC2iXNqoy0Xko4dFUm+hV/twQfAEgnVphiKvTEtgFZj7ZT2mAr6k5YuO
         W1lLI3X4VaqvPvHnGCxC2JAQaBH1zspfmVPfu5ihOOyqKo59XQ3nwHj31T5vC+ztcSe8
         +xZkFPFBp+5zVJEo56vH+NHM5VCgc23gjoGGnjqsuQNJipEnO/xukgkbN/YOLtPbp7G7
         ztkg==
X-Gm-Message-State: AOJu0Yyc/eGU+0sY/RuRwOyazM1yzI9JDvZD0YBMne1dUmvX0QQ/4eH9
	ZVrLTeQyIH9Dmnll+aJwhE0=
X-Google-Smtp-Source: AGHT+IHOtjQZIIOHnfbKyFj8xwTuyrfcKwU5lMGoiETzsAtEMOnLHasDQnbASJEUUyKn9mLJuNGH1A==
X-Received: by 2002:a05:6000:1819:b0:317:f70b:3156 with SMTP id m25-20020a056000181900b00317f70b3156mr3423806wrh.28.1695556108404;
        Sun, 24 Sep 2023 04:48:28 -0700 (PDT)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id k10-20020adfd22a000000b0032320a9b010sm1262983wrh.28.2023.09.24.04.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 04:48:27 -0700 (PDT)
Message-ID: <e326ed06-3f72-4552-a26d-5deae0678409@gmail.com>
Date: Sun, 24 Sep 2023 13:48:26 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/surface: aggregator: Annotate struct ssam_event
 with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: platform-driver-x86@vger.kernel.org, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230922175436.work.031-kees@kernel.org>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20230922175436.work.031-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/23 19:54, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ssam_event.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Maximilian Luz <luzmaximilian@gmail.com>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   include/linux/surface_aggregator/controller.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/surface_aggregator/controller.h b/include/linux/surface_aggregator/controller.h
> index cb7980805920..5b67f0f47d80 100644
> --- a/include/linux/surface_aggregator/controller.h
> +++ b/include/linux/surface_aggregator/controller.h
> @@ -44,7 +44,7 @@ struct ssam_event {
>   	u8 command_id;
>   	u8 instance_id;
>   	u16 length;
> -	u8 data[];
> +	u8 data[] __counted_by(length);
>   };
>   
>   /**

Thanks!

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
