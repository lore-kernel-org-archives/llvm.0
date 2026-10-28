Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191276;
	b=5Pa+6yNmU+mKM8jgDKOU6o0WJncwa2Q7hb0EOzdj34xcWKhICW3Xdxhp4vKs0qToQCbD
	 ROlFD+LJ8KwOnyCErVBBEAW5bU2JFIZyYHJKYbQ1MPXxBGvkx3gktEPnEiFxvfNNH5+mL
	 WXSOY75+DaZyMIvgu3mRVgiyZAbs9DoJiR8og0ysdKxmguw5sN5Q2kjEkFE9TPwmRY4hs
	 PbXWbvVxeFSCCGPBKNgHmwT2oNYI6XFra2sRthzdrHErEOSR5X/MEDUuwY3tAqiZBzMy2
	 TxeThsgmwIMSu507NskD5ZbsLwVL+RhfcfEsp1Zy6aWTtpSUyA0C2WTFe0f6wVF6mIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191276;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=e0UBROY7KaKrhWtvVs/7E67ZIbApVc6Ak4SwO3wWBq8=;
	b=VRMiT+UGJKn9HuaebP8TTSfwJz4DlnhNJHJCUqCjCovRqcuArG2MZz5A8kk3L2xLYgoQ
	 tyh8ZkfVprOXQf267ePgrc0Qi2wYO9Pdud4VXAlEg0SqooL4y7zp/viNA+I6EiKs8xrOS
	 Qr7EFK6ymf1tTWfdMN+5i/WrNZusywQ+45PHJIg0dj2lDTHN06tb2RbOjc/Oo7aG17eXj
	 BDYC+tyctVXRNYvQVEemLGjNnyKtPRHhE7zo+XcCIm8bnsbMXbd6+a62ipVGr/LALGuxn
	 c8dmRA+LwNutybIc6sbQmNE44zBGQDY+xTscBw1mHupNKXc7OdTuEsl4MLMZxYV2Pkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Cw/uvTrN";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D157606A31F
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 12:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D157606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Cw/uvTrN
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso660563a91.1
        for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 05:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191276; x=1793796076;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0UBROY7KaKrhWtvVs/7E67ZIbApVc6Ak4SwO3wWBq8=;
        b=WngTUIm30HDhFo7o9Vy/6EXQnxsp09y9QJ6nObRcDQLhaf139G071xFxnbVt8D7twY
         MqI28WLXyGIwSd4VDg+ZxGfZvNr+dbgFtFK2zHR9unpX9Vfcs4C32X9UKgLN7NMI1FHR
         Rc9o+0UBUpEkpdnbtUeED8UQjDSDdl5txX/dDcEyInOfxDAqa0rW/lclc2VlcJMeYEq2
         Xkdrcs9t2Kl5l5qv/MibqrHcmh5j8ZGEoSUTtC55mweVECRl9539TBfacxSPjfDTYf1R
         ointZyjqZ7l8eWE5s7gKsxzHVjMzUBcEWWMkJZiYhVjwuM6qaf9llIzaNOZHJJW11+vH
         gM6w==
X-Forwarded-Encrypted: i=1; AKwUvBzbcNLhCxcZzmopWrqPQrgqxkwniJrFVx5M5AtucCpS6SBk/0Vq6UvFRDGjSVtFMtJdXs3O@lists.linux.dev
X-Gm-Message-State: AFq9FYKspPONWNughJAS2hplOBXCJZgjZf2GclXAoY5ROy55hANY7Zn5
	6J85iD/DNqDfmz8Z0yNcvSxm/v3z7lWyXMG/hUrKHgpDxqdt3zjGaUwhRv0Vo29t56nrILKdmJD
	B8Eo/BQGkQD0xUJJL14fv3J5CPiIpYTZlD3wRkUCRtIdMjevInF8CHm2gaSj3uitFNZuwIov9qB
	aV0qhk4nUR8wQ8lOfuIR/fimBlFNxAISTnKLL1xgdB1064v45GTTD+YukeftqNnrU5I0v/gVYbV
	ZqwjQ==
X-Gm-Gg: AYBFou2Cl3oFt3McpI9anqQFNPABRzWEeW9yFPaHwNGaofP9c1kOI1vP0gIJ48ZNzHQ
	Stqj2zHiQ1J3CijRz8VrdDkfAlXaFC9UBFIqqhEJHktXvxoLlo+VcqcJvCy0fwS49V5NMxwLlHu
	ZymHSld7D7oipr95bx/XMYtYlnxGNf3myio8CG0Lc9dfu8cb42Y3YW5LZf6ulbgDDk42RPcolrW
	2fDHrKPirdfnodhwAHOmUl5tNiLQL6VPo+N11v3d4kkaWysJ6NqRicah9Vyg3XeR7+pjE8XwU23
	zUdv4PsZd7eEGhROyTjnPd8O9fK3gSkCEZpRN78wfHZAXePnSxk+TMLmmBVozA3eqx8VaADpIJh
	fahBHLiR3b5mNoI17HvsLTRmSduyOoaWUoWAyjXFkWLAViIoHW7DBeEQIjIu3YP7SZ3WkvkbSgX
	S8/pvAPs6c+CZwT1zJXQlzfFHj3h/sl0HU
