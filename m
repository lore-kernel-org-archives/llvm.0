Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6EE882D
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 23:42:12 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id i5so6376555eda.0
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 16:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679355730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yh9V5oLNl71ZE8wLJrHU90qn5FMul3QSy4jMGg+s0h4=;
        b=N4wVROOxKzQ4OoNcx8r5uTzsGb3CGCAyBDkN21Yg7Ibmi8awtnbTHYbFslExfamja/
         XTM1YvfD/UrKoD1ItfOmSDYXiKENfbGZQ5liaJggvBqVMf0Hs+UTvdbIxy95Kszei7pp
         Wo0DXOsYVQZLQVXcTOkM9muZUJt416sTmJ7z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679355730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yh9V5oLNl71ZE8wLJrHU90qn5FMul3QSy4jMGg+s0h4=;
        b=nNhEmAZvJDearwQgW4+CcFdG5oD3VhBbEn0aW+sit/I9X1T08AWuyfm9L1+Hwg4SRE
         6aDQAezrjU6sbGMcCXNwUrpgkFA1bAXv/vU2gvfjYUozljhCcrlzcq9mbvH1rCy4/kHB
         z+XEuYxtD5QeeI+Rk653tKFTTWuFEdkTfeO5xr87iNKlJk4JsgH/Odrv8As5W2sdg4MZ
         cwQ+yUGKyouyPIyXC+vgnqXgtijkuzGD1OSgusluT/gcZdgfOBGEMTBN9r4QaAkjyAwo
         4Blw3mq4t/HtiMZB3dM1Pf4OAAGRITOfCHO5UGJ4UONLmhXR2LyweSex9TnD4h+BP3mS
         aA4A==
X-Gm-Message-State: AO0yUKUkjBSyqQjELicVej2Ld84yG9aGJMjXa37MKn8iMbYBv6fj5tpG
	ny+nQTr64qCq74t/FEMPRxqfH202L36l1WcGxdT6MTvz
X-Google-Smtp-Source: AK7set+hR+Y4fVA1kKtBvCzYlthEfpXpbk+LHXr/0kurcdNOH04STEJjIAMGsromNOoQKOaOP+sNjw==
X-Received: by 2002:a17:906:c04c:b0:92b:5c67:c660 with SMTP id bm12-20020a170906c04c00b0092b5c67c660mr825516ejb.69.1679355730592;
        Mon, 20 Mar 2023 16:42:10 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709060f0f00b009313da4e471sm4994336eji.41.2023.03.20.16.42.09
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 16:42:10 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id o12so53268311edb.9
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 16:42:09 -0700 (PDT)
X-Received: by 2002:a17:906:13d3:b0:931:2bcd:ee00 with SMTP id
 g19-20020a17090613d300b009312bcdee00mr395674ejc.15.1679355729667; Mon, 20 Mar
 2023 16:42:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X> <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <4adbed5a-6f73-42ac-b7be-e12c764ae808@roeck-us.net> <CAHk-=wgyJREUR1WgfFmie5XVJnBLr1VPVbSibh1+Cq57Bh4Tag@mail.gmail.com>
 <20230320220631.GA637514@dev-arch.thelio-3990X>
In-Reply-To: <20230320220631.GA637514@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Mar 2023 16:41:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=whf82-im76ovESE2RZBh5=Y3uR1GDbae60=TWjM7OkLdA@mail.gmail.com>
Message-ID: <CAHk-=whf82-im76ovESE2RZBh5=Y3uR1GDbae60=TWjM7OkLdA@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Nathan Chancellor <nathan@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-toolchains@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 3:06=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Right, this seems like a subtle difference in semantics between
> -Wuninitialized between clang and GCC.

I guess it's a bit ambiguous whether it's

 "X may be USED uninitialized"

or whether it is

 "X may BE uninitialized"

and then depending on how you see that ambiguity, the control flow matters.

In this case, there is absolutely no question that the variable is
uninitialized (since there is no write to it at all).

So it is very clearly and unambiguously uninitialized. And I do think
that as a result, "-Wuninitialized" should warn.

But at the same time, whether it is *used* or not depends on that
conditional, so I can see how it could be confusing and not be so
clear an unambiguous.

On the whole, I do wish that the logic would be "after dead code
removal, if some pseudo has no initializer, it should always warn,
regardless of any remaining dynamic conditoinals".

That "after dead code removal" might matter, because I could see where
config things (#ifdef's etc) would just remove the initialization of
some variable, and if the use is behind some static "if (0)", then
warning about it is all kinds of silly.

                     Linus
