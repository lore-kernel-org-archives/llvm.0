Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD616ADB
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 23:22:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1a25ea73d3dso2095135ad.3
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 16:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680909767; x=1683501767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njPybTaOp1vfFxl9sNrZg/wsVvOfoZpdPujnFpOpMQA=;
        b=Vt5cGuMIp/txoyJYLtEZ9dC+RpJrsinP5mQDIKekwD6nvyST7tXyhGxLGL3Z/M4BHL
         YFf8GiX9Fh4tjiQtNiW6yw9042t0+qbszTDR7yNaw1In2q93zzBUeag2fN++T7f+2SSO
         mYiSVqW3ikHB9B21Lqi8J8xL7fext5RlMpNhrFwdmnzrn/Bg3Vk8cSLVkFC/HZw24r+S
         +Kujk+EHG8CGkKC5eNtr/tRJybBPG+Q4wOvR2BLQmEOYTaTos8m/pQs78tPFU4aKWSaB
         e9oGkOODEFlAIv7rPaMXnrblaHO5Qm6fS70uBtRfFtfbmnE5Wyk0GaGO95IRt8LeppyG
         mLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909767; x=1683501767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njPybTaOp1vfFxl9sNrZg/wsVvOfoZpdPujnFpOpMQA=;
        b=tf48vTXTLmgbWc7/p+7RbEiDRLoAMNVrpROjPGVHfeYj9q5ARrqIkvJeEnp+CV1yWa
         nt8tWc4N+qW+UlD2fZuBPz7v6o+kHUmcu1MIgFpgr6EruuL5X5X2MeD6/HKhkx2v0Szi
         G86DC0Gs3IL9XsMncOylgc22eV+5ycuFBUkhv7Pjy59wcmZvLbO2gdSTn2y/FNmWF7f/
         7DHxUfmE9f5wlYuP5+Up5I5QZzqSg7Ug6rggOeHVYdnsT8Jzwab2Yf1yEfZYpoytxcpx
         +lRWdtZQdh+DKPnr/TU98Yf7GglAEitKUNPnLDwHyZ8Hx5kuMbsDUQE35+tAfl5nJTO/
         DslQ==
X-Gm-Message-State: AAQBX9fUktaT4BJr87xwyscsrIcD15s88pCTQjHr/lk3sF4W1WuLvdXU
	IopgqO4RlgQNLojhdTx7Ea70Xz+W54GEqlRXJx9Elw==
X-Google-Smtp-Source: AKy350bTVYi1UIgGoXP+cqF81jwaO+c2w357t2GB7id9Pg6AAkRKqAVvHygDDMoVBsekCEUGRFhlgAYliVFtq4CaHB0=
X-Received: by 2002:a05:6a00:2e28:b0:625:c55f:bc66 with SMTP id
 fc40-20020a056a002e2800b00625c55fbc66mr1911037pfb.4.1680909767332; Fri, 07
 Apr 2023 16:22:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230321-kexec_clang16-v5-0-5563bf7c4173@chromium.org>
 <20230321-kexec_clang16-v5-2-5563bf7c4173@chromium.org> <20230330111523.4b98c8ce@gandalf.local.home>
 <20230330151826.GDZCWoQkQBj4BYbwWw@fat_crate.local> <20230330113127.3011e021@gandalf.local.home>
 <20230330160017.GEZCWyEXQVQZRBbYif@fat_crate.local>
In-Reply-To: <20230330160017.GEZCWyEXQVQZRBbYif@fat_crate.local>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 16:22:36 -0700
Message-ID: <CAKwvOdkULKxoifiVO4H4yomt1DHQxw0ntdO6QgMXk2BpM-urRg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] x86/purgatory: Add linker script
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Eric Biederman <ebiederm@xmission.com>, 
	Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ross Zwisler <zwisler@google.com>, 
	Simon Horman <horms@kernel.org>, "x86@kernel.org" <x86@kernel.org>, linux-toolchains@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,
Thanks for the patch!  Please make sure to cc our mailing list
<llvm@lists.linux.dev> for llvm specific issues.
scripts/get_maintainer.pl should recommend it, or you can find it from
clangbuiltlinux.github.io.  You can also ping me internally for
toolchain related issues.

Start of thread.
https://lore.kernel.org/lkml/20230321-kexec_clang16-v5-0-5563bf7c4173@chrom=
ium.org/

On Thu, Mar 30, 2023 at 9:00=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Mar 30, 2023 at 11:31:27AM -0400, Steven Rostedt wrote:
> > On Thu, 30 Mar 2023 17:18:26 +0200
> > Borislav Petkov <bp@alien8.de> wrote:
> >
> > > On Thu, Mar 30, 2023 at 11:15:23AM -0400, Steven Rostedt wrote:
> > > > > Make sure that the .text section is not divided in multiple overl=
apping
> > > > > sections. This is not supported by kexec_file.

Perhaps this is related to CrOS' use of AutoFDO creating .text.hot?
If so, it's probably more straightforward to straight up disable PGO
for kexec. See also:

commit bde971a83bbf ("KVM: arm64: nvhe: Fix build with profile optimization=
")

> > >
> > > And?
> > >
> > > What is the failure scenario? Why are you fixing it? Why do we care?
> > >
> > > This is way too laconic.
> > >
> >
> > Yeah, I think the change log in patch 1 needs to be in this patch too,
> > which gives better context.
>
> Just read it.
>
> Why did it work with clang version < 16?

I'll bet if we bisect llvm, we can spot what might have changed, which
may give us a clue on how to get the old behavior back; maybe without
the need for a linker script.

Ricardo, how did you verify that your fix was correct? Surely we can
check using command line utilities without needing a full blown kexec
setup? If you can share more info, I can bisect llvm quickly.  If it
requires profile data, you'll need to share it, since CrOS engineers
still have not posted public documentation on AutoFDO as I have
repeatedly asked for.

>
> + toolchains ML.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette



--=20
Thanks,
~Nick Desaulniers
