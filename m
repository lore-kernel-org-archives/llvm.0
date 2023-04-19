Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405D03C34
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 13:00:43 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id u3so29443736ejj.12
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681909241; x=1684501241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwi6q3cu45MnE4kyT4HYhg8YlJb8XVnKZHENVBx9cJw=;
        b=q9bUXYfNIZcsLe55ILrvb+lgpf2Vt3HQWODdgf0HwXP7ruIx5aJKLDRpZMAoNyq2xl
         U2eVXI9moVOcl6M5H7JRZet9WaKzH0hO+Tj42DpFmXmgFhmtz8YBCBdDfJCe54JokDgG
         wyRSar3MYwUSuh6tViOBxFXCKKVqWNv3dyppoCxVS3jIOPiIV+9yKFUV9ck60YZ3uJcq
         3Wu106SGWBD+iAAIAXjJSyPPr8U+xJPEnfvVq78SP8j1CzZg8aRiVfDMtK7rHbhlvJBY
         lxdowrUZ8QV5WqOIvj+2RG4BlGpm4KrXoIe6Yu06Kc71nPndkK7dteYEDLPeQhAPhS3S
         KmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681909241; x=1684501241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwi6q3cu45MnE4kyT4HYhg8YlJb8XVnKZHENVBx9cJw=;
        b=kK3ZDoTpr5gbrP7uuYiCoZPxmoYRQs3o5Rjp8LdfzttEIf70+2grOpiILr7DthgeJP
         Xu3TbrTEqUkCCVmTffypZ6JUdJDmIQIVXwghJRofvdlJA/DZ99UMmi5tIX3wj/aSsMZj
         VQAppnGs+ipO7kE9+zUw9NZsVm2IYImg+Hlw2ySUvL2+kEVDUZwKt60+uPulcfQhBPU/
         qRoBLDlSuGkPD6slylczqLGpaZ6q8/EUFkF1zdZ5IKd7+FcZ4zhfnbKejcI1UQ5OgdmR
         Z4vsZAYEnl2o8hM2xpgY4ZQgDp+f0Q90I9LsW8fxfSMxVio7rnTgNhKirikeioGW5jRl
         6z0w==
X-Gm-Message-State: AAQBX9d13PnO7r37sDtTDQNXC9WKzu1VjHcPiwaB15jZR+UhJXReJCi8
	NT7yt+lcb1jDCwaQ1TBtjBXzo7Q17ook1dRk4rfdSw==
X-Google-Smtp-Source: AKy350YU7NS8auXb9psE2UrHtL99IMokCu0HrsOfTYc1jzaflfxqtjw+b8TWe/R+fYzLaCBTEQnr/BHby6rHDFe5Pfg=
X-Received: by 2002:a17:907:8a21:b0:94f:3521:396 with SMTP id
 sc33-20020a1709078a2100b0094f35210396mr13023290ejc.23.1681909241003; Wed, 19
 Apr 2023 06:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230414005309.GA2198310@google.com> <CAKwvOd=yQS+0oDC46Hc5D_V0JET8=xbQmAJrpBdg7c4i2EyqHg@mail.gmail.com>
 <CAKwvOdk+D6HuWwAH3EJtwDyPqoiP+2z62ek2hnmbhDV2CJwnbw@mail.gmail.com>
In-Reply-To: <CAKwvOdk+D6HuWwAH3EJtwDyPqoiP+2z62ek2hnmbhDV2CJwnbw@mail.gmail.com>
From: Florent Revest <revest@google.com>
Date: Wed, 19 Apr 2023 15:00:30 +0200
Message-ID: <CALGbS4V+x1JkiPL2o59LgtbSQhzg_RKM5TYE7i7qZx0qz23y-g@mail.gmail.com>
Subject: Re: clangd cannot handle tree_nocb.h
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org, nathan@kernel.org, 
	trix@redhat.com, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	paulmck@kernel.org, "revest@chromium.org" <revest@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 6:28=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + Florent

Hi there!

> Joel, Florent is doing some cool stuff with clangd and kernels (check
> out the demo at go/linux-kernel-vscode).  I'm pushing Florent to

Apologies for folks outside Google, this is an internal link to a
kernel dev setup I originally created for myself, then for my team and
apparently more and more people are starting to use it internally. :)
If there's enough appetite for it externally too, I'll try to
open-source it someday. Anyway, in the context of this conversation,
it's just something that uses clangd. :)

> publish some of the cool stuff he's been working on externally because
> it is awesome. ;)
>
> Florent, have you seen any such issues such as what Joel reported below?

Yes, I've seen this problem a bunch of times. Afaiu, Clangd operates
under the assumption that every source file is a valid compilation
unit. My understanding is that it's generally a good practice to keep
things that way and I wouldn't be surprised if the userspace Chrome
code-base Joel saw enforces this (iirc, it's a rule for
Google-internal C++ too, all headers must be interpretable
independently).

However, from the perspective of the C spec, anything can be included
anywhere and a C file can only make sense if it's included
after/before certain other things are defined/included. Spontaneously,
I would call these ".inc" rather than ".h" or ".c" because I would
expect a source file to be always valid and this suffix makes it
clearer they depend on their context, but as a matter of fact source
files that don't compile when interpreted individually are quite
common in the kernel tree. Other examples that have been reported to
me include a lot of kernel/sched/*, since many of these files
(including .c files) are included from kernel/sched/build_policy.c in
a specific order to form one big compilation unit.

Unfortunately, I don't know of any solution. :( This feels like a
limit of C or compile_commands.json to me. "compile commands" can not
be enough to interpret any file, clangd would need a way to express
"interpret this file as if it were included in that spot of that
compilation unit" and maybe even need a bunch of heuristics to choose
one such include spot.

I don't know if clangd has any plan to address this and so far I've
just lived with these error squiggles.
