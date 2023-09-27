Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F394224FB
	for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 09:28:40 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a200028437so7787357b3.1
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 02:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695806919; x=1696411719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbZCD6ltUso31jdZjCWvFNyLqtiYopd8rfOZZMwIaq8=;
        b=vuX01HiAMInYpE+W7I6ZSy4gr5Uxw9aHsxYQN5fkWlHnJDCGz0rm8+wfiav+Wgoyxp
         Oo+YEwoMpyuIMpvyp2e2IOgOFzvLAgHT1BlJbR31I4GaTW6WhMXgJx99JiGmmDIFgTqp
         KQjyiQXv6DzCP7D929vnYte08PyC2O6Ut5OWuAy/1sttZnc1fIb7qmCKGNa8+SqQbg8N
         iv8k/kpk6jQ84ZPjbWeANiDRWkE++DCthPGJADh+L6r3Zq7jV+0cFUuwpULPCaS/mh+b
         F7B0iJf8I7Zk4u966u/o6Jq9xoLF2sVkNMhKYQif6ivqyzzPkbkfu4d74n09nrIEpzp2
         E8zw==
X-Gm-Message-State: AOJu0YxBOwG9SYbdF6R/jyq3iJo5FF4EMS30nPWeyg7JOrmqumHS4/xw
	2yVWDOjtgLFlL3UqJ+E0dDdHTVVso/LPGg==
X-Google-Smtp-Source: AGHT+IE8koYno+MuBgIyCxfp77aWzVlBNtnvXGhEZpCiqUvv1psCOeQYCUPgrHRImfGUeyj/AK6eeA==
X-Received: by 2002:a81:7c02:0:b0:5a0:ae01:803c with SMTP id x2-20020a817c02000000b005a0ae01803cmr1710259ywc.38.1695806919447;
        Wed, 27 Sep 2023 02:28:39 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id cp12-20020a05690c0e0c00b00582fae92aa7sm2118592ywb.93.2023.09.27.02.28.38
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 02:28:38 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59c26aa19b7so131878477b3.2
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 02:28:38 -0700 (PDT)
X-Received: by 2002:a81:4f0b:0:b0:59b:fb30:9862 with SMTP id
 d11-20020a814f0b000000b0059bfb309862mr1716025ywb.3.1695806917927; Wed, 27 Sep
 2023 02:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230814-void-drivers-soc-renesas-rmobile-sysc-v1-1-6648dfd854de@google.com>
 <CAMuHMdWiC4v9fctp18bRrEH-m_-0VjMg9+XpON8vdRYwniTU3g@mail.gmail.com>
 <CAMuHMdWk_jcZ1V7J68bw11YZ+EjEqAWOKHzanVyxo2zktbMteg@mail.gmail.com> <CAPDyKFqgsHYz1hfOQ=KniNJj+u7ZSMoxS03Rixj1n2AOUdSVaQ@mail.gmail.com>
In-Reply-To: <CAPDyKFqgsHYz1hfOQ=KniNJj+u7ZSMoxS03Rixj1n2AOUdSVaQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Sep 2023 11:28:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+ovx_Vbp1FQbvHESYrv3kHx5FvkjSb0V8dq857x5e9w@mail.gmail.com>
Message-ID: <CAMuHMdW+ovx_Vbp1FQbvHESYrv3kHx5FvkjSb0V8dq857x5e9w@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: fix -Wvoid-pointer-to-enum-cast
 warning
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Justin Stitt <justinstitt@google.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Tue, Sep 26, 2023 at 1:22=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
> On Mon, 18 Sept 2023 at 11:21, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Wed, Aug 30, 2023 at 10:24=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Tue, Aug 15, 2023 at 12:11=E2=80=AFAM Justin Stitt <justinstitt@go=
ogle.com> wrote:
> > > > When building with clang 18 I see the following warning:
> > > > |      drivers/soc/renesas/rmobile-sysc.c:193:22: warning: cast to =
smaller integer
> > > > |               type 'enum pd_types' from 'const void *' [-Wvoid-po=
inter-to-enum-cast]
> > > > |        193 |                 add_special_pd(np, (enum pd_types)id=
->data);
> > > >
> > > > This is due to the fact that `id->data` is a void* and `enum pd_typ=
es`
> > > > has the size of an integer. This cast from pointer-width to int-wid=
th
> > > > causes truncation and possible data loss. Instead, cast to `uintptr=
_t`
> > > > which has the same width as void*.
> > > >
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> > > > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > scripts/checkpatch.pl:
> > >
> > >     WARNING: Reported-by: should be immediately followed by Closes:
> > > with a URL to the report
> > >
> > > Hence changing the Link: tag to a Closes: tag.
> > >
> > > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > > ---
> > > > Note: It should be noted that there is likely no data loss occurrin=
g in
> > > > this case since the enum only has a few fields. The narrowing cast =
from
> > > > pointer to int will not lose any data.
> > >
> > > Indeed, the theoretical narrowing could only happen on a 64-bit
> > > platform, while this driver is only used on arm32.
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > i.e. will queue in renesas-devel for v6.7.
> >
> > As the Generic PM Domain providers were moved to drivers/pmdomain/
> > in v6.6-rc2, and now have their own maintainer, I have moved this
> > commit from renesas-drivers-for-v6.7 to renesas-pmdomain-for-v6.7[1],
> > with s/soc/pmdomain/ in the oneline-summary.
> >
> > Ulf: if you prefer, you can still take this patch directly.
> > Else I will send a PR after rc3 and/or rc5, like I do with my other
> > renesas-<foo>-for-<version> branches.
> > Thanks!
>
> Apologize for the delay, been traveling lately. Anyway, I can
> certainly pick up the patch and carry it for v6.7. Just let me know,
> if/when you have dropped the patch from your tree.

Thanks, dropped.

P.S. And now I notice it was never part of linux-next, due to an
     oversight in my scripting. Fixed that, too ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
