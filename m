Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4802820CA8
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 19:44:19 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bbc06f830aso9579425ad.0
        for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 12:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691696659; x=1692301459;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y7zOvxXwIuA5rgiamcnWYKungJc3z5komgZPppKVkg=;
        b=D0sQojkFas15jrjLj99bibUCBLyzaQ7EgzRCtjHmB2i4oUZHoeNZLK12l/pTqSvM0T
         q6y/4jjDt61peozlrloDOuif9MPZG/sgfEQLyRBiA5oLQNfPwLqYTbYMqTNzSEvc+vrc
         83aOhjzfayJEp76O/mjpCco4pZPBabArlbwQnjtw8WfLRWhwz97rli2Y+wH4/C/Q33xs
         WQw9CYmYUTxikLEWcV2Q25ZtcBWMP9U/CmM73HHATYmRnGCFa8K5dEtcgkWln8nclwub
         vqiEVq4AMBdLcoqur0nyjBxwgKeqG7aze6fs0uZjelm6XtXjvGb5cEhAvGoB/PEohCEq
         oQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691696659; x=1692301459;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y7zOvxXwIuA5rgiamcnWYKungJc3z5komgZPppKVkg=;
        b=K2HtMAjtphGiqNJhtf3GK9QOCJCQGWw/uUbO9Z3YN8bBMzUDdhx7YeuABSu367BLwA
         RvOww/bYR82ZnjKAaouClRxnk/DZUCKVbjmIPfS0kF35T69o1FTOLlabN9hGJDCKtz2C
         fZe94SaBIzDBlJE5JBomZu5IOFQpC/dDTlkogo9phjQ1TQ3Tns7wYvtL4FcBZptEo2h9
         NPOgfLcRvE4MasOQL7C6SU8AGeuGhr5Z8/zmJimZP+9r0UGRI+9uYc7krHTcg1WySVAN
         4HefxPpEajHZCMy6zz8gOhZc/Lh6zF3WdxqCESVEehyH4nWp7UmSOI4yjMS8fd8TWtuD
         jhOw==
X-Gm-Message-State: AOJu0YzZGZ2Re4g8wgp2JPuAJq9/m1NGE1oZL0ydTqGh7lyqfwgO5rss
	Ke4g0YAXM66XjFbcm+6VmY+ggg==
X-Google-Smtp-Source: AGHT+IE2eIz04tQ3tBDeTsX6jx4bnSOGfuo5x1j5j2oFvlwLIMiEXDUvEPMKiaI3BkU4/JtlhziMaQ==
X-Received: by 2002:a17:902:a40f:b0:1bd:9c43:c887 with SMTP id p15-20020a170902a40f00b001bd9c43c887mr3338597plq.10.1691696659289;
        Thu, 10 Aug 2023 12:44:19 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id je1-20020a170903264100b001bb9aadfb04sm2160601plb.220.2023.08.10.12.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:44:18 -0700 (PDT)
In-Reply-To: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
References: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
Subject: Re: [PATCH v2] riscv: mm: fix 2 instances of
 -Wmissing-variable-declarations
Message-Id: <169169664361.3729.4946663711060334827.b4-ty@rivosinc.com>
Date: Thu, 10 Aug 2023 12:44:03 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
  Nick Desaulniers <ndesaulniers@google.com>


On Tue, 08 Aug 2023 09:35:00 -0700, Nick Desaulniers wrote:
> I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
> bot spotted the following instance in ARCH=riscv builds:
> 
>   arch/riscv/mm/init.c:276:7: warning: no previous extern declaration
>   for non-static variable 'trampoline_pg_dir'
>   [-Wmissing-variable-declarations]
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       |       ^
>   arch/riscv/mm/init.c:276:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       | ^
>   arch/riscv/mm/init.c:279:7: warning: no previous extern declaration
>   for non-static variable 'early_pg_dir'
>   [-Wmissing-variable-declarations]
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       |       ^
>   arch/riscv/mm/init.c:279:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       | ^
> 
> [...]

Applied, thanks!

[1/1] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
      https://git.kernel.org/palmer/c/d2402048bc8a

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

