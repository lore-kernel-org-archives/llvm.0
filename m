Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676F1494B2
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733595596; cv=none; b=kZw4GAbYcWL7kD6yArFgk/zCvY+ZF0o+cJKbQ+4RGiJzoTxKcJQpU5QHEo9beIhvPVW/6nucQ1Ar5KckEATcn17Mo2UP2CB7qz7B/PW1PnyLpDeYH3x+kKNI8Iy3KFEcwIs47soOkLk457uzm18Kb/QzUNRCkGznKI8W0mPYPRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733595596; c=relaxed/simple;
	bh=xXsYNQRaodrrqkXbZvBZDBxwyz9RKFl5ErY9YCsri3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oo+lHMyGzmU5OGWg/Nxz2o5S/Q9GzxaFIZyVLNeow8VjEkDoEgy1Kla6x4RtcRcdV+wahWxSfTfQNM+e8ri+CH+Vk/FFZ1TFQig5bCyAALH6HQLLSt4nLkvRZjvQOuAXlOd8LVw2H52ypici96kuSS3pBopVYSq9OwhS9p/vbRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ggDS20GL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ggDS20GL"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa67333f7d2so8045466b.0
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 10:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733595592; x=1734200392; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hz+XAesKzHzZKAdlmXfk5ETHyOV9LQeE1EOaQCTU32k=;
        b=ggDS20GLd+r4Gr5v87aqCtoPXUeg8ldXVuzqv5kLAlIMG7KiZ6MNBOU3OS6cgDxP1y
         /tnKm0lFriWCBlsZ4/IPaU4aFbLzVQLGJXhzvCFR769JD2MGiHaE2hy1DoTE+tAn4tRI
         9qqeS6092jI6yb97IekbFU91F3FOppum72lz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733595592; x=1734200392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hz+XAesKzHzZKAdlmXfk5ETHyOV9LQeE1EOaQCTU32k=;
        b=d5N42mbOamAdI35W3KuMFeihaWxILCVb/OP8B8ts8bDGdraxtJpQkyDNNtQIgDh/Jv
         jc2piEoedfT4I4flhXSF3sXI+esWrgaWqBImuMx4CWJrk5VWjA+RFr/0DlAAD+ZTlMed
         k4vNUDJUr4s/B4j01urbRNtLcFRcXQA6NJBMmsW/UdfSo9C4dPwoiP0F4kY3PGu58H6P
         cBjGdo/4z1UuJ95B7f2E2hoYF7NDpGLlarILWZ3aNlr+YsDTNzsB7TATas7s+PvIO1K1
         rOV/Z9bhaJCoUHo98jy9u9+R0qaDCSKvqydjKRvLKQtfHWqNwoQ/w9C/xBq1FIzdRW1c
         wmYw==
X-Forwarded-Encrypted: i=1; AJvYcCX76hrM3uLcuYK2C1iBHFl26qt6l5vGKPpQKKls8TkrYdcrpDpYGTb+gp+xXfm4WozZ/hf5@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/C5HUflbrSvEf9e0kBVMKlT1YMWqPAJkj3inMBUC5YRzeolMb
	/AVXSReN2f6DbsIk3pV0g1TQMj4qdUAejB0E5+vy/2MOoYbWCnQ/q245U9LAwxYPhkNjResbXFf
	tvueLOQ==
X-Gm-Gg: ASbGncuF2aVmouFDqGQwjvzXNbYaerId+flpQ9efiNNQhdx+NS4Tn7y5a4B+T+TdlQm
	JE4XDVIFBGRRrsoneQ9pmM6tKXjBBgI1V0P3wTJh9QbBn+qhM52W7fS8WFUo9Oe2JUTQA49vEQ2
	x9F4M5tYe3yaKqHegxWwFG94C/rh0/FttuEKCZILKNLR4Ygv2haUnBwwfMTzAMMk65+YDOJ0kbv
	sZpxkrQylKVH9e5t1qEgd3EXITonEr1etVVuBWTVT+G7j96yr7RgZpK/5R9A0HmOms+G3UxL6By
	R6zelhh2owwgk0fDggg6hStL
X-Google-Smtp-Source: AGHT+IFPpnSLSEC8R9SqCx3RrR0gu+AL1gbZzaCvxj3UoGUP+cr1TWKv69fqK5dGfP0huaj+AmI+Bg==
X-Received: by 2002:a17:906:3086:b0:aa6:2817:7b57 with SMTP id a640c23a62f3a-aa639fb19aamr742155166b.3.1733595592418;
        Sat, 07 Dec 2024 10:19:52 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62602d40csm410704866b.116.2024.12.07.10.19.51
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 10:19:51 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9e44654ae3so500921366b.1
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 10:19:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzxRLHlw578zB0YoY2Fyt2bpwaLkqMsK62Kzp4Ow3QVYif5BoixEB1C/lVIYvMud8o5B6e@lists.linux.dev
X-Received: by 2002:a17:906:1db1:b0:aa6:3de7:f258 with SMTP id
 a640c23a62f3a-aa63de7f394mr497786166b.37.1733595590996; Sat, 07 Dec 2024
 10:19:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com> <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com> <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
 <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com> <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
In-Reply-To: <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 10:19:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
Message-ID: <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Vincent Mailhol <vincent.mailhol@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, "w@1wt.eu" <w@1wt.eu>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"uecker@tugraz.at" <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Dec 2024 at 04:24, Vincent Mailhol <vincent.mailhol@gmail.com> wrote:
>
> > No good - expands everything twice.
>
> And? __is_const_zero() does not evaluate its arguments, so no side effect:

No, the problem is literally the expansion.

Double expansion of these fundamental helpers gets exponential,
because they are used in various nested ways in other fundamental
helpers.

That's why we then spent so much effort on trying to clean up the
min/max macros, because a single line of code would expand to
literally tens of megabytes of horrific expansions.

And the problem with these things is that you can't make them inline
functions, so they have to be macros, and then you build up other
macros using them (like that "clamp()" macro), and it really gets
horrendous and affects the build time.

And yes, it is very sad. Particularly since a compiler would have a
really easy time with some nice helper builtins.

Of course, often the compiler *does* have helper builtins, but we
can't use them, because they aren't *quite* the right thing. Like that
"__builtin_constant_p()" not actually working for some situations
where we absolutely need not just a constant value, but a constant
_expression_ due to C parsing rules.

Quite a lot of the pain we tend to have with these things is directly
related to the fact that we often want to do these tests in contexts
like global array initializers etc.

If there is one feature of C I would have liked it is "allow inline
functions and statement expressions with constant arguments as
constant expressions". Other languages have done that, and it really
does help. And yes, it means that you have to basically have a
language interpreter in the compiler (you do want to allow loop
constructions etc), but it really is very useful.

Oh well. Even if compilers added that today, it would be years until
we could take advantage of it.

At one point I literally was thinking I'd do 'sparse' as a
pre-processor for kernel code, in order to have extended language
facilities like that.

            Linus
