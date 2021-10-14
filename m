Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B472
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 18:41:57 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id p68so4933307iof.6
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2vuxshsfHtLjbAbft8l5pvgP1W0cVnLR0zLA69xmTOI=;
        b=by5P0yKP3zQWYD4728dibXaqmBM8xi7P6Mh5FmkBcWyhEogUgg3ItaH0WQ0Qw2i9X9
         dX2vSCt/eV8t7U7kdbOsrilLeR5jPfMK4cXhDSldk/xKIYMprJl64WDCTcthiMj53MeO
         HEay/Ca4RKv1VMcySvZT6Cov24skCbyF0UbBFyiHBxOUTBtmS3E5XJ5BZ0PS86gAEI5s
         4f20fg41QbPOO5m+72cYY/MASLDKq9xL6A7E9IqVZJxsrCCwGpgLg+cODdGKzc1Q7JO9
         +xYtCR4mqOMR/KCC7VuQC/L8JpT161BEozi+EE5A9miJbtgyh/6Pm4xaYisszNyPzSE9
         A46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2vuxshsfHtLjbAbft8l5pvgP1W0cVnLR0zLA69xmTOI=;
        b=oD4ipZ8kiKWBYM/pIkblhlKGGuP7TwD7dQyyi4/NN6yWeyFzgddmDCkO+7eMvOLNIb
         C6/RzQ70mJHxWP9zZfGQnKoaw8jAjMqWI1l62fTBrPDq2Cz+q4sCWHriNK/ongeUzl0M
         MMq1F4K7ebGjD0xXjdMsiWUIbjix8C0bMh1lVcf+cRvwUSSK5DNXm1e3WWBymsle5ueX
         uTqWfua0oIZsmFraGSzg+R452QR36oktiGbb7Zj1NWkwtOyl9WOt6SWycsidG/UWqr2N
         L5cjly+pJEGMROCZiQV3qzDXIZ+QxHk4j/7bdC6SHjziz0qNEBW5GpswxjQKIwoQCRFY
         4gAA==
X-Gm-Message-State: AOAM532rp67DKcVkM4JUSJfq1Qj7TUmX522bEsAGrw0Ho1He6VHPMcLm
	OYKz1PEjCCcIOdsuGkrjfcI/tQYcWjNmGetftQo=
X-Google-Smtp-Source: ABdhPJyLH2m3/G7uDqEmFfQiWoOEDf5lKmHYdpJ4vcqrnZL1K6nfo47X4ijAvGPq/rWWwBuh1AZEIypxE/oxExsVHqA=
X-Received: by 2002:a5d:9d56:: with SMTP id k22mr454360iok.177.1634236916655;
 Thu, 14 Oct 2021 11:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014132331.GA4811@kernel.org> <YWhGQLHnA9BIVBpr@hirez.programming.kicks-ass.net>
 <CAKwvOdnkDUfRKzmLThQGW02Ew6x=KM0MQyHge7=kc673NYxo2g@mail.gmail.com> <CANiq72nt+8bCGAm8yhvTZfS64ovOi9_U=Gym7biUhdEsc3Neaw@mail.gmail.com>
In-Reply-To: <CANiq72nt+8bCGAm8yhvTZfS64ovOi9_U=Gym7biUhdEsc3Neaw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Oct 2021 20:41:45 +0200
Message-ID: <CANiq72=UVCmjr1tpSwcoOkid5tWZirKCnV17_Peqy-LBmEQHEg@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: mark __compiletime_assert failure as __noreturn
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 8:33 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> That would be a nice to do, but I am not sure about introducing one
> more macro about this... I think it would be simpler to submit patches
> for moves into `static_assert` even if we have to "flip" the meaning.

Actually, what would be ideal is a compiler-backed lint that checks
whether it could be an `static_assert`, perhaps in clang-tidy?

It would also ensure things are kept clean.

Cheers,
Miguel
