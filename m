Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F42C80
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 23:50:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id bi37so16522815lfb.5
        for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 15:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6/cxy1v6pzyjdanivJDffUzvUHYSgGATroerbzvllHs=;
        b=bkYq3kDo7bXXD0vLPsf4jCdNZ++vcWjPQ6Fgk0ICnOsI7b5oUTQum0xQanngAR523f
         QYfcUPKdLzjV2X+Qx0Qx2HKfhc1+wnwWJR9QzOuF6voXMGIPmd59wSLxzpQRzQCAIgz1
         B6zBbHAliAKNpdjaSWzNLWcFAeFuOOGId8O/YZDzpC2otZs37pgSb1ob+KWWlNrbRN5t
         9KCjqq1MnGlShwpnfggWihqoVPv6cGNStPmOcSRlDjWQoNmkszKf03Md0xOBZ5wJyrW1
         kmgbUKqeH6HZa4AKdYQygXJdsAWYNDJsv8YfIp08hjkQ0ZcsPF5uYp70/oPCCUpeHgxE
         0y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6/cxy1v6pzyjdanivJDffUzvUHYSgGATroerbzvllHs=;
        b=V1R/YF5YgkyxiPDaIg8TmMaT8F4WLnp5w2Z40U1XFFjx76rA6YvRviVr0x3pdFGmTB
         Hbs6Hmh9KFoUoHYkaphwM6obE2QiZYXooRGdLR4i6rCn3YmpfRWNbumzFrb+8BWIeRfS
         sWSPG9kz1u8MHmJNNlQ/7TDqzb95s6uD1WKlwnikYElQpw/9eokigiE7n4p17/ZOFv7f
         nwOls8Y4qNtJ93XOUXtvpppcpqykz8oqzuPLCPjGw0t97XKhBajV2CUsXJd+Pm3ANdMm
         bMubST/uX8zgcN/zHUUPtSIGfskjscGqCf+sGQKOPjYUeG/TLR1A9WbdWaAit8262BSE
         s2Xw==
X-Gm-Message-State: AOAM532btU8tD5W4wzXodHqKliVo8a6qX35f82qzXdVd/Oqybnu87m6j
	ntI1xlsjTnb/osfQtt2NG9G9CRa1qJLLAqSLckh8+hI8FH7IBw==
X-Google-Smtp-Source: ABdhPJzAx52DBfH2VAZzEkNMsIBp50tAQe+QU3o7tewax9nQW5p9K/jgcxDoI5/gJGoF/zBh6pJgWQjahQAebcxBPec=
X-Received: by 2002:a05:651c:292:: with SMTP id b18mr12238299ljo.220.1637193048799;
 Wed, 17 Nov 2021 15:50:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdn8Gyj1cYhJYmC3oQ5dk8JCsJF=xZGWHAEBUhmWW8NOxg@mail.gmail.com>
In-Reply-To: <CAKwvOdn8Gyj1cYhJYmC3oQ5dk8JCsJF=xZGWHAEBUhmWW8NOxg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 17 Nov 2021 15:50:37 -0800
Message-ID: <CAKwvOdn8wwa8qu4CuPEvahJB3BAb1uB56Z+Smrrino8MCRUhDA@mail.gmail.com>
Subject: Re: meeting notes Nov 17, 2021
To: llvm@lists.linux.dev
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Also: https://github.com/ClangBuiltLinux/linux/issues/236
-Wimplicit-fallthrough was enabled!

On Wed, Nov 17, 2021 at 12:29 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Nov 17, 2021
>
> Note: I forgot to talk about DKMS support https://github.com/dell/dkms/pull/169
>
> (Maz) CFI breakage
> (Nathan) Long double literals
> Time to upgrade to clang-11?
>
> https://github.com/ClangBuiltLinux/misc-scripts
>
> (Nick) patch for armv6 hard thread pointer
> (Nathan) linux-5.15.y CI coverage wired up
> (Phoebe) -mno-fp-ret-in-387, -mskip-rax-setup
> (Ulrich) commented on open s390 LLVM_IAS=1 bugs, Ilie sent a patch
> (Anders) has been sending patches fixing warnings from the kselftests
> Interesting thread: RFC: adding support to GCC for detecting trust boundaries
> LLVM dev meeting
> (Arnd) mentioned build time regression on IRC
> Sami's x86_64 mainline CFI branch red
>
> https://git.kernel.org/linus/2105a92748e83e2e3ee6be539da959706bbb3898
>
> (Tom) BUILD_BUG -> _Static_assert and typeof(x) -> __auto_type clang-tidy
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
