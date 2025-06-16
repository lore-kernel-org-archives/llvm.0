Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8728982A;
	Mon, 16 Jun 2025 19:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750101305; cv=none; b=eAijkdkzt7x4IAblknOx6343ponK5BU46I+dI4MUAIujKHEzecJzSZ7/CxWQwjmCi+zWl5YuTAxapaPLvcPzBypg9VhSHVPfSnaHFBGCKosk7Ra4/Ue5k5jNbJbHEtXbXK87vt0DqNlgM5ZTzvjNnt72fJIs/YwJEBJU2iyRiLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750101305; c=relaxed/simple;
	bh=axNIAB/C6jkDTgjQBx60qehyaTss7JGdiBObM6fIxF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6uTKJO1lZTRYS7gcougbNkdsjMUg07+RhSuzjRvIsO+7P0WkCoB3LYzfNZlr6ftLxuBx004u2l24hiA4pHZtkC8MY7bUCZ4peEwFGUQ3wo4R1DQdvqxLXMGz5buErTr75xVco/nAC2lqlIutshC2QDQq3pqjP+R1iJ8uMiln/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=gNrdsj1v; arc=none smtp.client-ip=217.72.192.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="gNrdsj1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1750101284; x=1750706084; i=christian@heusel.eu;
	bh=vWAwD/gglL+XzNx4ZE+OLzKqaXpxiSmNcafe/8jSO5U=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gNrdsj1vM18SOEOCvLVlS3cz20jmaMxun/l5cKoBNHXSYcAngdlf+Md1ShFACh28
	 DSE7x3HnqeXgP1WxgnkLHWSWowHLLUonjxZOUcSB6rF80OsScPnaboSM4dAknpYQl
	 3nCGmB3yTadGLHFDmPkF4lxE1jEW9iqlO+AIwLxejdVZv4GuzQTzjXBcYNN6AVqSG
	 gIUEuqfNY0uHapkDXLIZP9KeYzR1cq9rsK2L0fR9BYYxjN/BK2LfodstCFQVlOy1T
	 gwgmhe6FTrCo5v63jqXkuMDfK1V1k2CGW2LAa0BuDp57z98A6Fit7/heFyvOXPRUB
	 ljxkH+xWhW13PRt4Gw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([80.187.66.155]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N8G6I-1unIRg0e9Y-00rsbO; Mon, 16 Jun 2025 21:14:44 +0200
Date: Mon, 16 Jun 2025 21:14:39 +0200
From: Christian Heusel <christian@heusel.eu>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, jackmanb@google.com
Subject: Re: clang: selftests/mm gup_longterm error while loading shared
 libraries liburing.so.2 cannot open shared object file No such file or
 directory
Message-ID: <7c101fe5-7c73-4916-a832-d656511eeab8@heusel.eu>
References: <CA+G9fYssELHcYKwgGNBMLrfeKZa9swGdLrH7gxqzd4P0kaOiZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ifj2fqs4sl63qpb"
Content-Disposition: inline
In-Reply-To: <CA+G9fYssELHcYKwgGNBMLrfeKZa9swGdLrH7gxqzd4P0kaOiZg@mail.gmail.com>
X-Provags-ID: V03:K1:pjn8XBlqfHHtOY72HbeSefm8Rf/7BdJhV7MoRC2aUUryDa1n66a
 ABaLBzLk0y3//12UpZsoLd2/LKAlG9KBi9+UfpGW1NB1E/3kYYr1okeWMICCXaPk10z25wk
 GmSIrqflP0XnNLS4DmSUQg3QxPN8t3E7zLo0OnvqUzvhV+I+6SkuGhs8lYECSwJnbPpzeab
 45uKoJ8iPPQWFWScrd/Zg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K3OpIx9iQzg=;Wt9aUNFJByL1PO+6K8hGauObDSu
 rawIjoGy//IPmIuxFC7Z0fXV0YD2o18eScC3xPTWdVqdnmYc/OxhfKMqGwhAOiQmpjcbKC14R
 AN76/448WPemSx8kBsdnNpkhL5H9t8tELEbTObEHIWpQp3QTTmyva6Z8qMM6nfNWkqcTKTVWr
 ZNtMeHjSjHjhRmEVg1NRjR1qUqajPVJ6JgK3EMP4N9OYwbdIF61BbzRVLp0dYFXudVGu4NnRs
 6McJu9YbYjt9p9fnEoo1CLZdJAO7uYSPCbyO5n/F9RaWFw/i2hZeGLSaNTr9rTJXC2tHrFv0y
 xfdR2jrX90UCOTD0eQHpFVy1ww1DkQechPXSBnylfsamnDfagjxR/2HqpinCPZ+zQx2rOMGpb
 FuZLQG6X1jh45LKgA3O7/z3KMQ2aO5GkHloK0LglLLgRDiEP3YB7UydnS6KsRMYK99+xzlqRP
 y7ZPscyPP2KEcBl78g9a06VmAxi88Q+r6ZDqGGsa3H0hFIISg9XIJ0wDEnIv04FrdygOWBTcY
 pgfyDZ5YC1Yr0l9cC0Fuo6FNusGOhzlsZLSYV3pNOC2DTzdA2G4bb0GAgzyL+BF8eGNDwcymk
 1QKCt1mZGdTN/LNR9lVFw93wc+QOrvPMWxVuRiLj4xsz+NZWJMcN1jrnYxeDBs7zQvKvgFHRa
 tLfqbnzN6eoJYzXb+QGOoy6OWKg0/STC2N9bIT8IY/iFFP3lNdUACaCzOI8KAgmi/Wt4EFSpZ
 /5Ur0+KW1CwxxkY/p2SEJyGIXTewshBoCY+wg+4/t5979eKb79YvAnvm6bbutqnQ+fI9Pj50+
 anRHkxUYZEFiWY6PUOBFnxJVA9GfT51+9sVzTYrUXqBf91YXzP/ekl3AsAAty3fZQ4pkPKZ+y
 4cGD08ZgSupbzjY4A6LIc1sWl156FBCVBqEZi5GlcKZqfmAn4ZNjdEZEKHmtZHDMLsvs/e/Iy
 2O++bbEY5eulLxDfo/tP60S5lk2hIdxChaEcdGPuF/7ZfOVreFGHqbCuvJXRkAxIC9eXV4X9s
 lHVFMP98HaG4xeRzqZ8ozsMGULNSwHGPqCwZ0VgF81CDg0MWklm0w18Lwkd/TqJP3b50ow7ZJ
 GUJaN3F0ayF9I2zU4k0IDiNT+PWJ49aMzSz82TnyZmlI5TmmVUEQpm3ordNRoUTMA9H1lFji1
 laxfB6cCgxqwGgEWayXfSWTJUmwndm/BV/8PHSqmZmuy4cT096LTwuGVzEE4W5RiqMDlyL4JL
 IRe/5368ThqCfpde3bWEOTNYlAOMknpHM6CPaowbMzMVfFBX4a/S9KwdqJy1sSlj2Dcb2KYGY
 MEgSzxCR8n84j9cSpSF6G4tgU+/XOfEbVeD3DSGeM9VQ22eV6oJvrwCDNfmIi2gyYMLgyhxxC
 VKNc+horAbr6Aj5pCpkfUXZaw3l8KagsrBCRkTUpWpO2wk2c7Zg5blFlZo


--2ifj2fqs4sl63qpb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: clang: selftests/mm gup_longterm error while loading shared
 libraries liburing.so.2 cannot open shared object file No such file or
 directory
MIME-Version: 1.0

On 25/06/16 11:02PM, Naresh Kamboju wrote:
> The following test regressions noticed while running selftests/mm gup_lon=
gterm
> test cases on Dragonboard-845c, Dragonboard-410c, rock-pi-4, qemu-arm64 a=
nd
> qemu-x86_64 this build have required selftest/mm/configs included and too=
lchain
> is clang nightly.
>=20
> Regressions found on Dragonboard-845c, Dragonboard-410c, rock-pi-4,
> qemu-arm64 and qemu-x86_64
>   -  selftests mm gup_longterm fails
>=20
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>=20
> Test regression: selftests mm gup_longterm error while loading shared
> libraries liburing.so.2 cannot open shared object file No such file or
> directory
> Test regression: selftests mm cow error while loading shared libraries
> liburing.so.2 cannot open shared object file No such file or directory

These do not really look like kernel regressions, rather like a bug in
the userspace testing tool =F0=9F=A4=94 Could it be that the tests were not
rebuilt for the new liburing or that the dependency is not installed in
the test environment?

> Test regression: selftests mm mlock-random-test exit=3D139
> Test regression: selftests mm pagemap_ioctl exit=3D1
> Test regression: selftests mm guard_regions file hole_punch
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
>=20
> ## Test log
> Linux version 6.15.0-next-20250606 (tuxmake@tuxmake) (Debian clang
> version 21.0.0 (++20250602112323+c5a56f74fef7-1~exp1~20250602112342.1487),
> Debian LLD 21.0.0) #1 SMP PREEMPT @1749190532
>=20
> running ./gup_longterm
> ----------------------
> ./gup_longterm: error while loading shared libraries: liburing.so.2:
> cannot open shared object file: No such file or directory
> [FAIL]
>  not ok 14 gup_longterm # exit=3D127
>=20
> ./cow: error while loading shared libraries: liburing.so.2: cannot
> open shared object file: No such file or directory
> [FAIL]
> not ok 50 cow # exit=3D127
>=20
> running ./mlock-random-test
> ---------------------------
> TAP version 13
> 1..2
> [  311.408456] traps: mlock-random-te[21661] general protection fault
> ip:7f63210dbf0f sp:7ffdff6fca28 error:0 in
> libc.so.6[adf0f,7f6321056000+165000]
> [FAIL]
> not ok 23 mlock-random-test # exit=3D139
>=20
> running ./pagemap_ioctl
>=20
> ...
> ok 53 Huge page testing: only two middle pages dirty
> ok 54 # SKIP Hugetlb shmem testing: all new pages must not be written (di=
rty)
> ok 55 # SKIP Hugetlb shmem testing: all pages must be written (dirty)
> ok 56 # SKIP Hugetlb shmem testing: all pages dirty other than first
> and the last one
> ok 57 # SKIP Hugetlb shmem testing: PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_W=
PASYNC
> ok 58 # SKIP Hugetlb shmem testing: only middle page dirty
> ok 59 # SKIP Hugetlb shmem testing: only two middle pages dirty
> ok 60 # SKIP Hugetlb mem testing: all new pages must not be written (dirt=
y)
> ok 61 # SKIP Hugetlb mem testing: all pages must be written (dirty)
> ok 62 # SKIP Hugetlb mem testing: all pages dirty other than first and
> the last one
> ok 63 # SKIP Hugetlb mem testing: PM_SCAN_WP_MATCHING |
> PM_SCAN_CHECK_WPASYNC[  241.731600] run_vmtests.sh (456): drop_caches:
> 3
> ok 64 # SKIP Hugetlb mem testing: only middle page dirty
> ok 65 # SKIP Hugetlb mem testing: only two middle pages dirty
> Bail out! uffd-test creation failed 12 Cannot allocate memory
> 12 skipped test(s) detected. Consider enabling relevant config options
> to improve coverage.
> Planned tests !=3D run tests (115 !=3D 65)
> Totals: pass:53 fail:0 xfail:0 xpass:0 skip:12 error:0
> [FAIL]
> # not ok 48 pagemap_ioctl # exit=3D1
>=20
> running ./guard-regions
> ...
> RUN           guard_regions.file.hole_punch ...
> guard-regions.c:1905:hole_punch:Expected madvise(&ptr[3 * page_size],
> 4 * page_size, MADV_REMOVE) (-1) =3D=3D 0 (0)
> hole_punch: Test terminated by assertion
>          FAIL  guard_regions.file.hole_punch
> not ok 80 guard_regions.file.hole_punch
>=20
>=20
> ## Source
> * Kernel version: 6.16.0-rc2
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next=
/linux-next.git
> * Git sha: 050f8ad7b58d9079455af171ac279c4b9b828c11
> * Git describe: next-20250616
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250616/
> * Architectures: arm64, x86_64
> * Test environments: Dragonboard-845c, Dragonboard-410c,  rock-pi-4,
> qemu-arm64, qemu-x86_64 and x86
> * Toolchains: clang nightly
> * Kconfigs: selftest/mm/config+defconfig+
>=20
> ## Test
> * Test log: https://qa-reports.linaro.org/api/testruns/28766026/log_file/
> * Test log 2: https://qa-reports.linaro.org/api/testruns/28743077/log_fil=
e/
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250616/kself=
test-mm/mm_run_vmtests_sh_gup_longterm/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0=
viPHafKAe0u89drIv5fcwu2/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0viPHafKAe0u89d=
rIv5fcwu2/config
>=20
>=20
> ## Steps to reproduce
>   - tuxrun \
>    --runtime podman \
>    --device qemu-x86_64 \
>    --boot-args rw  \
>    --kernel https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wm=
Vl0eHb9koWyQYC7myXjpX/bzImage
> \
>    --rootfs https://storage.tuxboot.com/debian/20250605/trixie/amd64/root=
fs.ext4.xz
> \
>    --modules https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0w=
mVl0eHb9koWyQYC7myXjpX/modules.tar.xz
> /usr/ \
>    --parameters MODULES_PATH=3D/usr/ \
>    --parameters
> SQUAD_URL=3Dhttps://qa-reports.linaro.org//api/submit/lkft/linux-next-mas=
ter/next-20250616/env/
> \
>    --parameters SKIPFILE=3Dskipfile-lkft.yaml \
>    --parameters
> KSELFTEST=3Dhttps://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wm=
Vl0eHb9koWyQYC7myXjpX/kselftest.tar.xz
> \
>    --image docker.io/linaro/tuxrun-dispatcher:v1.2.2 \
>    --tests kselftest-mm \
>    --timeouts boot=3D15
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org
>=20

