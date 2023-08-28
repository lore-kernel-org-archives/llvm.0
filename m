Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54EE10F4
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 20:46:21 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-64f42fcd809so23921136d6.1
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693255580; x=1693860380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7cGBaZtnuz7U/mKhzjR4bKOZX6dGdxxWroEwQu01Qs=;
        b=nAehlfuCID2vKFOa+zGc/7AgD86D7BjGRTA4uu3o4wduhiHo7j0qnCJEbqyuLrL+zO
         odNd5YM8kIb9akpesE3VMlFzy6rhRsQ25i+MHnaexYervUoiUjst9S5KzkgNCkbfGxGx
         +ux7YBAMWxVIhWj1ENCoKewPtJ9ADwgjWS7pbz8FOOXbI1T7glY6pbSaF0ZYS1w+Gw87
         7R9Qug07y58Ez/RVYZTvcmCNXE96Cnc+1WRrKqWIXqh/43jRQpS+txUIUQMy5QefPGyG
         CjsLYV7CqL97j50Gh7nE4au9wUH8YfCeaqanNdOanHQoYnqbrCR6AQfdYlYxKakcXUjY
         6Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693255580; x=1693860380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7cGBaZtnuz7U/mKhzjR4bKOZX6dGdxxWroEwQu01Qs=;
        b=PTZKAzhx6IKX2+idtYSsXMVmXUkeVu1b2hBxxO3DoSWMOMER6x/kN8VN9fVPUDBPUX
         UVSZ/0om9rRxgwQoPDGcWjpQYjsr5gcs18Juf7bjHhYBI5XY+qwKZZZ3K6mU9WR1QbUj
         YNPOp2NmH2pV2SDv5hftxDq4aCuy1kEJoHuiZSaPJfYSH9Xt2RJ2U7nsamvfEs+4rvUu
         rAOf+jO2SSfP7EnCkaQw6O4W7UAyd/QbwChBzxDsym777YCMJRmdrPgxsDxqPx3xrtGX
         p5VKAaSGLE+n1Tol5RVq/tQ872cGCEN7rK305k+6lPLdF1kPahDXI8G6tSUGJM2obxWY
         ZaOA==
X-Gm-Message-State: AOJu0YwzjwIRHaC37rObv1hluoeCE4xafxgXWQvMmVScdbXvsomKiK+r
	U3FZqJL2mSa3jCLLiOf69+8SsKVcOQJeQunvZdr7d/mfb9bA6aYBYxt4Kg==
X-Google-Smtp-Source: AGHT+IH1TPqo+GwPajQYw6rkNND6qvYrnrykcAFznacrevvYzxbg8mVexim6BjdM1RMx0c5Y8HUfAZmbEVYwQ8H9I1o=
X-Received: by 2002:a0c:aacc:0:b0:647:8e35:623b with SMTP id
 g12-20020a0caacc000000b006478e35623bmr25156356qvb.15.1693255580294; Mon, 28
 Aug 2023 13:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <916414bcf1c349e8a3dc78cb208bf30f@AcuMS.aculab.com>
In-Reply-To: <916414bcf1c349e8a3dc78cb208bf30f@AcuMS.aculab.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Aug 2023 13:46:09 -0700
Message-ID: <CAKwvOdm-3TK-wcu-PHq27QKMcLFUG352uDCvPSUx8-K8YPvSvQ@mail.gmail.com>
Subject: Re: clang mis-compiles "x"[2]
To: David Laight <David.Laight@aculab.com>
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 9:44=E2=80=AFAM David Laight <David.Laight@aculab.c=
om> wrote:
>
> Clang mis-compiles:
>
> int foo(void) { return "a"[2]; }
>
> to be just a 'ret' instruction.
>
> While clearly non-sensical returning the input value of %rax
> doesn't make any sense.
>
> gcc generates a real string and then returns the byte after
> the '\0' - which is (sort of) what the code asks for.

Reports of what code is generated when there is very clearly UB are
inappropriate for this list.

I encourage you to inspect the output of -fsanitize=3Dundefined before
making such reports to compiler vendors.

https://godbolt.org/z/o4E6o33fP

Perhaps you're conflating the address of one past the end of an object
being defined, vs the value one past the end of an object which is
not.

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)
>
>


--=20
Thanks,
~Nick Desaulniers
