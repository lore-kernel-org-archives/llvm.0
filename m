Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67A72F27
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 01:01:30 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z1so897060qto.3
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 17:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JagqMAt85QEq7QG/F+4kNGpe+G2br22d2RC2rhBOnF4=;
        b=CtDJhAre6wbVCyp6Ck99vBgoZfbQxqvxD1vAHFQ2K2m89AomkhHPZEV8bcQHOwrJmh
         Ld8hSyr5YPDYM6/V3H96lEkfy7k1p7Vs2nZM1su/dHkxdsww3Q+SWsWM/PWendaCXkCE
         PSg91X1AStkrdpnKlYE/VYfHFCDwn5tkVxD9sv4L3udMbHacXqp9z3mca89OEqCbfhTq
         PjeLyEob4cyq5zZMWKTstnDZ9QqfMONkqXm9vHjMBL9v/hoTTuKBVerXrDSx4h6B6RMS
         4m2xe4SIlPg78t56A/8eCtdiwKNrb6I4JT3va2InIPcNO1sHhgLw42wnvqQ4tiZWGc78
         JgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JagqMAt85QEq7QG/F+4kNGpe+G2br22d2RC2rhBOnF4=;
        b=a6f3kGwTegrQFYhBFBgMOQ48ly1OmOgdVkFkLHkd35Br/5TPoU5SW9C0h3tWKxMILX
         29A2M2Xvr2K0UIa3defbrVCAwhWZudsI5mIu73F8B7YfKN/hu3d/BM4DNxb1Qkkt60xa
         kkWGCnzdNVL+af6XnmgfK3e6j3+49QUbdyscrx132A0ah+gAw2GETvVkSq/WJXUv8/I1
         l6x94O+2EdWakMb90UmeiYSt5r2jbJJV9Ote9/zrSLQ4SCdNX7Fqncmx4/nUGJDMbGPf
         DXpLMjk4SfEd4v9o9Ke/wmuLbH7W6SNzuBaX0Al34QKay9KsYX6uteyeJxwQ1cMR5PCK
         DwoA==
X-Gm-Message-State: AOAM530x6OHjGZWZOTr/khG4bz56T3fVN/MZpC8cLv6rNY/Fm9Ssqw1S
	1ujClzlRXuiekA7fZAv7Yyg=
X-Google-Smtp-Source: ABdhPJyaHUHRoJ/EkOknro4ewQtKipU56FxmHyAl2nWgInj0hR2lQMWqI7alLaEn8xYPIaQbX5IX5g==
X-Received: by 2002:a05:622a:130e:: with SMTP id v14mr25101910qtk.355.1643850089839;
        Wed, 02 Feb 2022 17:01:29 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
        by smtp.gmail.com with ESMTPSA id j13sm10149462qko.46.2022.02.02.17.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 17:01:29 -0800 (PST)
Date: Thu, 3 Feb 2022 09:01:23 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Changbin Du <changbin.du@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] kallsyms: ignore all local labels prefixed by '.L'
Message-ID: <20220203010123.yo3go6lq5t7hglor@mail.google.com>
References: <20220201013257.17926-1-changbin.du@gmail.com>
 <CAKwvOd=fCCjSfz6tW3514ifZOMw2PT4AZiFExq1qqG1rxf5fEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=fCCjSfz6tW3514ifZOMw2PT4AZiFExq1qqG1rxf5fEg@mail.gmail.com>

On Tue, Feb 01, 2022 at 11:42:59AM -0800, Nick Desaulniers wrote:
> On Mon, Jan 31, 2022 at 5:33 PM Changbin Du <changbin.du@gmail.com> wrote:
> 
> Make sure to mark the version of your patches (this is v2, IIUC). `git
> format-patch -v2 HEAD~`
>
Sure, I fogot to add version NO. this time. Thanks for your reminding.

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> >
> > The llvm compiler can generate lots of local labels ('.LBB', '.Ltmpxxx',
> > '.L__unnamed_xx', etc.). These symbols usually are useless for debugging.
> > And they might overlap with handwritten symbols.
> >
> > Before this change, a dumpstack shows a local symbol for epc:
> > [    0.040341][    T0] Hardware name: riscv-virtio,qemu (DT)
> > [    0.040376][    T0] epc : .LBB6_14+0x22/0x6a
> > [    0.040452][    T0]  ra : restore_all+0x12/0x6e
> >
> > The simple solution is that we can ignore all local labels prefixed by '.L'.
> > For handwritten symbols which need to be preserved should drop the '.L'
> > prefix.
> >
> > After this change, the C defined symbol is shown so we can locate the
> > problematical code immediately:
> > [    0.035795][    T0] Hardware name: riscv-virtio,qemu (DT)
> > [    0.036332][    T0] epc : trace_hardirqs_on+0x54/0x13c
> > [    0.036567][    T0]  ra : restore_all+0x12/0x6e
> >
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  scripts/kallsyms.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 54ad86d13784..8caabddf817c 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
> > @@ -108,7 +108,7 @@ static bool is_ignored_symbol(const char *name, char type)
> >         /* Symbol names that begin with the following are ignored.*/
> >         static const char * const ignored_prefixes[] = {
> >                 "$",                    /* local symbols for ARM, MIPS, etc. */
> > -               ".LASANPC",             /* s390 kasan local symbols */
> > +               ".L",                   /* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
> >                 "__crc_",               /* modversions */
> >                 "__efistub_",           /* arm64 EFI stub namespace */
> >                 "__kvm_nvhe_",          /* arm64 non-VHE KVM namespace */
> > --
> > 2.32.0
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers

-- 
Cheers,
Changbin Du
