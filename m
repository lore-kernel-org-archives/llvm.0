Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54404282F19
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675576; cv=pass; b=R7qQoKbJrmjyb3eAWR2W7Ih46AzZ+4rNZekPG6jwKqr6MEjXukOPE/xKVPJ6vUnqRVAyOQsO8mLkhowb3crpFhaJdXAvxzDcO643Z886wtiboT6xSU8Erag0ls7FSqLPXpID+q0B7QV/4cGmTOY6A5WK1STFg/XfkY2HbJfB0pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675576; c=relaxed/simple;
	bh=CYocm5u0+pg9o3aIVAE3m5a3oTIe6F5o9fKMKsoF8EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rh2x083tktdm0l4AB2kHTG9CngXb0r7+qz6cAxo/DHkk86frWbuPRhus59xO7ryYEkZOJ+3HKs/qb3sX97HpZaXG0Rm/11QSk9nhiT9JfWQQ1mrO3L0eEJyOqNLPe56Iumlv0L7XdfRlI6SaaB+3jXEVbHBaVF44tKEXJGxcyas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=skY2DMNA; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="skY2DMNA"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66039d3efcbso2358549d50.2
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 09:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780675574; cv=none;
        d=google.com; s=arc-20240605;
        b=k2B77h/JHUJMYwcbqiwuOfN4mbNbZ6uFqLNR32y2zb6+ER9wL4lyVzpKyIOVp1r/4u
         /v1Rf96KGakN9db1/xGosyFoWLnsodoBkBqNAbdgIUBsZOsJ20eZ7TKolWtHLBRxlrTz
         iwxazcp7Tygc0VGFFywVa4xfb1Y83Dq2V9z4xc9cnMzj69xOh7Q8vMqTDYAwY9He0/lj
         CM0MsQwqwm4x1S8ardT3x8+s0B/UQUKmB7oxZv4KdJc8lLOmUdFlGonTJ560upSz4f2Q
         2bQ18FebbGFK1ZyLOIt0+5J/DMBY+QkSQtgTqBplECD5aoxq97ncKtIYDH1HemLxhASt
         qFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        fh=LBOC7WYAe8Dkx8CtM/uqzSiCL4uaIYW31ZXAV6/RV4Y=;
        b=gZxmyjGL/OGM2oxyvmtxVIK+IhTEIQBcEzJYgM7VrOvgvnNXlJVLlJIyMvtXBWNtP+
         iYWrHA0837mdkrZN1a8sa38tfMRZTGrQp5/k6x75eGc1GINs0ySLdPei5yInXt2ndc5/
         xhS7KkDYHMwW2qsiI5PfeCPfBuDLVhjTvEkepV+e/9LOpOq2zU7IC9QUVyp+HlhcF6cn
         ZAI6rH8zuTWqb5dz6U/euSZVdgGg+rdHG+X1lHr+u7a0mCKtnOzzzovL/7r9AJBZ6Nhl
         a/Fb8EKQ1XtmPyeBOJzVIcTZNBBq316mCgXimRsky7+zA8/wP3goigfZa1no9/6ICGVt
         3v1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780675574; x=1781280374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        b=skY2DMNAwKGdwCXRSdvs1rtNQ20cHe425BMdEEiDx5hJTVhQvW51YJMr6TEUNrG6ZV
         qcLVcq/ooVShit2TFXtrtirEBFhGyynpatrhQK8lvj0n8UFmXTPFcQnvYM4+36mFZxcf
         r/mo1C37XAIlMYMzbmGeJ84ivn4+BZJcLxHqnyhdhA121J+Y9bkziyZbqsqsG5zQe4Vf
         sP10vSbf9A0jChaEczT0LfxuAHipURzqJ8KHFbFqmoWVBdVgYCxrbNhMvTtltGaOeYjo
         0q34CO86n4fvHOCS+Ff0z6UsPIJ6NF6WVbPTUf/bYgGzcJgohuybCU6WChwXh+vzNo7J
         Y5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675574; x=1781280374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        b=b9zA4DHONkapXPsMjKeqCV4zVDfSd3qxZgh2nWMeC/ZuyndWSxLahyHNoBC/jXHN4j
         yWmLIgFrViUWVCQ2dH90NgoAAs1qhvav6qoBiM/g5nokc7SiXGRxR5tEn6fsOKWDbOuu
         NCjc/6EPJwp6OCT56D0Eh6y8mkmq09uE3d867Vuw5SB5HfsP5Sfb2HkK+5pQP+25XQC8
         nV0gyS6gdTWAqIw3XgGTa4J40hsdrI4CLgC51j9hvaeSqh5wfEneYaIgeFlNAbjYz5kK
         UCDsxTidKGtKSsL/JI7Yig46M1e3ID1f4dxMNDsXx374jV4enKhmvF5juHto9zH4v2va
         qPSg==
