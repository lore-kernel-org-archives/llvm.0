Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F004C6C
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:32:52 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id e68so9887533pfe.1
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Tkfw5cCaQftuIzsthOvhCIrnxS5AAOLFSUhqXR3scw8=;
        b=eFKJnvcPQiR4trZGgwG7tM3ANGpPowv+NfSx2EyCZ9IcJAjbofgpmT93kt6Xan2JEZ
         H7WE4NgEhzxYGTlk8HEfOqiTWFjmG7ScnNTKhBnq+Pg9esEjcFZRtfxDC94e6OYbPGPl
         Z1A89yxYPH3eJpkS450xq3Y4CfEaSeaQL7QXGyOVpJJnJmNg0lsLDWwjVowotI4/39LR
         VD38dKZ1WTCLwh2odnWJgu+QgbEIJ06PsMyFeAeoWgXLOlLC/AxemXQVqD37Rq1t9o4C
         m+v2xu/XqJsJt+oeKvtKMv6rHDH7QXMbyUboEZLQtDC7YIUhMiKgcYFZbjD4KBMSuZaD
         1XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Tkfw5cCaQftuIzsthOvhCIrnxS5AAOLFSUhqXR3scw8=;
        b=q5WbjZ45N7V7qGUbxhXJBD6+QVsKA4nPIClWv/WtKfvcf1YTwFxUqXihWkTcxCbApS
         +xjPYksX2SR7JnjdZ0uMzMW5Mt8DRH1AQYPATq8gq33R0YGsrYMUiLwdBL55kfKU0XR0
         sWPZJzyHSMcr8QxDprLiLgg0y970xmWj6NJU2voDB848cWUhSOm38LC+vL/jXFM+hZcO
         3J09n/BY+6FwXTwAnJ1GEnohKV3gILZm7JNr5lNDKtHVFTP3hTWrqSp/7priPayLOEQp
         sod0UCcBgN00JCGd/F9qHBbXxseKwzR2cq21c5imPqFy6AnVI/38tccsD/WYiXJPX1C5
         j0aw==
X-Gm-Message-State: ACgBeo35Lf4nX7we2hog4T9VSIswVVPy9P1yXU02MBG2MfFXAt77mMWZ
	hcqXi9GzDQ5sX6nkMI7XKwLMRX2R8TJwobKuywE=
X-Google-Smtp-Source: AA6agR4cdqF2QujfbT0SQmq6doLoGJWlaphE5i3UxSTL5QLugnm803AdvfGWOIE2/bxRAyQARPTjTum7iqfzbW7pYa8=
X-Received: by 2002:a05:6a00:1390:b0:540:b6b6:e978 with SMTP id
 t16-20020a056a00139000b00540b6b6e978mr22011617pfg.8.1663018372050; Mon, 12
 Sep 2022 14:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912063514.2824432-1-james.hilliard1@gmail.com> <7cb9ebd2-5ee1-f00e-5d8e-0fe454f975a0@fb.com>
In-Reply-To: <7cb9ebd2-5ee1-f00e-5d8e-0fe454f975a0@fb.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Sep 2022 15:32:39 -0600
Message-ID: <CADvTj4p804CMs_1J15Zd=h7+X89ZUO8Mq9fkKvqr-+MmKwkApA@mail.gmail.com>
Subject: Re: [PATCH v2] libbpf: define bpf_tail_call_static when __clang__ is
 not defined
To: Yonghong Song <yhs@fb.com>
Cc: bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 12, 2022 at 11:29 AM Yonghong Song <yhs@fb.com> wrote:
>
>
>
> On 9/12/22 7:35 AM, James Hilliard wrote:
> > The bpf_tail_call_static function is currently not defined unless
> > using clang >= 8.
> >
> > To support bpf_tail_call_static on GAS we can check if __clang__ is
> > not defined to enable bpf_tail_call_static.
> >
> > We need to use a GAS assembly syntax check so that the assembler
> > is provided GAS compatible assembly as well.
> >
> > We can use gasversion to provide a migration path to llvm syntax
> > for GAS once llvm syntax is natively supported.
>
> I didn't see a gasversion comparison in asm code.
> Is it possible that we compare gasversion to a known
> gas version which supports new syntax? If the gasversion
> is supported, use the same syntax as llvm. If the
> gasversion is not supported, output an illegal insn
> and it would be even better if some error information
> is printed out on the screen.

Yeah, once llvm syntax is supported in GAS the check would simply
need to be changed to something like:
.if .gasversion. < 24000

At least this seems to me to be the best way to provide a migration
path as we can't really check assembler versions from the compiler
like we can with llvm.

>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> > ---
> > Changes v1 -> v2:
> >    - use gasversion to detect assembly variant
> > ---
> >   tools/lib/bpf/bpf_helpers.h | 18 ++++++++++++------
> >   1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
> > index 7349b16b8e2f..5b98f5506798 100644
> > --- a/tools/lib/bpf/bpf_helpers.h
> > +++ b/tools/lib/bpf/bpf_helpers.h
> > @@ -131,7 +131,7 @@
> >   /*
> >    * Helper function to perform a tail call with a constant/immediate map slot.
> >    */
> > -#if __clang_major__ >= 8 && defined(__bpf__)
> > +#if (!defined(__clang__) || __clang_major__ >= 8) && defined(__bpf__)
> >   static __always_inline void
> >   bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
> >   {
> > @@ -139,8 +139,8 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
> >               __bpf_unreachable();
> >
> >       /*
> > -      * Provide a hard guarantee that LLVM won't optimize setting r2 (map
> > -      * pointer) and r3 (constant map index) from _different paths_ ending
> > +      * Provide a hard guarantee that the compiler won't optimize setting r2
> > +      * (map pointer) and r3 (constant map index) from _different paths_ ending
> >        * up at the _same_ call insn as otherwise we won't be able to use the
> >        * jmpq/nopl retpoline-free patching by the x86-64 JIT in the kernel
> >        * given they mismatch. See also d2e4c1e6c294 ("bpf: Constant map key
> > @@ -148,12 +148,18 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
> >        *
> >        * Note on clobber list: we need to stay in-line with BPF calling
> >        * convention, so even if we don't end up using r0, r4, r5, we need
> > -      * to mark them as clobber so that LLVM doesn't end up using them
> > -      * before / after the call.
> > +      * to mark them as clobber so that the compiler doesn't end up using
> > +      * them before / after the call.
> >        */
> > -     asm volatile("r1 = %[ctx]\n\t"
> > +     asm volatile(".ifdef .gasversion.\n\t"
> > +                  "mov %%r1,%[ctx]\n\t"
> > +                  "mov %%r2,%[map]\n\t"
> > +                  "mov %%r3,%[slot]\n\t"
> > +                  ".else\n\t"
> > +                  "r1 = %[ctx]\n\t"
> >                    "r2 = %[map]\n\t"
> >                    "r3 = %[slot]\n\t"
> > +                  ".endif\n\t"
> >                    "call 12"
> >                    :: [ctx]"r"(ctx), [map]"r"(map), [slot]"i"(slot)
> >                    : "r0", "r1", "r2", "r3", "r4", "r5");
