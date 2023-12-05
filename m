Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0BD6FCD7
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 22:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OEJHRuPd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3331752d2b9so104215f8f.3
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 14:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701814506; x=1702419306; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DD0DNj25uBQ/C17oozD5v/SE0XLXNTxkbhUNY2hqqrE=;
        b=OEJHRuPdZJOBJJdLJIx+SL/SXQ+XcI764fopKdV29Ym3esZl8aHwMc7pTLH9gAerM/
         jDljWgEbeRt2Ww8UWe3cXM3aSYRmWSiSx/ojuvKsKlce4JmpdVlXa3tnLNUDcR3GjXvJ
         yzHHRV+DGivhEoKsoZZkU23pi4mnAJc9VUu/kGUCx1yZeaItc2LVzwuOhRbxAuyS41tS
         UOwS6lEStUqD80jy8ngZ86sXMKmu65jlVoNmm7k99HgKN+EfmI8YG/UJBF5SFS6Itr8h
         Uc3odAp4a67WLnI0Ce+8iN05xZEXiSf5HrR1EA2YetCzKWcAGFzvgDg/mO8zcN9WnLun
         1Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701814506; x=1702419306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DD0DNj25uBQ/C17oozD5v/SE0XLXNTxkbhUNY2hqqrE=;
        b=XU1TE4vYlqsFBtRgpDZDrLin7zELuDMvr1tDwxMhpcHlrJjkvphGcJLTaCnnH45+VL
         KJJNZYkcWuBk2PSa2nfFMIExj4/K6oBep5I96KgtzbfWi8Hd+fRM0KtLym4L8Rsv3444
         wE/cqNgTVggqaHZi0UjGOSHTMdNhlzolxACSwu4Jl5ukJmkROjzAGHM2sMSPHzJC8siv
         uEqhB8bDUTPte2t9L5qRo018z0JFh/rfmWPbKL1H5WGGR6+dNwNOz3lpkDtBX/w+3hkn
         0IQ7t4cvHseoLmdK4Pz6/1c5KNBZh6b3PVNHhqLFIJy9koD8734QpR/RSfUju16QaJbO
         W7rA==
X-Gm-Message-State: AOJu0YwL9d0j0LaMaUMnI7te6/uYywGR5kQ88vDoc+pew7osJWQjlAfG
	NIQ6J2VgqL9Yhx4xVKA1uSovCPDvIYQ792Zz3dze0w==
X-Google-Smtp-Source: AGHT+IEIuFKrkoFvYNzPlxheppKvhm+ftQtjTc7AwFMq9skdDpEb1ZX2PjA9ALQOqeclZUUHHQS+hx4qWH0scPlWAGg=
X-Received: by 2002:adf:f18f:0:b0:32f:7c6c:aa14 with SMTP id
 h15-20020adff18f000000b0032f7c6caa14mr6218857wro.37.1701814506175; Tue, 05
 Dec 2023 14:15:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com>
 <20231205213807.GE1674809@ZenIV> <CAKwvOd=2VASkaLvjU+7kkbvhu2CimYn5KUGJBDRePyUhtrNK2Q@mail.gmail.com>
 <2023120608-ivy-snowdrop-890d@gregkh>
In-Reply-To: <2023120608-ivy-snowdrop-890d@gregkh>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Dec 2023 14:14:55 -0800
Message-ID: <CAKwvOdmFJ=ZGN8ZScS5oQpXnAL0wwtTDCeNNGpBKZXzQ4kRAVA@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Greg KH <greg@kroah.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, tanzirh@google.com, 
	Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 1:59=E2=80=AFPM Greg KH <greg@kroah.com> wrote:
>
> On Tue, Dec 05, 2023 at 01:51:10PM -0800, Nick Desaulniers wrote:
> > On Tue, Dec 5, 2023 at 1:38=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk=
> wrote:
> > >
> > > It also breeds includes of asm/*.h, by the look of the output, which =
is
> > > not a good thing in general ;-/  E.g. #include <asm/uaccess.h> *anywh=
ere*
> > > outside of linux/uaccess.h is a bad idea.
> >
> > It's not clear to me when it's ok to #include <asm/*.h>.  Is there a
> > convention here that I'm missing?
>
> General rule, NEVER include asm/*.h, there should be a include/*.h
> instead that works.  So much so that checkpatch.pl should catch this,
> right?

ah, shoot, I was showing Tanzir how to use `b4` for patch development,
and forgot to check this.  Indeed it does.

I can see how the check works (scripts/checkpatch.pl L5881).  Decoding
that will probably help us improve the tooling.

>
> But of course, it doesn't always hold true, there are a few minor
> exceptions, but they are rare.

$ grep -r \\#include lib | grep asm

shows quite a few exceptions, and just in lib/.

For example, lib/math/int_log.c includes asm/bug.h.  Is that a case
where lib/math/int_log.c should be #include 'ing linux/bug.h rather
than asm/bug.h?
--=20
Thanks,
~Nick Desaulniers