X-Forwarded-Encrypted: i=1; AFNElJ8Esx8CP9BWnLT8xuB9wjsDwTuWQEPLG9OGr2K6epWletdI/Ao/asfiCztnKeUWjMtUlEB1@lists.linux.dev
X-Gm-Message-State: AOJu0YzNOoVsUFDt6V4yo/Q7eF6cuuihiSiAdXR4Cpu9fbqoIl1mCWjl
	AT97F1JE0TKDGFSecqHm7qdvhBctnC2iE4jh5rpgd6atSbjqFId87TTkR7nndXQ76vJgBnjOgLe
	6dRv7GLIdU60xiDfdfwIECryPCX0cQ+jvckpTbnrW
X-Gm-Gg: Acq92OEqIPsp8LmwmZzIchzpvC5TKOCPrIl3NCtBUVW03Pa5RdQpVgdDEWYA7ccyqXr
	Gw+OIqf4l2EpWf+sGc3dI+ci2QpjZDg0R/lUiEycxjABArKlBqqr3o9SVawJJot0XUncxjMZivr
	YKqeTDaYJFuOWxf515AQ0/LwirqJJzXLzYQXDp/2dszP2mM0T60yldZ8ZcQE7rcSH0ZPAqAzMZt
	OjS8SsX+g4CVQmJgaUAWlWysQ2Q4SSmEDVG3XLUW7AsLSshzEWoW1s3apBMghmohkBtMakAv4B5
	DLkLiZHQwGcAJGO06O7qfwgKzT1xi8FTYDhlwp9+262jt9GWfSw=
X-Received: by 2002:a53:e306:0:b0:660:3426:3ff1 with SMTP id
 956f58d0204a3-66106f583b0mr2916376d50.34.1780675573532; Fri, 05 Jun 2026
 09:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 18:05:34 +0200
X-Gm-Features: AVVi8CdtIWJrRUEJnQQQB7BanVCY0Gd9ha8SThOa2A947QiJHGGMsBgLigo__P8
Message-ID: <CAG_fn=UMJJz+3zipowaC4uTvcbC0gvXbBRaF0UUJ_1AW+oWNGA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/6] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - Per-task buffer: task->kcov_df_area with atomic xadd reservation

I don't understand this line...

> - Recursion-safe: notrace __no_sanitize_coverage noinline
> - ERR_PTR aware: skips struct expansion for error pointers

... and this.

>
> The callbacks (__sanitizer_cov_trace_args/ret) are inserted by the
> compiler when -fsanitize-coverage=3Ddataflow-args,dataflow-ret is used.
> The Kconfig options depend on cc-option to verify compiler support.
>
> Buffer format (TLV records, all u64):
>   area[0]: atomic word count
>   [pos+0]: type_and_seq (0xE=3Dentry, 0xF=3Dreturn in upper 4 bits)
>   [pos+1]: PC
>   [pos+2]: meta (arg_idx | arg_size | ptr)
>   [pos+3..N]: field values read via copy_from_kernel_nofault()
>
> This is completely independent from legacy /sys/kernel/debug/kcov.
> Existing users (syzkaller, oss-fuzz) are unaffected.

Does oss-fuzz even use kcov?

>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  include/linux/sched.h |   8 ++
>  kernel/kcov.c         | 291 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  lib/Kconfig.debug     |  22 ++++
>  3 files changed, 321 insertions(+)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index c4433c185ad8..03be4b495f70 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1533,6 +1533,14 @@ struct task_struct {
>         /* KCOV sequence number: */
>         int                             kcov_sequence;
>
> +       /* KCOV dataflow per-task sequence counter for TLV records: */
> +       u32                             kcov_dataflow_seq;
> +
> +       /* KCOV dataflow: separate buffer for trace-args/trace-ret */
> +       unsigned int                    kcov_df_size;
> +       void                            *kcov_df_area;
> +       bool                            kcov_df_enabled;
> +
>         /* Collect coverage from softirq context: */
>         unsigned int                    kcov_softirq;
>  #endif
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 1df373fb562b..d3c9c0efe961 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -353,6 +353,288 @@ void notrace __sanitizer_cov_trace_switch(kcov_u64 =
val, void *arg)
>  EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
>  #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
>
> +#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_R=
ET)
> +/*
> + * KCOV Dataflow: /sys/kernel/debug/kcov_dataflow
> + *
> + * Completely separate from legacy /sys/kernel/debug/kcov.

Since this code is completely separate, could it be put into a separate fil=
e?
I think kcov.c is too big already.

> + * Own buffer, own ioctl, own mmap. No printk =E2=80=94 buffer only.

Can you please not use these long dashes in C code?

> +/*
> + * Core write function =E2=80=94 no printk, no locks, just atomic buffer=
 write.

I think it's okay to omit what this function is not doing.


> +
> +       /* Atomic reservation */
> +       pos =3D 1 + xadd((unsigned long *)&area[0], record_len);
> +       if (unlikely(pos + record_len > max_pos)) {
> +               xadd((unsigned long *)&area[0], -(long)record_len);
> +               return;
> +       }

Have you tried compiling this code on ARM64?
I am pretty sure they don't have xadd(), so it won't work.
But why do we need an atomic increment here at all? write_comp_data()
performs the same job, and does not need it.
Or am I missing something?
