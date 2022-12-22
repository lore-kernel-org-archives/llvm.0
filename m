Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C1C15CA
	for <llvm@lists.linux.dev>; Thu, 22 Dec 2022 19:04:04 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id jo4so7059848ejb.7
        for <llvm@lists.linux.dev>; Thu, 22 Dec 2022 11:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DrfFn2RCziZK2VBabCo7DnuATErMo5Nl8zH4r6F8BU=;
        b=APj25jEK7cnEX5AQLNiGwZDyJxgLMMVHM4NuUxr9fsj5FGtrZzm3X8zcT71cMxC2Q9
         Ds/QhIOh//K02vS7DiDAMYZJuvRtNrGHUiNa+yA/kX/rup/7ZiuKI5q8P0H/VlYCaqCa
         5tMLEESs9fxGiWaSzUsbwaj7YWJEJw8xpMxpfVXGhEQW/1L5DRP6xJ4fuP5UJak+qo/4
         otJv0Bu+CgFn4mBF4bMgzo3qim+tLNdWVJ4rCsL2/1MRHR2JQ/QWmpvz7JH3hBMdK6RC
         vrag392h1oYBfnW0ef47hj5A/G2UCr2uYg0Mi2CTaATaib5gP0Pn52IBYMh0Hds27Jlx
         oG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DrfFn2RCziZK2VBabCo7DnuATErMo5Nl8zH4r6F8BU=;
        b=P6cjqHldFHfbIqnmkPapGIee6yj4/Ahj+Zxi4H5N/VnQG9p71Fw8qKOLTl0MoHQ+Jj
         +itlfCjb2sJbckxbde16yi3oBOX2xV7ftbboIfsNZlnM1gJCmAfHYU9llzq21mRRpIah
         lJN1RicHLCqaqkRUHQlNqWpAA3VCfHQnf3ngfAgkPYqK974uC0j+o0gsa+9JXy3PT6CS
         IbtemU5BNjJ8GWG1luWG57Tg+N5r2vR1eogrzrqKrFKThW/uN2BrycSVOZRlOJFlHVYv
         G0CexVCZMh5KjeIAcNk43PTx8HuVFgvb4usVtOnhehwQ8d4IQR4jcRWnkNLE1KcXrYBa
         +L+g==
X-Gm-Message-State: AFqh2kpHccUwdAYr57Vq1MP7tkNzgMhFDh1aNwkK7/Vt/5QAp74oKDEh
	msOGaT9VPQzvGk1OPvbpGx4xoViSZCmblETAjlw=
X-Google-Smtp-Source: AMrXdXuDiICObnTIm/Kf6pFzxQIOYEj5FBRbk0Mud3IPuqSNdMEg8i2elxYjDLhSVZ/3KUBTIkJMbKrZg1KUCfUKPXg=
X-Received: by 2002:a17:907:d489:b0:7c0:dd4e:3499 with SMTP id
 vj9-20020a170907d48900b007c0dd4e3499mr761666ejc.545.1671735843040; Thu, 22
 Dec 2022 11:04:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221055856.2786043-1-james.hilliard1@gmail.com>
In-Reply-To: <20221221055856.2786043-1-james.hilliard1@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 22 Dec 2022 11:03:51 -0800
Message-ID: <CAEf4BzZFgOksVucYDq1ZzPWTBZV0zHtK0H4U0LVEtz19nzbpVg@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: move struct definitions out of
 function params
To: James Hilliard <james.hilliard1@gmail.com>
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

