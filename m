Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638315;
	b=xC7vdeSSr7z+l7qMIeCcylGSLungelC3ujP6icjkGijeTlB9jL9BeM/y9aL8rTDYvlhA
	 H8Ae6p+pznX8RkAuBn2/7Td5Y2jN8bRFDWd29evioVBYGXy+khJx6I9211Ybs3ZsX2Bdv
	 llYxigARQo1nPFQz4SzTc+Fqgezya93BavXItijK/qzpDny09vZq3m2jEOFODvx3mew2p
	 jrn8eAW8DX5LMLTCe+mFwqLOnjf4rbZUwpN5bc913boAWX7ZP0EoSkIvsOx62N47BxG9S
	 Co6TSWrpsWjbRgCI3cPtPRvyXfyx0bH4Q+E1tvAc/QyVL1V9XsEBpYQr5cTu+ziM4Sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
	b=pZNwT1Tn58R6VBGHRTNSWdVq9W8NATKD/ozI9B7ShwKONqypGNWyU5nDZgQzVtc/sCnZ
	 prcultsJQglwZq4XfVO9mUBqC6y1lE8UghS38n+dFRydQ8gtRa7uAvIA9RyaI42HYB9R6
	 7yv/ApneUgBHAc7wjOpp1OfXanyPniy6CnxHbCyJcd+5FjmC6+syw/WqHLTvPb4/hnXU6
	 t5zTwAyceBtpVg3iNd1+RCVRT8ng304eX3s4MESJ1dPT7ZrNvOnw7tIDNtLY13S4Aq6ZR
	 pY+RlK5GqGNtWHOqPxmZ/XoXZU/32q9uvB6A4D15HW8IR0hragzdf20EMmXI1ftihcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wV0Z07LW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74D6606A681
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 20:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C74D6606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wV0Z07LW
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so4104030f8f.3
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 12:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638313; cv=none;
        d=google.com; s=arc-20260327;
        b=U4HepceRJzrFdEpwjnJ0UkRb3VuqNZsgUFYqrdvfm0pLOYPFuN0x+i8S5PbaVwRx4j
         FiwMXW/HxuO22mN9SHdJCNy/v1xzEFBgTPSWYZBS+YREOvJ81or9vc5YIXlR4yq30z+z
         MLauoPogGMkeb32VF16S96xqcClSZE8vg30jXONdHyHRQA433toeT4polh8erSYqbpce
         VAyBLqSJzfBhoZ2p1RGm/z+jK09cPhsQ5hCIIiMd9pEjwutmYDvB+/O6PA6riUDO9fRU
         W7C7wwPA7CqxwBMSwubEfKt/TiyQz0eLKUYX2w6tN4/RuPiQ8TgKeTuTRxUCISnh1eq7
         +LPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
        fh=SpyH+gq2kwwGT+wbcKzI0JfgSyIO9uvgr3dTeyRrj5A=;
        b=gzs9KoMFDCibgYSOpREBc/XraY2G8365TqBi63knOIOFIX/PbAS0ad15UPRPIPUaq2
         kX+SdTbIAxotkRXUAjbbKuaUGLspn3Q+2ccMc9R5u1PF37d9NSMBVLZTku2WPjLHJOGk
         piT4flHnJ85sTd91Nii+6MG+CDzy6USfr6Gbb1s8VYwHLroGgYWLygWSTIfLMqA02BdY
         eDnfPHrYDBt42z9Fs440VdPGVlRbQJ+pBldSxBJAYC6hBRJpC7+femNSDR+8BSp2SXbA
         NzRimcHAzgPqDUuG6suj+GH6UiVGR7l+f6QbwKyaTNPOUAstx/RUYULm+75T8vWedoiD
         AEpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638313; x=1796243113; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
        b=wV0Z07LWM2Jmxi/YeQJX2DW+Om1FTQGy+Vzf97WJ0aTgZNB/gXGJG89a94SMaPzjpD
         KoWwXdsZVNO/vO+qq1nLGKHgzZ9oi7YXTSul5iDxoXi74I84+/aZ5b/XBjOrAOC4yOoT
         VTzcxNoaPwS4g6KEweSV2OX/VdI8eqBKEYY0NHfXEBB+C75ivS3iSNh00icRRw59f3Sk
         8d+3tHOXTB2OUcmjKkbqMx4D1isWjA4X6QDuHafF/XFOY9SLGRELOm11qddvmp2tPCcr
         SDtw/prYxVffmlYpJxAEJ7+4bbXSpk0btpVW7pKV2Ip3JJ49opPmJ8e8osxjz3A9HM0A
         ZvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638313; x=1796243113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
        b=JB+YJFp8qHHZ1M+3uYQcOCqwdJt/uouikdg06hTG3l9AyoZhD9CyqIRTXqE4QK12Es
         3fcaGhpYsdE72ZCjSN2do58GigzJXRqM4pz2eaczENwc0CHI2ofz0P80bfZmESEcTz8G
         gwVTqpG9kE+Xgy1QWm+QcaBOl74FI70HGTuABJyxwoGTh0rBtNauy9KXAEvEtLqEoMJZ
         9tLVIQHmUD2VcXQFsJ87S7ihQ5No0c1PWPQBts2PbdHRuVBbVA03bLwN/v/eYUk1lLf7
         oTKe8/8BjbTxzgZFrwCUw3eVC/z6IL1tRPGGadNNueu9OVRhZ5yjjYR9Wi69ADtjHbjF
         hcmg==
