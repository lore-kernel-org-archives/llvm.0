Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3C02C9D
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:17:27 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id v23so16847289ljk.5
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vuayPgK0AFa+ecEYX+ZQ8vgmFv5JEOwxSTm6d2kZs78=;
        b=RnLKexsrCAjWUIWwBZJfog7vhfH5WjN0Y7/YF3zs2wOqmrQE9nWihazTTbqcXtgNEP
         RNPZtzuvVpldX7fSo1DnFucJJy1OYubefmnOlOt62AtxzoQyyuWnY71JVUAnromuH+6B
         N9fAHe3RZqI/7+KL0cN3xwUnWjmvCjq0uiXvBd01XwM5XDotom9RHn19Q3GfLb/Fz1Xj
         gOIBEpcBsM2uNBBCVwGUov8nM49RQuzGEFZDgDlRddmnis4ves7gWRZyct12HUIsbO5G
         OFgp9Opri3GuuIE9wu8qeSYA5SeB7XS7Q+62+kZaBUEXN8LB9OD9gHn5BtjBTXCkuwtx
         2/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vuayPgK0AFa+ecEYX+ZQ8vgmFv5JEOwxSTm6d2kZs78=;
        b=8CydOuj4UfbYriXDEy+hzIpY7eqbA5t2BleQb0En5PMD0Xmaz0SQK2E6URDO2WZ01n
         C+VCCbNrLCsKYmecn9Xa/SIEdr/Ugbyx5+d6RYiOpIE31NhULrC3xfwcSpJ/CtxhzIZt
         9Aa8OdnHcwzmORuZQd1QqOpu0I/Z3BqvKynTRQn7H1lielegAOmO2ApmUXBzJ6aTIgcj
         Dh1sNP7u2F0ORg7VaBcp/cGqxcbQM0EeDB5kVr5ARt9KinxGUvE+YEr8Mh9wXybSsOx7
         RnvcJvkGwK0SjhhMSX13bSmE7G2v2v0jcAIsC1+ZG2H6jMiLpfVFDgQy/mJlKYn0o0Ad
         CIfQ==
X-Gm-Message-State: AOAM533+9fKGrPH0JHodt8S2fE5iCkBOU+A1sRba8ki09Ei/2uLpcdQN
	8MRDTeoXYY1Vkx6DhkiJP16TBe9QOyi+cwrlIOaG9A==
X-Google-Smtp-Source: ABdhPJwZM39NYLp6cBlt7OdvlReYZCF5U9ViiH0CM54S+pnKkPT65t3gV5XP9lM1W9YaFAsOziYunWIWhRBIKNm1sZI=
X-Received: by 2002:a2e:9192:: with SMTP id f18mr5264789ljg.220.1636143445722;
 Fri, 05 Nov 2021 13:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105162756.3314148-1-anders.roxell@linaro.org>
In-Reply-To: <20211105162756.3314148-1-anders.roxell@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Nov 2021 13:17:14 -0700
Message-ID: <CAKwvOd=dtb98Ue1xYz0gQmRGeQWdH6sBEkpXioevPQ94envK8A@mail.gmail.com>
Subject: Re: [PATCH] selftests: vDSO: parse: warning: fix assignment as a condition
To: Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, nathan@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 9:28 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building selftests/vDSO with clang the following warning shows up:
>
> clang -std=gnu99 -Wno-pointer-sign    vdso_test_gettimeofday.c parse_vdso.c  -o /home/anders/.cache/tuxmake/builds/current/kselftest/vDSO/vdso_test_gettimeofday
> parse_vdso.c:65:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
>                 if (g = h & 0xf0000000)
>                     ~~^~~~~~~~~~~~~~~~
>
> Rework to a parentheses before doing the check.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  tools/testing/selftests/vDSO/parse_vdso.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
> index 413f75620a35..b47b721a4ea4 100644
> --- a/tools/testing/selftests/vDSO/parse_vdso.c
> +++ b/tools/testing/selftests/vDSO/parse_vdso.c
> @@ -62,7 +62,7 @@ static unsigned long elf_hash(const unsigned char *name)
>         while (*name)
>         {
>                 h = (h << 4) + *name++;
> -               if (g = h & 0xf0000000)
> +               if ((g = (h & 0xf0000000)))
>                         h ^= g >> 24;
>                 h &= ~g;
>         }
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
