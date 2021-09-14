Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E88D3FC3
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 13:52:18 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id j16so12291662pfc.2
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 06:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m05pyjIx36bCyATYdVUgvIAee/hjT8Yiwdj2jgWsHuY=;
        b=YKfEsXnLvnOFhX1xWK7ivgxjYMuagNacVuAZqb62a6x0Du2KWQpx9g0BXXWd1r2VsY
         c2iRZM+8W/3Ru7thtUTdQ3RA8gZf0wgG0HQn/CH3tkVF3PhsFSCJu8DwFv1xNI+4q4Of
         xuQJKpaOFSh92nm0nGjyMYr+ig8iurMBvqKMweG8PEkEH7vPuTVmmVxfk4HcvW5gAYhM
         iF0Dw5u/vxycJTzpvjsFkBGyyksPS/heYo2s5hFN3+dpgZmv/uic7IfNUWMyhw43Gf2L
         iUabrMbCsFIH2/AUtJ2bJsY/Lm/GrgQJtBXvZR+OBKg7/yib+W08JyRNsVsBX0lcqOXC
         djAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m05pyjIx36bCyATYdVUgvIAee/hjT8Yiwdj2jgWsHuY=;
        b=eAijnkvWYFgndyvtsNBC3f3Ti7H15CYdzkPOjJHRX57yjnySrD2LV5udR7xDPx+5ML
         bz9YKJ+7Yg2GGAaHn9bRDtbxsZPx+Syvc7h6c/eLrPHEQUaLQyxPiuIdZAY89GQx7tey
         KzFWt8R9jtExyjRCeKErUs9uj2pB25EoKwGV99vs6Bh88Qb2qVSPR45T7/cIubi0YJP0
         9cB/+LvS3kStSAkNdAZQM0H/0iR7vTU/AVP1e8indAvkklCvBSdsK1x6uFeywDdbJQSn
         cR8UnHKFB/p6dfSJ44Lnh1uCkDNu2rNJ+5KM1rrxBrBUI68jySW0QInyQY7DrVEa4hzk
         l4EA==
X-Gm-Message-State: AOAM5302PQlK7doUMWMnLiFR0J+OhEDek3JmDI0xMRpnpQrvc6OpyCfn
	BrXikZajUw6vrJBhI4X9z30=
X-Google-Smtp-Source: ABdhPJxaeIvPbR+IGON/k2EuUxVQZddP2muV5KT7LDNaeIOsHCJE0L5BNNlFZfww2mWD651N7AHydQ==
X-Received: by 2002:aa7:8014:0:b029:3cd:b6f3:5dd6 with SMTP id j20-20020aa780140000b02903cdb6f35dd6mr4963213pfi.39.1631627537791;
        Tue, 14 Sep 2021 06:52:17 -0700 (PDT)
Received: from shinobu ([23.82.194.94])
        by smtp.gmail.com with ESMTPSA id g16sm11188181pfj.19.2021.09.14.06.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 06:52:17 -0700 (PDT)
Date: Tue, 14 Sep 2021 22:52:12 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	David Lechner <david@lechnology.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	jarkko.nikula@linux.intel.com
Subject: Re: [iio:testing 40/43] ld.lld: error: undefined symbol: __udivdi3
Message-ID: <YUCpDDkNSqhlaThq@shinobu>
References: <202109120656.fiJqCh8H-lkp@intel.com>
 <20210914134103.00006d23@Huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ktaNQ2IAKnYoYMdX"
Content-Disposition: inline
In-Reply-To: <20210914134103.00006d23@Huawei.com>


--ktaNQ2IAKnYoYMdX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 01:41:03PM +0100, Jonathan Cameron wrote:
> On Sun, 12 Sep 2021 06:43:58 +0800
> kernel test robot <lkp@intel.com> wrote:
>=20
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git t=
esting
> > head:   77a4a019161bcba51af1dbbeadc04795840fb3e0
> > commit: f7da4339ca510e4476ea35cb9fd44f3f190706c5 [40/43] counter: Inter=
nalize sysfs interface code
> > config: i386-randconfig-r022-20210911 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 26=
1cbe98c38f8c1ee1a482fe76511110e790f58a)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git=
/commit/?id=3Df7da4339ca510e4476ea35cb9fd44f3f190706c5
> >         git remote add iio https://git.kernel.org/pub/scm/linux/kernel/=
git/jic23/iio.git
> >         git fetch --no-tags iio testing
> >         git checkout f7da4339ca510e4476ea35cb9fd44f3f190706c5
> >         # save the attached .config to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
> >=20
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> > >> ld.lld: error: undefined symbol: __udivdi3 =20
> >    >>> referenced by intel-qep.c:290 (drivers/counter/intel-qep.c:290)
> >    >>>               counter/intel-qep.o:(intel_qep_spike_filter_ns_wri=
te) in archive drivers/built-in.a =20
> This is a result of a change to passing in a u64 instead of a string.   I=
've applied a fix
> that uses do_div() and pushed out as testing again.
>=20
> William, please sanity check that fix looks right to you.
>=20
> Thanks,
>=20
> Jonathan

Your do_div() change seems sane to me; would div_u64_rem() work here as
well, or is do_div preferred because we're not using the remainder?

I'm CCing Jarkko Nikula as well to keep them in the loop.

William Breathitt Gray

--ktaNQ2IAKnYoYMdX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmFAqQIACgkQhvpINdm7
VJLmQA/+PdmN9VE1QBJp2e3T0shwh/MrS5hMTfj9o8GCbtCgDVnFkiXfIbrG7elx
8KKSy+KROs54WFGkp0alWLd4U8ocZjckwg+2Y+z1XzSyk39Df7VGlx3O147maHrX
SwlxZPZqeZbftuahhn6k+KRFo36ZhkjbLQNdhdaUtu357Y2EFBTIm3aZfh5yi1FS
4+zrLCVwgJQSzRg0mwdO1Btb53d2n/L6gbdeZcpoGZugEuPBXNbdszTvc4J+jnj4
IupbEPAGgdK+oC7kyVMTBkLHTrH8tRQWwX48XCUVYsJ+yjQ1s7/ghDCLlaOa0nvV
9ZMMqN2rWUaq9bs1dKRcsRGHksAWyC0RPtcc7CX21UF5776fNL+k5OySlbGBXrUt
GCuoAoP2qkItHTDplnho3nJ12Nxv/DL8029LUarzdlpU9JYJFvDqRcLz21ClpU8Y
ltfaAL544f8V3awyxRVtekfxX9gm3yE50ugYHj+bmw5Mzshw6oyKhUpW9Hw553Xt
v8CuDSxemllkMpK0bHAqUVcErxIFMAH5DSJYq9mV64LrW920oxvvTI7kjuWHR00i
m78+bvQTBIfW2X246+aGsWzwUKsCXhrRE0sjRlkxnFY/nKD6TxJqXwrMA47ryHQm
jZK7UNvsu2tWlU28Y72Sdhh3mHG/KyxH8we7RKXNyg0tsIz/11M=
=tOCE
-----END PGP SIGNATURE-----

--ktaNQ2IAKnYoYMdX--