--2ifj2fqs4sl63qpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmhQbR4ACgkQwEfU8yi1
JYXNhBAA4J8IfYyoS8afSaTdCPF1zLiPorF6mZuTwefTndUd//Zm6nOhBHsU4KsV
YQDbZUMUV0IGXSZ0leI7mb4TVVg+y1Xn4p35uNKfykilbUpuXZz/y4toLJMuFG73
abD+pXJQK9bGnZOeTocm45uwbeUnAq4VcwPaI2vAmaIXZkde1ca4G9gXonk077au
rko4E9+W2gCHNKoNqsVrJ5BRTGrxAKkWKYMiO1TuIhodrNmLikk+vmyR68hVY4bl
TcYp1BDhioojMtP/4KwgXY1e1jbUvGDdG/rrRiPYEWNiVNx33LsTu/o0Hj8SbxgA
cFPJM5UiSPY0Yy9jVGgoTjcIU4Il1PsH4kscqvneaXpKEkGk/SP0l57xUmc87+S8
MtA5IC72mwxVbOgtPEqBcbpT6Q7HvFlTVEZSwfFcJk6wW7cbMJjKFCEPm1lR1sqK
Pcii1RpfY8iSAeXcDu7t0PjAR1/W+2SzfrVdXrgteaFR+MJDPjPxyocEjrS+59jT
FIwOBTg836WK1382cwXplao891izLPG4A3oLZhPUNKucadmRHlODJlSvOnZGxOFJ
+Xlkh01E2yHt/wUTmYG04gDEuA9GU9Ile50LBsntFQpH2wbYVtPM7GS3VBOyRhvE
iXtUBSHyWH3bH5nmkc7mgmd5iVlQGWmPRYgzPYv+XDddgyiz0fo=
=w13D
-----END PGP SIGNATURE-----

--2ifj2fqs4sl63qpb--
