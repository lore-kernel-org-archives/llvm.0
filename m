Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843679;
	b=Rmc+CxZE/x1FUmZG4Izn05ZooNgQw/gZPILiAwUIBhHrFnmBcPOpihaoVm6TlaTa8xvD
	 ZZk+Ul/oDiZY4/WRYNhS0QDAVlkANNz467Or3yUAleZsJcHJsr5usi/zNXuoM4u9MZp5x
	 04jNFNCdBJUpAkmIzlERwqkf1rcU0sTrsAR3iuUgqNHljLkGbEf+6bxQyglooGy6h+UF8
	 COljwhLwmPo/eV82iKd2csUmGyjzdSn7dldv4gc2GIOslIVJchp+3XcUdYGL6NQvQKVpv
	 j7imcBs9MKIBnLr4tvrGjiP6duUK4yEfDxSbeMRlwJFTGTiEHihe3oEIxzsjZlfxhDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843679;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=KWR/J/J58+Atn/vMtZtNZ6y3lmKLITgM/1HsveMyy7o=;
	b=VOKsLARBHbzgHdrMzkAHuwfNCMeUuzyxOgZ47nFdOvQ4qjSmy1n1K31yOPvI/31wL7sU
	 j+9XNiexPkuTO6kPESpHNAStTm9SBl3saejf9yCFPks3x+WdSVC89dpOV/tKxuvlb5NL8
	 eduqTogytWJ7jeWKRPymq528lGPxrD5zAwPSA2lephJF88HzFvw/dy4k710mHaWspQWTl
	 jus7zIAjJcgKefnUAz8WFOaONbZlVcGEdnvuORnzh6D2dpFgtHgwME3sL6OLZjKWEqvIB
	 qBC5NAEFc461FSkq1rb4w3HtGYD0B7whSiV7pVQ6H2EGWHni7KFaaJ6OH0oZ4dbbMPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rx93tga+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B985B606A31C;
	Mon, 16 Nov 2026 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rx93tga+
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 192521F000C4;
	Mon, 16 Nov 2026 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843679;
	bh=KWR/J/J58+Atn/vMtZtNZ6y3lmKLITgM/1HsveMyy7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rx93tga+iEZqWtg3d0GphcFn91pO9fZ2kWQnjfyHDfXHcGN+h2rKcnZvDufLT01Gw
	 /laXOV5urbjZ9s3aucgOs1E62Sm5GAPzy9d1mAPYJum4fha+AR7FZTLm2ak1nQZxUL
	 n0IVlYF4SuPVlvqOIqJusMUGDrK6PqNpdqK82sGqrWF8iPmp0maZXBlokGx90ZtD9X
	 AfU0L+hVle+r8DbCH0mEwVX/5wIfakizj8nFw3WpiNSkKC3F926TILlkTxoZQGjA4A
	 TZmk9ByNFgMI5B4hJAKA1p6sYqLDMguFVtfZ+qjvQr09HcA8o5o/nucXHXGSVnFOVY
	 QroySXHMk9w4g==
Date: Mon, 16 Nov 2026 16:40:53 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 3784/7428]
 include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds.h'
 file not found
Message-ID: <avskBTulNo70xq-i@levanger>
References: <202611160947.NOrZmI1p-lkp@intel.com>
 <avroMXSm8hiG1W4N@monoceros>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avroMXSm8hiG1W4N@monoceros>

On Mon, Nov 16, 2026 at 12:28:24PM +0100, Uwe Kleine-König (The Capable Hub) wrote:
> On Mon, Nov 16, 2026 at 09:45:42AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
> > commit: cdfdbc11552b99dbc5c45c55f62a76527ffcc73d [3784/7428] Move struct cpu_feature to <linux/cpufeature.h>
> > config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261116/202611160947.NOrZmI1p-lkp@intel.com/config)
> > compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ca14e3d05c4e63d6e8103945c86b958ed2f55d5f)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160947.NOrZmI1p-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202611160947.NOrZmI1p-lkp@intel.com/
> > 
> > Note: the linux-next/master HEAD 84abb955b1015477aa11a96e2f3ac1b938b77f48 builds fine.
> >       It may have been fixed somewhere.
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from scripts/mod/devicetable-offsets.c:3:
> >    In file included from include/linux/cpufeature.h:30:
> >    In file included from arch/loongarch/include/asm/cpufeature.h:13:
> >    In file included from arch/loongarch/include/asm/elf.h:9:
> >    In file included from include/linux/fs.h:5:
> >    In file included from include/linux/fs/super.h:5:
> >    In file included from include/linux/fs/super_types.h:7:
> >    In file included from include/linux/list_lru.h:14:
> >    In file included from include/linux/xarray.h:16:
> >    In file included from include/linux/gfp.h:7:
> >    In file included from include/linux/mmzone.h:20:
> > >> include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds.h' file not found
> >        6 | #include <generated/bounds.h>
> >          |          ^~~~~~~~~~~~~~~~~~~~
> >    1 error generated.
> 
> This is the issue that Sasha Levin already reported and fixed in the
> thread about cdfdbc11552b99dbc5c45c55f62a76527ffcc73d, see
> https://lore.kernel.org/all/f610c07f39df15f3e7ebdc63bfcd759ca7a687a8.1794233316.git.sashal@kernel.org/.
> Nicolas claimed to have applied it already.
> 
> Best regards
> Uwe

yes, just re-checked: the fix is included in next-20261113 (commit 50ccc340081fd1e6cd175).



-- 
Nicolas
