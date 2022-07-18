Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48F533C0
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 16:13:54 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-31d85f82f0bso112552067b3.7
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RT6iMLTf7k3cJfLWH59ENiur8Fu7yBgn4FU6SSiJz9M=;
        b=cqPfgK3WoP55y7USOwNR+Hmg8kl551AnF1i1ru4iN8E34e4LEiajaAU/udR1UmSKbu
         +cq4GK0bFugrUWojfRZIGU7R8qsez6+wUT9datIYLpHcwlW4ZqbiP/5zWCjR6kxS2Crw
         +qEiIUNmM4MennZ4exISPBgw86/W/rvGfJXVoYBie/Ak5dkXUDpoN72N5oKr6QDV9GYN
         hsQ7I9DwfPUnEZoWa1sZibkazH0GKrBfnaLwh/MvAyL1l1mXYgM8rv815PzjV8NSxxL9
         ARlwXWbiK+qXlALU/61QQOI7UTWjgs5nH/+kF5rgDrmf1w1SGjEjf5QvG9rsZUlfWIfN
         A+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RT6iMLTf7k3cJfLWH59ENiur8Fu7yBgn4FU6SSiJz9M=;
        b=hiZfFMdw9VFwTQcXpLoIAk0GbpsmhUzy6ubyAvVEBJW2EJmGSYsJnbF5zQ8b3Pl0Lf
         2mZXYxONTQEu5E/HEFnVMO7b2hQSFDxm+AYdh77kSINDZwt2ydDeZQsqZxn3q63snWrW
         ZKJLcLxoTIcPN+4rGJn75neFFc0vjqhbHzjU1BDQEoOBw0YZ+14V71Se1DfuRwxTW49j
         /x0iITT57OahcU9aAJ3sV+pjIVbdPUT8nNsxxHgUMZHz7CH+pzPRRLbHt/Z2zBTefLYM
         Vcf+IEUA/RDcMtLYOGSmvVA4DXycs/yTsPQjrWKmO/C4bJRDaTewGQuzTA7Q4as4owz3
         xq5A==
X-Gm-Message-State: AJIora9IXmxGlOjJRwQUbGe5BoaXLZH+iaOuypxUBuqpaeIToMmvP1Sp
	aHJ0Scdtp4yPISvnjV/DSkGuFbmvBbyUKkZ2JajIgjVf
X-Google-Smtp-Source: AGRyM1vYzGIWYZbSDHO5Nh/oFmP8CCq9mDfa51GrVpk/9f4nJxK7Ew5wEkOREZTiJ47ug01BAkIpLorNeG6fC+NwuWU=
X-Received: by 2002:a81:aa4a:0:b0:31d:aa2a:4ce6 with SMTP id
 z10-20020a81aa4a000000b0031daa2a4ce6mr31291302ywk.143.1658160833708; Mon, 18
 Jul 2022 09:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YtVPpVFwy7WhXKPx@debian> <YtV3Y4Ha4tPk3kU4@dev-arch.thelio-3990X>
In-Reply-To: <YtV3Y4Ha4tPk3kU4@dev-arch.thelio-3990X>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Mon, 18 Jul 2022 17:13:17 +0100
Message-ID: <CADVatmP+=fqpS-GwLk=S=C6uOrHmrnmdKK3OyiwLQ3jaut1udw@mail.gmail.com>
Subject: Re: x86_64 build failure of next-20220715 and next-20220718 with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 18, 2022 at 4:08 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Sudip,
>
> On Mon, Jul 18, 2022 at 01:18:45PM +0100, Sudip Mukherjee (Codethink) wrote:
> > Hi All,
> >
> > Not sure if its reported, builds of x86_64 allmodconfig of next-20220715
> > and next-20220718 with clang are showing lots of new warnings like:
> >
> > warning: objtool: asan.module_dtor+0x15: 'naked' return found in RETHUNK build
>
> Thanks for the report! Nick fixed this in LLVM, it was a problem with
> compiler generated functions like the ones that are generated with
> KASAN, KCSAN, and GCOV having 'ret' instead of 'jmp __x86_return_thunk':
>
> https://github.com/llvm/llvm-project/commit/140bfdca60ae8b1b2ad115846379e3c9ca914bfb
>
> With that change, you should see no warnings of that nature with
> allmodconfig anymore. Thanks for the continuous testing!

Thanks Nathan. Built again and confirmed that has indeed fixed the warnings.


-- 
Regards
Sudip
