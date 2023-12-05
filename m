Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540DC6FCC6
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 21:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R9B/D21d"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3333a3a599fso73513f8f.0
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 13:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701813081; x=1702417881; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWvJtgJjO5YUTGvzn9ntJuWrPBTqvXSdfxI0wQvK8zk=;
        b=R9B/D21dfNhPf7Umc8tbI02Kkg+SKHtu73gVrx1w50ipduTqHfUD6KbEv8jG+MIm2t
         Gl0HHVYEWK9g4D5t62bKkbLp1I47JrN4Zfxb/iOnh3NuZSreBHnZygcvlw7hEXCqFsvE
         Ig0LD0SFT7AI6TCf1seBj4wv53wPOgB1hssvQNkXEDu48rQJJOwBTTG0mTLxlT571K9S
         KvU/abJqHo8A8OeuRjdQ/eNAUEbCmjrMzNiXKJsao3YhUpxqztAlc3kCfUdSDZcYBn3q
         jeoSme+z4u9C/tX2RlpgzzDx3KaUdD2IOoo0JoiiuPOuiYgOYI/iiWumvd7OvB9UANWq
         5Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813081; x=1702417881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWvJtgJjO5YUTGvzn9ntJuWrPBTqvXSdfxI0wQvK8zk=;
        b=WzZ5XxhBeArK10WRKJ13lM/vfgK9EzA5uhWNyw04SPL+xWqEPI+hCtaBxmyqOZ4E/A
         ftNnXdkU5aVxWI1dA8Tp+4ZDgRIOHaG58uzjSEukb3jqtKRoh5cI4B1DOqGqZaW9PDSP
         M0bPaU00UfFkCmaB3NrRuKf0sWQwDfgzEeYizx7QLlloZjD0z3FHZjOH8eYwqusoVa60
         0fA7CqeGS6LQELhYuKJN1EUnYlKpQe0FNV63URT4H2L76LE14GqAXR7y/N1Rkdf+QmQx
         3dJWkYWhYA7Vyl1L0efGJDJEWQzjanPRBWHHjbgGx3KiT7HV3RrJ7CnKDohuv85iwYS1
         +/bg==
X-Gm-Message-State: AOJu0YylzKLnTXvhwJPCrzZnNSGZGvSjTtUUoouzVNeDg1Vj5DwlOlke
	sCUebeOFHmXG18/jispRkcO6JGsKDFa2jqx+tfW+wQ==
X-Google-Smtp-Source: AGHT+IGs2UEndv3/f7mB6cvBQmur2hbqR/xMSSml4pPkgEk/wNGLd9ptXPWGBBWLtc4XXc4eOOjkqQQUO/3CMlLuBE4=
X-Received: by 2002:a05:600c:1c01:b0:407:4126:f71c with SMTP id
 j1-20020a05600c1c0100b004074126f71cmr975537wms.6.1701813081506; Tue, 05 Dec
 2023 13:51:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com> <20231205213807.GE1674809@ZenIV>
In-Reply-To: <20231205213807.GE1674809@ZenIV>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Dec 2023 13:51:10 -0800
Message-ID: <CAKwvOd=2VASkaLvjU+7kkbvhu2CimYn5KUGJBDRePyUhtrNK2Q@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: tanzirh@google.com, Kees Cook <keescook@chromium.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 1:38=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
>
> On Tue, Dec 05, 2023 at 08:58:53PM +0000, tanzirh@google.com wrote:
> > This diff uses an open source tool include-what-you-use (IWYU) to modif=
y
> > the include list changing indirect includes to direct includes.
>
> How does it account for arch- and config-dependent indirect includes?
>
> In particular, on sh this patch breaks, since there word-at-a-time.h does=
 not
> contain an include of kernel.h, even though it uses REPEAT_BYTE.  This is
> a very simple case (they really ought to include kernel.h, same as all ot=
her
> instances of word-at-a-time.h), but I would expect arseloads of more subt=
le
> breakage in anything less trivial.
>
> And I'm not at all sure that there's no config-dependent breakage as well=
 -
> this had been caught by quick make allmodconfig + make lib/string.o on
> a bunch of architectures; the graph of indirects includes (as well as the
> set of symbols needed for given header) is very much config-dependent.

We're sending these to Kees to stage in branch flowing into linux-next
in order for the patches to get soak time in linux-next; it's not
possible to test every possible randconfig, but with enough soak time
and the bots chewing on linux-next, I think we can get to a certain
level of confidence.

We'll ramp up the amount of testing we're doing locally as well. (I
did quite a few randconfigs locally in a loop; didn't test all
architectures) We can probably fetch the kernel.org toolchains for
very extensive testing.
https://mirrors.edge.kernel.org/pub/tools/crosstool/

>
> > IWYU is implemented using the IWYUScripts github repository which is a =
tool that is
> > currently undergoing development. These changes seek to improve build t=
imes.
> >
> > This change to lib/string.c resulted in a preprocessed size of
> > lib/string.i from 26371 lines to 5232 lines (-80%).
>
> It also breeds includes of asm/*.h, by the look of the output, which is
> not a good thing in general ;-/  E.g. #include <asm/uaccess.h> *anywhere*
> outside of linux/uaccess.h is a bad idea.

It's not clear to me when it's ok to #include <asm/*.h>.  Is there a
convention here that I'm missing?

>
> > If there are any problems with the output of the tool please raise an
> > issue on the github.
>
> Sorry, no.  Your tool, your workflow, of course, but I don't do github is=
sues.
> You are welcome to the contents of this reply, but I'm not using browser-=
based
> UI without very strong reasons; this one isn't.

No problem; Tanzir, please drop that part of the commit message in
future patches.
--=20
Thanks,
~Nick Desaulniers
