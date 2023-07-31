Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5A618AFE
	for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 15:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B003AC433C7;
	Mon, 31 Jul 2023 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690817104;
	bh=b/7Fe05WKwG0M42bAS5BOwWbbi7WV9a+iGyLYRkVUQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNW+bL/uYHE2JWf0LCvrTdnhK5Q1l7L+qhDG866ndkfwsQRpRSFUrnePESpXdJzW8
	 0CliiP1p1jHi4PwMj/RoS6k5hGr90+Eu+ZjU9dKJFNrRjysohLTf/I3FDyWtpqmwgX
	 B6j/a44iWhZetmIsRZJTFzmL8ICmVsja7Qp3FRqyJzQQMpa4V4mwGTkI3Ck5z4lm7M
	 MlwHQN+mn8aBy9WwpP0AQpbZGuEY0WrdMMnlWDrWbnBgfYZkhZcy1PefJz8amVVLVJ
	 T3cfCKs+t2hPjMT4IOjgo5Xsv6SJKnRBjo9NEO3A+VmyC2whkOMsArHFcFvG+2y+9H
	 Reez8A4zfWyKQ==
Date: Mon, 31 Jul 2023 16:24:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Bin Meng <bmeng@tinylab.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230731-legume-commend-9aafd84c1fb2@spud>
References: <20230731095534.22842-1-xingmingzheng@iscas.ac.cn>
 <20230731150511.38140-1-xingmingzheng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8nQFqdF5+7E1em9C"
Content-Disposition: inline
In-Reply-To: <20230731150511.38140-1-xingmingzheng@iscas.ac.cn>


--8nQFqdF5+7E1em9C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 11:05:11PM +0800, Mingzheng Xing wrote:
> Binutils-2.38 and GCC-12.1.0 bumped[0][1] the default ISA spec to the new=
er
> 20191213 version which moves some instructions from the I extension to the
> Zicsr and Zifencei extensions. So if one of the binutils and GCC exceeds
> that version, we should explicitly specifying Zicsr and Zifencei via -mar=
ch
> to cope with the new changes. but this only occurs when binutils >=3D 2.36
> and GCC >=3D 11.1.0. It's a different story when binutils < 2.36.
>=20
> binutils-2.36 supports the Zifencei extension[2] and splits Zifencei and
> Zicsr from I[3]. GCC-11.1.0 is particular[4] because it add support Zicsr
> and Zifencei extension for -march. binutils-2.35 does not support the
> Zifencei extension, and does not need to specify Zicsr and Zifencei when
> working with GCC >=3D 12.1.0.
>=20
> To make our lives easier, let's relax the check to binutils >=3D 2.36 in
> CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI. For the other two cases,
> where clang < 17 or GCC < 11.1.0, we will deal with them in
> CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
>=20
> For more information, please refer to:
> commit 6df2a016c0c8 ("riscv: fix build with binutils 2.38")
> commit e89c2e815e76 ("riscv: Handle zicsr/zifencei issues between clang a=
nd binutils")
> Link: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Daed=
44286efa8ae8717a77d94b51ac3614e2ca6dc [0]
> Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D98416dbb0a62579=
d4a7a4a76bab51b5b52fec2cd [1]
> Link: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D5a1=
b31e1e1cee6e9f1c92abff59cdcfff0dddf30 [2]
> Link: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D729=
a53530e86972d1143553a415db34e6e01d5d2 [3]
> Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Db03be74bad08c38=
2da47e048007a78fa3fb4ef49 [4]
> Link: https://lore.kernel.org/all/20230308220842.1231003-1-conor@kernel.o=
rg
> Link: https://lore.kernel.org/all/20230223220546.52879-1-conor@kernel.org
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>

This looks good to me now, thanks! Hopefully the next time we look at
this code is removing support for binutils 2.35 :)
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--8nQFqdF5+7E1em9C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMfSSwAKCRB4tDGHoIJi
0h17AP0RaAf1KDe+rX4aWa4HU7h1z/Yb/aul3MMGUlMHfSAj/wD5AYaNpIZ8Jt5K
03nWmkMLCoFDMOue6iyN/7jhT7nSkgI=
=M9Cb
-----END PGP SIGNATURE-----

--8nQFqdF5+7E1em9C--
