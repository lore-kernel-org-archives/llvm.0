Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323FD4689;
	Mon, 20 Jan 2025 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387075; cv=none; b=Th5TRcWG9/lBejBelCt0SL+xfzq+M0ISkIRMZBoLkYmCnLsAWmAFcqyvoBAsRUaK9lD/yfKG0IGov/0UVY6/a8X3mXbPvUbP3Rx1BpHaYEMHt4NfimeG4B3pZbqMy15ns8lTk5/b3JS+RCqdNMQguxA0j87AW4/tVVfkMc6YM9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387075; c=relaxed/simple;
	bh=Q5w/wANwjIwqGl4y2csY8m3txAYGhcapjxiC0ORU/+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biMnOXhIZt6qVD2DLdUR3i/6h/Dmom4wcY6w6BwZpyCmzbPW6bbbrfd4KFkeieWSkcwq0PdlD+UoYd1QMvi3kO2AyuAYpi6p9yW2TI8+gLPdNT//uoTh3rvQu8Bva9AMo3qV8bHoJ2GYsOHatcN5rGR7FVkC3DOkrAQ9t8h7CEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFTnhJb+; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFTnhJb+"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7be3f230436so428013385a.3;
        Mon, 20 Jan 2025 07:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737387073; x=1737991873; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5w/wANwjIwqGl4y2csY8m3txAYGhcapjxiC0ORU/+s=;
        b=SFTnhJb+90eDVLTVYZvEOVGw1zmoAfc8Q4XcBfIzEYLr6pkdvMA/MeXszk+L4msqBI
         cpJOlmrXSYfEeyQLHeCF2uJQxhQINQ3aOeix6YByW/q0IfbPvrXG4dVu/tFoAkZ9C8/B
         9n9bJItbPHcmsFDJ71jYlxM0l4Xsu4ge6Q1nZbbRK0tka9+l0WmN5Nsg9LMGKfWn0lbx
         5BZfEFT1O26ZtMXpfr+p1cH1LomPtk6I9FpYMO2PIYi5Wt99D9oh9ZGzESJkOaJJso6e
         6OBxx11sLAv337JC5kX0OPMABKnpQ6rpFqdovz3nqkXDLo8OPYDWthTq9/0/Sh1t0asi
         QH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387073; x=1737991873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5w/wANwjIwqGl4y2csY8m3txAYGhcapjxiC0ORU/+s=;
        b=DTjajm5Yzaqdmr0Ead4hZABy9oUKft+3VypZMAZBX/CbWpl6V5o5fE2yHUWTrKQR9q
         Td2gcVXD7OOb78RKvfhWeDl+xACV+2cr5jAqShzhap1wC8QOV+DHUKtvFQb0iFxbEDIe
         ycrsmpQKdOLRmP4l1Jz2EJZKjcRY3scqvZO5qhd7mlMjMoM4Np6l27sdrVZoo2Zmo+cg
         3IRtTzGNBQSKsK+FJTqI2aYnHpowBiNcxIxCA52pzCeH1Kulrz31AdUltrmgoCvqZ6cs
         3onPqJuq8Vy5Vs3/dF9p4byjQw9jbg9mLZYgG6U2rtvzm3Cvm8fXAMtctkn/0kd+qfv8
         QJHg==
X-Forwarded-Encrypted: i=1; AJvYcCUgGifnBglbN/eIg0XO0Wgcga6YGnSfR8ifWHrDW3ZQMRWim0CxQrqREa6nJtf1N5y/vuMN9kJSVtOJ4QcCzg==@lists.linux.dev, AJvYcCXbFqXlv3y2zNmp5ta5ZApYH8BSpnMbhJm+RxeSpEKhgFclDtUIJNTbRkL/P8ga1hBN+K4Y@lists.linux.dev
X-Gm-Message-State: AOJu0YxMkj4nehURVN3wvJvv14pk1yX38lnnAQLoTwm1GbYaS0f1cqZd
	fGGv8R4YfmsWjizgbBIdHbyP+u0yg1UrNwHMJJTCMt5EhLcGO4ylhb6rQkH8smv8Yvq7hTbx57y
	x55ZSr1r9DNxNFHGUzJoyyxzX52TxA/ON
X-Gm-Gg: ASbGncvFFZv0qdUUfdjzXyod4RXA4yWkiTycV5H62qwedkuOyiVETExjmcZmWhMtehs
	d1SjN2qQm4J1WwyfsT9C+/lAHFahXFGua4SxdCFUR2CrDNxG31g==
