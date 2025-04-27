Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A11F463C
	for <llvm@lists.linux.dev>; Sun, 27 Apr 2025 00:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745713889; cv=none; b=I8ZwzsREWSZ23NzPePuwLd5ARTjXcFD0ClwGaksq7tnsbV5dqll1mbsQGJw8ScRBl/pqryFx/xlIS77vIjb7jdbzRpQFT+1WhK7yVgTz/tAAtfKG6yrAqNVoWMt4sKSZ9NAX3klxet/3tPYt1NqPREUsZLnOOePqBPXZABAtCjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745713889; c=relaxed/simple;
	bh=AgzPwiGXLA6nx0hLzoXimLP2/tpD66FvISS4pbCQCr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFvyvJcNhwrfY/5q1XmYARYM6Uas3V7SVwzZ/wjijMNapZxeyXyohMJaqejc37vVfZW0sb8pxaMNWo0cIsAuc2k/v6etNWGCMgZsA6cOcIxqb1YokCybXNpe4JeFgQQDyDKM8JX1M11hBFmflGDyhria/OGTjm+WEvuU7HEmymI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Slp9HZwZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Slp9HZwZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb39c45b4eso553832666b.1
        for <llvm@lists.linux.dev>; Sat, 26 Apr 2025 17:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745713885; x=1746318685; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kFnF6XQXyjuHCzFQmPZ6cMo/XgSLXx5JlYecXTeUa1Y=;
        b=Slp9HZwZgAuV9X18CR+Tqbjl+wAP9xq4nz5nK0v06B3YGL1pFW7T60PBCvshb1r/d9
         Gee0YsoNCz3Qu4auoYFotA2H7PXCtVID6lWPXnlIBWPN3olk5AqJ7jIRtxJXCS4EgUZ+
         EbLC/ntjvs5d3rXk5ix1C+txVNpobsUVlIHOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745713885; x=1746318685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFnF6XQXyjuHCzFQmPZ6cMo/XgSLXx5JlYecXTeUa1Y=;
        b=Rmf2Bsjck4bQbju5IjgH6x7RBi7XehjTCLS/urXV1cMeSrSkeAYhGRgnUbyXt2pofd
         S3pFnsWB59fOZC5Mch6LqNAC4V08nUBI87+wAXgrLEi4DGOxESTTl+rJg2QSM4iBrcT9
         pJpTFe7OC7l4EJjZ/I+JEFvPVCgRiodILSPbjAHbgWnqoN/J5Q9O4d9so2Ch0RrzH+6c
         RCBONESyhWOmZkCY7BOkL1IE4KJV6s8tc0XT8Q/a3kmlcLr0UITsbl3wtkKyK21vgGSu
         5hbrcTu9iGvnGYERWtrB89kEcf5NJ1JdnddInSYC8t+GU563NbVxT2+FUvvd8+4FYSLs
         HY9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9uAKJN360ZVJT4/ggBjfXBf9748De0or2joJrAxWppzRN/SjC9+pKwsedZ3YBb1E+yMpN@lists.linux.dev
X-Gm-Message-State: AOJu0YzDYZuJYZDBjisbkYvcHu1UeXuRI950fxtS4qJyogB4it0AeLzD
	kNVOOLcwPTY/fMSU8QQ0Z1cw4ialIYoiwV4ymqrlSQk2QW8O+td63U6N9FR3R1/QaQa//t19bvs
	LPX3X8Q==
X-Gm-Gg: ASbGncsa/ZsJ44UefRaPEBsVeioGtYtorfHHEsca2IR+dzyOfG1GwRwUlaZnKc5GSUQ
	IRbp+0VdtXeg6x4WafmEezYLt2MrMzdkDm/Iww2/GvJVsJ6W61vcx4HoreQEz6m/EkG0r/NeHEv
	fTNGN7A6os+6J9Af2aXiKqMOUVv74PdH2dlxTeY9wo8SO7GsGc7LDTKXYji7zzsNBRuQ+lRttCQ
	ObtSghN6uUZF/dzGscKDGBbcXYdsK8X7QGoSLh3QGiqMlPO+jjzMBCNBkmikTfcyztDf7LXmwrU
	Z9fdJSfIH4XH06ai4EI99EPX5uDrVbj0Bt9K+6/QJOo4Kzwsw/iG3tXFLq3zHXz6/oXqRznmTOP
	NcGPlwfHhJnYrfJQ=
