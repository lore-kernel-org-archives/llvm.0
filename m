Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57E52951D4
	for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 18:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863717; cv=none; b=GOFQZci+8CoOoRbcskuZ8DCKuTASL3bebked4MrL7tG6yloffTuo4VyhtsU+gVvdFJbZu5s9koxIGMcQz1j2EvTSPomHZW/vHUUPw7fEau8EvUYo0DDgaSXKF+TLhNR2ci4a2EEH/38x93AOG9qVBbGsTyX6QpoIwE+8bDKFDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863717; c=relaxed/simple;
	bh=ObSXFlGsDpWRV8E/7b0vGadnQXgzqYHgpaoAoCxwOYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UiHuDb/0GLnRzv8hYs2RB0QVgZXOV+vFo1aW0cRAsJInWNT8JLymD/X2/AQI4Ft7DaN59cQzWMf4KIKD4mwwXeKgMJlcOUqpWJbGs6y0e/G59F+uLqzqK58IzkeYmrgZaNszDegVSYBxvhZu8i2kbhjVj2sJRz1hlxx8TGMEVmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GA/9zJXt; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GA/9zJXt"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1178371866b.1
        for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745863714; x=1746468514; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObSXFlGsDpWRV8E/7b0vGadnQXgzqYHgpaoAoCxwOYI=;
        b=GA/9zJXtKa0Im0YD4tly3vX7fXCATIgTo6Gfo18A08Ha08QAD/OwK4agGdo9mHXHWA
         dZsjPSxKKfs02mKEpCXLE9oyEWuG4BAj6jDnOXllrU6bCOx0Pjs3mRzd7EtkTKc9engd
         uYOmsLlDrwcuovKpe9OWPwzLmmPunLOaNxbBvptzOeZV74xneoxntsxhkReOnBDR5Ewe
         hqYv1DM4hdIPxbAtITNVmOPv0Dr9VDaxyuo3ZfVkw5AO5zupkh6b7ZH+ZGdlhJyN89Tf
         dvNi4qJDNNwcOr2e/qulpcR9+157hIgfYgVbBI3S8m6wIvFAXRDEBrAzoEDelFsJKHBV
         0hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745863714; x=1746468514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObSXFlGsDpWRV8E/7b0vGadnQXgzqYHgpaoAoCxwOYI=;
        b=pZxp64ij6gGWexe07a0OdOxbMLygFyH5KfpHhKU5hvP0M/QEOQHumDJip0M9qOia3K
         s2auF+p6+g6VaxTn4bRUOiGyymjd8FUOXKAGV6a5TY1t0mZtE35qvRAXPDviTB01kwCO
         Swu6unukZFIiFO5B1rHyhfDT6bUx2JABxpEetsznn8EbDbdw1hwJozRwcwrhYhu6bSvd
         eqQJwnHYludPB/AYuSniBWgiQ7uf1boY0/TCvRIjp4kQdz/ZLlkA0zsak77fnd/X7qr3
         gftS2laKNAD5TOGymWQNeGa9Pd158DUiO+SPuvy6UJcrPq3HnCMsGPuZQK/QG/ltlGrc
         4QZg==
X-Forwarded-Encrypted: i=1; AJvYcCXzRgrT4uv7tBQq3BXd+zGtb6H1IBVqwQzkwzfiHI66cmZjPXDsyzwMbtt9ndL8MtsWtZsP@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxt4+JNyfU2uJHBevwWu78Mdh7APSxnFgt1gtzTBh0BlV9jO8U
	0RMr2JH+ZGiGNMrsZlQvxJhz1/YKrRktbSJ0zP2u8pMy+y+usJi24hjR3yX/4w2Jh45OrviPJTe
	0LjGxhyOxAlk/PTDEB03KztDtRn26jXBVoZE=
X-Gm-Gg: ASbGnctBfvyUTqCR6GwBSrCDducXycBJT1I7xjvcBlDhPSj3yYas/FQ+nk8Z0SDhHe+
	Rk8PqCPzqeEL3vZ+n1oIkH4CdD8UrYik9c/Hmawmfvo/cKjiqS0U8M74s7IqOix4jNC3yWGhqRm
	wFSTTD2B7OFGy6U8ZS6BQ=
X-Google-Smtp-Source: AGHT+IH17lQSjopDcYFAF6vUXYSB4/G8Ck6PNpMZfMLiwEZdqHhhJ7KrtjzzJEVPEcYGZn8hDBoMJ8c6jyFfD4ISC3U=
X-Received: by 2002:a17:907:940e:b0:acb:1165:9a93 with SMTP id
 a640c23a62f3a-acec69a7894mr16522666b.3.1745863713696; Mon, 28 Apr 2025
 11:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162> <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162> <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
In-Reply-To: <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Apr 2025 11:08:16 -0700
X-Gm-Features: ATxdqUHdkMoNTiG3otQDMcEbh3e1opeHpcZVUMb0X719K18pydkfuXGdraIMEuw
Message-ID: <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
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

On Sat, Apr 26, 2025 at 5:31=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> So please. Clang people need to get a clue. Yes, we care *deeply*
> about performance in the kernel, but a C compiler that thinks that
> using UD to generate "better" code is a disgrace and pure garbage.
> Because security matters a whole lot too, and the downsides of turning
> undefined behavior into random garbage are about a million times
> bigger than the "I can remove one integer instruction for zero gain".
>
> For the kerrnel, we want to disable absolutely all undefined behavior
> crap ideas by the compiler. It's why we use -fwrapv and have for
> years. It's why we disable the idiotic "strict alias" stuff that
> should never have become part of C. And it's why I want that "turn UD
> into unreachable" mindfart fixed.
>
> The notion of "optimizing" unreachable code is crazy. And the notion
> of thinking that "UD means unreachable" is so incredibly insane that
> any compiler person that thinks it is reasonable should have his head
> examined.

I tend to agree that generating bad code in the face of UB is bad;
there was another, unrelated, instance where Clang silently generated
bad code with UB.

The problem borders on the philosophical. But I believe the argument
is roughly "generating 'good' code in the face of UB is a never-ending
game of Wack-A-Mole(tm), where we don't actually know what the correct
outcome should be." ("Correct" implying that the compiler could
somehow divine what the programmer was hoping for, or at least get
close to it, but it's not possible.) This situation is one of the
easier ones: "do something other than fall into the next function";
but there are far more involved examples, of course. And even in this
case, the compiler needs to know if a "trap" is okay, or would
returning with garbage in %rax be okay.

-bw
