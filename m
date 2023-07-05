Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81DFD528
	for <llvm@lists.linux.dev>; Wed,  5 Jul 2023 15:17:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fbca6a9ae4so384975e9.0
        for <llvm@lists.linux.dev>; Wed, 05 Jul 2023 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688570233; x=1691162233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFLkuuEr2OZJi8rYluDn15EpBTEmNyobXaduOGi0kXQ=;
        b=LJfXLxXfwx4Z0qyE+pqszPsaFmvHtDisTPTLK35KDWxfNKelSoU/3SaCTvSnm1wgei
         HbSHtjPNaZG+yRE8p6PqhMZljuh6vB/A10Sjr7p8btuEyyigAYWhFkaS2lYnpR5FATWY
         NBbkTFbaQke5UyVXjG7syrLOyEq+IFQqf0uiaNwTykpDLTHJVKpt2LpuqFw9CQYesOhw
         AFG0FRcIGZfNznsUo/PNPT38NUsvRERgFsyADQnIvyFfklVGm+CYtJoOkDOzThxOum24
         pAphuXv+QaRboqsq6TaPGMmg2kVOxqApf59N7AQHYJ0IAwRMrkmv666Nv7v0E6EYO361
         aPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688570233; x=1691162233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFLkuuEr2OZJi8rYluDn15EpBTEmNyobXaduOGi0kXQ=;
        b=OfCvjMzoqBFr9HHjpCniRVXDoHoF4Ih1jAEwV5psaXTTt9IGmyNgeXGb+cSH2SwjWk
         mExKXyqezZs/snWR+dDwHeLXuPKUgVvty9WpeAtqSQQsxt03vhqtOp2TvzUdn/KCMKGd
         n8TQAJPIuvrM+yO5/SMKmqLe4V5wwXs6yGKXIfn0rIRqZbEy5+HQQZDOaN+g84z40dF+
         In5iusG+daLsBKLvKofWGhrTnTn7zw7UhDbTqJ2yZmtTPnwbmNvvMquyyJuhokjoMVjb
         MDV5RKnuNK0K+h4XnABoEmLTNUSyf77lvmSTEVm/PeUo/Jko0pntmmf/Of2KPvoBcrGa
         pDTQ==
X-Gm-Message-State: ABy/qLaYU04j32AWCAwcONCM6U7DNZiISCDKd7zxeNdhrF0NVW5xIo4H
	Ybu8bTgMM8ELzPJuMLYqp+AAXK0OTMyaS+lVeiz3vw==
X-Google-Smtp-Source: APBJJlGOHzKXkHmH3FDkDtm97ajpy0zCJXRSQGGFcpRU/Oj6XGaucQ3gaa8KLZm2F8gbHDk6PstuzR9Q0lBQGp06mnc=
X-Received: by 2002:a05:600c:5119:b0:3f4:2736:b5eb with SMTP id
 o25-20020a05600c511900b003f42736b5ebmr83931wms.1.1688570232970; Wed, 05 Jul
 2023 08:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me> <202307022018.B26F5795@keescook>
 <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net> <4fa56264-f188-46f9-cc77-117b469b3328@roeck-us.net>
 <2b1a4f49-ba18-0246-af09-4e4133814411@alu.unizg.hr> <202307022230.6121D6896@keescook>
 <ed3e4315-b149-2f9e-70d4-45d7f83b9922@alu.unizg.hr> <202307031149.823F9A3@keescook>
 <202307031606.3FD9D0D@keescook> <fbf4103b-6471-1f06-34a8-4aa227f5e091@alu.unizg.hr>
 <3CDD1188-7B2A-4D53-9B8F-C07BC39844E9@kernel.org> <19d0e63c-db47-8f02-2f79-0923f675898c@alu.unizg.hr>
 <DA3FEB08-DF39-406B-89CC-9076CFCF597A@kernel.org>
In-Reply-To: <DA3FEB08-DF39-406B-89CC-9076CFCF597A@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Wed, 5 Jul 2023 17:16:36 +0200
Message-ID: <CAG48ez0kmSqS_WJ1=neKpxKmMMkPYgNHfBD6ZSif_EWnso84wQ@mail.gmail.com>
Subject: CONFIG_UBSAN_TRAP #UD error message on x86 [was: Re:
 [CRASH][BISECTED] 6.4.1 crash in boot]
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LLVM <llvm@lists.linux.dev>, 
	"the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 4:10=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On July 4, 2023 4:15:20 PM PDT, Mirsad Todorovac <mirsad.todorovac@alu.un=
izg.hr> wrote:
> >On 7/4/23 23:36, Kees Cook wrote:
> >> On July 4, 2023 10:20:11 AM PDT, Mirsad Todorovac <mirsad.todorovac@al=
u.unizg.hr> wrote:
> >>> all Wayland and X11.org GUI applications fail to start, with errors l=
ike this one:
> >>>
> >>> Jul  4 19:09:07 defiant kernel: [   40.529719] invalid opcode: 0000 [=
#1] PREEMPT SMP NOPTI
> >>
> >> Hmm, is CONFIG_UBSAN_TRAP set?
> >
> >marvin@defiant:~/linux/kernel/linux_torvalds$ grep CONFIG_UBSAN_TRAP .co=
nfig
> >CONFIG_UBSAN_TRAP=3Dy
>
> Ah-ha! Turn that off please. With it off you will get much more useful re=
ports from USBAN.

It might be useful if the x86 code under handle_invalid_op() at least
printed a warning about this when the kernel crashes with #UD on a
system with CONFIG_UBSAN_TRAP=3Dy? It seems pretty unintuitive and
unhelpful that the kernel just crashes itself with a #UD and no
further information in this configuration.

Even just a "WARNING: CONFIG_UBSAN_TRAP active, #UD might be caused by
that" on every #UD that does not come from a known BUG() location or
such might be better than nothing...

And maybe the Kconfig help text could be clearer on this, too.
Currently it does say that this turns warnings into "full exceptions
that abort the running kernel code" but it does not say that the
exception reporting will become pretty unhelpful, so it's probably not
really what you'd want for debugging.
