Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC51EA92
	for <llvm@lists.linux.dev>; Thu, 18 May 2023 21:12:42 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-759413d99afso7058085a.1
        for <llvm@lists.linux.dev>; Thu, 18 May 2023 14:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684444361; x=1687036361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeXIFJ3JEeo/UPihwwJMMq/gen8h1/yR0LlFojypqtg=;
        b=IJQZIBPwBAV7RFU4Ro9T5xQElAOPO5EnWbRgrNsDte1JajluVqxlXwUIF5q9uj6oD8
         PKQ/DeL0Y14TIyXTmDT5xa1Kq0hSI1fn3Rg4NvaXXeVMioWUifcpwGkYtLJG+ouJ0q7l
         qTpFaTO0RehaI6TrIw1tKXAkqMagq6UpfQTwFyS3jDx3jfDNgEiVl1jzOAjnGYAGNeSO
         UKKk1+4+7Gb7mOMo+GBBa8WE+9PgW1nqRxnlObrzoFJJmXgX6IyeAJc1KqVEk+6KYIy+
         u65LCzHT7BdgtGNSuHtNsdaIOhvyCihefbo4XTH0czp2xQ3KwCSMOGpUp3010By6nqPI
         E1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684444361; x=1687036361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeXIFJ3JEeo/UPihwwJMMq/gen8h1/yR0LlFojypqtg=;
        b=Xgkzx3ZEi9fCT+EHbSUE7jVupgbieik5Bs3NHQJYdRtUT+MS6rNhHTV/lNIRwB5HYs
         P5czzZp1TJbCc8eNUBFjz1UOHy40VnnQArlT1sF9dOjaQzoMRJJA27BzGE8CoUMgmXSd
         V4ATjut49IksCQD0YSIpMnz+Urs65Go1HkZ023IHOEtFLjyidHcLfR8IdtTc1wrhkZBg
         ObtQ2JRXN4acM5+ZBiAIJ7/SQxiHmQtgimoi/B5WFk+QqWfpWXzhcKOwq5I9/SO7Qm04
         FElJR/eI1fA32EWmg24pZYUD6wMs2sFdcna2g8HaQ/l3tVYkAFVJgHUPjv8pcZAHQHCL
         Ua3w==
X-Gm-Message-State: AC+VfDwCfxsRgcLzNXFy+LIlNJiP1FbvsaaGuou5qjC/Njvv+fkRgfSW
	L3KLJ0SrpZkLAcm6RTc1Hou2s1GlplXrMLDwkHPoBQ==
X-Google-Smtp-Source: ACHHUZ5LjYwzBsYuczoDOiaXn4kG1nFtTCA3gNWtNx+RzZCZXNhFkKqRffrv7ErE6ma+ueKe6zxkZMCnIAe5pMpWLFM=
X-Received: by 2002:a05:6214:29ee:b0:5ea:9fc5:fcb1 with SMTP id
 jv14-20020a05621429ee00b005ea9fc5fcb1mr2236810qvb.9.1684444361498; Thu, 18
 May 2023 14:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
 <20220919170828.3718437-1-ndesaulniers@google.com> <597ef55f-e7c1-ab60-b4aa-0071ff4b5e0e@collabora.com>
 <CAKwvOdmSrAxx-YY1Na3BSdYuxXCPKK+F0K5V6i+adTn_bVJEsw@mail.gmail.com>
 <89961dfc-d40f-78e4-5d34-b86b7d152182@collabora.com> <CAKwvOd=4hBcU4fAkddU0b-GOZc9FzTZoj3PFW6ZZrX0jS8x+bg@mail.gmail.com>
 <17c91d37-7d9c-0df4-2438-2b30ca0b5777@collabora.com> <CAKwvOdk4QO8x_bs64fFRCsMu__AjhXd4Ew2KfgzQOb9Q3FMqSA@mail.gmail.com>
 <b5d0cf82-0e42-f6a1-c9f5-c145fdc4c622@collabora.com> <CAKwvOdkFxu9hYSL_RCXadpR0dQd1+dZmAUVXdfFiLUfxg4D_Xw@mail.gmail.com>
 <878rdlk9bi.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
In-Reply-To: <878rdlk9bi.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 18 May 2023 14:12:30 -0700
Message-ID: <CAKwvOd=8LVU+iANkFx18Wm1jg7gYiAXovAmo9t5ZZaVdMULn-Q@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, Michal Marek <michal.lkml@markovi.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev, 
	"gustavo.padovan@collabora.com" <gustavo.padovan@collabora.com>, 
	Guillaume Charles Tucker <guillaume.tucker@collabora.com>, denys.f@collabora.com, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 7:23=E2=80=AFAM Ricardo Ca=C3=B1uelo
<ricardo.canuelo@collabora.com> wrote:
>
>
> Hi Nick,
>
> On mi=C3=A9, may 17 2023 at 09:27:41, Nick Desaulniers <ndesaulniers@goog=
le.com> wrote:
> > Shreeya mentioned upthread that `qemu_arm-virt-gicv3-uefi` was
> > failing, so I assume others should be able to repro in qemu. I'd guess
> > that LAVA lets you have VMs adjacent to physical hardware.  Having the
> > qemu command line, kernel config, and perhaps the initramfs are going
> > to be the three most useful things for any similar bug report.
>
> Sure, I'm using LAVA because that's the safest way to match exactly the
> same setup from the original test, but anyone can try to reproduce it on
> their own. You can get the job info and setup from any of the related
> LAVA jobs. This one for example:
> https://lava.collabora.dev/scheduler/job/10373216
>
> Trying to reproduce this type of setups is not as straightforward as
> we'd like, specially for people not familiar with KernelCI, but we're
> putting in some effort to improve that so that anyone can pick up a
> regression report and work on it right away.

Yeah makes sense.  Having reports surface the most relevant info for
developers to understand what went wrong where and how to reproduce is
something I'm passionate about.  We've been through this with Intel
0day bot folks; it takes a few iterations until everyone is happy.

>
> By the way, I found a breaking point in the commit right after the one
> that the bisector reported:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D5750121ae7382ebac8d47ce6d68012d6cd1d7926

That's a higher risk change (and has my name on the tested-by tag, yikes).

So is that the culprit of the boot failure you're observing?

> but I can't find anything there either that makes the boot hang,
> specifically for configs including kernel/configs/debug.config. I
> wouldn't rule out a problem with the qemu configuration.
>
> Anyway, this is not a critical problem in any way, although it'd be

But you still have a boot failure/regression to track down for that
config, right?

> interesting to find the cause in case we can use the findings to improve
> the test setups.
>
> Cheers,
> Ricardo



--=20
Thanks,
~Nick Desaulniers
