Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82B7A
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 20:41:56 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id bq30so15596511lfb.3
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 13:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4lGURfqIvQpYqIQ3phayQfuPvBgeqLLIXwhfGkxtbeY=;
        b=deaMVP98X0xu0zpekmWFQ4SEf5NynnWkUeMdEjpPmyNhZ9ndZB8LHFKW/U2nYrHprh
         Yc1AFRYayI21kAPEh3NE7bDlwsxKjWmcE9iL82hQDuv8Nx5eKcU6h+f63JWZX7yAPtDx
         dUG+ksKovrp84l0VMSDEi2piAgFVFieYV2zZueTv6gcpP1xCmqwF5LA7rpPjGJx23tc8
         A79rH4zmE9mLl1fLFW3U80Sh7evdEgmoCIIKpx5M7HIYyjLOSRn/ptdW0Do3Im4w2dgR
         Vl0DqYK4J9+1c4qWZYPahEr8wf121vf5lnBOLiEsb6r2nGb1pPus16G8KfYdfuuYFo7H
         A5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4lGURfqIvQpYqIQ3phayQfuPvBgeqLLIXwhfGkxtbeY=;
        b=x43ulkuloEEdJG3gtm0BeqMR7Frw5PEra2Ib2X1UDAE6OT4eblfsvjm5wnYK9bLwYO
         c4GQa5L/+GHTfAOu2WpOu0+0AyMfPvZvCVV2X7CYpBatVsp1Id57SJshD2ldztMjfpJc
         lPFxZPMI8xf7qW8rTXqOhuTKv3D2rs80C/UgBfq56xs4ok8lM1oKo4NXIjiNcYKx4v+Z
         SElvmyukzFaWFwKzF8lFZbS+jLPJ43knPKwHgvYLWzOfaY23I6/4bgk+4dQ8ET6fhwLA
         Iy+Ec/j6EWt9BXECv7f92vJg9W0BhdgM7ZJnKwX/uGfLZqTnakzhVULk9DtfKn+DXt1y
         3x7Q==
X-Gm-Message-State: AOAM532Xk/w44p32C+thntjFuKl9diqsq5s+0pDDuJH8SlbrUR6FTw2N
	Q5o/sHq7MwkHvW/WlQmwtAqNOVJDug+iaAwpRgX7Fw==
X-Google-Smtp-Source: ABdhPJy0LHQeK/E+y25nBBVQ9U39uS42RbDJdT0z+a1SFIjidlJlCMAKcOtOnmVH8L+CX3l3oHFWqvNXSNY3BaZR1bw=
X-Received: by 2002:a19:505d:0:b0:46d:167e:b9df with SMTP id
 z29-20020a19505d000000b0046d167eb9dfmr465149lfj.184.1650055314270; Fri, 15
 Apr 2022 13:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
In-Reply-To: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 15 Apr 2022 13:41:42 -0700
Message-ID: <CAKwvOdnsZekEM77axBf67MDqQVP0n6PTKH=njSyPSWTNiWAOiA@mail.gmail.com>
Subject: Re: plumbers session on profiling?
To: Sami Tolvanen <samitolvanen@google.com>, Bill Wendling <morbo@google.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, vladimir.mezentsev@oracle.com
Cc: clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Yonghong Song <yhs@fb.com>, Wenlei He <wenlei@fb.com>, Hongtao Yu <hoy@fb.com>, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

(Re-sending with Vladamir's email addr fixed; sorry for the noise)

On Fri, Apr 15, 2022 at 10:54 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Hi Sami, Bill, Jose, and Vladamir,
> Jose and I are currently in the planning process to put together a
> Kernel+Toolchain microconference track at Linux Plumbers Conference
> this year (Sept 12-14) in Dublin, Ireland.
>
> Would you all be interested in leading a session discussing various
> profiling related topics such as:
> * gprofng
> * PGO
> * AutoFDO
>
> Would others find such a discussion useful?
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
