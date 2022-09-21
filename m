Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745E47C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 20:57:04 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so42149pjh.3
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=hZuBe6GfUXO3sH61bLS+0hwu/6UtFNGfIgP8JjtlsCc=;
        b=W3NWZOwXYBdW4vnCLVHBwJ4vVYQ+OVRwc6tWgtAyq+kT3N1swA5/29Pp4xH/Izfh7l
         5JXl0qfxS+HyW7ETxgnwa+RLcAI6NgYo5xFRYZCGEfXqPQ6q4db1qtzZRsmFT/Mh56bZ
         YWMIIVwx+TxUcDqD48t2RimOsa988Pax/sZCq9D+Rl+avkA2HlU+quvqnhKM23R2oImV
         Rb7aT+gWASQr7L+pj9IpTUi34McSPwn07j2F22dIvnDqtHFzbNk+/LJuiKPlMHkbX2S+
         YBP9u7rFevUPuMo8fSrl3wREj3hkzkj/Bm2j19h/yb6dgppbHP9UzZ2PE2o71llEcLAG
         sDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hZuBe6GfUXO3sH61bLS+0hwu/6UtFNGfIgP8JjtlsCc=;
        b=kVaGREiWZyWR+EtEbnev6m0dPr9nXR5IFe07Ro2igKbghMwwmvX1eLkOnrJjET+6Sf
         8gKRSlXjj/3Xbwts/7UMFhd4rQ9NN3Ou1F26n7PzdM6R2kJVnSt6pK2OXOqeOjde7hZJ
         lim4lPozFMlsyocUnQk5+XdG3LNuyrw6fuiSS+1j4SX0Vxdn2FFZRXlhEVdRF2sR3Qfe
         QpCH+kfQ0+JjTzFk8MZ6FnuY5TsYwZTOxaNLxUuxP0lD1EZmUvfXJiWUH0KHOawlXIhk
         N1ZQPVf5g2cc4CoDdwsK5qaKZ5lIvCy78ds5d8UQWtTVM/Mcri61pmxbOBclP6+sE8H3
         U+QA==
X-Gm-Message-State: ACrzQf1bjjL4McNAE90i2vImn6PXa5vs0NOohe2OFync2uBeHEttFRiO
	MIvXfuMqf9E6eG9WsbTdmoU+d3xfn5HlYWHN/Eil+gVEoqE=
X-Google-Smtp-Source: AMsMyM4d5CUBUfw3wceeA2FvIK8RKRQO1ZQA65R1sjH0f9DunVq4thAS63+gsZGYXJ0tUyzEfThqrcwxNKD61k1M9c8=
X-Received: by 2002:a17:90a:74c4:b0:203:336d:dd36 with SMTP id
 p4-20020a17090a74c400b00203336ddd36mr11343898pjl.107.1663793823770; Wed, 21
 Sep 2022 13:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAB8jPhfj0ubtcr6XuotCVc9J+uqbZ-2QhnbUMWmge2ZGJ3xtvg@mail.gmail.com>
In-Reply-To: <CAB8jPhfj0ubtcr6XuotCVc9J+uqbZ-2QhnbUMWmge2ZGJ3xtvg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 21 Sep 2022 13:56:52 -0700
Message-ID: <CAKwvOdmgiUNzi7Y984zVVWH+QAjPqQHK9XcNP4rBajGZibEFYA@mail.gmail.com>
Subject: Re: Chromium's #include analysis
To: Hans Wennborg <hwennborg@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, Arnd Bergmann <arnd@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ external mailing lists
+ external folks (sorry the internal intranet go/ links won't work)

On Wed, Sep 21, 2022 at 11:59 AM Hans Wennborg <hwennborg@google.com> wrote=
:
>
> It's probably not useful in the context of Linux, but since it came up at=
 the social the other day, I figured I'd share a few things we did with inc=
ludes in Chromium.

Thanks for following up!

>
> http://go/chrome-includes shows stats and allows exploring the include gr=
aph. I particularly like the "Per-Edge" analysis which shows what include e=
dges would be most beneficial to cut.

Interesting! Do you have a link to (public) CLs that made such cuts as
a result of these measurements? I'd be curious to see examples.

>
> We also track the "total compiler input size" number over time:
> http://go/chrome-includes-archive
> As you can see, the trend is positive, and not in a good way :-p
>
> We used this to do a lot of cleanup and keep build times in check for a w=
hile, but as you mentioned backsliding is a very real problem.
>
> For a while we used https://chromium.googlesource.com/chromium/src/+/main=
/docs/wmax_tokens.md to prevent backsliding in certain files, but it got to=
o annoying in the end, especially since updating libc++ meant we had to go =
raising the limits all the time.
>
> Again, probably not useful for Linux, but I'd be interested to hear if th=
ey ever figure something out that works for them.

Still, it's useful to get folks interested in the problem space
together in the same room (or mail thread).

--=20
Thanks,
~Nick Desaulniers
