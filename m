Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B91C36
	for <llvm@lists.linux.dev>; Sat, 26 Apr 2025 20:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745701041; cv=none; b=TmXyvx7PS5LG5DFn9lb9ix5R9Py64Tfxei0TrMvxiXG5MyIHNB7/2qQOvzKTSM45HqUw5Ofsg1z1Y0spd2ZDCYsZcIGwQW/6aDhjTjjsuiTKGADif+PvSg3H/fjSrb5iy6qqNs3Rv6CtlpRUVuvOSV2uHcgMScPvycIObTX8tcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745701041; c=relaxed/simple;
	bh=vrnKQhr5cfP9Ei4CCB31DhEqb6QWvhLq1OVYP4NPdFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0J52wxI53F8KEcnnCoi6uvS2dHczvk9ZF3oZO+SUe/oMrvl7K+pXozNpfLLAv7IsIZiGQCcGpLRPXVV9nyBfGzr5ceF7URz3xNyQqvPJ8/pOIjWZU1l2paoaM1g/So21qRQLct2jR77933SibYlIgWxXkFdHPUGS6NAEoASNKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QuiZciHp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QuiZciHp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aca99fc253bso508797766b.0
        for <llvm@lists.linux.dev>; Sat, 26 Apr 2025 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745701037; x=1746305837; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UoAad0UF3aMOunyUShqi7DpSlcddCQ3yXawelXX5azs=;
        b=QuiZciHpN+MPdztMELFckAQ5rzI6JKSLJVsrmJAAnyJltlmRJKvZYukjLxpBK8hEVe
         yhm5XxgViqClbESxwovkuewMsej96g8cL187e09eZTCN2o6wPtLJPJDhK3XtnQXpxMM1
         QvyKLZ9hS2XwYf5g6FyDlnefneMASctZtlZBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745701037; x=1746305837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoAad0UF3aMOunyUShqi7DpSlcddCQ3yXawelXX5azs=;
        b=C1V0ZbXKXSob4iFda/afV+y7TUx/mpdeAW47+DDlrZdZKeUB4JvUWOuU/cPeD2v+Pn
         EXmOQoKVeG7zEGKmT5zOiI0KXbOKak8WSagvcTQH/CLg7ngAjS67860CiDbfbAjHazDH
         +g9/l5X1PnSTAobX27ffDms7AjNqjxXkhbFkD3nwVSyuHbPm4u4U/8p+XAg6PCe17yto
         S3O2t984gZ6Y9vsFQ+K8o459+oj8kf8QFD0rDjeJTnDm28GA3Lmrb+FmsNZKuZbYEXJw
         NNCPTbFT6xCPSVfTZxuPzszXJxuP8HizUp+7oSwXChVnxF/imkjteA8PPQDQHICzMGjd
         c6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVWYM9LI74suBGSh052wy92lgEivyTyMjulrWvLSbXvOZUSXNd2bhwSub+hYwpN3jnWF7Dv@lists.linux.dev
X-Gm-Message-State: AOJu0YwviCAk6sDQmWAQpzzavTehykjVTfLVWSPAy26slNN/IM4q4Pn7
	kwwddPjIyWLZdvd69FwtGWnps1uukHWpbudn76Taw+AClEPzQrYFIQn5vr6LHu363uJR3NZqc5f
	HSnvwTw==
X-Gm-Gg: ASbGncsR8eDDtB0GvWmvumek6cOQeicZeP6xkmlUULP3Bp8jv2P7v/WYQQduyuk4svp
	V0Lr2Zn8neykjyeAgqULGAKg8Cnf1egSOImNNTUSeiojYjYaGQXZpIMFCPhII6qaz95FIGplVYR
	c0jq7QWDBnCvVl+mE+YJdlZzc69HTjpY1oy4cTi3wyT7QRU3U6XpTIoHG1ujAfKXIBRYeAc8WEX
	zaAcGLFL4q3qgpCvJPjHIeamRyy18cESPSZ4T6VvU/NNrZ+Asap+MlpLn1GH+IZzOtBMoEIWeho
	Tx4tbxjtJZlmJzSsViN+14s9qXQkAgaXTIe6CamIZBkyWM/QDUtuAzbzXLS3oDPT2sAFCpPkgTG
	7TTq1yln1AxiegnQ=
X-Google-Smtp-Source: AGHT+IEyx+2gXRPQMIGy33cSHk9VZHJQ9flUW+wL2KrGA2Im7siLJOVmMtOXjjCJLjHY4P10E9xjWg==
X-Received: by 2002:a17:907:c0d:b0:ac4:3d8:2e90 with SMTP id a640c23a62f3a-ace848f17dbmr342640366b.13.1745701037634;
        Sat, 26 Apr 2025 13:57:17 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed704bdsm342293666b.148.2025.04.26.13.57.15
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 13:57:16 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2963dc379so503083866b.2
        for <llvm@lists.linux.dev>; Sat, 26 Apr 2025 13:57:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU198w5e4VsQi8saNI7SArJ00h0Dwk1/w4g6eqNVtADt5NPVDVvfDbTJZP24qANh+a9BQrS@lists.linux.dev
X-Received: by 2002:a17:907:da6:b0:aca:d5e9:9ce with SMTP id
 a640c23a62f3a-ace848c0444mr251602866b.9.1745701035588; Sat, 26 Apr 2025
 13:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com> <20250426200513.GA427956@ax162>
In-Reply-To: <20250426200513.GA427956@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 13:56:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
X-Gm-Features: ATxdqUFEDV4hwTKkCo5LsFlF2depTN17SPH8wq3XkwJj60cqlzJsiqa-S0xR4lk
Message-ID: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 13:05, Nathan Chancellor <nathan@kernel.org> wrote:
>
>     KBUILD_CFLAGS += -mllvm -trap-unreachable

Hmm. That certainly builds for me, but yeah, it generates new objtool
warnings, notably

   panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h

and I *think* that is because that flag makes clang not honour our
*explicit* "this code is unreachable" annotations.

So now objtool complains about the fact that clang has generated some
random code that follows a call to 'panic()' even though objtool knows
that panic() cannot return.

And those explicit annotations definitely should be honored.

IOW, there's a *big* difference between "the programmer told me this
is unreachable, so I won't generate code past this point" and "I have
decided this is undefined behavior, so now I won't generate code past
this point".

So what I'm asking for is absolutely not "trap on unreachable". That's
wrong and just plain stupid.

I'm asking for "trap on UD instead of *assuming* it's unreachable".

Because clearly that code *can* be reached, it's just doing something undefined.

See? Big big difference.

             Linus
