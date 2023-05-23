Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BD0BA4C
	for <llvm@lists.linux.dev>; Tue, 23 May 2023 21:27:35 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-75affe977abso49198985a.0
        for <llvm@lists.linux.dev>; Tue, 23 May 2023 14:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684877254; x=1687469254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNlEUqqugQC8KchF0X4c1k6SCtVIX1Yn2D4dSDwh7co=;
        b=FwqTdM2HENw2ZzOEs5MxA/ENou76l6x1m+3W1TmCCYe4Trufoit4eLMmQD3AGtPMWD
         PtWUKOD5PhKRHVRLymL/WQoVWr8xnNOY3eepkOXyHcQHrMGq2HcUXGqc7xzJ6AXZxiLt
         zXBPHbv4usC0gaxOdywqfH7UssirrF9vX1kB8dKV2ecvyqbWypah0GvNevXTnaHR6uZm
         T1BPdTfp1m7uhUjvJNH0/AUdloyQEJ54e5SVKOPxfS+s+seEk2vDcVCvVSJsPRHBVRdZ
         DMgbgkBCWnlvp95k0bZfS2B1YamZBclQmHZMW0PF9ensw7f+K04aW1U/sa2aTEIw2GLu
         BZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684877254; x=1687469254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNlEUqqugQC8KchF0X4c1k6SCtVIX1Yn2D4dSDwh7co=;
        b=WgRo7+GoQDKfKX6FKV9oyZNas3zEydZ5ZNvsuPm3zK6ShjcQqq+3uI2FPAMyApqvK9
         G1VuBDGGsZE3j2KduwkSSZdKut7tJZXKldMwvDKlzeZluUB33JlGSeCKdW9G4in1Qnl+
         FxF4PTNyMZzrq9/9E5/oyS0gcE+JEkp8zFhSLQlr+0FmSVp3tnaO9YmNYm6I3zVladp2
         oCfWc4/uUKBDsmJwh6AIlH45aKzRGLe8Z6x52lHo6lGk2/MuGjZsJS1NiLKE93ByXcak
         WqMzH2s7n45doz38yBy8eSCxHWwb2V08bL2aS3O41u2s/geF02BXSV/0Ki/S3VndHRud
         IqgQ==
X-Gm-Message-State: AC+VfDy8bKEjIA25y+XGOJWM7yM7M9vFEBu0uE4xDsD/nJ10NviR3hcz
	PQybkhsGSnq5xqr3RGNVAwmH5YRyag0CkGuzT7KA0w==
X-Google-Smtp-Source: ACHHUZ5PhnbUbpPs2QeHQPhrhqroBAo9dlVX76tDSkqxGYjXlxAq8SmiZZNi4JCnYTX+bVveMq/1akvjyw3JN122/QA=
X-Received: by 2002:ad4:5c6f:0:b0:623:47a9:941d with SMTP id
 i15-20020ad45c6f000000b0062347a9941dmr26195042qvh.37.1684877253853; Tue, 23
 May 2023 14:27:33 -0700 (PDT)
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
 <2023052247-bobtail-factsheet-d104@gregkh> <CAKwvOd=2zAV_mizvzLFdyHE_4OzBY5OVu6KLWuQPOMZK37vsmQ@mail.gmail.com>
 <cff33e12-3d80-7e62-1993-55411ccabc01@collabora.com>
In-Reply-To: <cff33e12-3d80-7e62-1993-55411ccabc01@collabora.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 23 May 2023 14:27:22 -0700
Message-ID: <CAKwvOd=F29-UkNO7FtUWpVV=POOZLb6QgD=mhLMWtRfkRSSi2A@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: Shreeya Patel <shreeya.patel@collabora.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Maksim Panchenko <maks@meta.com>, 
	=?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
	Michal Marek <michal.lkml@markovi.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev, 
	"gustavo.padovan@collabora.com" <gustavo.padovan@collabora.com>, 
	Guillaume Charles Tucker <guillaume.tucker@collabora.com>, denys.f@collabora.com, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 3:27=E2=80=AFAM Shreeya Patel
<shreeya.patel@collabora.com> wrote:
>
> Hi Nick and Masahiro,
>
> On 23/05/23 01:22, Nick Desaulniers wrote:
> > On Mon, May 22, 2023 at 9:52=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> >> On Mon, May 22, 2023 at 12:09:34PM +0200, Ricardo Ca=C3=B1uelo wrote:
> >>> On vie, may 19 2023 at 08:57:24, Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
> >>>> It could be; if the link order was changed, it's possible that this
> >>>> target may be hitting something along the lines of:
> >>>> https://isocpp.org/wiki/faq/ctors#static-init-order i.e. the "static
> >>>> initialization order fiasco"
> >>>>
> >>>> I'm struggling to think of how this appears in C codebases, but I
> >>>> swear years ago I had a discussion with GKH (maybe?) about this. I
> >>>> think I was playing with converting Kbuild to use Ninja rather than
> >>>> Make; the resulting kernel image wouldn't boot because I had modifie=
d
> >>>> the order the object files were linked in.  If you were to randomly
> >>>> shuffle the object files in the kernel, I recall some hazard that ma=
y
> >>>> prevent boot.
> >>> I thought that was specifically a C++ problem? But then again, the
> >>> kernel docs explicitly say that the ordering of obj-y goals in kbuild=
 is
> >>> significant in some instances [1]:
> >> Yes, it matters, you can not change it.  If you do, systems will break=
.
> >> It is the only way we have of properly ordering our init calls within
> >> the same "level".
> > Ah, right it was the initcall ordering. Thanks for the reminder.
> >
> > (There's a joke in there similar to the use of regexes to solve a
> > problem resulting in two new problems; initcalls have levels for
> > ordering, but we still have (unexpressed) dependencies between calls
> > of the same level; brittle!).
> >
> > +Maksim, since that might be relevant info for the BOLT+Kernel work.
> >
> > Ricardo,
> > https://elinux.org/images/e/e8/2020_ELCE_initcalls_myjosserand.pdf
> > mentions that there's a kernel command line param `initcall_debug`.
> > Perhaps that can be used to see if
> > 5750121ae7382ebac8d47ce6d68012d6cd1d7926 somehow changed initcall
> > ordering, resulting in a config that cannot boot?
>
>
> Here are the links to Lava jobs ran with initcall_debug added to the
> kernel command line.
>
> 1. Where regression happens (5750121ae7382ebac8d47ce6d68012d6cd1d7926)
> https://lava.collabora.dev/scheduler/job/10417706
> <https://lava.collabora.dev/scheduler/job/10417706>
>
> 2. With a revert of the commit 5750121ae7382ebac8d47ce6d68012d6cd1d7926
> https://lava.collabora.dev/scheduler/job/10418012
> <https://lava.collabora.dev/scheduler/job/10418012>

Thanks!

Yeah, I can see a diff in the initcall ordering as a result of
commit 5750121ae738 ("kbuild: list sub-directories in ./Kbuild")

https://gist.github.com/nickdesaulniers/c09db256e42ad06b90842a4bb85cc0f4

Not just different orderings, but some initcalls seem unique to the
before vs. after, which is troubling. (example init_events and
init_fs_sysctls respectively)

That isn't conclusive evidence that changes to initcall ordering are
to blame, but I suspect confirming that precisely to be very very time
consuming.

Masahiro, what are your thoughts on reverting 5750121ae738? There are
conflicts in Kbuild and Makefile when reverting 5750121ae738 on
mainline.

>
>
> Thanks,
> Shreeya Patel
>


--=20
Thanks,
~Nick Desaulniers
