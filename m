Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163A27A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 19:57:41 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id o22so10595518ljp.8
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 12:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ROEaiDbV1xlWRLLhbjf2eSNKNXO3yUpvrd+xBVfEJmI=;
        b=Ep7d1KTRWUIlZeuwGXHaDr56nO67uI9S9lQ0aDF4JiOUpDy3cy85UA1n/5HgmbVfzD
         3S7YgIHtEJljsf9bT7h2BqpJGZqRZnN7mikKXvRzCFGbMvRu3jFLRavexsm51MsUb9CG
         trgQZux1wABQpYvG7ISIR8CuC7gUfcwWZm+LCL+wyLB/NKxQUJ+UiPcSPv9MIZq6KAad
         LTsomKkCmYIIME8kxjV57A+9GpfSYYigRoOIlzmFTXCRnLkQ8YcUFPlu5Ai6X9YRLcHF
         1J0Qc6xuijITqFJl1O4Fh6DkdndA241DE+vp8rLKl98crQzQ7G1Y9Ocvw7GHLHQhKJX/
         JfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ROEaiDbV1xlWRLLhbjf2eSNKNXO3yUpvrd+xBVfEJmI=;
        b=o6K0zWpnTUsXVDzYfuXTY0O7ADCC6ItBGuv7uPy09sE94o81adzSbqSp7oRXjbcu7B
         r0LBFe31XHDRHXPGgVql81r7jBRgDNjPPb/L/5wuSqJgwvtusVg4OYYc13YlR3Tjncqp
         c9tlX+rZVgg+iAwVXngBEUkBedkBPum1fVq3CEzX9LKwEmlwYxGqq9Zb/woCZVkW7zzl
         uKwjbeJLUfVxtA2s9EsjY3u0VKzp1+ZTvMTdPf33AhZksINu0kn6WxAlWWKynaH6+9PM
         8/K6SI1zw0V1Gr5Cpu5qxoFvrc9A39nMmLITR7Bnqkb8wLEp9TFXCdnU1B/C7fm/fGA7
         mStQ==
X-Gm-Message-State: AOAM532Rz7F0s630HOgHl3iAsGwEU7zOUW8lxVVyasLVsh+J7lOQErqS
	bvPpF00I7GPGOB6GrHdIS6ZQ4hkhL05vgdQQam2tgAzSJq4aUA==
X-Google-Smtp-Source: ABdhPJzYeDZlv448QLy3Bi0Dp/iu9qCz3IhNMMzBqEpV0ShbVYua6Vkv84MV6O8b3vPonT34rQZ+9IpQOq5UBXx7ths=
X-Received: by 2002:a2e:854b:0:b0:24f:b98:e2d2 with SMTP id
 u11-20020a2e854b000000b0024f0b98e2d2mr4100749ljj.165.1652471859685; Fri, 13
 May 2022 12:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QX8M0p2JQOs6tq0ZSqHKLhzVh77eCxYkh22SDL6Qaa36g@mail.gmail.com>
In-Reply-To: <CAGG=3QX8M0p2JQOs6tq0ZSqHKLhzVh77eCxYkh22SDL6Qaa36g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 13 May 2022 12:57:28 -0700
Message-ID: <CAKwvOdmRBZ7F7H2ySrh6P8bg+QP0F1WOdxH_oz9nJFE+HAMQyg@mail.gmail.com>
Subject: Re: 2022 Clang-Built Linux Meetup: Call For Papers
To: clang-built-linux <llvm@lists.linux.dev>
Cc: linux-toolchains <linux-toolchains@vger.kernel.org>, Kees Cook <keescook@google.com>, 
	Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 29, 2022 at 1:25 PM Bill Wendling <morbo@google.com> wrote:
>
> The 2022 Clang-Built Linux Meetup is planned for 10-11 September, 2022
> in Dublin, Ireland.
>
> This is a time for everyone interested in Clang and Linux to get
> together to share ideas, present current works, and generally have
> fun. Best of all, we're meeting in person this year!
>
>   https://clangbuiltlinux.github.io/cbl-meetup/
>
> Call For Papers
>
> If you have ideas for a presentation, create an "issue" on the GitHub site:
>
>   https://github.com/ClangBuiltLinux/cbl-meetup/issues
>
> More information will be forthcoming as the date approaches and
> logistics are solidified.
>
> Share and enjoy!
> -bw

We'll be holding the event at

Google Building GRCQ1
1 Grand Canal Quay,
Dublin, D02 FF61, Ireland

IE-DUB-GRCQ1-2-Birr Castle

(Linked on the above site as well)

https://goo.gl/maps/32yVACGEiFS1goeR9

Also, Plumbers just announced their location:

https://twitter.com/srostedt/status/1525163880284053506
https://lpc.events/
^ specifically mentions "We anticipate announcing a room block when we
open registration.
We hope to open registration for both types of registration in June."
-- 
Thanks,
~Nick Desaulniers
