Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B169347505
	for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251249; cv=pass; b=K116ZXjVQNoky2VpMU11KyzDr5aW1wBMo1HmAuSWM9iBR7dVIym5+6DsiQ4Bjz87XybYYe808nKpr5QRLqYjmVLUX1qMdrmpyf/yA2GNqfzHiA23vLRsNXM1caF1dd8dQ2FXbwY8fzsL8DdpkEEut3JtVFB/nkgRIO6hJ/zq+lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251249; c=relaxed/simple;
	bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVKMfF7my1u66aw6YS546tDmm3t9PqinnZ/P/Ag+IbX1hIzsGAuGBKb+PG1PAgaoin70gBGTOCguSoZg2oHN01dR1xYYez523+mD+5L/UOaOPbJEIGLqXR6gm/XZy+pCVJ/EMGcii04MMlrfm1b5X/EZVxphdwZHic5MXl9Coss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CQiHqU9q; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CQiHqU9q"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7dc67a5e102so6681687b3.1
        for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 01:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781251246; cv=none;
        d=google.com; s=arc-20240605;
        b=MeLai7G6eom+HA0cUxMwHeTsfa8kSCssc2P0Hlp46q5ivnKdUs0qT/FW9yFaaybbVv
         Up36bxRQXPMHItHFpzB9xMWsKwhp6KCQ7VbUu06LSQqhWB2UcLXELoTtzY8y3pB9faT5
         7abzMWTdmKA1gD/Raeq0s81FW5ZNKhRJmU/Q5tnr/y6fGc72tVz4Tm7JNlUGd7fyf5my
         tsnAHUkHQWsWcIBLl6vfWhuUaJatWjmUcfp5yFJEy4o+wNXAF+G6TPd3Rgt+o9HCYRC2
         3EyVzphvZlKxV6E+jget0wuqF1g8GzW//RoYeh+CwPnHMo2Ec0tnzh0GMAprp4Z6OUim
         950w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        fh=+42MydzensWoq0gM8mIeACrIZWtj8oeKseN8ZoAdZ1w=;
        b=YKOdlptaAnp4Vuq/zijekA4BVxy+FHMRcc35opHvVrh0hTCybXc0UqrOPmkgLejLaS
         zmgbgrn1D6ouQ0OPG4aXm4JaY99GSCL5GwbTWaFRrT3d652y8DsU8ydt8eUmB7U22goM
         7FXMFIiwb/RuwJFJyg9f/a7b5BRjAC9ddjFxqaoQwl7NpyQF9252McpdISeuWtntlsog
         vjZfxeaGxRCkXy45/v+h/+fKabUrFUo/UYdc/1d+5qMbkwgMxdQjjVwnY8Ams4bA/D1U
         UmgMSXY352Ddofdp+Q6zEzv32hOzBETn+h6MlkVsqnR7o+wzOneph56z3H9LXL9LlVGI
         3hDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781251246; x=1781856046; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=CQiHqU9qC9HnNLWojxnHHFTl2NeLMEVfuuAuzJZA9SHxAO72hbSJYDogMQQDlEX+9C
         7RKYQC/GC0n9a0l9wqJeBR91PyrTnBKa7SNeLsHoP/tIB2v7Q9ELPaOMI3vrpzhB/2a/
         w6os1t/HxpBiV6flxYRvycLjYrwzgB2/YmyWp7Ooq3Nbzc3mrtCFv+URanTjB9bvhvix
         KdVcPh9k1Su+mobwCfxIkA4/RxnW7vmDOMYEmRTIcIR059Uos+6WjWgnB58vFhB50CXE
         qLmAa9LqCOwobm4AXbhgyKIsMjpOlrZ0RJs+NtJgelb/Eq9RZuGCR7X2XgmGgFzihbZf
         b0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251246; x=1781856046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=msWyjC5NdrpJckbomtF0naXi8KIOc6AJLMpCYTXfUHa5yHL2b6gt6ffI+PnLAV68Gm
         7OVlEoLyv1B4OmArWnmIUrEP+D6XnaFdxQIDivbJZDev4wn3nz6vCzkmUvV6U/vEvzUb
         MlEfNMjPLy7X5NZxXBqD3gXUzwSYwwS9htjw3qJB935r90MybQe++wX8p65nV1t7BaM3
         jCqwJPPtiZXnun6qcVvM5qzDwebW1LKJGF2M7wv0ttunYm0b13koxlYyKkSH/kMZ76pw
         7NjCk+yh9Z1pHN1qTm2OnqDNnLyfben1yslXbYtA2veQbv52FLEnSelLic1qYbBrXT+v
         iiqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1/nV7Z2RyDzoRF1unUwhwJJm/G1737LLATpZsVKYLglCaj30arQDyFpqMfxZpZYnboBcA@lists.linux.dev
X-Gm-Message-State: AOJu0YxRhrtMpbSZQFazF/iAp5m2SjZWs8tq3Hz6PYQaFphPhHS5zbAV
	f4wLASw248toUMFlMRx+d6VKY1lkpDGoPAakY8klfuTMF8tU6Xk16uXgQY9yu8zceN62+KtTQkq
	odEcssiTzLOYVZnwn5ivx4FYLsnYPn9kvM8lmq2FB
X-Gm-Gg: Acq92OGnA618iQWhauhUGpYNyi+Sao2rCCEoDdAamRigyAsNkyQpYq+fbddQSXpJkVG
	pY7UECjlEVzxjcKDkxU0GRR2hHXfgnjwwRcV3w/L3av1wQfuH7wI8rALTq55/t9U0fTlAl7XePQ
	8cTJEzaZZ4RqbGuEA7oNvbNe1xL1KqrFe9rtZDOOfy9V8hxMFqup8BM+4mgpePDLPJVmVnomcrN
	x70SENgLC702sR7ZvfpW3/UeiYXY1Dac5nHAjJtGACkIyshbLYXxbWkz7V/MArccfspKAtCyU3G
	h0Fy3k0RnocK+IFv/XJVLhGVal+yIB07yexo3w==
X-Received: by 2002:a05:690c:6201:b0:7db:f8b1:cd80 with SMTP id
 00721157ae682-7f7bac02970mr15863297b3.2.1781251245971; Fri, 12 Jun 2026
 01:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech> <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
 <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
In-Reply-To: <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 10:00:07 +0200
X-Gm-Features: AVVi8CdEFjoun-R64CqbvYJPTnaS_E7TDNryUpyw-2UHJoZxcDfdiOQP2RCPBTE
Message-ID: <CAG_fn=XB7_zbjGzpgwEzm5dqcwehqvB+=SpJhHvw9QdETberAg@mail.gmail.com>
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

On Fri, Jun 12, 2026 at 9:25=E2=80=AFAM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Hi Alexander,
>
> > On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.=
tech> wrote:
> >>
> >> [snip...]
> >> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202=
60603-v2-0-fee0939de2c4%40est.tech
> >> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> >
> > Can we please avoid this?
> > kcov_dataflow.c is being introduced in the same series, there is no
> > need to send a buggy commit and a follow-up fix - just squash the two
> > together and note the changes after Signed-off-by: separated by a
> > triple dash.
>
> Thank you for your guide. I'll remove it in the next patch set.
Also please make sure to update the patch version. It's really hard to
distinguish between "[RFC PATCH v2 n/6]" and "[RFC PATCH v2 m/14]"
when both series pop up in the inbox.
