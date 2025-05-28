Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B928C848
	for <llvm@lists.linux.dev>; Wed, 28 May 2025 17:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452560; cv=none; b=Y5D0ykXczPVNeQMTibSDqKhwyL9rYwKJVIJy6Dd8pLaEQ6JCyCoQZeNpOisnBodXLuRrc2KmXAAa9nfR7mcn9/PwlTShhULzpBuINyuew/cSgXaSDdrWS0DU9QzBmyOwsFTITY1HVzE7Oc6oDuSV6Sm18k84apVGIfLRzbDJ3MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452560; c=relaxed/simple;
	bh=GFuirEaKGhl5vMyZboOmESj/mIt1D5zTTMZxltcKv0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gA0lJ4uuXcn8YezpbEJX8/743Mv6QFMLTtaSScDHk/Nw+aTjBDkKd00yNTMdWhOHpSla6OzT/7cEWrxN6YecU1gg0HtvCuJ60HUPR4ZiPge7Z6wAqAs/5BmK4asIH7sSq8UNAvKaPwhRnghHYIUVNSjOqsewFnNoUmXEgxv16mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VqkC4o2V; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VqkC4o2V"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so587a12.0
        for <llvm@lists.linux.dev>; Wed, 28 May 2025 10:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748452556; x=1749057356; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUdwWMmdYpRWctOElE23L2fIeNE3afrw4G+RZhKXn0o=;
        b=VqkC4o2VX02YRFKmnP8Q8K8NC1jUhMjTbXLYBPO8vdH/63Iyj9ggHoUf+qLJjMb0EY
         OCKXmIXidVWJ7kzCJBoyO5a2cT/23ur9MztoWAQG5N4yLmorLoUMA/S+HRCyGp7gxhJK
         mZyOZ6tfTikGy7HyiCrcxQN/r64deQIOz/yJAcddzrqbySbetHpUlzyHchssVFEKrjpU
         rI97HO3aqhW8qDeOOX6xeSTwUGufYScNcgqp8rn07pBXJv4HQKtsB5uf9CreNv7DINyV
         sHlwxsLRtxU3l25kijiS10YwHRQ5IKD0w5JwspNvtapxs1EiEqQUXAg2TIXuKPBmN5xI
         YcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748452556; x=1749057356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUdwWMmdYpRWctOElE23L2fIeNE3afrw4G+RZhKXn0o=;
        b=r7jXn9GNwcrwAcKE3nPnz94gIgVNQFw/nsjGPcSLWtEH1GAcW2tDn6cPV/FwWVYjng
         9sPBPLDt+4ydEx0XNT4r+uUPoq3mHC5z/UciTL7oA7aA9sVXTMYjk0G/Z0WhV6QDxB60
         p67NLS1j7U/orbtH3SLyaSn5gsYOoJS3TtA24rl6FOqyvN7C00ONzX7s0bi4q9wp6F1b
         oGiqLQy+q2RDEtExnsai9gX5ySTPr7J3otc7HGgOCvcjfXQYzjm7JB93+4SHVJThT6tx
         28cGcKSDL16RdUXG5j5N8MyicUkz3BuerQlAHE5n4RBGRmvOgtiAdczKeuE6FxOMReb+
         Odyw==
X-Forwarded-Encrypted: i=1; AJvYcCX2z4k9ICm4niZRe0f+8v6lp+ndbEqeyqp53qiNnam97IiNV7JyA/cDb33P7/7lY1KpZCB2@lists.linux.dev
X-Gm-Message-State: AOJu0YydebVBrYZuFoo6QxlEeLDkGCl+G1dr94phih/Hd9ojq2WqV3G8
	Txjc7fGMquaSR8qc2DiLpL1GhbXKLonqI613YPfz4Xod/cfHyBwySi1SCa6++TFx2bYaqNrdiLq
	lYmqz8nHAtQw3QbgQYDl3x8rJcXdeAmmU/l8jJkoh
