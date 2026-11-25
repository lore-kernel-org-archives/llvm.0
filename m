Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638327;
	b=SSEcLAe0l3EXjr1OOh7CcUN3eKJjdtJGcDc2O/Bc2Awlbyhn33N2Ohjo3mDCfv/Fc4vy
	 T/VCMXpJrH23q/XdnDkI8iXWrgE4sKAW/UYx9nnG+6384STseQa3CszJzS49SKL26UP7S
	 d0yIvEMsNTpVzj73Z9Is1bLH99kwhqv2wITNk4tweTe0IvMk7+Y2Px1v/F2+T4LmKMJ5Y
	 OX7xcdWJx4q+6tR1fBc4FpbvW+wx+Q/ldB0qUptXHe3g+AA4bP2osospxuJxhMJy1JKd3
	 pHQ8M80gzLQNcLDl+Ti4XslAH6kNu1ulSAON8CPVSpTY8qo/NtVMalfBa3E1g09lhkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iLkN+MWQxnheW7WlW33tdTgTSE87b9Cd5EByIUSUt0Y=;
	b=THwM6dqUmgN+FVsubwJ6skzC+A2fZJerGAIP0hZzru8J8N9IVX3pkRbygkkro2+2E90E
	 06vScBZwZw/v7BCOoupgFydq9HVrJD4M2jCSdBB5HSsw+KchzcOZPaTs7JnWs8ki00IKt
	 mSzxmeYIpdm89fvmHIw1QhLO96DQzQsiaVLTmaPp6k6IfSwWozAgQ+7Hf1JdaQNc2T8BV
	 12wh8aWJ++he01S/3kmio3TkiLZFvrSp9OEeHq5kC8suJJnv/V7zh6sHe8MIkQLNL6w7A
	 KBudANBKGReUMPRypUIcd59ltsCSy6NnGb5RHK31ABPL34OSzx3x3jkCB44HgyPwZmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTKykTO4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0649606A680
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 20:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0649606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTKykTO4
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso3897778f8f.2
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 12:25:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638325; cv=none;
        d=google.com; s=arc-20260327;
        b=dYEzOK5g0NvKRyHAk8+KRh94gqU6ORcIkIaYFCPpeLmdFpJoDGi0YDnL7XkkCGKePr
         xoIMi5z/tpvXTSaRZPUM9Ol3ZmjJXtv/wkXjsQj+KV+ZQUsnLayckx+4Ryd/EUT/p6/0
         0Qb5Ya7MtNOW+7My10bQJdCj70PHkbHfcuLIEO2PXPFAZgHmfDSKBkFwXosKbilJn842
         FwYsXa8+ZdoryeIJqw+1O+7iThHjZs3xMgVJORzLtHyKUspQ6PxDUeDzgubsD5VqOsvd
         iuBvzxnnVxvkEfbLrGweSu6Aucy4nju80rBa7+XYKLLGnsYcwy0ZNF2JkXaA6zLk/Cin
         zD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLkN+MWQxnheW7WlW33tdTgTSE87b9Cd5EByIUSUt0Y=;
        fh=Q/7rM9AYcKe2NLI+tosf5K2XX60Y1YEiY3vdsiYkaeg=;
        b=Nsk4KYKxDFSj+Mh2bi2+hGLwBwRM3CT3buRF6eOV5t1I2fvVLeBxR+mbZSO1Sx0woP
         /S4KqZDNc8R8NOWXkAh9nbkfM886Ltb78TX7HrZSOUmsseeIlsDzvUjpu8OImd+vvKFW
         Vr0XPKzRN++vSkT+m5AhUAAd0efXk1/bJkxlr4fGObiQjdAEvEi6OJ9Zn0dU1YP8JWlU
         Wm8kD5XYy4fI11UXshts6b/MoORaPipvIF5ws30h2/x6qBe4yc+rIXU5K1lMbd33OtIZ
         MUNxglOlJVM2qsOFJN0rSH/8zpsCZ2Aqo8GjPKwRgg5Cfv53fDp/AckLOgaYmm+aEF47
         c7UA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638325; x=1796243125; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLkN+MWQxnheW7WlW33tdTgTSE87b9Cd5EByIUSUt0Y=;
        b=yTKykTO4/oh90kpGYGtJfgR/0Z5V2NVoXn+DRUH+cz2r8xEeLAvD94/eHWdvRCsSWS
         vXq2lnYq1vpxVnVSBoVOjOZaJNnWtj7OsTN/59ZS3IqRJHhCCn8vCuh7Ub4zLuRRMSbS
         qeO+pnAbQhtT9vsJIKkOoYgyAHp1F+mIOY5Fy2M9A7CxuIsUHW2kTC/ViTbBG42f3y4k
         jSm+vPcE8lmWKeEysIaYSLzcY7va5bgM8mL4+c6LHADq7w8ARq/dPNtCHpeHmeFxyvGn
         11KE99XHgO1poCPDVejA0BKxV1bOyae718HSrfJVyflugo8vSCHZxGfUlCovc7Btb5eJ
         ZAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638325; x=1796243125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLkN+MWQxnheW7WlW33tdTgTSE87b9Cd5EByIUSUt0Y=;
        b=Fcvqi//xki+pYeKDCn6BDtzYmv1KvRXnaTaElxyeo4KvAM42fiemzikKVD4yMFbbNg
         PXNDfDeCmIZdeNvHO4Qf3j9TgUmCOy1kxudyf37zW2CoHKwoKrvVKVDyHhxEhs3AR5Yj
         4Ip2az5s2PnDWIGhi6mJXhtV+Qo0EE99568eq41ds1Uw9oLPOT9+obbiooDv9TdgKsP1
         MDmX09YylgKB+2szjNiX7xm/oajWT9YblFw0hvs6cD03Xv/Vb8nnVshw+N2WbXjuRpyS
         av3l9adbB4E4EXe3aKjomlsRj0DU38JoIK/fxytpWq0zvBex258JXFMym71Eha5FAFCz
         2t9g==
