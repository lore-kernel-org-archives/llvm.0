Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507007A
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 01:28:05 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id q8so8576472iod.2
        for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 17:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZnbbEMt3jkmlYOE0bA6a7Tz/qzU0Syhvt4pmLzBwk+U=;
        b=RD+cBNsCKTgv1ZnZ1ww8dul+ibocM3XNMxPC3T5gBhIuZDqFh4/+kYvjgl+t3THB1t
         TNY0vlilXIORXYvymwZxQrrjSEK1wd4iJiCthynJiK1XwO21rxyqWtt4NZcR05feyV2n
         zFvQSxJsRzpiH2PfaXX410mFGoUH5iC6BS7r0YhEenMmvWUivRtYM5bBamYy/HJ4UfQf
         mLKAjuy7qOm5PbBJEnJV+fLywhchcsy2LndGiD5cvN6P9igs3Jc+hC3E7bO8/PdkZFGK
         Tm5PdGBeZ0zNFQ8NQgn4dY65bZy9Yq8Irbw8vHAUhXXnjcSAFaVjOaOFooFxtYNNcrVO
         7N1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZnbbEMt3jkmlYOE0bA6a7Tz/qzU0Syhvt4pmLzBwk+U=;
        b=hAwSiqVKzkdvD/eU93PMBuEsRqgN89cc2DKzoV0vE7OlwtTIQPRZ+rnaMQip6YHCO7
         ZBsONoOXLn9oTTKVz9lse1vh9pO6PtoH/Z/+Bgbq2r60O0Xfx7hKxNCHmMdx/dhWblJe
         dZOfhGH3sksZO3qTHyMKwI6n5qRKTNS4KIcjqc01xo8yaa7uhvpafY292fyq4pIR099G
         fhy5VYHqZ77Q4Ln6sRsmmHecXan3welEKoyCVdkL0uBGKJ8fNDMsIiuIZLD1QqMxmTPI
         3G4GYcmh+ZhktGBXADaUmlfgQJWMUqVnBNlt15VVS/Riotcpibpb2ciVhWGMBvlogsA0
         hhHA==
X-Gm-Message-State: AOAM533UBHJfipNX6GGcOFvzSZeEIaXxxT3yST0yt2tw2wusCY9wEzzQ
	i8RqXZ/oZmTC7m6YIBVRIysyXxjHyw3DPVtoIoI=
X-Google-Smtp-Source: ABdhPJwr8piYYKuKvOcgUuJp6nj91ylsWJvd8vpauApcGsvvimPOHYrtBAnaLmcM49B9zyvW3bEcZ47iiLi2OkJg/Kg=
X-Received: by 2002:a05:6602:2d90:b0:63d:b41e:e4e4 with SMTP id
 k16-20020a0566022d9000b0063db41ee4e4mr7393250iow.172.1645838884294; Fri, 25
 Feb 2022 17:28:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225032410.25622-1-ashimida@linux.alibaba.com>
 <CANiq72kXoonDYk095XvBwEtRCRNECd1iQOqJHE2cNcgLyUMfcQ@mail.gmail.com> <202202251258.DB0F403B@keescook>
In-Reply-To: <202202251258.DB0F403B@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 26 Feb 2022 02:27:53 +0100
Message-ID: <CANiq72=KjCd8pWKuXFzoW7oBQM9DV=DDyGzCyz62F4B+e5Q_qg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v2] AARCH64: Add gcc Shadow Call Stack support
To: Kees Cook <keescook@chromium.org>
Cc: Dan Li <ashimida@linux.alibaba.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Mark Rutland <mark.rutland@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Marco Elver <elver@google.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 25, 2022 at 9:59 PM Kees Cook <keescook@chromium.org> wrote:
>
> I thought about that too, but I think it's less simple due to the
> __has_feature vs CONFIG differences, etc:
> https://lore.kernel.org/lkml/202202251243.1E38256F9@keescook/
>
> But maybe __has_feature doesn't really matter here?

I have not tested it, but I was assuming the `CONFIG` could do its
job, since it comes from testing the compiler flag.

If the `__has_feature` is actually restricting it more than that, then
we should probably get the `CONFIG` fixed so that it only gets enabled
when really it is going to be used.

Cheers,
Miguel
