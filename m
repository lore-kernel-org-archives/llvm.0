Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3757084A;
	Mon, 19 Oct 2026 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419974; cv=none; b=OO99EaFUeCH7UpKFWOivViGabKnCBTHGACEC9slnDDUZJOd56CiFwnoSz74oz+XuQSf6wxmvuO+mflYsyLOxIxOpGNCE7GsCdnOxQFgyvDBVxFrvQCv/YNn4ez5XwQTZY4LQa97M7u199Ye21FBLBbFBS+di6lAP01HiF/L4Two=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419974; c=relaxed/simple;
	bh=wXaA4Lqd/Sq5Q7tVGx0pHDGgIpUc+OopZZmi8rNrlWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSvPyaDEZjhnY+mmOGAbEC+4R34cyzCo5wNxpAOtjfNma9YK0PoQJaKJB+K/QLuGHWOqbCstZ+uYaqfy6Wa1inBSe7i9wQnHoLb67dA+2VQeE8oOP1Ae0hBip9sm9LZfoAlrIrMxz4Uai5hdyezQ0wpIlmeG+BgyA6vClEEhv7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4yIvsjV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4yIvsjV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB301F000C8;
	Mon, 19 Oct 2026 14:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419972;
	bh=DaSM4M9tttPQz83r2q9i9D3CTwdtlsu+SwUsFN6pCCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G4yIvsjVmphgJHjlfUfE/6GYYeJx1kXsyQlJW5HuvU2CtXQl2wBMaVfXXAwJh7vwn
	 keNWffRbKPQt4B7W/kR9vcrB1BlHZe+y8+lnTTqM5TrUPcCAC8fx3bYqolFyam8l8S
	 2vH/EDK7jYsgGek+QtOlynq06slOd79NxoyuOCPt6Uj+EZYQT7NsWGpiasPp1M1uip
	 27jDdVVKVhV/9lRqslOPBO9M6gKIF99fOeAEvQBVfY9Kjt2y6Ib4EA4uT2VBHJMELA
	 4NgAK1xemzmiM36Y1cs6URb0Y+2GGyZ0wZfGs8ZcPbEa3uo9Dh1yTlbBNDSLhZGUbU
	 8C5WCkb2PDpGw==
Date: Mon, 19 Oct 2026 16:26:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Helen Koike <helen.fornazier@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] drm/ci: Add CI pipeline for drm-misc branches
Message-ID: <atYoMnjtOhDLJwza@houat>
References: <20260911-drm-drm-misc-ci-v2-1-1847f89585cb@kernel.org>
 <9e1fc5c6-53ff-4a4d-9744-77bcf6a0325e@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="p6yas62h76l2tfcz"
Content-Disposition: inline
In-Reply-To: <9e1fc5c6-53ff-4a4d-9744-77bcf6a0325e@collabora.com>


--p6yas62h76l2tfcz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/ci: Add CI pipeline for drm-misc branches
MIME-Version: 1.0

Hi Vignesh,

On Mon, Oct 19, 2026 at 03:30:54PM +0530, Vignesh Raman wrote:
> Hi,
>=20
> On 11/09/26 17:48, Maxime Ripard wrote:
> > The DRM CI infrastructure builds upon Mesa's CI to run IGT tests on
> > hardware. Its focus is on functional testing on a selected number of
> > targets.
> >=20
> > The concern for drm-misc is different: it merges a large number of
> > patches across many platforms, and build or unit test breakages happen
> > on a regular basis. Adding build and unit testing for drm-misc has been
> > on the back of our minds, and a first attempt was made last year. The
> > feedback was to rely more on the existing infrastructure.
> >=20
> > Introduce a CI entry point that runs on pushes to drm-misc-next,
> > drm-misc-fixes, and drm-misc-next-fixes. It reuses kunit.yml,
> > check-devicetrees.yml, and the freedesktop ci-templates, while defining
> > build templates inline to avoid pulling in the Mesa pipeline.
> >=20
> > A single Debian container with LLVM handles cross-compilation to all
> > three architectures. The pipeline compiles the kernel using defconfigs
> > from the drm/tip rerere-cache branch, runs the DRM KUnit tests, and
> > checks device tree bindings.
> >=20
> > Link: https://lore.kernel.org/all/20250319-greedy-sturgeon-from-avalon-=
ac758f@houat/
> > Acked-by: Vignesh Raman <vignesh.raman@collabora.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Changes in v2:
> > - Run dt_bindings_check
> > - Run on push instead of MR after some discussions with Dave and Sima
> > - Test run here: https://gitlab.freedesktop.org/mripard/kernel/-/pipeli=
nes/1744733
> > - Link to v1: https://lore.kernel.org/r/20260902-drm-drm-misc-ci-v1-1-4=
9d05e228eab@kernel.org
>=20
> Acked-by: Vignesh Raman <vignesh.raman@collabora.com>

Thanks for the review, see below

> > ---
> >   drivers/gpu/drm/ci/drm-misc-ci.yml | 147 ++++++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 147 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/ci/drm-misc-ci.yml b/drivers/gpu/drm/ci/dr=
m-misc-ci.yml
> > new file mode 100644
> > index 000000000000..4ab87547794e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ci/drm-misc-ci.yml
> > @@ -0,0 +1,147 @@
> > +# CI pipeline for drm-misc-next, drm-misc-fixes, and drm-misc-next-fix=
es.
> > +#
> > +# Runs on pushes to drm-misc-next, drm-misc-fixes, and
> > +# drm-misc-next-fixes. Compiles the kernel for arm, arm64, and
> > +# x86_64, runs the DRM KUnit tests, and checks device tree bindings.
> > +#
> > +# A single container image is built using freedesktop ci-templates with
> > +# the packages needed for kernel compilation and LLVM for
> > +# cross-compilation. QEMU is installed at runtime by the KUnit jobs.
> > +#
> > +# check-devicetrees.yml and kunit.yml are included directly. build.yml
> > +# and the Mesa container/build pipelines are not:
> > +# they pull in hundreds of Mesa-specific jobs and templates that would
> > +# each need to be individually stubbed or disabled. The build templates
> > +# (.build:arm32, .build:arm64, .build:x86_64) are defined inline.
> > +
> > +variables:
> > +  CI_TEMPLATES_COMMIT: &ci-templates-commit aec7a6ce7bb38902c70641526f=
6611e27141784a
> > +  # Project whose container registry stores the built images
> > +  FDO_UPSTREAM_REPO: mripard/kernel
> > +  KERNEL_BUILD_CONTAINER_TAG: "2026-09-11-01"
> > +  LLVM_VERSION: "19"

I just realised there's still my personal repo being used as the
container registry. Are you ok if I change it to drm/misc/kernel when
applying?

Thanks again,
Maxime

--p6yas62h76l2tfcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCatYoegAKCRAnX84Zoj2+
dnkIAYD9emTICkJ8mFFLwtNMnDVkVgaKoJFQXbZOQYfIfJl1SupzOJcfDQCPRIYz
tnmc9UUBgMsaFLuNBpEovo1gqNoIN982LvHJwBdGMrTqRLSksr/yt68nv12PFWIR
O33X37wBtA==
=r0xP
-----END PGP SIGNATURE-----

--p6yas62h76l2tfcz--
