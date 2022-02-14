Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D26A28
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 16:11:23 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id p19so47561985ybc.6
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 08:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7d7duxq8SWZ+wyJ0FImMjEjcqMZoiPfFxvX8LzzJYUI=;
        b=WFuePSVBjIRsih/BDhc3ZDyFNjTduf/2prT0P7K5D5zdcW4WXl9TGDGnOfvmCu1HIM
         EbstvqY1+sNw24+bOoXGzdot5LRmPLdNQ8bgLYNNUfxs/+L7966DGIB75Xn0JRvxDiM9
         orD1haDtHkzRri50HDaCxPSsJXRYbYMpZntQwTgy+w+MIp5OPIdXUg2NzsY4wXwEQql7
         riklSf7zaGERAuKIJ9UC0pm/hpwjTn6Me22UKN9N8RABcrlEegVPmjCxOt3wF25uGo9x
         O3msNH2IBi+Sw06R1nZlWM2tR7XL7wMr8svGOZYXkEE5SbKf8nZMv1w1wTw8sW5JYC/r
         NaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7d7duxq8SWZ+wyJ0FImMjEjcqMZoiPfFxvX8LzzJYUI=;
        b=lUzAkAXuJTFdD8gZSnJN0+akKogQxl6SQyvjyHaUuQslO0zW5NOWtgR1pi6Z2EFSA8
         SBdis1BIjeQXxBk1UX0YTOy7ub3GAWKR7j92yuyIBrHqV2QaFZutJYzMaWnyQPLYFzK/
         dCMbjN7aKNtvbvDdtSmNEfgfwAp8l1oxj5+S62GYW7pjjSiAxbH9+olmz1s4GxhlCUZY
         aP+Rz4pKU+lecIg/XWscwkGrZAo3ZNHsmgoTrds6O+YNpgF114b9b+skRedAQuuU8rlf
         l1bYth0XcdY3679WyHaPRPjyI9kGyBGvc5kBJMd5XuDHIWPYevq40QD/laVaEjWi8+1G
         TJEA==
X-Gm-Message-State: AOAM5315CLr4Q8h7640Yr3W6TSN4ToCn1kQNnJwcZADu1BezpTmqdriP
	CrM8E7z1MstTKIp8mxD6glCVtAF5IM3R8IBgBcOmMA==
X-Google-Smtp-Source: ABdhPJwOIwUtQ7prIWpfJSj9cE9kAy+eNIUKZooAP6EKtuNBX9xBZmLUqd+FbKOu05zqWqcOgBkrkryJtMtZ0qS7hAc=
X-Received: by 2002:a81:ed10:: with SMTP id k16mr351182ywm.166.1644855079904;
 Mon, 14 Feb 2022 08:11:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtR+E52X-ucmvXYG5-9v0q2UEXQsML=nkQRnSf7TwXYqw@mail.gmail.com>
 <Ygp2wVo8JfWh5iOk@dev-arch.archlinux-ax161>
In-Reply-To: <Ygp2wVo8JfWh5iOk@dev-arch.archlinux-ax161>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 14 Feb 2022 21:41:08 +0530
Message-ID: <CA+G9fYvTX0VR=-MVy0gT+-1x+uAWpoh0YJOasJZCi_GQiJ-+cw@mail.gmail.com>
Subject: Re: arm64: clang-nightly: net/ipv4/tcp_input.c: clang: error: clang
 frontend command failed with exit code 139
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

> Thank you for the report! I found this over the weekend myself and
> reverted the problematic commit in LLVM and I will make sure that if it
> lands again, it can build a kernel without any issues.
>
> https://github.com/llvm/llvm-project/commit/22eb1dae3fb20ca8ada865de1d95baab0e08a060
>
> For the future, you may consider only sending reports of compiler
> crashes to Nick, myself, and llvm@lists.linux.dev; a compiler crash is
> pretty much never the fault of the source code so CC'ing Linux
> maintainers is just noise.

Thanks for the suggestions. I do agree.

- Naresh
