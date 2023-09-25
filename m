Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AED10956
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 07:43:08 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4526f0bdf72so2080356137.1
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695627787; x=1696232587; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqSSfRt2FX1iJgBnNFLYuQcx0Izo1QKFxQpbwmgNxLk=;
        b=YOUQjFjx12hlcPKLOYgwPWOE9OtBpLY55dap8VRfJ3/ALPd0T5Wx102Gh3NPNc2e4t
         T/hoTfx8xhTvQXW099Txtg5SnV7p7h438MMXT2wW2FkBcZBLONtaCgIDgmcjAat7YPl3
         4P4zetAujitjnuhbqCU5+/uS4V4+eW76CYKJg9xYb4xjzJoPRlusqDDxFmTwdhN4Y3sU
         XYnDfLzhvI+pAHBqTOVYss4CMkGgRGsWtfTm4HyBUau51FOSQJid4Afs4b9QyXLhoY3g
         gal2BvzPkm06XU12ym6iELiKYDxRGzZ0Na7aQKd6U2YXtettp+1FbbLTErwfNuhPjkDq
         OxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627787; x=1696232587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqSSfRt2FX1iJgBnNFLYuQcx0Izo1QKFxQpbwmgNxLk=;
        b=fogy1bhruf/1yUaqvN+drP5r5ddLaaQ5Zdnlog02E4ykYqp0TBh8sjR+P5O7rSBfAr
         Jyi0yltfjcLiR+rh7sHilR6AuRMDrRhowlw8Dq2Fyc/JDy9uDL9AOqcSmKVgj++Ns/es
         zKT2pxLsD4Qj0UrRMHhWM01k8gns9zrGi6YSuOiFzqouuswBSBJi+aIEIFkkuxXVimLA
         TYwCtvZZQJJCVKDUb2jsYoX7w9xMofNVUYP76NHxHqyzpUkh4XNnJHr3SCG+g99pqGMa
         92dgxtYWcT/s0vYbXg3Nqu61d0c5fDm/EZphm++ga63OMD6f5D/YUgHmGKmAch3wNjtk
         uMzw==
X-Gm-Message-State: AOJu0Yz023dJgcwaERtRvoL+Wj0fFjVYhl+PD5BxlayCSC0O8e6Zu1yA
	8ieaGGI9S6SjU3HPUdonWZGJi8pKC8+sTqqlZ+Nw0Q==
X-Google-Smtp-Source: AGHT+IHcByVh1sZSB41P6ROWWyheYWiE63uzqjuBPnfCzpm9MQIkcZT8WWBea8nPFnPgbSK6agxpxLCyYwLxfeakN18=
X-Received: by 2002:a67:d014:0:b0:450:c5e4:4869 with SMTP id
 r20-20020a67d014000000b00450c5e44869mr2873248vsi.25.1695627787321; Mon, 25
 Sep 2023 00:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175203.work.760-kees@kernel.org>
In-Reply-To: <20230922175203.work.760-kees@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Sep 2023 09:42:56 +0200
Message-ID: <CAMRc=McijWTgX8yvar_J=boHfTPXmJftHnfLENj1XXseKLyL6A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: Annotate struct linereq with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 7:52=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct linereq.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Applied, thanks!

Bart
