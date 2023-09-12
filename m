Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306D33E9
	for <llvm@lists.linux.dev>; Tue, 12 Sep 2023 20:09:33 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76ef80a503fso371532585a.1
        for <llvm@lists.linux.dev>; Tue, 12 Sep 2023 13:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1694549372; x=1695154172; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8AmbzuBNjG3pvuD2vEMK+EvxK+MhEsb4d21jgaPxZbE=;
        b=c6CRH8Q37KMhsHhXHAtpO50ZT4QAi/7Tg3HVx50FgfNdMXqLq8wALyMJ2phCyarB3p
         OBi1cmnWquSWuTDcqhIbq1yCigrxx2RNfnQTOOSBvoEHNp6x2yyLtxaFwXQQVJpZRMAR
         /1MW8atVlHT8dX1/fkVbN07qw65Jth6snJ1WI9y3p/CZ8xkKKUcaYkqiLjEVUfWgd9Ys
         hR9ldD5N8h5M8BVO7OjfV9n0YmVqQ+37qTH+3sUwaa64HBRJbCcgeWgysP8vdoH1GJ8V
         NHCTTa8vCYO/8bHtBy0mia78jK+wdx/gL39KhwOi9K9o7fSoJyGDU/Wo+vDMFLp4JDR8
         whAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694549372; x=1695154172;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AmbzuBNjG3pvuD2vEMK+EvxK+MhEsb4d21jgaPxZbE=;
        b=enSQ/eNlfSjkrP1IQy/FfKQba3lNzYTvASTqmubKI2sywjtsmXiqtBMr0LnxC51FK7
         RfMwFB3bDtxnGKOjQ+Maq9YdcmUYVEP+7cTQ2UdeapvoTxt2ou0YT4S2391PechxM96k
         lOFJI86REsmlNylx3g0xfGxSHsCYZ2u+cGdPZKhnWvYAG4SsCys+lkfVlMVT7BgOo+Pw
         +8fdNX6CgeZG7Uh8Wv2m26vKDxuduxlGYl9HBst3Dwz3XIWJA24u3DKdjCK/YrLgDYzV
         MARzouQPjGJRLLMwfIy8k2iijxnwgzXCP/WDqe3lqq1tnvmGtFlhUJ2gDl5BuJIqIdOH
         iluA==
X-Gm-Message-State: AOJu0Yy7XiTl6g7BDTEApMy9dCxt1Izmw8Ahambn7qYj2n9X6Q6GR3oV
	mqtjFtyqFPIC7OtRdx1+w8x1
X-Google-Smtp-Source: AGHT+IHhm9amGITUC1dlWWjtweGnOTF6yopgBiECKzU9eaLYygbZQmkBEK0hqu7j/mCxHSZaWII3Vw==
X-Received: by 2002:a0c:f08e:0:b0:655:db86:6c95 with SMTP id g14-20020a0cf08e000000b00655db866c95mr379534qvk.37.1694549372344;
        Tue, 12 Sep 2023 13:09:32 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id i3-20020ad44103000000b00655e2d0c268sm2354973qvp.15.2023.09.12.13.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 13:09:31 -0700 (PDT)
Date: Tue, 12 Sep 2023 16:09:31 -0400
Message-ID: <16ef84059b3adaafd3bc2d43ba9c1ccd.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Kees Cook <keescook@chromium.org>
Cc: Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] audit: Annotate struct audit_chunk with __counted_by
References: <20230817203501.never.279-kees@kernel.org>
In-Reply-To: <20230817203501.never.279-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

On Aug 17, 2023 Paul Moore <paul@paul-moore.com> wrote:
> 
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct audit_chunk.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Eric Paris <eparis@redhat.com>
> Cc: audit@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  kernel/audit_tree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into audit/next, thanks.

--
paul-moore.com
