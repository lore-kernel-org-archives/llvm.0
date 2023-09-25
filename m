Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D996FBB
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 07:41:08 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7a50a1d1246so2083830241.3
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695627667; x=1696232467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiYZdX9DU54hlyCL6A/xG5cg0RmJhcg6NNDUibAVUyM=;
        b=aCwktSD1WTy/vLbqiMRscl3OKtqpzcGx9S6HMImhXvBhUSdtYA9YKpPygH4h7i5LV/
         FBxm4/2z1HnJiml1te4cjdocKb7erQZT3vebACZ5fIkhgg19jXlnZMDFmoYVQK82q4wo
         xnr5yafSHgUwiL2liR0BGr2vOmuIIzL3g3FgjoDxznbBvDL/5IAYx1pQqjO9Xef+0NNz
         Nt3GnY1wLg7MjxBqL80N7kNQzie1GfJJLq4EdCpWCafD0T9ZnHsV7cTwPNbvUVX63vuY
         a4iTCgFM2cmPSmV08d5hdF7cSVSu/yRiGCQcSG6OxkzPofKSIL+HCSFO7xgQOu0SHXVS
         PPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627667; x=1696232467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiYZdX9DU54hlyCL6A/xG5cg0RmJhcg6NNDUibAVUyM=;
        b=Mq2YykkMUDgNAtUZkZRTLPp2brQ7rA1QTuTbwi8da/HFWj4lVbnIOkdqD20mtONlvD
         7zp7GvzPED8OAxK4LqYubAB0dYKWASUI6P8DD1IOvu12C75tGvmCNeVeeRs50oEJRwJW
         p/64+ktRRgJJna3iPv9oB9ikza+2QR8blMYBRPe2WyaIYqbN1UMr9z3A7dctzVhjqZTy
         ypsLkoft0D5PhXDajOy1vyei9V/68zrbdLIuCtaJRfh58B/VB+8eRh8zOa4uWj2C1yep
         8ackE68rhDJkE04Eut0VUOBIVZbTx1UPpFKqyqQyTDZd0MtGEaezEw/GAhg3eiSFi3sc
         yjMA==
X-Gm-Message-State: AOJu0YxbjnRk1PnBHPnJLXf371ovaJvpKA9LdZr0mrnXHmcZXRCwWbRR
	d2AwvabywDyrQ3KGFX9oVCce69FFwOEQmAHVDSYddA==
X-Google-Smtp-Source: AGHT+IFx82zmsxjoLuNTPGGd8GrhippPyNF9FQn3hKIpX7aWK+Ny/ek0o4jNsCfrxS8J3MiCNYA4klx50t41kyL94KQ=
X-Received: by 2002:a67:fb89:0:b0:44e:e7d7:6847 with SMTP id
 n9-20020a67fb89000000b0044ee7d76847mr2800971vsr.7.1695627667358; Mon, 25 Sep
 2023 00:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175155.work.872-kees@kernel.org>
In-Reply-To: <20230922175155.work.872-kees@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Sep 2023 09:40:56 +0200
Message-ID: <CAMRc=Md+BM0fGoO9SrnmKOKAmXmMBNJ9aBvuOCfKpT94rhv+zQ@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Annotate struct at24_data with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-i2c@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 7:51=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
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
> As found with Coccinelle[1], add __counted_by for struct at24_data.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/misc/eeprom/at24.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index af83aca452b7..7dfd7fdb423e 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -92,7 +92,7 @@ struct at24_data {
>          * them for us.
>          */
>         u8 bank_addr_shift;
> -       struct regmap *client_regmaps[];
> +       struct regmap *client_regmaps[] __counted_by(num_addresses);
>  };
>
>  /*
> --
> 2.34.1
>

Applied, thanks!

Bart
