Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941530B50F
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 22:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777241053; cv=none; b=kNMi59Ns5VUCUzdEQ5ipLoj7MqJ4COyp5LswWTaPyc6Y7fQbr22+iB4LnaFIC1nImKX9Wn5DLFSd1IuEWfCAFt/11vhQcxcOvdUnsJTTXoGgb2LfEZUlcQ3JbFMvL3te/2Qm9jKsYSby4C2ISggAFOz3irQcoOR0VyqRQgBcbgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777241053; c=relaxed/simple;
	bh=bchPTyFZ9H1PCbGJT7Y+DuDtB6LGefR0py0MYE/4h2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EswaSzsqMFHpz5AhGnQ+cyEo40dMh4exa8ENvy+yA5Hp6NcrrdteBYXNnEH5DZkc8f2SNekuffNR8yQcrZyuf8p9HQrYPxbxLgZDPrPANBVxZsLJ44zyJr3kPsYQ6zV/72H0ULX2QNP3oyRUFzbxL5hPxRi2NM353fCvoXYf5kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBZGfVQh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBZGfVQh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso95849695e9.1
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 15:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777241050; x=1777845850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOSUyfe/TldkyeaDzXd5HdT1X+MuNFQMhpVSGu+NHxw=;
        b=VBZGfVQhDSeS6OUdwVrwksIlYIFbRLInMTKHo9vtZjPfHRmnWoEW/jqGYCmjeepZsV
         ZgDFgEUlRhmkh5j3eY8tDA/lyHZR9WBtyLZUoMljoVp+DcRajusS+u3mKSLft4fTarnp
         i9hbvXMnqvReeJRa4qTCcxIh+ohsPaPGLQNtJ9kYQ6iPBSRjeR5ueFtZwGC7NEtZyUeg
         66/DVSAoz+9A3j5X47fYD3AYR8BeavWRxTJwZeEzRbieqgURXsFZ7RiMorNFdNK3ic+T
         dUHf9djgjAj/GWCP+hpU250CAw9BXQep1HRD0YxtS2oUiBHjX2gyGQrNHp30K3ZIeKqi
         gtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777241050; x=1777845850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOSUyfe/TldkyeaDzXd5HdT1X+MuNFQMhpVSGu+NHxw=;
        b=UJATkWoN4HoHUiAN2kjtfxhNQ2Dv5PBXKnnAl9SDmwXQMTZ1SSp+tCEFQyODFRxKoB
         zFm+I4D9h31dkPKM+hsNC26E6rwGT7SE3MOSBLWoCAXSC6JOP2IwQwiUttNcl5GPKvGj
         GTQVIhS80uZM7TnrJVT5qS+xkk4jaK6/msc9oa7/VNtoFjKAn5cUFnE+g8Xq/MTcpHAm
         DK7zL8b8MMz3zKa5zxeoaOXnnqlPofMRYxhgCMlhTZIhoLIj9VqbEaBZrWq79EapiDU3
         X7wgWfrxHhR4fcnrSsp/G74IEeGn8301w6AnTYZUv3T7d0aCepPuhlXop9dKPx2WiTkR
         rQHA==
X-Forwarded-Encrypted: i=1; AFNElJ+ds/mTWfRPQ4Vlb++GYUT7cKWJIEAlI9HyVGxbnjWq0JndELhbPcDMQEZzrMl911pFQfxC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3gwghgSIWA7dG/7HVWJiIJ5y+cHP60uvyzOFe1+H2PIQn1ys0
	DzmIHXYyaUvxudbrcVuSCaBPvFHs40ZypbqDir4VUHWqw3938oF2Qjts
X-Gm-Gg: AeBDieskkjQjI23luU9O+aXNQZwPHXIFJ9LkTwWqgA+zRBOjokzyB5q2LvaT3DI04kR
	qQCbRPlUaNC6QxocUoaDl18m0Qv9WEzHkxH+LsFElKEn4gcRcTWukcNnQ+T9NKutk/2//NyjgMV
	tj7cMK3RO/Z+O8DQJE5bRTlBEKni+YWy8lYN33M2I5m8vqdFGAjmGkGXagPW9QBKfpg8v4ihFT6
	+OOdrZyC90xK6epia7j+N/oPlrtYbnJzaPjrbQ3kH07rhy/dTlr+va6ZULSj1F9V9wh8MrRBmde
	iENqkgdh0tA3bbeYDe3LI+tHHzWSLBo50xJRmb/MiVCz5BmP2/yCfDjfUgOFwX1I/+w9Bd8pcXN
	YF9+QrZvS0wSJWefjO868NsClQTaqwOm8JrPpQhhW396DG1jhmWhPzivFyvibNnMhr1E3DUx/Or
	CtwOcxz1Kype4pbLBXu4lM6aCcCS7IIELLHn2d3mPvpf+LuC6VLvmZCgqMJoZcPRtPXmrcgSkAE
	/I=
