Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA5F1DE2B5
	for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 17:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862835; cv=none; b=WGCk+2k8L6ttdD8C9CzJrHnG1sOH65vfsKEjw0Pg5tqc++7l6H4VMFhe59RIgNdTXXrNZ7bfv+89Od5sCjoTO8ctObJdD8kx28UW+P7TvgMfYSjibQ3Q+aJQptGSVBAL926U2J/ktcA0Tar3rjjqxReueyXm4SgxSlcEUPWkqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862835; c=relaxed/simple;
	bh=hI9l8kcessfNWDnOCtcAb1CkErwiSLvOks9oZEhZYRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0zO7bJe2SzT7aNj+M4z/Ww58bNomoo3q1PkiMswSZt05JJW9IiQZm8Ko64Hrlee5Z379k2AQAYRSxan+p3G0rjBg9HcbT7ktcrW/8cy4ypgZ8A6l8B5OzlTgf8EXMRI2r4vgNEPWUzvB+JARDeMurz9pQZ3I/pEm7yxHklQFbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u1EZnJUP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u1EZnJUP"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso816711366b.3
        for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745862832; x=1746467632; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cELG0a2mXl5N6mpi0+RLp319EHg3sGhSPY6U6Zc2/4k=;
        b=u1EZnJUPgDjpElfITqN2KBsH4rTalRDsLzU3e5mcVgFq6LhHuRMfhTVHpADYWLHyEy
         ExDsg3T8CSJwtaBmkJ4M411xwN8VXvCx+xA5oQP6f7PpTRBzP+vSVeqtqxs4jrU6koFg
         lIVgbvtqkdzm4GSbS0SR2hYBGitajo3Lmd5CNK89wlIAINqXj2T0ipOpwQ9gZ1Xp/6Ia
         2/T/flQwGKAb5EkTqdVLsDtwCa5RpZbn3bEDeXt+tSXSR96/pu4dKsOC+rWCDx7ql1kD
         tqqaxEaNWupr9kukGEBLM9zcU5qMiiP/SQCQr/EnVwNk1vBK8FZ7+IiMglGd7+SVN+gh
         hlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862832; x=1746467632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cELG0a2mXl5N6mpi0+RLp319EHg3sGhSPY6U6Zc2/4k=;
        b=je+isJQFscXz3Mwa5E26j/+qlrawix5b2gfNLSZ5g/2/4qB6X09jB9uD20cyqcrqNW
         v6ccZM6BbKySfq7SLPOlTbO5TBb2OI8sqEuGtO2DwKau9PWt7ubG+zxIiuX+sQ7ywD1J
         q4hkKGb30TLMr6GITFAkcM3TFNDPYcOOVgAS3ViGwr7fRDEbRLBima0QNeGtV5tZYIzW
         QZgkIQfHnuQK9GWyNlMumK/i36bxENkrO4sYkvgW8ItST7jwcQWbq21OEcbuc3GQ8v3D
         ljfkMBJHeZGADCOBD7E9Z5Sz9/o4wTYjY5I27Ki8A/0nONtv+Z5FmjkB8juFHGJMZ3ii
         E0mA==
X-Forwarded-Encrypted: i=1; AJvYcCU1aeRFxCEpaV9BIm3fD8oichBuHvBe83eME1aqP+wGSYbxgjwK/glMptRC+z4FFBYxWSOy@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+WjWa1nmYi6QocQ/Y2sR+rFHIg2lajFIdTVBLeoO2R+6DQojY
	3BdFFl3MmBpkh+14OC2F2/IhWTScDSeNRzxFugQdcf2eOdtfPCIg7wBnegMNE5h4YO7Z5s3BEcR
	GVbzEG01ExTOtO5TImPP9nwfTP8r55NK5v1g=
X-Gm-Gg: ASbGncsFSzxPWS74lhVJo55K02VZ1YhO6LS+csf1nniozneArWxP20bK4CIlyR0CROL
	WetruAyvCPOXGGK9/x1SFneO93+r2v332sn8cZIJttB6UyTxCn4j+TJr5/0xUXE2WQ55GVD84yi
	Ziv+pADJWe+KK43VedHBs=
X-Google-Smtp-Source: AGHT+IHqIg2Loa+Y0QKSG8YxCDTk31ezU03P7AATW+Z/1ns4Jt8XF4Ad3BTyh3bkX7w/0eQbixiiXnU4rTOZoxrjc1Q=
X-Received: by 2002:a17:907:7d8a:b0:ac6:fec7:34dd with SMTP id
 a640c23a62f3a-acec6c67f34mr8894566b.52.1745862831882; Mon, 28 Apr 2025
 10:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162> <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
In-Reply-To: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Apr 2025 10:53:34 -0700
X-Gm-Features: ATxdqUEJVTdPbMJGumIpmgzZbU1wN2Zlt9jaYxbaWMUYvK-iFBpwnq2gM8nUxXs
Message-ID: <CAGG=3QWKQ++Yhh0w8zJobs=C4M7F01doAw9t2h=f2W9wxSG3Mw@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 1:57=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 26 Apr 2025 at 13:05, Nathan Chancellor <nathan@kernel.org> wrote=
:
> >
> >     KBUILD_CFLAGS +=3D -mllvm -trap-unreachable
>
> Hmm. That certainly builds for me, but yeah, it generates new objtool
> warnings, notably
>
>    panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>
> and I *think* that is because that flag makes clang not honour our
> *explicit* "this code is unreachable" annotations.
>
There's also this flag:

  -mllvm -no-trap-after-noreturn

Here's the documentation for both flags:

static cl::opt<bool>
    EnableTrapUnreachable("trap-unreachable", cl::Hidden,
                          cl::desc("Enable generating trap for unreachable"=
));

static cl::opt<bool> EnableNoTrapAfterNoreturn(
    "no-trap-after-noreturn", cl::Hidden,
    cl::desc("Do not emit a trap instruction for 'unreachable' IR instructi=
ons "
             "after noreturn calls, even if --trap-unreachable is set."));


Could you share how you configured your build?

-bw

> So now objtool complains about the fact that clang has generated some
> random code that follows a call to 'panic()' even though objtool knows
> that panic() cannot return.
>
> And those explicit annotations definitely should be honored.
>
> IOW, there's a *big* difference between "the programmer told me this
> is unreachable, so I won't generate code past this point" and "I have
> decided this is undefined behavior, so now I won't generate code past
> this point".
>
> So what I'm asking for is absolutely not "trap on unreachable". That's
> wrong and just plain stupid.
>
> I'm asking for "trap on UD instead of *assuming* it's unreachable".
>
> Because clearly that code *can* be reached, it's just doing something und=
efined.
>
> See? Big big difference.
>
>              Linus