X-Received: by 2002:a17:90b:564d:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3ae5823acd2mr1618250a91.60.1793191275482;
        Wed, 28 Oct 2026 05:41:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae57a1aabfsm699472a91.3.2026.10.28.05.41.14
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:41:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ab2de4544cso4223811fa.0
        for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 05:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793191273; x=1793796073; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0UBROY7KaKrhWtvVs/7E67ZIbApVc6Ak4SwO3wWBq8=;
        b=Cw/uvTrNKE7NC6uTkCBsUIYqRfU/BBjmCH5OJb25BZqQdO2BDGtAH/Y8YjG/wlmb+G
         WJn0l2UhZAJEy6Wj1iXtrq0SjJr2lhWAd3Hgi+Hi0akI+5avCy1gkbRQ1jMRvEM7YGAD
         LeErn3HUhO7oJac656GnmebERHBKC9gzfDccY=
X-Forwarded-Encrypted: i=1; AKwUvBwNuSZyOGgm+mMEydRyFSz5w5WUBW1fKLD49zDzk53uldT7dGIA0njKH9yI+xQiuxL5NL7y@lists.linux.dev
X-Received: by 2002:a05:651c:1593:b0:3a6:95a:52a6 with SMTP id 38308e7fff4ca-3ac9cf82d06mr5144411fa.20.1793191273086;
        Wed, 28 Oct 2026 05:41:13 -0700 (PDT)
X-Received: by 2002:a05:651c:1593:b0:3a6:95a:52a6 with SMTP id
 38308e7fff4ca-3ac9cf82d06mr5144181fa.20.1793191272523; Wed, 28 Oct 2026
 05:41:12 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
 <20261028082724.GE2668804@noisy.programming.kicks-ass.net>
In-Reply-To: <20261028082724.GE2668804@noisy.programming.kicks-ass.net>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 28 Oct 2026 08:41:00 -0400
X-Gm-Features: AclHuK8ut6bSnBp6Y6V2DclJ4JCRJx1r3_APd5D4CA092zg18Y7LFlwv6-znOuE
Message-ID: <CABQX2QPwkot4tf23dt-Fv08a+15OUN8Z1hYLHGMa7Z7KjUq_DQ@mail.gmail.com>
Subject: Re: [PATCH v1] x86/vmware: Fix i386 high-bandwidth hypercall arguments
To: Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	virtualization@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, 
	linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ddce82065ee5e0da"

--000000000000ddce82065ee5e0da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:27=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Sep 03, 2026 at 12:07:20PM -0400, Zack Rusin wrote:
> > The high-bandwidth hypercall helpers push %ebp before loading the in6
> > operand into it. On i386 without frame pointers, both GCC and Clang can
> > address the memory-constrained operand relative to %esp. The push then
> > moves the stack and the helpers load the wrong value.
> >
> > Typical i386 configurations use the frame-pointer unwinder and happen t=
o
> > address the operand through %ebp. However, UNWINDER_GUESS is available
> > with EXPERT and permits the affected frame-pointer-disabled configurati=
on.
> > vmwgfx is also available on i386 and calls both helpers.
> >
> > Stage in6 through %eax before changing either stack register, then save
> > %ebp and copy the staged value into it. Load the VMware magic immediate=
ly
> > before the string I/O instruction. Mark %eax early-clobber so it cannot
> > also provide in6 or an address register for it. Use the same sequence o=
n
> > x86-64, where the full-width register preserves in6.
> >
> > Fixes: 34bf25e820ae ("x86/vmware: Introduce VMware hypercall API")
> > Cc: stable@vger.kernel.org # 6.11+
> > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> > ---
>
> So I despise all these hypercalls that muck about with the [BS]P
> registers. The Intel function call convention is much older than any of
> them and yet they chose to violate it.

Personally I reserve my "despise" for more important things in life,
like celery or subscription services but I understand the sentiment. I
don't think anyone's here writing love sonnets about this convention.
I ranted about this internally in an old man yelling at a sun type of
way because existing hosts and guests depend on this layout so
"fixing" it would imply adding a new convention and still having to
support and fix bugs in this one.

> This is both vmware and hyperv.
>
> If if were just me I'd have nak'ed the lot. But alas.
>
> At least ARM64 people are (afaik) holding up and telling hyperv its
> their problem.

Our arm64 conventions don't have this issue ([BS]P just goes through
x6 there) our x86 low-bandwidth helpers also don't have it. I have a
possible path to fixing this in the kernel (we can't do anything about
our hypervisor but you don't care about that) by completely removing
the high-bandwidth vmware hypercalls from the kernel but it's a large
project and wouldn't help stable.

z

--000000000000ddce82065ee5e0da
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIM+z
NPBPuBFFd6i7wJ4pqvIbwpCRs0OTNhI/N38Kc/sMMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAyODEyNDExM1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHLcF7Impa0aub9NE+1czJ8EIpd1QM2h4aU0XrVh
eaY/LN/iUnhxo7bqGWPIEcTxDu/C+YxzQHWLqsHGFM+gU+WJjiTW9xah4moyyVwx3AaCZaieLkoH
9NbFHN7T+OE0PP8SSYfLfic5Ye60j+bsw8sCrZHbxN+ngu7ohKi6UjvAlr+BxrzkqBKNLaKDoM/h
XDK+CFuMvU4klHpFQsDLrt8fQmext9+jDp+A8Yjrq3yqGMGCSN2cnJYxcYvgB9o5n2qq308iLfqb
CCj8FIzuaGyYkN0PTmiPFYFcAK8O8XiScP+I8k/dxRo6OGqBRgnZKb6HJC8VZQluSdRpHIHvIA4=
--000000000000ddce82065ee5e0da--
