Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFD33C0619
	for <llvm@lists.linux.dev>; Fri,  4 Sep 2026 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538277; cv=none; b=QV4ZlSKesRE2Aa0QO1gLUb3lzF961B2PUnxQjMGwv3qxdB1439ZgnBWDwOhuaEkRQS8oh06icbg2ZHzYvrvkf/7zJzuVyhx4WgnJNygkSWvmu6y2i87PePfyMH5aMK243i0dKNqeVLMCttdQ2v3AJVLmvVFYjL5WXT9/HJme3aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538277; c=relaxed/simple;
	bh=nnYs7e/Qa7TDSZX25IfmO66KGD1Y+331y3LUTS2+Uf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thSwPaC79d4vOFJswc5PCIAUbJrIT+T97nWT7cOgANVo2JOoN0Kbn/kiSBsBEynZcjo6mV3qbK1G6lZeuadiIalPcqnXAbMOBwArM2SBy3kz6S20ahJwLtMN0oBYQ9uM+2nilQI2IIhX/xEZi1k0z+FumyC2vq6p7OLVv5xJvmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=iwDQcXKk; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="iwDQcXKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1788538264; bh=nnYs7e/Qa7TDSZX25IfmO66KGD1Y+331y3LUTS2+Uf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwDQcXKkIzBA62Kc3FhTrk8ibEggseUPiDD43/WYiDcK8AwUiq0ioXSUG7YR3c2CP
	 eu2B/uxRQk7Tlvz7YnF6wo6X8uiqkE8ZOPNlHINKHdgcdJY007eUMBn5a8zzK178nL
	 DbE7D5FuOIdb0xIpNJYs4NFsQV6UQEe50HqTl9ZFH8MBdh8JbeDjx1csW5w4MpzDVh
	 +OTenYd9j+iKOaQssLW/G1NVq/0kl92MXnrZyDmm+oixae9njnC2AhoPuhMhiGahLP
	 oni3hOVQYtbMq1jOSroMH31TZgGn+NGv/t9Jt4qI0dU5ym58oLk2CxkOzizJxf2Pyv
	 4b/cuy25tl8AA==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a9aed98-c6f5-7f0000032729-7f00000184b0-1
	for <multiple-recipients>; Fri, 04 Sep 2026 18:11:04 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri,  4 Sep 2026 18:11:04 +0200 (CEST)
Date: Fri, 4 Sep 2026 18:11:03 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] v2 Docs: changes.rst: introduce optional column
Message-ID: <20260904-stirring-zircon-frog-ea6949@l-nschier-aarch64>
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
 <20260831152523.638881-1-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3LI1LwzTwlfX5+ls"
Content-Disposition: inline
In-Reply-To: <20260831152523.638881-1-manuelebnerli@mailbox.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1788538264-00C33ADA-3F2AC763/0/0
X-purgate-type: clean
X-purgate-size: 7767
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 65769A026E  external: no


--3LI1LwzTwlfX5+ls
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 05:25:22PM +0200, Manuel Ebner wrote:
> The optional tag isn't obvious nor defined. Therefore replace with column.

Why do you throw away the 'Command to check the version' column?  At=20
work, we have a script that uses these commands to check the actual=20
tooling versions.

If there is a reason for change, please document it in the commit=20
message.

>=20
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/process/changes.rst | 84 +++++++++++++++----------------
>  1 file changed, 42 insertions(+), 42 deletions(-)
>=20
> diff --git a/Documentation/process/changes.rst b/Documentation/process/ch=
anges.rst
> index b3fa980b63e3..905ac0f6cdc5 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -29,49 +29,49 @@ systems; obviously, if you don't have any PC Card har=
dware, for example,
>  you probably do not need to concern yourself with pcmciautils.
> =20
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> -        Program        Minimal version       Command to check the version
> +        Program        Minimal version  Required for=20

Do you want to align the column headers to the left or center them?

