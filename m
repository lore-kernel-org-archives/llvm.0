Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA8780B
	for <llvm@lists.linux.dev>; Sat, 12 Apr 2025 00:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744416569; cv=none; b=V4w1qpU8plNAFCBb5cXxN4egjPaHabPQm30h1b9+9SSSVSKTQltNnCKZ8/bwFLpiemwHuIqEIdcUKMv+4YdKAOdLvTrtu113/TQ1uhi2OSCiZ590x2Gaqy5+ZpFq0k+LOdqW8AZs6DHzltsHb3PVi66c0IRhicpVgGgO7Kui5JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744416569; c=relaxed/simple;
	bh=slG7ZFqjM0P/YPzxS6s5ruPPxuA1SgdXhHRCsMqCfpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvMoMHFUOlr1WK8jxO4lKYKVK91ePy7lvHO8a5xdrC8u68bEB7OliWQnYmbMcAg6BLSWiFEnZ+1deWymuSDT1zZ4u5lSWcLhY1nr/hjefOsi33gw/QNxEhFOCL2t/cGfeiPDb1TppButZ4DV7kmRt8HTGBZM6JWgGDVZypASTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uh8pmEa6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uh8pmEa6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe574976so18309655e9.1
        for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 17:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744416566; x=1745021366; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2GCjRQaYLHuBl+cFkX5JcBxBsl6uDH5BuvGq8wYLRI=;
        b=Uh8pmEa6j9B8qoXjGVb4YnQ6acrKK2+fZ2T8AocPDaWKRp/eIYolLcZM+Uclf52lLs
         IzlY8zW4zXmgvVMog5xqFSdxmBgREd+Czvi4vzd5WSoA48uYxwUUUoS2O07m0FyRWA1u
         gIhCJcCHhhOCYVlTwSZSzJfnkZnxUaPMnOVMzYIwJUcTK1mm4ETge+dy1g3Cf3a0+tgK
         TMVoVTGbUTHePqTAxpcapILodPXR/Eg4JfT9gd9urKxvQbkpYBCmj5y4kZJlbZltRI2O
         FU0DF8ZnCTtqKpabocswUgLCPkMvqKUoON1PqYviBTQA+Sgn6b43oARV50KcofbEC24l
         VD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744416566; x=1745021366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2GCjRQaYLHuBl+cFkX5JcBxBsl6uDH5BuvGq8wYLRI=;
        b=THge+oJPo2lVuFK6Lm3Z846NfqH6sOVStfa8HW+wD58LHXJMqN9kQAkLbuesBjTUSu
         ozjnUX6uBwe2XpqRhXWjQjiLrJPn9/N8YGAgZaoCaDLA2MN9RTYnTul6SyGlSZAJqkOh
         Uof4cOtTJ1Jlep4HZwWV/BKdv3RI9+uUwK1ZYvf6uqQTG9WMwyGyqKtL1Tp7+L3QZG6U
         eCL1IlMvl1oFhOCr/yFyWRcYLfI1QpXLztYmeY0Yy/WSvrwRl4gUi+HTr1JwU0SRWmEQ
         DfeGpjhFkM/w2GiG+al9pfPNnsNP3RT1FDPZhOdkeN1qRppmJO60Kvk9oXt/n1khLpvJ
         lftQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF8MjDA6QclBpx6z2QVrOnH2xBkoNHL5JYmhIeIUbyP1jtH2PczFqhtalJ5PtKLtoU5K3Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwNhYB3R/wus8kHCTsWcAxT/IAMivDNM6pl3lEeLDACBc/f+1sS
	oykt4uYuriDb7zLO7esIJ22jL+GLpCKZOPWc4SVUUJvuKfdEqYmGn1SzzB4PMtWNLA80P/YEQEt
	GByS4Y8qxv0MfU8rIZ49RAWDogW0=
X-Gm-Gg: ASbGncuokSXVcFj6p5eXm2InlTW9iyFSHEuJFgUdm3AyFuetHiRDjBrQxv186n+4CPn
	ugi7VGokrQ6x+C5XChnGEt7I/EgX8qUWQZOYDOalBkpvaRGCVCa9SO3+ujWq3bFMcQ3atgwrReA
	2YMqslO6WAcsn64kyIiTSDKPERN0lmOWnqlcOtPQ==
X-Google-Smtp-Source: AGHT+IER5g1V+SGACXD789HoA96PF5Q+6oEkXwJNtoTADXBrV4pog5v9nyOvdiwVLDKGrhB5NiVs+frZTCfJMF//ErQ=
X-Received: by 2002:a05:600c:1e1c:b0:43c:f8fc:f687 with SMTP id
 5b1f17b1804b1-43f3a9adc61mr49442465e9.27.1744416565507; Fri, 11 Apr 2025
 17:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com> <20250404215527.1563146-2-bboscaccy@linux.microsoft.com>
In-Reply-To: <20250404215527.1563146-2-bboscaccy@linux.microsoft.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 11 Apr 2025 17:09:14 -0700
X-Gm-Features: ATxdqUGoWOEoj9dKHnOcyxWEmhHLYFaTJ3UVlV4EkUb8mJP4lqeOyUKxu-D0tAo
Message-ID: <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, nkapron@google.com, 
	Matteo Croce <teknoraver@meta.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 2:56=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
> +
> +static int hornet_find_maps(struct bpf_prog *prog, struct hornet_maps *m=
aps)
> +{
> +       struct bpf_insn *insn =3D prog->insnsi;
> +       int insn_cnt =3D prog->len;
> +       int i;
> +       int err;
> +
> +       for (i =3D 0; i < insn_cnt; i++, insn++) {
> +               if (insn[0].code =3D=3D (BPF_LD | BPF_IMM | BPF_DW)) {
> +                       switch (insn[0].src_reg) {
> +                       case BPF_PSEUDO_MAP_IDX_VALUE:
> +                       case BPF_PSEUDO_MAP_IDX:
> +                               err =3D add_used_map(maps, insn[0].imm);
> +                               if (err < 0)
> +                                       return err;
> +                               break;
> +                       default:
> +                               break;
> +                       }
> +               }
> +       }

...

> +               if (!map->frozen) {
> +                       attr.map_fd =3D fd;
> +                       err =3D kern_sys_bpf(BPF_MAP_FREEZE, &attr, sizeo=
f(attr));

Sorry for the delay. Still swamped after conferences and the merge window.

Above are serious layering violations.
LSMs should not be looking that deep into bpf instructions.
Calling into sys_bpf from LSM is plain nack.

The verification of module signatures is a job of the module loading proces=
s.
The same thing should be done by the bpf system.
The signature needs to be passed into sys_bpf syscall
as a part of BPF_PROG_LOAD command.
It probably should be two new fields in union bpf_attr
(signature and length),
and the whole thing should be processed as part of the loading
with human readable error reported back through the verifier log
in case of signature mismatch, etc.

What LSM can do in addition is to say that if the signature is not
specified in the prog_load command then deny such request outright.
bpf syscall itself will deny program loading if signature is incorrect.
