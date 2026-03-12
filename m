Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFB63FE668
	for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337840; cv=pass; b=mBGFWPHeA/1nKD1cFoyl7k5omvrH+VN6A0IFWv6h427uw9HiPq2pBHD1Sv8Qe7HmHQAcKNszu9kZJxm3UxbU8iKcy/v49mHnZiFb80pgYRcI0OF+Tkz6jO6bZsyUXG+mLw7Scxk9X/+IkJ22WQCe/y1XpC/4vartNi6+lpyo1tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337840; c=relaxed/simple;
	bh=x6kgdD93fKurL4koxKbMcGJDp9CJO+5zYkbp7D++8lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHo2Nr+Vm5flEn/VlkRtjw3LiZHOC8ek19Bh2ZturJz+D4EdxHe3uFwQcfWx89qiodVOMz1asHhIDeKB6F0tztNoA7OXidCo2nvro9bbELBPNiNkavjP0YEZKp3BEByZX5rLmO07dndD0JrslcLGxDs9PEYpVchoaBhFy6sw//Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dk+mXukm; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dk+mXukm"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-509069a7a7fso55451cf.0
        for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 10:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773337838; cv=none;
        d=google.com; s=arc-20240605;
        b=N+d4ifY4wa5mkj9PdiwaHzkyHi7sscl4wlb7xAleDTTYcXxPdrTsqSyqVaYxHKzhkr
         0LJaR5ocT8fhdPqrPrfc63gYyXYWRlVOx5mb3SPTnzfs+mUgFzDHyWyHEhYj8Myqjlez
         Gk7rTtHKto11RINHlmBO07tDDp+DHYEZKCU9EteLW3PtjW0uGp3dHCCt1b3l9fYkck1n
         G0/OqUrJhD9wN+TFD385G0chzNYI0MKCchARzX3JyxyjtPdht9MFGegUQ6Xtq9GdMPB3
         cTjUpFyPEL/CL4Je8QOnJ5Ek3qWf8D62lr+HQrnF0FQ+hCpDt4O3mXDhckmjOBrwjQTh
         IZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=riDQaNuNe85Wp65XhJ0B6gmgQZh+tG/0ah/0LfZv0x4=;
        fh=Oc3ljDrFAVSkcnaFBYHmAk3q+BYPylnuhPJ4tX0L498=;
        b=AHSl1QMNnnfs2ZqaCaifRK5rrrAorChZ8EcGtl5PyY6YPkuCwerUvGVX9GceGrGmnC
         G/4rfYpGKi49KKJqy/uQGCARLQ2lvl9yya58tnS2jt8sXbROGMbXuc5EPpfkILawVGxQ
         rVCGp1jG3aewIfNCfV5LBUrAgDOgUDo2xedkAbRm6w+Mw6XOuvQpinwOWpXiisUdzR5v
         TkUdMDFbDydhNhjD20PIUANnQwuU9mgmE8X3LARnQOiJRzlBIlm+dtMDqcvDbqXFye3K
         OUvcI3lHZLJfhKCovUD7l9JFexR7dL+h+qHhrnH3xrntmWKIzH6rkXxRelIAuIpaODS5
         tL/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773337838; x=1773942638; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riDQaNuNe85Wp65XhJ0B6gmgQZh+tG/0ah/0LfZv0x4=;
        b=dk+mXukmehsM/N1g4TAFB+xOKIatCkcM0b6oUnAOxWudrbyWuXgNfclzQfssvUssxZ
         MinFFdLXBPaoTAkOkmJBUSZtE3RSaVDXHvWLhZ3X+s/LlFVLT8cZ9M0weHXR0iwujYU4
         eWWEf4gwcMz6LWm2DNa9Z28Ws5F95EvUDCYGY8c2CgFLNyJh5yj8pP77YWzZG3ZCLNcR
         +yJClqZhX4jHOIdg6nVDsywK/sQqtMpHHLfQjT1M1zA+jTS8aQMwwufTH4glbeK1uaXR
         q3Jc2g81PlaVoaQBXVBy7V1o9EwCDNJm51t8YM33wCCzcxJYMPbrPX8PtiB81ascDnIt
         4a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773337838; x=1773942638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=riDQaNuNe85Wp65XhJ0B6gmgQZh+tG/0ah/0LfZv0x4=;
        b=HoCOgCXqSPJcOPeoVLAlAATeH16idhSArGOUlJSLCKkn9z/VPXaCWcLsU6LwdqBonH
         UvkzPHPORO42RZh59kSTx9ayQnNIdURtA60OByjEi7QolVSH+8dzfCy5Cu+BMOO6cGp8
         LS7xvEO0sne1zPosm0udGbKhKQ8fca++x/0j8odBe8HwOTMQxFt5G4DsPCNqNHdhEOoI
         jxSJoZOSRPSgLzkQMLgJYySe91caNYFa+ixZNUHD2plIGM63BPgneX4hmtcsTasFx1M6
         h1qs1lQlBcjn0JQmYCA0RTzb47yyVBvBLRa3OPTLEtRiA6aPSp4QLzHJ6OnmP0q58jWo
         hiYA==
