Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331FE3CAE89
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872288; cv=none; b=ATgA8btWy2zfT1RQZG8NXxjW8YwOq4aU4IGEihKVnvPLPbXvzws5T116BZNH+Wd23JsfbqPAcX/ptJcXt9dpm49rzQFXdCHM8w/pYA4WsvvqI17RmjSAFfdc4tgcPhKlhDmbgF9CfYWlwcsIevFr3pawM2GdFaSPnKRi0Gjk3gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872288; c=relaxed/simple;
	bh=uPLmde8JX94NOim8jdD8HXIjLFjFh2qnfPsVO0hzcyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAdx69Wj8m7XdODwtHZjJ9ubtfwQBZcZkfj+6N0wAijM9A4OZ4XpiQQ8juLpOvpUhDrlr05uIAppBMyJ5Tg6xAn/TbnjjDak+1cHT2lAALdYp7Kz6XIwQ8Ekl06d1vtQ4NVDILklMEZMNVr+00cEiIyhmSBUGZIUepmrnraGELo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-953a2634777so523339241.3
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 05:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872286; x=1775477086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7JyzGDh2V9hD5ppCKHdE8lqc25UY6zaRA17P+pQPiE=;
        b=oPyk+Q4cGxy1LVkKAAWulB8FQZVb+cA0ggKtI06vPcDtqJqSYtnY/pe0Qu4e19LTX8
         2w7d97OqhHk6rCjfP++ktjbtGrM5+g4YO/gwlj/uv8/42YrM7s6K6KZH4ma/JzshADwE
         9r13lb5L0TFRK//l6yWeQwucTGPj9+k+Hfx7wxeEPOuBnnavAOIFtb2Fr0Hmm5KjUem+
         pbtimoB3B/3P3TecfIQwwonTdGyjwESZ5E1qH+NV+v+z7i2XUsMhxYqj8E7gUcY3R58H
         n509/WzaA1P690/fEDHGXJKQdAJEtHlXqk4gqCIrH8C2TLGDkWC2gegxJ0ZAg9b91qQP
         rVgg==
X-Forwarded-Encrypted: i=1; AJvYcCWlOphrJP9cp9HQU0R58OzTnLi163pF3XQxg/omRShSfCuoxTummc0jvF2tfROOypZgYsW2@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/hj2AYT4MLczaIOfI8sV1IJuvZhGFmyjIsrkZhhB6+0eLWo43
	e+QD+Y3MMs7kee7Cc9SQn4eHfevvyrDpWw78D/4IQJlKOddmgFAzi15x+R5gXEJy
X-Gm-Gg: ATEYQzyiLGr8cHfSzN+0qWx/0vyiThd9KgUTjaTE/EUsQcsPJafcI+eDKQuYMpxvdgP
	JjadsG08uTnGAHSuvy2d12i3zLfDOvctdlICY738rDohPScfWE2e37U9sL7U3drwviwL3srt1dK
	YrOGZHYBeXvZ9XxQ6npetPIst29S/6mIDTlFGhnPjBHhbB3hNSLGplZnn+ewon4SPKWLm4nZBJR
	I6QvVmc6mqOXfYDdikXkiemRa3VcnbP75v3AbwFS30QpcXfbMrYTG13BjlMMVt/xGN1opoG6aq/
	ob+SuclpwkxTU97uiMMWOcOTTQWxO1bYoIT5X2T7MXZFwL7Vdrmr9XoFEMUKpeEDFRlASFV2pW5
	teOWkp0yt3EaaeK0qQB1jCXkwuAwQ7Fs7OUia6yAFgjDW/WzsEhrjTqO6RSJrgwKT4YnOq+tBM5
	fZQfrdR6UanSBxJDxqt1uVguLo8FYX/bth+eStbPklerP1GBbnfkFNHpBB8w7COS5AhrzFIRU=
X-Received: by 2002:a05:6122:3a0c:b0:559:5dbe:fe29 with SMTP id 71dfb90a1353d-56d4a4ca0camr4667041e0c.2.1774872219860;
        Mon, 30 Mar 2026 05:03:39 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a33bf3sm8116766e0c.14.2026.03.30.05.03.36
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:03:37 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so1356561241.0
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 05:03:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuLCcHcevAuDAdPZvLqpLnNucmLS84vZbZjKDzNCxz88wTIt2jGeXDs/D3EB0B7NNoCwGi@lists.linux.dev
X-Received: by 2002:a05:6122:1824:b0:56a:e46f:2cfa with SMTP id
 71dfb90a1353d-56d4a5f2e5cmr4217124e0c.12.1774872216490; Mon, 30 Mar 2026
 05:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com> <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
In-Reply-To: <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:03:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
X-Gm-Features: AQROBzBixIQPiuCOL0pIFbgyC_M26WMZwTpKOw623Sg5KUyDyMzQqEZKs9RSoco
Message-ID: <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
	Gary Guo <gary@garyguo.net>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 27 Mar 2026 at 10:02, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Mar 27, 2026, at 08:56, Geert Uytterhoeven wrote:
> >> I noticed a similar issue with m68k-linux, which has a bitfield
> >> alignment different from anything else on gcc, but uses the normal
> >> behavior on clang.
> >
> > Ugh, I wasn't aware of that. Adrian, did you know?
>
> To clarify, this illustrates what I mean here:
>
> echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-
>
> this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
> thought this was related to this 2009 change in both compilers

Oh, now I remember.  AFAIK (holding wood and a rabbit leg) we don't
have any bitfield members spanning multiple base type instances in
the kernel.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
