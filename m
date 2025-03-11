Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC67F23F378;
	Tue, 11 Mar 2025 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726691; cv=none; b=p49OGKAg8+oucZujS8AI5IcZoLOQ4kEYWhHqiCgmaq3WsZWBTfwyw17fwyJsr54wf5ZrN7X3zpslr+XfpIfVh7ZsadVgNjdV706y8JLbo94AMhOAaHXbTQ9NXz5VVifUnehJ4V27JYbXmb4tQkwoxdNiup2YpFh8QysqGBf9z00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726691; c=relaxed/simple;
	bh=Ld2KwSNW+IXaMuDN/QT9TrO1OJVJJgklSBJ4hDGO1mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaDkUl1ea15RAuNEauiQGni3Ykc5lIFg+eYzzjMdtOIpHdfvVJIw6jgom9iFiVcwMN/ehhLvTlH+out+y4pONO4b7yVtlKTfpB4KBHl7L74vBLZxrP7HI5jPjDT6YDq/CmSl4tHQDTJ7PP9tDTgzqNUMso+6iLAN0EInrHptFdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nVogI8vT; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nVogI8vT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741726686;
	bh=Ld2KwSNW+IXaMuDN/QT9TrO1OJVJJgklSBJ4hDGO1mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVogI8vT5EwRIx90WK2rmGBj+6NQYsNUku16NNrRt2krhcIanpLXalIIpTw+y47rb
	 G+0dlHi+eqTzsh3EcygM2E7AtezY11bpfq5r2WHV/egNcZuGw5ahAI6zlB5FrPLJUo
	 iGtucErOL2t6CDjMsQJsAHZXnHBVmcLB4/Hz0L2Y=
Date: Tue, 11 Mar 2025 21:58:06 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [thomas-weissschuh:b4/module-hashes 9/9] llvm-objcopy: error:
 '.tmp_module_hashes.o': The file was not recognized as a valid object file
Message-ID: <d7ec6ad2-70ad-4c0f-bfff-6119779d65e2@t-8ch.de>
References: <202503112010.RsM1bgi6-lkp@intel.com>
 <20250311194940.GA1966726@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311194940.GA1966726@ax162>

Hi Nathan,

On 2025-03-11 20:49:40+0100, Nathan Chancellor wrote:
> On Tue, Mar 11, 2025 at 08:14:14PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/module-hashes
> > head:   8ab7849599f74e8492224b62d852cd9affecea7c
> > commit: 8ab7849599f74e8492224b62d852cd9affecea7c [9/9] module: Introduce hash-based integrity checking
> > config: x86_64-randconfig-005-20250311 (https://download.01.org/0day-ci/archive/20250311/202503112010.RsM1bgi6-lkp@intel.com/config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503112010.RsM1bgi6-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202503112010.RsM1bgi6-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> llvm-objcopy: error: '.tmp_module_hashes.o': The file was not recognized as a valid object file
> 
> I suspect this happens because LTO is enabled for this configuration (so
> -flto will be in KBUILD_CFLAGS), which generates an LLVM bitcode object
> file instead of an ELF one.

Thanks for the hint!

The following diff seems to fix the issue and quick testing indicates
that it should work with the different supported compilers.
Any objections?

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 2add7eb950a0..f8d87a2ae74b 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -324,7 +324,7 @@ if is_enabled CONFIG_MODULE_HASHES; then
        ${srctree}/scripts/module-hashes.sh > .tmp_module_hashes.c
        info CC ${module_hashes_o}
        ${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} ${KBUILD_CFLAGS} \
-               ${KBUILD_CFLAGS_KERNEL} -c -o "${module_hashes_o}" ".tmp_module_hashes.c"
+               ${KBUILD_CFLAGS_KERNEL} -fno-lto -c -o "${module_hashes_o}" ".tmp_module_hashes.c"
        ${OBJCOPY} --dump-section .module_hashes=.tmp_module_hashes.bin ${module_hashes_o}
        ${OBJCOPY} --update-section .module_hashes=.tmp_module_hashes.bin vmlinux
 fi
