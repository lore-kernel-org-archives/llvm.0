Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A35B5AB
	for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 18:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942753; cv=pass; b=jt5Koiw1/Eh7z9bHDvsoXMEGgwPURcoe/ouhvoSpKZr5mKMqt6msPCFpYzdkz0BN/jQXGUyq3kT8iWFyjJ3NSbj63CGQgRaBLsqaPgk0Z/CuSqqJlYiuPw4Lkq8b3fJV4mjbYctoUcJmcMNAavfQyXIJlmSmgCDNU2xAFy5Q0Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942753; c=relaxed/simple;
	bh=ge4Ljtv1uU3tLDv0qn+CogzzM5fRFylDnv9OiKMMdUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dbo47Sv4bly0GZ+YF0X4PM1LA58BdKbnwLrx/T2xgahOuxyAEQQxASOuowPi+U4DIMtTTLo2x1Y2hDfMHfveKyvH91WTX5d+nfTwujzh4GcdkUUq0MGshiOM+zbuAxyS+yIUCUOpg+v70MBzNv0ZyyMMXtUXIXy0x4UJfNcXVOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l1jxubSq; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l1jxubSq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499add6348fso6025e9.1
        for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 11:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787942751; cv=none;
        d=google.com; s=arc-20260327;
        b=bgakP25I2lcrUIE6/3lPPIRgx5HJCYaUDwq4b5VHi4b0+1i1yylr6xl5asG1nHFDJ9
         FNuVgAPM4Yamo2vgeiY/OpRBy7Y1lM5HMTZKPfCksLv9ABWDEhWUsHbwsGDtku0XmdWg
         0a/2TMV0pMbK8RI5mlErRDYGnVaWpl2THbJukKUD2ipUV18oOhPjUCXEqz6qKNoROyv8
         3w2WEya+gpTR59G6d1k3uTu5C47R9wQ9aNG36DEupC2V2ycdvXfHYCKcVGcutSYRCf40
         8TLSs6SV5lRPmdtq5HJgMKJhuzAF+SNSIKrWn6rheJuQ8IqRvC635L3PoXrfsjBb1/G6
         j2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        fh=RNd8BCeXz5D2YSLoVO6XYUqPqWoYzKo0IyXgN7hYXk4=;
        b=FXxY3jdlV1mbUoUSZewasVoHLGolBZ3aktQje+07saojdBvbKKjgDouK1yNODMTXlK
         5ML7PPjSYry2bLRiztSCRDqs/jrrGhZW5wE3NlYdTNoHiDqKzLcUoiy7uduor9Xo3n+7
         jcu6Ltl46q7h1pRhItqB6vS5e9wl0uR0vhmwPTaC0lD3ja/WEWgMz6iEZmFzxty5CoYA
         0C7VKYRGpGOUXNKewfYN9wtozUPdknYMf1mULgLlB6dmltTE8qgMDZHNii45ogJwh6vX
         l2o8yV/ZVRO8npow8abx1AfevDZ/QyxBKmQgS3lxAGZ/WkGfn3Lpg8+SHkOBNMFdLN9p
         n+OQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787942751; x=1788547551; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        b=l1jxubSqGtfkZTBeeWjoZ7YgWFQ1jX+7t9FssZvuJ3h577THdfX5iKyPhltsFqqgha
         3jw+EX0/cQ/7v3GQBk30DC50orN1577wPfa3FzONQIlCiChS1P7gWUa6jUBNvp5jo2AQ
         WtCo/8/O9KMWRMFLZxMIiJWRc7Pa4onBgtOa+ogNMXfILd953Q/5G5cY+Bm+U0oz1q8E
         lWxRn+DQS3CsFCvG7gbWaVMgDeYYkiroZ4Rxz13dLpcv1hfO3G2ZiYzpkuyGp+ROarOk
         uEr3V9ONr8QGInx9waIQBugsugntBbvGIVI9UYIWEgMBtYBsp8RHIRSisQXpFTeXLHdl
         lphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942751; x=1788547551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        b=Zl9bHSUhKU9RkSkojWlFIDSmS6SpsjQ2l6pMsN7CjsqxUNrZW0xH4TVjPtMtBSIFHd
         HewlbIJZyb96TBtExg8bUB016hKT8CXJmnHtJLDtnMHC9urnJmyktkl3k9bSZBUjqzM+
         AiLIvAmxLd+/pjixVo2O3JBEXHwNqp4OekGSPm4ccjHhLZpVLm4EEKvqidE3vgfjjxtO
         ITcMCJyHcHJRo3pkfZniF3xqA6JubLUjdLlf7Avh/LvfZaAbGL7zn5bMG/KydCLdAGA3
         O3uAixEp4nBHyTr/VRPboMWUEGug13Gi03AKQVcYFM1hCKp4BLPDtI+GT5lSbZdKu9WY
         Tvpw==
