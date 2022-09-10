Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CB57E5
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 00:26:49 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 29so4862925edv.2
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 17:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MbAEJbfBHpl5/eUfL7WvdRsqjkaCRj9mnlfWbPXjzK8=;
        b=iHPFEO7Tl396DvqfM88tOyOzzFEEFGYZzJACKj2gyq3B5EAJMcbDyF2KjIYsvpi80Z
         2as3vpQ5WS97L1DuU+h0CaH25bWiHYaqQRjnEB12YQu0w0bl0IgPEDoa2slkxpWthl4x
         ckjOnAzKxyru1y3iQV8K8vTtBnUx49VtkDgRiKa2h5r3/ChGzxmEWrZmb6ysA/i/mJ9L
         uehYeqRWDsDJobmTh8u0+D1b8kvkzERbdGI9OvWZpN2KF8zVKIkutsuOKffyo3YE8qjM
         jqg0sdSc2zfG0VVSpXx5RDWE1TJp+yn5Pk2YBhds8f9ibSZLqpGeeKG3qL37jGN7JI5o
         jiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MbAEJbfBHpl5/eUfL7WvdRsqjkaCRj9mnlfWbPXjzK8=;
        b=DJuYd0OUqMraYKPV2tIjBKqFjcsTDolPpfesYIWbvEFDeAzJYAG4/a9UXvSybJF79r
         Ja8OWQQeI6BwQudJaMDGkUMNPM1F5G72p9Lpue2jqJu6LGbsFFL7nhAyVXfh/zWVfdzx
         MyBXnOkM1PgVUPivKAl35A23qVZ8k2EPYT9YnF1GUz6PD/CyRtQZe4aAWEs+TMRYp5mT
         UifnMzX+GWBQKlRAx5yKG7TFTxULMScdE9Jd2r6QAR3m2XgN356N2yP6sj2gAeRrtiyt
         S6n+KXmsJQ2iCohEGwZjtFYXS4cTvYRK6NOqn7yPKDqoardhjDh4R2gsb2mgAIxw3IYk
         EN6Q==
X-Gm-Message-State: ACgBeo1JO7bc87wR0V6P8kI7YwAKuIJRauwptIIdI0LALM8caxnhYJD2
	RA365Ff6wwalrvJ/I7M4OeJx/R+AN4UpTg7yS6JgNvyw
X-Google-Smtp-Source: AA6agR4wjwViwrsT6LteTG9R0OtH4aRDEJOtpQ/M8vVlx1QtBQX/6uzmfrIS6DwOn7fhvMA/2mF05E/HaHAyESjsTV4=
X-Received: by 2002:a05:6402:1946:b0:44e:a406:5ff5 with SMTP id
 f6-20020a056402194600b0044ea4065ff5mr13666104edz.14.1662769607975; Fri, 09
 Sep 2022 17:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909224544.3702931-1-james.hilliard1@gmail.com>
In-Reply-To: <20220909224544.3702931-1-james.hilliard1@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 9 Sep 2022 17:26:36 -0700
Message-ID: <CAEf4Bzbm_wq=n8+ve95aBtJkK-WcsUmKM_LT57XU0D9zS9gXuQ@mail.gmail.com>
Subject: Re: [PATCH] libbpf: define bpf_tail_call_static when __clang__ is not defined
To: James Hilliard <james.hilliard1@gmail.com>
Cc: bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 9, 2022 at 3:46 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>
> The bpf_tail_call_static function is currently not defined unless
> using clang >= 8.
>
> To support bpf_tail_call_static on GCC we can check if __clang__ is
> not defined to enable bpf_tail_call_static.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> ---
>  tools/lib/bpf/bpf_helpers.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
> index 7349b16b8e2f..30fc95e7cd76 100644
> --- a/tools/lib/bpf/bpf_helpers.h
> +++ b/tools/lib/bpf/bpf_helpers.h
> @@ -131,7 +131,7 @@
>  /*
>   * Helper function to perform a tail call with a constant/immediate map slot.
>   */
> -#if __clang_major__ >= 8 && defined(__bpf__)
> +#if (!defined(__clang__) || __clang_major__ >= 8) && defined(__bpf__)
>  static __always_inline void
>  bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
>  {
> @@ -139,8 +139,8 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
>                 __bpf_unreachable();
>
>         /*
> -        * Provide a hard guarantee that LLVM won't optimize setting r2 (map
> -        * pointer) and r3 (constant map index) from _different paths_ ending
> +        * Provide a hard guarantee that the compiler won't optimize setting r2
> +        * (map pointer) and r3 (constant map index) from _different paths_ ending
>          * up at the _same_ call insn as otherwise we won't be able to use the
>          * jmpq/nopl retpoline-free patching by the x86-64 JIT in the kernel
>          * given they mismatch. See also d2e4c1e6c294 ("bpf: Constant map key
> @@ -148,8 +148,8 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
>          *
>          * Note on clobber list: we need to stay in-line with BPF calling
>          * convention, so even if we don't end up using r0, r4, r5, we need
> -        * to mark them as clobber so that LLVM doesn't end up using them
> -        * before / after the call.
> +        * to mark them as clobber so that the compiler doesn't end up using
> +        * them before / after the call.
>          */
>         asm volatile("r1 = %[ctx]\n\t"
>                      "r2 = %[map]\n\t"

will this compile as is on GCC-BPF? I'm trying to understand what's
the point. Once GCC supports this ASM syntax we can add similar check
to __clang_major__, instead of allowing it for all GCC versions?

We must have done __clang_major__ check for a reason, old Clangs
probably had some problems compiling this. Maybe Daniel remembers?

> --
> 2.34.1
>
