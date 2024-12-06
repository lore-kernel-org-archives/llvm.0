Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4836B1DA60D
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 06:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733465697; cv=none; b=aj5XzvTtTo965p68TssdcmQAdglOc8+tluA+jXVyPFU2IAejUeQjj4ofJDnK4PliD+RU+g6bVLexHh6AHDKuxeYktkeIiuNb2mJlqHK0VHnUiTEaGsh+behnO75Gukc4+NB9hVyJlX/9wB/UVgQWNjtMjIPnBVMU50XaGgYeSJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733465697; c=relaxed/simple;
	bh=z6hEp8csz74EZNAx+MsdQ8oAglzBDLPIjblM5QboFag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTCp06KhQ0iFXNHhjCIlyImq/PzzfJolU+myPegCLH6KP4+mOyxWpxnWGkfV9oRwInDGsUCdEL8CJxi2XmrDODuHfgAnIEs5Vngqpk8YV6guQsXq2zvRUTfTvOSy+QBjCqRJ485DgGzN0vlnjGsKZVYxo4w+kkFlXJ1DIcWD7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LqC7W+N+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LqC7W+N+"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so2037205a12.1
        for <llvm@lists.linux.dev>; Thu, 05 Dec 2024 22:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733465693; x=1734070493; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lkINBrTDhyE0tcSEzrQhWY00f3rEWU+OMRPtBhc6Jxo=;
        b=LqC7W+N+Wa1z6wUyw8G/Iq19PjC+tCI5+sTPz+cCmZjpwMzkqVg1TDu6Scvoh12TYY
         cvCEZbomAokVw9ycOh8PFOPDTkhtknU6IeFaiEzsx0yqRjy3phl/QdVhrTEAY3J+mgIF
         QCawA71W3H250f9nDZSN2+kaDr4FkAxUWKt58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733465693; x=1734070493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkINBrTDhyE0tcSEzrQhWY00f3rEWU+OMRPtBhc6Jxo=;
        b=Di4dnmjGvr5zt7cRy3UcMMEJ7R6ufp9CMR4g/ILVh7UStqV7s8KtT4HVVoTBLgGX9q
         +MAAdCAr6zF9/uYjUvg3ZTuvI+XNZFL+sOpoJ5nYGLn3pZeFCKyfxMBZVEZKn/4IrEv/
         RZLgJpxFECJMHG+ZUfmlh5+Hv95diylWCa4qNHooFokjKzcQ2NahMLKfrU4aP/+VyAMA
         82ysTOZ7JgAH6Uq0qZIBVC1W859cYYJjQSzSk8WviES54EooDEygcf+GskMcZ5rqdLfS
         R7o7ZJh+kR6CJ3LIewXNFD7PDwkdWQZwP5YAHkrjw+XYcGCo9/mfvrLxX4TUtd+HhkmA
         Zlwg==
X-Forwarded-Encrypted: i=1; AJvYcCXrJE2jjJ2dV4f9+t0usBMhdXSJW1h3Gon2o2yzO4han41ROV9gkopg8lbqSZ+aqZL6jDso@lists.linux.dev
X-Gm-Message-State: AOJu0Yw34kQ0IOWhWQ3wm7dti40i+MyCbMdvPpVa92QGWnnAF35bj76y
	BCmbHNLvRo4KQ9nFlsOVE0R9z9kgCWhA0+TBhzX/F5X8QnPpFrOemlwTLWKdtQzfh5EvTSImaJ3
	lJA8xhw==
X-Gm-Gg: ASbGnct/J7QKUZMP99ETlGYiKX6Y/o3frPUF0ZFLOs36MH7dZ7weJ9jPJXNw1e+9ofA
	q7segAFHJa91OzdV6PR+dpkHZb57yl/dwdDxjaOLHo8nNtUr5zdvQfQqZw7ORb8H2p1Of2bQp2i
	kZpkdWn+NV5mvW4DStqKPe/o5GyqtX8IpdLuQN5AkRbm5hCaVHFIBjMkfoa+PwOz6Uv2VIwEr/X
	oPp2MI0Q1ru4QuuAukCr4WNindlQczXmz+8IXDezR85BCPk8ctk8/FqxOprXBP3Vtw5KkgmEjyv
	oS2/J2uk8YhRVveodVxeo2S6
X-Google-Smtp-Source: AGHT+IHxWgnaQ4TaBeox/Vs2B4ud12I1Txgil2fbE8SiW/tsSRczu3pmS90/k3PrRWbcjProAQKe2g==
X-Received: by 2002:a17:906:30d5:b0:aa5:19a8:f142 with SMTP id a640c23a62f3a-aa63a00aaa6mr122796566b.18.1733465693696;
        Thu, 05 Dec 2024 22:14:53 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e92a08sm189383066b.45.2024.12.05.22.14.52
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 22:14:52 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa5325af6a0so262849666b.2
        for <llvm@lists.linux.dev>; Thu, 05 Dec 2024 22:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGShOiydcJ15Z+X09CaXFSoJUsfPaGdSCrzUJSiZx0F6aOUVWHcnO3dBKVZ2GX6hfrXBdx@lists.linux.dev
X-Received: by 2002:a17:906:1db1:b0:aa6:3de7:f258 with SMTP id
 a640c23a62f3a-aa63de7f394mr66959966b.37.1733465692215; Thu, 05 Dec 2024
 22:14:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
In-Reply-To: <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Dec 2024 22:14:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
Message-ID: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Martin Uecker <muecker@gwdg.de>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Dec 2024 at 18:26, David Laight <David.Laight@aculab.com> wrote:
>
> From: Vincent Mailhol
> > ACK. Would adding a suggested--by Linus tag solve your concern?

I'm genberally the one person who doesn't need any more credit ;)

> I actually suspect the first patches to change __is_constexpr() to
> use _Generic were from myself.

Yes. And David was also I think the one who suggested something else
than "!!" originally too.

I may have liked "!!" for being very idiomatic and traditional C, but
there were those pesky compilers that warn about "integer in bool
context" or whatever the annoying warning was when then doing the
"multiply by zero" to turn a constant expression into a constant zero
expression.

So that

  #define is_const(x) __is_const_zero(0 * (x))

causes issues when 'x' is not an integer expression (think
"is_const(NULL)" or "is_const(1 == 2)".

Side note: I think "(x) == 0" will make sparse unhappy when 'x' is a
pointer, because it results that horrid "use integer zero as NULL
without a cast" thing when the plain zero gets implicitly cast to a
pointer. Which is a really nasty and broken C pattern and should never
have been silent.

I think David suggested using ((x)?0:0) at some point. Silly
nonsensical and complex expression, but maybe that finally gets rid of
all the warnings:

     #define is_const(x) __is_const_zero((x)?0:0)

might work regardless of the type of 'x'.

Or does that trigger some odd case too?

            Linus
