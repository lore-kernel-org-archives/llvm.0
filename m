Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F8139FCB1
	for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 14:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631475; cv=none; b=jE4ROboGkrN0BIznTS5hMa95dZofmf54b2ukUR0xCVbi4wYo2vHiy7zhYYZNZlI2oD634uEkz0Ser0wK4HleMmieSzs0SgFRFP9JWVIWFNY11X1zZZoi0xyW20qHj9JF6t2nkfuVuGBrht6ZsPAp1pHYQo4HZxAs16//LwUogpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631475; c=relaxed/simple;
	bh=AaqukwTvvcsBWypfN+zPK9grkVcaWN4UuvP4kQ2j4Lg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LTrNzy6Xv4D2wB6zpyHDYYPSZXEpnQ9bfivmVJSntQrSBihC7nYOuU0k1HZzi91rNGzjsw5piZEiui8lFcUefxLNMiGDlVCYWaR5NIkiWHDUXS8F1CnLwnskV066eE38NDqnmZLpj7ekXHa4W5Qqes3Jk6L31rSHJ5iRN8HKhzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hRMpNajt; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hRMpNajt"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hLSTT2Z2Zz8vDZ;
	Thu, 13 Aug 2026 16:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786631469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Sn1VIZwryE8kW4E+Ahizg6Crjnd5KmSy/koYSfKmlM=;
	b=hRMpNajtw9mBHGzZzq8BbGvaDC/55rEhJ83uvvcW9dE/DsmaaMCeD3RgGdt2s/8SsIa7v3
	r8F+i+Z2wE1ZaV3ly6CntKCD98WhaTFUHFHq62l6/6BW+4VNvBKhh3AiMwAUfig1dzLFpw
	xX5+9tBZEw09msdskTPZanV/S0AuXmxaXvrmEb0lMi3CpJjCTg6C86ntSfSO0zlwmVAOQ+
	TzSTX+NsyOvRsP2F8LqVtNvJ96ccCOH7NdftBFZRuuEMccGdkS6Qltf0vN5z1S+GVRNAXK
	4H6XJIWWPXoi0XT/EgcStYvWybmkq1Qcg3dGQjQ47PpI1Oda+sRBAWtZIyYQLQ==
Message-ID: <1e2d501f4da31fe945b839e648044de3501230fe.camel@mailbox.org>
Subject: Re: [PATCH 5/5] Docs: software-requirements.rst replace optional
 tag with footnotes
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida	 <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>, Nathan Chancellor	
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Date: Thu, 13 Aug 2026 16:30:55 +0200
In-Reply-To: <87tsoyi2k5.fsf@trenco.lwn.net>
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
	 <20260812122426.1636227-2-manuelebnerli@mailbox.org>
	 <87tsoyi2k5.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-META: wqb37wku7584xmf1hqihzq1iwwxcrzag
X-MBO-RS-ID: aed8cf22841651194df

On Thu, 2026-08-13 at 07:15 -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebnerli@mailbox.org> writes:
>=20
> > The optional tag isn't obvious nor defined. Therefore replace with foot=
notes
> > like the one of Sphinx.
> >=20
> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> > ---
> > =C2=A0.../process/software-requirements.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 22 ++++++++++++-------
> > =C2=A01 file changed, 14 insertions(+), 8 deletions(-)
>=20
> Explaining the optionals seems like a fine idea.=C2=A0 I'm a bit less
> convinced about the mess of footnotes.

Maybe footnotes can be reused when adding more to the list like this:

> bash [#f1]_            4.2              bash --version
> bc [#f1]_              1.06.95          bc --version
> bindgen [#f1]_         0.71.1           bindgen --version
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> .. [#f1] This tool is needed to [example use]

Or they can be avoided altogether with (optional) tags and with requirement=
s
in the paragraphs below. bindgen is already like this.
For me that's the fallback option.

> Especially since many of the entries that are *not* marked as optional
> really are.=C2=A0 You only need e2fsprogs if you're using ext4.=C2=A0 gdb=
 only if
> you're wanting to run a debugger.=C2=A0 jfsutils seems truly optional, et=
c.
> Even GCC is optional if you're using Clang.

I came up with the idea today to limit optional:
>     ...
>  you probably do not need to concern yourself with pcmciautils.
> =20
> +Tool(sets) with only a few required uses have a footnote mentioning
> +theese. Tools with more uses are elevatet to general requirements.
> +
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>         Program        Minimal version       Command to check the version
>     ...


> I'm not sure what would be best...perhaps replace the --version field
> (which people can figure out) with an explanation of when each
> dependency would be needed?

This could work out, it's the widest field.

An initial idea was to add a row and keys like this:
>  ...
>  you probably do not need to concern yourself with pcmciautils.
>=20
> +The Required for row states which type of interaction with the kernel ne=
eds
> +the software. Multiple entries in one field are possible. If the field i=
s empty
> +this means it is to complicated to describe with this key and you should=
 get the
> +software just in case.
> +
> +Key
> +---
> +Ch change code     Do documentation    Co compile          I  install
> +Bo boot            Bu bug hunting      A  analyze          M  misc
> +De debugging       U  use beyond boot
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +   Program       Required for       Version       Command to check the v=
ersion
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +bash           I, M                  4.2              bash --version

I ditched this idea because the table would have been to cluttered and it's=
 a lot
of work to choose keys for each tools.

> jon

Thanks and please advice
 Manuel