X-Received: by 2002:a05:600c:3150:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488fb8b9debmr118860245e9.13.1777241050182;
        Sun, 26 Apr 2026 15:04:10 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55743c06sm137051075e9.2.2026.04.26.15.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 15:04:09 -0700 (PDT)
Date: Sun, 26 Apr 2026 23:04:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Mukesh Kumar Chaurasiya" <mkchauras@gmail.com>, <maddy@linux.ibm.com>,
 <mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
 <peterz@infradead.org>, <jpoimboe@kernel.org>, <jbaron@akamai.com>,
 <aliceryhl@google.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>, <tamird@kernel.org>, <arnd@arndb.de>,
 <nsc@kernel.org>, <simona.vetter@ffwll.ch>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>, "Link Mauve" <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260426230408.489c68c3@pumpkin>
In-Reply-To: <DI35IFD8M019.2WGRH5ADW6NOG@garyguo.net>
References: <20260424054742.45832-1-mkchauras@gmail.com>
	<20260424054742.45832-6-mkchauras@gmail.com>
	<DI1E781QPU8F.1C28PL0089NP6@garyguo.net>
	<ae3C2gqzoVaovY-h@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
	<DI35IFD8M019.2WGRH5ADW6NOG@garyguo.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 26 Apr 2026 15:20:31 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Sun Apr 26, 2026 at 8:52 AM BST, Mukesh Kumar Chaurasiya wrote:
> > On Fri, Apr 24, 2026 at 01:43:43PM +0100, Gary Guo wrote: =20
> >> On Fri Apr 24, 2026 at 6:47 AM BST, Mukesh Kumar Chaurasiya (IBM) wrot=
e: =20
> >> > From: Link Mauve <linkmauve@linkmauve.fr>
> >> >
> >> > The core crate currently depends on these two functions for i64/u64/
> >> > i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t =
use that in
> >> > the kernel so let=E2=80=99s panic if they are ever called.
> >> >
> >> > This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udiv=
di3 when
> >> > CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the =
kernel
> >> > build on PPC32. =20
> >>=20
> >> Can we always build libcore with `-C opt-level=3D2` even if
> >> `CONFIG_CC_OPTIMIZE_FOR_SIZE` is specified? It feels like a better fix=
 than
> >> stubbing things out.
> >>=20
> >> Best,
> >> Gary
> >>  =20
> > The issue is not coming from libcore itself. It's the driver that's
> > causing this. =20
>=20
> Sorry. I quoted the wrong part. I was asking if compiling libcore with O2=
 gets
> rid of its use of the builtins, as that's what the change this commit is =
for.
>=20
> Formatting of u64 will be needed, so we should make sure that these works=
 as
> intended.

This code (from nolibc) will convert u64 to ascii in any base:

#define _U64TOA_RECIP(base) ((base) & 1 ? ~0ull / (base) : (1ull << 63) / (=
(base) / 2))
static int _u64toa_base(u64 in, char *buffer, unsigned int base, u64 recip)
{
	unsigned int digits =3D 0;
	unsigned int dig;
	u64 q;
	char *p;
=20
	/* Generate least significant digit first */
 	do {

#if defined(__SIZEOF_INT128__) && !defined(__mips__)
		q =3D ((unsigned __int128)in * recip) >> 64;
#else
		u64 p =3D (u32)in * (recip >> 32);
		q =3D (in >> 32) * (recip >> 32) + (p >> 32);
		p =3D (u32)p + (in >> 32) * (u32)recip;
		q +=3D p >> 32;
#endif
		dig =3D in - q * base;
		/* Correct for any rounding errors */
		if (dig >=3D base) {
			dig -=3D base;
			q++;
 		}

		if (dig > 9)
			dig +=3D 'a' - '0' - 10;
		buffer[digits++] =3D '0' + dig;
	} while ((in =3D q));
=20
 	buffer[digits] =3D 0;

	/* Order reverse to result */
	for (p =3D buffer + digits - 1; p > buffer; buffer++, p--) {
		dig =3D *buffer;
		*buffer =3D *p;
		*p =3D dig;
	}

	return digits;
}

int u64toa_r(u64 in, char *buffer)
{
	return _u64toa_base(in, buffer, 10, _U64TOA_RECIP(10));
}

Not hard to do without any divides at all.

	David
