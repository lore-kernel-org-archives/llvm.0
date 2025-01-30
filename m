Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAC41E9B15
	for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247936; cv=none; b=QZgeMnCsK2XBkNFxyqDGhp06dJAtiXe70WbHY3PjETuzDD5T9f5tGKsPzCtudKb4rHuLJZXGNLhUsxI0tDbuj3xos5F85vfgptNDFrd0oY3AF9UE7a6lBcqvOmszCD8VViT0vuWdUNybiEqRTmhzfz8vJy4Y2+Atr+Dbv4OvYXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247936; c=relaxed/simple;
	bh=ndA1DqYJeLDgwxI0sFTIswtI2TRbJRaDwStsY7tYaU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeMVOen6efJbKSqgx0Y19j2RvmYnGE9sjQzgbUgSJS8Qcw+uEV7Wv30doM3iUF5Ajx2sWxdZ1MhgZWE1InqYHL0R4cg8sE3l4VMAy4YcM3ps/Eo3oVD+SJtm6tL8UZ6G89hc2gNDjN6JBpt6nZJg030QyD57sg27U8H5vJUMG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4aff1c57377so481925137.0
        for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 06:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247932; x=1738852732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3koQwFtsYEj+sBiSRxwOt8Kdl4P9BIA497a/eImNeSg=;
        b=SpoTh71o7OudY1ns192mCOeRzdJrWNRHldS6h8gyEfxXZBNsWpwo+tXuMHF3GpSM3C
         g9jwUm9oDsIUAH8zdw6hyZRShU0iEvRS6vR0XASr+HBIgSoAPz7vhQ5L9aRKzMSlGA7z
         FMXFGTs94rACi2HgS948fE66nqrKbmJxmFsGWVO0hCS1RCRgh3/o/qMUoB15YF1pNmZs
         qLRaKOYtvrI1Gpsj3IbvhtnJGv7y2oS7r5fLg6xBhsWHrnLyIHGkdOU5siTT5ciL+xGY
         4wldY9UlF0z7a2Fvh1fXO2uD9lB8lRLNckxWS2ewhF7gpmc15wDg88ys9h+bC8IrLH5W
         LgMw==
X-Forwarded-Encrypted: i=1; AJvYcCUlJKRW0Ri6I3/HcyjsBPfZmSFzCEYdruwgPf+Ys4WlBlNqHyiMKBHZNcED3JOgP2o70YCh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5xQGPzVEoFgYiFh+yt/Vi6AlqdGGwtxNJnEB2Ud0BW59hlnf2
	9O7No7FSiEz6e0SpbQnNCN0cYQjPlW05QFi8c44GwXuQRqSKmmZ7a7Wl1aLtPBk=
X-Gm-Gg: ASbGncsEgBBj7c+Zq4PH6jNCjYDcM+gDs2JVsiBbDHuCDFMW5hWBld2LC3AM8DSc5XW
	oMxiixUWB1TKpYlinZ6SUtgMUHul7SOoXYHeglNY2CkGj1t3pYEw0yxBGGpXwGPK1r3DW7hqR70
	wKfrRj1p34zPll32urXrcFtr+/OSRcwEDXIMxwhlgJaN0drU2smXRwVuE4mxTYKxVbQ0RCDTKu5
	9VnIHsjUyNP+ODm9OAPULDMAXqiNQpvaZsyikqx6JfLw67LCNnvMzylb2XEyC7UL2DeEsI9BNOG
	Hpya7EhOnn1XvEZvZxPhZuq9olSW6yiCtt5DvTjlnwnYVvbQlmFq9A==
X-Google-Smtp-Source: AGHT+IHPlAjoprGfTi/01uvXYBfp4LmZAWqv/08jYcs5wiJJg+egii7oodITxRilg2TLRJHofVfsSQ==
X-Received: by 2002:a05:6102:442a:b0:4b5:c302:37b3 with SMTP id ada2fe7eead31-4b9b7187ff0mr3171759137.5.1738247932323;
        Thu, 30 Jan 2025 06:38:52 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9bad67a17sm254806137.30.2025.01.30.06.38.49
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:38:49 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4aff1c57377so481862137.0
        for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 06:38:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKpooMe6Is3kg2nsMN63pFS6ziq8lcSGkI6MXVjxPzeJ1gmF6SQRsZQ7Yj/feE5soZwpT0@lists.linux.dev
X-Received: by 2002:a67:f318:0:b0:4af:d48d:5142 with SMTP id
 ada2fe7eead31-4b9b70f3a0bmr2755704137.3.1738247929070; Thu, 30 Jan 2025
 06:38:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com> <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
In-Reply-To: <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 15:38:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
X-Gm-Features: AWEUYZmOwEzWB0gEceqhOwmudbYpt2s9uwC-1Re-pPG58BUZxS-FmbWZ_JWw55Q
Message-ID: <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Thu, 30 Jan 2025 at 15:09, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> Having written a ton of test code, I've unfortunately encountered a lot of
> this sort of push-back and it's HUGELY off-putting. Writing test code
> should be ENCOURAGED not litigated against.

I am not discouraging nor pushing back on any testing code (on the
contrary, I test every single new kunit test that appears upstream).
My apologies if I gave the impression.

> The truth is far too little kernel code is tested to any degree, and this
> is part of why.
>
> On kunit collaboration, I attended an in-person talk at LPC on kunit
> userland testing where it was broadly agreed that at this point in time,
> the xarray/radix tree tests weren't really suited to the framework.
>
> Therefore I think the healthy means of pushing forward with integration is
> in sensible discussion and if patches, RFC patches in collaboration with
> authors.

Good.

> The unhealthy approach is to needle one of the biggest contributors to core
> test code in the kernel on a thread because you don't seem to want to cd to
> a directory and run make.

My initial issue was that I could not find out where that is documented.

    $ make help
    ...
    Userspace tools targets:
      use "make tools/help"
      or  "cd tools; make help"

    $ make tools/help
    Possible targets:
    ...
    You can do:
      ...
      $ make tools/all

      builds all tools.

But that command does not build tools/testing/radix-tree, so I was
completely lost.

> Why is this relevant to me? I am the author of the VMA test suite, on which
> I spent countless hours + relied heavily on Liam's work to do so, and
> equally there you have to cd to a directory and run make.

Thanks for your work!  One suggestion for improvement: tools/testing/vma
does not seem to be built by "make tools/all" either.

> But at the same time in both cases, testability of key internal components
> is ENORMOUSLY improved and allows for REALLY exciting possibilities in test
> coverage, really isolating functions for unit testing, enormously fast
> iteration speed, etc. etc.
>
> I ask you to weigh up the desire to enumerate your misgivings about the
> testing approach used here vs. all of the above.

I repeat: I am not against these tests.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
