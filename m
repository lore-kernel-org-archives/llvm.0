Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C493FC1
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 11:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630928894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebpk4gg/g42g7ZjrI0SmqKxmPZRfGrkwgfXTGi6EUB4=;
	b=L4yfu+YU6JixlSUDYFR2junmbbiOCWR5cv9ZnqhiNM3n6oohJbAlX4YcKWX5mOSBQdzfts
	FZcPikcOJFoRo3n/tTqSN9bqK7tGUc9KVrhubF5Ys+Yah4RslKQGIASMWQ3gA4zuHhGPGJ
	1v8q7Cg3pbUJjnGHt0veqqrmfmENK2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-EaRbucaDNvu07apGX_EazQ-1; Mon, 06 Sep 2021 07:48:11 -0400
X-MC-Unique: EaRbucaDNvu07apGX_EazQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6517B6D4E3;
	Mon,  6 Sep 2021 11:48:10 +0000 (UTC)
Received: from black (unknown [10.39.194.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D211E19C46;
	Mon,  6 Sep 2021 11:48:05 +0000 (UTC)
Date: Mon, 6 Sep 2021 13:48:04 +0200
From: Michael Hofmann <mhofmann@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: CKI Project <cki-project@redhat.com>, llvm@lists.linux.dev
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 kernel 5.14.0 (mainline.kernel.org-clang, f1583cb1)
Message-ID: <20210906114804.GE143157@black>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	CKI Project <cki-project@redhat.com>, llvm@lists.linux.dev
References: <cki.7AA94C9FD7.OQ1DPNIFYL@redhat.com>
 <YTK7aNSIjU3KmjH8@Ryzen-9-3900X.localdomain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YTK7aNSIjU3KmjH8@Ryzen-9-3900X.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mhofmann@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Content-Disposition: inline

--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Fri, Sep 03, 2021 at 05:18:48PM -0700, Nathan Chancellor wrote:
> On Sat, Sep 04, 2021 at 12:10:14AM -0000, CKI Project wrote:
> > We ran automated tests on a recent commit from this kernel tree:
> >=20
> >        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git
> >             Commit: f1583cb1be35 - Merge tag 'linux-kselftest-next-5.15=
-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftes=
t
> >=20
> >            ppc64le: FAILED (see build-ppc64le.log.xz attachment)
> >              s390x: FAILED (see build-s390x.log.xz attachment)
> >=20
> >     ppc64le:
> >       make options: make CC=3Dclang -j24 INSTALL_MOD_STRIP=3D1 targz-pk=
g
> >=20
> >     s390x:
> >       make options: make CC=3Dclang -j24 INSTALL_MOD_STRIP=3D1 targz-pk=
g
> >=20
> ppc64le: https://github.com/ClangBuiltLinux/linux/issues/672
> s390: https://github.com/ClangBuiltLinux/linux/issues/1356
>=20
> This is caused by the implicit switch to the integrated assembler in comm=
it
> f12b034afeb3 ("scripts/Makefile.clang: default to LLVM_IAS=3D1"). Please =
add
> 'LLVM_IAS=3D0' to the 'CC=3Dclang' commands above and the build should be=
 back to
> passing like before.

Thank you! I filed [1][2] to fix/track this.

Cheers

Michael

[1] https://gitlab.com/cki-project/pipeline-definition/-/merge_requests/138=
2
[2] https://gitlab.com/cki-project/pipeline-definition/-/issues/77

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEESkj+nUoxcaBPfdaAb6JiPRRgv20FAmE1//IACgkQb6JiPRRg
v214fA/+IZ0wo+yebD/4mI0K6YSNgqM3twxyORtLoIhLWl7Cj7wJUFJsyznGuTt+
/BD48tRdLoT35w9SY55Q/NFFJBA4aKyR70w7dZLt0Xj1MZPUeGE12EkEKvIO/NvJ
8qGXdlEG4Yn7qyk0HHMRQ5wLJu8AuIfcpo+LcdDvQ7BfBdjn5w4jpApdgiUwLZBK
yRlpCnM/pSpYhh8f4EcC50Dvh5wXCzM7s0nWmq17SQAQTdGDgutEfxz/ZMhp9aCI
iKYUh3o7uK18PEVbfM1RHf/IiIljEqyEW1JNRtbmLIo6Z+O0ClIMijDZokiex7Y8
HbVy+gWAXZVyQOGfQLdXwPxwerB8BlgbbrumsHFjnq+N4UmvXqgLIcIF9uY6u/qQ
wTFw0RI5hO0/BCumM4o+efCLNfx/0tlV1H+yy+ZDPUk+xgqWqPG1AIrlz1MBXsnc
DFhz3HkANKbyROjaYGE51S3MVUhnULugfz8YV4YkrkCurl+C6DB4VKaJiDnYbHlL
SUYZZ2mQ/l98X3zfpQn6YHGPL1zFsLTHIDyVf4iMCZQq8FRNkUwJb44hIvt4UgPw
C910410K+KJdkMa3nCyhNJmhkaTUZz5iVjvyckxivk9hoJcALdPbylffDhj09png
qHuh5byEBhk9ED/L29gafMSjMyJ7CTGPHalN6GrhtSK8vBlr2GI=
=xYOc
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--