>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> -bash                   4.2              bash --version
> -bc                     1.06.95          bc --version
> -bindgen (optional)     0.71.1           bindgen --version
> -binutils               2.30             ld -v
> -bison                  2.0              bison --version
> -btrfs-progs            0.18             btrfs --version
> -Clang/LLVM (optional)  17.0.1           clang --version
> -e2fsprogs              1.41.4           e2fsck -V
> -flex                   2.5.35           flex --version
> -gdb                    7.2              gdb --version
> -genisoimage            1.1.11           genisoimage --version
> -GNU awk (optional)     5.1.0            gawk --version
> -GNU C                  8.1              gcc --version
> -GNU make               4.0              make --version
> -GNU tar                1.28             tar --version
> -GRUB                   0.93             grub --version || grub-install -=
-version
> -gtags (optional)       6.6.5            gtags --version
> -iproute2               6.14.0           ip -V
> -iptables               1.4.2            iptables -V
> -jfsutils               1.1.3            fsck.jfs -V
> -kmod                   13               kmod -V
> -liblzma                5.8.1            lzma -V
> -lzop                   1.04             lzop -V
> -mcelog                 0.6              mcelog --version
> -mkimage (optional)     2017.01          mkimage --version
> -mtools                 4.0.49           mtools -V
> -nfs-utils              1.0.5            showmount --version
> -openssl & libcrypto    1.0.0            openssl version
> -pahole                 1.26             pahole --version
> -pcmciautils            004              pccardctl -V
> -PPP                    2.4.0            pppd --version
> -procps                 3.2.0            ps --version
> -Python                 3.9.x            python3 --version
> -quota-tools            3.09             quota -V
> -Rust (optional)        1.85.0           rustc --version
> -Sphinx\ [#f1]_         3.4.3            sphinx-build --version
> -squashfs-tools         4.0              mksquashfs -version
> -syslinux               6.04             syslinux --version
> -udev                   081              udevadm --version
> -util-linux             2.10o            mount --version
> -xfsprogs               2.6.0            xfs_db -V
> +bash                   4.2             =20
> +bc                     1.06.95         =20
> +bindgen                0.71.1           generate Rust bindings
> +binutils               2.30            =20
> +bison                  2.0             =20
> +btrfs-progs            0.18            =20
> +Clang/LLVM             17.0.1           alternative to GNU C (gcc)
> +e2fsprogs              1.41.4           ext4
> +flex                   2.5.35          =20
> +gdb                    7.2             =20
> +genisoimage            1.1.11          =20
> +GNU awk                5.1.0            objtool
> +GNU C                  8.1             =20
> +GNU make               4.0             =20
> +GNU tar                1.28            =20
> +GRUB                   0.93            =20
> +gtags (optional)       6.6.5           =20
> +iproute2               6.14.0          =20
> +iptables               1.4.2           =20
> +jfsutils               1.1.3           =20
> +kmod                   13              =20
> +liblzma                5.8.1           =20
> +lzop                   1.04            =20
> +mcelog                 0.6             =20
> +mkimage                2017.01          ARCH=3Darc, arm, or powerpc
> +mtools                 4.0.49          =20
> +nfs-utils              1.0.5           =20
> +openssl & libcrypto    1.0.0           =20
> +pahole                 1.26            =20
> +pcmciautils            004             =20
> +PPP                    2.4.0           =20
> +procps                 3.2.0           =20
> +Python                 3.9.x           =20
> +quota-tools            3.09            =20
> +Rust                   1.85.0           CONFIG_RUST=3Dy
> +Sphinx\ [#f1]_         3.4.3           =20
> +squashfs-tools         4.0             =20
> +syslinux               6.04            =20
> +udev                   081             =20
> +util-linux             2.10o           =20
> +xfsprogs               2.6.0           =20
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> =20
>  .. [#f1] Sphinx is needed only to build the Kernel documentation

I kind of like the "Required for" column w/ naming=20
concrete Kconfig symbols or envs like ARCH.  I think it would be good to=20
get this a bit more complete, where possible.

Kind regards,
Nicolas

--3LI1LwzTwlfX5+ls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmqa7ZAACgkQiMa8nIia
bbhLsxAAhafUzIFNr+ETq/XHjzw3SB44iaAWSzBjCmdDYU/w20d/EBrWySxiS27A
4IY8XpSGUVdGbmgY1vC3PDVyLZ9xwMpYv65wkevFZM9D5FzJla9K9Mh5W6B6dUhy
VNSFqfZ1vDHxRGW25ArjF5jwWFlGzHbbaMWtXuTDFSKPKB6o899aTU9TgY8G/G0p
1R0YFo8Ldlv1bRw3MQyPbgL64TntjXxBrylKkmLa9rg9Qz34B9PzsR2O7QWvIN1w
GCm5SewGQ7If43ELa9+p29RGH7ZivMod9IDdlTbAqQM73rdFVj/84vC/udWGCWrF
k+HM/ml1LtxlgkDMschDnyb6+r+NVAPGeq+N5qmwPZyiLNkPWNoDa5gKhdSfriXA
305AzMpiS7R1Q4IKYFz/VG9GLE7tnzCkIjzK13BYpqs5a+MCpvtx6CmDNywZxMkv
2mw8XSM/nFBROLXwIFAlSb8KIC9336efMjzuBXR8QiuVuoajeaBWhfLDWBPKKPLZ
OkxMiZ+bDjllesbpwEZWaMechDA926OXKK24zfZRLpp6IVJtz+WOrb0aHMY6KnCa
PQIEDflE3sfS8E8tscPvKsYoIkJt5F+UqYa8IVJTUVgNkZcwZhd74vJd1/FVcCWJ
jPYC4hteW1DkD3HX5TMBvaoFhTvnGGqVe//L4aJ4W0RJxOuf1Nw=
=ALpV
-----END PGP SIGNATURE-----

--3LI1LwzTwlfX5+ls--
