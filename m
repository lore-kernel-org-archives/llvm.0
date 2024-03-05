Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF0510A2B
	for <llvm@lists.linux.dev>; Tue,  5 Mar 2024 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709678134; cv=none; b=A69m1McKT7l+V+tOaK6fnqVau0YMG7XcIrAmaQTtZ83uaDp1EzBZnQTI4GuIhgv68WkBZNjL4/rLdxiJs+fYl7wGeZQISoWZqNU99Vmh3GNk1YDLYcuj4b+ONM9hefL/MoHuosqdysHbzEOLkiwKQNc6KGL9hXmXIsvTQEimOlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709678134; c=relaxed/simple;
	bh=tuechWDabS+rOZFM5oF+zEivMu15U6Zy4NLHefWQa8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiwXlBSpqQX7wTbN8GhS1VOXqX2yKr9xYD+vxI6G+QM8s+tXyMzLUFCRq0f83siLM3NhgqVP5Qn3ryVXOJtoBvGmda8tmqKZNkpEFOFBn50rN0ZWMR4TSgWOaKjC8G7xfbwrSrzx8iyZ1mMP/pJPE7oYh76C32olwrqQzkoAISo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ChvnzVRu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ChvnzVRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tuec
	hWDabS+rOZFM5oF+zEivMu15U6Zy4NLHefWQa8U=; b=ChvnzVRuCI12BSjdcC+p
	QcdVlGgdw83XEA+hWRkzwai6TbkFBGKQmiawO+ETCat+AdzNBeaToKiEUlc+pDjd
	H9nV/C+BCcXI/t6twfAYHkieAV8C3tO+98hDomUE5KCgyfBbQ3Dip3jehH6BvEUD
	gxXimjbFj6GbnAdTKpHLutVuXeTcpqVyB5ZiHxLQH2AavmYA27XPqJz+Jo1zsyki
	NyhJnJUMUiuMIBNocZufaCk+NIgyJFzQrHBnIzoNCk94o+zTU8ts2iQKojy9gvRE
	z3TaC8d7bmT5KQtQRmZBq+ARV9JOWr//bYZeGtlOWR48g2EgwpwBRNDgiIVO/Prd
	9Q==
Received: (qmail 4027393 invoked from network); 5 Mar 2024 23:35:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2024 23:35:25 +0100
X-UD-Smtp-Session: l3s3148p1@RZRSdfESmKpehhYI
Date: Tue, 5 Mar 2024 23:35:24 +0100
From: "wsa-dev@sang-engineering.com" <wsa-dev@sang-engineering.com>
To: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>, "arnd@arndb.de" <arnd@arndb.de>
Subject: Re: [linux-next:master 11602/11963] ERROR: modpost:
 "acpi_device_notify_remove" [drivers/i2c/i2c-core.ko] undefined!
Message-ID: <ZeeeLIPzxZuvOuyd@shikoro>
References: <202403052102.hlG8I44z-lkp@intel.com>
 <6da20a8cf84d358841068e7eff3323b6d61e014b.camel@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0XhZH3p8iGGgsAPF"
Content-Disposition: inline
In-Reply-To: <6da20a8cf84d358841068e7eff3323b6d61e014b.camel@alliedtelesis.co.nz>


--0XhZH3p8iGGgsAPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I was only calling acpi_device_notify_remove() to trigger
> acpi_unbind_one() anyway, so that seems like what I should do.

Sounds reasonable to me. Mika might have more insight, though.


--0XhZH3p8iGGgsAPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXnnigACgkQFA3kzBSg
KbbbiA//dqN5XkEy/scru8K+CJLZ50VOZIRrjqXJOw4uz8cGNnA1Tp7DLK2mxVhx
hAxL89UMl+kDLWXD8+QPh9Hp9c5I4v256pT10CUxmJ3tSf4KP6n2scBGPufa6/VK
+WpXcK6w8Zc8L+xovsD/Gai7JO5b7NpxRf6SGnSKDlbfcuXnC+12ocK5r59PQzRX
M257gf6+aBMFegRdSn0zQZA62CHpgwI+8b/pEtUeebKE6XWJ9W5RBFRabBPpJo1F
5hj86cRggAOMmhWjM10dUGhT9V2cKuALfQfbNB2BHPRuitBQbitkJHbqsH6BcVLC
SqsKZjGvDSUNBTX1uN/8aOVVH7DUfdq792ktXSEYFypEln8nbgqEXvaRfepUxRI3
3lh5sj7gKUYJesM6eSzxwb4b843MP/8C6raV0kotcDLoxhJZW7Y5A8jfFsf2PSVt
SqJmTZcMuSlFd/zX93/m5sYVla+njI00vN85EfWxmUc2Xdr5bWJtzrskUXCBdHai
Nda+ECXeDJbYOFOS43GpcI59NZ1oSJGzEaxSR/HUc/WE7eB9FpMeAxD6BIA+FIl6
VuFKjZ0xIY3dIS9gJ4qG5M7RVGh0TK4bzH7WqPEOGUkDtkrXo0K5eJwBxok6Mslv
z7k4yrREetBUJb6iNB7jLYkMCLrkW+od0HDIZCOZNJwYh+ddwRE=
=YTxx
-----END PGP SIGNATURE-----

--0XhZH3p8iGGgsAPF--
