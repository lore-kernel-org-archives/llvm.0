Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A615A0
	for <llvm@lists.linux.dev>; Sat,  3 Dec 2022 00:24:10 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id n20so15158981ejh.0
        for <llvm@lists.linux.dev>; Fri, 02 Dec 2022 16:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2loMqsiSWHn8Spuu+M+LHawRFTbsBo2tswnPTtpYUgE=;
        b=oEOyOdmw9oXfAXVgrnKHoZpyVBKl25HYQWqdZuGfQDFG7N0K8/urjETgEQQ8/B7kAQ
         WwJ+6Y7kS9fyqQLSNl+d4gMnoiuLAdvYPib8d2LjV6Xl2oBEvGFy6SJC8xb4dOL4lusb
         YQoA1tvWXqOOOnx9DMvoZo1MZRwupg/1B1l55TpQgwWEa+9eOMOgORJr3kHgGAgZzbUj
         DI/QC+rpDzE/MZdTnsG2KSLHgn4CxuT3LMK17YMZiAaLw5++zQLWKDxDwROT0DaQoGMY
         D0g3ItYXXtLKg36vbgcF8wIXr/QVDsXDSDOCNLWC95JSyJc193kG/zXPEcLH2eG2WXk1
         8ySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2loMqsiSWHn8Spuu+M+LHawRFTbsBo2tswnPTtpYUgE=;
        b=cuJTR82iJMw4INnbkARtfE0sRlZM/XW7OENcgKw8JZWf70vjKJJCzwTPpKY25NxgVz
         7UuyY9YPL8C2i8WK+39VrYPrkD7Sp+/k4xNBw4apRVAMg9LDG3TyVX7YU2BMlmzmxyzG
         GynhiNmPOxeLwXw5CpQa/pOwEHSko+WxhQQvA+rcKrxBQQnIJ4mxdUn0VpPMUCBCSD2q
         xQH7uoFdd9OZops2KF41AHC1GbK0t1pQj1StDy8Xwj6wLEPd2eLp+otsS94zVc3haScx
         pGnXGad0Um14PGffA6Hez8LeZvwRunlg4he7K4k6x4vhiGL+j4z3zVi+FI5gIwJIDAfN
         d+Tw==
X-Gm-Message-State: ANoB5pmn/JRUmnEb8KaJ0U6ck9OqWD2fkI1PipjyivlaG2mwc9+8hnvN
	HNTOfY64zV/qSFMMSKqtsWxSzLvtnAsD6lisHno=
X-Google-Smtp-Source: AA0mqf7MkmI6dUUsU+TjHt/xRpAIK7q5M76t3VO2Jxz169ZnhRM1BefPvXBatpjSkL0fm2OIScX9tO8uN5mxAVM1wqY=
X-Received: by 2002:a17:907:80cd:b0:7bb:35b4:777d with SMTP id
 io13-20020a17090780cd00b007bb35b4777dmr4471082ejc.302.1670027048471; Fri, 02
 Dec 2022 16:24:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221201190939.3230513-1-james.hilliard1@gmail.com>
In-Reply-To: <20221201190939.3230513-1-james.hilliard1@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 2 Dec 2022 16:23:56 -0800
Message-ID: <CAEf4BzYrT1VGj43A3Xg60cSMSX658iL2+yp8a5Xk=8Ez3sj_Ew@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: add GCC compatible builtins to bpf_legacy.h
To: James Hilliard <james.hilliard1@gmail.com>
Cc: bpf@vger.kernel.org, "Jose E . Marchesi" <jose.marchesi@oracle.com>, 
	David Faust <david.faust@oracle.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 1, 2022 at 11:10 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> The bpf_legacy.h header uses llvm specific load functions, add
> GCC compatible variants as well to fix tests using these functions
> under GCC.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Cc: Jose E. Marchesi <jose.marchesi@oracle.com>
> Cc: David Faust <david.faust@oracle.com>
> ---

Please use [PATCH bpf-next] prefix to target patches for bpf-next
tree. This helps some of our automation.

>  tools/testing/selftests/bpf/bpf_legacy.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/bpf_legacy.h b/tools/testing/selftests/bpf/bpf_legacy.h
> index 845209581440..256c2a90aa20 100644
> --- a/tools/testing/selftests/bpf/bpf_legacy.h
> +++ b/tools/testing/selftests/bpf/bpf_legacy.h
> @@ -2,6 +2,15 @@
>  #ifndef __BPF_LEGACY__
>  #define __BPF_LEGACY__
>
> +#if __GNUC__ && !__clang__
> +/* Functions to emit BPF_LD_ABS and BPF_LD_IND instructions.  We
> + * provide the "standard" names as synonyms of the corresponding GCC
> + * builtins.  Note how the SKB argument is ignored.
> + */
> +#define load_byte(skb,off) __builtin_bpf_load_byte((off))
> +#define load_half(skb,off) __builtin_bpf_load_half((off))
> +#define load_word(skb,off) __builtin_bpf_load_word((off))

added space between skb, and off. And we don't need those extra ()
around off, right? I stripped them away, but let me know if that's
wrong.

> +#else
>  /* llvm builtin functions that eBPF C program may use to
>   * emit BPF_LD_ABS and BPF_LD_IND instructions
>   */
> @@ -11,6 +20,7 @@ unsigned long long load_half(void *skb,
>                              unsigned long long off) asm("llvm.bpf.load.half");
>  unsigned long long load_word(void *skb,
>                              unsigned long long off) asm("llvm.bpf.load.word");
> +#endif
>
>  #endif
>
> --
> 2.34.1
>
