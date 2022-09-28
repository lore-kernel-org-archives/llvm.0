Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAAB7B
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 22:50:20 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso4208719pjk.0
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 15:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=5o/tcQvXqepcJIqIzQaqhUvbESgLIe1tGFB+s57I1bA=;
        b=qUs3EcQaXe0WVDuCS9/XixAjFVr4hjnF1XqkrJb7POO819wCS2b4H5+mTuaQ3xl5v6
         Cy7+9SnIhCTeYjFOBlMI/iphUJvrowlBzQk94IYnUKUbOK6B6LoHDH5lMAqcePZjxxsP
         Eovnn0zVLBkCSIMZToTmF5eQ2Rp9a3KZ259SQSElXiLA3ppaZQra5jli19rWnepU4i/o
         HlsFxZpCaoyUu96l13taABvyrOCutD5Rqvv7HYzIiCOoM+kH9JwfaUi8XyBmEwJUAPMn
         CxfNFod3GOJFJ6H6YuiESrdSIyFTHxyKZju4gFvKS2CkP+tLSFqGMAeTgJev/kDHTH3/
         +mXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5o/tcQvXqepcJIqIzQaqhUvbESgLIe1tGFB+s57I1bA=;
        b=uvL7GKbtPuGhACVEtVBJB0kxKS2Vg+dcRmdSxezcD6r3HcjSF/6mIg0IPZn0xXd/8v
         xmvKQ99P6yClC2y+If1RGx7Bab4/1gz5kB+JgOc4/mKnLqzxBBMTv/MSJiTe19XESrIf
         uxFpt1iF2b4FAO3DZNd0mxJxFaF5dTk5+rW6w86AOC2g2lPrUbz1GUgFx1UorWgx/pbL
         QsvnXRyGVSB407d9jHjDmLJoJlvXkSARy4eS0yYQYh/GIA18P4IREgDPePUf+RvlBzts
         3BEs/nvKAfGxY/SHXfFIinjLkOdA6GdTY0qr9qgdMtiidChVCc7fA8VWb95GYz+F3lSS
         VJ5w==
X-Gm-Message-State: ACrzQf1esLTIeoQ0sSr3PPHg6twacBr9m7uGHODrkIuCgdei4TQ+gmzP
	+hgeSZeMd2SzQ0O0k53WgEcDsEkYY/jSM/FTwFwpHA==
X-Google-Smtp-Source: AMsMyM6Q933Rdg8qNH+ZUEoEfeviXcIBFJlCix2uLbqz8tLlROVElCHGuAVItwRHnOrECj/BXZqR9/tFhFWmYLNs06Y=
X-Received: by 2002:a17:903:41c3:b0:176:b990:6c28 with SMTP id
 u3-20020a17090341c300b00176b9906c28mr281576ple.94.1664405420001; Wed, 28 Sep
 2022 15:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGXevkhSrz5B=NavzTH1WLLGjmJ=z2AVXb-vm1ZRvJO=vK8x+w@mail.gmail.com>
In-Reply-To: <CAGXevkhSrz5B=NavzTH1WLLGjmJ=z2AVXb-vm1ZRvJO=vK8x+w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Sep 2022 15:50:08 -0700
Message-ID: <CAKwvOdmb3dpYM5tOasgKHB3h1CQuV0GTpjM6Z2NL-kgrhGuvwg@mail.gmail.com>
Subject: Re: Connecting Nick and Kangjie
To: Kangjie Lu <kjlu@umn.edu>
Cc: Navid Emamdoost <navidem@google.com>, Nathan Huckleberry <nhuck@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, clang-built-linux <llvm@lists.linux.dev>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2022 at 3:37 PM Navid Emamdoost <navidem@google.com> wrote:
>
> Hi Kangjie,
>
> I hope you are doing well. I wanted to introduce you to Nick who is worki=
ng on very interesting projects at Google for the Clang-built kernels. He c=
ame across your CCS paper on identifying indirect calls targets, and was in=
terested to know about more of your work.
>
> Nick,
> Kangjie was on my PhD committee and we published a couple papers on detec=
ting resource release bugs in the Linux kernel. Hope you can find interesti=
ng topics to collaborate on. Please feel free to keep me in the loop.

Naveed, many thanks for the introduction.

Professor,
My colleague, Nathan, recently pointed me to
https://github.com/umnsec/mlta which I was unfamiliar with.  I've been
driving the effort to get the kernel buildable with clang for the past
~6 years, to help facilitate such academic research as this.  `asm
goto` support landed in clang-9, and has been a major focus of my work
in LLVM in particular.  Seeing the difficulties with them mentioned in
section 5.1 of https://www-users.cse.umn.edu/~kjlu/papers/mlta.pdf
gave me a chuckle (a sad one...it's been a long painful journey).

I was wondering if you would be able to stop by a public virtual
meeting we host once every 2 weeks and give a quick (~15 minute)
presentation on MLTA?
https://clangbuiltlinux.github.io/ has the Google Meet and Calendar
links. The next instance would be Wednesday next week at noon Pacific.

In particular, I'm also curious if you have additional research
underway involving the combination of LLVM and the Linux kernel?
--=20
Thanks,
~Nick Desaulniers
