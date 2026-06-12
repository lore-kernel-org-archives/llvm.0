Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC6632B100
	for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249464; cv=pass; b=gw3KPpSyr23ENk3FeOluFqo5GePqDDy0fxRTitRNm/j1/lHWDM+EKkXWbc7zGRXrNq947Y0ReoxEexIX8BMmXpkdO0bUiXh2lUjI+T+xkpoU8zF5fQM1OgZpa7XZLVA11qkD2Euu60m8y9Jz1V9c/Z4wPpAjYNNHmOfBWzicJVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249464; c=relaxed/simple;
	bh=TJhwC0TjtETgO7UDDcPQsbkdSGcQTc0ybmTI+jD//dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xec5gRO8t+48/PTZjilkSzjyLvucWHo7BSymRV/Z1VjPWJVaV6kve8EleFX5OJcC/NZArEkns+tjjidoatey/I5fTjH98ge9T4GyOIyS+ZLUwLz8hSEC5mqZXXrxEovfh3YnQQWTZJP2FO8rvRh7tqNl5o5qgT+KZ9ngedOioe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kIOS2JfN; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kIOS2JfN"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so1190962a12.1
        for <llvm@lists.linux.dev>; Fri, 12 Jun 2026 00:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249462; cv=none;
        d=google.com; s=arc-20240605;
        b=S+xztVbBwSEYi/4+ZT2AB35yZa4Q5lgQquUPx8w1t0Gj7b5rOcVg4gCQ7G06Dm0qS1
         620Ort/ItL4n2hnzh5/qJpKTjkSdTKbHPXnGZaqBm6nLfnqS+nHPqpvu8lvbG6ncjDmL
         jJ4FcJmcU7QKnsjk5C6vQ6qIElzvG1KB2G3SFkh1p5pUgkio5WD+y7iieqWnMwa2gNQ8
         WZSbKvIQlKXjR2fvjb8mHEKauOobWvFgqdMkcIitmMsKqhhRw7uRW9h/qdvBNFomV3LA
         UwzjhEtLczyjNvwm1e06XYfnkJC/23evGNUSBlS9QY3bp1hoVXSi5Tuv4YL/YlGi7gjC
         PFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        fh=EJRXmBC149GIFeaFdIlxwBQ2eqI9R/1vlgQyaw5lBIc=;
        b=Ikgjhdgjr/23vGztzpttMkh0fxJOkxb4c9jNJeACo0rOfK6IV18eEfcH3uW7iKZzfp
         FIFgQ3NjFeTP9G/SHCCF8x24alkzKioPuFwVHj2zJQ5KML5DfqHsh+NTr6PKsdnJFjeY
         hIeKIvmkufWlqwtC1HC0sfeI/yEnZCSylkadKGfQ8585yD+ULV+L2Q+WNSwn7D6e1ex5
         wCt1UwSPap5r1slOH4zUq8PKiN+nJQW+FtJc57RRrh+84e0mQbVsDd3MdjUsrNS2eFLT
         hTD97rnhiGO32C88bxcQ4XoVIcNYuIZafwcL//CGjCA0bA0a5EIAZaA8z2Ea2UsrQ9s0
         zdCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249462; x=1781854262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=kIOS2JfNsi9sWolnTEPliLQzwSMq3h7KQeXUNu+kfvx6SOGNK+ROuoz7778FjWevT5
         R16kJFBE2FpYfmFtPu/DIiAipFgFnNj+1YXfY8xZSOOQJ2AEaMRW3jMr4lxKMAsUE18B
         urIdZqC3YuABbdeYl1Uh41Uccy2ppGRjr1bA42uUGqXUl+oU2Jkdlqkwyl/sJO+kOBmH
         0HiltmL409tWf5Kc3ni2enVlwTxn/gDjrKJgDZquuXMJ+oyP9pN1Yr8ZAJipVqeqVjay
         EEmg+mPHs4d28N5JAyI774hie37uNZ5larJ+p9U6GyVL7/jiQ30pbOaDwXEQbJHQFl1A
         22kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249462; x=1781854262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=Hl3W15xz8oK6wOyCNJhKrlFril/Cwd/RJgJ+T40nN/B6sUvw4G9v0SRn5Tqr7T/NwN
         GAPpidaQEFIp/N9RjV/BCkrttzzNm+sO+5SYtTSUsAk+jxaqvc0UeFFyaAQBoKwaW4Ea
         IAcLuDViod8JlOzUjNERtWy63wyGuQF6oruHs6uDYuSplVxuo8IfHWwKg/+ei+2cRSbj
         QxZy+V9c+vo9OlfakXKvXjqECd+5ZMdCo8cWET4U9Oz3VC1q1h4zLxMzpzAQBrd5NSS+
         rMYDQE3WfVugq3qrSGqH+kugQCqhKcP4fCcWXxohmJjXfaCsm6mTf/P+O/NKlDJ8RRQG
         m9tA==