X-Forwarded-Encrypted: i=1; AHgh+RrpY4B8KgOJYT5p669FrikJnBlvWkUnJNj6+qlsUy27cfv961JU48ogkX6ETXqnsQkhc4Uf@lists.linux.dev
X-Gm-Message-State: AFuF++mM6+I2YD74g1UjG1G5BrcBsWbfghGqGa9xT5N7zUNayczFSTvi
	2KfjnoSvLKKw7QOO9bJhdX5tKGjU6jukmD0EB/IDi02sRQkWnCDIjUXZ7PEtizO/Qu0JuEvjHea
	g+A98mnzwXqBTwsG/ZNYJXeu68EsDWn2Y+oqvFWKf
X-Gm-Gg: AR+sD13PWOfezLw1xgxp0NsOmsXRK/Q8gpspRNlo53iqR+IR2e4ZOXM4Vnl7AP12uJT
	oTwiWUvV1WfHTymLokThN2YLVihSdxU3M94Va7qpGJKuUC2Yck/5FW74397//MEqAztoSpxYAdi
	9IqEo9MpK5hb0KYINWXmJPAyOt7vmDSVftYGvW+51P6MkmZyDfmZ9nSNYYGAeDKhjVB2AFPlrVA
	a3Lu41DzIVw1wjq9fWMKiNW4371yUEP/Zk8bzD7FnlAbYjT/44ADBnUdOFRDZxL7mpuES9ryPZn
	ZS82olyxqaOGrb2CBHGQW2lhCcmzgRed2+OUgOjrOQ==
X-Received: by 2002:a05:600c:6549:b0:49c:1295:45c1 with SMTP id
 5b1f17b1804b1-49ccbb8a4f4mr63075e9.3.1787942750098; Fri, 28 Aug 2026 11:45:50
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
In-Reply-To: <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 28 Aug 2026 11:45:08 -0700
X-Gm-Features: AcwNN1Wx0I21Z8-gsT0HKzRa32m8c_GTOdvUPjQzxP_d9dv2tDYvd9upqY_kuJs
Message-ID: <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:29=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com=
> wrote:
> >
> > Note: linux/uaccess.h is included before linux/cfi.h because
> > cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> > include uaccess.h itself.
>
> Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.

Nathan fixed this here:

https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b2=
7015390901@kernel.org/

> > -ENTRY(imx6_suspend)
> > +#ifdef CONFIG_CFI
> > +       /*
> > +        * Pad the location counter so that the type hash emitted by
> > +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> > +        * fncpy() requires the function entry to be 8-byte aligned.
> > +        */
> > +       .align  3
> > +       .4byte  0
>
> I still don't like these assembler directives inline like this; this
> feels like we should have perhaps a new macro in
> include/linux/cfi_types.h. Thoughts, Sami?
>
> One that garuntees the 8B alignment of the symbol for w/e that
> function patching routine requires?

Sounds like arm should override SYM_TYPED_FUNC_START to add whatever
alignment is needed?

Sami
