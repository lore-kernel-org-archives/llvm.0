Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE3672
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 22:25:01 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id l18so13354313lji.12
        for <llvm@lists.linux.dev>; Mon, 06 Sep 2021 15:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=djkX2LEeT3p1G5IHevNmOqztMBJt0/G4rH/Ybx5oPXc=;
        b=D5wOQF1JFIwGSDN/Sb0iapcFbHL+lhF3tzSy9ZFGW3bv6GMHaFvDgFX4JLNGAakjXo
         dqIBpyrSiDU7hHebER8AWhG3rNllOoPtrVW0l0dbSzHNmizT1X+Wdyt8jpV4p65GcbHK
         ldnvLQtZ4dlaDVszjo7P3N48zYpV1BMBHKhjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=djkX2LEeT3p1G5IHevNmOqztMBJt0/G4rH/Ybx5oPXc=;
        b=Y9IPqg8VLAFfQ9anAoD27IGSLvRIUbMX04Zv3TWsLx1BRCBWX0dshjZpySvpEZfPqO
         PCLsbFO5qOQD1yj0tv8J9SXD3wZwzN6HQS31gpILOGjONGO+SeM71T29itksKb3gOFUV
         QNDzL4thfKe/Mi31DNsbvASbjTg+yH31KW36fUifYk6oy6MpfQ15JuSVjmAtBgCJL6BN
         D4NPQZfmqDlhfd7VzaQ/FfWYxo41it/nn19BYGkigUSGYmeQunWU7Tq+GFlFHV2IwcIA
         9c4bADLSmNWxjk9rnaesGKjyv+W5nEdv+k0JvNvnkVvNh1+ofuWIiUAH5yJHVgX8KIdc
         sDTg==
X-Gm-Message-State: AOAM530anM9DoEYVkw6Gdsi8tKLBPtZjrhKEedtEljF8z3tXeZi0of8F
	VNB1pT5vT9jpFrYGCD9NClfVcjioCTKiYvHp
X-Google-Smtp-Source: ABdhPJxHHMR4ut4F/41jTGlDKnjF2jiom9Q7TAS4polRR/MkEKUCsEg8XlxpMOgEU2tZrpaV5MBfwg==
X-Received: by 2002:a2e:b803:: with SMTP id u3mr12359349ljo.55.1630967098938;
        Mon, 06 Sep 2021 15:24:58 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id e17sm1229530ljk.133.2021.09.06.15.24.57
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 15:24:58 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id k13so15724357lfv.2
        for <llvm@lists.linux.dev>; Mon, 06 Sep 2021 15:24:57 -0700 (PDT)
X-Received: by 2002:a05:6512:34c3:: with SMTP id w3mr10565547lfr.173.1630967096954;
 Mon, 06 Sep 2021 15:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
 <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
 <87lf49wodu.fsf@oldenburg.str.redhat.com> <20210906194808.GY1583@gate.crashing.org>
 <20210906201432.GZ920497@tucnak> <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
 <20210906215218.GA920497@tucnak>
In-Reply-To: <20210906215218.GA920497@tucnak>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 6 Sep 2021 15:24:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiKy45R2vMHhjr16_Q+iYea-70byuj=mHLvp1GURqdYPA@mail.gmail.com>
Message-ID: <CAHk-=wiKy45R2vMHhjr16_Q+iYea-70byuj=mHLvp1GURqdYPA@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To: Jakub Jelinek <jakub@redhat.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Florian Weimer <fweimer@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 2:52 PM Jakub Jelinek <jakub@redhat.com> wrote:
>
> It is actually not that bad, stdlib.h is indeed included there because of 2
> intrinsics out of more than 5000 and when one doesn't need those, just
> #define _MM_MALLOC_H_INCLUDED

.. and on clang?

In other words, your suggestion is unworkable, and actively works
against the whole point of "use standard headers". It's a joke. And
not in a good way.

There, I think you have to undefine __STDC_HOSTED__. Maybe by using
-ffreestanding?

Except if you use -ffreestanding, you lose some very bvasic
functionality (*), so we don't do that except for very special code
(our 16-bit realmode code does it, for example, and some very
low-level library implementations).

Just face the facts. Those header files weren't designed for the
kernel, and we've done all the special x86 FPU stuff using inline
asms.

Which is fine. But it all just proves your arguments about "you guys
have to use our header files" to be just a pipe dream, and not true.

The compiler header files may in some very limited situations be
usable. But in the general case? No.

And they should very much *not*at*all* be considered some kind of
sacred "this is the only way to do things". Because that is clearly
not true, and has *never* been true.

The usable header files are the odd special case, not the general case.

Really.

Is it really so hard to just admit that the kernel shouldn't use those
headers? When we have 30 years of experience in doing exactly that?

                  Linus

(*) iirc, with -ffreestanding gcc doesn't do all the basic memcpy()
optimizations. But I forget the exact details.
