Received: from out.smtpout.orange.fr (out-11.smtpout.orange.fr [193.252.22.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBA81E529
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733584466; cv=none; b=tJwTXAhx/yU/2BdrFZEOW4f46m/mnB6sUXb4dsHc8VsXHrJj+p4okIKWvvydOEgzQsV1Zg/O35jK7JMGOvsREMUTBqSEMPFOl5t1uzWRqktYgTXzF0+0ZneW+vGJBpYbgnFrVM0IoP2+FfzfnTIh7ZaFnvtM8uqOyJcIv/fuZFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733584466; c=relaxed/simple;
	bh=M3tRBIMiUGbNOtYs/WiqckLr+eGNBUTYriamxyCBEEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jq7WPARr20O5tdmmWb05sPj8N8xxpjm+KQ5kj7AzyoKKztWXB3ICSPF8BB6VeWPu8YuJ9XlJTwyDJrtBlc9PWeN5CX/XE7CbhJCKcMYnSctwRQiwnQANljmbxXQ0l/5r/smFmDCml3XqHI3Z9GVh8gWCpyTmTvsRl+lBSswBq6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=K4NBYXe9; arc=none smtp.client-ip=193.252.22.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="K4NBYXe9"
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by smtp.orange.fr with ESMTPSA
	id JwVatySx6lGpZJwVatXOcI; Sat, 07 Dec 2024 16:14:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733584454;
	bh=1FRoHoQWpZzbjWYvjotIUGh9Pf5+Jx2FZlKpO4hH6NM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=K4NBYXe9epvPpw8jrhgp0R7U11vB4rZ/Mv6Fyt0/IZJv43WLMeJjBWE1JN1eAIR+N
	 48e+5/16iDFN3qX0clPjrZrFpQccN5z+SWsXVpSI7J2X7Abdid6i5Yqbfv/UeMr/rm
	 pz4vLD90mAp3ugTkfY6/JS9ejh0a+LoPjgWexQHJzI8vHPKME1+6rYlbFLRujb/nt1
	 L7zYEL76Sc0H3XJYTcVzsNjimhg+ZbuR54KnXBr7DF11f6pV+lQDzBdTxCEaa5/Ejd
	 5mfCE1q2SIbP1sPojBDsexN2NIX/rI6yNgFdqZZuXznoohQaN8vFGH3KY1+IvO+nIO
	 nDepTJ7OvfmGA==
X-ME-Helo: mail-ed1-f41.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 16:14:14 +0100
X-ME-IP: 209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so518306a12.1
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 07:14:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmYbJfLCntK27m+G7FueickLOAH3mR29O66l53lBLfe6udlTDLo75lAWIloWmZWgvZoPnP@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/FRdtuClXuamzx6zV80jjfdDdjBKfPxt4QDj3rcsrMKZgIJGH
	fGz/q0q9u+vay0NjG/12h0BNKVaDculpxIWEft/KQRpffOrlbt87CxOLKvsVf9Z2tfk1vUj1wjF
	JB8zqPZcmwlo/6tZKtpzNf/0h9Nk=
X-Google-Smtp-Source: AGHT+IFYWIvr/wb1ttWAqU3XdgmdbVRXgljv2wGXYHxZGru+z8zfXAuY4J7uLgYbwqJhFyewdEilCwKv6EaVf4E+2bE=
X-Received: by 2002:a17:907:270f:b0:a9e:b5d0:e5c with SMTP id
 a640c23a62f3a-aa5f7f6f2f8mr768523566b.61.1733414207483; Thu, 05 Dec 2024
 07:56:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-8-4e4cbaecc216@wanadoo.fr> <6597979088eb4ee7b98cfb99815a402e@AcuMS.aculab.com>
In-Reply-To: <6597979088eb4ee7b98cfb99815a402e@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:56:35 +0900
X-Gmail-Original-Message-ID: <CAMZ6Rq+XhOb+yn5A1dHD=qkbB1_FQXMA7_ydBB4nPTSnys3jkA@mail.gmail.com>
Message-ID: <CAMZ6Rq+XhOb+yn5A1dHD=qkbB1_FQXMA7_ydBB4nPTSnys3jkA@mail.gmail.com>
Subject: Re: [PATCH 08/10] drm/i915/reg: replace __is_const_expr() by
 is_const_true() or is_const()
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

On Thu. 5 Dec 2024 at 04:00, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:34
> >
> > Most of the use of __is_const_expr() in i915_reg_defs.h are just to
> > test whether an expression is known to be true. Because those checks
> > are all done in a BUILD_BUG_ON_ZERO(), replace those with
> > is_const_true().
>
> Another place that could use statically_true() and BUILD_BUG_ON_MSG().

Here also, BUILD_BUG_ON_MSG() is not suitable because it does not
return a value.

__BUILD_BUG_ON_ZERO_MSG() could be used; but there is less benefit to
do this at a driver scope. In this i915_reg_defs.h,
BUILD_BUG_ON_ZERO() is used 20 times. Adding an error message each
time will just make things ugly.

If we want more readable error messages here, the solution for me is
just to redefine BUILD_BUG_ON_ZERO() to print a more meaningful error
message by default. But this is not the scope of this series. I sent a
separate patch for this:

  https://lore.kernel.org/all/20241205151316.1480255-2-mailhol.vincent@wanadoo.fr/

Concerning statically_true() instead of is_const_true(), let me test,
and if this works, then I will replace these in v2.


Yours sincerely,
Vincent Mailhol
