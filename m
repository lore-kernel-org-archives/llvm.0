Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7D84A0C
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 19:11:49 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so5269205pjr.4
        for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 12:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6WniWrj3ZgV51g7LWc0uoxvElrFWWSWmqIiBeCx0TGA=;
        b=ftc2b3pp6VR3l1NA92GZ1N4vRKA+MEjmtdqoxsl3Ilze+gmL3NDB39Xm1aCUdHFAve
         ViqgNdDyRFizVooQRLgGQH4tRCDVbf4YL5Uh6mby/MBunMDDoadRWmyj+YL3qrHF0ypW
         MkAabV2guUnjUXJVxtpso92ITWK0U905ay0RjCxncmkv0mJM8tDNb4SXV8BKG4ELjF+V
         lgFX2eOjqFWohepJI+Jle2fvaTfUeWje32HNTboIhc2w6V2+2S5ky6HHrX0eWNVnaMfo
         UpJP2oGxGfI7HhWKRl9gQIMdw38F9HGZxfy6d326Dhx08QkiR6O7njqSDrStBulkTbw+
         NdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6WniWrj3ZgV51g7LWc0uoxvElrFWWSWmqIiBeCx0TGA=;
        b=lCxZQDFdqLufjy9yTFkNDt1BohcC1+/+R2Sc9J1mynZOPuH4o8lxah7yFH+2t0xggO
         QfovaYzEY7ofk/BMNmFb0UMPmR70iQ0Mm61t6bhuul50J0mgrAIkATzHp3WSbUIB182R
         WWH94CR3KA68fytgpYLqRH2hgvWX5Lb3Jg2550vq+HhZDUbVWS7yKqeTFeZdDH9ZQsue
         LuEhsXzLtJBIWN56VDqlPBOh+TOXQJL/5jw0VkfL1gKlQZ5pxZlPzaC0kTJE0Fmpdioc
         Mamb1XIZGyWAuglWlKNL2XqGSOaE2vSViU0I2wxlcek/2V6BkDysiz0snfIRVT/eCpNK
         SkmA==
X-Gm-Message-State: AJIora/g5IVREAcp4C05ZaqCze14Nu0nvhW0P8j3kOaBXRNP9eSoxtKD
	oaJ7d6fVg4uUSWChhFl5iyywQywlcRoKGU386+CBVRpROa5k5qpQ
X-Google-Smtp-Source: AGRyM1s7h95SkBhPctIM6Jk4WHc6HW94JZP5f9ql2cZvctg5a76kUb6rS1bFK6/zTvkzmwLovIkP/1ZWeMRAm34h4vI=
X-Received: by 2002:a17:903:244d:b0:16c:5bfe:2e87 with SMTP id
 l13-20020a170903244d00b0016c5bfe2e87mr4671742pls.148.1657739509327; Wed, 13
 Jul 2022 12:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713173503.3889486-1-nathan@kernel.org>
In-Reply-To: <20220713173503.3889486-1-nathan@kernel.org>
From: Stanislav Fomichev <sdf@google.com>
Date: Wed, 13 Jul 2022 12:11:38 -0700
Message-ID: <CAKH8qBsTJcipS65962_hTLhpqzv42YWQpXntVkkt4RhCYubT7g@mail.gmail.com>
Subject: Re: [PATCH] bpf, arm64: Mark dummy_tramp as global
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Zi Shen Lim <zlim.lnx@gmail.com>, 
	Xu Kuohai <xukuohai@huawei.com>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 13, 2022 at 10:35 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building with clang + CONFIG_CFI_CLANG=y, the following error
> occurs at link time:
>
>   ld.lld: error: undefined symbol: dummy_tramp
>
> dummy_tramp is declared globally in C but its definition in inline
> assembly does not use .global, which prevents clang from properly
> resolving the references to it when creating the CFI jump tables.
>
> Mark dummy_tramp as global so that the reference can be properly
> resolved.
>
> Fixes: b2ad54e1533e ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1661
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Stanislav Fomichev <sdf@google.com>

> ---
>  arch/arm64/net/bpf_jit_comp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index fd1cb0d2aaa6..dcc572b7d4da 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -604,6 +604,7 @@ void dummy_tramp(void);
>
>  asm (
>  "      .pushsection .text, \"ax\", @progbits\n"
> +"      .global dummy_tramp\n"
>  "      .type dummy_tramp, %function\n"
>  "dummy_tramp:"
>  #if IS_ENABLED(CONFIG_ARM64_BTI_KERNEL)
>
> base-commit: ace2bee839e08df324cb320763258dfd72e6120e
> --
> 2.37.1
>
