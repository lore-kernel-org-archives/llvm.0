Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638319;
	b=KC1+m+jxrs4/B1sfNQX4k7pZ6f6HqHbez1x+6J5lNA6+wBKi+wUAXprvZboki37HKOLm
	 Z/mSiugIFLuDpOwjTRlE0+iyCdgkf7Q23/yLtpi9jzVSPo7fl50l7bliyUvKmMfG3eSIZ
	 +M+9jpnZYRXGza+FOqUXXGewQtlbcmMC4NjQkGjCDm1D/LQKhFiG9iVZcii9d3fOnmfsb
	 tTUviDmVfCqXbDJBDZZ7NlL+BAmxUXaooLE2k638Ho/vnJ5WY6mIHskLkbAiplQPHmMbq
	 L4f76SaBq/tqJsV16liLcShINdmPOyPyj2d5Db4bKzJnRIEXRk9FxEsEDeLRqkyAr4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p9IirqDfAOTVejDkPFAqBuLyzIAHl90Deo3aTCgyC9U=;
	b=SxI4CwQIzsDuWjvu1QSzgztHZCm4CNIt0llIhbeca3P2mjAT5uZ5z9iwX7FqUfCH2XfU
	 tJhKcxVNWUvEViJKoJb6ArdsOKC7jodynf7vca1dc8sg37cwbTZLaoXV2D8zf8kGF6Kej
	 veROiypJ7PYq+2gcWEPBqgkIwNYo5jIl8JkNgyiubXVA6cYKx79atwVChHmP/O3jiVRiV
	 y1FsFTv1hj/gAs3cL4d/RbMBORNFniTwHVWGkykR/XsokLUsfm4GHGA8FUMSWOGiHK36H
	 24XrtfCTwWaHdXxsnnQee1OB55pCmFMX4BDihUh7WpHqzvEqKHagbVki/CDednj0pJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aX+Cj3JN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D369B606A6B8
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 20:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D369B606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aX+Cj3JN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso62349875e9.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 12:25:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638317; cv=none;
        d=google.com; s=arc-20260327;
        b=hVQPeFo49lX09ZFi0nZ24zZGXwYalubXSQkpagyFKMm8vta0mHQuD2Yb1OJFURU+Vz
         rkWXPdChVM+p3GSIQya/z5OaJ+Da61j3w8PjPPPa+HFm+BKAZYwwQXxaw2IQQT/hsW+t
         osrFRxBZIM7A30868MadHvZxXZ4jkSJ7ZQwrFnqoyOLjywa5unH3/omhhMXUzWbPkv5V
         KVV2ENmsqbsuU4RJpQ0P5soGq+5lmnNqLAk3FYt8eyMFy6h85ACXdk/f9Q2I1rmBA+QQ
         7gG5LIG3JL650BSXT9O7x7Fy6m4q7S2TbOXlwMI+wgJFhijXJqobqO4jRiMmILCZLmwx
         FJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p9IirqDfAOTVejDkPFAqBuLyzIAHl90Deo3aTCgyC9U=;
        fh=RXmz2FXI8lCC0I7ED1HZq9NIZpep5QCjRFVffMeuggQ=;
        b=ZNRUG4+LiTUazBzuzm1gclzfg5Lksxb43m1m3FYGA1jT7KnCZwK5r+3ll3cXGIiBWM
         qKF8CPkDj4r57jz60XmplDfpggH+3frpXzk9kvKb4XAvqHIDXu9YLmc3cE9unP5zGKiJ
         ljiRUuAC0NTyS28lSn2DWmPdgvGF6RFyyThN9e/8FoRwVy6JExg+ohc5QWv5JeNyZFjQ
         CTl7J9SBK9bdtI1E7JbqnTkVbazWoZviZjsjVt5jVdaMxQhM5Jw/YhQkWNd8vTHSEOeb
         LUYqMeWDPqbYMsfC6MN/OX20exrdp/R/iIOKZhLmIcaxMIYZL+nFyDTtE5TH5e2YrfEf
         exfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638317; x=1796243117; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9IirqDfAOTVejDkPFAqBuLyzIAHl90Deo3aTCgyC9U=;
        b=aX+Cj3JNHDUu1UFcLouYXhAJRXTA4yHHvYxoyu/YDz3Uuf4nGURZiF8crZdDOppLuG
         iOUOFKHimJpQDg/XVFSIx74h3uFVz3Cn/7R9l1URw8byD44rwlspl5gKzCryPX7zNuXN
         uZ34pt8ZPghg1FUm5SGtidgy4fi2IWKVGvzAAEOwEehoNVfpxz6Vm6EX3j971+YjDuQK
         pjehmJOsQjTaV1hJCevBaVV/br8Dp/+PyumCZeYG2+se41i2nbs94mnuWSFHiKUro1NF
         V2nm0CdJO65oxONEelwczKHmOANXOJ2dV8liIfea8+CDLQrCktjP4XamKGmToNjIW6MI
         raVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638317; x=1796243117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9IirqDfAOTVejDkPFAqBuLyzIAHl90Deo3aTCgyC9U=;
        b=y5wgIfq2PsRmEUbbR7isIfZCr2VP5CXhOo/h5Sj81zMB76C3EXHDEekOa+PQcO8O/0
         puyBqdvo/F0qFgyCjdVle3f/2Ou9/SJYZAHccsHpR8c1QbQENCRjAfClBWvnfgTcoeu2
         itzSBvNObIRwnQEbpZ0vwww9d+LxHuJ1ZFDM604mOvorz2jcL2vHzyawhq3klyDOuQhf
         CTUI45HnTnbgt+NzyV7DIVwVi/LbPILU8vW8KHs7CKrc7CYl2xAVnSL6hnGPUKpsv4DM
         UR6naNbHBXSSbifQaKGUHEH7haiNK0sgga5ZNkwjGd3jWU0v/+E1r8eNGII0ld10PqiO
         ttRg==
