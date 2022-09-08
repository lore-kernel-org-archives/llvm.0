Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4F43C0F
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 15:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9F0C433D6;
	Thu,  8 Sep 2022 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662650004;
	bh=kg8EYWKbE1qgUWUXPaaZYkhecZ8N5hbQ5N38fU0O5aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1QOAxVPoj8RhLF+31tBe/Ec4Ih2LGREaYVgyVC+lrSF+cOAKc4rAQhmuSsZAsj2B
	 tCuJpcGkgH7uD1omcbHj4I4/LAswO6YCLAuJTiU1jCzhDDovL/BegoLiP8HYA3XKeL
	 mFIGZ70rfOpWbhzdmF8zPJviZQFoXeYoFDmBCjO5DICqs3YxERYL+4U5Lj9gtWK9YM
	 6uvDBX0C0r75G4N6rwQ3iBMtV4Zf537B0papVR/Z0RqcMKm5AS4FdQfKerZ3OqQ1nD
	 2sWByy0Lp7T1RVOfvvcPsD3IsAG2KPNUjCrkqCeZAalzyzKH0wEEdTjLWSUQd0CVTn
	 5htMA5srhVAiw==
Date: Thu, 8 Sep 2022 08:13:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
	llvm@lists.linux.dev
Subject: Re: [arm-integrator:virt-to-pfn-v6.0-rc1 21/24] ld.lld: error:
 arch/powerpc/kernel/vdso/vdso32.lds:244: unknown directive: static
Message-ID: <YxoGkuNPskaWQgFE@dev-arch.thelio-3990X>
References: <202209032354.b0SHaeQe-lkp@intel.com>
 <YxdcIGcQ+fB9G2qN@dev-arch.thelio-3990X>
 <CACRpkdZ29j9rzv5XkKvSKw-o4nzL7oAPdhhpfbOBTqPiSC9KUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ29j9rzv5XkKvSKw-o4nzL7oAPdhhpfbOBTqPiSC9KUg@mail.gmail.com>

On Thu, Sep 08, 2022 at 02:28:49PM +0200, Linus Walleij wrote:
> On Tue, Sep 6, 2022 at 4:41 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > + Linus
> >
> > This shouldn't be clang/ld.lld specific
> 
> Hmmmm dunno if it is related to the compiler, I have fixed up the patches
> I am working on in this branch and pushed it again. Maybe I fixed something
> about the powerpc, don't remember.
> 
> I am essentially using the build robot as compile farm, I don't have the
> resources or time to keep all crosscompilers around neither machinery
> to do all these compiles...

With your latest branch:

$ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- mrproper powernv_defconfig arch/powerpc/kernel/vdso/
/usr/bin/powerpc64le-linux-gnu-ld:arch/powerpc/kernel/vdso/vdso64.lds:247: syntax error

It doesn't look like you surrounded virt_to_pfn() with an
'#ifndef __ASSEMBLY__', which will break inclusion of this file in
non-assembly sources (linker script is considered assembly for the sake
of preprocessing).

Cheers,
Nathan