X-Google-Smtp-Source: AGHT+IE/38SsR1NaG+nf67p2xry6GfBGRtozT4sflOLH0Az//NNWhSEobEscti2d2JdWHZImKyZ2ATcihv2OZKGK/kI=
X-Received: by 2002:ad4:5aa4:0:b0:6d8:8f14:2f5c with SMTP id
 6a1803df08f44-6e1b2180802mr221598616d6.23.1737387072980; Mon, 20 Jan 2025
 07:31:12 -0800 (PST)
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
 <CA+_ehUyVH5r5LK5B2tKZgH_dR69OVaV-ES7+GPShNuJCWEXHVA@mail.gmail.com>
In-Reply-To: <CA+_ehUyVH5r5LK5B2tKZgH_dR69OVaV-ES7+GPShNuJCWEXHVA@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 20 Jan 2025 16:31:00 +0100
X-Gm-Features: AbW1kvY6mElfhbsbyKEH7I6iuas4l5iufpcU_q6e6bgMtcBLONk2D_f0i_0xaLs
Message-ID: <CA+_ehUx1j=Tu4zztxsXvmiMmxXt=tWx2G74p10bgWvMWkK-PFg@mail.gmail.com>
Subject: Re: [linux-next:master 9185/10024] drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2:
 error: write to reserved register 'R7'
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 20 gen 2025 alle ore 16:28 Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> ha scritto:
>
> Il giorno lun 20 gen 2025 alle ore 16:20 Christian Marangi (Ansuel)
> <ansuelsmth@gmail.com> ha scritto:
> >
> > Il giorno lun 20 gen 2025 alle ore 16:05 Sudeep Holla
> > <sudeep.holla@arm.com> ha scritto:
> > >
> > > On Mon, Jan 20, 2025 at 03:52:09PM +0100, Christian Marangi (Ansuel) wrote:
> > > > Il giorno lun 20 gen 2025 alle ore 14:44 Sudeep Holla
> > > > <sudeep.holla@arm.com> ha scritto:
> > > > >
> > > > > On Mon, Jan 20, 2025 at 02:37:19PM +0100, Christian Marangi (Ansuel) wrote:
> > > > > > Il giorno lun 20 gen 2025 alle ore 14:34 Sudeep Holla
> > > > > > <sudeep.holla@arm.com> ha scritto:
> > > > > > >
> > > > > > > On Mon, Jan 20, 2025 at 02:01:30PM +0100, Ulf Hansson wrote:
> > > > > > > > + Sudeep,
> > > > > > > >
> > > > > > > > On Mon, 20 Jan 2025 at 11:37, Christian Marangi (Ansuel)
> > > > > > > > <ansuelsmth@gmail.com> wrote:
> > > > >
> > > > > [...]
> > > > >
> > > > > > > > >
> > > > > > > > > Mhhhh.... Any idea how to fix this? Maybe we have to exclude some flags?
> > > > > > > > > Error is "error: write to reserved register 'R7'" and I guess it's very specific
> > > > > > > > > to some kind of ARM ERRATA.
> > > > > > > >
> > > > > > > > I don't know to be honest. The arm-scmi transport driver
> > > > > > > > (drivers/firmware/arm_scmi/transports/smc.c) is having similar calls
> > > > > > > > with 9 parameters to arm_smccc_1_1_invoke(). Not sure why it's a
> > > > > > > > problem here and not there?
> > > > > > > >
> > > > > > >
> > > > > > > I think it is known issue and must be solved with the below patch if my
> > > > > > > understanding is right.
> > > > > > >
> > > > > >
> > > > > > If it's a known issue and affects also other use of smcc why we need
> > > > > > specific fix in the driver makefile instead of a more generic one.
> > > > > >
> > > > >
> > > > > IIUC, arm_smccc_1_1_invoke() is a macro which can be used anywhere.
> > > > > There are reasons why we can't move it to a module and export it.
> > > > >
> > > > > > Do you have a link for the known issue?
> > > > > >
> > > > >
> > > > > Nothing handy, but quick google search gave me this:
> > > > > https://bugs.llvm.org/show_bug.cgi?id=45826
> > > > >
> > > >
> > > > If only these test report were easy to report instead of me having to build
> > > > the massive llvm-20 dev version...
> > > >
> > > > Any hint if anyone knows if precompiled cross tool are present around the web
> > > > (with llvm-20?)
> > >
> > > I can test it I guess as I have clang v20. Let me give it a go.
> > >
> >
> > Ok no manage to repro and I can indeed confirm your patch fix the compilation
> > error...
> >
> > My main question is... Is it acceptable tho?
>
> Honestly I will revert back and use the basic arm_smccc_smc. I don't really like
> the fix in the makefile and I think it should be handled in a more
> generic way for
> any user of arm_smccc_1_1_invoke.

Actually sorry for the mail spam... Since this is already done I will follow
how it's done for drivers/firmware/arm_scmi/transports/Makefile

Creating the patch that fix this. Thanks a lot for the hint and suggestion
Sudeep Holla.
