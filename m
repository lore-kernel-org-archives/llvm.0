Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61F22068A
	for <llvm@lists.linux.dev>; Mon,  9 Dec 2024 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747549; cv=none; b=I0mAMQiAKFo9rjLT1GaFdV3EiOlEIIm+L3lGt8KJm7WuteGECmfqlRpL12Hy+Cq50hZ8rTG93gUf2XFAZ8PWZafsfM/V/Ubf0RA6rBbV3KVSiAyovblDTnEH0s7t1/p4jtfxyBAY+46giTkKKRZWorVAyDfi/kwJ0vVhLnIGNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747549; c=relaxed/simple;
	bh=kB3RYhKaW5gjZwwRvCZ6UhMhANIepMJBAcWY0Q8JPmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuzPBbKUbwGYc8Miv8yBCP3stPh5GAKd5XpyTbAjHW51zw61JHCJkRpEZ3YgwCvw/aBQ/6mvkLb9NjT7COQEWc6BcewzvBm2Y9+vF20HK+Fkj+FObeoXe9nOpFIP6GU2Q7iKvfgPugKjihjUMFVcFO1hVhsOHMw7OUefjdLo4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ogfnqyak; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ogfnqyak"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so2660417a12.1
        for <llvm@lists.linux.dev>; Mon, 09 Dec 2024 04:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733747545; x=1734352345; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HB4h5xGYBYj3eCi9b2ZJAMbBJzOGVJksJuXFxsMtAq8=;
        b=OgfnqyakjyqFhFMZPIbdfPfzByoLxxtntfXzn2G/ku1+W6Lprbrwwm4b4UrC4qdCu/
         zqeo2x0LKQ5AnqKhoDH8X+PFkNfcJ7WFDp8saeAuBC7Jx0aiq+CttyGjq7VjAGlL0k0K
         f4nH8koZr666zkAzVwLvIHB74lAg4zUwogEpM3MRcUxUhsbFdYsOFcVFjI/EYh3Z5eIj
         qwwpjWdg17zKSTdg8C/PzKj+69ip71FYSkkSQd4fJN1YpVpcnVrFonx03KmuIfWsfYri
         d1mf+EecuqqhW9vzi7lq28+rHtRGpRLmjuPhPrDKrQ/tGQcyr643IpoYqSXfU22gGykC
         p7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747545; x=1734352345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB4h5xGYBYj3eCi9b2ZJAMbBJzOGVJksJuXFxsMtAq8=;
        b=nPBG3lEbIDNcraLv08H1FjMIDZKVFkhfQw21tqh6fbqJHKMAbV9l3IFhNLLkZ2M+wL
         q2vWuVOQS0XfwEfskfqew4wf2qWqumtvc9Jg9lbfwm3ARXRIVOL1RM0r/YGWiOkBHROS
         yIrf7n7usRdN/4l+9ae1/a9sv0BBYsapyubnM4OCRMJjvCrDOyHvlar8Bn5cv/fy3gYX
         Xj/1/xVOe9NTT+3u6BPLxH2cADX7t6T/8j3+2AkAUZwrTp04LDQ9w/X/BzI+NBXRb8Te
         awk/QSxCYIu0iJdeAUqJjvv0JS9Ekk292AaQX15ZozUHY98LEZDZH0ZAYlt4+URjMDRV
         C6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWYTYvPeF8TsraeYK6+e/oMu4CK6ndF8XnRmn0guXBej4iFHEsvRImn6ggyU7V84fKsKFrt@lists.linux.dev
X-Gm-Message-State: AOJu0YybekfPB5sTy3OVV/Ft2DjORbMcoHwFqtbkjixZbMU15px2f+tZ
	ab7vDpLLISlrLvOAV7f3XnuWIKhhEVdg7dLRO8kBxnQCVcO3vRjoAPv14BFHz5gwzXK0DS6/d0x
	SAajPfaOMDCNa5B9dkyXwThqDA5I=
X-Gm-Gg: ASbGncsgrxSasE4pmDKOFD7/Rg98Y9UvP9o+QuQ4uTI7LcUQrfNHTCyb362tMyJ4V3G
	z3VB/2x2A2xY+0BuPH8Z5SFVHkiLu4pM=
X-Google-Smtp-Source: AGHT+IFjelp5b6CRvlamva7li7ksyULJr/ZURZRaVo1idystYOkChGCfpprPWdYOncNMp0luUAJecmb6PSVS5WPpxr0=
X-Received: by 2002:a17:906:3145:b0:aa6:7cae:db98 with SMTP id
 a640c23a62f3a-aa67caedcf6mr431164766b.10.1733747545303; Mon, 09 Dec 2024
 04:32:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-5-4e4cbaecc216@wanadoo.fr>
 <8b8262389bd6484586007d749132346f@AcuMS.aculab.com> <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
In-Reply-To: <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Mon, 9 Dec 2024 21:32:14 +0900
Message-ID: <CAMZ6RqLMXaAej75eXrLgvt-Co1yyEg0QNJSxPovzLzb7vdxmdQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] minmax: simplify __clamp_once() by using is_const_false()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
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
	Martin Uecker <Martin.Uecker@med.uni-goettingen.de>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri. 6 Dec. 2024 at 00:52, Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
> On Thu. 5 Dec. 2024 at 03:54, David Laight <David.Laight@aculab.com> wrote:
> > From: Vincent Mailhol
> > > Sent: 02 December 2024 17:33
> > >
> > > In __clamp_once(),
> > >
> > >   __builtin_choose_expr(__is_constexpr((lo) > (hi)), (lo) <= (hi), true)
> > >
> > > is equivalent to:
> > >
> > >   !is_const_false((lo) <= (hi))
> > >
> > > Apply is_const_false() to simplify __clamp_once().
> >
> > There is already a patch 'for next' that changes it use BUILD_BUG_ON_MSG()
> > and statically_true().
>
> Found it!
>
>   https://lore.kernel.org/all/34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com/

I picked up your patch and got two build errors on an allyesconfig.

You already sent a patch for the first one:

  https://lore.kernel.org/all/33893212b1cc4a418cec09aeeed0a9fc@AcuMS.aculab.com/

For the second one, I submitted a patch here:

  https://lore.kernel.org/all/20241209-nfs4state_fix-v1-1-7a66819c60f0@wanadoo.fr/

I will wait for those two to appear in Andrew's mm tree first, and
only then, I will send a v2 (that will be rebased on the mm tree to
get your change).

Meanwhile, I think this series will be on hiatus.


Yours sincerely,
Vincent Mailhol
