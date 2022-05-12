Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A3D190
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 01:18:52 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id v59so7074158ybi.12
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 18:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w4stT9a7FDgrQn5Qyvbf3ILrgD/C37efIbL6LozjRUM=;
        b=IGydyUh2CW/6daB/wm8wmQv6HWwAnUsmYZUrcp871hH1cCXGa77D0euWxFrARC5NUB
         yGOW/hrqg5fzWVGJNa6/Dp6Hv8h1kEoHJO4GWXJtX+8SdHp8DF/tGALhIJiQfy0wnzTP
         GJJNsWQ3Wg6DSzQB93mHJiksgMvWJjoB9Z+V7bJmS7zO5mRUqLurSpteBqSyJKGNu+q8
         D8tLUbBMF9P/ktVv4e8sTl29smGJGqrlhML+v3ncBP3BUc5XjdU1XyfNioz43gA0puhF
         MSxnoFM1DOryRAODgOEcDl4UK2DdyLmElpHbWZOm1yXR7+Tm6ZbLLgW2aSZdZmf2p3sQ
         +ZNQ==
X-Gm-Message-State: AOAM532zWGqJPBk1GSZlHqs2DtyDbcH/oE+Hl6dtY92q9Gqirj8ZpuWh
	69Vp2ZYPuwBhQim5x7k7fmbfsKBwN1lDPIvixlQ=
X-Google-Smtp-Source: ABdhPJwcvEkxvkY7EbXbUN1ejuS/pf9M00xo1nrPv7jZAJkGKlmtUEKR6Ug3J5JY2M5YNk3sPr5W13L6HDUpJqQGhYQ=
X-Received: by 2002:a25:bbc5:0:b0:649:7ef0:1215 with SMTP id
 c5-20020a25bbc5000000b006497ef01215mr25915823ybk.142.1652318331641; Wed, 11
 May 2022 18:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220512000340.1171988-1-mailhol.vincent@wanadoo.fr> <20220512000340.1171988-2-mailhol.vincent@wanadoo.fr>
 <CAKwvOdnnDaiJcV1gr9vV+ya-jWxx7+2KJNTDThyFctVDOgt9zQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnnDaiJcV1gr9vV+ya-jWxx7+2KJNTDThyFctVDOgt9zQ@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Thu, 12 May 2022 10:18:40 +0900
Message-ID: <CAMZ6RqJ_zU0DL1hiXE_xkOmHQFTxHPPt=c_bPUzGXWrjVJEKJg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] x86/asm/bitops: ffs: use __builtin_ffs to evaluate
 constant expressions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu. 12 May 2022 at 09:28, Nick Desaulniers <ndesaulniers@google.com> wrote:
> On Wed, May 11, 2022 at 5:04 PM Vincent Mailhol
> <mailhol.vincent@wanadoo.fr> wrote:
> >
> > And finally, Nick Desaulniers pointed out in [2] that this also fixes
> > a constant propagation missed-optimization in clang.
> >
> > [2] https://lore.kernel.org/all/CAKwvOdnH_gYv4qRN9pKY7jNTQK95xNeH1w1KZJJmvCkh8xJLBg@mail.gmail.com/
>
> Regarding
> https://github.com/llvm/llvm-project/issues/55394
> it seems that functions with static linkage cannot be considered
> library functions, so libcall optimization will not run on calls to
> them. So the compiler might be able to do a better job for constants
> if ffs() and friends indeed were not defined in a header as static
> inline.  But that relies on the compiler knowing these tricks; I think
> the kernel's approach is just fine (better in fact, because we should
> inline these tiny functions, regardless of LTO), but like this series
> shows, there may be room for improvement for other functions within
> the kernel that are defined as static inline in headers that are
> normally found in a libc.
>
> So I no longer think there's a missed optimization here, but at this
> point, it's not worth a respin of the series IMO to just let sleeping
> dogs lie.
>
> Unless the x86 maintainers wouldn't mind dropping that line and link
> when applying?

Let me send the v4, this will save the x86 maintainers some manual
editing effort (add will add your "Review-by" tag in patch 2 while
doing so).
