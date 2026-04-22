Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57132A3FD
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 10:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853297; cv=pass; b=k8pFvKFtfPb10kmaZcgUNqIj5z+BLdjCvcvKtBhBEKIo38sArTzM3cACPIKn50qksKAqskyED30Lohj6d0PteNohVo3FRQW/+OeE3sesYIflV1jUi9JST2ZfdetIHxeHmzOjzhRrFlmHf9xUj5IOPD2hK/6jhYHvZWIunOzDVbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853297; c=relaxed/simple;
	bh=N+fVLZldr0CcX1RSkD8vPrNKt88La2gVod+yk4J8Hlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1sPj0MNo/1cPu31mF/wq7OYl5kqNQZH2UH9R/S/CMmvXsvV9xMmRLWQkblhXI97bgGfmkq+gVJY6oNlFk3TVQJeHk/z/LtSuNo2JUAKIIs1Q3twOli/+AZLeZZ+zm1usMkxWM1EcMUMGOpeaeL6q07fnOeBogMU/Tlgx1/fqPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ss0jwBGJ; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ss0jwBGJ"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12db63c6df4so1837627c88.1
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 03:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776853295; cv=none;
        d=google.com; s=arc-20240605;
        b=RswN1LhoeYRm962EyrQ65tFdjoYrq35FOzs5rEwy8tmGijIP9oEosDo5Ym/1pAJQBE
         mF6NKFYEtXdy/6RfArBOctPr/abwE9MQ97XzonmlcNKlUCmadrnNGiHiTVRPvpsgJHNo
         X3oNBc/pbI/0vWWMhSBRG1yKybFV29Ajtw1Ys1q+kMR5MTe1MISovWT3X9om81ly89Xs
         VhqEU1uufVqcG8wLxUxwpYQ80fCuedcIrnltZz4afEwg5DylX9BJWAviTmtE7TvZ4/id
         tLQ0+6j/tOWzhCdbteFsbo/RMf9rp4ioUXQQHzoGhHoW+hby7hw3IhoKSx0r4bX7bMCG
         E/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OS9YoHwV0T7JBBevO/RWMw9hJEdyXKBRLUQ+NntQ65k=;
        fh=JMVoXLDB5Jnd30ViIkbS3atogt65mRvmgNkSAcy7ycI=;
        b=gpvl4VSLHC1Y97WhMKF0FFLVp6AzIQNBB+EsxTzvU0WMlcDUu8babySWNsfG7pFFDY
         /qH9y1Fq4t1g818YtrjigWcNmL4J1FqNgyOkaPdffS41gBmgS++aQ2cMfjpzYpOk7HNB
         gg6n9QsEtRjK4EDsqzxZSdyWUMgjLuJPUXDI3wK2Kkm04Q9FdFdVOz0tZqpjA40j/pWK
         Jy5EwQ9EoGjEfyl58TIXc1Sal2iqQpYhsqsz8KvOivZNDW6zO+9aqgx3QlzSiNxG1xip
         FUZihJch6ir0yIpLQucGPQBfuKqA8S0q28eKxOCa1g4nEgKNuKbURU9JaAXz+oR72nJI
         gDgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776853295; x=1777458095; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OS9YoHwV0T7JBBevO/RWMw9hJEdyXKBRLUQ+NntQ65k=;
        b=ss0jwBGJHyb2O3m9CNh+no8EfD8Tu2V4kR0+Zvkn7xeBHjHoqfKIojphbcafAW9V9l
         ZskhEyIY2ii6cUlOrBW93XY9IqZzi8Bzhqh+5poPw/FSqSk3kNqo9vrzi28s0T4YHsFR
         1wZNvLCcbYLvNgxibCEZpK0xKKz1d5QRXx9H7p+qZ9cZxBD4joZHEp0AsQuDgTmgdqil
         IqFsJeu8enjIUME7hjvDt3Z+MDZsMmkgj2fbJKAy/appF5jPSrSw2Qu4toHpI9+47Qz/
         4DqDrMk61Y5Ls+cpjhSUIyzvclPVSPyzodtVwYf1cw4eshsVnzi5zMd/ZsGuPd8e692C
         Cy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853295; x=1777458095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS9YoHwV0T7JBBevO/RWMw9hJEdyXKBRLUQ+NntQ65k=;
        b=HxkxPdqT9ewQ5T+OjkJfOrpbb5qHNrGr8oq+kFWOxFWj1elw5jfaF+/oeMOrgapjXQ
         Zkt+PxOk9ZjsTPTnu0ZCTgYsSFyEVfSipjWHCwUHLdI9MWjsToGk0jxGA+z6rQs1ENTC
         /4RAPxGjCFZDZe6u0TuqFaN6/I7bwIWaenEWpY9gc9vAk96hBFA4b9yAaxF+AL+mHsjV
         j8qRya5b/+6B7EuuX2pRwAd3GBgnLq3CDHgCKsopwyGOR6Cs13UqGPkpbbP8+/Q8S7Fl
         nkzh/97wZrry2+YPtxiu6H5HZACRmJYnVCs8Z4M6VLO7ATnGobnm+cs531frKFxXNNy4
         KVlg==
