Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A69686340;
	Wed,  5 Mar 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169399; cv=none; b=tTevtl1BPPZPy8cuuOOO833YHRPwaA2T7Y9qFCUyLZj8F77WMmKcmEv0SQbZw4Xa47Va9yHAxZEPp8wEh1UZIcdyuvdIbRBzVO/eV3PlAGyTCFhHlHzMOcU88TsHL40dD+GCi2cLBNgyS7bIzmDs+SZBtpXG/QT7yqljJQKimIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169399; c=relaxed/simple;
	bh=JfQ0SutbZskY9uqbYKs9uq8KWISLob0b6vkzdB/aMyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iuaGT6968ML5rEva7wqjPlTdmNC3CWAj+Af0bLUDEBlW08UDhDvNWa59BLO+fhGgXGJ5AW/6C2SrTHup2tbU+jCKkW5dlqgyBsQasVPTmSg/G2AOGHUdn0xjbmmK8sAlX7o3giRF5p4iQve7+JDvsrUuGucNp2jjBZhiQWxHUXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=hQuZ3GIp; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="hQuZ3GIp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9Z5i51/S6gqh576NW6zVOQKtK+1wAsvv9vzPvbq141I=; b=hQuZ3GIpowwBefnPXax2Ag0u15
	Usqe0T8Z/CK1jn/tBFaek3RU3HaWDTg9qqYBlblAwof9HBrqbGVFuoVUJU8Lz6Fj4PrXnf3e2IyCQ
	LrPZyFeQ+YW3SalvGnWFV9oYU3BAcXwKl76524FRktVisvi0OvKG2OfKfel08j1b+GIjsSHG+fXle
	agJxLCNLzvDouy25y4oUhv49GcLGDoUecEQYKHGPmhV02NuHyiUWKe/EPGhgtGWK40TdcJJsXI9l+
	bSymW6sZx0C8gzOCnyLG55m+fT9TmGcWeN0/BLnUEekDbuw/eK4LHoSJt8yXaeN3jiatzq6i92oyd
	O+ORibeA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tplhE-0001U4-J6; Wed, 05 Mar 2025 11:09:48 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject:
 Re: [linux-next:master 7259/7930]
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:833:7: error: call to undeclared
 function 'FIELD_PREP';
 ISO C99 and later do not support implicit function declarations
Date: Wed, 05 Mar 2025 11:09:47 +0100
Message-ID: <2901085.jE0xQCEvom@diego>
In-Reply-To: <202503051744.a44mn4cM-lkp@intel.com>
References: <202503051744.a44mn4cM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 5. M=C3=A4rz 2025, 10:26:57 MEZ schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   20d5c66e1810e6e8805ec0d01373afb2dba9f51a
> commit: 328e6885996ca2c6eb8b07d3c9bb1439fdcb088f [7259/7930] drm/rockchip=
: vop2: Add platform specific callback
> config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/202=
50305/202503051744.a44mn4cM-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250305/202503051744.a44mn4cM-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503051744.a44mn4cM-lkp=
@intel.com/
>=20
> Note: the linux-next/master HEAD 20d5c66e1810e6e8805ec0d01373afb2dba9f51a=
 builds fine.
>       It may have been fixed somewhere.

correct ... the fixing commit is
95a5c9d197bb ("drm/rockchip: vop2: add missing bitfield.h include")

https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3D95a5c9d197bb22a506913acb330a926d4e51aa95


