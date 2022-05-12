Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563F160
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 00:28:20 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id u23so6341022lfc.1
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 17:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c2ws23UBcUn/cg2bNLq1AZlNJZpHLdEd3cBqMWxwPHE=;
        b=ImISWlaf/fsowhzZ+LUJhuc8wWq73oxuQdC8Jg+B/b6IgYMhQ+3HwaaCLhndMaU1x7
         EuPSVxwcUYtxvoBKntk8Y2fvl4eouOdlxJiJMNqn8wY4VRZQ6OUOYpvY+t0N9xeqONMh
         KNJ+Tlr63HkniBbjUvrauMRJxeLp/M/HN/hyFZCgFxYcwFWXO7/GPoCvm166Eqg/xygR
         3o7vQxh9/hgWog03zMK4N+VacdMrpJ8oqnjmQS3Y+b5uuxIl806in1JBQRCIBenaKuV6
         lp7MArZYE5UiHGzCLgLeUxhVrq8O7wFXBKuvFuhER5KXbI1LYd5DY/gh+zzz3O7hVges
         0gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c2ws23UBcUn/cg2bNLq1AZlNJZpHLdEd3cBqMWxwPHE=;
        b=XremnsP4OFgYZoCN1iZ5gyFXPzejsVhPokUxHwxFTLDozPNyAroCd/7Juh1rxpmKCg
         Sj2KN3OKxLUtW/QPGCJ9lU1rC2glReDQfjvF4Ye1V7Vh59eRBhSBywEVFDV61FSa/igo
         jHq0ci3q/wMy20WttHsXcmb45y1G5MgHQnIQMUHXqrXmDP7Md3oZ+COSvs/OxE0xMa+G
         +hNn5l7j1SqqfGzewLxoNK6y6CIXNk3Oepz3exkS6SOr1pZjAZS3ibl91NzbH/yNQyzR
         qckQJ7Hoh87aTACJY29XD/C3Kek7n2ghw9N5I95CpLsdIhBdmrAieN11WhczXVtTRqhN
         EelQ==
X-Gm-Message-State: AOAM533fMTDfLcxwGFj6Z+M9hFJa/Ku8Ya5Q3814hu8BuWJ0bbuda0wF
	CsNBPxShiPns+czfo6V3vonkCvLTh4VuqDyBe9MnwA==
X-Google-Smtp-Source: ABdhPJxZTVXxFfY2MEayuNV9TOxNJm0RpADQb0nB7hh1xfftZ6O9193T3hSRc29a+ayd2kJhGIgVP9PfwL4JI+Y+GFI=
X-Received: by 2002:ac2:5e86:0:b0:473:d044:60f5 with SMTP id
 b6-20020ac25e86000000b00473d04460f5mr22047290lfq.87.1652315298341; Wed, 11
 May 2022 17:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220512000340.1171988-1-mailhol.vincent@wanadoo.fr> <20220512000340.1171988-2-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20220512000340.1171988-2-mailhol.vincent@wanadoo.fr>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 17:28:06 -0700
Message-ID: <CAKwvOdnnDaiJcV1gr9vV+ya-jWxx7+2KJNTDThyFctVDOgt9zQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] x86/asm/bitops: ffs: use __builtin_ffs to evaluate
 constant expressions
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 11, 2022 at 5:04 PM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> And finally, Nick Desaulniers pointed out in [2] that this also fixes
> a constant propagation missed-optimization in clang.
>
> [2] https://lore.kernel.org/all/CAKwvOdnH_gYv4qRN9pKY7jNTQK95xNeH1w1KZJJmvCkh8xJLBg@mail.gmail.com/

Regarding
https://github.com/llvm/llvm-project/issues/55394
it seems that functions with static linkage cannot be considered
library functions, so libcall optimization will not run on calls to
them. So the compiler might be able to do a better job for constants
if ffs() and friends indeed were not defined in a header as static
inline.  But that relies on the compiler knowing these tricks; I think
the kernel's approach is just fine (better in fact, because we should
inline these tiny functions, regardless of LTO), but like this series
shows, there may be room for improvement for other functions within
the kernel that are defined as static inline in headers that are
normally found in a libc.

So I no longer think there's a missed optimization here, but at this
point, it's not worth a respin of the series IMO to just let sleeping
dogs lie.

Unless the x86 maintainers wouldn't mind dropping that line and link
when applying?
-- 
Thanks,
~Nick Desaulniers
