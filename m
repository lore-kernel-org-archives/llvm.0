Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD251E3DE4;
	Mon, 20 Jan 2025 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737386903; cv=none; b=KuUu0i0wiR2QjzSHhKWZuGzZXUb5mIwIHwKhTC5Kl8AJ6wZt7TpYMIc6Ocgk1Jo5dL24kdmKg5LE5NqNFkuIunJVS27QX0OWzAxFeZTPTpplMqQt7nTOrR6MuRTMKQuz0xM+BboP0nq2U+LmSo1aJ1W4YSCF8LMVxaK8R9RdH5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737386903; c=relaxed/simple;
	bh=MQf0poQEkm73cjKyPBWiY4WADcm8SF9xOoAxEwURbok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfMkl4oWqwDpB6nqltw6bXEx6cBMVOhFP1Hgp41N245cQUf1j5yDxaCRou6Oo0Q69OgI1LFaSEzoYLsmKw3131ql3HgjPjGq7O5cVTUOo8i7uk0QMR5/fyUC9To7fwk+qarprrIIehbLgVgeG/QOndB3XrE6L1vIk6xi0QAagO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyIYtIpO; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyIYtIpO"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6eb531e13so246191185a.0;
        Mon, 20 Jan 2025 07:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737386901; x=1737991701; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MQf0poQEkm73cjKyPBWiY4WADcm8SF9xOoAxEwURbok=;
        b=MyIYtIpOf+OBM2gTbczl5VzHcL3N4KLYmA7KSc0gpa7jue+by9TUbcPmMlz2S+N3TK
         Yn1/PESPc8+3nSuxf11Q1MB8TRXgRZXh4oCwmNoqz2puAA2TAcv+QVKZwcQkPXlwR63/
         K135P357r4alOHSx5bDASEqXpmMCAVnXt083fZL60eGT4hCkUhkQlV0KuxpOi473eajb
         uidH5g9AGJokfKD29MrMgCXggg/AXyatktKVHMva28hMwxnwmjWeHi+MFnLp2t4LDWlr
         MQXS44Am+brOqA7a2D1eVAeP6zu3aDIsXd42H0kvk27w2SrDR3K7GK8SW/BEzuJFnIuz
         mBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737386901; x=1737991701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQf0poQEkm73cjKyPBWiY4WADcm8SF9xOoAxEwURbok=;
        b=S0gwAs+oeOUefgSdMMMJCfmwhGLVcL6vx0StfHdl6POgfgdyrqP4fbducg6MY3CYlp
         BFgWUm4k+/v4ZK0xG/TbBM75ZWnrxXXGyV3+K+7pOigPXpkHs43gut8ffAxRk3ighhWP
         Xo0vIRdoJYvfrakz8qt/fxKUOXUgGV63+CWSde5EQZwGkmJBZ0346nys6DlJqDGL2htk
         SOoBLppnbjpIFYSUekH5QQ2W95R4lyiZ09/L0pEOTzihGviEPv/EGX7OtxzQ2pIpsnR2
         FfYTLrFcimAGZ1o+3GQCOxpWnV/Y665SWryoe96Ysipj5aJHoWHJrLFutuC/DcU2w4dS
         k78A==
X-Forwarded-Encrypted: i=1; AJvYcCVHc6jD5VPZuGLANNB8lAztLSA11a4Zf6osTEwY918WMwDvuhmb6VS8A01hOaF1/LAcqrRR@lists.linux.dev, AJvYcCVwRL+93TH8j6QrdgSeEsZoqbSDKZB9CxE0r0EzQMWrSh4nn0o+s0SkPEaQ+qmPlHhujt7BhyzHPWHGqBODVA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4D7r0wt6hUy6DDN2r5nxt2LYznlPp6JtS037yFRWkN2lBCitA
	FePd9xABO8tMSDDAEV2d1e7YEpqJOFfhn2Vl4YOdBBLQ3NgU8PF2TAb3GB/aLgltEVDVEXXfqjT
	8Rj9L2QtW/pl7LKJDnXVSoUa/62j7LnLU
X-Gm-Gg: ASbGncuJhBKMS2Y/vIVttwQgKOg/azCXBDcBuAexnWbcCk6NtRjQg5Rn06X9MJbIPDu
	z/lio5DyVU0dntVNHEID3JGWRkWYK/wU/Yd7Pxu7M3uRQphkHvQ==
