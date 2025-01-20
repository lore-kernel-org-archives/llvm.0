Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE9C1E411D;
	Mon, 20 Jan 2025 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387197; cv=none; b=fF84YysbcCHcwXLc3gv6hk71TyHCsxFoX57Z6t+QKLgp6/RJ6XRmSXpnz+QFrCp7Zj++XUiBulsVTrt6pOTYcWWf3soEk4Ct1KaTbeSWEVFdTw2fvypq3MQVuODSP88o2Um7s+eA0/rw0r26BrWgKFrw0OfxRaIajDBKs82PtCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387197; c=relaxed/simple;
	bh=m1OC/is8MdvW0hiuc0duoIuZRdMBZsNMUXgoT5/DSog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auZxqz4EMiMG2fHn/2wdKvQIozPGLeySqW9ZZOTielq7NBUjNBv+A1/9Aijb5VAkROY9WB8kTpFRkEX38KiOMAVi204Nro3n/1cL1d9FEWdGMOR/Qq3nLNuKyW4FpFnQm3jCk83qhZivSQ9Q3lMBMo88ujJNslPqwjqyYGFK5HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08ED31063;
	Mon, 20 Jan 2025 07:33:42 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CC4E3F740;
	Mon, 20 Jan 2025 07:33:12 -0800 (PST)
Date: Mon, 20 Jan 2025 15:33:09 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 9185/10024]
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to
 reserved register 'R7'
Message-ID: <Z45std0KhXOKChHX@bogus>
References: <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
 <Z45Q9zJ8mvE_ut2R@bogus>
 <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
 <Z45TSqieqbzufJWS@bogus>
 <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>
 <Z45mOFHZM75VLZ-g@bogus>
 <CA+_ehUwnWdi7bG-Dzc3iv=VTA8bwEpRXP9_iQVOb5=uDqqrRRw@mail.gmail.com>
 <CA+_ehUyVH5r5LK5B2tKZgH_dR69OVaV-ES7+GPShNuJCWEXHVA@mail.gmail.com>
 <CA+_ehUx1j=Tu4zztxsXvmiMmxXt=tWx2G74p10bgWvMWkK-PFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUx1j=Tu4zztxsXvmiMmxXt=tWx2G74p10bgWvMWkK-PFg@mail.gmail.com>

On Mon, Jan 20, 2025 at 04:31:00PM +0100, Christian Marangi (Ansuel) wrote:
> Il giorno lun 20 gen 2025 alle ore 16:28 Christian Marangi (Ansuel)
> <ansuelsmth@gmail.com> ha scritto:
> 
> Actually sorry for the mail spam... Since this is already done I will follow
> how it's done for drivers/firmware/arm_scmi/transports/Makefile
> 

And in arch/arm/mach-bcm/Makefile and may be others.

> Creating the patch that fix this. Thanks a lot for the hint and suggestion
> Sudeep Holla.

You are welcome.

--
Regards,
Sudeep
