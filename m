Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EEB2147FB
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764014485; cv=none; b=in7X4LP0V2Jya0/6XGDeE5qCQLTONGkq8VY+CgkmC88bkiJfR4TtgnO9BRhzQ1W++8zd2TFNXnIwuPRd4Pg7C+IJrdmRW4Z1UoNYzIcrkpAnBMv1a8CPequymYh653fI1HCS20ERnKyz4loQP0T0XL6ibOhpuGZbaUGeHAQg+ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764014485; c=relaxed/simple;
	bh=cQwxFaYZHEmZNZ7/Ewdlophv+c6KxD1WHIcbrV1ZXCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dii90OOJYbLIXeRb/Kl2wlv8b7QQigjsO/5pjRgtjTp/FgLJI5DqwQ0ArhTFmpt1WTYCP+pmpdBYp0PLYuYhjqfWO1r1Jxniq4YvdioxZ0R7f7g26d9jqaFqb7HX+VL3PmRD9It/lmZafqDrOEynNVgxckvY++MYQzFigEuFpzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ah0x442t; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ah0x442t"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b713c7096f9so730404966b.3
        for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 12:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764014481; x=1764619281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5PZVjnzgC4twlZvu1HHXehXW625dMTnQMUaBeuTteM=;
        b=Ah0x442t7yhSQ7aKBihF3ioUKMFnsxmFLlqcuf8fYCHVuFyrjnWbLD+Q1GhUGhAQVU
         4sGgKpcrt+xOK72fY/il+3S2AYWnaNRWXtbT2z6GQr+jMs07APfDXWw3rungiQQCLpBq
         E4tIyzNT4ghRF3YX+mOSBQInAc8FKr/C5UTjjX+b925jWo7GKQcu4z/RNeT0LBo1fKus
         MfrxrYEvjNfKizI+g6fAA1orpVH+v22wz2lncRKMr95Ly+4jTEWyor/Rg1bvO0iRxyDb
         9iB0aUbaESjw8OIXMVj6f671eJef/kTB7ZG//s8GZ1DPb9Hl9LObPA0RGBGlajQY9B0o
         wFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764014481; x=1764619281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5PZVjnzgC4twlZvu1HHXehXW625dMTnQMUaBeuTteM=;
        b=WmR9WYR7y43KaYMbEFgXSNrrUSmPykN2d7HHBC6pGh2fyTtzyMdWERT9SCSAFuTMJA
         0GVblv5PAuVQvegCa/Zar3YJwjsAuD8XQKcx2IlXXeAmM21UkuvCcLacCb9RMlePK/oA
         KplfsboPiA7tyMUe3eVhbhLy48jFaairrg2ImPD0MaRTspDhHgUwFuqt3QTTpPkh7cWJ
         MXk8V907gK4iuqlNp8Skak8IgrMS72sDeV06np7Y/xxQeSaAorf9VEQMsU1uzsc5qw3G
         Jre0ZwcCik2ikUcpVRY6pBk5Yz2AL0jDZarU+1cKyd3bEbqtlxB+0i9KamSeNbt1wG5y
         LslQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4s5VdDd+DvvwifYwPhdi7OxA+eBi05O/DLHVo0oj/Es3pAW8xuWu9mnxPu1VHQST2e8R8@lists.linux.dev
X-Gm-Message-State: AOJu0YwFnWYPpZtw8X+LZGNYKeqNwQnmhZFDUq3uliEH31R7vhSIGXn1
	vFRYQkF7RysvyOs2JpvPz3Rj8/8/kA+vwlVJtiEgnd/Lmr50LrqmXvy5GPKQilm2qa8AmiXaCWx
	vDbYelRYpxkWA4Er8MMVUbLIHhVHJHUloO+1/nrU=
