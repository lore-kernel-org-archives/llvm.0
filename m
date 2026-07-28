Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B2B3BE644
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221603; cv=pass; b=Hklk+6T16mDC0JXimuXXMG52o+vR/wTKLskdnr9m+EvgAi6G4Q5KhfoH9QsknIjQGZ+H+RMi6i6jW2Gm4FhXL/2B2o21cQ4WrqnKPK8dYVahNkQ4KGkBxh3i7e5JP2lRwiTcTUmH7IgfHO1iGfCzLp3iv536n1eGjpma+3acmDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221603; c=relaxed/simple;
	bh=DghIKmYGd2hbT5j9h12R+ylPqCeMoSdsqZetsAXpcLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bn3QBQGr6qC36XuG4+HuF4K4YAraSa4dhH/i23gjwbLDDT+pGRdQswuqxcZGCsOPWgcsDsccuLI+VQKY9Swef6tAGyJj/8z3cbBRYhsgLOA7de/NNgfVBskDQpqtOTtmHrskVCyqwGKPea4cgW56F8AdKtHBVlRWEor5SL4yoiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=hac7uXUk; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="hac7uXUk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caea3f742bso42195915ad.0
        for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 23:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785221602; cv=none;
        d=google.com; s=arc-20260327;
        b=ed3z2/9u2QICWJvyEZOhKQZooWhHwLZwmxIrLMpFUoCH1gYdJ9ytdiU3tHafTfNAog
         7658IRHlEgeBnnzDYN+5Zzw2TkjuMhb9nsS0i0bwi2uMr5PNfz9TWmeJACMkVsAcOw53
         h3rCqJryeBwTQ6qxwGv1jv2b39OpVnFiS6EtwRRCdY4TEjVkjTk3vSkHtGSO0om+1B/L
         CSy+Z1UHjg0PXqi6E3Em0WxSJZzcMydenWnhz1PEwpr2bq/9Qt4ds0xrovtcdIXmkFGq
         lYm144q1X0m6mmDO2sFbS9w9hDaZr1+ObrDJ9XkgaBSNrlK38oPGodA2PsZYx4SZzMVg
         IkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DghIKmYGd2hbT5j9h12R+ylPqCeMoSdsqZetsAXpcLQ=;
        fh=opbPYTqvawUw2AxwJkIZ0w/RiGIbixj2Ag7ot2mMfvw=;
        b=cKmdzR3XnEctI+gaLGHB511hKULUXblMLT0wVjLiCoVxKYNsKoVTiRgCFOidBI/Ezr
         o0+0zojpy0sQ2ZH1HCe2NzwQ2f2amlx0pGVfmozBwoaFyNZbSaGRRUpoUPsoNPmr169H
         tM/D+X0m5rM5NZw2pAR+3KirbfCF7uRB2hcsW4cuVbp4HC2ibgTFXD8HPykh9zTSxe1z
         82fiIIVkP/bJfOKwUKJeEIxExkI3YBYM1lSyNh0uadTXEWvop6kQoRTKBIzj94h70x9b
         gkCwXBBtrI29UWeU6Nm+mkh9yPk4GnKET5rT87LWC3KqhQhuA8iL7UvY88M14SBmkADJ
         hzWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785221602; x=1785826402; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DghIKmYGd2hbT5j9h12R+ylPqCeMoSdsqZetsAXpcLQ=;
        b=hac7uXUkucUD2cj63QsHV0QFB0B3q848BxZSKCAi1/IcyCdaMo4hdf1oVgDm+RyxEY
         JUn45LyxHOHGPv+3AQ7fX1eBnNFuS20n/AdeYWOdkXODmq0aCSqqJpH9HuendyGs0e8r
         2Dt6clSoB/xkMj32PUQECESpQm1/EL7foXbZMN5PtU2xXKjdP+WkmJqv8UYvcGb4XQVB
         rJQxlwxDrv+dhBAuw3yciEFbZAhdLddv34IZj94NsELMBZfjrrLqXRTzrQMpbXkb6q/R
         f2+SSaEGNkDf0BPEe48I9gcbColVva0iFGoXatzZ3LoWt2FFIKfQuiwipx271vWAaRn2
         HwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221602; x=1785826402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DghIKmYGd2hbT5j9h12R+ylPqCeMoSdsqZetsAXpcLQ=;
        b=IA9hFuOF6yrARbCEc6JPUDjQ7f6d1HXtRrxjxzMktYYkc2vdeyTh9rE0aZvNWpXP01
         yuG+BLeRKOb/HGFtzOLKKccAYHtb7E7fFp8fRN4VzPjzE+xbYS0vh2c3UhXHUkfbZknE
         b+au0lSLl9FCFomN6oK9DgMBi7Z5SCphTrphGt2FkjvVpzFen+i1xdyD3GykVrQpu9ji
         fRpcAsNCko7OykjIlwRI1WmXGGXexV7zbsfdb8yeip+i15CitjhkEDgHhOMekt/MvWxr
         +s63NhrKSNGZA0Lx6jY4YLWSz0gDnGgTc6QxvRSbdLr0rWcrvyzq5b5AfA2F0H1rWprF
         HyOw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7x9gdfES83EwmWoQmUGJg7jPsx59sutKHck4vK/uRosT1fOpk9mMLIQwdWNoPr/6aQsgJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyVTZOWc2/bMh1/wRL3QMpQawvCE8rkMKI3KruOy/cNMaosxXyM
	xvyCkv5aZE+TOQ+Wd7BaVII08xMQYeHqKQ65EZeA7VDvdHLK1SyKOhyhVSjqb33Vgon/anPBxmm
	qZ+LFLYOZbIKrMWd3+wS8D6MNp0tJ59Rp92AOtA4SkA==
