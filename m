Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7688F37881E;
	Wed,  2 Sep 2026 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337306; cv=none; b=c8Bv2ud569+SDQ9GERfYXwZmdJkn2UZinU/KcAKMkA9aGzS+fWe18mTJ08FeaXhMnuE30ErX0N/OHQ4f9fXcXA3hSM4MtEhFxjB+IGFh1jiTm8JXG+jHjUHmq/4+CU5HQ9JUBXZKXHzTKJ2Fng2fni6L2KVEPJMWZxiWbJ4g5h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337306; c=relaxed/simple;
	bh=ggCMOymjzta62KyOYmqN5sV9fnNSej/APcCJwAgLjdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBByyOhJ+Aj+KtCvbrXhTBiYZ8ZLbVzMG1hZFDJX1SEb2IgEXyya9P+ttZOw89EZc1QA4UVmCGoq9OukBbD2NctwhbmHaGWpktgV1zzf7n5SXK22gfN4GGLvnqhGt25Qov82qY06djRe4BR01eLG77rR5wotTPC4AO3w5sswedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKcAME0w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKcAME0w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686821F000E9;
	Wed,  2 Sep 2026 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337305;
	bh=ggCMOymjzta62KyOYmqN5sV9fnNSej/APcCJwAgLjdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YKcAME0w0PsDZCSNyM82DjLCbJI/OTGXekMYRjvnh0HKzALlnf5nUht4kHbiGqOIh
	 ERsDHDtVRCqDih85M+RgN2XW2ZnnLuH0EFxrmQnlOJR9fNhyxy2SIZ2P9LRwqL96N0
	 7vK/UjhXhV4HW0pV0IMqJYy7tqUlSjtVet5ey1qioeJEJRRkxL0D/38nB/VUcBrq7X
	 Ny6U4XigIt0GRqmxDmcLLcvGx9yVczNyiREQYKZSn1hfZd+mHQCrYxD7vqeAU1OY/h
	 U+TL/CVvUlnFGd+5quq+CzinTDLS6tHrNwXkKspukdUhXiyRk2WG5MZHGhU56Tf5Mi
	 /FyBF9hJWvWFg==
Date: Wed, 2 Sep 2026 10:21:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Koike <helen.fornazier@gmail.com>, 
	Vignesh Raman <vignesh.raman@collabora.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] drm/ci: Add CI pipeline for drm-misc branches
Message-ID: <apfchj1N41WQGlnU@houat>
References: <20260902-drm-drm-misc-ci-v1-1-49d05e228eab@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ti3nay26l7y5i6tt"
Content-Disposition: inline
In-Reply-To: <20260902-drm-drm-misc-ci-v1-1-49d05e228eab@kernel.org>


--ti3nay26l7y5i6tt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/ci: Add CI pipeline for drm-misc branches
MIME-Version: 1.0

On Wed, Sep 02, 2026 at 10:17:09AM +0200, Maxime Ripard wrote:
> The DRM CI infrastructure [1] builds upon Mesa's CI to run IGT tests
> on hardware. Its focus is on functional testing on a selected number
> of targets.
>=20
> The concern for drm-misc is different: it merges a large number of
> patches across many platforms, and build or unit test breakages happen
> on a regular basis. Adding build and unit testing for drm-misc has
> been on the back of our minds, and a first attempt was made last year.
> The feedback was to rely more on the existing infrastructure.
>=20
> Introduce a CI entry point for merge requests targeting drm-misc-next,
> drm-misc-fixes, and drm-misc-next-fixes. It reuses kunit.yml and the
> freedesktop ci-templates, while defining build templates inline to
> avoid pulling in the Mesa pipeline.
>=20
> A single Debian container with LLVM handles cross-compilation to all
> three architectures. The pipeline compiles the kernel using defconfigs
> from the drm/tip rerere-cache branch and runs the DRM KUnit tests.
>=20
> Link: https://lore.kernel.org/all/20250319-greedy-sturgeon-from-avalon-ac=
758f@houat/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

A test run can be found here:
https://gitlab.freedesktop.org/mripard/kernel/-/pipelines/1738579

Maxime

--ti3nay26l7y5i6tt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCapfclAAKCRAnX84Zoj2+
djAuAXkBJHNOgysY1OgeKxcwUqjXONoQ4pixDRE0gn0v/Sdi5bX83V5e8NQwHTLq
8IP7QkgBfA0EDNDsRtzl7kB2BZ/ZyGkoMZrudoBydqjGbgGOrCb5q2sVXl89tVXz
tdN2sAaRqg==
=njPd
-----END PGP SIGNATURE-----

--ti3nay26l7y5i6tt--