X-Forwarded-Encrypted: i=1; AFNElJ8zjglSpfKPpVNbRQGI/lrdUBKTdPBELtXnkoeOJ5vz7PphJKZKLVIZg5Y3qMrhvHwKYpM0@lists.linux.dev
X-Gm-Message-State: AOJu0YzCIdS/yWJzBAAWSg4nCYJOeQeC9UK6hz7sjt5hIq3e0q4fdpph
	ol+5pH+JH2mKxdT9EDT03NL/6yjfcXC8FJcq2UvvYVI4MtMjB+J+G+v6Zax57BZgQjtnjWg+Sm3
	i428yUfQLAXMm9Q5kr3XKO9TbfEUOdOs5p9K9MyN4
X-Gm-Gg: Acq92OH87RDvbi+yyRvC6FbPjtA+sjOcdYS/5PrbxeKoqjLDA+hND64NUx50z00M7OT
	+AhyQjh2KuFSulv/hu1BuItWVzr+kp4k5AJeTzeHBn62ZrUpAr3vJ1FYv70RRpIzv2BvkUHmPDk
	hh3ng6FSIfyjhPt451fXPwWglBdx/6qQl5PTb24Bgzw96nbFSTNIcKJW1/5lVabg9Dr+QYE4o7Z
	PXFk8k+WHaS1nxrStnig/4Oa8ZMTC28g51kIQN0IPREPqCvV1WG5X+wVXfW86PDf/RgD85zzJRD
	Uwyjnv9EgwsJrjqDn46Ro8gW0qPzOXvllb5Sqw==
X-Received: by 2002:a05:6402:360e:b0:691:ad29:ea33 with SMTP id
 4fb4d7f45d1cf-693779d1edfmr692502a12.12.1781249461160; Fri, 12 Jun 2026
 00:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:30:22 +0200
X-Gm-Features: AVVi8CevQ1ha7IS1m5wrojNeqF7AokFDz6V9vLKSYwmszS5cFjeqHBoSGHAAq9c
Message-ID: <CAG_fn=XRzSuFrxtFbz2t9jjY8HPUUhhnU3iWJiSV-X4+hg66cw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/14] kcov: add barriers to recursion guard in kcov_df_write
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
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> The recursion guard (bit-31 of kcov_df_seq) prevents reentry when
> copy_from_kernel_nofault() or other called functions are instrumented
> with INSTRUMENT_ALL. Without compiler barriers, the guard set/clear
> can be reordered relative to the function body, making the protection
> ineffective under optimization.
>
> Add barrier() after setting the guard and before clearing it, ensuring
> the compiler does not move instrumented operations outside the guarded
> region.
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 2 ++

Please merge this patch into the one introducing kcov_dataflow.c


>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index df7e8bf70bfa..5248293280d5 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c
> @@ -86,6 +86,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *=
ptr,
>         if (t->kcov_df_seq & (1U << 31))
>                 return;
>         t->kcov_df_seq |=3D (1U << 31);
> +       barrier();

Please make sure barriers have comments explaining which barriers they
pair with (see kernel/kcov.c)
