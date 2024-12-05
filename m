Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C118248C
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733562920; cv=none; b=FGRxHP0CFE6+gzkuGtJ1YMPHv+aUB1qVkkohnmZZk+yNMo658tjq67kfAePIQh0k6Ib7rLK0ZXSKRc8p/f4+J4K7hrJNwq7CazB25H2RBvUW52DWSPNxKkBhWVLi37htmFe7CQv8/Dd/fTcm6L4vXJh3C/2lkOnEnlu1kjHibfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733562920; c=relaxed/simple;
	bh=jlq0yEcIkfhAw4RY3cySThksRiqdiH9uWNpu/3Vz1CA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2mLeELHwPkxd2jU+qomIJdN50QJZEpjUi31GQyMQc8c4BlLbs7vG0K0FbgDK9ZqFjVkuKBSE+nI+KEbj/PsrWvk6w9Odpp8WEeSSl1/sX0rlzeJBriM4oCeFT1D53GN1Y8A93pYJ+eWo0Iwz2FLJhZWQEvrj2wURXI+yZFGyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ri/AGk+I; arc=none smtp.client-ip=193.252.22.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ri/AGk+I"
Received: from mail-ed1-f42.google.com ([209.85.208.42])
	by smtp.orange.fr with ESMTPSA
	id Jqu7tELBDQ2aZJqu7t4Dd1; Sat, 07 Dec 2024 10:15:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733562912;
	bh=y8D8qHkNTgsq/hueRr7hAF5ECQldq13KAVXg/Zr3BLA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=ri/AGk+II1fpdnp/Mm+EpvQcu46SDmnQcLL8JzwU8pLqh47HjzRuAkvrBskUzcCgC
	 UYj5pCb0MhN5172rUTBGuLbIQVO8Q7ICktKoyLOyS+A6KXYLO3X57DyykTgwcmGkab
	 zKLVd4Nj2lWAI8Zbqe4WXeF6Xux2IVFZr/bxU0H4Yw5hphWJA4p0lLdsOMbCEmwAls
	 htNckjJS/fQ1TRzv0BmZhuJoTkrGSX9OgzeKQa4isO2KvzaZF4rNwlOWn5PoEP95d+
	 iQbM1dWzuBatrPsee6LLVpNSemCFL/rey0SkBDdgHjtJZCG5mhC6fPVdmx81Hfl00y
	 9KOilubjQjiFw==
X-ME-Helo: mail-ed1-f42.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 10:15:12 +0100
X-ME-IP: 209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so4456596a12.1
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 01:15:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXThywJ738R5Gy7G9DqqZuEmucsCRPY5cppLQpOMWlXl9gkaR69UuNo42o2SKaYFX/S32Xo@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ0i2WY1Ww+8d1IbUKPWZFLD3EuQNJ5dWO6kiu8zw/O2tVX9rf
	krZTdxY4SD2QphGaZGLl33Trearj3AzzyYuwmYlQ70PxFSkYJeazL99t3ziMvajOECR5930ZRvP
	JA6isJnOA/gO+mJNkxJYRUYCFkCA=
X-Google-Smtp-Source: AGHT+IFZAC0AEpJ1/mPjmzfGhg/DetDbHXis2ssNehZ0yWdtCmcXanGc2R7Dja3wTy2rdkW6SAY6SvJBqtErDk3coGc=
X-Received: by 2002:a17:906:3295:b0:aa5:28af:f0e with SMTP id
 a640c23a62f3a-aa5f7d4edd1mr1018856966b.15.1733413793948; Thu, 05 Dec 2024
 07:49:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-4-4e4cbaecc216@wanadoo.fr> <dff4cdd543104e3792e4856375f310c1@AcuMS.aculab.com>
In-Reply-To: <dff4cdd543104e3792e4856375f310c1@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:49:43 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLsiOF=5FZ=U2MtZ01iBYKZHtfZ5Zi4t3m=L5Oc4EPHGg@mail.gmail.com>
Message-ID: <CAMZ6RqLsiOF=5FZ=U2MtZ01iBYKZHtfZ5Zi4t3m=L5Oc4EPHGg@mail.gmail.com>
Subject: Re: [PATCH 04/10] linux/bits.h: simplify GENMASK_INPUT_CHECK() by
 using is_const_true()
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

On Thu. 5 Dec 2024 at 03:52, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> >   __builtin_choose_expr(__is_constexpr((l) > (h)), (l) > (h), 0)
> >
> > is equivalent to:
> >
> >   is_const_true((l) > (h))
>
> Change it to BUILD_BUG_ON_MSG(statically_true((l) < (h)), "error message")
>
> and then fix all the fallout :-)

BUILD_BUG_ON_MSG() is not suitable for GENMASK_INPUT_CHECK. We need
one of the variants that returns zero here.

But I agree that it is good to have a more meaningful error message
here. I will use __BUILD_BUG_ON_ZERO_MSG() in v2.


Yours sincerely,
Vincent Mailhol
