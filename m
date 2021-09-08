Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFFB3FD5
	for <llvm@lists.linux.dev>; Wed,  8 Sep 2021 04:41:46 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id s12so1374699ljg.0
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 21:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SXLeBiUyDbIxM6wAYybRH9JPurCTPQJNt9i7c78CL8c=;
        b=Rbgf8Y1OXI0IcL3zhk0dAWwKjW7yFbGTWIW0f6eAu/jbsLFDiOi4j9Td9AclL2N+NR
         +6bSqPxyyq+5Nb0LgFDGqMsCdDLmUjwHSxBgvgFvSdLMsvikGXFKbJroSSWKznRdQ5wl
         7Cdl6ZMEU4XV5qDZwE4sZ4/k/6rM9tLNlbWD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SXLeBiUyDbIxM6wAYybRH9JPurCTPQJNt9i7c78CL8c=;
        b=ghX3M/GRDy8m9GKzt/C/HmOIa7oL7MnEuJk0HnmyZiXcxkWajlOdDNP4dFwhs/fkpS
         LdPJ2pXqyquXPeBXymKaTSyR14cQkp3H/Oy/2knEy+icM9jejBjQyMbJF4/xUHWRBPkp
         z+hykkjZgnnz0J724/EjS/163sRJ/Fp1D1iDbUHUAOXENQXH6cuDAdLeC7bWUfXlgxGy
         wKO3euTn/SiRWOxhqE0CKYQOT0p2Cb4McsYR4unrrirAKuwPOAHYVZSbhLB99rPWvWTX
         YSKDnDnrnqG0oMNvCDm+ddPHWpEgQe9ILnygVy7WJevO+oj9aMhN0QDT5pOIeXmKhRaz
         rpjg==
X-Gm-Message-State: AOAM530Pv2LzmnyVF6TkRt2v5Imtbs9aN5K4pN4nybh/+x0uxOOiAPcI
	qnshPokeY86HzlncDFtKg4BRyFOCCSG3VEkJAck=
X-Google-Smtp-Source: ABdhPJwWG8c9KSJmXftQg2woWZcGqPbVaWnI3TnZYMchVjqoFhGp8K+YlFcTue9uMdt+TmirJl0cVg==
X-Received: by 2002:a2e:a234:: with SMTP id i20mr1252622ljm.38.1631076104219;
        Tue, 07 Sep 2021 21:41:44 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id h22sm104535ljq.10.2021.09.07.21.41.42
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 21:41:42 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id f18so1779297lfk.12
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 21:41:42 -0700 (PDT)
X-Received: by 2002:a05:6512:1112:: with SMTP id l18mr1285247lfg.402.1631076101854;
 Tue, 07 Sep 2021 21:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net> <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain> <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <CAHk-=wgZkQ+eZ02TaCpAWo_ffiLMwA2tYNHyL+B1dQ4YB0qfmA@mail.gmail.com>
 <CAHk-=wh37UWTqUzbh5qg_x9pFgqBVwpdq_Kf+hnB5mqEUkrjmg@mail.gmail.com>
 <fb50dc44-fbe4-e6b3-5abc-d90375992292@amd.com> <5263c3bc-b741-5fdf-92d9-42a726076e76@amd.com>
In-Reply-To: <5263c3bc-b741-5fdf-92d9-42a726076e76@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Sep 2021 21:41:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjgi9jGiFHs7S2BPrGXKKOaVDqQsVPUsLWxkvZFAQ_WqQ@mail.gmail.com>
Message-ID: <CAHk-=wjgi9jGiFHs7S2BPrGXKKOaVDqQsVPUsLWxkvZFAQ_WqQ@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Harry Wentland <harry.wentland@amd.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Nathan Chancellor <nathan@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 8:52 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
> Attached patches fix these x86_64 ones reported by Nick:

Hmm.

You didn't seem to fix up the calling convention for print__xyz(),
which still take those xyz structs as pass-by-value.

Obviously it would be good to do things incrementally, so if that
attached patch was just [1/N] I won't complain..

> I'm also seeing one more that might be more challenging to fix but is nearly at 1024:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3397:6: error: stack frame size of 1064 bytes in function 'dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than=]

Oh Gods, that function is truly something else..

Is there some reason why it's one humongous function, with the
occasional single-line comment?

Because it really looks to me like pretty much everywhere I see one of
those rare comments, I would go "this part should be a function of its
own", and then there would be one caller fuynction that just calls
each of those sub-functions one after the other.

That would - I think - make the code easier to read, and then it would
also make it very obvious where it magically uses a lot of stack.

My suspicion is actually "nowhere". The stack use is just hugely
spread out, and the compiler has just kept accumulating more spill
variables on the frame with no single big reason.

Yes, I see a couple of local structures:

                Pipe myPipe;
                HostVM myHostVM;

but more than that I see several function calls that have basically 62
arguments. And I wish I was making that number up. I'm not. That
"CalculatePrefetchSchedule()" call literally has 62 arguments.

But *all* of the top-level loops in that function literally look like
they could - and should - be functions in their own right. Some of
them would be fairly complex even so (ie that code under the comment

        //Prefetch Check

would be quite the big function all of its own.

We have a coding style thing:

    Documentation/process/coding-style.rst

that says that you should strive to have functions that are "short and
sweet" and fit on one or two screenfuls of text.

That one function from hell is 1832 lines of code.

It really could be improved upon.

               Linus
