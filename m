Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6A310971
	for <llvm@lists.linux.dev>; Wed,  6 Sep 2023 18:27:57 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-40a47e8e38dso40471cf.1
        for <llvm@lists.linux.dev>; Wed, 06 Sep 2023 11:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694024876; x=1694629676; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrGg9NVcpdceTuuEZVHwG7gAd6aReinJXpTg+Gi7ctg=;
        b=G4pePGaNYLfM365ukF7W5kmZ2HGQ2bCILAcRA/AzwM1GY6d8GpSksbRvj+HyOfLlJa
         0ZZdHLqhIMDzZTFzmfvBfnC4f3FD627TRGeQWGzEErPgLhJefaxUEP4yahicufthsops
         2svnLwPD6ibUYOnBRCEdshvsfnLWO7LyNY0o5viEAZT4yLrdWIQafGIRJo+z+YT49Jay
         wfD5EWGvvz5xFGKWVuctBdBI+DMRZNgABN5wrKKaiCEZDuIa/55RlNec0KHjXcqfncbt
         4ojJjq0LLfebWsyRMLTrWWyGh9ew4OqMzwOpHoHY3Uh9jatDjPDJKTSR82OZH4qRKJcj
         K44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694024876; x=1694629676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrGg9NVcpdceTuuEZVHwG7gAd6aReinJXpTg+Gi7ctg=;
        b=blWS1vL6ILKn/eBkLxPLJxUbePfycWM7kfIHHxWLL0wLGfiuHN2aVIpj7028bKLzv2
         RxXgmb+hr1CRtmZDfPzzOa4iBQfdblKoQHCkyL1BPUC9TdXfxuzV4UuJMhRgtzcIfyNJ
         Iqpa7Te2Uie6kWmvR0aHSXSkCbC9fl83HBk6XL/gExivDmPCaP9ENnQeXIjGR6hTF+vi
         uLo+CMbdJvqlPYKy/+yZDGzuxSoY+eN7E9jUReZk5DASqzC0AiKyy/nUVX5/RdY/QgGX
         MCu/twcLuUrWeTua4zfr2ll3m95gwxCkqIE5ZFocvPDyYxSaIwwlYpQjHHM4lBvh7uXk
         9cUw==
X-Gm-Message-State: AOJu0Yx3GlzI2aNPQ8/omhReskC4rQuSjSUDrkJpNwkKTEcdlAyRHmLA
	6Hq4ahPJwkKqponVSkPhC5jARKjHcMpcvLPDtAn4kw==
X-Google-Smtp-Source: AGHT+IGfhsqbbGDD5lwj9bjClvIiOtUBeYARpoOKPx35Vis2UUsegJQmDLBEycqg/MKRy/f3hzjjEdT6fkYJQlZShf8=
X-Received: by 2002:a05:622a:4407:b0:403:f5b8:2bd2 with SMTP id
 ka7-20020a05622a440700b00403f5b82bd2mr13558qtb.9.1694024876090; Wed, 06 Sep
 2023 11:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230906175215.2236033-1-song@kernel.org> <202309061102.DB794AD295@keescook>
 <34CC4A68-CE36-4DE5-B1A1-AB7FD075C0EB@fb.com>
In-Reply-To: <34CC4A68-CE36-4DE5-B1A1-AB7FD075C0EB@fb.com>
From: Fangrui Song <maskray@google.com>
Date: Wed, 6 Sep 2023 11:27:44 -0700
Message-ID: <CAFP8O3+Rrs7rs5nO3cQbpeayE2vQXTmaaaEfY_weyCGCuBYrFQ@mail.gmail.com>
Subject: Re: [PATCH] x86/vmlinux: Fix linker fill bytes for ld.lld
To: Song Liu <songliubraving@meta.com>
Cc: Kees Cook <keescook@chromium.org>, Song Liu <song@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Kernel Team <kernel-team@meta.com>, 
	"x86@kernel.org" <x86@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 11:16=E2=80=AFAM Song Liu <songliubraving@meta.com> =
wrote:
>
>
>
> > On Sep 6, 2023, at 11:06 AM, Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, Sep 06, 2023 at 10:52:15AM -0700, Song Liu wrote:
> >> With ":text =3D0xcccc", ld.lld fills unused text area with 0xcccc0000.
> >> Example objdump -D output:
> >>
> >> ffffffff82b04203:       00 00                   add    %al,(%rax)
> >> ffffffff82b04205:       cc                      int3
> >> ffffffff82b04206:       cc                      int3
> >> ffffffff82b04207:       00 00                   add    %al,(%rax)
> >> ffffffff82b04209:       cc                      int3
> >> ffffffff82b0420a:       cc                      int3
> >>
> >> Replace it with ":text =3D0xcccccccc", so we get the following instead=
:
> >>
> >> ffffffff82b04203:       cc                      int3
> >> ffffffff82b04204:       cc                      int3
> >> ffffffff82b04205:       cc                      int3
> >> ffffffff82b04206:       cc                      int3
> >> ffffffff82b04207:       cc                      int3
> >> ffffffff82b04208:       cc                      int3
> >>
> >> gcc/ld doesn't seem to have the same issue. The generated code stays t=
he
> >> same for gcc/ld.
> >>
> >> Cc: Kees Cook <keescook@chromium.org>
> >> Cc: x86@kernel.org
> >> Signed-off-by: Song Liu <song@kernel.org>
> >
> > Ah! Thanks for the catch... I wonder if ld.lld should be fixed too? My
> > understanding was that ":text =3D...." was defined as being explicitly
> > u16?
>
> Per my experiment, gcc/ld gives same output for :text =3D0xcc, :text =3D0=
xcccc,
> and :text =3D0xcccccccc; while ld.lld handles :text =3D as u32, so :text =
=3D0xcc
> with ld.lld gives:
>
> ffffffff82b042a1:       00 cc                   add    %cl,%ah
> ffffffff82b042a3:       00 00                   add    %al,(%rax)
> ffffffff82b042a5:       00 cc                   add    %cl,%ah
> ffffffff82b042a7:       00 00                   add    %al,(%rax)
> ffffffff82b042a9:       00 cc                   add    %cl,%ah
> ffffffff82b042ab:       00 00                   add    %al,(%rax)
>
> I am not sure what the right behavior is per specification.
>
> Thanks,
> Song

AFAIK GNU ld's behavior is not documented here
https://sourceware.org/binutils/docs/ld/Output-Section-Fill.html

The Output Section Fill syntax allows an expression. It seems that if
you use =3D0xcc+0, GNU ld will use a 4-byte filler as well, similar to
gold and ld.lld.

Frankly, I feel that GNU ld behavior should not be relied upon. lld's
comment states that it is a deliberate choice to follow gold instead
of GNU ld here.

I'll elaborate a bit and add this discrepancy to my
https://maskray.me/blog/2020-12-19-lld-and-gnu-linker-incompatibilities
:)



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
