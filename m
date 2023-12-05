Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FD06FCFB
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 22:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aL/SbFi/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c09f4bea8so29908695e9.1
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701814867; x=1702419667; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtdgYO2/5wzcNxCn3VtqicgQzIviRp5CjfOT6b/JWQ0=;
        b=aL/SbFi/nt48Sl4QmhPY1WzstIJx0BqGkjfRJ0uPdSN6mdyN0p5NDOSTJuU1yjVv2B
         taO+zZYA6MtDl4xfxl+fME9im0N/6aWvozTdyEfhBlHO5JE4xXpsZ2XOcyGj7bgq8Unt
         RFoF2dOtYToYrNhYxDlVvIfv0nwLvTBO7VtYJcE5S3ykkNHqWQRpCMgjva+xbzpzIy5N
         gzKIDMIutE7XTTx59tUWGw32kAF1N8P6ZobsVIUwQ/4gkkZwa3WJFYQ86udObKOw5hVi
         QbaRoGJuvCRgyHkIPmqA5+NGK1UsUxMfzf1tytTzHx8/XmRdUZYgaZcWq3I4nN65dBWk
         zXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701814867; x=1702419667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtdgYO2/5wzcNxCn3VtqicgQzIviRp5CjfOT6b/JWQ0=;
        b=I02p0TvUU9uxJxKTyWx3h+nU1hen2md31WJnV535NGJX90TnFx4ndhUwgoktqhPo9u
         5992U9PMBnW0l7SRh2typfyW92yT2BgI8VDhicSMjNLQufNiQ6IMgbLhCEyxvHtglUXw
         Sx/bdKixZx/Zi3vXt8oWGI6Rf1LIHubzC4li7PpoDBCygX6qziuCjNkWm3UX8NoOjBcc
         LsJWxD2jQ0SlR2LCXdPSBNx8FWyx157iD/ub/HfNYyiJXdgNQ5ZMJSgMhtblQ2h5ITQQ
         lC2Ole02uHfJ9Hed8Iqb34L5Gwzq3iqAFNOK37fh0ZBgdEPdLJKLL3aZ8LfNnAMHpy9Y
         QWbA==
X-Gm-Message-State: AOJu0YwsWr6cEwcmimZMGq6YCfmlGPldIlP1Jq1l8ZLruv+MVpOw8a+z
	c1c7Bo62JSjQqChZGGhM6a2YybkIhMbNy+fUGl3StA==
X-Google-Smtp-Source: AGHT+IEHRLg/u4MDQUXn2Q3Vi3FcZx0NgtWPXTCyQiVCGa7EFiClCbQEpu59QZ9PdQyHgzUKzF5X+LKaQB/fPM6CEJg=
X-Received: by 2002:a05:600c:4f81:b0:40c:67a:b3bc with SMTP id
 n1-20020a05600c4f8100b0040c067ab3bcmr14832wmq.71.1701814867131; Tue, 05 Dec
 2023 14:21:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com>
 <20231205213807.GE1674809@ZenIV> <CAKwvOd=2VASkaLvjU+7kkbvhu2CimYn5KUGJBDRePyUhtrNK2Q@mail.gmail.com>
 <ZW-d1NZRIvmJlfcW@smile.fi.intel.com> <20231205221521.GH1674809@ZenIV>
In-Reply-To: <20231205221521.GH1674809@ZenIV>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Dec 2023 14:20:55 -0800
Message-ID: <CAKwvOdm3PrKhGi9DuQvaYN6O-R-EtGQ=BhFm7D4ZPDqU_ZzUkA@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Al Viro <viro@zeniv.linux.org.uk>, Andy Shevchenko <andy@kernel.org>
Cc: tanzirh@google.com, Kees Cook <keescook@chromium.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nick DeSaulniers <nnn@google.com>, Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 2:15=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
>
> On Wed, Dec 06, 2023 at 12:01:56AM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 05, 2023 at 01:51:10PM -0800, Nick Desaulniers wrote:
> > > On Tue, Dec 5, 2023 at 1:38=E2=80=AFPM Al Viro <viro@zeniv.linux.org.=
uk> wrote:
> > > > On Tue, Dec 05, 2023 at 08:58:53PM +0000, tanzirh@google.com wrote:
> >
> > ...
> >
> > > > > IWYU is implemented using the IWYUScripts github repository which=
 is a tool that is
> > > > > currently undergoing development. These changes seek to improve b=
uild times.
> > > > >
> > > > > This change to lib/string.c resulted in a preprocessed size of
> > > > > lib/string.i from 26371 lines to 5232 lines (-80%).
> > > >
> > > > It also breeds includes of asm/*.h, by the look of the output, whic=
h is
> > > > not a good thing in general ;-/  E.g. #include <asm/uaccess.h> *any=
where*
> > > > outside of linux/uaccess.h is a bad idea.
> > >
> > > It's not clear to me when it's ok to #include <asm/*.h>.  Is there a
> > > convention here that I'm missing?
> >
> > The mandatory ones can be used, but not all of them.
> > In some cases you even must include asm and not linux
> > (unaligned.h, byteorder.h, maybe others...).
> >
> > As I told, it comes with experience, we lack of the
> > respective documentation (or file which is good for
> > automation checks, like with IWYU).
>
> It would certainly be nice to have such information in the tree;
> "where should I pick $SYMBOL from?" is something one needs to
> find out often enough.  To a large extent it's covered by "where
> in include/*.h do we have it defined?", but that's not all there
> is to it.  E.g. "get_user() =3D> use linux/uaccess.h".
>
> There's also stuff like "$SYMBOL should not be used outside of arch/*
> and include/*, better use $OTHER_SYMBOL", etc.

That's basically one of the tables we maintain.
https://github.com/ClangBuiltLinux/IWYUScripts/blob/main/symbol.imp

Of course, such a table is a living document; whether it resides in
tree or out of tree eventually I don't particularly care either way.
There are outstanding questions like "is it even possible to
autogenerate such a table (vs manual curation)" and "are the ones
we've coded so far correct?"  I don't expect to have all of the
answers with the initial implementation, but instead to collect
feedback from kernel devs and iterate from there.  Very helpful
responses in this thread so far; we appreciate it.

I suspect that folks that have played with IWYU in the past
encountered great difficulty since these override tables are poorly
documented, and the out of the box defaults assume more of a userspace
layout for common definitions (which our script which wraps IWYU
disables).
--=20
Thanks,
~Nick Desaulniers