X-Forwarded-Encrypted: i=1; AL+hErEBoZiO3dIMDPARtfGX10sQVG8uuK1g/MwLORJD25Tm0donuC1TyKp0M5czO9Nen+01jjTc@lists.linux.dev
X-Gm-Message-State: APuU4Z/Z0k4ZhgTol9ihbMNNfceb9iX2yESiIM3seTKhATji2u2yItl6
	MnPEVGKGtNKPSqgbxtQnvZ5OaE17TnGVli+yB4ZF6BpI0daPZaFsUdMZrIqzjch8yyvJNk1Ahzm
	VP5yEaydJi+a3GPvp3tDQkiOyrkvVzHNWCsZc
X-Gm-Gg: AZFdTZdzFKTvDAE2JdX1YS/Rs1TmxPs8gy1VHipq7c3XadlFB07EGSfq8yCj/SYLbG8
	ee90cg9mawia0ojdYE81mA9fLD+yY3PVG4eiBT+k0/m/q4kMmiT5ULZ4RUp2xbSK+mx062JI2pu
	H56i/JvZgnCct797kR9+S0pSnMVxJeuuocR4DZcahrNdBcwCHFfeZZJt22u1AVQ3mj510gzOamQ
	wwFy1PKrqfCz0GGFDmzg5zfSzkds6IJejKfW2qd5UED2kVLEZYjNhgaynTWk6bK3fwMYsL1hGvw
	E9LUgBIMYSTAWphhiYFvjxoAbaM1LffrwTEzUh67YH+ZWHbp3fOA5lXqY3j19UtYNwYKODzZcT0
	GA8oTBrX/uiELRBNZYciuXQqULUzoqNL6Vo7ts+RiyHil1ETC9zsxQilpsqJ5oJepTlYIuaD9NB
	iTH1k/bbjgh4mO++q753gXJm5M+iYSTlxT9XzFWBI=
X-Received: by 2002:adf:e010:0:10b0:4a7:518f:bea6 with SMTP id
 ffacd0b85a97d-4abb3a4d2b1mr26580561f8f.28.1795638312899; Wed, 25 Nov 2026
 12:25:12 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-14-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-14-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:25:01 -0800
X-Gm-Features: Aa3M54pvd_ufUhqcRiZwrOrjoyqqBDQhM2r6c2QuhvkGt5RO4ZEh7lWEiXzteDk
Message-ID: <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> To find a few kernel symbols, users such as libbpf parse all of
> /proc/kallsyms, which is several MB and text based.
>
> Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name or
> by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
> and optionally in a single module with module_filter, or all modules by
> default. Each call returns one match and its position; pos + 1 continues
> the search, until -ENOENT. The output returns the address, the size, and
> optional name and module buffers. A buffer that is too small gives
> -ENAMETOOLONG and the required size.
>
> vmlinux symbols are found with a lower-bound binary search on the sorted
> names, module symbols in one pass, and ftrace, BPF, and kprobe symbols
> with the per-index getters that read() uses.
>
> For versioning, the struct carries their sizes, so the command does not
> change when the struct grows.
>
> The command uses 'f' 0x30; register 0x30 in ioctl-number.rst.
>
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  include/uapi/linux/fs.h                       |  43 +++
>  kernel/kallsyms.c                             | 319 ++++++++++++++++++
>  3 files changed, 363 insertions(+)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documen=
tation/userspace-api/ioctl/ioctl-number.rst
> index fbc3537fc9ee..f5dbb597257a 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -250,6 +250,7 @@ Code  Seq#    Include File                           =
                  Comments
