Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D913ADF
	for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 09:00:04 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59eb8ec5e20so131509937b3.3
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695805204; x=1696410004; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TutIAe4KzHZUJ9ATW3VpQ4iw5gN1jLgS94r63g8BT3A=;
        b=DDED4ytv71gxHEHZtPuj/l6wCpTKci04iNiY1VlxO0z21kKfC99GJ7lTcVRdpdB6DR
         mjtNlLMA61oA5tWZGfysnnfM/S6adzvPW0DFnATT/G6YYmQMTCV5gV5Z1Q/QRw0GJXjm
         GBjlWNaVTC4KyRDpCqBZSch2jc4Lnl8fSU4vUMIIrw0uac08gJG1Nqa7q4cXVbQBmenY
         SghGxHdwU/V8nn4DZD+eNcwypJ5wiwW1xFyTA0R/Ao9GoljODC+VYD5WKy14jx55Vo2H
         4GOJg+FskSazdbdks6xNRYLFbzjSQksBzrjhZx3oB0dk3Z8ssBBAfIB9ha1/oxmc8JWj
         tIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805204; x=1696410004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TutIAe4KzHZUJ9ATW3VpQ4iw5gN1jLgS94r63g8BT3A=;
        b=N6TFnmRUib2Y/oBS+gp7ltgKtgFTkql+HlR7FCJTeg0zsS1kn1qTyoKX66o56Pzxoh
         t9rHHx0FnBpusWrmmc+HBs3zA3iL/Cs5GrkqUPTmaPyvkc0JFU51jQRtqJ4nOg2yUQTL
         s+w9z4CH40YmXtizgo3ybRAO4zjpJXzqSwGOfjKK7+m2Uaj+DDfnUbfw1CKKv30utrs8
         08EN2wcVLTZVvt4GQONvxEPlvocb8g4vFbQN4ESF+U3d8jWl/Uzc72Lskv2oUSdz2+Kq
         IeP4ubYQPDbzvXbZTwsQX0G5RipwZluMVFgXHGJP/kXfPvBQRqy/oOT/kfoWKzfz4EPR
         7gZg==
X-Gm-Message-State: AOJu0Yw2HSbXI4fKUpbztEdMMeRN4DSZw2QeZfZnnVRgkVDZOZftoCbr
	wbfX+OHnDP99CREseX2TIgrwDsgB0l6xa1MsGecU5A==
X-Google-Smtp-Source: AGHT+IEnVNlxtU365OSVa+Vju3oylJH3jIZadB6OzZFRZDu29MnEdrWa5VJAMDN8qQBkpr8ELeV9VjCIo0BH0fj47CQ=
X-Received: by 2002:a0d:df45:0:b0:59f:7dcf:edee with SMTP id
 i66-20020a0ddf45000000b0059f7dcfedeemr1832413ywe.9.1695805203882; Wed, 27 Sep
 2023 02:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175006.work.421-kees@kernel.org>
In-Reply-To: <20230922175006.work.421-kees@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 27 Sep 2023 10:59:52 +0200
Message-ID: <CACRpkdaVauiB0M3PNjGgcAj2Cw1gZ=NenkOuh=PKT=8uEYc5rA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: uniphier: Annotate struct uniphier_pinctrl_reg_region
 with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 7:50=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:

> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct uniphier_pinctrl=
_reg_region.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Excellent!
Patch applied.

Yours,
Linus Walleij
