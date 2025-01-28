Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF091607AA
	for <llvm@lists.linux.dev>; Tue, 28 Jan 2025 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738050416; cv=none; b=NbKyUiu3gKp0AUrEqOWlNOhk/is/187weC3SfqwWrLs6mB7EV/FCvZogeILBj860FX0s/MrL1atN4Tj4zANG+X5i6N5bfPV/l7idGnfYqo2xtD081pgTq4BOuysG2qAUNahq2BV1Mpz2RFeBqFygYF0dGLleobKmdz9BuhTPnSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738050416; c=relaxed/simple;
	bh=HoFnfKNIxlQFIpRI6i6Nga0bkUmYF+rmpL7IrlCQpfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9gb30SEDsCntwUd9hMEX1nhq5KeCBne9b/AjW8Z/aGWPWcsrvWFkvWev7bBWseucEcWtfNJfi2cWaUJGcteTMDNFk1YNQp0785kPu5o0CLWr0k6Y26eDdntJnErA8xw6VQZ9iDj3ALYtZX9E/bSeRXnpPqMrM9Q8bTpu4CiR5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85bad7be09dso3064338241.0
        for <llvm@lists.linux.dev>; Mon, 27 Jan 2025 23:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738050412; x=1738655212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgNHrZqOh5I+Nq0sLYkdt+xY+8gHWM07xUx8EPjp/r4=;
        b=wPiee1gGyChClMj1rcfT/SAn4Wm+eBeAzJP75ISWN/RfUv1+vVN+dk7nbmQOjlaBby
         L0JU+mTlLR0yhmOm5QdRMP9mV4KMufB5AnCSm9/YOOb30slHFQnfbaKVGrXZigw+kh5s
         6G/BB5i/b4Ox/axGz2boF+6i8f7iwGun9cujtm8BMm/BcFnvr5UtpQEZPgXfH/+Ng5oJ
         C0rwUh2G6CPs1k2I3+KWPyWeGwX/KDzfUD5v7sy3XPSyMxoeGZ/te0Ja2mefTaKzDoq2
         enbcZT/Djbe7+56CebHo4NQoQ3JR5GSX9Ie7h7C94oGThPPhYgkNBC9shgKuYffg+1PF
         0pJw==
X-Forwarded-Encrypted: i=1; AJvYcCU0yAKmhlCtmhgwXZQd3FgViRsZ3nbr8M7K6gpSd7KhNsh+JYC3eXlVbomaIwMep6oxAxQq@lists.linux.dev
X-Gm-Message-State: AOJu0YzeyC92CqjuRww+LtGeNeJ5Wx6eQLIkMahrfGhgrLKXVQorU2Zz
	6+GEbAXBlfQrLa3ihQaezQisBIlfL46nTXdd8QGJ/KYRyuNKnIRFW8IzZNctqws=
X-Gm-Gg: ASbGnctLjRjD9QWMCyatHwq4pfd7bBACD/LBq6eyBAuEbdYyw4NlULxzzlPsQX5/nVj
	x64kuWUj1iZtShUiiJ1wN/GRJna0ruDkuYVqhOhLMVkBRMNa3smjCgBJiFvn0TdWWPE5Zl5O+lS
	LxUOkuGH15+NHASpQAx3Z3TWH4L70geCHeCGSM/fnkZaFve7sZjZjp4n3jqagbtEPOKeJv2bC5m
	XiEIfMfADyqT+MWyFC1wnjoIAXEhDG/8f/gdbc+Nsa45HmNIUMI9iK/jx/CkhJjjMK1d4W0x6Td
	jUh8urQDqvhdqUZcDUBz2ZM6NdWqy3IGOyTatJ5NlXS6di7FuYj9mQ==
X-Google-Smtp-Source: AGHT+IGU00XENK7BAHlenA5zs+7uZabw6iMKPyO/bnyDDpvsJ8GdDJY9C4lKPbHLzEUwgYBAq/9Ong==
X-Received: by 2002:a05:6102:2923:b0:4b6:1a64:1c95 with SMTP id ada2fe7eead31-4b690cf1487mr37904854137.22.1738050411959;
        Mon, 27 Jan 2025 23:46:51 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9adb4b0sm2272504241.3.2025.01.27.23.46.51
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 23:46:51 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4b2c0a7ef74so3120362137.2
        for <llvm@lists.linux.dev>; Mon, 27 Jan 2025 23:46:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbZ9AXM3WZLsiv74Rxellai3zcvJzkYOo9U8lBMUIDqBxVuTHCVFwwJROivJ23sLsTrXPi@lists.linux.dev
X-Received: by 2002:a05:6102:f97:b0:4b4:27dc:ffe3 with SMTP id
 ada2fe7eead31-4b69099e6f9mr42788280137.0.1738050411311; Mon, 27 Jan 2025
 23:46:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250127190636.it.745-kees@kernel.org> <20250127191031.245214-2-kees@kernel.org>
In-Reply-To: <20250127191031.245214-2-kees@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 08:46:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvcKOc6v5o3-9-SqP_4oh5-GZQjZZb=-krhY=mVRED_Q@mail.gmail.com>
X-Gm-Features: AWEUYZlRJyqtu46GFLPmK_2UxNTy_ZZ3I5OahfBQNH_UNqTJSeeHUl0QUknH2n0
Message-ID: <CAMuHMdWvcKOc6v5o3-9-SqP_4oh5-GZQjZZb=-krhY=mVRED_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] stackinit: Add union initialization to selftests
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jakub Jelinek <jakub@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kees,

On Mon, 27 Jan 2025 at 20:11, Kees Cook <kees@kernel.org> wrote:
> The stack initialization selftests were checking scalars, strings,
> and structs, but not unions. Add union tests (which are mostly identical
> setup to structs). This catches the recent union initialization behavioral
> changes seen in GCC 15. Before GCC 15, this new test passes:
>
>     ok 18 test_small_start_old_zero
>
> With GCC 15, it fails:
>
>     not ok 18 test_small_start_old_zero
>
> Specifically, a union with a larger member where a smaller member is
> initialized with the older "= { 0 }" syntax:
>
> union test_small_start {
>      char one:1;
>      char two;
>      short three;
>      unsigned long four;
>      struct big_struct {
>              unsigned long array[8];
>      } big;
> };
>
> This is a regression in compiler behavior that Linux has depended on.
> GCC does not seem likely to fix it, instead suggesting that affected
> projects start using -fzero-init-padding-bits=unions:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118403
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Thanks for your patch!

> --- a/lib/stackinit_kunit.c
> +++ b/lib/stackinit_kunit.c

> @@ -295,6 +330,33 @@ struct test_user {
>         unsigned long four;
>  };
>
> +/* No padding: all members are the same size. */
> +union test_same_sizes {
> +       unsigned long one;
> +       unsigned long two;
> +       unsigned long three;
> +       unsigned long four;
> +};
> +
> +/* Mismatched sizes, with one and two being small */
> +union test_small_start {
> +       char one:1;
> +       char two;
> +       short three;
> +       unsigned long four;
> +       struct big_struct {
> +               unsigned long array[8];
> +       } big;
> +};
> +
> +/* Mismatched sizes, with one and two being small */

three and four

> +union test_small_end {
> +       short one;
> +       unsigned long two;
> +       char three:1;
> +       char four;
> +};
> +
>  #define ALWAYS_PASS    WANT_SUCCESS
>  #define ALWAYS_FAIL    XFAIL
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