X-Forwarded-Encrypted: i=1; AJvYcCVhxarkoMwu3pfTDP25MYdS02AuKcsa0+3IWLWpf7vImpZ1/LEn5X9px4LtjXkTJD0SQscF@lists.linux.dev
X-Gm-Message-State: AOJu0YzUzTbLY6KEVlpC5ZttzbYxqYJbmE5a9tAvVN3Aqy4LJHDFr+mM
	2sPmS5bUADZfPu/ZWHE9kJwRV83OUe536x7bDmIPHdfE6xIIXrBphTFFHToVLowItRQ59/p5hF7
	6ks9aQcC5/ioKyYgigGZz/24Kwq7kJpWGTQquRLmK
X-Gm-Gg: ATEYQzwOTCEynkWMyS3xxjKbw3jMI/bzJgxvqzKqy521TjHXbF1+fJk09bc7f1jihV+
	f7rOckGQQ4iS7wfp8UDK0tbqFVjLujSCy3q5/TdMa2lgnyMFaqwxmYfxpxIjtSXxOJ4tQy6TNlN
	50ruDifSYhcdolQhzZiXBnMeKuzwPXFS2XwQ4EQfkCGxgxyMkjD6IhLDG2R6PNqe7FsGnpYBpKA
	ncG8zQ5uDxGNLU6D8+d8RfMoQ3kSO9hNL43tpMZSw4jI9hpr3R39p1HrpkYaBPdFsJ0iCv1gOYy
	uXEf6YtumDlzWCz/Xqki3Sdn3JFmdq5ql6llAPLuDcZrjHA=
X-Received: by 2002:ac8:5f8d:0:b0:507:35b2:6b9 with SMTP id
 d75a77b69052e-5095857222dmr700391cf.7.1773337837279; Thu, 12 Mar 2026
 10:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20260312082502.GA790897@ax162>
 <abKnZrHleb-XKR_a@derry.ads.avm.de>
In-Reply-To: <abKnZrHleb-XKR_a@derry.ads.avm.de>
From: Rong Xu <xur@google.com>
Date: Thu, 12 Mar 2026 10:50:25 -0700
X-Gm-Features: AaiRm50m3O3vpQMoqcp7iYaekhPo8jFsDHb5Z6MBCqVpGsCpHDXItc8Q-p5d2MA
Message-ID: <CAF1bQ=Sbo32njHxr3C05p_n3MH0wtdm3OE_XmpcX=PadGEDu4A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang ThinLTO
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I appreciate Nathan and Nicolas taking this on. Should there be
anything required from my side, please let me know.

-Rong

On Thu, Mar 12, 2026 at 4:46=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> On Thu, Mar 12, 2026 at 01:25:02AM -0700, Nathan Chancellor wrote:
> > Hi Nicolas,
> >
> > On Tue, Oct 28, 2025 at 06:28:20PM +0000, xur@google.com wrote:
> > > From: Rong Xu <xur@google.com>
> > >
> > > ChangeLog:
> > >
> > > V5: Handle single quote escaping in echo _c_flags to fix
> > >     Piotr Gorski's reported error.
> > >
> > > V4: This is based on the reimplementation provided by Masahiro Yamada
> > > on May 26. The difference is that this version now saves the compiler
> > > flags (_c_flags) from the Front-End (FE) compilation and re-uses them
> > > for the subsequent Back-End (BE) compilation.
> > >
> > > Rong Xu (2):
> > >   kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
> > >   kbuild: distributed build support for Clang ThinLTO
> > >
> > >  .gitignore                 |  2 +
> > >  Makefile                   | 25 +++++-------
> > >  arch/Kconfig               | 19 +++++++++
> > >  scripts/Makefile.lib       |  7 ++++
> > >  scripts/Makefile.thinlto   | 40 ++++++++++++++++++
> > >  scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++=
++
> > >  scripts/mod/modpost.c      | 15 +++++--
> > >  7 files changed, 174 insertions(+), 17 deletions(-)
> > >  create mode 100644 scripts/Makefile.thinlto
> > >  create mode 100644 scripts/Makefile.vmlinux_a
> >
> > I have been running this for a few months locally and I have not notice=
d
> > any problems with it (at least for the two distribution configurations =
I
> > regularly test). I think this looks good overall and seems fairly well
> > contained thanks to Masahiro's work on the earlier revisions. Could thi=
s
> > be picked up in kbuild-next-unstable so it can bake in -next for a
> > little bit? It should still be applicable.
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
>
> Thanks!  Sure, I will pick the series up.
>
> Kind regards,
> Nicolas
