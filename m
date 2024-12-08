Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF1211C
	for <llvm@lists.linux.dev>; Sun,  8 Dec 2024 19:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733684757; cv=none; b=r0uuzp1ZrKNltjTSKGVR9A4/T0GdfBNRUW79AZ3rpe5GhGTGP3BdAj3zWvyohzo/GNsf8S9e1exXsnXfqsGhpbOp6+ibEx3GkOOViizwcwc6wfOJUqdL2+bguaqjKQScTB/VbwmYC30eDzTpY/Rg19QJe0lwAqjPo4vIvS4BLhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733684757; c=relaxed/simple;
	bh=6Hln1NJrynRFPSlOkJsikZnjs05QWUijpiLr2fyjuQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hq3tmISeDdbUBRMB2iVR7hdmQGVjhjzlxL9zhZ/qZwCOs/oBzRoEB30ZdYJxpnA08TYq2ehmi8UkCo4XH80tkM5fCaNR4LvlvrqjIYe5qqZIa3lezkGyUtDYyGgDvt9omBPfby9wRqzbL/dLOzUtdrIJ2DauCahU5SsHflrxgSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ltesa07x; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ltesa07x"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3ea065b79so1356687a12.3
        for <llvm@lists.linux.dev>; Sun, 08 Dec 2024 11:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733684753; x=1734289553; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjK1bZri5pPYXLEPg3pfsInYn2WFK+u61JXJym8gukc=;
        b=Ltesa07xi1fNE1sI+rO7g9YjqMCsWay/6QdAZK+lr1eSymFgtMSMdYLiZQPoDP/B8c
         sdWKz/Al+etrVPwHHV6+ucEPP+dGhTCghrUYncSIgIdpSAi19ViiABNmqt85sScjyPZH
         BYH1aAp0FJqAcBxS3LtvnJw1kGwiGR7bq0NkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733684753; x=1734289553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjK1bZri5pPYXLEPg3pfsInYn2WFK+u61JXJym8gukc=;
        b=sq8zh+FC5Ef/6z7fVkBtsEPuDJ5DLsuDBmKP3hoQH+xGCudqj5sy0c4bCetDH9yaqH
         dhtLcL71XnPcUaX7LR9Z0kjD4yJQXlitx9tM6B1mIDEWQ5+BRyukkBWMDESbii4LUket
         prDEYDwbNvGboe0ROBzZ/PKGR60Po6mvzL02GMbopmEVFpRdfn7g7i94BSa4fkqml2eX
         6ILjQ4KB1eOWK7Fj3wwh5BVdwOEKrqUZ2z19rwmdC+RzHT1hNfje7bH4SEmhVBJXmicP
         by607Gqilxn+i6K4RONJAVM6oM2YxV40aINbH/blW4ldmZscGqQM6J42QiDr6xuqJB3P
         vA6w==
X-Forwarded-Encrypted: i=1; AJvYcCX2hZhWisILFx82691Pg8kRXcTbkaruiL+dXeZDok2irax0fnij/L/rzz0C3Ip9UGTEn9qd@lists.linux.dev
X-Gm-Message-State: AOJu0YwVjEyBi1/sK4Al8IyZ4BfxxndvD7JrxrKcXoX/TrCORQmAneey
	ojTNbqBrzwY2GA3w0GEuqGQETc2r++5CoX+M/mE9Fbl1jcKyLDsBcBqfOhWn2MmmzO8XW/sofhj
	N5o1ifQ==
X-Gm-Gg: ASbGncsWL3zdnI3/bAIy/Ljvk+ZwzNEQ7sv4jpvfao3zed7EFkBcwqTNu1C3RgiWMhE
	WGa2H7oJ5z5BV9yU4KU/I4aLLlgcKynU+/nBoGqWYj95XUS8S3FMrW1jL3TE6iwPIjbOqQFKPQm
	xR05Lj/qlsEU99EKGsQ8CyDzbzzj1bhhQAXj927szeOF8SFp6EPD0INLipZHnzGZFbN2xTgq9Yi
	xtRZigebyzLgqiC1T799Hk/q56Y5BXnYjPXHd8t5OUcx5TEDT/U/nFI8ZJ1nQ0Z1G/s2fpqASax
	uyB3KoMQs95p7uTW/CW9sBIk
X-Google-Smtp-Source: AGHT+IHmW/e+GputXbEjVZmzW7gkcIRpmmXER13TUi2Z/Dt5JOnh9yvWMV68K/ZHuQsGLL/mlH3l6Q==
X-Received: by 2002:a05:6402:3888:b0:5d0:81af:4a43 with SMTP id 4fb4d7f45d1cf-5d3be47b688mr11365434a12.0.1733684752879;
        Sun, 08 Dec 2024 11:05:52 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3cedbb8fesm3530232a12.22.2024.12.08.11.05.51
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 11:05:52 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa64f3c5a05so243736066b.3
        for <llvm@lists.linux.dev>; Sun, 08 Dec 2024 11:05:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnkBtra5wPW3xBoUhTQLu1wsVbHbtdDgu39DDLTVk8QFdU5wU9aO19yK78TEmqkUR5bpe2@lists.linux.dev
