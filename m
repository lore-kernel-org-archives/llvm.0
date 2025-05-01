Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BA2265607
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 23:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142697; cv=none; b=JmGEoC3URsHviAG3WLlB9Sf7fCNEPriQ9aIzyqoucuMe+0osLQu5/Y5bnwmNyeLAqryQF4tcrSakQDEAsj/ZzZVkDVisSUz5/L24Gxlo0B4yIfhXgqJOMjfm46kAJNCd9OMhflHASfqMGpEvgV71RTSyUnSyGjvo5w5C+lU/kgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142697; c=relaxed/simple;
	bh=0bE9+sg8qqZlZPymEWPsuaZnLc6tICoEgjFXMIsxwYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hee+x0B0x4w+ZZtRT2sC1ntXEdOzZBhTRaNhnRdd03YhOtWE0iDam0z4MfcsmVRjsGHEVV3cdKKcjSWwBBBINvP2V95Hh+QhaC1o6C2SEMhXjLEd0WVMy5Wv+jLSysDnrtxslltb9hzAq85NQ1nGhPZODi5a9xdNTjuSREm04m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cWOnesyZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cWOnesyZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso222474266b.1
        for <llvm@lists.linux.dev>; Thu, 01 May 2025 16:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746142693; x=1746747493; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gOH+RLxLUbard4BV8J+6a/3tBBv1bO45LVfQDoB6LRw=;
        b=cWOnesyZoMqUuZsL1ozWk9M8xfZmyhLodSsV8MB4f0SVgTkbFAKtycUu/cJUoClakK
         26mWBiOe2e+KNkND/3Rv4KJbl2Oj76jvgMw2JQk2bhyLgZbQou7yMkuEAfGtmvSm1Cwt
         G+HpLENrZhC6IW7+d45uheH26Ua8Mzb4Y6Aek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142693; x=1746747493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOH+RLxLUbard4BV8J+6a/3tBBv1bO45LVfQDoB6LRw=;
        b=c+xtus+xpLV2w22hXx5/XVSebZg589CJIUyRTEvh98W3L19WSrrSmbFZx4mGAT28qD
         4O59KRo3esZpaD3gKvWASqR9JEPfm+agMQ+gKw8xj+TzoNqwhwC6Rm4L8xi7c0nOkE7Y
         x2fXuEgrP8/QVK/SEqL4LGYvHeh+cgLrW4iprND45pwviNrLCAB6yR4yWn3vlgZ7Dkqf
         tuO/Af0jYOQ0OaCAeWPPyHSrqW1B3CwLpwkLveX/Di3mG1fLUqC7Gu5OPuSRZQpIX6vd
         CQqQtOUdxtx2q419QyASTBsrzRI2G+gTwykB7x//LebQ7g2jVyZD/le2iSA2jB2wIaVE
         hq2g==
X-Forwarded-Encrypted: i=1; AJvYcCUryKUXRGknUOrZEveALHirDK5GdsjB311WZEvdSgyJ9G2FPJSQ40g8W1srhG8WUrglUD2X@lists.linux.dev
X-Gm-Message-State: AOJu0YzLgM6Mo53iPgK0KONtxjA/RuqwQxRmJT0zZxPXcAMhZclKmOeM
	HVWmxSpOSOzGRA8Mvxa0hCLbZRhQe4JJnmJ7F2h80vQfKS0/TispT6VAztp8e+DdGJO354ZdlJb
	eH00=
X-Gm-Gg: ASbGncsIvsalyAEmo0a4GUJW87Yy6NOjlXmOddZw8Jjsy8Lrlcw/vMzuA5KBcAsI+iv
	pQi+hLmWTNUV3vuW8nY9b2myFYRV/TEwxOlR7qyQfN/ym4hXSQ/ZoGE7NlfSZRpKLDsc8S62yGR
	dFOEoTFfndUPADlFSe8iPgg35MuSID7OXQYAARGCM1k5MYYI9gQVb3ePaX4vCid/ZEFqHvVjgCs
	h3MCsdz3diLkeK9UaJXU91Ka0/pen5KCUlcCG0RJGqaATaNYF+jFs+3x09HYkQ4O/fHtUjVtmZV
	+6RTN3BeSZ1rOwFz/EP1AhcZSlP5tHRjyN8dyNj/VG/UhuUbdz3GZquAX/HfzRiM9RDZ3GBEMdG
	n8TcwY3SWbc9NJaNwfbMwsPLMeQ==
X-Google-Smtp-Source: AGHT+IEw/8GBGUMUKMk/QJ+WexEseOQBFNcDX7NzcFepe6/DHRKQQj39QHZb3ybMwRovUHxJktAMLQ==
X-Received: by 2002:a17:907:9718:b0:ac7:f00d:52ec with SMTP id a640c23a62f3a-ad17b00da23mr87995466b.58.1746142692847;
        Thu, 01 May 2025 16:38:12 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55b0f0sm109385566b.150.2025.05.01.16.38.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:38:11 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso308185966b.0
        for <llvm@lists.linux.dev>; Thu, 01 May 2025 16:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEA08IgtTG4+p5Ad97NHbxx5A1HRy7E0FnvORWDjx6Ks/bua9AQMYBxB/BZahQkjzsOymr@lists.linux.dev
X-Received: by 2002:a17:907:3c92:b0:ace:c225:c723 with SMTP id
 a640c23a62f3a-ad17ad1a245mr90568166b.12.1746142690891; Thu, 01 May 2025
 16:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org> <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
In-Reply-To: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 May 2025 16:37:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikfj_JLqDQCc+AsymUije3Sm8h30zQeT4yieqRicFOzg@mail.gmail.com>
X-Gm-Features: ATxdqUFyafpfCSgNRMdjOdlgLHXvb-kQiDBd8FWFkiq24cJvTKf1aNAAYT-juyY
Message-ID: <CAHk-=wikfj_JLqDQCc+AsymUije3Sm8h30zQeT4yieqRicFOzg@mail.gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 16:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> How long has that been valid? Because this is certainly new to the
> kernel, and sparse does complain about this initializer.

Sparse is clearly wrong.

I went back to my old K&R book, and the "perhaps in braces" languager
is there in that original (ok, so I only have the "newer" ANSI version
of K&R, so I'm not checking the _original_ original).

I guess we might as well ignore the sparse problem, since sparse ends
up having issues with so many other newer things we're doing, and we
don't have anybody maintaining it.

             Linus
