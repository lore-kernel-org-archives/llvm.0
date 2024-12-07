Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD8722C6FA
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 20:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733603734; cv=none; b=saQOpc3ubxFOHANQ6PmGmlChjLZmXVtQZ9DSEzdx2WJiayuSFmbZLgrhpr2IpxXumIlYT7cQAptTuBJo6uIfksjYeT4MztNK9tBn3CWZv0+YrL6plsYApHgRXUCg6rkH5LROZjmdGKkjJNbQo4/eKUIXjMkbozcZGA1mkCd9Ays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733603734; c=relaxed/simple;
	bh=7mHyTv6r85AJbexntlqRENNWjYsWWzkVfT4oFafMmAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAvtlbl2O2YACg8xl8S0+hRAjq8oa5dCFylpiggr5YZ8+pb+kG8/yDnGHBeceH9DXnaIILqaAygpMCggxZz2A+mzXVSx+/mk/kbpqEsszV6qQ51lHiVGnf/QWAuYrOfqUoWPH7gMYzik85wlvJOqol0cSFvSQ/7YeGTOTrV9Adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NVpfe7Vk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NVpfe7Vk"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e21990bcbso3266392e87.0
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 12:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733603730; x=1734208530; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HiZTKf4hCKQ8GKQ+oAO9V4GLtbxeasgvzn3MVqs40sY=;
        b=NVpfe7VkeVQHWsAej9Wh48OrwEBS0r3oxzNQkAj+NVtn1T7DHshGCgxGlmv5G7ix8Y
         XNjHb3zbfO12ntu86DT54xj1ADzSQmedMlh1xrTeLA+SSnUIzicHHIsqZixtofiNpIuT
         6U/ddnLLDzMRpKavzAgPX4aRU/B50Zb0cG4qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733603730; x=1734208530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiZTKf4hCKQ8GKQ+oAO9V4GLtbxeasgvzn3MVqs40sY=;
        b=t601FrZxrfMlrGXRew07rLIf0B+mRL/SJzDOXu95z1QCc2CZ/RQkA+X6oanRd3ki6O
         +LoupUY/x3MvyK+bewKyL234Tdm3qW2d8gGDLVjsDtzD9cFpkU/vbuzd9E4V7CW76p7+
         CRcg2H5HHfIGA1AVK+0Ul3adBioxRIerXSQqOhqMMoLcjp266CxjxyX2TLoDyiMqRADn
         LCJV6xNb4076F8UrTAKhnC/N69uoxtpmQ/tmVQgY2vvGiDxvIQW3Jzy3hNLdWsQWS+Cm
         s21IW7P/aiWQB4EI53oq3Awp9Z0IB32w+Uq32XrTbMWW/rFjiDUhYEQDMc4TD9dKydBW
         YWOw==
X-Forwarded-Encrypted: i=1; AJvYcCVx6ODV4ODpUmmwAvq1st3U+HMa5E3Nujg7yRq8qBj3t9vb7Vck2fQbZ+LvCCWmwIAcdUu2@lists.linux.dev
X-Gm-Message-State: AOJu0YxDzFcWwwU7v6mD50SEl+sGXJYm8j3uCO2wdseshb80RpB6UMhJ
	q+tbqlSsX6rr0nedbtSyXKunfl00HUfnF4aOew5p/uKuart3OShiWP1yroU6IYoPlnGS4iAPVKA
	sm76+yw==
X-Gm-Gg: ASbGncvzvxF1X4FC1dXbWHTxaxWAfNXDm1aD4bGn6O3PuJj5iwSmwFlWjTHew+47XsN
	e4OnkAKtraalx0SGKbtTLIAM6pEGfkOAhKyi0n2jrH6zo43kT42W8moJQhjs1KdllCHUfNmKccd
	ZJMjmpXQhER5iGCfO1YUtyueWmxCRVcuUCmXqNtRNFQlvBSyUnS2FblJarx7CBostqvsJ4ZdGJ2
	1ZvWVm+jta9rPmO2Cj8od7Xp/rk4BCfzm1IE8yW+UMkNNlL+7SOEaJdMaQuynJREbuGmgtd6akW
	t+oRhor8sI814mnkf5xSXiRC5oJg
X-Google-Smtp-Source: AGHT+IGfjPn6z2cZDQ/xz5Z8hgzLM5x2g1K2o/F9oz5B94q6l6gp95FL3aTQTXrFgZERu3HHQkzP+Q==
X-Received: by 2002:a05:6512:12c8:b0:540:1b53:d418 with SMTP id 2adb3069b0e04-5401b53d4dfmr90798e87.36.1733603729635;
        Sat, 07 Dec 2024 12:35:29 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3a156ddesm355360e87.8.2024.12.07.12.35.27
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 12:35:28 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30039432861so13758731fa.2
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 12:35:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeZAA00gYgyNqzZVa4j8ISMwR7O4Lk95UuLrd41zjE9kRjIbRFEMLD4BtzO+p1R5O1iXaB@lists.linux.dev
X-Received: by 2002:a17:906:5a52:b0:aa5:3853:553d with SMTP id
 a640c23a62f3a-aa63a21b715mr608706066b.46.1733603329136; Sat, 07 Dec 2024
 12:28:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de> <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de> <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
In-Reply-To: <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 12:28:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
Message-ID: <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
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

On Sat, 7 Dec 2024 at 11:19, Martin Uecker <muecker@gwdg.de> wrote:
>
> But that all seem solvable issues on the compiler side.

You know, there was a whole *architecture* that was designed and
predicated on "it's all solvable on the compiler side".

That architecture was pure and utter *shit*.

Because no, it's not solvable on the compiler side.

Getting things like value range analysis right on the compiler side is
fundamentally hard.

It's hard to the point where either you only get it for the simple
cases - yes, I can show you a ton of real code where it's trivial - or
you need to have explicit markings in the source code to help the
compiler, and then you end up having to have the compiler (or some
other tool) validate those with asserts or whatever.

And random asserts ARE NOT ACCEPTABLE in the kernel outside of pure
debug builds.

They may be acceptable in most other situations, but in a kernel you
can't just say "we stop now because it turns out the analysis was
broken and the manual notes could be fooled by an attacker".

Now, would we want to have proper value *static* range analysis in the
kernel for other reasons? Oh yes. It would often be very nice to have
the ability to state "this value is trusted and is in this range", and
have it percolate all the way down, both for optimization purposes but
also for various sanity check purposes.

But it's simply not sanely available in the generic case.

> a) this is not guaranteed in a specific situation (-Wvla-larher-than)

We'd either get horrendous numbers of false positives that we then
have to manually add special code for, or

> b) transform the array automatically to fixed size array
> of size X *or* something smaller when it can show this.

we'd just do this by hand *once* and for all, and say "VLA's didn't work out".

So yeah. We did (b) by hand.

We used to have VLA's in the kernel. It was a disaster. We got rid of
them, because the (big) pain wasn't worth the (few) places it was
actually useful.

So we have been VLA-free for the last five years, and it's been good.

Simplify.

             Linus
