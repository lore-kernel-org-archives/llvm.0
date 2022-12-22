Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A27489
	for <llvm@lists.linux.dev>; Thu, 22 Dec 2022 19:26:32 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id d127so1398391oif.12
        for <llvm@lists.linux.dev>; Thu, 22 Dec 2022 11:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wdklLwRgDRkzPNV6+5/1UdhLO1Kvxm/ejMesCIAlv/c=;
        b=WvgnAcQFDO6cFySsaGkTJhSs9Rs5QXjcX0RozxEKMx7S2BCsTT8QTR98jl8y0Cdwow
         6IhSkZlEBHwaJNQDLYw/XTA6Lj4hHEsHW5LZGWfGZVsGClL7byHOJViJ1Ij998bIuGQ9
         VfEZgMNniWaeH35i5e6p7mQz7KEcX6t+luWNCYWBpVx5ivzg8EFYfjGTYFvMiAN7MyMW
         xYEUpw7A/AhmzeHCsRbvw02OxEq2cLep74TrgQ/L6tsHN40SlalJX7L9xmW/6C9lkTw6
         pCJRc1n71y6UyS3O5VRh1qGx9KJ2qF2MhjqpRqTd5GC3O2RS+twy7ZvqNlOqz2mq0IuK
         15Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdklLwRgDRkzPNV6+5/1UdhLO1Kvxm/ejMesCIAlv/c=;
        b=yvjV8D02CBDtabmcwj2dXqh8iLTGRlicGN4J4GnzXovzkstAPwYMr3rqza2AgS9REJ
         shM/VquNPjNRLWYFxdmvL3UGI8W78dq48oqcCauKf/bRpGH+/Fs/cuMUDEBJhNMcEI3t
         /oZGeAIVDqprRXgJGVVedFA2l9R4TayOScJUIMGHgrlAd+SAm2K4iCkKBa/LDFDgpWEI
         ZoI7WZlvy7fBFpG+nPS1CZhZohlmIECKV4TySFnwWu7YKt3goRrPs4bX93MGX3pu3IVf
         ocB+L10V7zRk64COGPfj1Q61UGIXFoeYzVxiivnpOAgYEcroovbyNDF0wGM/piJDKCPJ
         WelQ==
X-Gm-Message-State: AFqh2koRxG2+bpUnzsgHyICpfvKPRB5z6WB6fUU0RsG7hoArH3BIgOs2
	RDPPkSHZbRXz3APSI86olSD8yM3v3uP8AIUTBc4=
X-Google-Smtp-Source: AMrXdXtYOTjMHpZ8OgM9CEWHZZfrUkMI6Bm0FgM4J7X2aakypO/gINZxDCHVUBqtBYcloXvKrBrQRssv1cucUcBeD40=
X-Received: by 2002:a05:6808:1649:b0:361:e2d:1f52 with SMTP id
 az9-20020a056808164900b003610e2d1f52mr162110oib.93.1671737191354; Thu, 22 Dec
 2022 11:26:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221055856.2786043-1-james.hilliard1@gmail.com> <CAEf4BzZFgOksVucYDq1ZzPWTBZV0zHtK0H4U0LVEtz19nzbpVg@mail.gmail.com>
