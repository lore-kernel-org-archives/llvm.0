Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A013790B
	for <llvm@lists.linux.dev>; Tue,  7 Jan 2025 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258671; cv=none; b=RAwLfToUjqvVIWk0RzjukrV1thZrVj9HMQRJQZGc8wSwDuJnme6+Wc3nY4ddVbJSsvemuEIU4efOIhJ0ks9uJJDtloO+ctkYaDTz4gYAjpNdhY2zORhuWhWk/jqAg1+vkMw0KBLAmUnrc0Xblz52EjcpjD2NKau4x+Wi0RPlJLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258671; c=relaxed/simple;
	bh=my8BlkfcoQMNumyQLcWWzAGs+ACYNFadcrEy1nawm/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTjj5YMsxVy2lgwhUAj8ozNjXY/cQQwZhFb/wkdmQw8UNHc7S2yOGuawVipo8q3TXIEiDm8iSUq2fhR+ijmlGorlsHNDtj8kNG03kgGo6jSphtYC1iEOKR7EPMMt8fd9h5mmRiqYsAPKevtqwwefaG9CV/jZPXI2RqYxSgZgarY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Dj1cUJgn; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Dj1cUJgn"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so17153209276.3
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 06:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736258667; x=1736863467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alPlDRFJ4s2zfqaiVuet99qmMSbEvlweaU9isG2zVDg=;
        b=Dj1cUJgnWS7AihFb3f4TxUeHdNVqqJ7V8AAAxhI7825OBM9mjx3Id+1Bo+wawVccWR
         y4e1MDd77ZI3YtQEMBC3QlKWQ7KK4692ETl3Tmk5bcskQOgoPsC63eAVLFikf8ApSEz1
         jZfJ2XMEBcIvqgtJ8vIN4xcDF4qxEid4zDdeftsz539S9+54gKHDpnEvM65JEe6j30B1
         K+hvycBsYL2M9DG0gDDssWb/T4rLqwvixZiZKN2Mf/TnsHjXHSeXzNt/OR7NefrGsL8w
         tdFWZ8dSlQz3G++fS9tZkOBBvPRUFRGuiws4Td01pb+J2+IBS3TYuBbU05NlzuW8K/q3
         OcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258667; x=1736863467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alPlDRFJ4s2zfqaiVuet99qmMSbEvlweaU9isG2zVDg=;
        b=B/k+vaXkwhcjxqC8vUEuIKivvi8EiL5FenGVQjDvFjqeKsF6g5ip1Tcy5RR3WlOEcL
         Q4CSE/eaSz3vjRjJB4ULm1yYviKOi9N3e2QHGkkWUDqFKBYzCtux8go6Cx+J1BVq1q+n
         qzgI37PjEamCuFwzJ9aXrrEbxVLKUIWW9ztJrxAAAIARQsg02+S3JTxZ1GSkAQC9LxOP
         j6M5gVtYuwl449a6PRkR7rFJPdijaJ0RopLalD42+THPyWThWCv7GxRwrI9MgapoQbZV
         T06iMdh4NOc0VsE4Ez0jQqFT1fD1p5s8xnfdW90+a+alqFcfRLWcXjzXUim8ymp8qUz4
         KvPw==
X-Forwarded-Encrypted: i=1; AJvYcCWC2YPUngy7O6oTblaJ2FXGSyWn80BNib48d3RWlwyIQaMv/0PL1CT28phoW7sniH2Sb173@lists.linux.dev
X-Gm-Message-State: AOJu0YxXSFqj0cD1+5DxwWNRjcmpwJh1sYz1PMnhvChMbTQAIdUytqbU
	mrBxS2belzyZqsDYPcLxhAuvzzVVtrt2ruUXaWowsJYdYX7+jLZdZ8Z27LmdlGidgDKGbUV7ME1
	w7z3ZNkbuz3bgpEYf+8ZsewJCL6Y=
X-Gm-Gg: ASbGncvH0Vd6Zl8ne/RN09qIgpk8ij9lJGfVCFFbATrkKwsCH/GtOL5s/IUMAZzm4A4
	vklL7zmagNzYT9BGKVyugC39RxHuFsXXP7lS5