X-Google-Smtp-Source: AGHT+IHlucD4qSfx415/aHjkeirH8S2AEKq5XcVmyYTyYfgje8V799zXAkpXOJJC7hKaaEg/tqFS/A==
X-Received: by 2002:a17:907:86a0:b0:acb:6eb9:b488 with SMTP id a640c23a62f3a-ace73b23752mr719694166b.41.1745713885046;
        Sat, 26 Apr 2025 17:31:25 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f8835sm367808666b.67.2025.04.26.17.31.22
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 17:31:24 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso6696151a12.2
        for <llvm@lists.linux.dev>; Sat, 26 Apr 2025 17:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCEuKeRry00C7RCdGXNs9+n1t/t5ajdeoWaPScoZwX1CRdTzfkm/Y6yYuISLUUneIAmXKF@lists.linux.dev
X-Received: by 2002:a17:907:944a:b0:ace:3a90:77 with SMTP id
 a640c23a62f3a-ace73b23775mr666667966b.48.1745713882190; Sat, 26 Apr 2025
 17:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162> <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
In-Reply-To: <20250426232344.GA1395819@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 17:31:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
X-Gm-Features: ATxdqUG4kycEbobY8t6qpPfU6v6hZ5LAqpyt3P0fzgjGlYoNIvpe5smXYXHg7i8
Message-ID: <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
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

On Sat, 26 Apr 2025 at 16:23, Nathan Chancellor <nathan@kernel.org> wrote:
>
>  Pardon my ignorance though, isn't something like this
> basically just '-fsanitize=undefined -fsanitize-trap=all'?

Sure. Except -fsanitize=undefined is a horrible horrible thing.

Why? Because it pointlessly adds code to *look* for undefined
behavior, which is only extra overhead.

I)OW, if we have a divide, just *DO THE DIVIDE*. Don't some extra
pointless code to "is the divisor zero, and trap if so".

Because dammit, that's what the divide instruction ALREADY DOES.

The whole concept of "use undefined C behavior to change code
generation" is complete and utter BS. It's wrong. It's stupid. And a
compiler shouldn't do it.

The argument for it is "once it's udnefined, I might as well optimize
it away". But in reality, that argument is pure garbage.

It's garbage for several reasons:

 - there's no real life optimization to have in practice. You aren't
actually improving code generation.

 - there are real and serious downsides in security, and this case is
an example of that very issue

 - the historical reason for most C undefined behavior DOES NOT
ACTUALLY EXIST ANY MORE.

Nick Desaulniers recently pointed me at a paper that is worth reading
by any compiler person:

   https://web.ist.utl.pt/nuno.lopes/pubs/ub-pldi25.pdf

which backs me up on that "UD optimizations aren't actually optimizing
anything" thing.

So please. Clang people need to get a clue. Yes, we care *deeply*
about performance in the kernel, but a C compiler that thinks that
using UD to generate "better" code is a disgrace and pure garbage.
Because security matters a whole lot too, and the downsides of turning
undefined behavior into random garbage are about a million times
bigger than the "I can remove one integer instruction for zero gain".

For the kerrnel, we want to disable absolutely all undefined behavior
crap ideas by the compiler. It's why we use -fwrapv and have for
years. It's why we disable the idiotic "strict alias" stuff that
should never have become part of C. And it's why I want that "turn UD
into unreachable" mindfart fixed.

The notion of "optimizing" unreachable code is crazy. And the notion
of thinking that "UD means unreachable" is so incredibly insane that
any compiler person that thinks it is reasonable should have his head
examined.

               Linus
