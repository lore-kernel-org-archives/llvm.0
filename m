Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C24016F26C
	for <llvm@lists.linux.dev>; Fri, 21 Jun 2024 23:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719011943; cv=none; b=kdbm/A9x3zc5lHmXJoAvbuOChEe/5HBN3JO6hungdinBHPlEAeLfucpzMuxocEQhwiRxMk/lvs/DeFQXZ7kaMBs6fLWKUGj9yME3dBavP6ow7xHfcq8CkAb3pzynKokWpIYH6exuUAjgtv0HHzZl+JDkaDeCZRRDWsB/+lFx69I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719011943; c=relaxed/simple;
	bh=Gn3DJb+zESEJBowNLklC/dB4nSSMSWXbRChavmZhQhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RmAN926sHCRnYbkRdNcGwvG2Eql5oyv5QkAUM1AOQCm8aezZwTQfVKdAWeXm4EJcNZXA356t6mXtTUYj4S6LTjP16rfyRgp9Tu/kfFLuGNbD8y1z03ODB5ErT8NHeGJ2mGBObl3WjyN+B45XvDQ9BUnGt3FvFlcYGbMbsZ6Xvyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FXGQjba7; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FXGQjba7"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec50d4e47bso9471011fa.2
        for <llvm@lists.linux.dev>; Fri, 21 Jun 2024 16:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719011939; x=1719616739; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a2rnkJTBDtNIKWQQ680DNdljrfWh8lccsRjNGx9v3JY=;
        b=FXGQjba7AGQWSST/MOj8i9fwRs0iOPoax1DwlrusAceDWdqxGbejRwOh3kz6JHekNW
         JTKQZepU7qtzXya2ENWr/JT5LLwlZM5cDmsXoD1ywFp4BjsU9isEmGtMKy28NDF2IW5Y
         qJldKMN2EgQD4Yn2S/cdKdcX/44en3Biq3aLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719011939; x=1719616739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2rnkJTBDtNIKWQQ680DNdljrfWh8lccsRjNGx9v3JY=;
        b=VRBL9w9/f5Y3eVwPEMRKmw19S7U3yGhVfLUrR2u3dulZZrvuAUxll/K4WKHTwZ+4Xy
         9mMiGuyZ+Ja8z5gx5YE2OckrSyqGXD/Qyix83iEOn3x7w5gXE9UqigQhGAS7Ew6Jg99h
         glt9ML2ceFfxdYbhlHR+7mxuR0fb9ARRk4qVMQNgNL+x6/erswqJH8CCiOVqRPnMP7+P
         oEO+7ueXkqtUENInDRh/hgJwxtRjFCs/BOKsBLL78hE3WFVX/qrLiXeoj2nSBJd0fshB
         g+RHDCTaxepDuMjs8TresvZs+/QPj1YwA3kOrIn/icApNkLbnYxGLKlhwDAlvqRUm3L0
         AJBg==
X-Forwarded-Encrypted: i=1; AJvYcCWY0mpr1VCNP5CpRYzLIfOdBc569UTS1of3MmWeD3lVcZo/2T9ejFNz7wbe5ZBSmik9ewDAk7lsefkosrKkkwHVXzSt9A==
X-Gm-Message-State: AOJu0YyZKA+UsU6uq5dXDYkkGue1rn22OczBWGC+VkN+s/z9m+dhjkqu
	kI1sXrTR66J3zZUJMtdGOs3c39OxUcPsW0CtAngB5T15nUf/3ElV7TReHMUppguTMnM+rLnCKpD
	jHBQSEQ==
X-Google-Smtp-Source: AGHT+IEFV6nvzf7wD9cIrBlK5ToohsAYszC2I9yqlO1rpkttzUltw5I0cV6iG33A/IBsxTJoqfc9OQ==
X-Received: by 2002:a2e:7019:0:b0:2ec:5128:1850 with SMTP id 38308e7fff4ca-2ec512818b1mr13892981fa.13.1719011939289;
        Fri, 21 Jun 2024 16:18:59 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d7090a3sm3197381fa.46.2024.06.21.16.18.58
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 16:18:58 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so11335961fa.0
        for <llvm@lists.linux.dev>; Fri, 21 Jun 2024 16:18:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXg5VfJ90/hJvHSvT1s2uOy0ojcrSXcOV0VPdghdCCfUyD1G30nnS+kjtLD9RzdR2Q60qOdzCYaf26w2WCEoNQvbWBBjQ==
X-Received: by 2002:a2e:9a86:0:b0:2ec:3206:57e4 with SMTP id
 38308e7fff4ca-2ec3ceb7d18mr65006831fa.15.1719011937769; Fri, 21 Jun 2024
 16:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240621211819.1690234-1-yabinc@google.com> <ZnYAQhNjVEvFlkdY@gondor.apana.org.au>
In-Reply-To: <ZnYAQhNjVEvFlkdY@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Jun 2024 16:18:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=whWXCP9Jn=y=MXot3T6sECEyK5nTmuvT=WDQM9h_NtJqA@mail.gmail.com>
Message-ID: <CAHk-=whWXCP9Jn=y=MXot3T6sECEyK5nTmuvT=WDQM9h_NtJqA@mail.gmail.com>
Subject: Re: [PATCH v2] Fix initializing a static union variable
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Yabin Cui <yabinc@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2024 at 15:36, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Fri, Jun 21, 2024 at 02:18:19PM -0700, Yabin Cui wrote:
> > saddr_wildcard is a static union variable initialized with {}.
> >
> > Empty brace initialization of union types is unspecified prior to C23,
> > and even in C23, it doesn't guarantee zero initialization of all fields
> > (see sections 4.5 and 6.2 in
> > https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2900.htm).
>
> What about all the other places in the kernel that use the same
> idiom? A grep shows that there are more than a hundred spots in
> the kernel where {} is used to initialise a union.

The important part is not what the standards text says - we happily
use things like inline asms that are entirely outside the standard -
but that apparently clang silently generates bogus code.

And from my admittedly _very_ limited testing, it's not that clang
always gets this wrong, but gets this wrong for a very particular
case: where the first field is smaller than the other fields.

And when the union is embedded in a struct, the struct initialization
seems to be ok from a quick test, but I might have screwed that test
up.

Now, it's still a worry, but I just wanted to point out that it's not
necessarily that *every* case is problematic.

Also, the problem Yabin found isn't actually limited to the empty
initializer. It happens even when you have an explicit zero in there.
All you need is _any_ initializer that doesn't initialize the whole
size.

End result: the "empty initializer" is a red herring and only relevant
to that standards paperwork.

So empty initializers are not relevant to the actual bug in question,
and I actually think that commit message is actively misleading in
trying to make it be about some "Linux isn't following standatrds".

But that also means that searching for empty initializers isn't going
to find all potential problem spots.

Notice how the suggested kernel patch was to remove the initializer
entirely, and just rely on "static variables are always zero" instead.

I don't know how to detect this problem case sanely, since the clang
bug occurs with non-static variables too, and with an actual non-empty
initializer too.

           Linus
