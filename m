Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F0E1EEA42;
	Tue, 11 Mar 2025 21:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741729426; cv=none; b=IdlOgppRJMqGuXzFk1xiPzCME7rjFb2KGN8/oY4LgzjMRh131kJh0SG0JZ4RKZ0ZYRrlHihyTkwqDshClOGTBha23J2lji0OW2zW1lbgAJCtyeIixb5gz9bLNm82s6V4+g4X/OJ0insfJilKhbcOmCalkdATMp9ml6cGsmhUBrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741729426; c=relaxed/simple;
	bh=ijvPDI25+f5vFqJaUod9ZhMMdBMSYwENra/eITwStdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvVz/sQGebMNrgDx0rXSTXSfsiy0OqvCMNiwv4pdBEuOztVHTNeBzUNMWdSrAD1/l6XmmFQGwWTODRgO8dIWAMkPIvkfHut74akyoO8HW+rJYAPeLEbVfDhQHzYYj/pkWBhmXEPUqx5G4LezX4zb1dXMS4+OQviFlOIFIee23yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUvIcAzL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUvIcAzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDCAC4CEEA;
	Tue, 11 Mar 2025 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741729426;
	bh=ijvPDI25+f5vFqJaUod9ZhMMdBMSYwENra/eITwStdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUvIcAzLQPU31OoXnEiinr50SzO5JmGpdo4161RJyYLh79V1a7zqlDZyLpcsQrAv1
	 klaq4r+mEdWHerpC5SICpqPHp+6DlO60P4qNzZrv1FgMCiy27iL7kBYi0chi/f6MS7
	 JWwaFhZ7kbIpSHJmnaQq1wLPIsN0AytLb3NXbrb49Twu3Dm61pzpsNY1K0vONwMDZb
	 7a+On/zq0HZTh7sKLvLs4BLcjDIkpqL5EImzlN4ttR4q2oTagw5WK7qgPu2OfYL5HU
	 L7QKvaaFEIaYkzik8F/15Xl5TMSmxOfwNiNc/Ujmd8u+l26qqkDk6Lw07JL5y9NLPc
	 VJjVdCv7HTYDg==
Date: Tue, 11 Mar 2025 22:43:42 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [thomas-weissschuh:b4/module-hashes 9/9] llvm-objcopy: error:
 '.tmp_module_hashes.o': The file was not recognized as a valid object file
Message-ID: <20250311214342.GA2198051@ax162>
References: <202503112010.RsM1bgi6-lkp@intel.com>
 <20250311194940.GA1966726@ax162>
 <d7ec6ad2-70ad-4c0f-bfff-6119779d65e2@t-8ch.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7ec6ad2-70ad-4c0f-bfff-6119779d65e2@t-8ch.de>

On Tue, Mar 11, 2025 at 09:58:06PM +0100, Thomas Weißschuh wrote:
> Hi Nathan,
> 
> On 2025-03-11 20:49:40+0100, Nathan Chancellor wrote:
> > On Tue, Mar 11, 2025 at 08:14:14PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/module-hashes
> > > head:   8ab7849599f74e8492224b62d852cd9affecea7c
> > > commit: 8ab7849599f74e8492224b62d852cd9affecea7c [9/9] module: Introduce hash-based integrity checking
> > > config: x86_64-randconfig-005-20250311 (https://download.01.org/0day-ci/archive/20250311/202503112010.RsM1bgi6-lkp@intel.com/config)
> > > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503112010.RsM1bgi6-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202503112010.RsM1bgi6-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> llvm-objcopy: error: '.tmp_module_hashes.o': The file was not recognized as a valid object file
> > 
> > I suspect this happens because LTO is enabled for this configuration (so
> > -flto will be in KBUILD_CFLAGS), which generates an LLVM bitcode object
> > file instead of an ELF one.
> 
> Thanks for the hint!
> 
> The following diff seems to fix the issue and quick testing indicates
> that it should work with the different supported compilers.
> Any objections?

Nope, I think that should work fine.

> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 2add7eb950a0..f8d87a2ae74b 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -324,7 +324,7 @@ if is_enabled CONFIG_MODULE_HASHES; then
>         ${srctree}/scripts/module-hashes.sh > .tmp_module_hashes.c
>         info CC ${module_hashes_o}
>         ${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} ${KBUILD_CFLAGS} \
> -               ${KBUILD_CFLAGS_KERNEL} -c -o "${module_hashes_o}" ".tmp_module_hashes.c"
> +               ${KBUILD_CFLAGS_KERNEL} -fno-lto -c -o "${module_hashes_o}" ".tmp_module_hashes.c"
>         ${OBJCOPY} --dump-section .module_hashes=.tmp_module_hashes.bin ${module_hashes_o}
>         ${OBJCOPY} --update-section .module_hashes=.tmp_module_hashes.bin vmlinux
>  fi
