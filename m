Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75D1B6D0A;
	Mon, 20 Jan 2025 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737386423; cv=none; b=GBkfU9Jh6XY1ozpkv2L/EPlEcR/XcAATUEozYJZwSmPDBxg1Ks9+/w2qUV7UHDe55bzCJo4gUHlDEcGzk4m37xrIitheGumz9yiGrAG/aSnCG2vL5HzX7ef00MQQWB8HLkTNlXNVl/j3RBFu56CvRU1LyBydOCJKPLGLCh/yE70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737386423; c=relaxed/simple;
	bh=ebiudazlAi0Inn/mYc3m3Yua/jjucGFhyZpaeAn+BcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYVBU/3EEfrB0Y41pqyAasrGHp8D/taw5pALiHmWvpi8K+wA3JKVSzHxT0s8nCu4J91hbZW2o0+bsO0uLFEmbXTQHrcSSpd/CSPXXBprv2edSJOBAXZlUlEt/7mAqwnU9uswGrv7ozfJ2kPZaQIZ+JsuBTzsi++6GuLQKeTdvAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h69bWTDo; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h69bWTDo"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8edad9932so35254166d6.0;
        Mon, 20 Jan 2025 07:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737386421; x=1737991221; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ebiudazlAi0Inn/mYc3m3Yua/jjucGFhyZpaeAn+BcM=;
        b=h69bWTDoQzN8GJ4naoBcwmlJHKRsjSI/bt0BRTrLpp1ut09P/mB9axMdAKc+jC1BeR
         ADcHLKWEaysgHQ+0xsa8wKDjoEgBTwz3bgchlN0xYPqVtuicwHh2wPAueRYKp2/FPT3i
         SM3U7uYMI3Nze4a/6teWVexxCCedBQECrqyj3JsnvHFXByoQqMFyC5v7gUScOmNPGMAy
         211s/cP96FSdstGWSSCfVsHQkgEGMKKPnTi6fa8WOQ2vdGopdSNNxi6DHwhfbkPClC8l
         eIwtnW2/mwnD9Ei59sWs1jccWIDSc12k7QQdSMM7grBKl8CpfEbKv3D/UNegZjTYw8Eh
         EnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737386421; x=1737991221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebiudazlAi0Inn/mYc3m3Yua/jjucGFhyZpaeAn+BcM=;
        b=oNje8aiAYrVgzT3Y4OUxhvHq49r4aecyldpOCmZrW8XJuV94O5qdtLw84VcN+/9zuj
         gfcTJZvgIiiPdpHDM9jJPd8zGydBeGnJBT2SyG/yJwQMD6//k0Zxv2NsbDGCiRp9jRyS
         Ak5e6XRF9+9vBpzLV6/MoW0l1sHcRAsLer55nxdP9OCE2p+mi3O97UiE606Zk+HbQTiF
         yJrSU8M06LHGdP43kC1B3Sr7szNcET9mI5ruuZSi8k3XiIXRENfMYOqkUpvocP5F5GiP
         gPLsJTM2muUkuLUGf/fUOpgsIepVntrFermXr4Dt4JCGfp83qV46mKOCiBJVFUcr50bY
         fW9w==
X-Forwarded-Encrypted: i=1; AJvYcCUdUxAMkUTsLWDHtWfW3EGRtwxy2PhV7P/agz8CX48XPvi6/iE/JaMgoOsmu2g0kDth/wOH@lists.linux.dev, AJvYcCWpNgzbsZ9jTCTMzWrniiPoWM0ziSz1moj4YUS+TxCKIxD78vVAwr14qYGb7RLrCbeo7LZL23ixdkMh+FKbww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0Qo3sU0Yz1gWaoD0MxeJyAHeQdnAPfn/teMyuR76YpqSSQkVf
	MjeG3RboCmFaNXKkWHziF06HCjROL/U7HWExhSqei5vZCdTpna8A1DjB2at1PqAHN+T1hDl7Vsg
	DPkwZA89PeWfrEkhNpQi56NYtY2o=