X-Google-Smtp-Source: AGHT+IGqk59zQNwMv8BCDYmkZ0G4elXyz/ScJxZQuC42kEAPmm7MZddCR9tztDjz6owF/7KuGGVE7bF8SNZ1GbqZj6Q=
X-Received: by 2002:a05:620a:4048:b0:7b1:4f5c:a3a3 with SMTP id
 af79cd13be357-7be63252ab6mr2370803585a.56.1737386901107; Mon, 20 Jan 2025
 07:28:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501201840.XmpHXpQ4-lkp@intel.com> <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
 <Z45Q9zJ8mvE_ut2R@bogus> <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
 <Z45TSqieqbzufJWS@bogus> <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>
 <Z45mOFHZM75VLZ-g@bogus> <CA+_ehUwnWdi7bG-Dzc3iv=VTA8bwEpRXP9_iQVOb5=uDqqrRRw@mail.gmail.com>
In-Reply-To: <CA+_ehUwnWdi7bG-Dzc3iv=VTA8bwEpRXP9_iQVOb5=uDqqrRRw@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 20 Jan 2025 16:28:08 +0100
X-Gm-Features: AbW1kvZpkPu0FyKD0OCA87Wg1aDHrTRZSyMWFe3OS8Jar5BdLiggHbxrGUOdIqk
Message-ID: <CA+_ehUyVH5r5LK5B2tKZgH_dR69OVaV-ES7+GPShNuJCWEXHVA@mail.gmail.com>
Subject: Re: [linux-next:master 9185/10024] drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2:
 error: write to reserved register 'R7'
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 20 gen 2025 alle ore 16:20 Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> ha scritto:
>
> Il giorno lun 20 gen 2025 alle ore 16:05 Sudeep Holla
> <sudeep.holla@arm.com> ha scritto:
> >
> > On Mon, Jan 20, 2025 at 03:52:09PM +0100, Christian Marangi (Ansuel) wrote:
> > > Il giorno lun 20 gen 2025 alle ore 14:44 Sudeep Holla
> > > <sudeep.holla@arm.com> ha scritto:
> > > >
> > > > On Mon, Jan 20, 2025 at 02:37:19PM +0100, Christian Marangi (Ansuel) wrote:
> > > > > Il giorno lun 20 gen 2025 alle ore 14:34 Sudeep Holla
> > > > > <sudeep.holla@arm.com> ha scritto:
> > > > > >
> > > > > > On Mon, Jan 20, 2025 at 02:01:30PM +0100, Ulf Hansson wrote:
> > > > > > > + Sudeep,
> > > > > > >
> > > > > > > On Mon, 20 Jan 2025 at 11:37, Christian Marangi (Ansuel)
> > > > > > > <ansuelsmth@gmail.com> wrote:
> > > >
> > > > [...]
> > > >
> > > > > > > >
> > > > > > > > Mhhhh.... Any idea how to fix this? Maybe we have to exclude some flags?
> > > > > > > > Error is "error: write to reserved register 'R7'" and I guess it's very specific
> > > > > > > > to some kind of ARM ERRATA.
> > > > > > >
> > > > > > > I don't know to be honest. The arm-scmi transport driver
> > > > > > > (drivers/firmware/arm_scmi/transports/smc.c) is having similar calls
> > > > > > > with 9 parameters to arm_smccc_1_1_invoke(). Not sure why it's a
> > > > > > > problem here and not there?
> > > > > > >
> > > > > >
> > > > > > I think it is known issue and must be solved with the below patch if my
> > > > > > understanding is right.
> > > > > >
> > > > >
> > > > > If it's a known issue and affects also other use of smcc why we need
> > > > > specific fix in the driver makefile instead of a more generic one.
> > > > >
> > > >
> > > > IIUC, arm_smccc_1_1_invoke() is a macro which can be used anywhere.
> > > > There are reasons why we can't move it to a module and export it.
> > > >
> > > > > Do you have a link for the known issue?
> > > > >
> > > >
> > > > Nothing handy, but quick google search gave me this:
> > > > https://bugs.llvm.org/show_bug.cgi?id=45826
> > > >
> > >
> > > If only these test report were easy to report instead of me having to build
> > > the massive llvm-20 dev version...
> > >
> > > Any hint if anyone knows if precompiled cross tool are present around the web
> > > (with llvm-20?)
> >
> > I can test it I guess as I have clang v20. Let me give it a go.
> >
>
> Ok no manage to repro and I can indeed confirm your patch fix the compilation
> error...
>
> My main question is... Is it acceptable tho?

Honestly I will revert back and use the basic arm_smccc_smc. I don't really like
the fix in the makefile and I think it should be handled in a more
generic way for
any user of arm_smccc_1_1_invoke.