X-Forwarded-Encrypted: i=1; AL+hErGKzHA+5Wm4OgvjrXzdXmC3zzuw+rrQQpR3JDwy7piAZqzLT42D6r5qk4MyGQSFRnJlFw/o@lists.linux.dev
X-Gm-Message-State: APuU4Z+j9YZ18vOuki5ZWeRoRJFisdpBvCS4BpnL+PPL8Ouj06J0lqUD
	145mK6ud6IaE/Kysishb6sU9lgBs7c4NaqPSA+oti6XpLCoIIGhBY2HCiPY2ct4+DSRBpL8wSXs
	ISWh+wfvmy8jcE6mphmi4TdBf0vQYLmI=
X-Gm-Gg: AZFdTZeVBw2VWtF/a4Inu/jyYsUZffA40a/SdXtl1dAY/nq3rUx12UuSRk12oZvZUG+
	yn4oU3h0MoA/6LLZ7813FxhKwKI9mXv/iTe0GBG0/wbPDGqcGnJIDVzEqu48wcgmysXnWsrjFr3
	HsCh1UrS6Kuh4fVoRgYvW1Z8wxtgkAZIpd222w7CM9AcyHGpoHcLEgtHpV+mwsUBwh3fAAVYRZR
	0OR65AsOsPNrnktDhIcicUq9LvEcphuRDUk2vHZfEqY/XDz0hvtlRIq6yk3baz/7oPvnSEU8uLG
	t0AMn27UztOpHIe1Pwgz1XodmjrrMH6kx+qRvMNh8CgPZEpUmQsnJyyOGalFdj8SvwCpuFgYvk/
	5T8NA/MxsKLp2WwXe+vTnVf+bU/XQM83SaphDcJqNxL6kBCxoh7+xh2v94tErcN3exbnYlFJyp4
	OSORPWnrcQEKQtEWt8eaQ=
X-Received: by 2002:a05:600c:1389:b0:4af:83ad:8f70 with SMTP id
 5b1f17b1804b1-4bb88924f66mr382908465e9.35.1795638317113; Wed, 25 Nov 2026
 12:25:17 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-15-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-15-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:25:05 -0800
X-Gm-Features: Aa3M54o-lsDlv9tHK0FdKSsemQf2iUiz2mvyNbuvwkHzJEpFwnOT1T_ooxy3Pro
Message-ID: <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/9] kallsyms: Add KALLSYMS_QUERY_BY_ADDR
 ioctl to /proc/kallsyms
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
> Symbolizers such as Perfetto read all of /proc/kallsyms and keep a
> sorted copy in memory to resolve addresses.
>
> Add the KALLSYMS_QUERY_BY_ADDR ioctl. It returns the symbol that covers
> an address, from the same sources and in the same order as %pS. BPF JIT
> symbols are hidden when /proc/kallsyms hides them. query_flags must be
> 0; it is reserved for other modes.
>
> The command uses 'f' 0x31; register 0x31 in ioctl-number.rst.
>
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |  2 +-
>  include/uapi/linux/fs.h                       | 13 ++++
>  kernel/kallsyms.c                             | 60 +++++++++++++++++++
>  3 files changed, 74 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documen=
tation/userspace-api/ioctl/ioctl-number.rst
> index f5dbb597257a..d9b66e7a29b7 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -250,7 +250,7 @@ Code  Seq#    Include File                           =
                  Comments