X-Gm-Gg: ASbGnctTJlP3Tp6+ZTaXuyYC3GhAw9r4+NKb8SAbjGiDHqiC5Kgc3Cz+vUGJaGtmU1d
	RGn09IEE6WKRZdW5EM7AXivYv/I9a6ofOupx+UG05SvXVBsB0NA==
X-Google-Smtp-Source: AGHT+IHvqHL0qimNzI8FGM+N3HND8X/0/54kluHdu9DqFht1bpXjsbGPjiyz/XXj3pB0BOicY5SRklIg9w93aReCo9k=
X-Received: by 2002:ad4:5e85:0:b0:6d8:8fbf:d1b7 with SMTP id
 6a1803df08f44-6e1b223ad9fmr206356256d6.43.1737386420821; Mon, 20 Jan 2025
 07:20:20 -0800 (PST)
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
 <Z45mOFHZM75VLZ-g@bogus>
In-Reply-To: <Z45mOFHZM75VLZ-g@bogus>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 20 Jan 2025 16:20:08 +0100
X-Gm-Features: AbW1kvaUsVmzSpN5OIiexEE8ok46bM68u_xQO-blt3XyeIRzN1QgcMfcj0oRBOs
Message-ID: <CA+_ehUwnWdi7bG-Dzc3iv=VTA8bwEpRXP9_iQVOb5=uDqqrRRw@mail.gmail.com>
Subject: Re: [linux-next:master 9185/10024] drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2:
 error: write to reserved register 'R7'
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 20 gen 2025 alle ore 16:05 Sudeep Holla
<sudeep.holla@arm.com> ha scritto:
>
> On Mon, Jan 20, 2025 at 03:52:09PM +0100, Christian Marangi (Ansuel) wrote:
> > Il giorno lun 20 gen 2025 alle ore 14:44 Sudeep Holla
> > <sudeep.holla@arm.com> ha scritto:
> > >
> > > On Mon, Jan 20, 2025 at 02:37:19PM +0100, Christian Marangi (Ansuel) wrote:
> > > > Il giorno lun 20 gen 2025 alle ore 14:34 Sudeep Holla
> > > > <sudeep.holla@arm.com> ha scritto:
> > > > >
> > > > > On Mon, Jan 20, 2025 at 02:01:30PM +0100, Ulf Hansson wrote:
> > > > > > + Sudeep,
> > > > > >
> > > > > > On Mon, 20 Jan 2025 at 11:37, Christian Marangi (Ansuel)
> > > > > > <ansuelsmth@gmail.com> wrote:
> > >
> > > [...]
> > >
> > > > > > >
> > > > > > > Mhhhh.... Any idea how to fix this? Maybe we have to exclude some flags?
> > > > > > > Error is "error: write to reserved register 'R7'" and I guess it's very specific
> > > > > > > to some kind of ARM ERRATA.
> > > > > >
> > > > > > I don't know to be honest. The arm-scmi transport driver
> > > > > > (drivers/firmware/arm_scmi/transports/smc.c) is having similar calls
> > > > > > with 9 parameters to arm_smccc_1_1_invoke(). Not sure why it's a
> > > > > > problem here and not there?
> > > > > >
> > > > >
> > > > > I think it is known issue and must be solved with the below patch if my
> > > > > understanding is right.
> > > > >
> > > >
> > > > If it's a known issue and affects also other use of smcc why we need
> > > > specific fix in the driver makefile instead of a more generic one.
> > > >
> > >
> > > IIUC, arm_smccc_1_1_invoke() is a macro which can be used anywhere.
> > > There are reasons why we can't move it to a module and export it.
> > >
> > > > Do you have a link for the known issue?
> > > >
> > >
> > > Nothing handy, but quick google search gave me this:
> > > https://bugs.llvm.org/show_bug.cgi?id=45826
> > >
> >
> > If only these test report were easy to report instead of me having to build
> > the massive llvm-20 dev version...
> >
> > Any hint if anyone knows if precompiled cross tool are present around the web
> > (with llvm-20?)
>
> I can test it I guess as I have clang v20. Let me give it a go.
>

Ok no manage to repro and I can indeed confirm your patch fix the compilation
error...

My main question is... Is it acceptable tho?
