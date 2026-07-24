Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF69043CE7D
	for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908453; cv=pass; b=gBhoFWX8Wg5bax0LTl37rttluMUPWtUUMYVuF9uKJI3s0Svm020Yd/U4YrChVOeidNCgQ4zvmY0OD8An8k3eiLRTvcukziH45AGY/7jN01UvoWD36+O8XHBcvTF3CWHyD1JtC/Bo13dU7m3JzXT06bZ6CQRV4XjavrPMITMGLF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908453; c=relaxed/simple;
	bh=ENUPkRl79pEx0BA0+dcKj8PnBBniGh5LL6VfEya2P3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGl5Zjs+1zA2xHAzZZmfrVC2OBrI/TicMum6Rsn1VgcfVbk/3XJzivFEHLh3gAKKsUsPydLKKcl7NC53tex+cTOfdafkfRpHeWUOCtq69Acug6q2ztCMuRKjABANRpf4cCsqeJ9ZGf1p23SUKTVgn/GC8twH1feFXnKe/fyBZkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ctgBa6Be; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ctgBa6Be"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c10ed63c0so236941cf.1
        for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 08:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784908449; cv=none;
        d=google.com; s=arc-20260327;
        b=lhVEr8qCnUjqkLksSPkYr6jr7w3/eLJO8Wqv8o5qC/q3h70PoNEqN29499gNMo5+W7
         WpQZItCJuF10SS9xothKewuNx54m91R4wYSw1QE4PgNgrU9IpypxIfpKUXCKnze/nXi6
         ddoBuoNwxMxqW45wu7m5L86DaLpxKZaztsNVltfG5UUElNPSp9KyWKUJlYxIsMejJ72m
         0mBfHpD7GuxNam0fpryf12eO/ytqknsK9h1bnxnE6xAjMmXLMidBpZLvHrQGj2XSwPu1
         Ash9tT4AD/pQSzCNk6GZV6eI1QXIz8NVCrxeYylWOj+Hzx2NBwUpeVI/ymlbLz16GK4D
         PTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=;
        fh=dboZMZA/OrierrlrUaCg7byiW6ExGgc2aLIZQCWsUAs=;
        b=NYekSF7bWmJroOYgiG3uZJkLIPc4op9TJlGNDsBWzp97taxIal8nrrNX/cbuCbvFg3
         qkknFErLvXVKRm52OpjLYSqykBwQJaf3CLy9ELkPJnt+s+lP9LhXvPrl1Ubq9yypU9xt
         nf+giy/+l+KCXaASsfzUwi1hNGPyHG9PLVjZeFK1CoDT295cIp2oatXtfWU6dDCnY4zh
         V5hfKtumCMqo/HeAUwBPGA43lC37VdKBXdV57SvJ9FTduheRYhFlQBNmGbidJCjm4nGt
         inRlMDidJ2+rrDL9LDEOgW0nBEdEkv9FI3fK8Ao+Wq0MEJtPBm2YGEc1Zy1ld2orPlPi
         8WAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784908449; x=1785513249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=;
        b=ctgBa6BetNbOTwzzBRmK1T2VeHgORmGgYnt/byssmqkJHUUUPUaBM79omWI4r4qQhe
         vyhzvnNMU4Xf/qza961hGnitUhYYw/e0Mmv2n2cL5diyevwBQewEKRNx1QJgGNqj110S
         qxIsGKwZprjxJvQ1+HLSKJttXcCOAmbtCTgisSrKYMCVQzoabUZnUzk7pH5wJdZne2MK
         3IECw+UDXe+w7oap4jykJFL8ySRfftuygbj1Hdy742Z1kSmnx1UCJ8ILqpz7GfCLIzBB
         KtMd8bCmpHfftI2sVHzbySv1V08WQb8n9+o5N95eCvA4SAaciDAnqfsNHr1G+rBUEaTr
         I6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908449; x=1785513249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=;
        b=pSYGAtwTD8dFD1x3vwtr12nk/sYZ69UNlY+knunyI+PExdEarJBJoJVO/WOj/SHnW/
         Bd55ESfKOrilvDRAMd1GnEj2CYSFyYkMmaoLADL1c+AqQqz0R1iX5HQ6mbnTN9J8wXjB
         XM2ExOtkCOA8l7+VeypQvGkoTkEYkrzZQv5kyMO5Vvuv2y/pO0k8sEvH8G5hKJB9+XbG
         puTTTZ1DWZImIMaoZ7fxXMPFf7/6Z2kpSxD7JCMGE2y8Ox2fZCV0FQff/9/3Sv9T8Awh
         j3Mk39x1Sjuujp83rA/EcOErnowI1pyRs1LNPHMdBgcTquy5Wwula3wKggi//CxfmhfG
         jD2w==
X-Forwarded-Encrypted: i=1; AHgh+RotXL9HXNc/MlTa6AnnWBD20OftntQ+8XS9CDiZGMhVOdh9U6nzUeGRFJqBKnkM2s5ZGZFl@lists.linux.dev
X-Gm-Message-State: AOJu0YycmQ49npXfo+LS1Kxewifx/rZc/0RlTRWIpvS+lU2DbekqBxmZ
	iaHlVzvPhabPRFeb8D0u9wigkUi+UsabAYDDTqhHqzSlde844n7yHWqM53RuB+ypS0AswF53m6x
	3v10R7VwZMen0QyD2kXJ0MSeDIEljJk5ypBgmsctS
X-Gm-Gg: AR+sD11PXfY3WvnI+efItgjJrLNLx+esxjxufC7NGvLGHfqLRl2SEbZQXu/clBtQx3U
	UwWf2aT8HqZxxO3Dkm35iaIv+CQs3k9Bkvp57yEQ++qkK6TVkNxOmN/egX0AWXvsvFxNOe9G265
	x5jFZLkcutgctdqYMegqsmcTIyusgfiQBcdz2YJhy9WbEtNCP8S23wA5HqQUaeUHsMqax3ob4Io
	AapCgH3uxIDQGP1xFy3Lxb9SnG0NC/Hu9XVmtlCqd+RqB926qdX03GXDZM=
X-Received: by 2002:ac8:7d47:0:b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-5285229262bmr9058571cf.3.1784908448716; Fri, 24 Jul 2026
 08:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com> <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com>
In-Reply-To: <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 24 Jul 2026 08:53:31 -0700
X-Gm-Features: AUfX_mwjkzQa0aKFOYVTkcojOnlyLhgENNWtHi2USSUpXbUHkHbBUjoNeksPsS8
Message-ID: <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 12:56=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com> =
wrote:
>
> On 2026-07-23 9:21 PM, Sami Tolvanen wrote:
> > What's the value for the __kcfi_typeid_imx6_suspend symbol in
> > vmlinux.o? I would expect the hash value to look a bit more random.
> Checking vmlinux.o with `llvm-readelf -s vmlinux.o` indeed shows:
>
>   a488ebfc  0 NOTYPE  WEAK  DEFAULT  ABS __kcfi_typeid_imx6_suspend

OK, so the hashes should match. I can only assume that the hash prefix
doesn't end up getting copied to OCRAM for some reason then, or
perhaps the source of the copy operation doesn't have relocations
applied? Either way, if this turns out to be infeasible, I think the
__nocfi approach is reasonable in this case too.

Sami