X-Received: by 2002:a17:906:8a53:b0:aa5:4d96:ec7 with SMTP id
 a640c23a62f3a-aa63a21bf90mr809950866b.44.1733684751478; Sun, 08 Dec 2024
 11:05:51 -0800 (PST)
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
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de> <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
 <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de> <b71056c1b9e04aa383f2e5608c27290f@AcuMS.aculab.com>
 <6658618490381cf5ec35edbb66f1478024174e67.camel@gwdg.de> <e71fffb7ff0e4bf29692d006c0fe77c2@AcuMS.aculab.com>
 <87dd9b7b52e7cea874c1899f56efdd3d7c5b7243.camel@gwdg.de>
In-Reply-To: <87dd9b7b52e7cea874c1899f56efdd3d7c5b7243.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 8 Dec 2024 11:05:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg+_6eQnLWm-kihFxJo1_EmyLSGruKVGzuRUwACE=osrA@mail.gmail.com>
Message-ID: <CAHk-=wg+_6eQnLWm-kihFxJo1_EmyLSGruKVGzuRUwACE=osrA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Sun, 8 Dec 2024 at 10:11, Martin Uecker <muecker@gwdg.de> wrote:
> >
> > A lot of the 'macro business' for min/max is avoiding unexpected
> > conversion of negative values to very large unsigned ones.
> > And no, -Wsign-compare is spectacularly useless.
>
> This is a different topic, but what would be needed here?

Dan Carpenter actually wrote up some of the issues in:

   https://staticthinking.wordpress.com/2023/07/25/wsign-compare-is-garbage=
/

but the basic issue is that -Wsign-compare has over the years been
truly spectacularly bad.

It has literally started out from the completely nonsensical and
incorrect assumption that the types of a comparison have to match in
signedness, and it shows in the name itself, but it also showed in
early implementations.

The very first versions of gcc that did -Wsign-compare literally
complained about code like

     sizeof(x) < 5

because obviously one side is an unsigned 'size_t', and the other side
is a signed 'int'. So comparing the two is clearly invalid, right?

No.

It's obviously *not* invalid, and any compiler that complains about
different signedness of that compare is just complete useless garbage.
It's literally checking two constants against each other, and the
result doesn't depend on the signedness or the silent C implicit type
conversion.

And no, gcc doesn't complain about that particular code any more.
*That* particular problem was I think only visible in a gcc
pre-release that sadly did actually ship as part of a SUSE release, so
we saw it in the wild even if it was never in an official gcc release.

I'm pointing out the history because it's relevant due to explaining
*why* the whole concept of looking at just the type is so broken, and
how the whole background to the warning was broken from the very
beginning. The very name of the warning is a sign of the problem.

Because gcc still *does* complain about entirely valid code, where
"fixing" the warning just means you have to write worse code.

I think Dan's example from the link above is a good one: if

        for (int i =3D 0; i < sizeof(x); i++)

causes a warning, the compiler got things entirely wrong.

And yes, modern gcc very much warns about that:

  t.c:4:27: warning: comparison of integer expressions of different
signedness: =E2=80=98int=E2=80=99 and =E2=80=98long unsigned int=E2=80=99 [=
-Wsign-compare]
      4 |         for (int i =3D 0; i < sizeof(b); i++)
        |                           ^

So if you want a general-purpose "Warn about dangerous comparisons",
you need to get away from the mindset that it's about different signs.

A compiler needs to do proper value range analysis before warning
about comparing said values. Not just mindlessly say "different types
bad" like some marsupial that has been dropped on its head a few too
many times.

End result: calling it "Warn about sign compare" is a disease. It
shows a lack of understanding of how complex the warning logic needs
to be.

Now, I'm not claiming that our min/max type warnings are great either:
they *do* end up basically being the same silly "just check signs, but
at least don't complain about signed positive constants being used for
unsigned comparisons".

So our min/max macros most definitely are *not* doing that "value
range analysis" that I claim is required for a *general* comparison
thing.

But our min//max macros aren't some general thing. They are very
specific, and so it's a lot easier to accept the not-great-analysis
for those specific cases where we then may have to change types
explicitly or do some other massaging to avoid the warning.

Put another way: a warning that triggers on really basic C absolutely
*must*not* have silly easily triggerable false positives for good and
idiomatic source code.

Such a warning is worse than useless, and gets disabled.

But a warning that is overly restrictive and gives silly false
positives can still be entirely acceptable when the context of that
warning is very limited.

So this is why in the kernel we disable '-Wsign-compare' in the
general case, but *do* basically manually then implement that very
same logic in the very _specific_ case of the min/max() macros.

What is unacceptable nonsense in one case may be acceptable "good
enough" in another. Life is not fair, I'm afraid.

                Linus
