Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B780127A100
	for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868891; cv=none; b=M20QlyOvc1NFdFvEuCfxD8hhXUrL4R7HTD//N5J0G10EDvAaFMlTIVLrUZ94BZnp1njIbbf8wcyaSzzZSyTMq4NzgBv+ZTV3wMJ0MYBEGg5iz+3CUYwCvcJLRJ3+3FX1IIA21f5YOCnOxUQYX51eQ0GY5Es85ZhXOUKsB1XGhqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868891; c=relaxed/simple;
	bh=W/B8TYHnPhSF2zk1/LG3xB6VoRWSRltA13pjtEMPg1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNiesroYNFRfw5I8mQx3RCH8y4Z+PwGr5fMQGRVosrgIjsmT2D1ediplaNv3dvPhe5ZIlW8H74/Mpci/544IbOHA4OzM+R8JgB5QHHBu/5UZx5AXxnAkXDjQ1jQumbGVIJwKiF+Pue2LrndBkH1nFHAuwewbEUNwapDbnciSROI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SR4FKeIf; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SR4FKeIf"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso8373281a12.1
        for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745868887; x=1746473687; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9fgYACCYEdV70Eqrp9KBhgN5b4Wv2A7Z2XX6in9YmNk=;
        b=SR4FKeIftPm7WW199UfkNS0e+/+A8SPdORD17Ow64jb/LEndRLlPK0WRFQmwKf2aed
         fABaSEchu+nARVwqq6pJ0Y00xsxUwwojH9WQV49qGPexxDB+m+FKOSGP2F34uTlnkuPN
         8kwbAtLRZiTOyslKM3uPiE9qIOOe2h9CAW35I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745868887; x=1746473687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fgYACCYEdV70Eqrp9KBhgN5b4Wv2A7Z2XX6in9YmNk=;
        b=Td+HREPVryPP9wWptFqENLK6Q6t1YaAY8JTEpeFnzBbvCvbORRrbXB/JKJX+I0uQNQ
         G2zJUoZmEPi2ebjd0mVuRDGqWsIbzLZpOOW9p7Gt9W/kVYHL+m3VMIGiJGCeCp49Uoub
         TUFrspi9EmpmyVLIy2A94rsYW4CGszMMmPIRnF9clGF6+Dj5xVZDFUnbK3nNPApBbFXu
         juK4G9laZGT0RPyRZ2K+LyTLVNJG4fkLi2WVbda+7Pfhoknh608I85g7qdfXbxKq7nUa
         9QaaSDr3yLtYKDk8WDF0SbGuCORb+9wSioYhwlz0bUFmGx3J56NwsOiqwqyUWrw3lk2x
         8eEg==
X-Forwarded-Encrypted: i=1; AJvYcCWcyX94yHTyUX/xejiJgStaNmwR0nw70BEYVDIrSS7sRVOc+r5K2vF30nKyTBEwCdlxRuz9@lists.linux.dev
X-Gm-Message-State: AOJu0YzZQBB54tzv+wt1DdZA+ExKheaBXhlf7Lyipv/2TBV8Jou2oSCI
	0lqm8mEczAQYe8ZYbRQfixlRHe66L4vEFXcwiJT5u90C8NrYEgJS5g8iJ33irWx4/5RkZDwo3iY
	zw+KL1w==
X-Gm-Gg: ASbGncsWRQXSSZ9imiQO0I93v8DIgZQVz3fN/2Xfljmd4PIpN5yZ9NACVDp6BvzfK9d
	tUCGGWnTfAi9/1855fF4GIrjohQI+qpbr5YAxjMbAAh+uEJg3WELNT7vRVbrUpv12atj+An8dTm
	G+1hJwEKl7+DhOOF6+6KTRwgQqvNu7E9t9S6XsnYQpmWBOgWZzTDP0t2o8rOhTRLleSDscDuD1J
	YrqarUMbo0BRgPr1X+NJsKS3ZNUkxyEw54Q2Iucd4q6h3xU1jNW8geijQ7D8Dx4DeKza6AU3/0Y
	e4tf7XWDiOvhFjTAdDvknjnDXAqMffqMADxn+AgIXC7EdWdtMlnEPl2qJoxXnQLY1hkPMmNlkXI
	0fp3+PA+/EethP40=
