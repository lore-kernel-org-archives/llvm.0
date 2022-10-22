Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50197B
	for <llvm@lists.linux.dev>; Sat, 22 Oct 2022 04:14:55 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id h8so6144206lja.11
        for <llvm@lists.linux.dev>; Fri, 21 Oct 2022 21:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzRG8DueJFVBMoBP3WLGrZ36/yY2O+ekECOxt59Gcj0=;
        b=mGit/OKfyUTcqGootPlZvse7XEQUFvO23uFrEXaDR5RVDaIlVGo6ZEa5Oat75+yNrt
         uh/9w+hk9w7cgMNJ9Vg946Zvdsg/YcyUfsvog0yB4eKVbtn/Xb/tmHTk6THA5w5jc+b1
         iOFMkUh/xpBzGy37JyyoMhDjAaUDj8n2tinf110KgtA2NCTBhEd2+4jqWc0wFfOp45sr
         LxNiFLkDBd/IM96oF/3p4SPDEFWNxSCgV4FYTtA3A5sFougMfCMfYxER2DunRAh6cILs
         UH38cqcZc3sishuc5Cg4QXgRnP48/x+lR7ejK6KSKMrGMmiLF/c2KaZuI/1B0imqriFf
         2abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzRG8DueJFVBMoBP3WLGrZ36/yY2O+ekECOxt59Gcj0=;
        b=28EvvFQQ7kd3qHzpKyTeHxVu1JOF14FOsjDJUJGLL46y/uXecLL+S4DJPU0ulJISjp
         cDc3+DXqde7tSV+5+IVWIUAZBVDV/pjdIdTGs2MQE3j0nWQPButdgAeWD8qhoT7gZyzg
         yR7WD/qq1oK93exG6wC/VEKGvrOr+xboPSHJfVjE3aD6xkm9Dba8Zm8awi56SOnnPPVR
         nk78YVow51fxaesfTriNmNbyTxPA4bErdtUv2EkmTqaYonZumUGGuQaym6JBapzvIrre
         SesYMXJ/8Bqrx5/Nbc7qNhhmEHhJ4rERN4IaC/9mnOrbg0l0E9b6gQIG09bLqH0Ag75I
         iuUA==
X-Gm-Message-State: ACrzQf0HFya73MHfoc9wnbv2lGa7M/Qj1M1W3iiQ1HsfFPbg6w0VvRtX
	36Nu9EwXXwGQxMExu9Yi9yt1cGQAlmHJkpBYckxMwA==
X-Google-Smtp-Source: AMsMyM6is3k+7+BEm08+a8A6LvnUfO9hY+kI1H+PV7dz0OFzVAoSBGy+rZuwbEe/8Y4w3ywLfIqQulCk8Ffi/ojOdHM=
X-Received: by 2002:a2e:9256:0:b0:26e:197d:3ff6 with SMTP id
 v22-20020a2e9256000000b0026e197d3ff6mr8269040ljg.518.1666412093751; Fri, 21
 Oct 2022 21:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1LBGZPMfCZ8A1bl@FVFF77S0Q05N> <CABCJKuf=OB_3ZR_rwaG3H5kHKmTTDk+sihjJXYmyWgZjUX2yTQ@mail.gmail.com>
In-Reply-To: <CABCJKuf=OB_3ZR_rwaG3H5kHKmTTDk+sihjJXYmyWgZjUX2yTQ@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Fri, 21 Oct 2022 21:14:41 -0700
Message-ID: <CAFP8O3JuC9HL1-G23vGJO=jjN7Tsgz7c8TB1_F6UQ-MqCyGNLQ@mail.gmail.com>
Subject: Re: kCFI && patchable-function-entry=M,N
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Joao Moreira <joao@overdrivepizza.com>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 10:39 AM Sami Tolvanen <samitolvanen@google.com> wr=
ote:
>
> On Fri, Oct 21, 2022 at 8:56 AM Mark Rutland <mark.rutland@arm.com> wrote=
:
> >
> > Hi,
> >
> > For arm64, I'd like to use -fatchable-function-entry=3DM,N (where N > 0=
), for our
> > ftrace implementation, which instruments *some* but not all functions.
> > Unfortuntately, this doesn't play nicely with -fsanitize=3Dkcfi, as ins=
trumented
> > and non-instrumented functions don't agree on where the type hash shoul=
d live
> > relative to the function entry point, making them incompatible with one=
 another.
>
> Yes, the current implementation assumes that if prefix nops are used,
> all functions have the same number of them.
>
> > Is there any mechanism today that we could use to solve this, or could =
we
> > extend clang to have some options to control this behaviour?
>
> I don't think there's a mechanism to work around the issue right now,
> but we could just change where the hash is emitted on arm64.
>
> > It would also be helpful to have a symbol before both the hash and pre-=
function
> > NOPs so that we can filter those out of probes patching (I see that x86=
 does
> > this with the __cfi_function symbol).
>
> Adding a symbol before the hash isn't a problem, but if we move the
> hash and want the symbol to be placed before the prefix nops as well,
> we might need a flag to control this. Fangrui, what do you think?
>
> Sami

Since the kcfi code expects the hash to appear in a specific location
so that an instrumented indirect jump can reliably obtain the hash.
For a translation unit `-fpatchable-function-entry=3DN,M` may be
specified or not, and we want both to work. Therefore, I agree that a
consistent hash location will help. This argument favors placing M
nops before the hash. The downside is a restriction on how the M nops
can be used. Previously if M>0, the runtime code needs to check
whether a BTI exists to locate the N-M after-function-entry NOPs. If
the hash appears after the M nops, the runtime code needs to
additionally knows whether the hash exists. My question is how to
reliably detect this.

If there is motivation using M>0, I'd like to know the concrete code
sequence for `-fpatchable-function-entry=3DN,M` and how the runtime code
detects the NOPs with optional hash and optional BTI.


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
