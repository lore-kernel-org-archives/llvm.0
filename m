Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B981D520
	for <llvm@lists.linux.dev>; Mon, 26 Jun 2023 17:25:07 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-635dc2f6ef9so12576026d6.3
        for <llvm@lists.linux.dev>; Mon, 26 Jun 2023 10:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687800306; x=1690392306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb+RURvt6A+w8dCv8RL1qzl/KMJ6kd7FHQTDIWYf1EQ=;
        b=rRzsrh1Tg4LulotQaD7JFdbsAHvoTRNFiEheI4LxAHrGVu0ptoLrfg4xkYIhzBYbvL
         u/gPrHP9J88IBVImHfSpoxB3838Lr94LMdAbjVPOqOBrVhVg5gJ3lv41uixwqIvpZgmc
         zjT9wVjzREkcHLusii/9hHDTARwVGOiZ3STfL1ikbVl8YGkoiH++7032DKciCnHZ3EoC
         wHkvY82XpH1RxB03WAK6fAZTu9IZ/xVLKqvp19+ZHdGsRx9M0i9Q1PDwNcSC8Rp9oKNi
         5j3FLW+ppcGEpfT9bYeKP18zpHmhQcS72qq5CQLDmgx/OPGJ3oFy7zb/Xla9zA72Md9c
         72uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687800306; x=1690392306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb+RURvt6A+w8dCv8RL1qzl/KMJ6kd7FHQTDIWYf1EQ=;
        b=TmBj3/No7+qEkpsd4NYbQngrl1hQXFgEyw6FL5btZevfHWBqlcZ2JrXc2KTdbCGYWi
         R+OY8KSq2oECF6TpnP8VxDF/JpXiqCd6ZWmY+KlYWVQnLzGCKtDVssQq0sxTP+6/awIF
         C+dQkSQ7p4rfrVGJYYl0wJ+H8LAkgWaWKl+d/WAoggRc2OAhoqCE77f6YAPli0ZnjTDt
         5C0IGorzCWbQbJinrBX8rE3elbuhTOeXTaZyLV9zQvrmbSolPuZ/L4kkyKMRNKIq6bOR
         BAe3zwKKC4rzlqPV9lUMwEowvIbGhGT0QFNd5aXc+/uxHUoZpffQu2p1TVVJ6WGrZah1
         nSgw==
X-Gm-Message-State: AC+VfDy+mvlUBEpE0qkO9U0Vc0YlYzK/DXNcmwzWE2L3k0LN1XLmxxd/
	8n+JKz687i8C+hmYjs03l3BotGTA/jxJI8oIubb8ug==
X-Google-Smtp-Source: ACHHUZ77A1WX0MZUcXsPi4e417afV2ZHEIHW9mgY1e1RMVfek8RN/ob9XO9palzLMz74IYY8tNstk1kr4pHhPrpxFL8=
X-Received: by 2002:a05:6214:f2b:b0:62d:f68a:ee2d with SMTP id
 iw11-20020a0562140f2b00b0062df68aee2dmr5834042qvb.29.1687800306154; Mon, 26
 Jun 2023 10:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACT4Y+bif9Wek-g10F5y0aLbH=JbCcqryi2nOUAFxGFo0O2B9A@mail.gmail.com>
In-Reply-To: <CACT4Y+bif9Wek-g10F5y0aLbH=JbCcqryi2nOUAFxGFo0O2B9A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 26 Jun 2023 10:24:55 -0700
Message-ID: <CAKwvOdnTzcG0DY9SScu1JuV4Q0Ka60qm9jdK2TjA1Cav8En-mQ@mail.gmail.com>
Subject: Re: Thread-safety annotations for irq/rcu/atomic contexts
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Marco Elver <elver@google.com>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(minus old ML, plus new ML)

On Mon, Jun 26, 2023 at 10:21=E2=80=AFAM 'Dmitry Vyukov' via Clang Built Li=
nux
<clang-built-linux@googlegroups.com> wrote:
>
> Hi,
>
> Previous Lukas' attempt to apply clang thread-safety annotations to the k=
ernel:
> https://clangbuiltlinux.github.io/CBL-meetup-2020-slides/lukas/tsa.pdf
>
> I am thinking if the annotations can be used to check for functions
> that must/must not be called from irq/atomic/rcu_read/etc contexts.
> Namely, we create global fake locks that denote these contexts, then
> annotate spin_lock_irqsave/irqrestore/etc as taking releasing these
> locks, and finally annotate functions are requiring/excluding these
> contexts:
>
> void foo() require(irq_context);
> void bar() exclude(irq_context);
> void baz() require(rcu_read_context);
>
> This may help to catch "suspicious RCU usage", "scheduling while
> atomic" and similar bug types statically. I suspect it may also be
> simpler (?) to do rather than annotating all normal locks.
>
> Does it make any sense?
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/CACT4Y%2Bbif9Wek-g10F5y0aLbH%3DJbCcqryi2nOUAFxGFo0O2B9A=
%40mail.gmail.com.



--=20
Thanks,
~Nick Desaulniers
