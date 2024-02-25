Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631CAFC12;
	Sun, 25 Feb 2024 11:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708858819; cv=none; b=auZOe1b6zh1fHAoexKp/XSVrIzBABfi+RzWekndQHIZsAF3B/4O5FDlWkv6jvxr7ukkm34YDTZzZDeQMhgFTDNn9GWYyXnrj9s2/DCvlSPGfSIsaTsTlBOBnzUSoF4kM81OmWNdu+EI6w8jQJvTB4dKp88haB4kH87LKDCs7108=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708858819; c=relaxed/simple;
	bh=TPnI/WXNcCMmfeVmKUsm0OY7YgLbHSON3ORAZy8zLpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bOdXGdDRJAfGxsHXbXuN2jNSWqOfw4iPGjchHDHM3VkgPNfPGRJXG1ECBpj3dofCsCI9E4NuF+kKYdYEYk8Ye8CTuU5GZnJXndlkYUOQx9aSF3ANbWBvEgEL9ln/LEFxcx4DmrJmdlOTbmZUUne4fXgAgSgJrXe+Sr4MBckHCf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uvRtF3ux; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eCRyDIMn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uvRtF3ux";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eCRyDIMn"
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708858816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v/LyU8Ry/UGsRwRJP9YwVxnQ0z7yS85JFQaGyTFGP5k=;
	b=uvRtF3uxTxZMc5ILzUBLwDI6DXoMDLB/ALL6Wkce2o+ysEJflb2SatMwpV085sm4dkxnbe
	wHPJZmM12mBbY0nkSFJ3k+h7ETXwZ3aABEqlGeOvZyaBPldO9lxGRc0VjA7USqeaWQds+c
	7OTDML88iQ6of+YmiErHdCKFX4O9OPfksYVymRyL1zPx2ues19smO8Gv2FcBkfEgSRruGt
	YrYaW1nhQIR5fimySDAUsVJfFm8eBpIpJUAI0X4vSF6ryjmae68r+ullKKd8Lb62FVnGAl
	Tj0OVwltK2t2G8h8/ioWGeq1p+GVpGxh+IqUZ6NwHuNEaq2ihvhgEcHwRmJCfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708858816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v/LyU8Ry/UGsRwRJP9YwVxnQ0z7yS85JFQaGyTFGP5k=;
	b=eCRyDIMnzLnsvvYZYqG6eVSNkiP2BIHdUqr5meGHabRcPwSMoAmKPg7dEOxceflEMiOmrK
	ihu3/La28C2TV0Aw==
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: Re: [linux-next:master 6213/9575] igc_leds.c:undefined reference to
 `devm_led_classdev_register_ext'
In-Reply-To: <202402241123.p7RgyuiU-lkp@intel.com>
References: <202402241123.p7RgyuiU-lkp@intel.com>
Date: Sun, 25 Feb 2024 12:00:14 +0100
Message-ID: <87sf1g7qrl.fsf@kurt.kurt.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Hello,

On Sat Feb 24 2024, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   33e1d31873f87d119e5120b88cd350efa68ef276
> commit: ea578703b03d5d651b091c39f717dc829155b520 [6213/9575] igc: Add support for LEDs on i225/i226
> config: um-randconfig-001-20240223 (https://download.01.org/0day-ci/archive/20240224/202402241123.p7RgyuiU-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241123.p7RgyuiU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402241123.p7RgyuiU-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
>    /usr/bin/ld: drivers/net/ethernet/intel/igc/igc_leds.o: in function `igc_led_setup':
>>> igc_leds.c:(.text+0x173): undefined reference to `devm_led_classdev_register_ext'
>    clang-16: error: linker command failed with exit code 1 (use -v to see invocation)

This is fixed by:

 https://lore.kernel.org/netdev/20240222100324.453272-1-arnd@kernel.org/

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmXbHb4THGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzghtQD/40fpCaCWYnxm6uD2U2aoh43TdDt4En
B3vw0O7z1nciJP89Vom1lt9YfMNZ34OBrgr5VWbO8s9aL8MBFluJG2yx3RaT6JhW
cxXHqXPFZ0anCdf4nx3KhlyJF/kGY3G2Wxf7dLWgKfPPjpAtW/8yFW9ijZ0DK7R2
cVw43HUMO4/sIB1FlEanGMwj+oZQupAo9NXhdyw4ajXUj8YUmL8mObvaMfF3FGkd
yep07Bjod0pXIFgZ1lvV9FgJK9rkwj09MA73yrWPYSWiCYQ5w7KzSY6DDntD3gWm
5IXdEqF+T4peB7CMVREBS92p+TdxZ1iEaHOlsCJoyPHq9RmuHLxr75FA9q76Nwd7
xVhuwl5HkcQSFLDmuESZqcVVE12NbMRa00M3r2aQXFVNxq3rVfgmLhf0KMk0yavG
T2wfiXrd1OC0kVgO5/hIy0NTxH+MCDgG6SOK78qBaPiQnpyy7Qd4DedVu0X/Q49t
UAONIrEWjkFTgJ/AZNQfrRAqHB4oAufjwpvKc2sV+Xxb1wh5fx6ksHtg1D6HRn3r
5ZLnmwL+6HzpVa2YfMgO2u7gEZYv2/DSQNZ3fU+hqvzNOviRBfwX4EdDmRT0K/Vy
7ALUDrUEr1uIyz010jnEsoPEbdQx5iHkJNv/VPYqkwy2w2MP/i2UhtqoHJTliPoy
0hh7uQxWakchAw==
=BSeT
-----END PGP SIGNATURE-----
--=-=-=--
