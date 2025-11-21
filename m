Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE7221F1C
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761682; cv=none; b=V/qUczOfuneQSP9HG0STX6YgCIkQupGGtuB/s54D5MA85ZF0PYoTqx3GUHD7c1cEWPm5WbM8EeCH+rg20Km4DWMXkjv0qBRYK6/6hTXbllDHA3SWeSXYnWv0GkaDcxOkU2aByIxoZjRYj70bjIMMBgKLgxTMhD444VvQdKVjBBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761682; c=relaxed/simple;
	bh=+1chXuvjm9GlVaYLgfPyjC18yPzYgGx7MYfJjLnWvt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ge5eoTaVSQgIfublvs/MR1aPs4+qqdqqaHz5+L556yQWCem2F/GJJ4NddxWYLBlvOvfRBFiadKU9QU01l9bBqHbWB90UK7oiLv9lYZqYmTb5ZEUbYeNnUrGM19zoA/GFzu4o/N7thx1t162sPRW7fMte437EyQE6WAsYv+MFLX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKCCztB1; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKCCztB1"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7c32c6eb79dso198119b3a.1
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 13:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763761680; x=1764366480; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekM322G+PEin7yvRndAbrKvUWb4I0YPQ5GMMtTk3+Eo=;
        b=HKCCztB1klQR1tGletGAHxKRNj+cg6yGgyeGMEZt/gqbeTb+WcY1PMCjHHIutOqB25
         4Gx6hTMrX/GGQM/xBTNe4iHT/0i9cbOLLhqwLIuzUK/sk1VXAoj8MRES70oSFGcKSsqV
         FT1kF4l7Hc6fgDm/yHWV/tsyKxJcs1AtCdq78W9Hd1FEPDSrpc9bxlmtj3MBU7onFMCD
         wpDMFT+lzOdxW0JQDmwnVNz000T6lC+HUyShqgk9tai521zENgVhBb+ODdN12/v0c2FZ
         bHwgHVQreXL2CnEzETTlpzeWklQuiQUJhL3B8D2bxg2bVHFILrtocEWV3w95PTg3o9zJ
         VMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763761680; x=1764366480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ekM322G+PEin7yvRndAbrKvUWb4I0YPQ5GMMtTk3+Eo=;
        b=agXcMD7GsgnaRErZ0spajga+/Ot2UzMxmiBMwDb5Rlqjnd5EaMpUSXOMQK0EUEaIYb
         93yEN3N6YLR1veyW4GeMLGHZmyXtAldwCO8MbEWhz3S1jzMcbXi/mfF36f/Qy8o7zq2V
         SLgaPkM02GB9OQMGlJIUAnLHo5Zkb5hEOn6AK7MDeT8GQzEGl5Tx3HFpKxr1PDjaqv47
         NmGdz0p7VJIjte/GqC+H+oe34yNfbzLU7DnXvPm/zrdfFG6U/hmBey4bMyYXDk/dbQ+X
         pSvhWdZVaTX/p6L1AbnpB/UddjvYqokNFxZEOgOc8lmMvU6q1Dj1Lmb52kq9zmBx9JBo
         Wojg==
X-Forwarded-Encrypted: i=1; AJvYcCVU4UEtw/pj3f9TDeYmuDBGV6ORGR1QXxFBteCJpNe0ph2ey1L+YCXFxwH9MLmn1qVkkSxn@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg45o/lplX40DowTZwSXSlKs/SdrKsalZLeTUIMeU4o/oWhC2v
	QprqtsnXfnbxCjRDfu76Vrj9+q9T7enVOvdmcJNv/U+zSaffAA6gR6AIegZr8aPSoENGxQ+UlvZ
	ryZAY+IO0b+SRprNRqzKc4V2GFWfcVEA=
X-Gm-Gg: ASbGncv+7R5AZmgNCeKTxpMEOggF8nm9bC0ICEC9aEM+mDc99a0LLe+exBygMPMjH+f
	PK4XxaDG1UT9oPTsKuO4LtZphhak5xYnmaPayexLswsKf+h6i1MfMEc/Ugvp1njSkNjt55uvF+w
	nBuzAKxGcdfAPZQxqDggfKUJEknGNVO+uxBLIcLDdEvBHU+jA8WuLSoBZZypTSBg+SF4QJC6Tkr
	CZXh+cUEdUp4gc7U80s/RssLFm/i8XLkDSFX9PtD2boaw6hI30Cfef182KyPxY3zin7rY+Url1B
	eUlJYz3WSawK0JNDZ5YlpHdvXMfw5Gp1zW3m+gp9czwlS35OpyQGu54iR/U8VFOm6FpOnnSKc1y
	UagMieUAbtXZ89g==
X-Google-Smtp-Source: AGHT+IG2D+cdh1NB4073zeVTaOivGEAbr3ZKYdLcyI3VJrGEJvRL6ka722J5H/M0mBobMWPmISQlxk8KY20YkPOqf9o=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr1100277eec.2.1763761679587; Fri, 21 Nov 2025
 13:47:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121193957.1655580-2-morbo@google.com> <20251121195504.1661783-1-morbo@google.com>
In-Reply-To: <20251121195504.1661783-1-morbo@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 22:47:45 +0100
X-Gm-Features: AWmQ_blZSawsk7jSjU9s-ayzPlxR-h3EgYVHr_sbGcneoHOjgFGGhmStKYwRrFg
Message-ID: <CANiq72=kqJApbOJ0hmC_mAYe6DO8YqXSFaLJOsbPhkXfxmvJHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: Bill Wendling <morbo@google.com>
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

On Fri, Nov 21, 2025 at 8:55=E2=80=AFPM Bill Wendling <morbo@google.com> wr=
ote:
>
> +/*
> + * Optional: only supported since clang >=3D 21
> + *
> + * clang: https://github.com/llvm/llvm-project/pull/137250
> + */
> +#ifdef CONFIG_CC_HAS_COUNTED_BY_FOR_POINTER
> +#define __counted_by_ptr(member)       __attribute__((__counted_by__(mem=
ber)))
> +#else
> +#define __counted_by_ptr(member)
> +#endif

I guess there is a reason for this name, but it sounds to me a bit
like the thing between parenthesis is a pointer, i.e. that perhaps it
is the pointee that one that counts.

Hmm... what about `__ptr_counted_by`?

In addition, could we please provide a bit of context in the
documentation? i.e. links to the attribute docs in both Clang and GCC.

And perhaps explaining why this cannot use `__has_attribute`, i.e.
what the commit log mentions.

Thanks!

Cheers,
Miguel
