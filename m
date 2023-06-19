Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D6C146
	for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 11:20:32 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-54fac3b7725so1191000a12.3
        for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 04:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687173632; x=1689765632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHwcK4+G1+pHJr/AemM31vH7TcoiQYXrJjZnbqSfWkU=;
        b=b2x+MiU0PNvIKQ+guvqmHOmI9F6CAu+aBiwIh+pcKMDRkv5FSecZnrBIhRQxGQVxgr
         8jqozfaP6xvU6hamhUGx4GUfkighFMxNE29OAp+uEkAGPE51+JZ2kiA9LRbssoyd2dmH
         WvWSYb24P+BcJZWxR8dSv7bAiOgWqJ3Xp0yvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687173632; x=1689765632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHwcK4+G1+pHJr/AemM31vH7TcoiQYXrJjZnbqSfWkU=;
        b=cMJWso8ioZY6eL6y49NhkzlriVmDLBlOTDA3n7J0XTesEL6GvMgoSLPXjCT3eoGbna
         uHIylQl1WKRVo6Xza7TsiJsLHY42JY3ZfZEKPC2vI9EJ2WvOComLJYziiH3RFpuvZ6fx
         T672QMBGGy1iSgQ56L2KwSn7M4f9QhyrjC4M5UvFd7I2Kj8x6m58gNva9i7iyqtTDiEg
         TChKz2/pXmLFFNAcJKMfRr0kWusIZ4IzJJOhw6eGT10BZMRghp1iXr/XzVtFrzoTMiXe
         sFVwNrEAF0vL/z7lyU5JlOzYBohrYFtZ2jyIGvRxJk2RGzX610R2UbrfnTccmG+woCpd
         xUsQ==
X-Gm-Message-State: AC+VfDy99iBYNqx9DcKfmmbQ0AV/IcRRwJKm+73fPUzwxpGH/DsyIEq6
	eOjnEPb5DRZCvWPD522DLM6ITuu9JsmsDIqWU7egtA==
X-Google-Smtp-Source: ACHHUZ4RzEz4p8yr6qGhmElkBhQ6Fs4KdBjLaQWqTw2kN8Qcn172fmQXOI9Utd/vo5KAF+1+6ZMSSY7q/0kiO1LHPJA=
X-Received: by 2002:a17:903:234b:b0:1b5:42fe:5eac with SMTP id
 c11-20020a170903234b00b001b542fe5eacmr2783982plh.10.1687173632019; Mon, 19
 Jun 2023 04:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615145607.3469985-1-revest@chromium.org> <CABRcYm+C+tPwXAGnaDRR_U2hzyt+09fjkKBp3tPx6iKT4wBE2Q@mail.gmail.com>
 <fbd79f5f2b250ec913c78d91b94ca96fb96f67ee.camel@gmail.com>
In-Reply-To: <fbd79f5f2b250ec913c78d91b94ca96fb96f67ee.camel@gmail.com>
From: Florent Revest <revest@chromium.org>
Date: Mon, 19 Jun 2023 13:20:20 +0200
Message-ID: <CABRcYmLaummOg=Nf0qXVN2eci=25OqXLD0zpCUz4CgmTjvo9LA@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf/btf: Accept function names that contain dots
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@google.com, haoluo@google.com, jolsa@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 7:05=E2=80=AFPM Eduard Zingerman <eddyz87@gmail.com=
> wrote:
>
> On Thu, 2023-06-15 at 17:44 +0200, Florent Revest wrote:
> > An easy reproducer is:
> >
> > $ touch pwet.c
> >
> > $ clang -g -fsanitize=3Dkernel-address -c -o pwet.o pwet.c
> > $ llvm-dwarfdump pwet.o | grep module_ctor
> >
> > $ clang -fno-integrated-as -g -fsanitize=3Dkernel-address -c -o pwet.o =
pwet.c
> > $ llvm-dwarfdump pwet.o | grep module_ctor
> >                 DW_AT_name      ("asan.module_ctor")
>
> Interestingly, I am unable to reproduce it using either
> clang version 14.0.0-1ubuntu1 or clang main (bd66f4b1da30).

Somehow, I didn't think of trying other clang versions! Thanks, that's
a good point Eduard. :)

I also can't reproduce it on a 14x build.

However, I seem to be able to reproduce it on main:

  git clone https://github.com/llvm/llvm-project.git
  mkdir llvm-project/build
  cd llvm-project/build
  git checkout bd66f4b1da30
  cmake -DLLVM_ENABLE_PROJECTS=3Dclang -DCMAKE_BUILD_TYPE=3DRelease -G
"Unix Makefiles" ../llvm
  make -j $(nproc)

  bin/clang -fno-integrated-as -g -fsanitize=3Dkernel-address -c -o
~/pwet.o ~/pwet.c
  bin/llvm-dwarfdump ~/pwet.o | grep module_ctor
  # Shows module_ctor

I started a bisection, hopefully that will point to something interesting
