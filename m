Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698DD1643B
	for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 01:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595857; cv=pass; b=ulptOC5TJuZXAFr1hQdQguqk5TZpl+yWELTcAGAg6HsApq1d+HckdsQ9QX+Fu6FtxWA2Bv1MgA+HPnGDm2IqQ11fvKmt6nnd63sWP0H7zttP/THF8rNM+uBhyQYcQ7pX4H9vgsqTeY14teZf2U0TsS+eDT6E3culL37866F144E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595857; c=relaxed/simple;
	bh=GLZupEyovXd1SdBnMvwTWDIFj/J7xpVBqHa2aOIagrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sfvIfXiJdYvPnaQ6tWUF9AYtQ2waGl+CyRXc83viVzVAF1nh0YqN/Hh0SveWTLdAmzolssLieN2gkW9/imAH+DDVlId/exVQ5prDoAK+2v9LKglBLOfz/9rTzKxKtnXVw6OLysUYJB1mYcg1vYOlNPw3D9z0vEqWV5gaebKr7Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pkc5apU2; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pkc5apU2"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so12299156a12.3
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 18:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784595855; cv=none;
        d=google.com; s=arc-20260327;
        b=bJX5kb5xYJ4/nocW09f2iBWOOrHRjqnA1lToevpJ3Eu/67J81e6K7idRAEvEzlnOoE
         7sbvzB3LlEHc+tb6OKaHoYCmW6THES95eKlGxKIshIkxPJI5Mw7+0KQ8Tl/4l97BCdbA
         DF8uhF3O/3B/QsvpZFiUqcTJwfU3Pr9eqMhWbRCeG8pCIictISxcG+g0b8np49QABUDO
         eHjja+lUA2plHdhpyXvk7g2sa+zYMAd91kFehgBc2i20UsGm36pe5iMc2TBdPdO56v7w
         R5u6twAhRjw6xZ28myPLGMw6T+Bkix5upf3BltczrDhjg4JSJi3Lfbvcr1cHxeLUAqef
         bQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=;
        fh=g34SMdM+2WI3IqB3eAZ6zUl4s6PZcyZ/RglMeshJqD4=;
        b=fPHefUby5tUOgpRNwBJmQ0XzJEIO7uWXaVXjnO5k9pn1np9ETHX180GUpN3NWW8DtP
         6whL5EyAA/dVbCOFl5ZRhvJxomwYmL4egwQut0pqLRWOjjVJW/Hf2WAJG4GlYL3A8Y7U
         z7uC4cPsuunx/10ytY8Uut73ui3oubSaIdRZHHqgHzZAaNmGoawJn7SkqiuOmmm6wWeH
         H/pljr9zAVHHRy6QZo0Wxj4AMkrt9cJf7hrfZqdvFT6CIsJYVNy3jv26yJjNQBnDUBIl
         sBhVa363UFv9yfoZVHNeOf6wxn8NxcMuCGEF4lEpu25iVV46rzit03kPe+JUidYxrLC5
         WIRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784595855; x=1785200655; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=;
        b=Pkc5apU2Qjt9jarNMMOFcq28DUhX40IWNfz/aIyag3KlNnekcu8qusGUIRLu+FyOZ1
         /cdIHj5rxO+8fvnWY5VtBmKN7eRxO041/A5MDFUR3g1GXRIWlQMqC0IQ9xNa8QsUPARX
         Rn5AlhS2fVeIfMOwdjb/OqRblCm98Qw+CmNvGNSYdqN5hIbbcMGf9zvbVdOObtP2cyNt
         FxIabTqqPQ1IEvh91U4sagi227AV/YUzxCoXyAJ1mu9izrqWNw/SNNDSD9W8/G+hpLpJ
         Le9HlmPRNOojMrLw923w6FVVmDCty8ijmXM03Y68409iPCPIuz+FP3dSkidswbKlhEV2
         bgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784595855; x=1785200655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=;
        b=l3ogUM76PZ3k7k937tmV0BNDb4+tSvSnenTfbpX4DfpiZAvUyRoGZkYsNxa6K1Pelg
         HfDpmL9Zi6Mnr/3L3U7WxeA0/NoVXFmbmeAz9whU2GQ9oNZ7GYISWwRhLzgdjZe2LvjU
         ef5YA51TeaaoCr7cfrLxBJcVay29GKHbRT/3+p1MMloH1Wfl1PhKYF9QcJnLqobJ64GJ
         D9e+Rde19HDXwHoYelmTo83yL2Opeiog+9b4tiTOmLqIDMLFafLVEMrvVNR3rgNfRSTi
         0xdYY7jtu4HaO54Iug+JuT1Jf6Lu3Ab5WhhIljoScYGXW9hsDuIC/TjQzDGWjmFvvbHh
         CmQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8BLVAqsO5tmU3E54l4TAa1CH+0P08Y6lK5Smeah5GmIyUJim5mono/oa0QQSlDGZXBZqO@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6IeTFHpfXaP0LlurxeWKfbCEleYXHl9cz2VQ0FtHYao0mc1rF
	M1Bd+5YnVglnPWeHMT3IMwA+Bx7hR8y/+DmEwquJ+iTOIhnb7MrTw9Lcakc/Gljmkbc5BR/LQFq
	XLXh0890SKEEPFI2vUI03Ze3iJFGbDys=
