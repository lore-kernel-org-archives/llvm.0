Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B492ED141
	for <llvm@lists.linux.dev>; Wed, 25 Feb 2026 21:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772055304; cv=none; b=COdoV8YJF48utikOmATXOGNRrOFGu2bjk55z63oHaHzwbNnp9qXM69gMynXhvAetcoms8Hrnooj9GCfg9JdTcnRHv4N5UrWzXKLXAbrVDpJoWpikFrH3zdx9hBggJs+hN54TK1me4P0S8lpx0Kry5S78wdFQDAH6wkMVI9LGxwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772055304; c=relaxed/simple;
	bh=Bf/KZHOSyjrfchLf1TkP1vhNwc6+8dsnnl9EQTuW7sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bg0TmU/XOIB8pD+MX4oLcEEwNwkB0XMaH5oYOCsoNbdtPqr+6aZs1FjXKB38modu/opv0qovHAz+VWfMdsQ0g45iT3sjQT3TLB0r9bdlLeby6nU3udUQvo4r2jHVtx2+S1e9n4Na4kANHKT5kDGHNJS6w64yQAJ4LxYK5M7HxDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqXb2aen; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqXb2aen"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B74C116D0;
	Wed, 25 Feb 2026 21:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772055304;
	bh=Bf/KZHOSyjrfchLf1TkP1vhNwc6+8dsnnl9EQTuW7sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqXb2aenkiPaYp1gJtTBwfuD317E/BSExbt6zNVu9/i42oA37W2o/+G5AqgrFv2Q1
	 jEc2r0q7NdT4dFLNKDOXdCnpZv+1gOVGLEAdtG+C8lV+LKd4dEcxiYfPQJ6J3iiq2s
	 jKO1StHCGSIGrMPovjoKoSYBgeOvsXDPfUQjKzXQTO2TlrkXMghUuyQvcY2izA9rdT
	 mTCcEb9kGhdlQ1jlef7efc7mE4cHlsJGythEgSnx+ZojwSU96HAPxphMrym4L8tzQG
	 J1kwU/BaR9Dr5qQUuIlCfDhz8ik0I9USAkAle9/BY1jAAjxfyP6MCcYlPufAM/FCIY
	 dO8imCdmgBiCA==
Date: Wed, 25 Feb 2026 14:35:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Aelin <aelin@mainlining.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: Failure to build with LLVM for the Wii
Message-ID: <20260225213500.GI2755225@ax162>
References: <aXs8sgAcci9FKKpx@luna>
 <20260129223136.GA1614447@ax162>
 <77cd40dd-bc40-4223-a5db-7eb514c13b78@mainlining.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77cd40dd-bc40-4223-a5db-7eb514c13b78@mainlining.org>

Hi Aelin,

On Wed, Feb 25, 2026 at 12:30:30AM +0100, Aelin wrote:
> On 1/29/26 11:31 PM, Nathan Chancellor wrote:
> > Hi Link,
> > 
> > On Thu, Jan 29, 2026 at 11:55:46AM +0100, Link Mauve wrote:
> > > I’m trying to build the kernel for the Nintendo Wii, using LLVM instead
> > > of gcc, in order to bring Rust support to this architecture (and also
> > > because my distribution doesn’t ship a cross-compiling gcc), but I get
> > > this build issue near the end:
> > > ```
> > > % make O=wii LLVM=1 ARCH=powerpc -j1
> > > make[1]: Entering directory '/home/linkmauve/dev/linux/wii'
> > >    GEN     Makefile
> > >    CALL    ../scripts/checksyscalls.sh
> > >    DESCEND objtool
> > >    INSTALL libsubcmd_headers
> > >    WRAP    arch/powerpc/boot/dtbImage.wii
> > > objcopy: Unable to recognise the format of the input file `vmlinux'
> > > make[3]: *** [../arch/powerpc/boot/Makefile:394: arch/powerpc/boot/dtbImage.wii] Error 1
> > > make[2]: *** [../arch/powerpc/Makefile:236: zImage] Error 2
> > > make[1]: *** [/home/linkmauve/dev/linux/Makefile:248: __sub-make] Error 2
> > > make[1]: Leaving directory '/home/linkmauve/dev/linux/wii'
> > > make: *** [Makefile:248: __sub-make] Error 2
> > > ```
> > > 
> > > I believe it should use $(OBJCOPY) instead of objcopy, which is set to
> > > llvm-objcopy, but couldn’t figure out where it is misconfigured.
> > > 
> > > Thanks for your help!
> > 
> > It is the arch/powerpc/boot/wrapper script:
> > 
> >    https://github.com/ClangBuiltLinux/linux/issues/1601
> > 
> > I have a WIP series from long ago that may be a good starting point for
> > getting something working but there were some errors I never got around
> > to solving before having to shelve it for other issues:
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git/log/?h=wip/llvm-1-powerpc-boot-wrapper
> > 
> > Maybe something I (or someone else) can get back to soon.
> > 
> > Cheers,
> > Nathan
> > 
> 
> Hi Nathan,
> 
> your last 3 patches on this branch do indeed fix the wrapper script for the
> cross-compilation with LLVM=1 ARCH=powerpc without CROSS_COMPILE set or GNU
> binutils in PATH. They look good to me! Would you be willing to submit them
> now without touching the VDSO? That part does not seem to be necessary to
> fix the wrapper script for this usecase, so it should strictly be an
> improvement. I'd also be happy to pick up your patches, send them and
> follow-up on feedback if you don't want to do it yourself.

Thanks a lot for testing. For the record, I submitted the vDSO parts
separately and it landed as

  4406b12214f6 ("powerpc/vdso: Link with ld.lld when requested")

so it can safely be ignored altogether.

I am a little busy with things at the moment so I am not sure how soon I
will be able to pick this up. I am more than happy to let you take over
from here if you have the time and energy to get it tested and
submitted now. You can either take full authorship or stick a
Co-developed-by on it, does not matter to me.

Cheers,
Nathan