In-Reply-To: <CAEf4BzZFgOksVucYDq1ZzPWTBZV0zHtK0H4U0LVEtz19nzbpVg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Dec 2022 12:26:20 -0700
Message-ID: <CADvTj4o4RvmjQrO4tjfUf0=Pw7teWmsR_toNSJjWivhD5ukK6g@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: move struct definitions out of
 function params
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 22, 2022 at 12:04 PM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Tue, Dec 20, 2022 at 9:59 PM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > Anonymous structs can't be declared inside function parameter
> > definitions in current c standards, however clang doesn't detect this
> > condition currently while GCC does.
> >
> > Details: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108189
> >
> > Fixes errors like:
> > progs/btf_dump_test_case_bitfields.c:85:7: error: anonymous struct declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
> >    85 | int f(struct {
> >       |       ^~~~~~
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../bpf/progs/btf_dump_test_case_bitfields.c  |  9 ++++--
> >  .../progs/btf_dump_test_case_namespacing.c    | 10 ++++---
> >  .../bpf/progs/btf_dump_test_case_packing.c    | 10 ++++---
> >  .../bpf/progs/btf_dump_test_case_padding.c    | 10 ++++---
> >  .../bpf/progs/btf_dump_test_case_syntax.c     | 30 +++++++++++++------
> >  5 files changed, 46 insertions(+), 23 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c
> > index e01690618e1e..c75f6bd06a49 100644
> > --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c
> > +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c
> > @@ -82,11 +82,16 @@ struct bitfield_flushed {
> >         long b: 16;
> >  };
> >
> > -int f(struct {
> > +/* ----- START-EXPECTED-OUTPUT ----- */
> > +struct root_struct {
>
> there is no need to make this struct part of expected output, just
> keep it next to f?

Seems to be required as the diff check fails otherwise.

>
>
> >         struct bitfields_only_mixed_types _1;
> >         struct bitfield_mixed_with_others _2;
> >         struct bitfield_flushed _3;
> > -} *_)
> > +};
> > +
> > +/* ------ END-EXPECTED-OUTPUT ------ */
> > +
> > +int f(struct root_struct *_)
> >  {
> >         return 0;
> >  }
> > diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c
> > index 92a4ad428710..d7cf2a8487c9 100644
> > --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c
> > +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c
> > @@ -49,9 +49,7 @@ typedef int Y;
> >
> >  typedef int Z;
> >
> > -/*------ END-EXPECTED-OUTPUT ------ */
> > -
> > -int f(struct {
> > +struct root_struct {
> >         struct S _1;
> >         S _2;
> >         union U _3;
> > @@ -67,7 +65,11 @@ int f(struct {
> >         X xx;
> >         Y yy;
> >         Z zz;
> > -} *_)
> > +};
>
> same, that struct is only to preserve all the referenced types, so
> keep it hidden from the output

I wasn't able to find a way to keep it out of the output.

The other tests with a root_struct seem to always have it in the output:
https://github.com/torvalds/linux/blob/v6.1/tools/testing/selftests/bpf/progs/btf_dump_test_case_multidim.c#L21-L28
https://github.com/torvalds/linux/blob/v6.1/tools/testing/selftests/bpf/progs/btf_dump_test_case_ordering.c#L50-L56
https://github.com/torvalds/linux/blob/v6.1/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c#L222-L237

>
> > +
> > +/*------ END-EXPECTED-OUTPUT ------ */
> > +
> > +int f(struct root_struct *_)
> >  {
> >         return 0;
> >  }
> > diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c
> > index 7998f27df7dd..e039ceb50c43 100644
> > --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c
> > +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c
> > @@ -132,9 +132,7 @@ struct outer_packed_struct {
> >         struct nested_packed_struct b;
> >  } __attribute__((packed));
> >
> > -/* ------ END-EXPECTED-OUTPUT ------ */
> > -
> > -int f(struct {
> > +struct root_struct {
> >         struct packed_trailing_space _1;
> >         struct non_packed_trailing_space _2;
> >         struct packed_fields _3;
> > @@ -147,7 +145,11 @@ int f(struct {
> >         struct usb_host_endpoint _10;
> >         struct outer_nonpacked_struct _11;
> >         struct outer_packed_struct _12;
> > -} *_)
> > +};
> > +
> > +/* ------ END-EXPECTED-OUTPUT ------ */
> > +
> > +int f(struct root_struct *_)
> >  {
> >         return 0;
> >  }
> > diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c
> > index 79276fbe454a..2ca46ad8d66a 100644
> > --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c
> > +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c
> > @@ -220,9 +220,7 @@ struct outer_mixed_but_unpacked {
> >         struct nested_packed b2;
> >  };
> >
> > -/* ------ END-EXPECTED-OUTPUT ------ */
> > -
> > -int f(struct {
> > +struct root_struct {
> >         struct padded_implicitly _1;
> >         struct padded_explicitly _2;
> >         struct padded_a_lot _3;
> > @@ -243,7 +241,11 @@ int f(struct {
> >         struct ib_wc _201;
> >         struct acpi_object_method _202;
> >         struct outer_mixed_but_unpacked _203;
> > -} *_)
> > +} __attribute__((packed));
> > +
> > +/* ------ END-EXPECTED-OUTPUT ------ */
> > +
> > +int f(struct root_struct *_)
> >  {
> >         return 0;
> >  }
> > diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c
> > index 26fffb02ed10..3e31df7cecc6 100644
> > --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c
> > +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c
> > @@ -104,24 +104,24 @@ typedef void (*printf_fn_t)(const char *, ...);
> >   *   typedef const fn_output_inner_t fn_ptr_arr2_t[5];
> >   */
> >  /* ----- START-EXPECTED-OUTPUT ----- */
> > -typedef char * const * (*fn_ptr2_t)(struct {
> > -       int a;
> > -}, int (*)(int));
> > +struct struct_a;
> > +
> > +typedef char * const * (*fn_ptr2_t)(struct struct_a, int (*)(int));
> > +
> > +struct struct_c;
> > +
> > +struct struct_h;
> >
> >  typedef struct {
> >         int a;
> > -       void (*b)(int, struct {
> > -               int c;
> > -       }, union {
> > +       void (*b)(int, struct struct_c, union {
> >                 char d;
> >                 int e[5];
> >         });
> >  } (*fn_complex_t)(union {
> >         void *f;
> >         char g[16];
> > -}, struct {
> > -       int h;
> > -});
> > +}, struct struct_h);
>
> these do test some pieces of libbpf's btf_dump logic, so I'm way more
> reluctant to remove these. If I understand correctly, this syntax will
> be eventually supported by GCC, so is there any way to keep these
> examples as is by requiring C23 mode or something? Or just skipping
> compiling this one if GCC is used?

I'm not sure, I'm having trouble finding a description in the C23 specification,
I presume if it is in there then GCC will eventually support it.

Maybe just keep the root_struct changes for now and hold off on this until
it's clarified that this is valid C23 code or not?

At the moment it appears there's a clang bug here as it shouldn't be valid
C17 code(which AFAIU is clang's default).

>
> >
> >  typedef void (* (*signal_t)(int, void (*)(int)))(int);
> >
> > @@ -272,6 +272,18 @@ struct root_struct {
> >         struct float_struct _15;
> >  };
> >
> > +struct struct_a {
> > +       int a;
> > +};
> > +
> > +struct struct_h {
> > +       int h;
> > +};
> > +
> > +struct struct_c {
> > +       int c;
> > +};
> > +
> >  /* ------ END-EXPECTED-OUTPUT ------ */
> >
> >  int f(struct root_struct *s)
> > --
> > 2.34.1
> >
