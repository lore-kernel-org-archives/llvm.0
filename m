Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8492C81
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 03:38:28 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id n7so3519334ljp.5
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 20:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/Vo8naa2pVOSCfV4UFA2BJ46wmQrSEVSsBZouXgR8Q=;
        b=TBqUPv05LF6J1Ap/h7Pz9XJiHiK0IslnX+9wn7xlIvHPKYKx/hZE2OdYd8/tUHUJiY
         5A0XsyYfcM8kS3aHiGgfpEG+nkoekDVqu2WkEHgchyxUgt84AkSR1/G59wXD3IbW6RJ1
         4qij4MWM98pZd9rp8BkYS9iuIRoGDWcJuG/YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/Vo8naa2pVOSCfV4UFA2BJ46wmQrSEVSsBZouXgR8Q=;
        b=YOumzmWFV0vtn7KaJkJYwGOeJ2bH/usQW6u6Q1YZbmHpTb64fM5eKPJ2zJta8WEqKv
         XbtxkBmOWxBoSdFa00JKd5cPtvcDGDGONnbDw3EfwvtggvA4PR0Z9SEVFG+iWm2a6jPJ
         Hza/384TIz29Fja59jcyo7MUSjfLub9rsAj4DNbkb4qbwdzA90ypjMHdsGTuRfINg7GT
         xM9n62jlbFgqKsxTzDfFBcpv5gp3ZHQGEnVLPAj31Tr+6AsOMpgAhamTQtRU0SlO9teq
         zrcXmuStGYoQBvXBCSLrLwz/3rbrK45bt0KvQzX6qNwgs8uoZKfsPVRJP8Cq41OTQHv0
         i8HQ==
X-Gm-Message-State: AOAM533ZnK4VpPdO4b9q/v9q3JqE0O7WS9Ut0mtpR9Uus4gjKWuzg3ml
	+phcLc9G9e8Bl50rnY5WFGnxEfp8ynkvvx0x
X-Google-Smtp-Source: ABdhPJyTmFhYxnYRA6la36zEjU9UcrobP8H6SZybA9oMLKV1UNTE2PByJvg5eLkRl9oI81Y1DmLxdg==
X-Received: by 2002:a2e:b890:: with SMTP id r16mr4206463ljp.157.1634614706190;
        Mon, 18 Oct 2021 20:38:26 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id s4sm1552992lfs.235.2021.10.18.20.38.25
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 20:38:25 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id x27so4330670lfu.5
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 20:38:25 -0700 (PDT)
X-Received: by 2002:a05:6512:12d4:: with SMTP id p20mr3786322lfg.280.1634614705218;
 Mon, 18 Oct 2021 20:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211018182537.2316800-1-nathan@kernel.org> <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
 <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com> <CAKwvOd=wGjd_L1703Y9Kngcr9-_wTvcRLToiydXYkR=S_9xWDw@mail.gmail.com>
In-Reply-To: <CAKwvOd=wGjd_L1703Y9Kngcr9-_wTvcRLToiydXYkR=S_9xWDw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 Oct 2021 17:38:09 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjwOnrHXDSqnmhiKujk=5XieJFvfnQwc2WKOKFwzcqvaA@mail.gmail.com>
Message-ID: <CAHk-=wjwOnrHXDSqnmhiKujk=5XieJFvfnQwc2WKOKFwzcqvaA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Tor Vic <torvic9@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 10:14 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Right, the patch that added the warning explicitly checks for side effects.

Well, it's a bit questionable. The "side effects" are things like any
pointer dereference, because it could fault, but if you know that
isn't an issue, then clang basically ends up complaining about code
that is perfectly fine. Maybe it was written that way on purpose, like
the kvm code.

Now, it's probably not worth keeping that "bitops of booleans" logic -
if it is a noticeable optimization, it's generally something that the
compiler should do for us, but basically clang is warning about
perfectly valid code.

And what I find absolutely disgusting is the suggested "fix" that
clang gives you.

If the warning said "maybe you meant to use a logical or (||)", then
that would be one thing. But what clang suggests as the "fix" for the
warning is just bad coding practice.

If a warning fix involves making the code uglier, then the warning fix is wrong.

This is not the first time we've had compilers suggesting garbage. Gcc
used to suggest (perhaps still does) the "extra parenthesis" for
"assignment used as a truth value" situation. Which is - once again -
disgusting garbage.

Writing code like

        if (a = b) ..

is bad and error prone. But the suggestion to "fix" the warning with

        if ((a = b)) ..

is just completely unacceptably stupid, and is just BAD CODE.

The proper fix might be to write it like

        if ((a = b) != 0) ...

which at least makes the truth value part explicit - in ways that a
silly double parenthesis does not. Or, better yet, write it as

        a = b;
        if (a) ..

instead, which is legible and fine.

The clang suggestion to add a cast to 'int' to avoid the warning is
the same kind of "write bad code" suggestion. Just don't do it.

             Linus
