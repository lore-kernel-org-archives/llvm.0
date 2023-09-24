Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256B4D52B
	for <llvm@lists.linux.dev>; Sun, 24 Sep 2023 17:06:28 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5043a01ee20so5583306e87.0
        for <llvm@lists.linux.dev>; Sun, 24 Sep 2023 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695575187; x=1696179987; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gG8vnWQHvQhRnrvCqdEqT6JTTQ016xPNLohZ4GJlrMs=;
        b=Yiih18Pc7bHwK50af8p9KkoWiKqJWcG76Ar04athCvD0g4DrSaEihG6w3toFamwzl1
         HRHCS2Jj4waMS1sp3ULlOfmb9uvZtZHZkCia7aLOLlG9ly+why0j1ILFIxGjkVWX6HuR
         /x79Y5SPOBwgXogUCgMOTPpXW/a4OriyY1BB+Kiinn3BFW8zGzpBjrv6g8Iwn0QYpcID
         wIAIFip/TXZI9jVUWHasn+Us7eL9EVfFDKz+YOkf9TszViBWnV43NbBymIoIUY0FiZrp
         Zd0PCm7I+uM4zIH1bueLYd79zifZwQhEKx8k1YPXOZqxkqAT2/iV7BMWn1+SAlV8Q8rE
         14RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695575187; x=1696179987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gG8vnWQHvQhRnrvCqdEqT6JTTQ016xPNLohZ4GJlrMs=;
        b=Mnh+Nk7mFuCSdNsB88WH0LaFk5SiZP+XNj01CkXDPkxj0/dn76AsNZv7fYAK2xa7hW
         AJMynqSBoSGTvZ9svu9Sp7+zetn4tz4YJT64i8SDcWLLs6aVmfn0eOdW4Kk0lUOiEsH+
         2Kh0ybqGhQlblY1aJ4iLhQ3t9HS0m7YThWQKjQMNhE31ehZG8yUGZBdNTHpWbTJZpIcO
         vHsfSW0ezXADZxbwIiMKnvuFyTKa075xFIiiDSN+Ymwvv5YtD671aA699hW5ttMlZms8
         5/8iMTnVxM+gTZ+Vunveu1NAmYRgLb+LYXHa6ImHxEkWXXkJvqc3Fpv/Ep9fTtncaYmg
         8Sxw==
X-Gm-Message-State: AOJu0Yym5W4YGDEWflc+XORryeZ5GN7brsmEki7uhQa9Iam7HQ1ne/4W
	KzDaOPFa7IiXxVNtb4Riu10=
X-Google-Smtp-Source: AGHT+IEtoFr2Pbg8fZweBJMsD1JXTiezgzBgcOIx0X/hI7Iqh7usEJ41J/mea3D1UezDz38TmVOXRg==
X-Received: by 2002:a19:2d01:0:b0:503:36cb:5438 with SMTP id k1-20020a192d01000000b0050336cb5438mr4050615lfj.21.1695575186869;
        Sun, 24 Sep 2023 10:06:26 -0700 (PDT)
Received: from [192.168.178.40] ([146.52.231.36])
        by smtp.gmail.com with ESMTPSA id y19-20020a056402135300b0052fdfd8870bsm4476566edw.89.2023.09.24.10.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 10:06:26 -0700 (PDT)
Message-ID: <bc42418d-117e-8d69-2630-0f072b9e196b@gmail.com>
Date: Sun, 24 Sep 2023 19:06:25 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] scsi: target: tcmu: Annotate struct tcmu_tmr with
 __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175300.work.148-kees@kernel.org>
Content-Language: en-US
From: Bodo Stroesser <bostroesser@gmail.com>
In-Reply-To: <20230922175300.work.148-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.09.23 19:53, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct tcmu_tmr.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Bodo Stroesser <bostroesser@gmail.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: linux-scsi@vger.kernel.org
> Cc: target-devel@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   drivers/target/target_core_user.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
> index 22cc6cac0ba2..7eb94894bd68 100644
> --- a/drivers/target/target_core_user.c
> +++ b/drivers/target/target_core_user.c
> @@ -201,7 +201,7 @@ struct tcmu_tmr {
>   
>   	uint8_t tmr_type;
>   	uint32_t tmr_cmd_cnt;
> -	int16_t tmr_cmd_ids[];
> +	int16_t tmr_cmd_ids[] __counted_by(tmr_cmd_cnt);
>   };
>   
>   /*

Reviewed-by: Bodo Stroesser <bostroesser@gmail.com>

Thank you,
Bodo
