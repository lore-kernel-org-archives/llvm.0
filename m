Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A6C5625E1
	for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 16:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996286; cv=pass; b=qSlT6n9oZvpMRMDcPOQRT7J92pcqtGjOvoOMkkuxNOhvgODyfcGOr47LKbsDyT53WM0NhA2QD+odPMNs+FmG0H8oY0iD8kI3PHlcUzlFpApHeDyf4P1a9BxpvZ+3Bw0ZBdToCtIdfCuIp31E+Ur2EAkQqnhxTz/+N+KFuYjAqJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996286; c=relaxed/simple;
	bh=aCsxctc/xcnHv1pMHQu5CMpv8HUZNsqkMA91yRiQJRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWR06swWaT2Nf9YeN/UIZ+tmroWT1foqy2wzA7RRmHfEB1YO5u2P206F35m4YSofCTP2zbDLud3XQ9XqPvWlNOqkD8XpJLcOI8Jg/Z3xDBiJuXQ6bBOLFPjcjku8Hhy62rse0gqjhxEao2QoMpiLUIqPr0QpETAtRLiPKqWDFEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tHCdWONi; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tHCdWONi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so38177015e9.3
        for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 09:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996283; cv=none;
        d=google.com; s=arc-20260327;
        b=qcyqAR9AZyBAHZNbv43YbtFooQQqlydUF46rpHuTEUAFDGziYvQqROks7NWA1K+Lzs
         1x+r4hPgRPy4ddZpJf4pZjofxfSLuopsqZaZlVX4GhxvBn8uCmdVHaHBh//j+0f/nZND
         pM8HWvmH7IexbgOW5qHQVIzCqNy3WIAUvf+5xY23NGSFAFp+dCEsIWwFs9HFXrtUtu/i
         hnccqkrmM4GYOAMF5YgrP6B9ICAO9xykU5Bkb9GhnuaPz4OSh3hj8QoSMejinox+ZHYw
         a74jJjJoe2sqNKc5+eEQQ+xcmNDFRyedNpaNX/YhLbZfuR7vhtF6odQVWO5GiQY6TpHc
         U7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        fh=ZptFQVe/heL+HvNALmSmy8y8QFT17PPwToZk7xJAuzM=;
        b=ITO7VqVfFmYd+RwWKOG9m6C199d7IYKwzMSNk7PyLGZwd+E/YLlEoXMSDRuRjIzTeT
         WuXFU3/c2u+k0BDqK6GbbFxj1iUSzJaS/lNj+hn1tHF+o2PcUHnkNvFNGy62+jtMICY3
         j7OsJrnqW7glWwlWKaR2yYLtcnQ3hcsP3MjgKcqUV/lsN3Ey0puR1vEbdmGbiP6DWfya
         DqUIXzx3EOvRxxj0DQSaNrGZ0EAZ6WECieVSoISZN4k0BuhVLO7r0aJA4zVFmQMIXt2v
         X3vI7AkSrFcdMzcQJ6RiotmE27vlaelPSweTcuY/4N4iWQJHLl2WFJ15TXVh840mme1f
         vkVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996283; x=1792601083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=tHCdWONidYFLf/5JJ4O5xvPMJ/ULyez9anuE1DWBjid8ypUoFMFHn+rkdkv2HPIWt8
         4uKt35aLjqBfWC6RfSUsl4RE+Gkzsm8ShSOzy8pqCbEmU45R8H8Ru4RvCadkk474lKyb
         R6mByCbBO2VOZ4fr9xu9bQabzHRJbNC3VUlNy/7zx6KoZBNd9RzDpul0DeVytNI1emq3
         CU6SHrZxz7tn2rOh5FHvUa4S7ap3C3/6GFOIIRkwX69oeH1Ym/gjchAN6+MNwD5M50OS
         o1NTgyt0uPGo36E+c1blwJahGijGf090albuEe8/T6DCJ42AsKOY9jc1E9s9mSF4nFXQ
         A28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996283; x=1792601083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=WwbR3/SkAD8CthEJltSKAiKZCIbKlNZS+uE8n6bN1F7KrR+P1+t2QAr+AgI4la6ZSb
         3GlfbtUqUBGD8t12OBWj83ztJZMdfnhXM3Yom68T9vesOHANbmKo9BWol7jtdcvmxVIE
         wJmfqoZXi/JqFLd2T1Cs8wHCrrUZIVPalThgQ8tL5bvgb1bmaRxkoLU012yMoeCQA03N
         E+Ol7snspdZE0cZmVGnu3eHkCTAo+U5PtMnlCX9sSVYvprjMB94OeX71OSJqDEeXPK+B
         MFbtsXKQHT3QE0AlBYtXElQWM8D36F+7tm+pUszGNstzfCGvfRkrWgq6W+/xiSnuZtZA
         knGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5KDvg2dAn5s3ixt42J/ngo52xqcdHkHH3rkqY3SBdSUuXGBTshZZNRBR8+BdBzFWKYzUj@lists.linux.dev
