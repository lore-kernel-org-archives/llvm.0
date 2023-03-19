Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE1B7C
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 21:18:01 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id e65so10852753ybh.10
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvuN9jR+G4W2pj0hYHw8fCbcQee3vmX+JNF1Jp+xXy4=;
        b=ZvR6jfv7uP8WYBs2D1jZNN/C/OpwONxAwGY8g4y5Y6CCqtOnA+7n//k/XDwV9VBgTa
         XM1qNRq51rD9AuUOu3/TFVWZUsVA80XFrgGOUEvzM2KJWwA9VPihrLwVvSQAxa5k4JNt
         lTEBuZBYSCyL5+W3TcAAfnSixOanlqLP4dVI/9bdXGeS6XQEjHuVZSoZXF2vTFJ/J+lZ
         loH1NcRrBf4DdaCt6DSvW4YDdStWURtLpVJJ2SRk7Vi9AROqZhZ8kr17hjzuDUjnzAq0
         v8OIHE8q0sw9XszdserPpgjcmpYtOsWJNmWcBTYD6NRza3pzELR1Zl+AL6J3nz7s3npM
         Jx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvuN9jR+G4W2pj0hYHw8fCbcQee3vmX+JNF1Jp+xXy4=;
        b=oFT1JCSbrCUDnQg+DugLl6SJuPvyM93gBHKB3qxXPiQwRpZXHp+OT6QNJyGg+1W1QM
         F2F78ZJCkuH6BQY3KLjei3qEudYQKk9tYWC89q/46OJGMb6oKTPogt5roSt2QPhHmnrX
         2s7QIdDDTlhhmGi85no9Z2n8GTiOV0UTf/U7qcNZDepCZ5skFuMBb0940Z4A9BtRNzAE
         0UpBXosGE3oCKjAOh+B1LxSGfUyCRXXVkVDWqeG/YaOm4MMUgohEva7zotI04/r6IPCj
         b/zk+Xeds3VVe/gMuuSDaxhGiffspGhTtBacorun0hWsASqQT8egdrSTw28+G45tMtSn
         LQew==
X-Gm-Message-State: AO0yUKUbnkUzCMDygg3C9mVry3trCahnmNLda5F2JFjfTQuRWCkpoPYN
	pXR2eXXHKj0nM5saITCNsLuQYPk1il7GvewQ3HJdog==
X-Google-Smtp-Source: AK7set+9VnS+Zx/Lf+kkoI5Pn5uEfuXiMP/8MBqDkugjbYgC+nPgXVZvyjCbx64znVipe6WWNffPhmpNXjZ+Lq3mMew=
X-Received: by 2002:a05:6902:1243:b0:b13:7a6:f462 with SMTP id
 t3-20020a056902124300b00b1307a6f462mr5166402ybu.3.1679260680938; Sun, 19 Mar
 2023 14:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230319143640.1704735-1-trix@redhat.com>
In-Reply-To: <20230319143640.1704735-1-trix@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:17:50 +0100
Message-ID: <CACRpkdZW0_tdUaoykjE9TkeQ2e-+CfmOVEHmKLuoqyf1AzL1nQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pxa: remove unused gpio_is_pxa_type function
To: Tom Rix <trix@redhat.com>
Cc: robert.jarzmik@free.fr, brgl@bgdev.pl, nathan@kernel.org, 
	ndesaulniers@google.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 19, 2023 at 3:36=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:

> clang with W=3D1 reports
> drivers/gpio/gpio-pxa.c:174:19: error: unused function
>   'gpio_is_pxa_type' [-Werror,-Wunused-function]
> static inline int gpio_is_pxa_type(int type)
>                   ^
> This function is not used, so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
