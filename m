Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11433148FE6
	for <llvm@lists.linux.dev>; Wed,  3 Apr 2024 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150778; cv=none; b=kjhVoXMQVH/g3eIZpsCRxZb4KWrK33N5kfh/1LhNG+in8O0r9UlW8AkikI4vSgRR6AMJvXgPPeAzY+ORgHeFtgSeU7Evj8/7+rPDSwrWit53/ClTPoUD5G/JojjR0nNXbiQ2xogublkvMKviKtC24PdsAFqjLHJRouSSyp21qBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150778; c=relaxed/simple;
	bh=/ZFx3ebO9y9cafs7GJSvKhCZCl2L53c7NYdEippbANY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nC2J2NTSuDA7bn9AqUmEYKmEVbJIv7wyU2mwTe00qPDk/DBRCMn5VYlY1gWrDn5uLY+KFlp/ebJYunfpCcSP/VKi00E63/PmrJxmJLx8nKK7G/aVjcTpZJfJMi2N6FbcUKenk4taAKyaPfENZEkIdSDzrwz3jFRoYNpE8gybVts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umwxK4KK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umwxK4KK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2a271c6d3f1so1091656a91.3
        for <llvm@lists.linux.dev>; Wed, 03 Apr 2024 06:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712150776; x=1712755576; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kr5yQL8fx0u0tyLMbu3sLuMSllEG5G+mAeHccxYfdVY=;
        b=umwxK4KKByOj/COu24jV2itAunqLtVyHvkAADbIOoxCfowx0BRpkqHf0JeQ1qCIA+4
         yBS69PiFLlb0vtW8DulIstDQGcyk7Q0DrYt8XMn6fgQQjk9qrpVC3WXWvG0qSc65cDPS
         yV8s6LLCBWSWXKrrsgnPjIfhmH4d/mgF+0IvIjwJvPCHLmAyu625+JsJ1HGaMOhwW69J
         qB4KiuZSRLbqp3ktQbjdUrU6CGCLdsg+ZAdZVWPZgTULSssZCbiB50oOaDU6wR+bbbY8
         Hm0EnZCxNLFk/Y9LYo3NzN2BE4ssDDerrdAQE/U6hJy0RndYWrvn4zQE6uSQXMoXZVXe
         biFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150776; x=1712755576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kr5yQL8fx0u0tyLMbu3sLuMSllEG5G+mAeHccxYfdVY=;
        b=UFOfPvxrPO90ZU+sV1AW5fOhoDz96IfSTyQtvonpsDwVNoANDqEsnT8PuOeguba2jd
         xMlRKUPzmjulai0duzyqMLMNvakE66Inz6OSAQEuSikFyv5f1sHNVkQULppZCTvFg348
         cKVFfbQpx8wZZAhcgOT4wIC5VwpccD3gIwNJ8c3SfCgpHdzjP4nDspkh9yymZBncegyq
         sVn9cnD8+rHEWczXgf1iIo4BvGBaF4bWOjpEa4STCnPJqKQoWehCl26ZVtn4Q78sojo+
         wmckaod1HXc+xmI0RXVz6X5nGNXMsgy38IJ7MKJx0+yhHgapJ5eFtC3ZFtqzvBQFMSzF
         k2Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWAplMnMDwPOp1lNEu2hGNm6yQxdBC0b4uPypPNX910Ule6yPGqEEht8UQccRoSJSii3HByE6zCJZ5BXJwrouythtcIRg==
X-Gm-Message-State: AOJu0Yxsgakw1JediAxUnxSloS5Hvf2WVi8SobkNN34fvjfK84FwOwMe
	Pjnl9xvxaSxMhC1f5tKYzJlTizGfseocV28ajFpkXH7FZzUOtllaB7S3Sla/udVP3mfnyoZug1u
	rjvHuTEN7vHe8RAORlHmQCneaj/TS7OUzKU/SNeovSsTXCBLcU74=
X-Google-Smtp-Source: AGHT+IEak/WLSgffbuVSjwab06JTulWpxWfMzkQ8I6F5L8nOzPRvaiqB048L3gfCz5mrvMfqk7JY/JqIUVyg8IDxNG0=
X-Received: by 2002:a17:90b:19c3:b0:2a2:a7be:3b5c with SMTP id
 nm3-20020a17090b19c300b002a2a7be3b5cmr1005626pjb.6.1712150776261; Wed, 03 Apr
 2024 06:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtj3aBdRreBmKZDQApEe2x8mugycPgN+_J5ebJzXDEq4g@mail.gmail.com>
In-Reply-To: <CA+G9fYtj3aBdRreBmKZDQApEe2x8mugycPgN+_J5ebJzXDEq4g@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 3 Apr 2024 15:26:05 +0200
Message-ID: <CAKfTPtC9YgbZgGNK82MhhzzsD3P6j64+w6oieJMDKQNOmrC4FQ@mail.gmail.com>
Subject: Re: kernel/sched/core.c:961:15: error: incompatible pointer to
 integer conversion passing 'typeof
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Linux PM <linux-pm@vger.kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"

Hi Naresh,

Adding riscv people

On Wed, 3 Apr 2024 at 09:38, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The riscv clang-17 defconfig build failed due to following warnings / errors
> on the Linux next-20240402.

Could you confirm that there is no problem with other arch and/or
other toolchain ?

>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> riscv:
>   build:
>     * clang-17-lkftconfig - Failed
>     * rv32-clang-17-defconfig - Failed
>     * clang-17-tinyconfig - Failed
>     * rv32-clang-17-tinyconfig - Failed
>     * clang-17-defconfig - Failed
>     * clang-17-allnoconfig - Failed
>     * rv32-clang-17-allnoconfig - Failed
>
> Build log:
> -------
> kernel/sched/core.c:961:15: error: incompatible pointer to integer
> conversion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node
> *') to parameter of type 'uintptr_t' (aka 'unsigned long')
> [-Wint-conversion]
>   961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There is no recent change on this code. Could it be a change in
cmpxchg_relaxed ?

>
> Steps to reproduce:
> ---------
> # tuxmake --runtime podman --target-arch riscv --toolchain clang-17
> --kconfig defconfig LLVM=1 LLVM_IAS=1
>
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264917/suite/build/test/clang-17-defconfig/details/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264917/suite/build/test/clang-17-defconfig/log
>
> --
> Linaro LKFT
> https://lkft.linaro.org
