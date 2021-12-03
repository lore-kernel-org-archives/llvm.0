Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CD029CA
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 23:45:43 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so5394860otl.8
        for <llvm@lists.linux.dev>; Fri, 03 Dec 2021 15:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=60reH7R0DIOnYiDzjJxXKxDAKSmQYMrrZWuqMItQwS0=;
        b=lwLR59toSKg0d3DkxASJYGkZ8L16glxKUaDTTvF+88eWEDzjr4kjtxvRl33PVBnKDD
         htg85jvk5miIto3O0oC10nexmnVRUMkm0LPTObzhAaHdC9pSe7CF2JCNF75x/WGIkOG3
         PM1RuTN6Nhu5/g4qGlmgmqHRM2UZSR8UXi8+g/rcskGP7alvFuGEMFDeGahQ1pLEjsrX
         Z6EFmUfQjhtG/4rRPSVC1kWoUh+nSdz2aRIUoHXdKW8VYEFiDZIrfgmJAN7aC4i78hhh
         MVVhyQh/Hs2vmX+fTK9085aBpBW56vEUhxfheI0Ytpw8QrKAGkDBvIXT/x3LUmzXzWvU
         D5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60reH7R0DIOnYiDzjJxXKxDAKSmQYMrrZWuqMItQwS0=;
        b=UQ/3auXXssdqv80Rrs9eQoGZOcxjs+zmtIVokwZGNIuDZyVCTeEJGAqveoXEHPkCDW
         EhNA+lETyhTlBSY+OPa2/1UgngkmPSkxMXNhw1iZI+MBb+et+wMx049eXCepG7+w+N8d
         rKlkm5C+HBhrbpKaNvF2SbDB8+MymzedAJs9gCKG4dLAeEGKwD/47TTeLKnrItiMDq+2
         DwYcXJUKeEjxCfJK2vL4xpmkAbiXYFkndzy07tXmiLjYpV03EUoRk1UDTE2LAJNpyOQ8
         YhdQTVVtwz2va6lAXnW/EHUojRLSe3eN4SmnvyEswBz2G6c3sfpBXLjRtw/s04V/1CEI
         uK3g==
X-Gm-Message-State: AOAM531ynJ7vXcUItR4U2Cy86xC3USX+vZYuWP1tUNzfVDniVxguObMv
	5ZFyfW6dPWMA9SdftI20hWIMgdaGQ5OsyVx0oDwEww==
X-Google-Smtp-Source: ABdhPJwprIsuAE81kQhNwY2u7JUyLZ0Gf1lKN54zx/jf0D8m6dhbAAqy4FkFq551WfGByrnkVKj8Umhm/PE2NQckFns=
X-Received: by 2002:a9d:77d1:: with SMTP id w17mr18546120otl.329.1638575142007;
 Fri, 03 Dec 2021 15:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com> <20211130114433.2580590-5-elver@google.com>
 <YanbzWyhR0LwdinE@elver.google.com> <20211203165020.GR641268@paulmck-ThinkPad-P17-Gen-1>
 <20211203210856.GA712591@paulmck-ThinkPad-P17-Gen-1> <20211203234218.GA3308268@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211203234218.GA3308268@paulmck-ThinkPad-P17-Gen-1>
From: Marco Elver <elver@google.com>
Date: Sat, 4 Dec 2021 00:45:30 +0100
Message-ID: <CANpmjNNUinNdBBOVbAgQQYCJVftgUfQQZyPSchWhyVRyjWpedA@mail.gmail.com>
Subject: Re: [PATCH v3 04/25] kcsan: Add core support for a subset of weak
 memory modeling
To: paulmck@kernel.org
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Dec 2021 at 00:42, Paul E. McKenney <paulmck@kernel.org> wrote:
[...]
> And to further extend this bug report, the following patch suppresses
> the error.
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit d157b802f05bd12cf40bef7a73ca6914b85c865e
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Fri Dec 3 15:35:29 2021 -0800
>
>     kcsan: selftest: Move test spinlock to static global

Indeed, that will fix the selftest. The kcsan_test has the same
problem (+1 extra problem).

We raced sending the fix. :-)
I hope this patch works for you:
https://lkml.kernel.org/r/20211203233817.2815340-1-elver@google.com

Thanks,
-- Marco
