Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FC372
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 19:00:59 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id r19so30115704lfe.10
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 12:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N65pshGMOSWSb7ytdKQXKm+0kQotiHH1u3g8XlS6SNw=;
        b=MurAIBhAyWvppT1gcNnRicRI9zIENGp8xMMvTyFCuc/Ed0okX64APsncB/biZCuK/W
         YkbhQnbgtIVSbavZyNTA6MaswMyeo76MVVreGHF5lgKUd1Id+FiJuiUwqNeQ6gkiRgJK
         EGbBBUD90fzEUuim+zdEiYSIgfnlmIBH8/VqVRkiHMMu6EtzF/G6soZ8egpcYoDxiJgq
         eJ3lV7IewaWCU8j0LPzOhVLYCRGvzxL1KgHDj10F1AxTAyjKLXZRb7dyg8odmI7bsN6D
         KoGgXsWQ2CA3ZUwikn3n5UuyGQxdOq1v6hSIwdSlMlv5cKIvgZl0x0ihmPu8V09Bz+FO
         H6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N65pshGMOSWSb7ytdKQXKm+0kQotiHH1u3g8XlS6SNw=;
        b=aOJUOtyCV2v81lLIzfZk8wu5dZXcDDGGk8zXrmR4vMjN6lE++oGNaacllvFhLEnkMt
         F+3cMRqz3LF/vlemGvHbGcDjYbZYd8/yC6M0WCnj4D17VueXgeEsoHRHGGhKPnX9jB9C
         mKbcE7c9Iw7rh243YPqT9XaZRgeGVC8JF0iwJYC4o4N4ERb43Vvwgi3+py4tSBxfEbdV
         UCgqEhpH+YtgocK6VaBZHgl+015JkQFuDNgZMfr81/SVoyPpuu4kQscteQ2yldNzK8cC
         81wy3UiqxHHh6Byb3bsPvlQsX9uS70Adt5Zw5UqZkRsV/Qy979HrVh77qcTtpkcUgbAJ
         y/Rg==
X-Gm-Message-State: AOAM531/uoUdwf8QHw2ppupc1hdefABMmMaqg1eOJJ/xAYsrNBpeEhRo
	25MXAdzkHG+KJpWUMzbbPp7Fz9FPTjSvLSpPxA8K8Q==
X-Google-Smtp-Source: ABdhPJx4VtNZo6P/3mvHn2eIoRK5I0Ry6vLL9tIF5Vufdc6MMyrG1tLIRdbjhsp6q+0UJjBwDlR4ikuAI6lCXcOdKO0=
X-Received: by 2002:a05:6512:2284:: with SMTP id f4mr6823396lfu.489.1634238057524;
 Thu, 14 Oct 2021 12:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-10-samitolvanen@google.com> <YWgSwmzPFrRbMC1P@zn.tnic>
 <202110140904.41B5183E@keescook> <YWhpbu/Y6V2p/zlY@zn.tnic> <CABCJKueW+=DfzONAZb-XF=mWYH_S-BeNihZfGhidOGJO=WYmZw@mail.gmail.com>
In-Reply-To: <CABCJKueW+=DfzONAZb-XF=mWYH_S-BeNihZfGhidOGJO=WYmZw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Oct 2021 12:00:46 -0700
Message-ID: <CAKwvOdnw4Ci_z4=y7NDFiWyhRO8W_KXjyBtd-RuNuznA2iMiPg@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] x86: Use an opaque type for functions not
 callable from C
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Borislav Petkov <bp@alien8.de>, Kees Cook <keescook@chromium.org>, X86 ML <x86@kernel.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 11:24 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> Anyway, I thought using a macro would make the code easier to
> understand. I'm happy to rename it to something that makes more sense,
> but also fine with switching to a simple extern u8[] if that's
> preferable.

Perhaps `extern u8 []`s with a comment that these symbols are
functions that aren't meant to be called from C, only asm (or compiler
generated code) would suffice?
-- 
Thanks,
~Nick Desaulniers
