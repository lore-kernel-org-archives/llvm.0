Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E721EA7D2
	for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 18:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261573; cv=none; b=j6Y8ggL39wXWbfY3PY4ibgfo/RapApaGFrBu4oW/n3mCNjeOrSr+7P0tr+mmCKlOkvyd4r7CtUsCbYFVA3m9vgfCxFnI1TWtjOcBp5WALDb66kqdIU97WoiPL2BujaU4nAaG508JrJmNpGe9Plu5M45AE1Q83XfMz3Z9h2pA8eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261573; c=relaxed/simple;
	bh=MAT6Ew2gJpdMJ8irAU8emiSANZdL6DjJHNFxnFPsi3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQ7tChs/atfN5HItoeIXXj0wmWA9Q/bBCyvsTyRMOaFIILM/8f+BNP9HPf0uLp6qJieXEG2RNi0s+r+nElciyDeqf201njESkiGGAmPZ+QIzkz7SDtHgdxeGeexhCi6v3JxrZ5+y3vzkBGUCfPDDB/z3FAsnqGQfe5NUljfX3vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dbYeHOYT; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dbYeHOYT"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7270e0edf5so3854896276.2
        for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 11:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745261569; x=1745866369; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lz3xUPpEUe/pX3Hqv/1lT4GmPjs/7L4gms/heykjQds=;
        b=dbYeHOYTmwwPER3UOdngK1/GHTSPz8WLOR6U5IBvkDhEnjq1xoSX1fdO29oZzno7ZF
         FE/jDW/W3CW+EcGr9RcyknQSS9Y4aZODimZKe8WqXgJ87xJYSrbbQb+eeXgE5Qvn0Hwl
         L7QEGRooBH9be0Hwks1BTybzvnFBrE/946nzoTiyzt/Et0Hsg2RHuqZowjwN6zAq1tcp
         TyU1Wm7HtEYm0waVHy3ojtImdt06NLDyamEnBXBbfdWtLGA+MjGOLiz+lhSaVTz/E6m+
         doGVJJfCuuQuAUxRka6j9SYGNYZwaQZFyGsF4a5XQ8OoD4V0+06s3xXzPuKDyxFzubdp
         1CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745261569; x=1745866369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lz3xUPpEUe/pX3Hqv/1lT4GmPjs/7L4gms/heykjQds=;
        b=BQPsWBA1HtG0wbLW+taJuzgj0jOESN98gVLEQ5ZgwgyB5UdXLvalEeRF7+Zu3UcMtg
         ZUx/XpV5j2hrZ5rsW16eFpXrEXsloKVt4ZW+sM7HGkARNpXHYu4olz207TPKlnCFNHuJ
         +s+XW9C6DgqrVOMhG5z7NkvgiXBmA3c8MWx9ZsvgwgXAe67O2UZpmgXvaBOzv+575kEW
         TFi5hlL6egkL/F4qUJrx94yELEayORmaYduAJfpcoJl944qppwxlNDHAvw609Sbe7Gc+
         P7akWX2L62vt6mLvzIZsD9rVov0EKhD6y/UazQNNDg3SRttpVED1BeDCsSwijaSlZiaY
         BT8A==
X-Forwarded-Encrypted: i=1; AJvYcCWyvpvQSGIw77Q/FaQEZkQIkx1GcXLmcNCl4FGfC8X2efi7s6NoiCFeGNU47jCsoK2H/CwN@lists.linux.dev
X-Gm-Message-State: AOJu0YyL2t8x+Alswp7ETREmM3lXp5aLsbj4EfkBP7T1u0lmSilHR3wS
	c2qn8ttXFSD07iuFKu5bNgEpWB+4qH98iruHIfD6iA+JVwHRfCo581iny2gNluYFCHWIeK0reEm
	TYn6zvsvyCFzFmi+vOCA0JxtGfj9BjLp6A5k/
X-Gm-Gg: ASbGncvq/peDHkllOtjEH+9kOxKpPKZeVEjrLBg13WFhOZfj1qBaGSYDlT2AaN4Jg1P
	rWbUX5R52Lhj2NpjUl6gnWoZIRTibXwWaQUFZ3bUr2fyYeYljDxmdOneKbUzCnnDxE31PaWQxTz
	TDdSGYqCjO+NfCZ/5eDkk0pw==
X-Google-Smtp-Source: AGHT+IEuH9hzO8L5xENmqEA5+rCv5QU5f2RwWDzAiO15hUKUo3LnS3Mbacdqm494PthrNYTv96+oKoVST5i5x+eAlHw=
X-Received: by 2002:a05:690c:648a:b0:6fe:abff:cb17 with SMTP id
 00721157ae682-706ccda15f4mr176888017b3.26.1745261569456; Mon, 21 Apr 2025
 11:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <64859c5c8fd969186c1997a340ed6307e2c70f06.camel@HansenPartnership.com>
