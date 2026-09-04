Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30B73346BE
	for <llvm@lists.linux.dev>; Fri,  4 Sep 2026 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541393; cv=none; b=kSwbfu8+QjAGpke6jDOuhH10GcdbcpfwEIRfrCMyM22H6FfIkdS8n+EVxlN0QCsaf+hgsqcIZfKVafdhGe1MOlt2IFNREIzADjL3HLvz7KUzbtvqhWXOibzLvZ6HO1PCZgbRdEgrGQ9ye3tVH3ReRfw4fbf+ntbkuUYDFfZZn9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541393; c=relaxed/simple;
	bh=ecK2wmAuZck7TyMU7udH9uLRTjXBYq7BHeTCuCIQLpU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YDBin7N4OdSjgRTui6/Ctbge5TVBkq2Bnv3HUT5CnU4/W1dDMWR5B+K/usyHnkFFTdyH3Q5OBLgFK76KhzTkLSPkM/pSyGynFr2w0/dDHJMjE64rZZVfxzr+dDBH5v8X/SyQuWeNEl3KX9249SYkDfF7Mg/N0agsOEvc7dmd3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bhotPMVd; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bhotPMVd"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hc2pZ3Y6qzKvyN;
	Fri, 04 Sep 2026 19:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788541382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bdiMxP0fkSWQuv353d3PCw4VyXVaYVxJwgR/0Ra358=;
	b=bhotPMVdCjL8jTLdwYiuKc1uhLsDGe9Hhly+guT2Wxb7v2RWN6pEl8uv51R5QmR6Yknpei
	xTU4Gf0omSEe5W4CjMbcbKby93Ci32d1/ZU/QOxdkwSPjfWPnW4CxKvbc8roxRe3BikdCt
	AEYCA8OMQQfIosr9jL/Cy9H5t8IzMoakiBTJ2/Uu1JbI48lFXS9TOCyNf+kVb7rDFGcgcj
	3zvQBcJlmIFUsD3E+mgqqH01QnFTHWFpAAT5l2nb18cYn6SXNRz8XAKZyHimtJVfJQNixH
	l2E4q0+i0gH50jWdsofRy+7KBt4/dkAA0HzMWqsTe2t3dlVHTy9uslVKX/vo+A==
Message-ID: <a2066238d2be3cfd36cd6ea3a7bf11206cb0a02a.camel@mailbox.org>
Subject: Re: [PATCH] v2 Docs: changes.rst: introduce optional column
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida	 <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>, Nathan Chancellor	
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 workflows@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
Date: Fri, 04 Sep 2026 19:02:52 +0200
In-Reply-To: <20260904-stirring-zircon-frog-ea6949@l-nschier-aarch64>
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
	 <20260831152523.638881-1-manuelebnerli@mailbox.org>
	 <20260904-stirring-zircon-frog-ea6949@l-nschier-aarch64>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-META: 37xjqxrzxx17uwir6atstjf7jz7irh98
X-MBO-RS-ID: 59b361a7e629ce93864

On Fri, 2026-09-04 at 18:11 +0200, Nicolas Schier wrote:
> On Mon, Aug 31, 2026 at 05:25:22PM +0200, Manuel Ebner wrote:
> > The optional tag isn't obvious nor defined. Therefore replace with colu=
mn.
>=20
> Why do you throw away the 'Command to check the version' column?=C2=A0=C2=
=A0

I would do this to get some space for the optional column and have
the version commands in ./scrips/ver_linux . See below.

> At=20
> work, we have a script that uses these commands to check the actual=20
> tooling versions.

Well, I don't want to break that.

> If there is a reason for change, please document it in the commit=20
> message.

Will do.

> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> > ---
> > =C2=A0Documentation/process/changes.rst | 84 +++++++++++++++-----------=
-----
> > =C2=A01 file changed, 42 insertions(+), 42 deletions(-)
> >=20
> > diff --git a/Documentation/process/changes.rst b/Documentation/process/=
changes.rst
> > index b3fa980b63e3..905ac0f6cdc5 100644
> > --- a/Documentation/process/changes.rst
> > +++ b/Documentation/process/changes.rst
> > @@ -29,49 +29,49 @@ systems; obviously, if you don't have any PC Card h=
ardware, for example,
> > =C2=A0you probably do not need to concern yourself with pcmciautils.
> > =C2=A0
> > =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Program=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Minimal version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Command to check the version
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Program=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Minimal version=C2=A0 Required for=20
>=20
> Do you want to align the column headers to the left or center them?

I should have done this the proper way but i didn't.

> > =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -bash=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bash --version
> > ...
> > +bash=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > ...
> > =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0 =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =C2=A0
> > =C2=A0.. [#f1] Sphinx is needed only to build the Kernel documentation
>=20
> I kind of like the "Required for" column w/ naming=20
> concrete Kconfig symbols or envs like ARCH.=C2=A0=C2=A0

Thanks, do you prefer your scripts working or the required for column? Mayb=
e there
is space for both, when 'program' and 'Minimal version' get squished.
Would one of those arrangements not break your scripts?

>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>          Program        Minimal version    Required for        Version Co=
mmand
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

OR
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>          Program        Minimal version      Version Command        Requi=
red for
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

> I think it would be good to=20
> get this a bit more complete, where possible.

I have only little clue about tooling, versions or Kconfig so I'll need som=
e help with that.

Thanks
 Manuel=20

> Kind regards,
> Nicolas