>  'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       c=
onflict!
>  'f'   10-11  linux/fs.h                                                c=
onflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   13-27  linux/fscrypt.h
> -'f'   30     linux/fs.h                                                p=
rocfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
> +'f'   30-31  linux/fs.h                                                p=
rocfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   81-8F  linux/fsverity.h
>  'g'   00-0F  linux/usb/gadgetfs.h
>  'g'   20-2F  linux/usb/g_printer.h
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 987569dcdbea..c1a63c8560e2 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -676,6 +676,7 @@ struct procmap_query {
>
>  /* /proc/kallsyms ioctls. -EPERM if the opener cannot see kernel address=
es. */
>  #define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL=
_MAGIC, 48, 0)
> +#define KALLSYMS_QUERY_BY_ADDR _IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL=
_MAGIC, 49, 0)
>
>  enum kallsyms_query_flags {
>         /* Match query_name as a prefix. */
> @@ -717,6 +718,18 @@ struct kallsyms_query_by_name {
>         __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym)=
 */
>  };
>
> +/*
> + * Find the /proc/kallsyms entry that covers query_addr, or return -ENOE=
NT.
> + * ftrace trampolines and kprobe pages are not resolved yet.
> + */
> +struct kallsyms_query_by_addr {
> +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_a=
ddr) */
> +       __u64 query_flags;      /* in - must be 0 */
> +       __u64 query_addr;       /* in - kernel address */
> +       __u64 sym;              /* in - user ptr to struct kallsyms_query=
_sym */
> +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym)=
 */

nit: same as in previous patch, I'd keep "sym_size". But hey,
"sym_len" is even better and follow same naming as with sym's
name/module, no?


> +};
> +
>  /*
>   * Shutdown the filesystem.
>   */
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 29a9da04d8a3..6d7032cd3fd6 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -1223,6 +1223,64 @@ static int do_kallsyms_query_by_name(struct kallsy=
ms_query_by_name __user *uarg)
>                                          &bufs->m);
>  }
>
> +/*
> + * Look up symbol from addr. Copy the module name under RCU, and hide BP=
F JIT
> + * symbols as /proc/kallsyms hides them.
> + */
> +static int kallsyms_find_addr(unsigned long addr, struct kallsyms_sym_ma=
tch *m)
> +{
> +       unsigned long offset;
> +       char *modname;
> +
> +       guard(rcu)();
> +       if (!kallsyms_lookup_buildid(addr, &m->size, &offset, &modname, N=
ULL,
> +                                    m->name))
> +               return -ENOENT;
> +
> +       /* Outside vmlinux, only BPF JIT symbols have no module name. */
> +       if (!modname && !is_ksym_addr(addr)) {
> +               if (!bpf_jit_kallsyms_enabled())
> +                       return -ENOENT;
> +               modname =3D "bpf";
> +       }
> +
> +       m->addr =3D addr - offset;
> +       strscpy(m->modname, modname ?: "", MODULE_NAME_LEN);
> +       return 0;
> +}
> +
> +static int do_kallsyms_query_by_addr(struct kallsyms_query_by_addr __use=
r *uarg)
> +{
> +       struct kallsyms_query_by_addr karg;
> +       struct kallsyms_query_sym ksym;
> +       struct kallsyms_sym_match m;
> +       int err;
> +
> +       err =3D kallsyms_copy_query_from_user(&karg, sizeof(karg),
> +                                           offsetofend(struct kallsyms_q=
uery_by_addr,
> +                                                       sym_struct_size),
> +                                           uarg);
> +       if (err)
> +               return err;
> +
> +       if (karg.query_flags)
> +               return -EINVAL;
> +
> +       err =3D kallsyms_copy_sym_from_user(&ksym, karg.sym, karg.sym_str=
uct_size);
> +       if (err)
> +               return err;
> +
> +       if (karg.query_addr > ULONG_MAX)
> +               return -ENOENT;
> +
> +       err =3D kallsyms_find_addr(karg.query_addr, &m);
> +       if (err)
> +               return err;
> +
> +       return kallsyms_copy_sym_to_user(karg.sym, karg.sym_struct_size, =
&ksym,
> +                                        &m);

nit: if it fits under 100 characters, please try to keep code in
single-line form as much as possible


> +}
> +
>  static long kallsyms_ioctl(struct file *file, unsigned int cmd, unsigned=
 long arg)
>  {
>         struct seq_file *m =3D file->private_data;
> @@ -1232,6 +1290,8 @@ static long kallsyms_ioctl(struct file *file, unsig=
ned int cmd, unsigned long ar
>         switch (cmd) {
>         case KALLSYMS_QUERY_BY_NAME:
>                 return iter->show_value ? do_kallsyms_query_by_name(uarg)=
 : -EPERM;
> +       case KALLSYMS_QUERY_BY_ADDR:
> +               return iter->show_value ? do_kallsyms_query_by_addr(uarg)=
 : -EPERM;
>         default:
>                 return -ENOIOCTLCMD;
>         }
> --
> 2.56.0.679.gc527c65306-goog
>