In-Reply-To: <64859c5c8fd969186c1997a340ed6307e2c70f06.camel@HansenPartnership.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 21 Apr 2025 14:52:38 -0400
X-Gm-Features: ATxdqUEW2UYysWiho25YbREtPd_DwN7ErCdbG2Ug5RajPR5M9exUr19Bmcv_5Vs
Message-ID: <CAHC9VhSu_tn6d2A4-CYQn_Kr4mdRKEBXLabbPkLZuwQcC2KhJA@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, nkapron@google.com, 
	teknoraver@meta.com, roberto.sassu@huawei.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 2:43=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Fri, 2025-04-04 at 14:54 -0700, Blaise Boscaccy wrote:
> [...]
> > diff --git a/include/linux/kernel_read_file.h
> > b/include/linux/kernel_read_file.h
> > index 90451e2e12bd..7ed9337be542 100644
> > --- a/include/linux/kernel_read_file.h
> > +++ b/include/linux/kernel_read_file.h
> > @@ -14,6 +14,7 @@
> >       id(KEXEC_INITRAMFS, kexec-initramfs)    \
> >       id(POLICY, security-policy)             \
> >       id(X509_CERTIFICATE, x509-certificate)  \
> > +     id(EBPF, ebpf)                          \
>
> This causes a BUILD_BUG_ON for me in security/selinux/hooks.c with
> CONFIG_SECURITY_SELINUX=3Dy because READING_MAX_ID and LOADING_MAX_ID
> become 8.
>
> Below is what I had to do to get the compile to work.

That code was updated during the v6.15 merge window, depending on what
kernel sources Blaise is using for development it's possible he didn't
bump into this even if he was building with SELinux enabled.

Otherwise the changes below look reasonable to me.

> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index e7a7dcab81db..9a7ed0b4b08d 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -4133,7 +4133,7 @@ static int selinux_kernel_read_file(struct file *fi=
le,
>  {
>         int rc =3D 0;
>
> -       BUILD_BUG_ON_MSG(READING_MAX_ID > 7,
> +       BUILD_BUG_ON_MSG(READING_MAX_ID > 8,
>                          "New kernel_read_file_id introduced; update SELi=
nux!");
>
>         switch (id) {
> @@ -4158,6 +4158,10 @@ static int selinux_kernel_read_file(struct file *f=
ile,
>                 rc =3D selinux_kernel_load_from_file(file,
>                                                 SYSTEM__X509_CERTIFICATE_=
LOAD);
>                 break;
> +       case READING_EBPF:
> +               rc =3D selinux_kernel_load_from_file(file,
> +                                               SYSTEM__EBPF_LOAD);
> +               break;
>         default:
>                 break;
>         }
> @@ -4169,7 +4173,7 @@ static int selinux_kernel_load_data(enum kernel_loa=
d_data_id id, bool contents)
>  {
>         int rc =3D 0;
>
> -       BUILD_BUG_ON_MSG(LOADING_MAX_ID > 7,
> +       BUILD_BUG_ON_MSG(LOADING_MAX_ID > 8,
>                          "New kernel_load_data_id introduced; update SELi=
nux!");
>
>         switch (id) {
> @@ -4195,6 +4199,10 @@ static int selinux_kernel_load_data(enum kernel_lo=
ad_data_id id, bool contents)
>                 rc =3D selinux_kernel_load_from_file(NULL,
>                                                 SYSTEM__X509_CERTIFICATE_=
LOAD);
>                 break;
> +       case LOADING_EBPF:
> +               rc =3D selinux_kernel_load_from_file(NULL,
> +                                                  SYSTEM__EBPF_LOAD);
> +               break;
>         default:
>                 break;
>         }
> diff --git a/security/selinux/include/classmap.h b/security/selinux/inclu=
de/classmap.h
> index 04a9b480885e..671db23451df 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -65,7 +65,7 @@ const struct security_class_mapping secclass_map[] =3D =
{
>           { "ipc_info", "syslog_read", "syslog_mod", "syslog_console",
>             "module_request", "module_load", "firmware_load",
>             "kexec_image_load", "kexec_initramfs_load", "policy_load",
> -           "x509_certificate_load", NULL } },
> +           "x509_certificate_load", "ebpf_load", NULL } },
>         { "capability", { COMMON_CAP_PERMS, NULL } },
>         { "filesystem",
>           { "mount", "remount", "unmount", "getattr", "relabelfrom",
>

--=20
paul-moore.com