X-Forwarded-Encrypted: i=1; AL+hErFkvOkHzH0qpnntw6PCvUoK+tVzYuBOz89ZmIiIgXxqhKiLpa44ojX/1poAd7eozbF/Oun/@lists.linux.dev
X-Gm-Message-State: APuU4Z94yqaDE2Wmf4vn//bNzwyE1LZmL8ezauNXJlgIt8QCyW2Zcm1m
	WbjaTiSV5eZMiucpXMlgj7M2PclRQ7qriRoWaE1ai5YPCx7TLEKgCw5Rjm5vdHe7NJ+0TNUyiy7
	KYRPEhDJI6KpNj5M6PC+JOIkd6xwXsEg=
X-Gm-Gg: AZFdTZdmkIr8613sRoOfoqpqEhYWrMhlq3QpLiGaEqR62FajkePwV187iFCC9tKvQuZ
	rUd74jdn8ZW/QIymj7Hoco0UN76sBM7KDwh1s/8E5LNVGOaEbeJf+iPKUWayUtZSE6kf+ou/1x3
	Pn348lO8AWd9x5OwPWZKWR5BRBj+hk6TLbXjw1Is/OomxTMVPTdTAOY8hm2vxP4Q/0cT4zTM7td
	ovmZ4s2X1BfquQ6PUco/4OI8reYLJy+eYnHqMcWbqd5b8G5gd9nSVa3EIzf53yvGegSPAVMBQYA
	i1z1KoV+SXPuXQrontzofVGJAFBPvHKFuzxisLZ6FY6c/fLLWMVhPXv33uzPd6dy9oqNRsHP6Wo
	WrZUK+vDNDH+Xcw9EkRVg1URhOe7wc023aftAmDcMYhhTzCS9YaFPcTrCzNbQokO3Z/UQSc+glu
	iA4A4d36homrO5qk8BpPk2S2ZAvC0UvcYHPSQzf6s=
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id
 5b1f17b1804b1-4bb888236a3mr398384805e9.24.1795638325248; Wed, 25 Nov 2026
 12:25:25 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-19-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-19-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:25:13 -0800
X-Gm-Features: Aa3M54rCmMPBEx135c6vF9MhBqdEKKVbA2tVr-knpTqUbo_Og9Fm0v--QDk1gek
Message-ID: <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 8/9] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY_BY_NAME ioctl
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> libbpf parses all of /proc/kallsyms to resolve typeless ksyms.
>
> Use KALLSYMS_QUERY_BY_NAME instead: exact names, plus "<name>.llvm."
> prefix matches. Ambiguous matches at different addresses fail the load.
> A missing strong extern still fails and a missing weak extern is 0,
> without a text scan.
>
> On any other error (e.g. -ENOTTY on older kernels, or -EPERM), fall back
> to the text parser.
>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  tools/lib/bpf/libbpf.c | 99 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 2 deletions(-)
>
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 44134421bd7d..f3f3475a64d3 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -59,6 +59,34 @@
>  #define BPF_FS_MAGIC           0xcafe4a11
>  #endif
>
> +#ifndef KALLSYMS_QUERY_BY_NAME
> +/* 'f' is PROCFS_IOCTL_MAGIC */
> +#define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, 'f', 48, 0)
> +
> +enum kallsyms_query_flags {
> +       KALLSYMS_QUERY_NAME_PREFIX =3D 0x01,
> +};
> +
> +struct kallsyms_query_sym {
> +       __u64 sym_addr;
> +       __u64 sym_size;
> +       __u64 sym_name;
> +       __u64 sym_name_len;
> +       __u64 sym_module;
> +       __u64 sym_module_len;
> +};
> +
> +struct kallsyms_query_by_name {
> +       __u64 size;
> +       __u64 query_flags;
> +       __u64 query_name;
> +       __u64 module_filter;
> +       __u64 pos;
> +       __u64 sym;
> +       __u64 sym_struct_size;
> +};
> +#endif
> +

