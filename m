Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB53B1E0DCD;
	Mon, 20 Jan 2025 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737385535; cv=none; b=pQlIwwXNju+QwBTDGHNzLUTfKYo9oo6kKbkqBoH1DCwZShgM+0yK+G3fKJ9Hl1+Fjz705Vvn5JZxHM1/eToV2iDTgbt+TNHx3cG7yaKslnnRLQEQTWJjCug/he/LVOXAzk73Jcwi+/rwH/ejVdJbntStHiNniInD82Es8F0WLwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737385535; c=relaxed/simple;
	bh=ugcmvoxUwG5pnytuVMNdmpR1fmLFt//a9N18RXC7ZPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpT1MGQkeJ2jYIMsA1el6YkP7XN0suYZ7Ryd4ycyI61nFF/swYkH40/XUxGBg2Ygl3wahxsyuPPksAj6a+5JxCu1rsAiO9rhGl2T6Wb5XFR50oCuy9Lsrm5V6n1We4ysuwkM0blTPWtL8GDhN1eQjo55tZI37z6gATmm7C2MJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A99A1063;
	Mon, 20 Jan 2025 07:06:01 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB18A3F740;
	Mon, 20 Jan 2025 07:05:31 -0800 (PST)
Date: Mon, 20 Jan 2025 15:05:28 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel test robot <lkp@intel.com>,
	Sudeep Holla <sudeep.holla@arm.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9185/10024]
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to
 reserved register 'R7'
Message-ID: <Z45mOFHZM75VLZ-g@bogus>
References: <202501201840.XmpHXpQ4-lkp@intel.com>
 <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
 <Z45Q9zJ8mvE_ut2R@bogus>
 <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
 <Z45TSqieqbzufJWS@bogus>
 <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>

On Mon, Jan 20, 2025 at 03:52:09PM +0100, Christian Marangi (Ansuel) wrote:
> Il giorno lun 20 gen 2025 alle ore 14:44 Sudeep Holla
> <sudeep.holla@arm.com> ha scritto:
> >
> > On Mon, Jan 20, 2025 at 02:37:19PM +0100, Christian Marangi (Ansuel) wrote:
> > > Il giorno lun 20 gen 2025 alle ore 14:34 Sudeep Holla
> > > <sudeep.holla@arm.com> ha scritto:
> > > >
> > > > On Mon, Jan 20, 2025 at 02:01:30PM +0100, Ulf Hansson wrote:
> > > > > + Sudeep,
> > > > >
> > > > > On Mon, 20 Jan 2025 at 11:37, Christian Marangi (Ansuel)
> > > > > <ansuelsmth@gmail.com> wrote:
> >
> > [...]
> >
> > > > > >
> > > > > > Mhhhh.... Any idea how to fix this? Maybe we have to exclude some flags?
> > > > > > Error is "error: write to reserved register 'R7'" and I guess it's very specific
> > > > > > to some kind of ARM ERRATA.
> > > > >
> > > > > I don't know to be honest. The arm-scmi transport driver
> > > > > (drivers/firmware/arm_scmi/transports/smc.c) is having similar calls
> > > > > with 9 parameters to arm_smccc_1_1_invoke(). Not sure why it's a
> > > > > problem here and not there?
> > > > >
> > > >
> > > > I think it is known issue and must be solved with the below patch if my
> > > > understanding is right.
> > > >
> > >
> > > If it's a known issue and affects also other use of smcc why we need
> > > specific fix in the driver makefile instead of a more generic one.
> > >
> >
> > IIUC, arm_smccc_1_1_invoke() is a macro which can be used anywhere.
> > There are reasons why we can't move it to a module and export it.
> >
> > > Do you have a link for the known issue?
> > >
> >
> > Nothing handy, but quick google search gave me this:
> > https://bugs.llvm.org/show_bug.cgi?id=45826
> >
> 
> If only these test report were easy to report instead of me having to build
> the massive llvm-20 dev version...
> 
> Any hint if anyone knows if precompiled cross tool are present around the web
> (with llvm-20?)

I can test it I guess as I have clang v20. Let me give it a go.

-- 
Regards,
Sudeep
