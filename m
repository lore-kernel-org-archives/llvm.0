Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC22560
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 15:57:45 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id f38so33774481ybi.3
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 08:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5UMIziwn3GcEpZ2EHO6PLtQUiahYmzZMqohaqW8D0IA=;
        b=CLWWubnQvAPS+4V6c7U8GSYXKfNujQSFclo6yDNz86s6EuCQ4SqShY+O71+/+V231S
         4ZHZFi2nEpq4H3OmX6AIQUMkPXIKFv8gq3WgcC6tA4nVDI5bW//PiUwcRqdnz06DhXfT
         EW/rps7lCbbrmP+PV4nAqUDGXKnjex0AxR0izO3wak5Q9WZCsJsxe8pkhFUOspfmjQty
         LyOHHUy+s5uA2PrxTb8a/ajTJ4kBQFRl4a/BHmQfyDmMchGsh9m05NhZX4wEnxy1NU0+
         d355TOiVawYH0EookANAKnRdg/pJ2kROlj7V0HU7qCZkluP6G3J3aXz0VVCadTA55h3Q
         OBsw==
X-Gm-Message-State: AOAM531aQZ2kn1ozKYKodH0vAYxmkJKGUI9uer82RFgvgaNAZhl5KhNc
	vZ83Ly3pAiYU+dm7RdFKX7T8EMIrPgqhDw/yCNk=
X-Google-Smtp-Source: ABdhPJxUaYxafCpZusev8ZL1gpQ6NzaKd7sZu4xO9qFeyZLl82Jn/WlTJdeHg/oFQ7v/wA5nSL29dF8pnpK+e/vn1Og=
X-Received: by 2002:a25:9f8a:0:b0:628:b9f3:6d2f with SMTP id
 u10-20020a259f8a000000b00628b9f36d2fmr21206839ybq.151.1650988664926; Tue, 26
 Apr 2022 08:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422151725.1336997-1-mailhol.vincent@wanadoo.fr>
 <YmXMiTXEvFXZ/swU@dev-arch.thelio-3990X> <CAMZ6Rq+3XOze01dZZRTe+V44N2uo5J_=rtd9bKH7d7Fq9sNxVw@mail.gmail.com>
 <CAK8P3a31WAyh_vLqNwvv2GMcZ8SQp7gC=OV8c=Nc9pBtOSR8-g@mail.gmail.com>
 <CAMZ6RqL8G4uVn--Y5pBC+_c9Ex3Sjf8OJuVRwkVFFPwWd_ezLQ@mail.gmail.com> <CAK8P3a1_XoyjOPQ0ghku_QUjUL5V6BK9kSNUXoQj2RYaA=JxFg@mail.gmail.com>
In-Reply-To: <CAK8P3a1_XoyjOPQ0ghku_QUjUL5V6BK9kSNUXoQj2RYaA=JxFg@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Wed, 27 Apr 2022 00:57:33 +0900
Message-ID: <CAMZ6RqKxog4xS+E_HLQ1jE_s7oK8XfpT++8go6GZ0qS-utOejQ@mail.gmail.com>
Subject: Re: [PATCH] checksyscalls: ignore -Wunused-macros
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon. 25 Apr 2022 at 17:49, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Apr 25, 2022 at 9:42 AM Vincent MAILHOL
> <mailhol.vincent@wanadoo.fr> wrote:
> > On Mon. 25 Apr 2022 at 15:50, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Mon, Apr 25, 2022 at 8:17 AM Vincent MAILHOL> <mailhol.vincent@wan=
adoo.fr> wrote:
> > > > When I run W=3D2, I want to only see the warnings of the file I am
> > > > working on. So I find it useful to fix the W=3D2 warnings which
> > > > show up when building other files to not get spammed by
> > > > irrelevant issues and to simplify the triage.
> > > >
> > > > My initial message lacked the rationale. I will add additional
> > > > explanations in the v2 of this patch.
> > >
> > > I agree this is worth fixing if we want to make W=3D2 have any meanin=
g at all.
> > >
> > > Your approach is probably fine. We could try to improve this by compa=
ring
> > > against the list from include/uapi/asm-generic/unistd.h instead of th=
e i386
> > > list. I suppose that would involve rewriting the script into a simple=
r one,
> > > but I'm not sure if anyone has an interest in working on this.
> >
> > If someone wants to do it, great, but I do not have the
> > confidence to do it myself so I hope you will forgive me for
> > taking a pass here.
>
> Sure, no worries.
>
> > Another alternative I considered was to only call
> > checksyscalls.sh when doing a 'make all'. This way, we keep the
> > warning but people won=E2=80=99t be spammed when building sub projects
> > because the script would not be executed.
>
> Right, I like that as well, one less thing to be done for every
> iterative make as well. The syscall table really doesn't change
> all that much that this needs to be run by most developers.

I send a patch in a new thread to only call the script once:
https://lore.kernel.org/lkml/20220426155229.436681-1-mailhol.vincent@wanado=
o.fr/T/#u

If this new patch gets rejected, then I will go back to the
-Wno-unused-macros approach.


Yours sincerely,
Vincent Mailhol
