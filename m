Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC40221552;
	Thu,  8 May 2025 17:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746725958; cv=none; b=B2siNl7FrGHa/wwPAq/oDRWF0oBSoKQhjUN6xrYxY3NgJyjtmpfUKd6WMTk3POtfNykQTIv+ocSujFIJ3hZBGy+JteWgRue8FAV5/inoVnfe7wNDtzlk7q3uGLIgQImnF0LJdP/kcSCD3W9BNqD9PScJdvpwnAQYeDqjPFPqMAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746725958; c=relaxed/simple;
	bh=O0vxdPMXmOnpVMGcrS3CrblpOJWCHSix4t6bt9B5k80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wh5mrXz8/ALFmdCHdJLORihNvfP++ZXerlHBx48Lg/7PxOdfxcUD9Ut/2lZOKTzItloNnLLJLZs3BuYKS4zlItOoXF3vu4xuOryDQhd60gPtYRl8+TVj8bSm2iBXl+I+YaN7f7Ch2hawkNdD85uTq3vy6sfn0/ymneSGPVm+t1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsOhm/96; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsOhm/96"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368D4C4CEE7;
	Thu,  8 May 2025 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746725958;
	bh=O0vxdPMXmOnpVMGcrS3CrblpOJWCHSix4t6bt9B5k80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AsOhm/963edzjEVJJYHyGeK9aI3vN0vdNoBN4aWCYlGju/Ve9qdnfG4kZb8oaXhVw
	 vV8hZK6iwC/zIKE9udfUFS3Ip2Vk7GO48Vvt40w8AI8XHFM4WblFdjd5pMmKyjTA1J
	 E0MrEcMHrCbky0tslppqioMDte1ii6lsRDFIDzQA/tmXin6qmOqd1e2fQual8PYLeJ
	 adlsnctwOxSqSgdAboLzJHOpznY/pacU355rLR9JjmlbGNX3YTymfSXjRbonXPa+zf
	 zwj4KyeMF5bmZLKFqSn5JrJmk5tq8RpJ91ldFkqVOYTLrLBeqc7NGhqWfXuLyzuKMZ
	 tpzr4+qtC+Erg==
Date: Thu, 8 May 2025 18:39:14 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [ardb:for-kernelci 15/18]
 arch/x86/boot/startup/sev-startup.c:141:15: error: '__section__' attribute
 only applies to functions, global variables, Objective-C methods, and
 Objective-C properties
Message-ID: <20250508173914.GA2060049@ax162>
References: <202505090001.FS7smjqJ-lkp@intel.com>
 <CAMj1kXEnn0T3zCTq=b8OE0aYB6=ZQ+9p8GK_dxUyD+81d8jYHg@mail.gmail.com>
 <20250508165710.GA2787919@ax162>
 <CAMj1kXGQNyHw57bp-iHU0qgYBKwBS1SSJbq5X9BQkCvKLJFyrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGQNyHw57bp-iHU0qgYBKwBS1SSJbq5X9BQkCvKLJFyrw@mail.gmail.com>

On Thu, May 08, 2025 at 07:22:14PM +0200, Ard Biesheuvel wrote:
> > > > >> arch/x86/boot/startup/sev-startup.c:141:15: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
> > > >      141 | static struct __init cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
> > > >          |               ^
> >
> > I think this should should be
> >
> >   static __init struct cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
> >
> > or
> >
> >   static struct cc_blob_sev_info __init *find_cc_blob(struct boot_params *bp)
> >
> > The __init is splitting the return type.
> >
> 
> Ah oops.
> 
> Now I'm surprised it even worked at all with GCC.

Yeah, you are not the first one to wonder that either :)

https://lore.kernel.org/CAHk-=wgf+kHeSZbpkZumWcTXUD7ordqTMvPRNL6aQVG1DSBDnQ@mail.gmail.com/
