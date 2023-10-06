Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7726717CA
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oF+E0Cjx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so19859515ad.0
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624811; x=1697229611; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYltLeYvbo/1mtF+cJGeNFCBhuyzY8y0TMwn8mJuDlU=;
        b=oF+E0CjxCvY3AVaKTwue87R7eAIEIpzzZzSSLbbz7x7CdVc4g3rpBd6qVDlHY/zhp6
         UbqGf5lhnTRJpK9M7Fza8ZiEdwlrD2gyHz+nPDlwYZf3B+GVgejy95WAMnc/ksS+7Wwl
         On9Zco1uj2N8SIuIMpsV/vUA8GRR515G2/5O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624811; x=1697229611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYltLeYvbo/1mtF+cJGeNFCBhuyzY8y0TMwn8mJuDlU=;
        b=XuwhZsXbOQ7eM4UMdtpFd1foQSUFhWSci6Cn51sTW7IwO8tLKuuSYaVOUjdzFz6qaT
         S0G4gnKCWwOvcAX9q/FaOrQKQ7nbXth1WkazU7KsKPCXf2+uNWcQn56vL9Wr+x3O4hi0
         w4b06WViyWwYc075mw3i+ZjKEnUFAMKyJJeF4OBRBoKA7an1FSui73YqSYnl2wznb42M
         3/lsYp41bcUYkgIOf/UdILFvFVhBI/yXqwq1a8ofYlHY6CQZ4stSb2JWdsk+/0QupnDb
         72zqwGf/QyRzqhtLFcxnAl/T6AmQjRqwpSx7aAdFCP5WH5UNRWIASy3g+6kk1cMB07d8
         /r7A==
X-Gm-Message-State: AOJu0Yym/Vqqp/A5HJNvZfnim8o+9yHs4+vfTD4jDpVRkx2SR5SPD/2j
	Zjl4M5XOISnzpeTOQiuuSV6b2Q==
X-Google-Smtp-Source: AGHT+IGoeOCB9BQIIYsDUHmHt0dNs5E/IqnYM+4JDPUgBzU2U7hQ3/G8hmfV02fZLGW6TulWR0YmQg==
X-Received: by 2002:a17:902:9b8e:b0:1c6:2780:3adc with SMTP id y14-20020a1709029b8e00b001c627803adcmr8091459plp.24.1696624810733;
        Fri, 06 Oct 2023 13:40:10 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z18-20020a170902ee1200b001c55e13bf2asm4349404plb.283.2023.10.06.13.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:40:10 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:40:08 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] regulator: da9063: Annotate struct da9063_regulators
 with __counted_by
Message-ID: <202310061339.56F7680B5E@keescook>
References: <20230922175207.work.576-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175207.work.576-kees@kernel.org>

On Fri, Sep 22, 2023 at 10:52:07AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct da9063_regulators.

Friendly ping. Mark can you pick this up?

Thanks!

-Kees

> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Support Opensource <support.opensource@diasemi.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/regulator/da9063-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
> index a0621665a6d2..82bf321ae06f 100644
> --- a/drivers/regulator/da9063-regulator.c
> +++ b/drivers/regulator/da9063-regulator.c
> @@ -158,7 +158,7 @@ struct da9063_regulator {
>  struct da9063_regulators {
>  	unsigned int				n_regulators;
>  	/* Array size to be defined during init. Keep at end. */
> -	struct da9063_regulator			regulator[];
> +	struct da9063_regulator			regulator[] __counted_by(n_regulators);
>  };
>  
>  /* BUCK modes for DA9063 */
> -- 
> 2.34.1
> 

-- 
Kees Cook
