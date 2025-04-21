Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9711E5B89
	for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 20:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745266388; cv=none; b=DhK4BArnaOiM7M6K2EG33ARjd2vgxf9OELe7JrwialXlzknvI3H8Fj6xTFar3e/eLyMm9VOeefiuogF6pkZyRQLtWgjxN71Yi2r7uP1q8RiNIvR1uEeKEaqqNyRPbQ1Wv4qszk01HU/6zz6NYt4K42k+GGQu6B12cehD4uooVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745266388; c=relaxed/simple;
	bh=KuPglRXXva+tRt/1RLlrTkqN4JV8/fN1ppPKTXytjUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKB5HQHt4FlOOsFz2zy6+Mvj67FKk62ZPilJvETQqwYGmHRWT6i0OxYgL3jUjG3CIMcL6bfno8YKhI1kyRK/QF382cA63rgxp/R973aFCv3U+bKutPWlmYqOTKoBJlYbVCGACVVo1jwS0AyYHyjqMeuuCFqUFZRWv1J6Jp5mf6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJ2QG9XD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJ2QG9XD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39d83782ef6so3821509f8f.0
        for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 13:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745266385; x=1745871185; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuPglRXXva+tRt/1RLlrTkqN4JV8/fN1ppPKTXytjUk=;
        b=lJ2QG9XDAmN0dfLB9Qc4/iC3OLI2Ew5N6XZaAWV3oBgeczia3YcSxTJxIXGUP+Kzrg
         qasmqD93obZgjWXhBaXuf0K6RbjedO9cAU1Sn8cmbAJouVtnWh+xNxMfkEF+/fW3GRDl
         kFsdqsPoms8kxVAYSztY/loBKgVEzoCgzx0d1Rp+TjMykFu8sh1nUrv6quPoVK8e+S+y
         QvoGnKkdJU7POLNS+ND1peKZ/gZLxix6wGEAoE0CFW6IDj1Kj0Egy7UFAPPsnQhc/SEP
         /2h381ldSlV6DKvAey5ibtL+GEW3VGtsVwfHqUxz3sfz57IQuBQJyKs8BuO5NVceLo7g
         guqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745266385; x=1745871185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuPglRXXva+tRt/1RLlrTkqN4JV8/fN1ppPKTXytjUk=;
        b=v3PjtBomy1Ow4aILPxWVJRdTXK7LcEbDKR/scRggnEdYpnHT/qO/vMMfcrtRN+bmKL
         JOaZ9DeUEInsFXpaIce5zIXcW7UGRYkOT01Pswk0tIQYPi5XJqc0G2NYvsSfm8U1x7+H
         cZxH7x561FRZovS8sPDddVNXcJVkLECuve64s/fjxcRdCl1oy+iR2iRPPOVBXqPyexlN
         nZk6RN3IxXO0U4f20tYmSQZOKe3xJrWOr4zLD2EeEUMTd/eu2LUFGRXw+cP0SMKmXDYD
         fg8JHcrbBpOVVeVdocgneuY03F527xz4gMxoduiUmXBq9bZqzVq3Gr2JL5o5B2yhtn0Z
         5y1w==
X-Forwarded-Encrypted: i=1; AJvYcCXpYGY/PdO+IeSCcesvxBNQ0cAU8mZff3Bwtjt+AJcjnCQeKbHUPwQhgX4Bu5lGNOQY3885@lists.linux.dev
X-Gm-Message-State: AOJu0YwnBgC/PfpK4fFxZIeb5onFkXA8f5rJAtMZ6VMwSudukLjail2d
	xXfwKDkBWp2XN5npep+UrL8o1VsYeKyRXqn0cCBFepxfzkaUQdEMgY1rAabi5G+ZAk2m6bPnqKA
	RDXMy9eq1ZnJoUelHMr9JxprSXLA=
