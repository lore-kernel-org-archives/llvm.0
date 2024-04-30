Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AF0133402
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 11:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714477541; cv=none; b=Uek+MegoOuLBxnNqdOiagt73+9RGvKu+/GAchmaU6KEEZN29tZ1f2sDRfXcD3U514zD7ir/TljtnKyY/+5TiLPd8MjsSgEaNiwPKrm+/64ApFV7G0iKIaSDIodbY0QC26Cjh5jush/kHz5OoFxs+nA6fMxaw5AOdGwAPo+SxwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714477541; c=relaxed/simple;
	bh=nK+N+mDl2huDsaZ0eLZJn+DfNF4KtsWcFtk234snMws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNYGMxBN1W3WW3dau0aKQXVvDbEKnEVsIpbixChwAj80SGtXpM1zfw2w6OavcvgbBJtIiACpTZhHmBBPySju8BzoDmEiQr0aYJN1IrnrQBWqFVlZmn6gJ8xfZyO4wC8otHfq8OZsN4DopJeuj6F+WGSFE0ee+BhbBpLygQP8axw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z771BNAT; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z771BNAT"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-de603e3072dso1717211276.1
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 04:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714477539; x=1715082339; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK+N+mDl2huDsaZ0eLZJn+DfNF4KtsWcFtk234snMws=;
        b=z771BNATXjfnDxs7YR+D/hB+z2Cbrmx1X+iduVvddDMqfrFlfPVywueoOSXkspyovB
         8Y6xAy2zb07lT8ugUnBUqMqse9FVpI7XN6rxtx69u/ITX5j4GGnINmQsiMnD5dIgVUAQ
         0kaK08HHsk7LgVOj4FX1NAP76wtj32xOEuF/d4kv6WKTFHCtt2hYYsNYQZpwHhT88BpQ
         wVAKV9MSZ+X1Wk1iVdPn4xq5eUyK32J8xdVubd4ckfaQyEDN4GQ/rG+MOKis8mZif0Fm
         FH23c08nYFIWoWCCqQWdQkWGrw4kzQdzfd899r7wbWVBTWuGXLFlxw7LmKEe988x2Kdx
         Y6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714477539; x=1715082339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nK+N+mDl2huDsaZ0eLZJn+DfNF4KtsWcFtk234snMws=;
        b=kzXXjeql7VRcMvJtwGAv1Q+sq1FxvS7CJSyJDLTEkqUxhHSfuFMQjzlf7k1CtxWfxE
         NOPd2fa90YBh44fjz9qp4L2VxiSZPoQijFqegYuq+bikI6fs7ngkAYSZdaucTaJilUxn
         xIhOXc3kk3dHpuYOdjU6FEa2mZRSS/u+s++1TbKdi3YRLgXozcY+PrPfH0cOQi/Glr0H
         gdroF5IyaHA845AzDm/y09Cidsb4deOGlPYJw4jideNEB9QCa52Rxj81lBeFDkShnuDO
         ITzmBOQEwuBLG7k4AD2kXaDH6scAPv9MyMUaos3eqPAnKMYf8i/qPWkZlI+gT4SQPeWA
         +H/w==
X-Forwarded-Encrypted: i=1; AJvYcCV840GlKtobNf3avVzuMIYPpKCjoCnHlSZnoGgqUXoZWJ6AqAQL0ybiNKdIuckMEgDgOBujU3FyXjBDiiLsWegE2adXag==
X-Gm-Message-State: AOJu0YwZk6BlprhGDOKheU9/nz1JMQCCeWSLq6j6yBmAB8tevhKj0o6+
	u3oeEHVxmL7+Bn1oj6NKOZLjEOJHSwBPKoNho/M7gNmiVesDL1oe8tqcIfKfd1Tl2+IyDkcQw2+
	tbZk9uIQllGD57pgVC9SsjF7qeirDBx71CBHpRXyBPnBx/vlS
X-Google-Smtp-Source: AGHT+IFehx1sXmCfSDXnRKest2hb84R8EduIc0UnR35AIQlk/zrm7wyJE95wrOWmFMKm2TZMb5njJLajVKO9B/f60Wc=
X-Received: by 2002:a25:7587:0:b0:de5:8427:d669 with SMTP id
 q129-20020a257587000000b00de58427d669mr10365974ybc.53.1714477538955; Tue, 30
 Apr 2024 04:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240430-arm32-cfi-topping-v1-1-4cb6a15552aa@linaro.org> <CAMj1kXEfQYMk-PHBDBJS-LxTcx72+6ZZVffGtnoiHB4KcdoaSQ@mail.gmail.com>
In-Reply-To: <CAMj1kXEfQYMk-PHBDBJS-LxTcx72+6ZZVffGtnoiHB4KcdoaSQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Apr 2024 13:45:27 +0200
Message-ID: <CACRpkdYq5SON_ANbEHgvzBuTQd8zkY1M5dEATgzqz1j7W58pdw@mail.gmail.com>
Subject: Re: [PATCH] ARM: Use conditionals for CFI branches
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 11:19=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:


> These functions are only called indirectly if MULTI_CACHE is enabled,
> right? If so, this could be
>
> #if defined(CONFIG_CFI_CLANG) && defined(MULTI_CACHE)

Hm Sami may know better here, but with !MULTI_CACHE the
functions are indeed called directly, but does that mean the
compiler will not emit some magic bytes in front of these
symbols then?

Yours,
Linus Walleij
