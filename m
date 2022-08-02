Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C546C7F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 20:38:53 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id p132so17802430oif.9
        for <llvm@lists.linux.dev>; Tue, 02 Aug 2022 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=7jURqCa4ba2+mKyUWH2adNdXpkP+kvuwIBO9YUGMb6I=;
        b=P/n+YuvnOltX5zlFbN3shKTljvTDJIGzJJAQWy2pDo3no2NuwAh4jh6jx3GRkCl6Sx
         64UR7YF6uoIg1epSxgOO3ogWZrYsHQUeoooWKqlBDWq8urKYT48f1kO/DIfp/S0oQkdX
         +0CK2yhsrhanbe7fFweOpa013YiWO9M3zQVTpRnWhCGilXFJq1s1iauy7RYRcHDt/zHI
         mmQxjRQtsrZq99xftdYJNQeO0HabhRJsYXA3CkbI3QeiAj2QgmR4ERzNlnhiGIrb2lY+
         K1MGNlbkFF1r8cI2WWAq1Kqm6oqn4fUdW7lqvryPLpuv7VuX4c3A9YOC2/5BVgoL4VHn
         xwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=7jURqCa4ba2+mKyUWH2adNdXpkP+kvuwIBO9YUGMb6I=;
        b=gbcLWCEp3dgd7wpogTV/tGPsQ6D4WdKp1M3AJtQmREmFGMiJbiF29rwUzzO/RgSvy/
         BWNhI2ty3oSMJMcQa4+16rUqPL9zoTBO1WvmZc79MmSYCEKlniU3sXzncwBG7Mf9cZ7a
         7qkzdscs54eK4rC80WPR4Ol9+L01Xiv+7OSqN53rI3xDF1LywFrNfWevttDg6k4YcoqI
         Ef0jaYojusAT2iCQ72ylJvlBhy5QIukkLzQpXCBPhwZ+Aqa4rCTXGlgXfUA9d+wI/anA
         bZNJxj5eoaitTcNmNI4Ypsvw7Kwgrn959+i2gURF7hx41xWHKgaPmwu5h8CJ/uzZGoAb
         Oz8g==
X-Gm-Message-State: ACgBeo2Tt7wFhyDPg0rd48QAILcAyS2hgO9LneBgKuPYi3vPdOE4EMQq
	fZa7AOBUZEq2x2tDLFlyzItC/WyWcOQe6o2IS+Y=
X-Google-Smtp-Source: AA6agR6NSP1G9SYFNi1Uh7hIAxmJWgtm6XLVTA8eWWN9Qju/C0tGlXuaJ37GlW+aVSxTLWTvUI3Tgb5sft1hwHOI2BE=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr496304oib.128.1659472732577; Tue, 02
 Aug 2022 13:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUXSK1Qxt7osAy3oxvMW+5fVT8b2aBeVGr1TY_1G+N2D7Q@mail.gmail.com>
In-Reply-To: <CA+icZUXSK1Qxt7osAy3oxvMW+5fVT8b2aBeVGr1TY_1G+N2D7Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 2 Aug 2022 22:38:16 +0200
Message-ID: <CA+icZUWPazhee3=+mxhhyHhZ-8vpcj5FpTLyPbarpeVd0KvO4w@mail.gmail.com>
Subject: Re: LLVM 15 and 16 packages on apt.llvm.org and in Debian
To: Sylvestre Ledru <sylvestre@debian.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Stellard <tstellar@redhat.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 29, 2022 at 12:08 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi Sylvestre,
>
> I see some new LLVM 15 and 16 packages on <apt.llvm.org> and
> Debian/experimental:
>
> # LC_ALL=C apt-cache policy clang-15
> clang-15:
>  Installed: 1:15~++20220716100712+45067f8fbf61-1~exp1~20220716220809.624
>  Candidate: 1:15~++20220716100712+45067f8fbf61-1~exp1~20220716220809.624
>  Version table:
>     1:15~++20220724113059+7feab85df8e8-1~exp1 99
>         99 https://ftp.debian.org/debian experimental/main amd64 Packages
>         99 https://deb.debian.org/debian experimental/main amd64 Packages
> *** 1:15~++20220716100712+45067f8fbf61-1~exp1~20220716220809.624 100
>        100 /var/lib/dpkg/status
>     1:15~++20220625103012+3d37e785c77a-1~exp1 99
>         99 https://ftp.debian.org/debian unstable/main amd64 Packages
>         99 https://deb.debian.org/debian unstable/main amd64 Packages
>
> # LC_ALL=C apt-cache policy clang-16
> clang-16:
>  Installed: (none)
>  Candidate: 1:16~++20220728111245+7eeb468ae5e5-1~exp1~20220728111345.647
>  Version table:
>     1:16~++20220728111245+7eeb468ae5e5-1~exp1~20220728111345.647 99
>         99 https://apt.llvm.org/unstable llvm-toolchain/main amd64 Packages
>
> Today, Friday I remember Tom wanted to release LLVM version 15.0.0-rc1.
>
> I love to see such a version on any of these two repositories.
>
> And hope to test with it a Linux version 5.19 FINAL (hopefully this sunday).
>
> My aim is not to put pressure - I am just curious what your plans are.
>
> Thanks.
>

Hi,

I had prepared some APT sources.list to download the latest LLVM
toolchain packages from <apt.llvm.org>.

Thanks Sylvestre.

Just see on upgrade:

root# LC_ALL=C apt-get update
...
Get:52 https://apt.llvm.org/unstable llvm-toolchain/main amd64
Packages [21.4 kB]
Get:53 https://apt.llvm.org/unstable llvm-toolchain-15/main amd64
Packages [17.8 kB]
...

[ LLVM-15 ]

root# LC_ALL=C apt-cache policy clang-15
clang-15:
 Installed: (none)
 Candidate: 1:15.0.0~++20220802093129+08c239e29fb4-1~exp1~20220802093223.5
 Version table:
    1:15.0.0~++20220802093129+08c239e29fb4-1~exp1~20220802093223.5 99
        99 https://apt.llvm.org/unstable llvm-toolchain-15/main amd64 Packages
...

[ LLVM-16 ]

root# LC_ALL=C apt-cache policy clang-16
clang-16:
 Installed: (none)
 Candidate: 1:16~++20220802111203+8be1197285bd-1~exp1~20220802111307.657
 Version table:
    1:16~++20220802111203+8be1197285bd-1~exp1~20220802111307.657 99
        99 https://apt.llvm.org/unstable llvm-toolchain/main amd64 Packages

Regards,
-Sedat-
