Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952C82FB2
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 14:02:18 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id s18so17410731ybc.0
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rqQtIk/6RZp+oHtGBLpGghq9zf27UXMh7gjDqhWItOo=;
        b=HqVIPg4A0tsJolcMNt2D5+uuLjf75KaCHkCr07E3YcgufntBlKo1+07kC0z/0YS/F4
         hah88xjBDePVCPFuTVClSxTuhPhVOVJdfG9Ox9nFi/g30cuFRDugQs4+5quByhOu8mow
         UJrJ+tq9Z53bY/YF0KE07hIAZEreZT4B8DeMV+47OkiBGIGgKWFGsGVYLwL8W/ApAyF3
         HshGlV6RW50oaacQwrEBusuHbWpgqXPC1MpRznn/lGkNGBaHqK2kYc0LAaZWEJ8QsQm5
         Y8TmtHB0wGWb6pOb6dpClyudlcfy45MAHy1UyIAIqHPT7xFEUv/NEEklgSv56AWrzMdy
         PUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rqQtIk/6RZp+oHtGBLpGghq9zf27UXMh7gjDqhWItOo=;
        b=mxu9rBY44bYTXKBS9aSVjSD3NXiXGvDN18cpy6sZAx5R/whzFr52v1J5iymAjy9CW2
         LjdVa7gM6XwteSfJ5ykjpn6zHvHM+1gp/6/i9NOxgYhJTowuKv12JAAtSLpa6NpzRX5s
         NVc1W/oClYGVN1iCuPPCsdtjWN6tWCGDI7IRppQQnyG/Kj/0zMmpFR/Hp8gcZmpw8W0k
         sJpY45Mv06ICDv3V3i3qWZ+lLdW/FI4W9cGR8YxfDEUv4DTXOyjfiIiIMHnVQ9rK6fai
         BGnKcFfxoRvmY738fSa+U3YkYDoyn8w0A01LkBhfGo3LJFhW5G7c7rP3wAHQ1CeTxjpA
         Wgzw==
X-Gm-Message-State: AOAM533SdqGco9gNpeuCKZzhy9+NY950i0E8SHRraxoyJJh/HsDyOcj2
	iPV62Y1HWk8MRClOzKkU0CeIrE5Ehm7mvw5xhlFWPQ==
X-Google-Smtp-Source: ABdhPJxcWNapNwbSMYpNuoLOZ/mFxsLh85WxLn5ZgLcnaaDmX2gfm0tqgls9grUv0gtjs4QFMD1DwqEBvGlihgmmXlo=
X-Received: by 2002:a25:188b:: with SMTP id 133mr6630188yby.80.1632837737044;
 Tue, 28 Sep 2021 07:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927121811.940899-1-arnd@kernel.org>
In-Reply-To: <20210927121811.940899-1-arnd@kernel.org>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Tue, 28 Sep 2021 17:02:06 +0300
Message-ID: <CAOtvUMfNYkfKw-Vji7uVWXO=CbwGLj6=+awCKif5=cPCK1P-cQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: ccree - avoid out-of-range warnings from clang
To: Arnd Bergmann <arnd@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, YueHaibing <yuehaibing@huawei.com>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	Linux kernel mailing list <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you Arnd.

On Mon, Sep 27, 2021 at 3:18 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang points out inconsistencies in the FIELD_PREP() invocation in
> this driver that result from the 'mask' being a 32-bit value:
>
> drivers/crypto/ccree/cc_driver.c:117:18: error: result of comparison of c=
onstant 18446744073709551615 with expression of type 'u32' (aka 'unsigned i=
nt') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>         cache_params |=3D FIELD_PREP(mask, val);
>                         ^~~~~~~~~~~~~~~~~~~~~
> include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
>                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/bitfield.h:52:28: note: expanded from macro '__BF_FIELD_CHE=
CK'
>                 BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,         \
>                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This does not happen in other places that just pass a constant here.
>
> Work around the warnings by widening the type of the temporary variable.
>
> Fixes: 05c2a705917b ("crypto: ccree - rework cache parameters handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Gilad ben-Yossef <gilad@benyossef.com>

Gilad



--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
