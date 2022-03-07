Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373477C
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 19:25:29 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id e8so21988987ljj.2
        for <llvm@lists.linux.dev>; Mon, 07 Mar 2022 11:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zde+bArhl6iHnfeDcrHDIvktUnraUGyUCuxigU/BOkY=;
        b=KhRk/1V7uwjfSpHh19Rrs/JpqMPgVDx+fFU9lWjxPiYuzbX/u4MIPZigCcKkR1w/Fi
         OkkTbXKKY+Wx/7SApjnQ59ozRVWfXnYGQXwuJN4mx22VG83lFlUNPxQXTZkMY3PbMjk6
         uSqe2Jm0pS2Qd6/sCTdLQLOxKcBqeGyA11xvCbmB7EmfWUXR3TbIzBcWxB2baiQJ3nye
         MjQGpqxjvGM8ThoYzduO3f/qsZ1DmcDQi5tbsvtYsPZsXiIt3Gq2yCnYzPFgySyIghbR
         MPIFy4hOZ/qulEQcCjpRD//grvSJDtA8JmwssrL5h1qYrwK61j4vYSTWXT4009RI9grG
         9laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zde+bArhl6iHnfeDcrHDIvktUnraUGyUCuxigU/BOkY=;
        b=59ZoP4L7bX4i0HwOrn9JN3fyX5VvIdHmmZlE805GSF4fPKsS7Q403x+jUR4vk9g1Vr
         /7yiUL2jaoMXmyK5mBs0nxpYYvdXhHmKpmHWNb0+MeFkePccppfDxwe+eR0BiC6ai/lM
         urwt9AnlgEg6kHcYDLaW7WHgPsm40MQeSTIOU37cEuECDBI3PZoaqENDmhDj9fIz05f+
         aZD1hBQbK6fKo9e5dTbTRfkwzl2NAdFNA3OFdFzf+y/k3fOB4oj/68FflKIGw0QEZEA2
         UPaHzFg3evyqAIUKCpL0FLTBU4PjHfzU5mPdJkVngaGAsP51LSNwvnf2IMxDojj/zCsT
         8dfQ==
X-Gm-Message-State: AOAM532nbXlJNyeqFAXGpqeDJJBTPl1knBMnMhKDHvU9d7S5WC6co3sy
	rniVh8Nj+Oj9Cegoch8atSNfbQrAEuazfUypOHdmCw==
X-Google-Smtp-Source: ABdhPJwNfCjyiif9DMrdPtATO6xJkrKid3s/RoxeqvVrxuHQFLXwY58EUFhAM8dhqrn7AT08/Q6wAXy+HzCq3lENTVI=
X-Received: by 2002:a2e:bf24:0:b0:246:801e:39d3 with SMTP id
 c36-20020a2ebf24000000b00246801e39d3mr8338955ljr.472.1646681127052; Mon, 07
 Mar 2022 11:25:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220304224645.3677453-1-memxor@gmail.com> <20220304224645.3677453-6-memxor@gmail.com>
In-Reply-To: <20220304224645.3677453-6-memxor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Mar 2022 11:25:15 -0800
Message-ID: <CAKwvOdnEyvjZn14WAPyL1O=S9C-LGx7aB3fYc7TAbgngfcXM5A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 5/8] compiler-clang.h: Add __diag
 infrastructure for clang
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <kafai@fb.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 2:47 PM Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
>
> From: Nathan Chancellor <nathan@kernel.org>
>
> Add __diag macros similar to those in compiler-gcc.h, so that warnings
> that need to be adjusted for specific cases but not globally can be
> ignored when building with clang.
>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> [ Kartikeya: wrote commit message ]
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> ---
>  include/linux/compiler-clang.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index 3c4de9b6c6e3..f1aa41d520bd 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h

The equivalent functionality for GCC has
357 #ifndef __diag_GCC
358 #define __diag_GCC(version, severity, string)
359 #endif
in include/linux/compiler_types.h. Should this patch as well? (at
least #define __diag_clang`)?

> @@ -68,3 +68,25 @@
>
>  #define __nocfi                __attribute__((__no_sanitize__("cfi")))
>  #define __cficanonical __attribute__((__cfi_canonical_jump_table__))
> +
> +/*
> + * Turn individual warnings and errors on and off locally, depending
> + * on version.
> + */
> +#define __diag_clang(version, severity, s) \
> +       __diag_clang_ ## version(__diag_clang_ ## severity s)
> +
> +/* Severity used in pragma directives */
> +#define __diag_clang_ignore    ignored
> +#define __diag_clang_warn      warning
> +#define __diag_clang_error     error

These severities match GCC. I wonder if rather than copy+pasting these
over, we could rework __diag_ignore, __diag_warn, and __diag_error to
not invoke a compiler-suffixed macro and rather pass the compiler
along (or make it implicit since we know CONFIG_CC_IS_CLANG vs
CONFIG_CC_IS_GCC)?  We can probably land this than follow up on better
code-reuse between compilers for diagnostics.

> +
> +#define __diag_str1(s)         #s
> +#define __diag_str(s)          __diag_str1(s)
> +#define __diag(s)              _Pragma(__diag_str(clang diagnostic s))
> +
> +#if CONFIG_CLANG_VERSION >= 110000
> +#define __diag_clang_11(s)     __diag(s)
> +#else
> +#define __diag_clang_11(s)
> +#endif
> --
> 2.35.1
>


-- 
Thanks,
~Nick Desaulniers