there is no need for this, libbpf in kernel can use kernels' most up
to date UAPI headers directly, and on Github we sync necessary UAPI
headers into include/ directory, so libbpf source code can be built
with latest definitions of kernel UAPI. So you can drop this part

>  #define MAX_EVENT_NAME_LEN     64
>
>  #define BPF_FS_DEFAULT_PATH "/sys/fs/bpf"
> @@ -9421,8 +9449,75 @@ static int kallsyms_cb(unsigned long long sym_addr=
, char sym_type,
>         return 0;
>  }
>
> -static int bpf_object__read_kallsyms_file(struct bpf_object *obj)
> +static int query_ksym_by_name(int fd, struct extern_desc *ext, bool lto_=
prefix)
> +{
> +       struct kallsyms_query_sym sym =3D {};
> +       struct kallsyms_query_by_name q =3D {
> +               .size =3D sizeof(q),
> +               .query_flags =3D lto_prefix ? KALLSYMS_QUERY_NAME_PREFIX =
: 0,
> +               .query_name =3D ptr_to_u64(ext->name),
> +               .sym =3D ptr_to_u64(&sym),
> +               .sym_struct_size =3D sizeof(sym),
> +       };
> +       char prefix_buf[512];
> +       int n;
> +
> +       if (lto_prefix) {
> +               n =3D snprintf(prefix_buf, sizeof(prefix_buf), "%s.llvm."=
, ext->name);
> +               if (n < 0 || n >=3D sizeof(prefix_buf))
> +                       return 0;
> +               q.query_name =3D ptr_to_u64(prefix_buf);
> +       }
> +
> +       while (!ioctl(fd, KALLSYMS_QUERY_BY_NAME, &q)) {
> +               if (!ext->is_set) {
> +                       ext->is_set =3D true;
> +                       ext->ksym.addr =3D sym.sym_addr;
> +                       pr_debug("extern (ksym) '%s': set to 0x%llx\n",
> +                                ext->name, ext->ksym.addr);
> +               } else if (sym.sym_addr !=3D ext->ksym.addr) {
> +                       pr_warn("extern (ksym) '%s': resolution is ambigu=
ous: 0x%llx or 0x%llx\n",
> +                               ext->name, ext->ksym.addr,
> +                               (unsigned long long)sym.sym_addr);
> +                       return -EADDRNOTAVAIL;

I think there is ENOTUNIQ which we can utilize here

> +               }
> +               q.pos++;
> +       }
> +
> +       return errno =3D=3D ENOENT ? 0 : -errno;
> +}
> +
> +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
>  {
> +       struct extern_desc *ext;
> +       int err =3D 0;
> +       int fd;
> +       int i;
> +
> +       fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> +       if (fd < 0) {
> +               err =3D -errno;
> +               pr_warn("failed to open /proc/kallsyms: %s\n", errstr(err=
));
> +               return err;
> +       }
> +
> +       for (i =3D 0; i < obj->nr_extern && !err; i++) {
> +               ext =3D &obj->externs[i];
> +               if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> +                       continue;
> +
> +               /* Check exact name and then LTO .llvm.<hash> prefix */
> +               err =3D query_ksym_by_name(fd, ext, false);
> +               if (!err)
> +                       err =3D query_ksym_by_name(fd, ext, true);

err =3D err ?: query_ksym_by_name(fd, ext, true /* lto_prefix */);


> +       }
> +       close(fd);
> +       if (!err || err =3D=3D -EADDRNOTAVAIL)
> +               return err;
> +
> +       /* Other errors (e.g. -ENOTTY, -EPERM): parse the text file */
> +       pr_debug("KALLSYMS_QUERY_BY_NAME failed (%s), falling back to /pr=
oc/kallsyms\n",
> +                errstr(err));
>         return libbpf_kallsyms_parse(kallsyms_cb, obj);
>  }
>
> @@ -9699,7 +9794,7 @@ static int bpf_object__resolve_externs(struct bpf_o=
bject *obj,
>                         return -EINVAL;
>         }
>         if (need_kallsyms) {
> -               err =3D bpf_object__read_kallsyms_file(obj);
> +               err =3D bpf_object__resolve_typeless_ksyms(obj);
>                 if (err)
>                         return -EINVAL;
>         }
> --
> 2.56.0.679.gc527c65306-goog
>
