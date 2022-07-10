Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC87A
	for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 19:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A282AC385A5
	for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657480405;
	bh=3hkmLeoPA94cguxwWVvXXxv3VcnHAir/c52ak4ViFbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ShhJs+CwJ0mATbKIljdmTB0BEj4Xh/8n7CNhzbStAtyoTJMmi8fD1azjRYNy8VmnY
	 5//BNxPQA2fYCY3AWQyLWV4os77A8LuA7JhDC5bWRJmAm8PuQk3ygJ9i/u9nmRLCjB
	 XnTbIFtVLLCl/snNNALgf3PTmLgwV7rVdNWXvZJIUrJb7ZVNH/ttX0U8fxv9a2dS0A
	 sJ4JslvKrnfcScwn995fBK0o+ZgfOTXShwmEcT60mCwhs++Bgy4PM8J8P3qlv8ePTn
	 9d3V8jAUMzx0PQTOLRuF8oNQ21AxD0JXL52iwnGEHZ7AOXlRIFvIIuvgwq+2uSQsIU
	 f6TDGpXuzyyuA==
Received: by mail-yb1-f178.google.com with SMTP id i14so5681066yba.1
        for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 12:13:25 -0700 (PDT)
X-Gm-Message-State: AJIora91h//A4mlCm9pVNyWxntWQXcWDR6IqVsMZTbhE1bf2fuv65CnY
	/MxF3xsrIZdtftVgNG+SPoypLXTyrVFtct3eOH8=
X-Google-Smtp-Source: AGRyM1v1+pbuX33zfo/UTqTwqWe49lEPj5DVrFrYna2ZGAzjmIVOdIfpTz0xQRfFfS93XK23Rrs6t1nulIoluusPsxU=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr14394151ybq.472.1657480404689; Sun, 10
 Jul 2022 12:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220708231520.3958391-1-ndesaulniers@google.com>
In-Reply-To: <20220708231520.3958391-1-ndesaulniers@google.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 10 Jul 2022 21:13:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0x2KJuCjupKuj6XAYUAeF47ZV4bWuEGUQFOcOK_Do2jA@mail.gmail.com>
Message-ID: <CAK8P3a0x2KJuCjupKuj6XAYUAeF47ZV4bWuEGUQFOcOK_Do2jA@mail.gmail.com>
Subject: Re: [PATCH v6] coresight: etm4x: avoid build failure with unrolled loops
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	David Laight <David.Laight@aculab.com>, Tao Zhang <quic_taozha@quicinc.com>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, coresight@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 9, 2022 at 1:15 AM Nick Desaulniers <ndesaulniers@google.com> wrote:

>         ({                                                                      \
>                 u64 __val;                                                      \
>                                                                                 \
> -               if (__builtin_constant_p((offset)))                             \
> +               if (__is_constexpr((offset)))                                   \
>                         __val = read_etm4x_sysreg_const_offset((offset));       \
>                 else                                                            \
>                         __val = etm4x_sysreg_read((offset), true, (_64bit));    \
>

This is clearly better than the current version using
__builtin_constant_p(), but
I don't think it's safe in all cases, since there are expressions that
are constant
expressions to the compiler but are not valid input to the assembler.

I would prefer to see this fixed differently, but doing this one first is also
fine with me:

Acked-by: Arnd Bergmann <arnd@arndb.de>

        Arnd
