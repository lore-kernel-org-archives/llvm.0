Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ABE4418CA;
	Fri, 31 Jul 2026 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511991; cv=none; b=eYa9Af5mApk/2Euo6EpuFhkWnqmbMfkL2yLULryJNsoMJG6y3qZkm9dpQKV9cpJk//yIBLfQJd5+AZyBkAyE37C9nkaFDwozfihLrS9iFPzL0vFitaN8gxCc4FKfOdOMJPrgnkHXo774fE+hCL5FJE1YyICl8TwveJbrVa3TbqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511991; c=relaxed/simple;
	bh=0dWQj9ihmGFFtSxlkvXIgi9q6aif89ZggO8Om1VmpdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2KsN52Qorz+cmlJ2jHSxrtxhqpZFlZCpvf9YxaweK7z1U2hKgfeI1ge/aYKZRO0T7DJJSLNpgngemO3p7eqlxd50tpibI7Q45V5Fq2y7oV4vWxker4hEy0CF93QfHD+vf3hFQcT9Qz5t52/RuhsnjBinEgeyuwrVhGr8gXiGTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5ztE7ec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5ztE7ec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8724E1F000E9;
	Fri, 31 Jul 2026 15:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785511985;
	bh=KhDy/vBNcEPq+mP7p3WoUkWGMGgv5pEJANZTYx2EKn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G5ztE7ecZEoSK0y08pA79fMk55/KLod3GsfhqlbCxUaf7hHZBeUSZ6/lgz5bwPTT2
	 G0WwWAL9zeexepe4ga4DyhEF9W03kD7WYnksH8LqJbu+HEQzgAAqHYuAHWCF+NjH7R
	 tIxegUTUlWGLSHPA+CqCTpS18NRb1eqzt5MbGAcEAabGY2rosoqZr+2+yYEpt6YJLe
	 F80s6KqcDvtYndkVUVqxhZG0exTQSx/rHenQMa0eQSyVBofMogy02dKzZyYG8OXwAk
	 SSMwPqdm2U5ztb2oZTjOkNPTvDUupgbyfkjm529v4EdpA6bPwsiEprcWw9UmczpWvC
	 JmxwiZAhZBwZg==
Date: Fri, 31 Jul 2026 17:33:02 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [linux-next:master 10570/10862]
 drivers/net/ethernet/airoha/airoha_eth.c:3470:18: warning: division by zero
 is undefined
Message-ID: <amzALtFffHRXcefS@lore-desk>
References: <202607311850.6p0ZUVq4-lkp@intel.com>
 <amy2RIReGPFzDSVW@lore-desk>
 <CANiq72nFoPshLi_8OAYxpda-rJnRCh=UpB2CovMZXj+vo3BDeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UEYi+ZA98FZUsaLc"
Content-Disposition: inline
In-Reply-To: <CANiq72nFoPshLi_8OAYxpda-rJnRCh=UpB2CovMZXj+vo3BDeA@mail.gmail.com>

--UEYi+ZA98FZUsaLc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Jul 31, 2026 at 5:03=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:
> >
> > Is it a false-positive? I can't see how sizeof((arr)[0]) can be 0 here.
>=20
> `CONFIG_SMP` is not set, so the spinlock is empty, no?

ack, right. We can just use AIROHA_NUM_NETDEV_TX_RINGS instead of ARRAY_SIZ=
E().

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/etherne=
t/airoha/airoha_eth.c
index dba7c52c0896..64619e9a704d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3467,7 +3467,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth =
*eth,
 	netdev->dev.of_node =3D of_node_get(np);
 	dev =3D netdev_priv(netdev);
 	u64_stats_init(&dev->stats.syncp);
-	for (i =3D 0; i < ARRAY_SIZE(dev->txq_lock); i++)
+	for (i =3D 0; i < AIROHA_NUM_NETDEV_TX_RINGS; i++)
 		spin_lock_init(&dev->txq_lock[i]);
 	dev->port =3D port;
 	dev->eth =3D eth;

Regards,
Lorenzo

>=20
> Cheers,
> Miguel

--UEYi+ZA98FZUsaLc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamzALgAKCRA6cBh0uS2t
rIj+AP998czAY3FErj3QecQmqgheoFOtcZ5wa/cDA6iyG8UgpAEAlDhfQPBDnZHG
pBHqEVuvCiAcdQsQ78iLgkZ6TgtIkAc=
=hcT8
-----END PGP SIGNATURE-----

--UEYi+ZA98FZUsaLc--
