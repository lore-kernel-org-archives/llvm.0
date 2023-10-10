Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2807F10F5
	for <llvm@lists.linux.dev>; Tue, 10 Oct 2023 03:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiynIaXV"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53b962f09e0so3976518a12.0
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 20:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696906938; x=1697511738; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NFw7jVHwZYrsuKeB3oiagILvwz0AJLaFyHBUay/pXI=;
        b=CiynIaXVow1d+QWVpyemfPWwfJO9s3GkuVUL3NN9DBjWqKPe/1osjup1gA40KsMGk5
         kyTzh3xy/Vi8vmrSDpQuJZTBBOvkX0ufJOYFx4eUyAV8S6atQWkpAST/2wE2u6wlGjTV
         4rbPhkyMk9UkyaT/L89m3d9GGnz88GAbilWh0+craCUEqoOHUwvK4JoYSGj2inBFGtaN
         sJXD81RMxXthQw95EE4oZWXalS0XedEFlbgjaGNsKVOzsQenD87yAjrT/Iqp2NsYSIyh
         fkWoC0l/ewx3b0okF0cD0084T0IjTVNzzWd66/ogPwsmlM21RxD74Ues2mmNB1idlNnL
         8TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696906938; x=1697511738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NFw7jVHwZYrsuKeB3oiagILvwz0AJLaFyHBUay/pXI=;
        b=QD6Cq/fquxvj1KtLoJVnu5baxTVtRah7wQJnF98Ps+ijdKpl6Q6vFA+GUM/EwNYJjY
         iQTvYNvVTBbUHwmr1t88fWd8nfuH5w/2CzRa6hvOY8VEIUAf1OrjHH57MG2fX1ePvyum
         MvrtLcTlV+z0tKeeKMvLT7UoyEuNd1NsGe7FLt9Rsopqgt4djYX92EBX4n7NPbDKhMeE
         Aj1ojwYvoQcnW2xMsrnw2MFB1ZwCN/XGfBzcZlVTzHi1580T6a3vWT0mSVq83gswbZWf
         pZcLIxaC18vgk8xszbJDIpq6I+8B4RcIbNhvFIOPbN/eIIXhqT3fypbf8LcsHAa6hcq5
         NoTg==
X-Gm-Message-State: AOJu0YwsfunGZCi8fTP02RDYJrXfswFOLzw3VOiWoq304B/h6Z4cVaPk
	W++1MRK+N4KJdwXYT2gfCrF6e7t6v1B0huIxItI=
X-Google-Smtp-Source: AGHT+IH6dZvjOAHSoyZ23JF4sn6FJyDLMeAw5grAZpTEz+0OBLlzvWWcjEkif2Tg9mP7XdnE3F8cAKLKbkxmFY5kzDE=
X-Received: by 2002:a50:fa95:0:b0:52c:92e3:1d12 with SMTP id
 w21-20020a50fa95000000b0052c92e31d12mr14278796edr.11.1696906938155; Mon, 09
 Oct 2023 20:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009161028.it.544-kees@kernel.org>
In-Reply-To: <20231009161028.it.544-kees@kernel.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 9 Oct 2023 23:02:06 -0400
Message-ID: <CAKf6xpvPgaSMA=oCMgXqoHWYfYt53_U1vAhvh1dX6HHytKjOwA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: p54: Annotate struct p54_cal_database with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-wireless@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 12:10=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> Add __counted_by for struct p54_cal_database.
>
> Cc: Christian Lamparter <chunkeey@googlemail.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Suggested-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason
