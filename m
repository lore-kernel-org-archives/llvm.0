Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA077F
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 06:44:42 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id b21so7670839plz.7
        for <llvm@lists.linux.dev>; Sun, 11 Sep 2022 23:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=iMAohkJ88LxPurHRb39tNyriHTx3rqUB1Dm6C5Di/RA=;
        b=KsJQE4+zfarttwkbFAzYmt7ml/SOEiKUuWOf5ARCFNvOn0IPSNTH99aNooJUlFrOUF
         dDxOb5LQMyNogfonNrQ22Q1fhwTDkWYvAJ7swpSuaLvTYQIzk/oyOVVG/St0kqu+TXry
         SqpXG3DMZf/Bg6fcXtjDh2Hm/dY4yUZx2uP6KfeOb62EgkxHpd3qABqK2QUoKoe7Ypvo
         QTWYUxCjlQvMV40Sh4+nzTgTLLu9gCy1MN4HimvkNFwtyE+F/I5kioq2JsxI1TUNn9kB
         9Pp1mKYDv3uUBJjbjV7vqlT/PFU3kH9c+L7tDVBt8/EnmRdCVFCZSCRd/8N03atWEH3+
         91Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=iMAohkJ88LxPurHRb39tNyriHTx3rqUB1Dm6C5Di/RA=;
        b=HZou78dyYpXSlovlEqHvUvUvsbTa8YBC6IwGg/F4WmvkAZj4VQfkLTnMiIID2FUvgN
         d7gZj8ma66nOPG428I5LB1uaMdy5g+KKnMyZYyC0rHFL15RXHCqA2CsNa8JMo88q/anG
         dM8uXLQouRuDs6dVSKuDfqn/k3VpD/sCs75PYMjmRdmnDu9DcB71lG0dic0yBXKyABKS
         vimZf01qS0kfUhUXxb11hRmxMxU/1b9E8G+yFAj0Qg9YjQzmvP+zxyhdb7IHjq6By3TW
         smQS6s6o3dWC8xR8as7bizs90cWvWOhAdv1cWYnSN9v3n2y61OGB8UsomC69gYAV2R9D
         4dbw==
X-Gm-Message-State: ACgBeo3T43CIc4Ef4VYuMsvLX5sACYQM7pYBZkfrJVpmGqKmFqJjJeOb
	UnzWbk8hUcZEojf9itEMV3J1jf5u8I9vEaCZloI=
X-Google-Smtp-Source: AA6agR771WKf4PnOUJygezxSfXmS0OkGPyK3n16p+7DKRc70kqw2E01+3HkWhEdpa3WfArHUBGHlMZlOvM6ni+ezm8s=
X-Received: by 2002:a17:902:f394:b0:176:b7b7:2 with SMTP id
 f20-20020a170902f39400b00176b7b70002mr25269655ple.57.1662965081460; Sun, 11
 Sep 2022 23:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909224544.3702931-1-james.hilliard1@gmail.com> <CAEf4Bzbm_wq=n8+ve95aBtJkK-WcsUmKM_LT57XU0D9zS9gXuQ@mail.gmail.com>
In-Reply-To: <CAEf4Bzbm_wq=n8+ve95aBtJkK-WcsUmKM_LT57XU0D9zS9gXuQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Sep 2022 00:44:28 -0600
Message-ID: <CADvTj4oF7Khci-w8LZPWvOjhKEepd-qG0evZ2_OorU=H2wtpaA@mail.gmail.com>
Subject: Re: [PATCH] libbpf: define bpf_tail_call_static when __clang__ is not defined
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 9, 2022 at 6:26 PM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Sep 9, 2022 at 3:46 PM James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > The bpf_tail_call_static function is currently not defined unless
> > using clang >= 8.
> >
> > To support bpf_tail_call_static on GCC we can check if __clang__ is
> > not defined to enable bpf_tail_call_static.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> > ---
> >  tools/lib/bpf/bpf_helpers.h | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
> > index 7349b16b8e2f..30fc95e7cd76 100644
> > --- a/tools/lib/bpf/bpf_helpers.h
> > +++ b/tools/lib/bpf/bpf_helpers.h
> > @@ -131,7 +131,7 @@
> >  /*
> >   * Helper function to perform a tail call with a constant/immediate map slot.
> >   */
> > -#if __clang_major__ >= 8 && defined(__bpf__)
> > +#if (!defined(__clang__) || __clang_major__ >= 8) && defined(__bpf__)
> >  static __always_inline void
> >  bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
> >  {
> > @@ -139,8 +139,8 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
> >                 __bpf_unreachable();
> >
> >         /*
> > -        * Provide a hard guarantee that LLVM won't optimize setting r2 (map
> > -        * pointer) and r3 (constant map index) from _different paths_ ending
> > +        * Provide a hard guarantee that the compiler won't optimize setting r2
> > +        * (map pointer) and r3 (constant map index) from _different paths_ ending
> >          * up at the _same_ call insn as otherwise we won't be able to use the
> >          * jmpq/nopl retpoline-free patching by the x86-64 JIT in the kernel
> >          * given they mismatch. See also d2e4c1e6c294 ("bpf: Constant map key
> > @@ -148,8 +148,8 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
> >          *
> >          * Note on clobber list: we need to stay in-line with BPF calling
> >          * convention, so even if we don't end up using r0, r4, r5, we need
> > -        * to mark them as clobber so that LLVM doesn't end up using them
> > -        * before / after the call.
> > +        * to mark them as clobber so that the compiler doesn't end up using
> > +        * them before / after the call.
> >          */
> >         asm volatile("r1 = %[ctx]\n\t"
> >                      "r2 = %[map]\n\t"
>
> will this compile as is on GCC-BPF? I'm trying to understand what's
> the point. Once GCC supports this ASM syntax we can add similar check
> to __clang_major__, instead of allowing it for all GCC versions?

So, it's a bit different since the ASM syntax issue is more of an
issue with GAS,
we would need a check along these lines I think for a proper migration path:
https://lore.kernel.org/bpf/20220912063514.2824432-1-james.hilliard1@gmail.com/

We would set something like once GAS support for the llvm syntax is added:
.ifdef .gasversion. < 24000

I don't think we can do a compiler version check here like with llvm since GCC
release cycles are out of sync with GAS(llvm assembler is kept in sync with the
compiler AFAIU).

>
> We must have done __clang_major__ check for a reason, old Clangs
> probably had some problems compiling this. Maybe Daniel remembers?
>
> > --
> > 2.34.1
> >