X-Google-Smtp-Source: AGHT+IGb2kCfYQdMckl3G2TQzxilU2C4s/v7IV1Z5o4pTSNY2b+E8pQph4sMNWw6wXQNB/9GuUDDknrf5F4u4idHTdA=
X-Received: by 2002:a05:690c:6d09:b0:6ef:a187:f377 with SMTP id
 00721157ae682-6f3f820e059mr477232917b3.34.1736258667137; Tue, 07 Jan 2025
 06:04:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241216164055.96267-1-cgoettsche@seltendoof.de>
 <20241216164055.96267-22-cgoettsche@seltendoof.de> <CAEjxPJ7NdTWu4dspY9cbPMtRsW_jERoRbKBsObbvsEnwgmZ8Ew@mail.gmail.com>
 <EF4B3759-2C4C-4A15-A721-6B2D0FAFD84F@gmail.com>
In-Reply-To: <EF4B3759-2C4C-4A15-A721-6B2D0FAFD84F@gmail.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Tue, 7 Jan 2025 15:04:16 +0100
Message-ID: <CAJ2a_Dcw3KQUNv1HQFp4qPOoZ972hjr6Qa2LAXTTv6SkV_Pd0A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 22/22] selinux: restrict policy strings
To: selinux@vger.kernel.org
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Paul Moore <paul@paul-moore.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	=?UTF-8?Q?Bram_Bonn=C3=A9?= <brambonne@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Joe Nall <joenall@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Jan 2025 at 00:26, Joe Nall <joenall@gmail.com> wrote:
>
>
>
> > On Jan 3, 2025, at 2:12=E2=80=AFPM, Stephen Smalley <stephen.smalley.wo=
rk@gmail.com> wrote:
> >
> > On Mon, Dec 16, 2024 at 11:42=E2=80=AFAM Christian G=C3=B6ttsche
> > <cgoettsche@seltendoof.de> wrote:
> >>
> >> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> >>
> >> Validate the characters and the lengths of strings parsed from binary
> >> policies.
> Excellent idea.
>
> >>  * Disallow control characters
> Fine here.
>
> >>  * Limit characters of identifiers to alphanumeric, underscore, dash,
> >>    and dot
> Fine again.
>
> >>  * Limit identifiers in length to 128,
> Fine again, our longest
>  - type is 51 characters
>  - attribute is 31
>  - boolean is 46
>  - role is 12
>
> >> expect types to 1024 and
> I don=E2=80=99t understand what this means.

Similar to your list of the length in you policy boolean, role, user,
class, and permission identifiers are limited to 128 charatcers (not
including NUL), types (and attributes, which are just special types)
are limited to 1024 characters, and individual sensitivities and
categories are limited to 32 characters.

>
> >>    categories to 32, characters (excluding NUL-terminator)
> One category or the whole category string? A single category longer than =
7 characters seems pretty unlikely and 32 is wildly short for the whole str=
ing.

This only affects individual sensitivities and categories, like "s9"
or "c1023", not whole MCS/MLS parts.

> Joe
>
> > One option if we are concerned about breaking backward compatibility
> > with policies in the wild would be to make these restrictions
> > conditional on whether the policy is being loaded into a non-init
> > SELinux namespace, similar to:
> > https://lore.kernel.org/selinux/20250102164509.25606-38-stephen.smalley=
.work@gmail.com/T/#u
> >
> > That said, it seems hard to imagine real-world policies that would
> > exceed these limits, and likely could make them even smaller.
> > But as Daniel said, we should make them consistently enforced in both
> > userspace and kernel, and potentially these should all be #define'd
> > symbols in a uapi header that can be referenced by both.
> > Looks like you left the type limit at 1024 despite Daniel's
> > observation that CIL uses 2048 as the limit, but as you noted, given
> > the page size limit on the entire context by various kernel
> > interfaces,
> > this is likely fine.

I interpreted Daniels comment more like a assessment what CIL
currently constrains, not as a request for a change, maybe I
misunderstood?

Exporting the limits via a public headers seems reasonable.

Maybe for a smooth transition one could introduce a build time
configuration (CONFIG_SELINUX_STRICT_IDENTIFIERS?).
This configuration can be disabled by default, leading to identifiers
not being rejected only logged.
Than after two releases the default can change to reject instead of log.
And after the next LTS release the configuration can be dropped again.

> >
>
