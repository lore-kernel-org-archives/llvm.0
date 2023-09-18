Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A98111A1
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 09:21:12 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59be9a09c23so41944597b3.1
        for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 02:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695028871; x=1695633671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09gDVjymdIZkIvApNhwmLuiLyjh5wNd5lc0HirsSW3Y=;
        b=qLbkeFRHsyRL0qm9/n1EgNFwWaWsC2xoBQ82IgAZ5Rp1Nj7P2DEUf6khEYG8RktHke
         bOn+qZv6WGt1m/SSDvruAc23ZQrAb423G3L6kQcFJJx1aWngAXq4Zir0BfXYfWvjOHKR
         t/e5ye/v1vzDtXhh3/YvVSJEZ03kKAXAvDcbQHdFCpfdIZjGfqvVTr7frr1Iuq1NBg/x
         X6RwpHDlGtgea4vhhgZGwXZLXUz0zwlhSYuo6WiMhUYEVFyb2eslrtVELU8W7qBlwk8Q
         TGKILaCZx4FV5g939YOAQ/g/iZNtSLrA72xJSBMb9E7KF8Z34zRN+OBFSOmldxn/P00V
         XLrg==
X-Gm-Message-State: AOJu0YymkJU4UUI17ns0o3pY7cswNtr3Bw40nlA5z50l/CwbEnxReIgX
	QEWs7G5mnTBr6UPfkbZf68et9FVC4LtWCQ==
X-Google-Smtp-Source: AGHT+IHqT64BTQdOOhX/4L2+XjiDUOHHWssGFqOB49NWsgpD+tGJAKmX0bgpJLz4OqV6qeV92Ef1FQ==
X-Received: by 2002:a0d:eb14:0:b0:59c:a7f:ca7b with SMTP id u20-20020a0deb14000000b0059c0a7fca7bmr6939301ywe.51.1695028871381;
        Mon, 18 Sep 2023 02:21:11 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id l187-20020a0dc9c4000000b005773ca61111sm2423990ywd.42.2023.09.18.02.21.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 02:21:11 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59bdad64411so42756937b3.3
        for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 02:21:11 -0700 (PDT)
X-Received: by 2002:a81:7189:0:b0:592:4f93:e831 with SMTP id
 m131-20020a817189000000b005924f93e831mr8836883ywc.48.1695028870953; Mon, 18
 Sep 2023 02:21:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230814-void-drivers-soc-renesas-rmobile-sysc-v1-1-6648dfd854de@google.com>
 <CAMuHMdWiC4v9fctp18bRrEH-m_-0VjMg9+XpON8vdRYwniTU3g@mail.gmail.com>
In-Reply-To: <CAMuHMdWiC4v9fctp18bRrEH-m_-0VjMg9+XpON8vdRYwniTU3g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Sep 2023 11:20:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWk_jcZ1V7J68bw11YZ+EjEqAWOKHzanVyxo2zktbMteg@mail.gmail.com>
Message-ID: <CAMuHMdWk_jcZ1V7J68bw11YZ+EjEqAWOKHzanVyxo2zktbMteg@mail.gmail.com>
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

On Wed, Aug 30, 2023 at 10:24=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Aug 15, 2023 at 12:11=E2=80=AFAM Justin Stitt <justinstitt@google=
.com> wrote:
> > When building with clang 18 I see the following warning:
> > |      drivers/soc/renesas/rmobile-sysc.c:193:22: warning: cast to smal=
ler integer
> > |               type 'enum pd_types' from 'const void *' [-Wvoid-pointe=
r-to-enum-cast]
> > |        193 |                 add_special_pd(np, (enum pd_types)id->da=
ta);
> >
> > This is due to the fact that `id->data` is a void* and `enum pd_types`
> > has the size of an integer. This cast from pointer-width to int-width
> > causes truncation and possible data loss. Instead, cast to `uintptr_t`
> > which has the same width as void*.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
>
> scripts/checkpatch.pl:
>
>     WARNING: Reported-by: should be immediately followed by Closes:
> with a URL to the report
>
> Hence changing the Link: tag to a Closes: tag.
>
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Note: It should be noted that there is likely no data loss occurring in
> > this case since the enum only has a few fields. The narrowing cast from
> > pointer to int will not lose any data.
>
> Indeed, the theoretical narrowing could only happen on a 64-bit
> platform, while this driver is only used on arm32.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.7.

As the Generic PM Domain providers were moved to drivers/pmdomain/
in v6.6-rc2, and now have their own maintainer, I have moved this
commit from renesas-drivers-for-v6.7 to renesas-pmdomain-for-v6.7[1],
with s/soc/pmdomain/ in the oneline-summary.

Ulf: if you prefer, you can still take this patch directly.
Else I will send a PR after rc3 and/or rc5, like I do with my other
renesas-<foo>-for-<version> branches.
Thanks!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.g=
it/log/?h=3Drenesas-pmdomain-for-v6.7

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
