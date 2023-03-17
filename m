Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3769879D6
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 20:45:28 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id h8so25032103ede.8
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679085926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gss4H1ZQ+0ilRx2yopl9iBc9rNAe4OOqCmcGOGIMEWs=;
        b=htp8spgeov1+vv2LWdT28qcFhHsBt4cM8ukREtMPRyCaKV/ulx2X6CPwCHnz34KJHo
         3D3nxK4bNGVdWCZqUO8EP18Ci+brH1u3baPGOUOiXZBC+UyWJwb2FL2ed58TGuU9j+5K
         SaPzypJp/zhc+UzYNjJHnLERUT3HZe+ozvNSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679085926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gss4H1ZQ+0ilRx2yopl9iBc9rNAe4OOqCmcGOGIMEWs=;
        b=SYs/8h66tcksDrJRPt9oy/3iSOOUytNmi0oCOFyN06bji1ZYCFpxYQyAZYEZSpNJOj
         bN+jwm+1uEVmZS9Bo89bE2ntvyrhP8IXU9VHpEDCXqd+QD02qpL51yQvoDLdtpGoNVPB
         lizAehWxHYWCzIam7ku+C1CR+rSFIPhVDIVfK/7ep1RjfS6GR0vOUJXNeg7lcatkttEw
         zWenHP0TMLrOpkck8fNK2v6CavpZi9YUNjxiEsDXY6819fIO1KyxcAlpIkXNvRP5C68c
         djozHRO3cxW1WfGq1QCYy+quPkzeWAGVWT9vK53rJRyRzPwXvwtqOyqEzSIW4ChH49ay
         oAYg==
X-Gm-Message-State: AO0yUKVoTX/prvMNWE6lhA+H/uEDDfDTbWxoNjaNYsml4N9y75KiA9zE
	Aym+kmjuYUGsdg69Z731rvHobIENJnAm5Dkw1qc5Aw==
X-Google-Smtp-Source: AK7set92V5PtCMvv6Jg6/P+zV2M9nBWTadDFA5oK8wNpX8DcRK1CBEvwHb/62gq2w3mBai1ulhwy/g==
X-Received: by 2002:a17:907:c083:b0:930:27c2:6d8d with SMTP id st3-20020a170907c08300b0093027c26d8dmr683980ejc.61.1679085926155;
        Fri, 17 Mar 2023 13:45:26 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id ox7-20020a170907100700b008cf8c6f5c43sm1357821ejb.83.2023.03.17.13.45.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 13:45:25 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id z21so25116091edb.4
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 13:45:24 -0700 (PDT)
X-Received: by 2002:a50:d54a:0:b0:4fc:a484:c6ed with SMTP id
 f10-20020a50d54a000000b004fca484c6edmr2431609edj.2.1679085923690; Fri, 17 Mar
 2023 13:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk>
 <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
 <CAHk-=wj1wYh_2d8Y1Vm6YjPTh4yMqWc++aWVY2LpX7n_atc2hA@mail.gmail.com> <CANiq72kjd+NES2mSthLKZduFm_KrwLShngs6jLqhoQPSb+1d-g@mail.gmail.com>
In-Reply-To: <CANiq72kjd+NES2mSthLKZduFm_KrwLShngs6jLqhoQPSb+1d-g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Mar 2023 13:45:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3c3Y9fWJjOwvQ0fN6hciWoh8xV69tcRqDm=tpQP14Ew@mail.gmail.com>
Message-ID: <CAHk-=wj3c3Y9fWJjOwvQ0fN6hciWoh8xV69tcRqDm=tpQP14Ew@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 1:31=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> From a quick look, it seems that `__find_restype` (which gets inlined
> into `m5mols_set_fmt` via `__find_resolution`) has a small loop:
>
>     do {
>         if (code =3D=3D m5mols_default_ffmt[type].code)
>             return type;
>     } while (type++ !=3D SIZE_DEFAULT_FFMT);
>
> that I guess gets simplified into something like:
>
>     if (code =3D=3D first code)
>         yield 0;
>     if (code =3D=3D second code)
>         yield 1;
>     out of bounds;

Ahh. That explains the odd constants I saw. I did figure out it had
something to do with loading 'mf->code', but then it went off the
rails.

> Though even with UBSAN disabled, if I add a dummy opaque call inside
> the loop, it goes back to something like before, except the jump goes
> nowhere and then `objtool` complains again:
>
>     .LBB24_20:
>         callq    dummydummydummy
>     .Lfunc_end24:
>
> So it is reproducible even without UBSAN getting involved:
> https://godbolt.org/z/hTe91b3eG

That code generation is some crazy stuff.

Yeah, that's not acceptable, and the bug is clearly not UBSAN, but
some generic bogus clang thing.

Much nicer to try to debug this as a "objtool complains about the
generated code" rather than as some insane runtine problem with code
falling off the end of the function.

                Linus
