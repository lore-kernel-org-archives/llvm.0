Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA24681
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 23:58:02 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id y4so12094790edc.4
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 16:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6kOF9ybsqwFX6mTO6CV+Qd7vFqdfVbEYU2B1uCo+UI=;
        b=PUGqdUz2XBi/hoETOt9MNansUS5odlUoQ53Ddz9MSLCFPaO4XyTqDRREzySVVXyChF
         3rhAuNyqBbyQk0LS9CtMzbE5esKAOGEdgLQGIPsORt3HjETfe4eLnwIsL23O8Oq4BwO0
         /MqIo8X3ShzDMZEIJhtUiWSXO6BI0H0mk9+o1/NocDFdxQ1odZhoUo7NfvK6rq8Zrckk
         tn8kxXMHrXbAIkv2Z6H2VzM/aELxboErzv13pN22SkyMUv5MgUH3ku7HXCUVr6ArYGIn
         FfJnBre5Tj6ctzuLymj36wuhLIkEZTmI9Oj11lC4ZFi5O901TrK6eb5XGCOgFD3/Quko
         pGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6kOF9ybsqwFX6mTO6CV+Qd7vFqdfVbEYU2B1uCo+UI=;
        b=kYJ5HLH4Z9Il4+y+kqaLLjnn+rjj5RkabY8J1tCtaHVL9BNNU3wxDg3Ym0sRnE5+U+
         AEYPCWqIFXEgUJHJNl8MgbYHk8daaHpkrC2gbwRY9fmSBV3m5XlNVF9klkeq1uXCWz1s
         B9aafzYzV/kZi87Yo0oQa1BJ3iVpyK6TDTwWJeDdorJiMSTD3/3z1qxlQoacazx3ik+g
         s5e5Tap+A83xoc1ZRbuwfHhRFCb9jagAIhP7csehRM3qYGCS++OOtPpjZ/7G3gXTyOBk
         Ar6fpuYdBCEqoeKGDHEV4WSxwKxceqji02PE0SDDJbSBWQncOUJQyYoFNm15I055Svru
         H2ww==
X-Gm-Message-State: AJIora8BJ3bIkNf6Ji0119W16pOTKC0QPAvJzxNrlNYL4mDG1vwYuQX7
	Y55W4XLSsa6q4bgW0i5Bs4k4wbsBWOpt7cMPBGg=
X-Google-Smtp-Source: AGRyM1vb0MUfN7pB8pUEEkY9Q8qu4d/6nvM78xRW0j65k95gqo4a7e7tPgSI7/iDmjiHZy1MF7rsgKRpEPJ6g0ZgHzg=
X-Received: by 2002:a05:6402:350c:b0:43a:e25f:d73 with SMTP id
 b12-20020a056402350c00b0043ae25f0d73mr997893edd.66.1657670280481; Tue, 12 Jul
 2022 16:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220712232556.248863-1-james.hilliard1@gmail.com>
In-Reply-To: <20220712232556.248863-1-james.hilliard1@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 12 Jul 2022 16:57:49 -0700
Message-ID: <CAADnVQKnvChdGiq80bUK0U6xaWqzUVRdzgShA4a06fBZ5EjVMw@mail.gmail.com>
Subject: Re: [PATCH v3] bpf/scripts: Generate GCC compatible helpers
To: James Hilliard <james.hilliard1@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 4:26 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> The current bpf_helper_defs.h helpers are llvm specific and don't work
> correctly with gcc.
>
> GCC appears to required kernel helper funcs to have the following
> attribute set: __attribute__((kernel_helper(NUM)))
>
> Generate gcc compatible headers based on the format in bpf-helpers.h.
>
> This generates GCC/Clang compatible helpers, for example:
>         /* Helper macro for GCC/Clang compatibility */
>         #define NOARG
>         #if __GNUC__ && !__clang__
>         #define BPF_HELPER_DEF(num, ret_star, ret_type, name, ...) \
>         ret_type ret_star name(__VA_ARGS__) __attribute__((kernel_helper(num)));
>         #else
>         #define BPF_HELPER_DEF(num, ret_star, ret_type, name, ...) \
>         static ret_type ret_star(*name)(__VA_ARGS__) = (void *) num;
>         #endif
>
>         BPF_HELPER_DEF(1, *, void, bpf_map_lookup_elem, void *map, const void *key)
>
>         BPF_HELPER_DEF(2, NOARG, long, bpf_map_update_elem, void *map, const void *key, const void *value, __u64 flags)
>
> See:
> https://github.com/gcc-mirror/gcc/blob/releases/gcc-12.1.0/gcc/config/bpf/bpf-helpers.h#L24-L27
>
> This fixes the following build error:
> error: indirect call in function, which are not supported by eBPF
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - use a conditional helper macro
> Changes v1 -> v2:
>   - more details in commit log
> ---
>  scripts/bpf_doc.py | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/bpf_doc.py b/scripts/bpf_doc.py
> index a0ec321469bd..45f51ff1318c 100755
> --- a/scripts/bpf_doc.py
> +++ b/scripts/bpf_doc.py
> @@ -717,6 +717,16 @@ class PrinterHelpers(Printer):
>          header = '''\
>  /* This is auto-generated file. See bpf_doc.py for details. */
>
> +/* Helper macro for GCC/Clang compatibility */
> +#define NOARG
> +#if __GNUC__ && !__clang__
> +#define BPF_HELPER_DEF(num, ret_star, ret_type, name, ...) \\
> +ret_type ret_star name(__VA_ARGS__) __attribute__((kernel_helper(num)));
> +#else
> +#define BPF_HELPER_DEF(num, ret_star, ret_type, name, ...) \\
> +static ret_type ret_star(*name)(__VA_ARGS__) = (void *) num;
> +#endif

Nack for the reasons stated earlier.
