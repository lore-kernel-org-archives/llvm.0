Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DB4B666
	for <llvm@lists.linux.dev>; Sat, 12 Apr 2025 00:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744419484; cv=none; b=N2xl4VmE8ZR7VYodCj+Vwgx3/2UGAFqFeuMmLKPNR+ax4t0UXjHx0FTCsXayjnwTlSzxaH04cBWRhwxxqLQ1D8AznhUD2Jw1ARMVM6Q01CegdfV04RblGeUAgDCECIeOzFHG6aU23owBtLmcoGjEfkaGWMZiuc9Ctw0UCxeN5XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744419484; c=relaxed/simple;
	bh=4tcELd13teizB6G1R71cLt4/wC29H1yVOSMkrjYkSLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYNw1U8kj8dNyUTgxhquEPXc2W2F1n+802wPznNH+JYFhijcXiMd0OEOL7xgeiUlf4EQCo7i4QvvHJIfbevENcLG8V2ND+htGauKzDkjC/ppZX95oUoXoGbu/U/EiRiiel/lRaIiq0+cadZ85NscbRCOCNdpsTJH8qaCPig+Uu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEI2fy5z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEI2fy5z"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso18281695e9.0
        for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 17:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744419481; x=1745024281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=offdqmvkFJfHM6QzgUBHAoAKLM8GIhKmAd/u+Vakz+Y=;
        b=QEI2fy5z6PJIf5OaBCexnBHnf+7hTonUJHznT6rFHQL6rePWhfjSMg0Mo/OHRWN8uz
         66qpW2XJM5zfojil/k0p5PtLB3LZngniAa0lLSGLQQ9412pwvHBjBJjLbEZ2CGJL4S1u
         GNLGq6I4NabGSNxOAFLvArMhPLDIObCDWL2stD6uKCG4gcZ8gV1cWTH3iyx1Jg1U4g3S
         rZS5RiceQ46MTHHUTM+BLRc9ap4OO3Riv5JXV6eLgWkcx1kMpXZV3sRnS3VJjclnA0+0
         /t7Upl/pHakRhM3gNyD4WtHLQBYX2A6jqSdzpKsDq3dyg+wA7MHCX7aPD+indu9Xf3dP
         s1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744419481; x=1745024281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=offdqmvkFJfHM6QzgUBHAoAKLM8GIhKmAd/u+Vakz+Y=;
        b=ks7mJ3Cvuc4wMJZWk4Bsu2RNKzBuqVk92+z7rISh5/qpo1xy2QZdkBOAGOC9bvirfa
         D8vXiZF5YHpnaz4FfakBdQWAhXJQi5p5/M2mVW5tHWyWIC2fSXv1/9+zUUo/55RJstMh
         PgUPsK6OvJhmw0O0Rw84RGBfL5lmLPgCgQydwUMdhhoJY2k2zW6cA2SdLACg9BzZuTW8
         MroZjQK9MRa+0x0WMoGiUbkgYlRhWug/xl4poJBi6ef5Dgi2P+FFWL3SesJm6jx6kXXi
         T22vE3ZHgO0EZagudaESBDbZoXfNshKsjOjPJwIoS3n2alANFF1NqyODyttKKl+BAzQ9
         S5fg==
X-Forwarded-Encrypted: i=1; AJvYcCWiuHb2qkG2JNGMIhTv2dv7ULOGjUolnW9i3KNoNP07jNiI2dVOa8DKf3DhvbpnxTW0d7GK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/5OwVXxOAoxXqctTQlOG0QihcXUkVb6CB195nh2UTqrZa03LH
	6EIaY4Wk2QW4Q+Ds+61zT2YpSmsTR3AwQxZxmtVWEZU5ljk4NjLaKxC3KGLnDaQUV7zG0gCduhP
	wHB/cUqMfh40Yvd6yPPbtYOmt0j4=
X-Gm-Gg: ASbGnctMoKIDVosmQqCm5AqxYTHSEG52wBB9n2rNZc0To3F6z06brzm7ys7JNhDAQYO
	AS7svSENTz0rakFy3FoaQPmmQcO3a7rC/+KF0f2nt6BC8bum4vMLMvOc7t2/l7aAw8quXJT/hV2
	IEtecs7d4P5bWOv+0yGbFa4qlTf31g3I4qAAbFA/YQrt04zn4v
X-Google-Smtp-Source: AGHT+IEFrfwIhf1dnPGv0cjHH5i2aO5ebUNrMZZQ/ewydMhNLm+WsR+aOi4a8v0IlIUg+wUzUz/zyHgd2Dl4JnAcXUM=
X-Received: by 2002:a05:600c:5494:b0:43c:f050:fed3 with SMTP id
 5b1f17b1804b1-43f3a93d850mr43211925e9.11.1744419481051; Fri, 11 Apr 2025
 17:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
 <CAFnufp1erGboUtRaqLoKC48c+9jmqzEfFW8W46xt77JMC0PFpQ@mail.gmail.com>
In-Reply-To: <CAFnufp1erGboUtRaqLoKC48c+9jmqzEfFW8W46xt77JMC0PFpQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 11 Apr 2025 17:57:49 -0700
X-Gm-Features: ATxdqUE8eJ3t2XNtv61JfqDn3ir3RXF5bRaDRxRoOmmkz_xcdixjr5poHk-cOzk
Message-ID: <CAADnVQJ5VaXVN=L+0ygEWJkMtPZnqAVEoeFiLBvikntX0zD49w@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Matteo Croce <technoboy85@gmail.com>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
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

On Fri, Apr 11, 2025 at 5:30=E2=80=AFPM Matteo Croce <technoboy85@gmail.com=
> wrote:
>
> Il giorno sab 12 apr 2025 alle ore 02:19 Alexei Starovoitov
> <alexei.starovoitov@gmail.com> ha scritto:
>
> Similar to what I proposed here?
>
> https://lore.kernel.org/bpf/20211203191844.69709-2-mcroce@linux.microsoft=
.com/
...
> @@ -1346,6 +1346,8 @@ union bpf_attr {
>   __aligned_u64 fd_array; /* array of FDs */
>   __aligned_u64 core_relos;
>   __u32 core_relo_rec_size; /* sizeof(struct bpf_core_relo) */
> + __aligned_u64 signature; /* instruction's signature */
> + __u32 sig_len; /* signature size */

Well, yeah, two fields are obvious.
But not like that link from 2021.
KP proposed them a year later in 2022 on top of lskel
which was much closer to be acceptable.
We need to think it through and complete the work,
since there are various ways to do it.
For example, lskel has a map and a prog.
A signature in a prog may cover both, but
not necessary it's a good design.
A signature for the map plus a signature for the prog
that is tied to a map might be a better option.
At map creation time the contents can be checked,
the map is frozen, and then the verifier can proceed
with prog's signature checking.
lskel doesn't support all the bpf feature yet, so we need
to make sure that the signature verification process
is extensible when lskel gains new features.

Attaching was also brought up at lsfmm.
Without checking the attach point the whole thing is quite
questionable from security pov.