X-Gm-Gg: ASbGncucaYxKIhfjNfIrlT24fJJyKY+j6AM4yu4ymzSUFm3Vktx+lsPfheKlI/P+seU
	IUWfR74kZLZF3U2ZeQvkUEG6/vVmVy2mklugp/aDB4V6nJY+8tOAGnZOdr9RIEKxCsTVWXPrwuw
	IroFaT84mwnm/sOLDVU+kCRADKnnRGBZ9A9A171Hn94nHvNXW9usCPFn4eHQVjYRI8/lrY+DGz8
	RlIHxNrp5iZ4/fMqXfMUECkHdpRmJfDxfW/HdyjY9vXNhqSq+3cO0b4NCEeQOVL+/7epvYTdT5J
	inI=
X-Google-Smtp-Source: AGHT+IFr6iwtRS2jopoasnbFL17M2Bmqp2C8vwyIBKBMHZ+E2zi4WXWBgfEdcgwMQl/RRCDP0mXPA5rFrsfTeqdXLVA=
X-Received: by 2002:a17:907:3f2a:b0:b76:45bf:ce38 with SMTP id
 a640c23a62f3a-b76715abc23mr1304466666b.19.1764014480979; Mon, 24 Nov 2025
 12:01:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121193957.1655580-2-morbo@google.com> <20251121195504.1661783-1-morbo@google.com>
 <CANiq72=kqJApbOJ0hmC_mAYe6DO8YqXSFaLJOsbPhkXfxmvJHQ@mail.gmail.com>
In-Reply-To: <CANiq72=kqJApbOJ0hmC_mAYe6DO8YqXSFaLJOsbPhkXfxmvJHQ@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 24 Nov 2025 12:01:02 -0800
X-Gm-Features: AWmQ_bnpCEFoHl49A5Mfn4Wh7V1-tjK9T0OOqowfU-0PuTPEPORtOdqbck8Ltl8
Message-ID: <CAGG=3QUNTxpFiQd6EkRaN2ynLPi4WTY9CW-pBZG9Y5hr8VT5qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Qing Zhao <qing.zhao@oracle.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Jan Hendrik Farr <kernel@jfarr.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 1:48=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Nov 21, 2025 at 8:55=E2=80=AFPM Bill Wendling <morbo@google.com> =
wrote:
> >
> > +/*
> > + * Optional: only supported since clang >=3D 21
> > + *
> > + * clang: https://github.com/llvm/llvm-project/pull/137250
> > + */
> > +#ifdef CONFIG_CC_HAS_COUNTED_BY_FOR_POINTER
> > +#define __counted_by_ptr(member)       __attribute__((__counted_by__(m=
ember)))
> > +#else
> > +#define __counted_by_ptr(member)
> > +#endif
>
> I guess there is a reason for this name, but it sounds to me a bit
> like the thing between parenthesis is a pointer, i.e. that perhaps it
> is the pointee that one that counts.
>
> Hmm... what about `__ptr_counted_by`?
>
> In addition, could we please provide a bit of context in the
> documentation? i.e. links to the attribute docs in both Clang and GCC.
>
> And perhaps explaining why this cannot use `__has_attribute`, i.e.
> what the commit log mentions.
>
The attribute used to be hidden behind "__has_attribute" (git show
c8248faf3ca2), but was converted to a 'CONFIG_' variable due to (I
assume) bug fixes that occurred at different compiler versions (git
show f06e108a3dc53). Also "__has_attribute" won't work in this
situation, because the attribute name, "__counted_by__", is used for
both a pointer field (unsupported) and the flexible array member
(supported).

The naming of the macro is flexible of course. I have a preference for
adding a suffix, because there are other expansions of this and other
bounds safety attributes where, during discussions about the
attributes' syntaxes, we've been using suffixes. I.e., Clang supports
a limited form of context-free expressions as the argument to the
attribute. We want to add support for that in the future, but there
are issues with adding that support to GCC that haven't been ironed
out yet. We've been calling that macro "__counted_by_expr", because
again the attribute name is the same. This is not to say that it's the
*best* name for the macro, but it does seem natural.

I'll add these explanations to the commit message in a new version
after I collect all feedback. :-)

Thanks!
-bw