X-Gm-Gg: AR+sD10MWesxBBH8fu0KxgchTGj3SF87XfjulEiUkaoYQM9OeBOn2r6vGCvz/mfuj4v
	NZTXD3jhuuDhJT0oRe6GZCs3FLD9sdRAcuSX2jsQmBa3NjC8nv7GdEzRoaCC+zG/IFsUI5c707x
	tF+NMNus5OvUMAKCCzqSXVU+GrAf3MCXKniEkzCgfjU5rJUecdKNXrVtl318Svg5Lulb40Llxs/
	uCqOGzB4gEfjO778pl6mXBgwtueIEpBwRz9OnKBE+9SM8/qtoPE7A7mWqAAREXB8uX9XRyB12VP
	UVmktJjJtl4+v0lBf8Fo1aeJ8sueEna+a7EzitBt3s1N0c13LJy5NA+PnANDYfnPPcuD84c29y9
	vp6LkF4Pdwup4mlaT7Utb1ICeuBoBSWq1Kq7Pzt1F6i3JrJAuqtIggha7PQDYz5JgfWbL2El4
X-Received: by 2002:a05:6402:210d:b0:69a:a9a6:61e4 with SMTP id
 4fb4d7f45d1cf-69e65312188mr6060598a12.39.1784595854460; Mon, 20 Jul 2026
 18:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260719214349.734351-1-rosenp@gmail.com> <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
 <al6ALM2eIWots1Zr@redhat.com>
In-Reply-To: <al6ALM2eIWots1Zr@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 20 Jul 2026 18:04:03 -0700
X-Gm-Features: AUfX_myGWf8CrBLd-qjrAwYOqQPA4YF8JvhlVdpAVRQMWtpDnQSDVL_bsBB8gd4
Message-ID: <CAKxU2N9VoHRUGGjEsMCEyGaMxoc=Bw0tuuMb-BYn+54DJRjQWA@mail.gmail.com>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
To: Brian Masney <bmasney@redhat.com>
Cc: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, 
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Marvell PXA1908 SOC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 1:08=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Duje,
>
> On Mon, Jul 20, 2026 at 04:46:40PM +0200, Duje Mihanovi=C4=87 wrote:
> > On Sunday, 19 July 2026 23:43:49 Central European Summer Time Rosen Pen=
ev
> > wrote:
> >
> > [...]
> >
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index 4b2c089f46a1..8383f9f1da51 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -130,7 +130,7 @@ obj-y                                   +=3D
> > mediatek/
> > >  obj-$(CONFIG_ARCH_MESON)           +=3D meson/
> > >  obj-y                                      +=3D microchip/
> > >  ifeq ($(CONFIG_COMMON_CLK), y)
> > > -obj-$(CONFIG_ARCH_MMP)                     +=3D mmp/
> > > +obj-$(CONFIG_COMMON_CLK_MMP)               +=3D mmp/
> >
> > Could it be possible to select mmp unconditionally, like most of the ot=
her
> > subtrees are? AFAICT, that would also require creating new Kconfig symb=
ols for
> > the PXA168, PXA910 and PXA1928 clocks, but I suspect it may be the more=
 proper
> > choice in the long term.
>
> Just by sheer numbers, the CONFIG_COMMON_CLK_XXX approach is the most
> common use case right now.
It's much simpler this way.
>
>     x1:~/src/linux/linux-next ((next-20260720) %)$ grep "CONFIG_COMMON_CL=
K" drivers/clk/Makefile | grep "+=3D" | wc -l
>     68
>     x1:~/src/linux/linux-next ((next-20260720) %)$ grep "obj-y" drivers/c=
lk/Makefile | wc -l
>     25
>
> I have no strong opinions about this either way other than to drive
> consistency across various drivers as much as possible.
>
> Currently the mmp directory currently only has COMMON_CLK_PXA1908
> defined. When the other PXA* drivers are introduced, will there be a
> CONFIG_COMMON_CLK_MMA_COMMON that all of the drivers will use?
>
> If so, we could put that MMA_COMMON in the toplevel clk Makefile.
>
> If not, then yes I agree that obj-y will be fine.
>
> Brian
>