X-Gm-Gg: ASbGncunDy2XxrVsgkdyBY5YdNq7VFIKCmk+cAmeKosH2TxyRgbeH/xZ1PkdsdWov7M
	js7SR+Mn8pjEwySogovd+Hzm3bvnXgmCte5WnntGfKBvlKR+DjnAYrvI4v5ulVJovRwxHr7kAR5
	+bkflLBUwGlBTlb87P6CP3Jq6blb62s3f8ee5l4QIXPqf1MpYlAZ5DO9vVyB7J70Jhh7hvIeQ=
X-Google-Smtp-Source: AGHT+IEt7PzAIkfFsXWZlxFmSgQSVYAlHTzvWz749ZmQ/S1uJVlMVoEN7SLnaEY1BBFoG5gmWjLgKZ2VITWWPkBMzQE=
X-Received: by 2002:a05:6402:14e:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-60518dd2ce6mr131981a12.7.1748452556188; Wed, 28 May 2025
 10:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505281024.f42beaa7-lkp@intel.com> <20250528061427.GA42911@sol> <202505280937.6802F0F210@keescook>
In-Reply-To: <202505280937.6802F0F210@keescook>
From: Jann Horn <jannh@google.com>
Date: Wed, 28 May 2025 19:15:18 +0200
X-Gm-Features: AX0GCFtG0eJUnIASULD2nwd-Zdd6sAxsHjSny6-oy6ySySzZaKEp0fZyIUqXpLw
Message-ID: <CAG48ez3i37DYjM+SjBjC-VKQOiJs7-YVdLEQ7aqXQwxWs-rS9Q@mail.gmail.com>
Subject: Re: [linus:master] [crypto] 40b9969796: UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c
To: Kees Cook <kees@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	linux-hardening@vger.kernel.org, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 6:46=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Tue, May 27, 2025 at 11:14:27PM -0700, Eric Biggers wrote:
> > If this new sanitizer is going to move forward, is there any sort of pl=
an or
> > guide for how to update code to be compatible with it?  Specifically co=
nsidering
> > common situations where unsigned wraparound (which is defined behavior =
in C) can
> > be intentionally relied on, like calculating the distance from the next=
 N-byte
> > boundary.  What are the best practices now?
>
> Hi, yes, this is still under development. I tried to make it hard to
> enable accidentally (not via COMPILE_TEST, not UBSAN-default, etc), but
> we (still) don't have a way to disable configs for randconfigs. :(
>
> We're hoping to see Clang 21 with the more versatile Overflow Behavior Ty=
pes:
> https://discourse.llvm.org/t/rfc-v2-clang-introduce-overflowbehaviortypes=
-for-wrapping-and-non-wrapping-arithmetic/86507
>
> and our current testing is showing many fewer false positives. (Having
> run syzkaller for weeks now.)
>
> > Documentation/dev-tools/ubsan.rst says nothing about this and only ment=
ions
> > "undefined behavior", which this is not.
>
> Right -- this will get extensive documentation before we move it out of
> its development phase.
>
> I'm not sure how to enforce "don't enable this unless you're developing
> the Overflow Behavior Types" with current Kconfig, given the randconfig
> gap... I have some memory of Arnd doing something special with his
> randconfigs to avoid these kinds of things, but I can't find it now.

You could depend on CONFIG_BROKEN, the canonical "if you enable this
and stuff breaks, it's your fault" flag?

Or if you want something even more explicit, maybe something like this
would do the job, so that you have to set an environment variable for
the kernel build to unlock the feature? (To be clear, I'm not fluent
in kconfig, and this is almost certainly a terribly convoluted way of
writing this - if you like the idea you should figure out the proper
syntax.)

config VERY_BROKEN
  def_bool $(success,sh -c 'echo $ENABLE_VERY_BROKEN_STUFF | grep "^y$"')

config FOO
  depends on VERY_BROKEN
