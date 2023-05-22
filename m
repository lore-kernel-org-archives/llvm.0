Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AF1171B8
	for <llvm@lists.linux.dev>; Mon, 22 May 2023 19:52:25 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6239a0f1609so20476166d6.0
        for <llvm@lists.linux.dev>; Mon, 22 May 2023 12:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684785144; x=1687377144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p52m+WWp6aApwkHVTkNg5kh/c1TUE8xWnOr/swu4YQM=;
        b=lRpK3qNuuiQELF1mYf+pdqtoRndN/uBy+fRujNOBmFoKNNZHXdQGn1YvzpvVdJmEsc
         o3aMGlzGMRo5bQ1kgH0uISw+aX/9dQxYn75ifiSczdRoxgRETgSHrFpUk4Qz4Bw1R2IJ
         MhyAJcR09p9R18n7Ziq0C2mjuHP7B4FjFS+arj7kNxBLuT0bp/xmQbQiuodgr3hztHl/
         4CPSJAhCovLJTkhnzO8WN/7IrW0xiT3nz9471apMj6tER1aIMTmaI6NmSsejQ1mOhrk3
         3MLyEXrK/w5i0DCPURMZjSV0NUoL5yt0rFbJz/MTHoB08PJ8bVAkFVwax4tQar1VwO4p
         hNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684785144; x=1687377144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p52m+WWp6aApwkHVTkNg5kh/c1TUE8xWnOr/swu4YQM=;
        b=gevnANIIBRDs52FiBD1f3e/grce2Ek3pEXtc3FT0hqiBsS2PyvmT7p1+8nvmMUZX32
         Ekev1jkefNabt/LM7SBYTLceavgaMP6ybcOSXvDUEazyVKxkRVzK/lFHcsSR7z/9WjkR
         7ZZ5LBhvNit6fMDtp9W8CI0Rvq+CqK1qLEi9RTHQXiTLZ/smN/atYrC1TmoV0kX5GW6l
         lXN+jE0SqMrbRECQ6+EDxLWIbLcvEoA6ePvRh+lW96+mWMhbu5Kevp43RgoqECeJySY6
         pIQ6tGCAatlxiQX3wcpUo2In7dSU6RxOL34nBstxm0VwO/OMTUSL4+MYWe8UJ/PsD1y6
         DQmw==
X-Gm-Message-State: AC+VfDyNuj4X47uOMQhLgDgF/EwJdhGBPis8WmzWdGq9KhVs4MB/IHBa
	xIUmGSpwc86vrVAGK7FQ2HVZ8FZAcQYKIObigEHV9g==
X-Google-Smtp-Source: ACHHUZ62p53t5Jx/dLsMCHu7hh9zeJ6bLdglFzoT+d04I0no2SNO9KMZS5dewAaI/LY85SD7r51/PuKHsSa9AFk227A=
X-Received: by 2002:a05:6214:f0a:b0:5fd:7701:88c5 with SMTP id
 gw10-20020a0562140f0a00b005fd770188c5mr23825727qvb.6.1684785144362; Mon, 22
 May 2023 12:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOd=4hBcU4fAkddU0b-GOZc9FzTZoj3PFW6ZZrX0jS8x+bg@mail.gmail.com>
 <17c91d37-7d9c-0df4-2438-2b30ca0b5777@collabora.com> <CAKwvOdk4QO8x_bs64fFRCsMu__AjhXd4Ew2KfgzQOb9Q3FMqSA@mail.gmail.com>
 <b5d0cf82-0e42-f6a1-c9f5-c145fdc4c622@collabora.com> <CAKwvOdkFxu9hYSL_RCXadpR0dQd1+dZmAUVXdfFiLUfxg4D_Xw@mail.gmail.com>
 <878rdlk9bi.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
 <CAKwvOd=8LVU+iANkFx18Wm1jg7gYiAXovAmo9t5ZZaVdMULn-Q@mail.gmail.com>
 <875y8ok9b5.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
 <CAKwvOdmJJibt6sHSp91v2s7BxUWBC6xG7F7+3C6gUxNMzZ2xRA@mail.gmail.com>
 <87353ok78h.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
 <2023052247-bobtail-factsheet-d104@gregkh>
In-Reply-To: <2023052247-bobtail-factsheet-d104@gregkh>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 May 2023 12:52:13 -0700
Message-ID: <CAKwvOd=2zAV_mizvzLFdyHE_4OzBY5OVu6KLWuQPOMZK37vsmQ@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: Greg KH <gregkh@linuxfoundation.org>, Maksim Panchenko <maks@meta.com>, 
	=?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, Michal Marek <michal.lkml@markovi.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev, 
	"gustavo.padovan@collabora.com" <gustavo.padovan@collabora.com>, 
	Guillaume Charles Tucker <guillaume.tucker@collabora.com>, denys.f@collabora.com, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 9:52=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, May 22, 2023 at 12:09:34PM +0200, Ricardo Ca=C3=B1uelo wrote:
> > On vie, may 19 2023 at 08:57:24, Nick Desaulniers <ndesaulniers@google.=
com> wrote:
> > > It could be; if the link order was changed, it's possible that this
> > > target may be hitting something along the lines of:
> > > https://isocpp.org/wiki/faq/ctors#static-init-order i.e. the "static
> > > initialization order fiasco"
> > >
> > > I'm struggling to think of how this appears in C codebases, but I
> > > swear years ago I had a discussion with GKH (maybe?) about this. I
> > > think I was playing with converting Kbuild to use Ninja rather than
> > > Make; the resulting kernel image wouldn't boot because I had modified
> > > the order the object files were linked in.  If you were to randomly
> > > shuffle the object files in the kernel, I recall some hazard that may
> > > prevent boot.
> >
> > I thought that was specifically a C++ problem? But then again, the
> > kernel docs explicitly say that the ordering of obj-y goals in kbuild i=
s
> > significant in some instances [1]:
>
> Yes, it matters, you can not change it.  If you do, systems will break.
> It is the only way we have of properly ordering our init calls within
> the same "level".

Ah, right it was the initcall ordering. Thanks for the reminder.

(There's a joke in there similar to the use of regexes to solve a
problem resulting in two new problems; initcalls have levels for
ordering, but we still have (unexpressed) dependencies between calls
of the same level; brittle!).

+Maksim, since that might be relevant info for the BOLT+Kernel work.

Ricardo,
https://elinux.org/images/e/e8/2020_ELCE_initcalls_myjosserand.pdf
mentions that there's a kernel command line param `initcall_debug`.
Perhaps that can be used to see if
5750121ae7382ebac8d47ce6d68012d6cd1d7926 somehow changed initcall
ordering, resulting in a config that cannot boot?
--=20
Thanks,
~Nick Desaulniers
