Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583793C7E13
	for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247395; cv=pass; b=rCH5524Nq+EZ3yST0Ez5+LOofTfvb9+K+NeCJ2XzKWiaWqeKjKzM5tZltZ263E1RnvRgT7iKLBVi8jlRPv4qHwbhhPzd+KT0YTKxJ+XdXPc/CX3KFsTc8zIOoT814QA+fKSYC48qRlAs0c67heJxHjf34CsAS478pAFWGXTiNyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247395; c=relaxed/simple;
	bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+rjp/pYUHRr3VwJEESOhSMg7A1qq3mm/wLrNCaomJhTv6JqQd6LmQUt+cqdhyKUK8M5xO5hnoM6Q3GhJhv6hKINT8hAkvMa3WOY3iQKU0s0eAjdwp4Qp2HcbUg1EttmuzkibiLh4ZvkxnO9rh1HnKMm60WZM3oPmOZDnZUsShs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4WWHX/I; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4WWHX/I"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so1064713a12.2
        for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 23:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781247393; cv=none;
        d=google.com; s=arc-20240605;
        b=A73n0OC+d5YrEuG7A1X2GIiKjZeNLWPPzz9oNTqNpfAdbahibS+OQ6fYEuF/1Ctx72
         Tp3UcnJwW0lHNAYn9Xv8HBRYaHee9ro3Lk9c9d7bRsbY6xVekSgvyfHvTtCo6YQKDSun
         Gw+ROg2eZbRphaGmS7xoiTfQI8ehDknwUcFVt87nghkwIYbo4vRgftYaycDHodo20iB9
         qRl55yzMOvUPY0gMYr0PdlsrnzY8u25ORrdpmf7mys4ZON6XM/UIKV6c/uRmfiOEXYbq
         AE3btTK8+JDTEK4qpFyatC04GS58Om3K/HxHVE9TRdCimBV84NVwltafsCIxMZyd0q/k
         z8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        fh=1Cr4cBhmwYwsZ0/EP5qU6Aoa8wOBdPGxOWZMgSTGgzU=;
        b=OGgp+qOWNavtygDGkFGwYHEURX5xbeNT0SsP+cX0DMBtGKpufyESiKYSJZB4SYVgGm
         hzfQR3A++Uet/4DzNlOjjsgn4oMEi2yNfuX/6HLdhIC5IWPQQFDuPNlfk7zQ/kOnDOoW
         BiaIQpJVTkfQ2/rgFouwaQvEIRtVqUUzjDByKAEVeSpvE3VfqamNLJzzvn19twOvmzza
         knqce4dWoy7XYMFZZYwQYF3JGH/Ac/CyQg+DmcGypxyRpodnowxfK4+yub4umguwPTQZ
         94mXolikkqrLdCHQbm8WfWRsOT34tn8TDTwrFAhRdJ3q6taPgzQ2NPZ8swoFHKu+PWxn
         woZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247393; x=1781852193; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=U4WWHX/IEfTdNUG5RMq0DR622VmOVzUL2SbJALryJ1G2BU2dQK8eCsF1Il2xZg0UMv
         RUofIBJUzTZi8MfsbTbMABArkVcOptpG7uVUENZqzFq0ElivZijFZYjsN0haMvBj+f/k
         CgPY+syTtqAH+sEsVkqr+XA2mYEIn4D4Mj15Z27PoLoeKv5D0NNDedrY5xOjVpMGV64u
         zJiEJY819J/R5arzNiskBNTtfrsi6qETNhxG6AiIbEBGJZ7jAXbgMM3zJV02rpMCyxYQ
         LsIvendR0dUhK+izKMKYg1oN/fpuZpgCWd+f20QIGFdVvOISiv3Qy0Hc06sD357IC2WW
         38ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247393; x=1781852193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=Lc2Vaw+lYSMOP7qz6Trf2QIrjnz4kOnu4lESYODeZ6Z/KwPDghoFvTW3JYHrWdoNQa
         rHP/0Xzq87fl1L6+qAEK6fZ86M0gC2JiBZFJNxDYYOqIWkHTdneYsJG2SajUEwQ7Sq8O
         PiZ7t0vFm/3h8zuzLCfTpQs+j2KOq86S/lL+/uOPJ4nyxfSj83u7RELOBdsnMcUvZ7VZ
         nDh24nEkVyiwkIK4+RPh0GYEUcNpjpbCQ56f2r+88iNmwDRZQ/zVpfZo4oc52Z3N7saK
         NC4vbwCwIkDUJJHLQ7418ynnXKVSAdgi4iVJzyGPUI5UJZ+7296w7LC8Vc4PmJYfg/rV
         KfeA==
X-Forwarded-Encrypted: i=1; AFNElJ81eRpcbLuRdya029P4NLG+3Ys1ekpKv8uUBDUhjOpJBgGo0X+cXqxlx0IVYOrse7ytKR+v@lists.linux.dev
X-Gm-Message-State: AOJu0YxgumPVkop4EP0rV1Ff71K/3jqhiUQvSD+sMnT3pRMbT/wpP4BM
	lOojYyrA+3pJTi+6RowwchaZUGMMqFDHBlAye9Hi0YDaGi1GfPD56TeMhpe7rti2/Wyc9g3jZC9
	IF8VtNGBe7AU/M5sdWZGx2mjYos30wCMdtaITL5Hi
X-Gm-Gg: Acq92OG89F9GF8/4GibKq1rAWVgs4ExScMnGzHRkiemd0rwlPBa9JtGJD0OlgVTw4wM
	TKrndFVjt0KoBuXgzZyyzhL21F9xKONkxoiDc5/lP3cmgY5/m6BtD2/smHSYixNwsy1QEfA8Icv
	E+BvFSwzUXaqKFGywZRP2mwfQUtnOD0AIUi8g4ZonDzxku/0BBYrgumT0t0nM4NHyzPbMeXJrj+
	SdHigj3Q3FnSIKYdTnHzOgpbrZB0KCI2pGg/Onvbu9V8ZzzarTgER1NfwbbYz8776B5P/PPsSFL
	xNVsmWmVtokRCG9cLqPvM7YKkc2p+MIjaFm1eg==
X-Received: by 2002:a05:6402:434b:b0:68b:d10a:a48a with SMTP id
 4fb4d7f45d1cf-693784fb02dmr602313a12.11.1781247392123; Thu, 11 Jun 2026
 23:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 08:55:54 +0200
X-Gm-Features: AVVi8CdLRn3HUIKr4oSFNxeMmeQ95IhSWpzIU1V25ylhb68DqGsVy-9EpMVuQUY
Message-ID: <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Two threads calling KCOV_DF_INIT_TRACK concurrently could both observe
> df->area =3D=3D NULL, drop the lock to allocate, and then both assign the=
ir
> allocation to df->area, leaking one buffer.
>
> Fix by rechecking df->area after re-acquiring the lock. If another
> thread won the race, free the allocation and return -EBUSY. This
> matches the pattern used by KCOV_INIT_TRACE in kernel/kcov.c.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>

Can we please avoid this?
kcov_dataflow.c is being introduced in the same series, there is no
need to send a buggy commit and a follow-up fix - just squash the two
together and note the changes after Signed-off-by: separated by a
triple dash.
