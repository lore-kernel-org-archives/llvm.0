Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2FE3D903E
	for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249606; cv=pass; b=Sr4CBI+MUt5Tq20ZIRssHRoFAW0EcdlrNdp1Mh5xO0jk4Zqq8DjZ11mj8fk3/YERXQxO3cbcaeDa1a4OnnW9UiaHt+4qcuDyP5AGBNUkleDgcN5v1qGDE78u11Oufk0EaAUwKq+MnxJC6YBqO54tgqVjb9xjAUCKyYIgr4MP3y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249606; c=relaxed/simple;
	bh=+CK+tt771npQ32DrjHpsZa5xuUy11BpcBUH4eDrxn4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJl2noxgLv/zi0+8ywFpHTmAGU4cDwcBJTqMTASKF8NTYF+PsYZZ9HZUc2lOr2uu1P/uocdoHOiVLo6pt5nJreT+O7/s4acfkSCvZrj3kDiuGUz3MGi4PdPo7yT9XLzCAvltw24MswH9Z+CurOPMAcaZj3/jb+5JbdbQ+tnACcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jHL0/CRB; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jHL0/CRB"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7e8833c99fcso7018347b3.3
        for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 00:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249603; cv=none;
        d=google.com; s=arc-20240605;
        b=YsE6OLFKvbRKSUkJ0Ps09gaIJn6UbwN3SzPZrjmKt9dVBbAPtREEC4WDmedfPbfam+
         hgWAoZUaUaDTnmGZUihBZ1h3dQiOY0GqU3Zf7wcw+ZIQ4LjUaOF1N5k198MsMVLSYvTl
         X1k8dqgTDgghhxM0pmE2c/k2YBavMLdXNjvQNMKxfxtG4Dk+wTQathOTP/u8dLqsSAJY
         0QkghH4XWrRV7xlD0qruAqDH/5CfBOXce4JVWm58nHyBNNwxcLN6VS3cHceMkQMXYOHo
         hy8qFEKHl7Qa4lPvwjikbAv8YfNYuGLJpUBWFgXujw3qDO7O1/zqE8mnq2m4hkD9g0T/
         xN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        fh=reqjnARtd7UtE2rP5c16Avxf9XG2BfINyjSsm1zgXlQ=;
        b=IfnfOrqIivtZcRuMd7QevDGo5G5+kE8sTU5/WGUA97gaGIRGhqGicDrgA073YFiwbk
         GN9UZYKsgbawR0TAWCX+3XzYe49VWj8GaYlHPq5ty07qg9on+h4NREmRNMiBqqACGD/l
         L1So5l0Ow8fCVXgsG0HadmE7ryNDDoVKOQ2oU8nkzQVEGjSMT13zX2W2yFdwieewDkEb
         MiYX+Y3uvYbTN6j5ziBdsGKIX5wdmpSDWIcLP+reImqrMrgejf5keAO5gfP6W/AMO/XK
         gDYQlhNUs4eumzzvIMcYYeP6MYTiFDaUVFXmJiIBpy1UjIJIBHT1dLolH1c52wlnCmMe
         nOMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249603; x=1781854403; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        b=jHL0/CRBgJo2MwgAoTFT1GS75zD8F7jcqnDBGqPzOlzNAqG+q/D5EMN2M0pdfT9oN+
         vky02kQGK1AxGiL1hx/NvplNJTOkAaIPBs2zB4/ueDads/ZJKAWpCOP1QeHjRh2pJtx5
         nv8SYvpvcSQ5wGmDLqiQ0tCCIesu/e46Ix2wYhSWqDXAp5RYO+77zcImjV/wbXx6cOlr
         Ro8AgGgMSw48dzmC3dIdmjvb/Ui1ar1u3SsjA/QprS0cVSAeZNw0WmnrfH5S2MB5aMQk
         BlRHlkzkPj7G6YfJg/pHCOahV1+FpQbL6bm89N2fw1weWKxxofRAc5iB0N4nzLmyxSTi
         2yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249603; x=1781854403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        b=LPHhiMuoatt0U0EcBhov8+navn4JEwbk710W3u5QOJ6rle8P9a23u/8iIc1aDh8w6A
         pSCraePe7bDeH0CqrZNPjZ1FZAhjcUlZL34CXuzL7jSQ6wKw3kk4L1BxWti32YwM4U7Q
         QUi1UU3MMy3eebvZFu6adDElq4mcmbL0MrXmUxIFpsoFZeRfneosNs+yBm33R74Ujz25
         7bkLCM7lyp7GQwvyBlDRVOXxjQixghtguMQEBPHbiOympBKJJ1Xfu7h3sSzCuc1Z8Jg4
         n79K4NNEEGeTBF7WjgyCXeQEPZ5jSYVq/8UcTcgj4cFPlgZ900q42LX+JezfXDLrEoTs
         WCFg==
X-Forwarded-Encrypted: i=1; AFNElJ+weLCoT5hyCgyK4Q06D55bx7cHx+Rf6DIrRRAvcuK2NU3XsbJkV9czqqua7cpBAfApjKMv@lists.linux.dev
X-Gm-Message-State: AOJu0YwjP/6eWh3ZRU8JpONAsF1DoXZc2FEoWPU5mZUxgXdwv3/VSWsi
	cFDE1zPy0XMAtu8AOURCBjvFCv5OkEVBS7ytW9h6rJKh2PboSJg3ojXVIyQTokmrxZNyoirQ5Jb
	pUGF5HjUnd+fRUJIqY2MqtffyC+WsgDXcjnugYCvR
X-Gm-Gg: Acq92OFV0BCeTtcyhnOw28JFldn9NoP4pzn7JLaIOBPIdiK25uxzv2QZRtsCiD6Vd67
	X4eevwwW+qARLKix1gqVFh+oLxxigB3kJ2tCQT48mL748/Ymbv+ZzFDaMKzd9HqMC0b6G78r1sC
	ok9uilPRprq4KISYX/9NVfqVYJkf/upcjJG9u7o+9lttFVVlfLBKAeUvrcYA0J+YJ5y0jSMjmRJ
	XiSA9VJ3ikak2c2bABQeTxPrsylX8yG6rD+tCau9jgsP7c2srPjOCsJZEg6sVwozj7+I4+xF6+P
	JIJHxk18BiYw0PzqU16jg429Codx01hlTNhPSQ==
X-Received: by 2002:a05:690c:c502:b0:7bd:8752:cdbd with SMTP id
 00721157ae682-7f7bdb01a78mr15009497b3.41.1781249602660; Fri, 12 Jun 2026
 00:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-4-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-4-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:32:43 +0200
X-Gm-Features: AVVi8CfstzQNbiRE_Nzp0e98G9-7hbopDZWc7hVRExeHcpnRY99AeT5FguWPzQ8
Message-ID: <CAG_fn=UJTVm+XVjq-wq1GsfFLvQuET7N1A6ZF_BWtYwmDab_TQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/14] kcov: reject enable on multiple dataflow fds simultaneously
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
> A task could enable tracing on multiple kcov_dataflow file descriptors,
> corrupting the internal tracking state when one is subsequently closed.
>
> Check current->kcov_df_enabled before allowing KCOV_DF_ENABLE and
> return -EBUSY if already active. This matches kcov's check of
> t->kcov !=3D NULL in the KCOV_ENABLE path.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index 5248293280d5..27587b8ceeab 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c

Please merge this patch into the one introducing kcov_dataflow.c
