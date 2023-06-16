Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A517732
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 16:57:51 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-97881a996a0so137343566b.0
        for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686934670; x=1689526670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oAtZ5LXCHICXaEO7EYK6uvp3llXWtuPjR3rLD7TKJU=;
        b=X6FK8VVxK2s2rEUXtQ32Cv6NtWP2XqSlUIH7xOzkfQgToM1SrRJeCyXKqsO3Fu1r/C
         CECb1sgPbuh8vEmvSmNOMtijAdUYkc6hAWV4YrDf0eCljhRFaSFWIO+vzDs2BP4T7d08
         rZjtoCQknhmFp+QFgsq3K2IEefeL0Nd347SjjD7gA80RN/jZiOjmNSA9Pm8PjxLI/VTZ
         lLMfj7XtiRuARmKr6jB2NOmiyHMK13AQXKwRx7ydy0TKcKClknlex1cnevSTtJcDtdJp
         WFwyuROSnzUp2uwn7sl8iQp3j6q88l9X/gQ63VMZwfGc6cL8dvbBy8rosgC1RnFhQakl
         lCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686934670; x=1689526670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oAtZ5LXCHICXaEO7EYK6uvp3llXWtuPjR3rLD7TKJU=;
        b=X0vi80si0LBH/xInfAnQ8uEABHWiiqcnMHmtbpVPDefMqbCaoHbcurnndgfM2kRk9W
         6cc7UoXZ2Xf1L6ku5Jmj7sxzd6h8jvZLEZ/WToRyncD+9NBXnIgJNENGpFeMNNbYpz0a
         Cxrcd8EAPf2nXIllqwel3ZZea3PyYt0FDzoCXZrh2CWNTY0N6PulmFhaz4wT3q6SSHoa
         ZwPUci1JjDYbt47lkikfhSk095aCZ042lSKyiLWbxFHpIBkpY5gEt1B8bEg3Wdoyw655
         wUe6zI7dJ1b04dFIKQaYQFCNumx5ODNX5iT4ZIRRqvg2J60qy1QhI9L5CeVGyYXxXdsz
         dmKg==
X-Gm-Message-State: AC+VfDynoqsIA8rE0YXMNIgynEFVOBXgpZp7ZK+bd97SUL2UbH9BQnqZ
	ZeCwiS8tyOE3GXYOXx8ScCOAVQKWQpKrGzIJJRM=
X-Google-Smtp-Source: ACHHUZ6IJBsH6IRx7Uwluo2vNRpp9G8byokV5tCgCmBN0iBQ/GSKRC++f8BpezqBMk9959m4aEwxSzcp5BF7z8sEJqE=
X-Received: by 2002:a17:907:7b96:b0:984:5c67:e73f with SMTP id
 ne22-20020a1709077b9600b009845c67e73fmr2433871ejc.54.1686934670087; Fri, 16
 Jun 2023 09:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615145607.3469985-1-revest@chromium.org>
In-Reply-To: <20230615145607.3469985-1-revest@chromium.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 16 Jun 2023 09:57:38 -0700
Message-ID: <CAEf4BzbjCt3tKJ40tg12rMjCLXrm7UoGuOdC62vGnpTTt8-buw@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf/btf: Accept function names that contain dots
To: Florent Revest <revest@chromium.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@google.com, haoluo@google.com, jolsa@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 7:56=E2=80=AFAM Florent Revest <revest@chromium.org=
> wrote:
>
> When building a kernel with LLVM=3D1, LLVM_IAS=3D0 and CONFIG_KASAN=3Dy, =
LLVM
> leaves DWARF tags for the "asan.module_ctor" & co symbols. In turn,
> pahole creates BTF_KIND_FUNC entries for these and this makes the BTF
> metadata validation fail because they contain a dot.
>
> In a dramatic turn of event, this BTF verification failure can cause
> the netfilter_bpf initialization to fail, causing netfilter_core to
> free the netfilter_helper hashmap and netfilter_ftp to trigger a
> use-after-free. The risk of u-a-f in netfilter will be addressed
> separately but the existence of "asan.module_ctor" debug info under some
> build conditions sounds like a good enough reason to accept functions
> that contain dots in BTF.

I don't see much harm in allowing dots. There are also all those .isra
and other modifications to functions that we currently don't have in
BTF, but with the discussions about recording function addrs we might
eventually have those as well. So:

Acked-by: Andrii Nakryiko <andrii@kernel.org>

>
> Cc: stable@vger.kernel.org
> Fixes: 1dc92851849c ("bpf: kernel side support for BTF Var and DataSec")
> Signed-off-by: Florent Revest <revest@chromium.org>
> ---
>  kernel/bpf/btf.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 6b682b8e4b50..72b32b7cd9cd 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -744,13 +744,12 @@ static bool btf_name_offset_valid(const struct btf =
*btf, u32 offset)
>         return offset < btf->hdr.str_len;
>  }
>
> -static bool __btf_name_char_ok(char c, bool first, bool dot_ok)
> +static bool __btf_name_char_ok(char c, bool first)
>  {
>         if ((first ? !isalpha(c) :
>                      !isalnum(c)) &&
>             c !=3D '_' &&
> -           ((c =3D=3D '.' && !dot_ok) ||
> -             c !=3D '.'))
> +           c !=3D '.')
>                 return false;
>         return true;
>  }
> @@ -767,20 +766,20 @@ static const char *btf_str_by_offset(const struct b=
tf *btf, u32 offset)
>         return NULL;
>  }
>
> -static bool __btf_name_valid(const struct btf *btf, u32 offset, bool dot=
_ok)
> +static bool __btf_name_valid(const struct btf *btf, u32 offset)
>  {
>         /* offset must be valid */
>         const char *src =3D btf_str_by_offset(btf, offset);
>         const char *src_limit;
>
> -       if (!__btf_name_char_ok(*src, true, dot_ok))
> +       if (!__btf_name_char_ok(*src, true))
>                 return false;
>
>         /* set a limit on identifier length */
>         src_limit =3D src + KSYM_NAME_LEN;
>         src++;
>         while (*src && src < src_limit) {
> -               if (!__btf_name_char_ok(*src, false, dot_ok))
> +               if (!__btf_name_char_ok(*src, false))
>                         return false;
>                 src++;
>         }
> @@ -788,17 +787,14 @@ static bool __btf_name_valid(const struct btf *btf,=
 u32 offset, bool dot_ok)
>         return !*src;
>  }
>
> -/* Only C-style identifier is permitted. This can be relaxed if
> - * necessary.
> - */
>  static bool btf_name_valid_identifier(const struct btf *btf, u32 offset)
>  {
> -       return __btf_name_valid(btf, offset, false);
> +       return __btf_name_valid(btf, offset);
>  }
>
>  static bool btf_name_valid_section(const struct btf *btf, u32 offset)
>  {
> -       return __btf_name_valid(btf, offset, true);
> +       return __btf_name_valid(btf, offset);
>  }
>
>  static const char *__btf_name_by_offset(const struct btf *btf, u32 offse=
t)
> @@ -4422,7 +4418,7 @@ static s32 btf_var_check_meta(struct btf_verifier_e=
nv *env,
>         }
>
>         if (!t->name_off ||
> -           !__btf_name_valid(env->btf, t->name_off, true)) {
> +           !__btf_name_valid(env->btf, t->name_off)) {
>                 btf_verifier_log_type(env, t, "Invalid name");
>                 return -EINVAL;
>         }
> --
> 2.41.0.162.gfafddb0af9-goog
>