X-Google-Smtp-Source: AGHT+IFWVLd2xilH03MTuSsBTqrwjTodb/kIFbKNlpa4RC1vSGkQxZZdAP9IYCQFcU5a/JD5RgekAg==
X-Received: by 2002:a05:6402:13c2:b0:5f4:d22e:28b9 with SMTP id 4fb4d7f45d1cf-5f83adca85cmr162180a12.3.1745868886682;
        Mon, 28 Apr 2025 12:34:46 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec585fc8sm2716820a12.54.2025.04.28.12.34.45
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:34:45 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac345bd8e13so727196166b.0
        for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 12:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2URrE9HQrenQwEpQxULuhkhcroc65pgMhfj5hXyTpuhmTaa+qHh4JrdM0ZMipfZbyI2P1@lists.linux.dev
X-Received: by 2002:a17:907:86a1:b0:ace:5207:e2ec with SMTP id
 a640c23a62f3a-acec84b84bbmr8545366b.4.1745868885415; Mon, 28 Apr 2025
 12:34:45 -0700 (PDT)
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
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
In-Reply-To: <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 12:34:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
X-Gm-Features: ATxdqUFMKb4hr1dAUfVb_bErfkkOWxj_7W2ubNDIidp8Hnky6iOrTQdD_4CxoZ8
Message-ID: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Bill Wendling <morbo@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 11:08, Bill Wendling <morbo@google.com> wrote:
>
> This situation is one of the
> easier ones: "do something other than fall into the next function";

Note that the "fall into the next function" is just something that
objtool notices. It *could* be "fall into the next basic block of the
same function, and objtool wouldn't warn, because objtool generally
wouldn't notice (there could be other things that make objtool notice,
of course - things like stack updates being out of whack or similar).

But I really wish that clang would look at a "don't depend on UD as a
code generation model AT ALL" as a flag.

The whole "this is undefined, so I'll generate something different"
model is just wrong.

That said, there are certainly graduations of wrong:

> but there are far more involved examples, of course. And even in this
> case, the compiler needs to know if a "trap" is okay, or would
> returning with garbage in %rax be okay.

Honestly, the least wrong thing is to just NOT HAVE THE CHECK FOR ZERO AT ALL.

IOW, just generate the divide instruction.

I can almost guarantee that that will actually then generate the best
code too, because you'll probably just end up sharing the divide
instruction will all the *normal* cases.

So the best model is to literally remove that pointless and stupid "is
this a divide by zero" code. It's pointless and stupid because it
literally just makes for more work both for the compiler AND it
generates worse code.

Why do extra work to generate worse code?

Btu if some religious nutcase decides that "I will not generate divide
instructions if I know the divisor is zero" is a hill they will die
on, generating a "trap" instruction is certainly not inexcusable.

Generating a random value for %eax is WRONG. Now, that said, it's
clearly less wrong than falling through to some unrelated code
entirely, so it would be an improvement on the *current* situation,
but that's like saying that getting shot in the foot is an improvement
on getting shot in the head: true, but if the alternative is not
getting shot at all, why is that "less bad" alternative even on the
table?

The "just execute random code" is clearly so bad that it *should* be
off the table in the first place, and I don't understand why it is
what clang does now. It's just crazy.

And yes, this really is a very potential and real security issue. In
the kernel I don't think we have this ever happening, partly because a
lot of configurations use gcc which afaik doesn't have this particular
horrendous model of UD.

But this isn't just a kernel issue, it's a "anybody using clang to
build any program that might have security issues would be *insane* to
think this is a good model for dealing with UD". We do more checking
than most on the code generation, so we actually had tools that
noticed this odd code generaton. I can guarantee you that 99% of all
projects out there would never have even noticed.

And who knows what cases we *don't* find.

And obviously hopefully UD doesn't actually happen. But that's like
saying "hopefully we have no bugs". It's not reality.

Using UD to change code generation really is a truly horrendously bad
idea in the first place, but doing it in anything where security might
matter takes "bad idea" to "just don't do this".

                 Linus