X-Gm-Gg: AR+sD10aySy0jhoilYomTDqGvJG/GVyoxfu6XjqImHiXOktwxU3l+JwpfxX9Dt72xzc
	GZC83slPNjeGKx3D9f2wyLkm3yR/32IOkkQn7kX1u7aOrFgKlZ52XAhwZR3POn9l7iIS4nXkrND
	ClXYoQ52jQOIfNLeZzD/DmiT5LI7EqhGunKwfwcTZ0UHHMVbF85QYDn04K73Xqg0YHfJRHVa6bs
	d8j+mFxrpMQBIURjCTx86ISkHRDsgLa8JOz7Vpi8ZhMeDsoQre3Vh73n4REntlIs2YLJExZUcVm
	ec1S/OzksNX+s0Vb4FFfoyu0UHbHr9o=
X-Received: by 2002:a17:902:f645:b0:2ca:c411:78a with SMTP id
 d9443c01a7336-2d015ac948bmr15496315ad.3.1785221601786; Mon, 27 Jul 2026
 23:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com> <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
 <CA+KFgX76tbg_LTh6-PO-zrmhWtrjP4y3u47s1wximVFUQKq=uA@mail.gmail.com> <ambTvkneo9sf0lij@1wt.eu>
In-Reply-To: <ambTvkneo9sf0lij@1wt.eu>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Tue, 28 Jul 2026 13:53:09 +0700
X-Gm-Features: AUfX_mxdhCrbW3hN-Zhsv4woJBNLntZU0yodQrxIuuaP6KQEUZqgbeBaggcrC5g
Message-ID: <CA+KFgX4UssLeBdgJsz6opJcezXU_cvMuMnotMz1pAmPEtbH+2g@mail.gmail.com>
Subject: Re: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before the
 arch macros
To: Willy Tarreau <w@1wt.eu>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, LLVM Mailing List <llvm@lists.linux.dev>, 
	Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 10:42=E2=80=AFAM Willy Tarreau wrote:
> Since it's userland (i.e. not building with the kernel's compiler), and
> often used for ease of porting boot-time tools in headless or embedded
> environments, I'd really like that we keep compatibility for as long as
> possible with oldest compilers that continue to work. Last time I checked=
,
> it was still working fine with gcc-4.4. I still have my 4.7.4-based
> toolchains that I regularly use for troublehooting and compatibility
> checks (and faster builds), I can recheck. We should not require that to
> be verified by contributors (too painful), however, noting "still known
> to build fine with version X" is helpful. And the day we discover that
> this promise has been broken for a year or so, we know we can safely
> update it. I can recheck ASAP.

Ah yeah, that makes sense. Preserving support for older compilers is
cheap at this point.

> It can indeed be sufficient to add a line to the first comment block.
> However I'm thinking that we would benefit from adding a larger README
> in the sub-dir for contributors that explains some of the traps we often
> have to mention.

I'll leave the documentation to you then, looking forward to seeing
the README file addition.

--=20
Ammar Faizi
