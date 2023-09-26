Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A7E63AD
	for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 11:22:50 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59f6441215dso59546567b3.2
        for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695727369; x=1696332169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSgW4LX4JUbEA5D+qEqJf6N354eXZcLyKCwAX5DR+2c=;
        b=NBbZaVk9yNOBzdacntXptgmph824f07muf+L3mG/gxvX9zH6CpZ3Pc2sCpR8xI7xcv
         ad+4g3quOzw1Y0YGMuubNe//hi4FhlWkCSUIAIIielhLCujUsDP7RVGRb2SxiVY0v04O
         6gEhL/Nw/vxXrniEpkM4yYq6fXHd5N4s+7MJ0wt5LokfaLjibU5lCL12zcL1Ew5kRadC
         k8EVggtEi8czMlLYjZO1iVG+yWgURjIv1Qvf1YuKsA9adBtXEucD0EiOHAlj4FGbdIZo
         /PI3Eu8rFcShPxiM9o6cvtiU57KYys0+lyqNYL3YOAgX3iYJ2rXCkOVdQ/lGYj1Pxz8Y
         NQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695727369; x=1696332169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSgW4LX4JUbEA5D+qEqJf6N354eXZcLyKCwAX5DR+2c=;
        b=VCOIgSVwy0A/lLz0222RX4zO18WI6J2rJWsSN8eJ/7NGS+F/4t50J1c/8QY8W7uilt
         iUdCc2zwoH41lDJ7IfemLvhaIs16AECNYMfD4y1biS5okQLqqeup4iLUC5JSoxTLZT7+
         teUNWNWpH44VD2Bu81iAN3r19bCVAOOhINA3KXkxt3GMqUB/5QBznlZOb6ipR8buuzbK
         dmU45yIWZbj8ls1hi415OvrjyX356WjJU2Wgg0rVnGauzDBWihwtlOkahbBhWBp3O/yu
         N8SeCs5g/KEgKw+WzNjwI2N9jYIaGOJGJTKGkAIKPl6I5tC402pdk903QV6EQ5fWzr28
         ZjhQ==
X-Gm-Message-State: AOJu0Yx03ywJZSWThWPWw7mF9qeQ4aQg95QPSe9bqnRb4gN8IN4YB5n+
	GdHdyb9lGbO1+F0dA4UijhHX8PaXfRdkdoG1oBDCCQ==
X-Google-Smtp-Source: AGHT+IF8+EP3qKO3+6vQiu7ilfzf8MAEdMbrx81nCcCeCherlXFPx5hr18Is6Hj+3VgIvZcu1mBSNS/hy/9TBb4Lssc=
X-Received: by 2002:a25:943:0:b0:d78:30b2:78f3 with SMTP id
 u3-20020a250943000000b00d7830b278f3mr8940351ybm.45.1695727369620; Tue, 26 Sep
 2023 04:22:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230814-void-drivers-soc-renesas-rmobile-sysc-v1-1-6648dfd854de@google.com>
 <CAMuHMdWiC4v9fctp18bRrEH-m_-0VjMg9+XpON8vdRYwniTU3g@mail.gmail.com> <CAMuHMdWk_jcZ1V7J68bw11YZ+EjEqAWOKHzanVyxo2zktbMteg@mail.gmail.com>
In-Reply-To: <CAMuHMdWk_jcZ1V7J68bw11YZ+EjEqAWOKHzanVyxo2zktbMteg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Sep 2023 13:22:13 +0200
Message-ID: <CAPDyKFqgsHYz1hfOQ=KniNJj+u7ZSMoxS03Rixj1n2AOUdSVaQ@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: fix -Wvoid-pointer-to-enum-cast
 warning
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Justin Stitt <justinstitt@google.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Sept 2023 at 11:21, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
>
> Hi Ulf,
>
> On Wed, Aug 30, 2023 at 10:24=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, Aug 15, 2023 at 12:11=E2=80=AFAM Justin Stitt <justinstitt@goog=
le.com> wrote:
> > > When building with clang 18 I see the following warning:
> > > |      drivers/soc/renesas/rmobile-sysc.c:193:22: warning: cast to sm=
aller integer
> > > |               type 'enum pd_types' from 'const void *' [-Wvoid-poin=
ter-to-enum-cast]
> > > |        193 |                 add_special_pd(np, (enum pd_types)id->=
data);
> > >
> > > This is due to the fact that `id->data` is a void* and `enum pd_types=
`
> > > has the size of an integer. This cast from pointer-width to int-width
> > > causes truncation and possible data loss. Instead, cast to `uintptr_t=
`
> > > which has the same width as void*.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> > > Reported-by: Nathan Chancellor <nathan@kernel.org>
> >
> > scripts/checkpatch.pl:
> >
> >     WARNING: Reported-by: should be immediately followed by Closes:
> > with a URL to the report
> >
> > Hence changing the Link: tag to a Closes: tag.
> >
> > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > ---
> > > Note: It should be noted that there is likely no data loss occurring =
in
> > > this case since the enum only has a few fields. The narrowing cast fr=
om
> > > pointer to int will not lose any data.
> >
> > Indeed, the theoretical narrowing could only happen on a 64-bit
> > platform, while this driver is only used on arm32.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v6.7.
>
> As the Generic PM Domain providers were moved to drivers/pmdomain/
> in v6.6-rc2, and now have their own maintainer, I have moved this
> commit from renesas-drivers-for-v6.7 to renesas-pmdomain-for-v6.7[1],
> with s/soc/pmdomain/ in the oneline-summary.
>
> Ulf: if you prefer, you can still take this patch directly.
> Else I will send a PR after rc3 and/or rc5, like I do with my other
> renesas-<foo>-for-<version> branches.
> Thanks!

Apologize for the delay, been traveling lately. Anyway, I can
certainly pick up the patch and carry it for v6.7. Just let me know,
if/when you have dropped the patch from your tree.

[...]

Kind regards
Uffe