X-Forwarded-Encrypted: i=1; AFNElJ/cW8oQftZkl5EVQ4kupCo7IQ+Tj7U1VpgTF6mNzbcHdYFiLm8oRMaRjVybHS6ZqmCmGo7U@lists.linux.dev
X-Gm-Message-State: AOJu0Yypr0SG6bRGhQKI7lBiwQ5QO8Iu7KYbmAHKZdZHv3YFFWXB7jBV
	59Z9DvlLOONjy5huOexoN0ob4ckDhiwkoQtCMtAY7iFN6LWw5a8qWbxSM3vPRX9JErODr4I94FH
	1rcXsJbbsHijDZys5BZWM8/D1LKI575z4W5HzPc+H
X-Gm-Gg: AeBDiev9QDITtCl9RlIlZT0PETnwybcEIiLgaagInPwYJaRXiFxfeHl7jo0ia5pwO6/
	WVNaGZ1W3ctdviST8qJF51wKYa/0klCTusqHGp6XihAcp4gIDHV6PPnOfv/O8k5FMmr0LFFOeyh
	trP4RN/+3LGku4DaVi9qZSiSRt6UjQd7QShXq/xRK/Q0COathpbOKprElKU2VffxXsIafzdK5z2
	WN1r8IZODV8KTs2P43sHvma4eEhqMqrPHUd9LOWkPrIzDSY1XfEix+wx5XdTb+lXMCMu7xPy+Fb
	osdKMgftZsh6NLPp+8Cpu2mT9NBwKIhwL4nfj1nDlPI3Vn5aSxn0q4nRVyTS
X-Received: by 2002:a05:701b:220e:b0:12d:b3f8:60cf with SMTP id
 a92af1059eb24-12db3f862c8mr1958202c88.33.1776853294088; Wed, 22 Apr 2026
 03:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260421190351.1976329-1-elver@google.com> <20260422110114.0f48d109@pumpkin>
In-Reply-To: <20260422110114.0f48d109@pumpkin>
From: Marco Elver <elver@google.com>
Date: Wed, 22 Apr 2026 12:20:57 +0200
X-Gm-Features: AQROBzBSLTL_d8ge4Iyl0iGUlBlg2GSfJ4VW4ej2u5fydZuVNxu9GYxCivKE-_Q
Message-ID: <CANpmjNNG9fKcqj36LHcx8v8qyB8r0qzr7EdkoUOeLiNu9uoRCw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
To: David Laight <david.laight.linux@gmail.com>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 12:01, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Tue, 21 Apr 2026 21:03:47 +0200
> Marco Elver <elver@google.com> wrote:
>
> > Add support for the `__access__` attribute, which is supported since gcc
> > >= 11 but not currently supported by clang.
> >
> > The attribute allows specifying how a function accesses memory passed
> > via a pointer argument (read_only, write_only, read_write, none) and
> > optionally the size of the access. Per [1] these annotations only affect
> > diagnostics, and should not affect code generation:
> >
> >       "The access attribute enables the detection of invalid or unsafe
> >        accesses by functions or their callers, as well as write-only
> >        accesses to objects that are never read from. Such accesses may
> >        be diagnosed by warnings such as -Wstringop-overflow,
> >        -Wuninitialized, -Wunused, and others."
> >
> > [1] https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  include/linux/compiler_attributes.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> > index c16d4199bf92..ef4e279e9872 100644
> > --- a/include/linux/compiler_attributes.h
> > +++ b/include/linux/compiler_attributes.h
> > @@ -20,6 +20,18 @@
> >   * Provide links to the documentation of each supported compiler, if it exists.
> >   */
> >
> > +/*
> > + * Optional: only supported since gcc >= 11
> > + * Optional: not supported by clang
> > + *
> > + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access
> > + */
> > +#if __has_attribute(__access__)
> > +# define __access(x, ...)            __attribute__((__access__(x, ## __VA_ARGS__)))
> > +#else
> > +# define __access(x, ...)
> > +#endif
>
> No need to the initial 'x', you can just do:
> # define __access(...)          __attribute__((__access__(__VA_ARGS__)))
>
> Putting the actual syntax in the comment would help, eg as:
>         __access__(read_only|read_write|write_only|none, param_number[, size])

Will add.

Arnd reports odd behaviour on gcc-11:
https://lore.kernel.org/all/4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com/

The documentation says "When the optional size-index argument is
omitted for an argument of void* type, the actual pointer argument is
ignored." - but gcc 11 seems to not ignore it. Is it a known bug with
gcc 11? I.e. do we need to add a version check?