X-Gm-Gg: ASbGnct4QdtrdV/+r6UiSaeNDFFMJcZMe6VPdey+ozK56G5DJcuNvYCwNxc66rXMUOw
	iLzng15R3g3CqYwZ8r8jGtRXsNU24d/Et9P2jrbBgrc0brFAi38UvrF1iB/2T+8V5SUqiqOb31C
	MZ7YETMNSlw8bFRIQ+jcENrQlistto71yWInJbAw==
X-Google-Smtp-Source: AGHT+IENKQ7OPTDyXPDMm1eLtepnMBhG5YwiFzhKG6wQNnttfR2T/r01wwOVnACt/7hy7lkYefJ9i7RiLoFp/wuHfL0=
X-Received: by 2002:a05:6000:2285:b0:39e:cbca:74cf with SMTP id
 ffacd0b85a97d-39efbd5a34bmr10154288f8f.6.1745266384670; Mon, 21 Apr 2025
 13:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
 <87semdjxcp.fsf@microsoft.com> <CAADnVQ+JGfwRgsoe2=EHkXdTyQ8ycn0D9nh1k49am++4oXUPHg@mail.gmail.com>
 <87friajmd5.fsf@microsoft.com> <CAADnVQKb3gPBFz+n+GoudxaTrugVegwMb8=kUfxOea5r2NNfUA@mail.gmail.com>
 <87a58hjune.fsf@microsoft.com> <CAADnVQ+LMAnyT4yV5iuJ=vswgtUu97cHKnvysipc6o7HZfEbUA@mail.gmail.com>
 <87y0w0hv2x.fsf@microsoft.com>
In-Reply-To: <87y0w0hv2x.fsf@microsoft.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 21 Apr 2025 13:12:53 -0700
X-Gm-Features: ATxdqUHHcxXreT9hXAZ5WwrofB06M_gd4QuHmZEieMGyBqtir206iJME0ypgG-U
Message-ID: <CAADnVQKF+B_YYwOCFsPBbrTBGKe4b22WVJFb8C0PHGmRAjbusQ@mail.gmail.com>
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

On Wed, Apr 16, 2025 at 10:31=E2=80=AFAM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> > Hacking into bpf internal objects like maps is not acceptable.
>
> We've heard your concerns about kern_sys_bpf and we agree that the LSM
> should not be calling it. The proposal in this email should meet both of
> our needs
> https://lore.kernel.org/bpf/874iypjl8t.fsf@microsoft.com/

kern_sys_bpf was one example of a layering violation.
Calling bpf_map_get() and
map->ops->map_lookup_elem() from a module is not ok either.

lskel doing skel_map_freeze is not solving the issue.
It is still broken from TOCTOU pov.
freeze only makes a map readonly to user space.
Any program can still read/write it.
That's why freeze wasn't done back then when lskel was introduced.
There is still work to do to make signing practical.
One needs to think of libbpf equivalent loaders in golang and rust.
The solution has to work for them too.
In that sense bpf signing is not analogous to kernel module signing.
Programs are not distributed as elf files.
elf is an intermediate step in a build process.
bpftool takes elf and generates skel or lskel and
user space does #include <skel.h>
to access maps and global variables directly.
See how systemd does it.
bpf progs are part of various skel.h-s in there.
systemd is also using an old style bpf progs written in bpf assembly.
We need to figure out how to make them signed too.

The signing problem is big and difficult.
It will take time to figure out all these challenges.
Introduction of lskel back in 2021 was the first step towards signing
(as the commit log clearly states).
lskel approach is likely a solution for a large class of bpf users,
but not for all. It won't work for bpftrace and bcc.
lskel loading is also opaque.
The verifier errors are not propagated from the loader prog back to the use=
r.
To load normal skeleton the user space can do:
LIBBPF_OPTS(bpf_object_open_opts, opts);
opts.kernel_log_buf =3D my_verifier_log_buf;
myskel__open_opts(&opts);
There is no __open_opts() equivalent for lskel.
It needs to be fixed before we can recommend lksel as a solution
to signing.
