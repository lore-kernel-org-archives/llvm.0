Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB63318046
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 21:15:27 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c93638322so1211932366b.1
        for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 14:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692134126; x=1692738926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFaPUM6OGKjL7heKdSNW4ylbvnWM2Tax9xH36Ej8xmI=;
        b=p8e0jbjVH5XAqy90r+q8Ggo5ZQbgRA90aMDTQVbJCe93sdd5qbcoKqLTjOAPzJkI2c
         f+VFUkJUG1dt981Sa2W1qtnfXf800u/TYahnWDh1VZNMRXDbwWvku/2asYWJ6Trw5dxW
         aPtQqUf4Y7+FapIjLVG4FzEMSCH0j5Z4YuM3RHgcMKTvjC9zuVJzltVruWCKtc7VSeAQ
         VZkLFVKgAakXLRcmDdPbPAr5gBwAwrYm7Myb0WROFW06va0c7MiWlX/fF2ehgnRfiBrV
         WPGSqwOttNcPiWHE7C6HFDkFNDPuw4t+IwRRIuCvRwtAEqIqHm8weao9A1xH+CL9lTFa
         KJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692134126; x=1692738926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFaPUM6OGKjL7heKdSNW4ylbvnWM2Tax9xH36Ej8xmI=;
        b=N6YTxyw1AO4DQ/3gYz68mrc4sAmsfzr1GiZ59fGpu0I9PKDDmF8vhQewFSUzzOpbPp
         4QrUp/PQD8Pnd5q8N8op9GN1e7V3CbEuWEhIxA+1y8GgOVKAxp0Qt2OF0IZPPUkI3Rc5
         PoC5K3hs7sMsW/ylyAh7zJlrRw1FkAoeJ33JTWCwTV2Tp3ziA3irCfrF3ZhmT/bmiHUA
         vXxodPomoTO0iZ6aeaT9CJWek0m77joewC9MavXkt08Xlzn+zyB5ERd82c28db8YhvuE
         gnFz4w6X6rm6tcLK/yZEsorhda+kBwhqfEcStvYg9PCYACfdveSKxv9iOWlg4+qYQoUv
         EAnw==
X-Gm-Message-State: AOJu0YxgCtzj9K7YVaw/4MUY4WlHATbooytoGLCZs9Jnp/C7GgMv9P0O
	Bggmz6uEHQjaFo2vtm+BYlpuBg==
X-Google-Smtp-Source: AGHT+IFabPaVP5DLcR7BtAD/7NeRP9lI+iUrNDDK9QJZ/8aQeCjq4VfiMHtSwPjZfUeGEMTtx/nJFw==
X-Received: by 2002:a17:907:96a0:b0:99c:c8eb:51b2 with SMTP id hd32-20020a17090796a000b0099cc8eb51b2mr3483869ejc.2.1692134125829;
        Tue, 15 Aug 2023 14:15:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id s10-20020a1709064d8a00b0099364d9f0e6sm7441940eju.117.2023.08.15.14.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 14:15:25 -0700 (PDT)
Message-ID: <a7956e13-7b94-fb65-8b43-f2c9fd014353@linaro.org>
Date: Tue, 15 Aug 2023 23:15:23 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
To: Justin Stitt <justinstitt@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2023 23:11, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/mtd/maps/physmap-versatile.c:209:25: warning: cast to smaller
> |               integer type 'enum versatile_flashprot' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         209 |                 versatile_flashprot = (enum versatile_flashprot)devid->data;
> 
> This is due to the fact that `devid->data` is a void* while `enum
> versatile_flashprot` has the size of an int. This leads to truncation
> and possible data loss.

Cast does not solve truncation. This part of commit msg suggests that
you actually fix real issue... and that is an issue, because then
AUTOSEL will grab it. This is just compiler warning silencing and rather
coding standard correctness, no real fix, so please drop the sentence.

> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: There is likely no data loss occurring here due to the fact that
> `enum versatile_flashprot` has only a few enumerated fields, none of
> which are large enough to cause data loss. 

If there is a data loss, cast does not solve it.

> Nonetheless, this patch helps
> towards the goal of eventually enabling this warning for more builds.
> 
> Signed-off-by: Justin Stitt <justinstitt@google.com>


Best regards,
Krzysztof

