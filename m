Received: from out.smtpout.orange.fr (out-15.smtpout.orange.fr [193.252.22.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7228F3
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 00:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733443636; cv=none; b=cftDqxny+NR63U3yeUNsmRH6H8b0aM2D8DNXASl6ikH/MhyFiNCKzBTT9g468h066AQFWJQBpmoE+Ejn/88286/fPQrpT1xFyhDD2ZK4YhH+lmE77MmZnaO93Or0WB7pBbrEPDqNY5z/KWVZlppvZlUvcqqGhkbhwXBgC2VLlqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733443636; c=relaxed/simple;
	bh=6RTv55FsfGEAbH65kMZfiUbp6t9oJTmATDpoVUcjvLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YvMDb9rGc8rHO91TI7+INO8nfwleiskv5dx4ZACco59M/m/Qv7Ddt4uQI3jmqjRWmVoGFDSENVJc84LW61qzdFL3ir9qdQIbIL5xlR4pVPo35LQigD1rJLOw4ApeC0IbO5lR/62uSuYXF3rlFVMXlWCdUSOxhHhJR7Z1JRiVRQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=CAU597zw; arc=none smtp.client-ip=193.252.22.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CAU597zw"
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by smtp.orange.fr with ESMTPSA
	id JLsDt7CTgKnkaJLsEtQvqJ; Fri, 06 Dec 2024 01:07:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733443630;
	bh=EDV0uoUPSeCM4ycVbpiYzkI+GBIJXljO1W7VncV40gg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=CAU597zwUhrr4TjvZwOycZt1zhWay75ZmwiGALxYwm88J39MYpYe8kxgcNQfPGrPM
	 Vrq+ytcNm0azemoULcW3bhNhVw/MzT4J7sQ4g+KbzJ+Tisxy9Y2tpp2Uhkq/xSMD3Q
	 N5TP2YrYjGWpnKBx5ykGdolWxUlFYDIlxcpehil2rieOeoYje5k6xQFEmV1dVdEe+z
	 ATPByqY+eDlhEk8jyJFO8YFsOS9ApYLKFTMI6XMparYhNfyH0NNVd1zQKPfn/NkKhB
	 8S4iSY3S6uvXYf1Zh7A/H53Y18kq+QuKE9FBEWxZsr/Xl4xAPX5Nh6wzal69vaIlcY
	 Z1ZT32IuSGQqw==
X-ME-Helo: mail-ed1-f49.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 01:07:10 +0100
X-ME-IP: 209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so4616770a12.1
        for <llvm@lists.linux.dev>; Thu, 05 Dec 2024 16:07:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX58bbcpQG24ACJyw0qwMOeREuY7qR/JtOuuxYCY0oLkOKuXcaCVeV1Uhrh4P7JpBSB8AT8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8clcZ49t9Pc6OuajTuYawTo+y7QiAFfuhtk8OOl5hYY0Bwhim
	6xQS1fn33vSNGa3ZXXiMBeUWAqEwQYCNHyhMcsWGqFShkmpyoCXNrGXA1ZNGmu259IEzR0fpyTZ
	0rLYZSdCJ20s+3i1jHFE4w6FDiJ0=
X-Google-Smtp-Source: AGHT+IEENKH5q363NsvaDS9r/FGBH4NT8jK2UDZzhmMDEw1YQ0vbbHzKVnWBLQ5cMhIKh2zINR9br+tBOM6tHUnfBmY=
X-Received: by 2002:a17:907:7759:b0:a99:5f45:cb69 with SMTP id
 a640c23a62f3a-aa6202f3295mr391454866b.4.1733413951191; Thu, 05 Dec 2024
 07:52:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-5-4e4cbaecc216@wanadoo.fr> <8b8262389bd6484586007d749132346f@AcuMS.aculab.com>
In-Reply-To: <8b8262389bd6484586007d749132346f@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:52:20 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
Message-ID: <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
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

On Thu. 5 Dec. 2024 at 03:54, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> > In __clamp_once(),
> >
> >   __builtin_choose_expr(__is_constexpr((lo) > (hi)), (lo) <= (hi), true)
> >
> > is equivalent to:
> >
> >   !is_const_false((lo) <= (hi))
> >
> > Apply is_const_false() to simplify __clamp_once().
>
> There is already a patch 'for next' that changes it use BUILD_BUG_ON_MSG()
> and statically_true().

Found it!

  https://lore.kernel.org/all/34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com/

I think the easiest would be for me to cherry pick this patch. So that
regardless which series is merged first, no conflict will occur, the
patch will just be skipped the second time it is encountered.

Does this work for you?


Yours sincerely,
Vincent Mailhol