On Tue, Dec 20, 2022 at 9:59 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Anonymous structs can't be declared inside function parameter
> definitions in current c standards, however clang doesn't detect this
> condition currently while GCC does.
>
> Details: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108189
>
> Fixes errors like:
> progs/btf_dump_test_case_bitfields.c:85:7: error: anonymous struct declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>    85 | int f(struct {
>       |       ^~~~~~
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../bpf/progs/btf_dump_test_case_bitfields.c  |  9 ++++--
>  .../progs/btf_dump_test_case_namespacing.c    | 10 ++++---
>  .../bpf/progs/btf_dump_test_case_packing.c    | 10 ++++---
>  .../bpf/progs/btf_dump_test_case_padding.c    | 10 ++++---
>  .../bpf/progs/btf_dump_test_case_syntax.c     | 30 +++++++++++++------
>  5 files changed, 46 insertions(+), 23 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c
> index e01690618e1e..c75f6bd06a49 100644
> --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c
> +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_bitfields.c
> @@ -82,11 +82,16 @@ struct bitfield_flushed {
>         long b: 16;
>  };
>
> -int f(struct {
> +/* ----- START-EXPECTED-OUTPUT ----- */
> +struct root_struct {

there is no need to make this struct part of expected output, just
keep it next to f?


>         struct bitfields_only_mixed_types _1;
>         struct bitfield_mixed_with_others _2;
>         struct bitfield_flushed _3;
> -} *_)
> +};
> +
> +/* ------ END-EXPECTED-OUTPUT ------ */
> +
> +int f(struct root_struct *_)
>  {
>         return 0;
>  }
> diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c
> index 92a4ad428710..d7cf2a8487c9 100644
> --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c
> +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_namespacing.c
> @@ -49,9 +49,7 @@ typedef int Y;
>
>  typedef int Z;
>
> -/*------ END-EXPECTED-OUTPUT ------ */
> -
> -int f(struct {
> +struct root_struct {
>         struct S _1;
>         S _2;
>         union U _3;
> @@ -67,7 +65,11 @@ int f(struct {
>         X xx;
>         Y yy;
>         Z zz;
> -} *_)
> +};

same, that struct is only to preserve all the referenced types, so
keep it hidden from the output

> +
> +/*------ END-EXPECTED-OUTPUT ------ */
> +
> +int f(struct root_struct *_)
>  {
>         return 0;
>  }
> diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c
> index 7998f27df7dd..e039ceb50c43 100644
> --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c
> +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_packing.c
> @@ -132,9 +132,7 @@ struct outer_packed_struct {
>         struct nested_packed_struct b;
>  } __attribute__((packed));
>
> -/* ------ END-EXPECTED-OUTPUT ------ */
> -
> -int f(struct {
> +struct root_struct {
>         struct packed_trailing_space _1;
>         struct non_packed_trailing_space _2;
>         struct packed_fields _3;
> @@ -147,7 +145,11 @@ int f(struct {
>         struct usb_host_endpoint _10;
>         struct outer_nonpacked_struct _11;
>         struct outer_packed_struct _12;
> -} *_)
> +};
> +
> +/* ------ END-EXPECTED-OUTPUT ------ */
> +
> +int f(struct root_struct *_)
>  {
>         return 0;
>  }
> diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c
> index 79276fbe454a..2ca46ad8d66a 100644
> --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c
> +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_padding.c
> @@ -220,9 +220,7 @@ struct outer_mixed_but_unpacked {
>         struct nested_packed b2;
>  };
>
> -/* ------ END-EXPECTED-OUTPUT ------ */
> -
> -int f(struct {
> +struct root_struct {
>         struct padded_implicitly _1;
>         struct padded_explicitly _2;
>         struct padded_a_lot _3;
> @@ -243,7 +241,11 @@ int f(struct {
>         struct ib_wc _201;
>         struct acpi_object_method _202;
>         struct outer_mixed_but_unpacked _203;
> -} *_)
> +} __attribute__((packed));
> +
> +/* ------ END-EXPECTED-OUTPUT ------ */
> +
> +int f(struct root_struct *_)
>  {
>         return 0;
>  }
> diff --git a/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c b/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c
> index 26fffb02ed10..3e31df7cecc6 100644
> --- a/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c
> +++ b/tools/testing/selftests/bpf/progs/btf_dump_test_case_syntax.c
> @@ -104,24 +104,24 @@ typedef void (*printf_fn_t)(const char *, ...);
>   *   typedef const fn_output_inner_t fn_ptr_arr2_t[5];
>   */
>  /* ----- START-EXPECTED-OUTPUT ----- */
> -typedef char * const * (*fn_ptr2_t)(struct {
> -       int a;
> -}, int (*)(int));
> +struct struct_a;
> +
> +typedef char * const * (*fn_ptr2_t)(struct struct_a, int (*)(int));
> +
> +struct struct_c;
> +
> +struct struct_h;
>
>  typedef struct {
>         int a;
> -       void (*b)(int, struct {
> -               int c;
> -       }, union {
> +       void (*b)(int, struct struct_c, union {
>                 char d;
>                 int e[5];
>         });
>  } (*fn_complex_t)(union {
>         void *f;
>         char g[16];
> -}, struct {
> -       int h;
> -});
> +}, struct struct_h);

these do test some pieces of libbpf's btf_dump logic, so I'm way more
reluctant to remove these. If I understand correctly, this syntax will
be eventually supported by GCC, so is there any way to keep these
examples as is by requiring C23 mode or something? Or just skipping
compiling this one if GCC is used?

>
>  typedef void (* (*signal_t)(int, void (*)(int)))(int);
>
> @@ -272,6 +272,18 @@ struct root_struct {
>         struct float_struct _15;
>  };
>
> +struct struct_a {
> +       int a;
> +};
> +
> +struct struct_h {
> +       int h;
> +};
> +
> +struct struct_c {
> +       int c;
> +};
> +
>  /* ------ END-EXPECTED-OUTPUT ------ */
>
>  int f(struct root_struct *s)
> --
> 2.34.1
>
