Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954CE41E4E
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 22:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708124132; cv=none; b=I0eehOlIbu3FGdSvAPXyo0CCAaP/ITl4hgBZ1Q/jccV2TmtNmIZBVYW8eCsGtmzEyWyTRG2xjBmYt9vV4/KUbopLVNCVD0Ms6wZsi43HdI0iXI8kIjpN+aXehJ4wTg4uIELzmHNBLGT4lP3iUIVJiMZT4D+3rX7FiUflhrYyNS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708124132; c=relaxed/simple;
	bh=Rkz602uVR84kWe4yxGKeOpgN91RwroBuT17j7ydDsTM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=SU/dnG65XnC3IYchT0p2HmwIdzXowQ3bBV4eLGpDsxzgl7ir5ZcN+VyQz+uGXTRSzE2dpMwpZfTEgapB0wHSd0XEwvtX+j/D4dAWCOJjR38hMIquS0OBOwMjm7PthzDL5q6JW+rkwUIGGD1bWscuV1NhxO+V2GqUnBgII4IyVqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-32-nkuJsbMhOkORTovbgZB2Sg-1; Fri, 16 Feb 2024 22:55:21 +0000
X-MC-Unique: nkuJsbMhOkORTovbgZB2Sg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 16 Feb
 2024 22:55:02 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 16 Feb 2024 22:55:02 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nathan Chancellor' <nathan@kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Kent
 Overstreet" <kent.overstreet@linux.dev>
Subject: RE: static assertion failed in fs/bcachefs/journal_io.c
Thread-Topic: static assertion failed in fs/bcachefs/journal_io.c
Thread-Index: AQHaXsd+8ES/EAzlpEu++WwpZeCmKbENloQA
Date: Fri, 16 Feb 2024 22:55:01 +0000
Message-ID: <6350380462904341a7802f9cf92eca5d@AcuMS.aculab.com>
References: <20240213215640.GA80329@dev-arch.thelio-3990X>
In-Reply-To: <20240213215640.GA80329@dev-arch.thelio-3990X>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Nathan Chancellor
> Sent: 13 February 2024 21:57
>=20
> Hi all,
>=20
> I am not really sure where to go with this, so I figured I would loop
> some people in and see if we can figure out what is going on here.
>=20
> After commit 67a8e7de7ef0 ("bcachefs: Clamp replicas_required to
> replicas") in linux-next, I see a massive error occur when building for
> ARCH=3Darm64 with both CONFIG_BCACHEFS_FS and CONFIG_LTO enabled, which i=
s
> important because arm64 defines its own __READ_ONCE() with LTO enabled.
> The error appears to be related to the minmax.h changes that went into
> 6.7; I think it is specifically around commit d03eba99f5bf ("minmax:
> allow min()/max()/clamp() if the arguments have the same signedness.").
>=20
> As far as I can tell, replicas_want and the metadata_replicas_required
> member in struct bch_opts should have the same signedness, unless the
> __READ_ONCE() macro is messing something up, which is kind of hard to
> tell at this point...
>=20
> I'll keep poking at this tomorrow unless someone else beats me to it.
...

(Spotted in the main list - I've replied before!)

I've done another check, it is all down to:
>         atomic ? (unsigned char)__u.__val : (*(unsigned char *volatile)__=
x);

A quick test shows that:
int q(int z)
{
=09return sizeof (z ? (char)z : (char)z);
}
returns 4 - so the type will be 'int' and your min() has
a signed v unsigned mismatch.

So READ_ONCE() is (sort of) broken.

Although I thought I'd added a '+ 0' and rechecked.
That would convert the LHS (u8) to 'int' and a signed compare
would then pass - but that might only have been for constants?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