>  'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       c=
onflict!
>  'f'   10-11  linux/fs.h                                                c=
onflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   13-27  linux/fscrypt.h
> +'f'   30     linux/fs.h                                                p=
rocfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   81-8F  linux/fsverity.h
>  'g'   00-0F  linux/usb/gadgetfs.h
>  'g'   20-2F  linux/usb/g_printer.h
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index a46c33692aa2..987569dcdbea 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -674,6 +674,49 @@ struct procmap_query {
>         __u64 build_id_addr;            /* in */
>  };
>
> +/* /proc/kallsyms ioctls. -EPERM if the opener cannot see kernel address=
es. */
> +#define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL=
_MAGIC, 48, 0)
> +
> +enum kallsyms_query_flags {
> +       /* Match query_name as a prefix. */
> +       KALLSYMS_QUERY_NAME_PREFIX =3D 0x01,
> +};
> +
> +/*
> + * Symbol returned by a query. Each buffer pointer and its *_len must bo=
th be
> + * set or both be 0. When set, the kernel sets *_len to the string size
> + * including the NUL, even if the buffer is too small and the ioctl fail=
s with
> + * -ENAMETOOLONG. The module name of a vmlinux symbol is "".
> + */
> +struct kallsyms_query_sym {
> +       __u64 sym_addr;         /* out - start address */
> +       __u64 sym_size;         /* out - bytes to next symbol, 0 if unkno=
wn */
> +       __u64 sym_name;         /* in - user ptr to name buffer, or 0 */
> +       __u64 sym_name_len;     /* in/out - buffer size / string size */
> +       __u64 sym_module;       /* in - user ptr to module name buffer, o=
r 0 */
> +       __u64 sym_module_len;   /* in/out - buffer size / string size */
> +};
> +
> +/*
> + * Find a symbol by exact name, or by prefix with KALLSYMS_QUERY_NAME_PR=
EFIX,
> + * in the entries of /proc/kallsyms, except undefined module symbols. vm=
linux
> + * matches come first. A module_filter of "vmlinux" selects the core ker=
nel.
> + *
> + * Each call returns one match and sets pos to its position, even on
> + * -ENAMETOOLONG. Start with pos 0 and use pos + 1 for the next match, u=
ntil
> + * -ENOENT. Use pos only with the same query. Matches can be skipped or
> + * repeated if symbols change between calls.
> + */
> +struct kallsyms_query_by_name {
> +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_n=
ame) */
> +       __u64 query_flags;      /* in - enum kallsyms_query_flags */
> +       __u64 query_name;       /* in - user ptr to name or prefix */
> +       __u64 module_filter;    /* in - user ptr to loaded module name, o=
r 0 */

similar to the comment on the previous patch, how does the user
express that it only wants to search vmlinux image and not consult
module?

and naming nit: query_module to be consistent with "query_name"?

> +       __u64 pos;              /* in/out - start position / match positi=
on */
> +       __u64 sym;              /* in - user ptr to struct kallsyms_query=
_sym */
> +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym)=
 */

I'd name it "sym_size" for consistency with "sym" naming, and the
comment/doc here is unambiguous about what that is (struct size, not
the symbol's recorded size). seems fine as far as UX goes


other than nits, this API looks great

[...]

> +/* On -ENAMETOOLONG, *ksym is still copied, to return the required sizes=
. */
> +static int kallsyms_copy_sym_to_user(u64 usym, u64 usym_size,
> +                                    struct kallsyms_query_sym *ksym,
> +                                    const struct kallsyms_sym_match *m)
> +{
> +       size_t copy_sz =3D min_t(size_t, usym_size, sizeof(*ksym));
> +       bool too_long =3D false;
> +       int err;
> +
> +       ksym->sym_addr =3D m->addr;
> +       ksym->sym_size =3D m->size;
> +       err =3D kallsyms_copy_str_to_user(ksym->sym_name, &ksym->sym_name=
_len,
> +                                       m->name);
> +       if (err =3D=3D -EFAULT)
> +               return -EFAULT;
> +       too_long |=3D (err =3D=3D -ENAMETOOLONG);

nit: if (err =3D=3D -ENAMETOOLONG) too_long =3D true; is just as short

but also you are eating any other error, maybe write it so that
original err is preserved as is, not special-casing ENAMETOOLONG? if
you get EFAULT later, original error still takes precedence

> +
> +       err =3D kallsyms_copy_str_to_user(ksym->sym_module, &ksym->sym_mo=
dule_len,
> +                                       m->modname);
> +       if (err =3D=3D -EFAULT)
> +               return -EFAULT;
> +       too_long |=3D (err =3D=3D -ENAMETOOLONG);
> +
> +       if (copy_to_user(u64_to_user_ptr(usym), ksym, copy_sz))
> +               return -EFAULT;
> +
> +       return too_long ? -ENAMETOOLONG : 0;
> +}
> +

[...]