X-Gm-Message-State: AFq9FYLTMnwFYN15PCtD/S6+Zy4/Pvq/lsGferkv3cvBljUUOCPtqn8/
	j+nbqr55rLe4qfh9doMUcATGS+NoZJPEE/OgwbB/Q/A4Ojehui42dZFQz3XOtOA+s2MEd7/YeXa
	d3nrppWmfue8V+6rxpVarNOCqy0k8GzBXRQFeKPiF
X-Gm-Gg: AYBFou2WZ4P6VuPUV5qWIzZgmtsRiS2/RtHlBgM0ChBxxJwl3Ccf6QvmAy9bd7GodLu
	qoNj81puq7mrp23iWz5td8COnDEOpoV6DeMwWherXGfCr1LgdJX800RVT4gzUBkD01p1iMhKzsq
	/J8qdTriBz9xkpQBHZiYqYvrgpXLKrp2kuZs3jJZmH268TfBnUMnOIgDW3uOZf47s6MhOJHOWzW
	chXisG0yG2PP8f9izNdR8Q93I/fChjJQqXOcrmJKcSYHiD2uAl3M3Y1KM7Xtu+z4hdrYM1T1NUq
	APqFAFEBv1HZf5h517kktygmjaesOteLUXS0i1yoMn3pYfTXaqqH831tv/oLXrYpSWVEHF5LIot
	GvPitrvOwM1dtJD4i1H/Lh+VxbQKBmM6omaFzzZW0YDXHruQ3WLKXpM67u2la281MUB7stP7XaF
	UHx838cLxzCUoNnyIgT4ndYIxfnsBFO0Okk83xcmM0mYIKSnbY23Me
X-Received: by 2002:a05:600c:354a:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-4a18e3ef23cmr329192565e9.0.1791996281614; Wed, 14 Oct 2026
 09:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
 <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com> <202610140937.B68C8C9AAC@keescook>
In-Reply-To: <202610140937.B68C8C9AAC@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Oct 2026 09:44:29 -0700
X-Gm-Features: AclHuK9LUe2FvddsKjj0vYiArabpm2vrSaqioSsrjl7koqqOn_VyYRh6l-6milM
Message-ID: <CAKwvOdm6nO6skW4-AZtmzpGoNyO126L_AN3Mz2fu23+3QXcshg@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Kees Cook <kees@kernel.org>, Ian Rogers <irogers@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 01:28:55PM +0200, Miguel Ojeda wrote:
> > On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com=
> wrote:
> > >
> > > +/*
> > > + * Optional: not supported by gcc
> > > + *
> > > + * clang: https://clang.llvm.org/docs/AttributeReference.html#requir=
e-explicit-initialization
> > > + */
> > > +#if __has_attribute(__require_explicit_initialization__)
> > > +# define __require_explicit_initialization __attribute__((__require_=
explicit_initialization__))
> > > +#else
> > > +# define __require_explicit_initialization
> > > +#endif
> >
> > The LPC slides mention Clang 14+, but from a quick test in Compiler
> > Explorer and a `git log --grep` on the LLVM repository to confirm, it
> > seems the attribute was introduced in Clang 20+, no?
> >
> > If that is correct, then it is not available in all LLVM versions we
> > support (LLVM 17+), so we should add:
> >
> >      * Optional: only supported since clang >=3D 20.0
> >
> > With that:
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Yup, I can confirm, I only see it with 20+ too.

Fix up the comment and have a coin, witcher.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> --
> Kees Cook



--=20
Thanks,
~Nick Desaulniers
