Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793619891;
	b=au3ePKPWpodtuUV4p7tdF/JBTr30/R54ma/U2oK1pRIZ41QKyce4i4ZZtCn7lzNtAkCL
	 Sicg5efvWRbMGhIQdo5ADlrZwvZgrvYQku1EWgvbXakunM4D8QNiyh6v6uatnO38EHcgW
	 UR+B/KPP6tZNIIRM4PSsnuML4Joxdt6wjddPhuwsGmu0EF5FFiFAYajTI30vivmVgzDR3
	 IIUgW1Svct8abqAQzof7UTILDuYs+xr872+c8bfPcvUOIrw/cSjgTBhFD/8TgU60H+2pj
	 uCrauuaL9szGRs4EabnbSOON0qq9/Vla/xYOD7U0m/IrJVLdSQoJB0YDNSahCkfOGtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
	b=AAEEbVv4z0IhgS/E+XRL6yxEqXKAC9/pK6YPy3xEfAZlDYrL77tl+jvb3C3hoD3MenWx
	 FDcE7vrPrrLhrAFpDm8+DCe1PwY+ySP1xtfYCLi+sivKKT6NC83j35q39eDXI/9kmvLAl
	 F7ViSR2nzWzTIghJwWnQRXWhpHaSRCXku06GCtpXwcdkpyANqrGGAUCYcwQhhlrLMs8ao
	 4ieFzvtkcSswgjhlktMobf84g5uweKYDgoyHhvXTb2FRARhR0FkSMJsQgSv9LSDg7sF50
	 7CTMr/r7JFIM0V3MGOIQH09s9Qo8gKl/JEJxczjU0eHvMuEetiHYsAkJw4jTPTPRjKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyatdTR9;
	arc=fail smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EF6606A326
	for <llvm@lists.linux.dev>; Mon,  2 Nov 2026 11:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7EF6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyatdTR9
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so2981342a12.0
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 03:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793619889; cv=none;
        d=google.com; s=arc-20260327;
        b=NCFYKoAcATn9BQ1HEKy/QgAYYo946oaDmnjTO51ED1298BsDFUHKJAfFrwzG2WcT1x
         zZp/PpGsTjbzQAamvoFS20RdEI0/RWF3E7o3/Ndmi38uMrPADKjU/cxPZ4z4CXaxHwkA
         HFy6iUL9aavgafJWLVsuE6ruIFFoRBsdAxcBU5X01NthtdOCPPqYfYh5s4+6vQ2pXZlA
         loaSxANcS8NgoyJamlbRjcKtVlDx8QJCCOu27K991T1/zBT3I+K8zF7hWzLsdw5sKdTE
         gDQlEW2mAd3dECCWcUVceO5PskqS+8kKX22vVhiGLzEAWEXRsdCWpOnQzijEAJvBU1GI
         wYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
        fh=7K646eoraxxNjw9FR9x0pB1jWiR5XjE5bJEWrtjKuvI=;
        b=J6opF46KwhCU4/91X16ys+DTTA+DOrUWe8SUR4aR9RcDYUB8mjy75+BuQqhcpRJWt0
         bfv2qeeIq40IhK9vwx9dv8FtWRRYm8R+Xr68Q18CHCXa5tnCjnFXr963o7wbh9xAW7Aw
         kM8iUaa/J5Ha9wuGFNWgyRyKpYn1PRO4sZHcrXLtmDwvUgegpYPd7BLcSBNq6LsrNWKF
         THHW+LfXYFjRS+oJMR1mu28x4xQegdXrgXS7dF1m8TJNCYXcBuc+oR2vPT+ZxT4rkt6G
         9Ss8lvHkICTt7vzvLqBh6iYCXSfnS4dT9tFdh0GGg5bSm1QZCDSZVPwToHFZtX/0IvZX
         1nyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793619889; x=1794224689; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
        b=nyatdTR9wmZZFNgIff/5tICrm14mBH/KOirCi6IJEGRqyVLe7ekGj6SFMbXbXewts+
         Enuvif5xNcdVGMJL5eejyQNwNBWE0jgqm0YIXYjEnEu8T79OREi3qGjnsYgGx/rzJeha
         oitablHvcIvr+5Pc0WuqxkFr7RhcRggmgMdTh6NlGYzrCevMTT8HhEFGayv3wBNoZahE
         s/JfQDIiNhAJ7qr/NnJBUgxN7o04/2OG+/o/DfB8QWvu2kUSoRZ8eml8U0G0MlL9HDYr
         cu75JF/Ye1Y5Zp8tLiHxEBuVPmQthsKJrFNQUk34rUwhyJundhmHU55Wd9qhyyy4CAQC
         ObUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619889; x=1794224689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
        b=WABpQF02LjkdmUeSYOuR9rNozLGwwEK2TcR7aQ45VnzmlmHPfroyetwAJmE7l7BvSZ
         O6Upf0AHp/eDk6sHiYqrjSRyJ3nvNPDYOuX5hH6vZJm/LP1IA2jWl8ru7Ei6zbui+yPs
         27y1DG6UoBgvjLMJOWHrc68HdLiuTejbuOezLIYmsphSBpK5gIhGoInv4IMdlfBKj3HE
         2OUhIY4wvba0tfzo75ssIhBpkCROK/IiVflWkcDj27MVLGrrvWminTVg43j7QTVhEZFp
         VtFgRnmcgWeAonrKwZhc81oYkmVO8V6x3DlVGKKIN0Xf/FqiSogsv9XaPw5pj3HdCo74
         d17g==
X-Forwarded-Encrypted: i=1; AKwUvBwbFHlPvNmpOP4TWzKZBbO3P41Jj2lXA3qN6CTBtqv8SKmyjbfZ5dnBfzU2mfMZC+7FESNO@lists.linux.dev
X-Gm-Message-State: APuU4Z/OOK+ay0bqr5bJNOdkOCq5o0NLEIClIrxGZIPw+lxwHPmK3u+d
	CU+8dQ9ddGQe0C7WHbN6/69Lq2Cqxj5BKvvSNhPs01P+kFNasshOXcoxjE3gQw1sUbZuwNLsSAQ
	DgHOTJQm4Mkq5hpyRDHiCtl4SGy6V6Pk9YTmh
X-Gm-Gg: AYBFou0iUbwU5wWwmUnQG/hhq8egJPlY43hBVN2CYCWio5nsAg6LFLtRrXH4AYNu1Oh
	Q7ZMhhF2Ur2MaSOSQtTpk68bLJfahEfhpW4pd4esAsOKbjRfVuKPDjJSm1JqcOah6LgfGOUUm+I
	gkJ3sLJEBUAuejC02fRKwn/l/M7L6+gDyjje3eMkzzRx0Alql/e4qFRwEp/68HN2wEFwf/N4BiT
	GOaTKjzrPwGqcsXTgnEiW6JLsT2BtgvMESg61L9OJ5SZNMMzJCiEzHk/Un4ekGEmgQFlk8a2Kra
	B9PPCwDGNhCNt8cKm6gYNI/r4TeLoNtpkCFtckyBWhDTsLgmEqlkZljWQu91YTEDlO0uCBecuN7
	0VKAKD2Rc2e9AxGCt2f7A9aLvUccv+ug6xX5YgUaI26I1TbaMjtTAOdKFPx2w4hCdcR0B5Sk=
X-Received: by 2002:aa7:c1cc:0:b0:6b3:f840:59b5 with SMTP id
 4fb4d7f45d1cf-6b4d4c71d29mr4850911a12.27.1793619889068; Mon, 02 Nov 2026
 03:44:49 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
In-Reply-To: <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Mon, 2 Nov 2026 13:44:37 +0200
X-Gm-Features: AclHuK9z8jjLcwsnJfsDSIZ0apXZZySDKKpQ7s2Xoes3fbuqIuVEpNRNi2DB1ZE
Message-ID: <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: Demian Shulhan <demyansh@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.com> =
wrote:
>
> I would prefer to keep only the scalar version of the fused copy+csum.
> It reads the data once instead of twice, and on real Armv9 hardware it
> cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> depending on the core (+6-8% throughput). It uses only general-purpose
> registers, so there is no FPSIMD state to save and it is safe in any
> context.
>
> If you are OK with the scalar path, I can send v2 with NEON dropped,
> the scalar path only, and the KUnit fix for the x86 zero-length case
> Jakub reported.
>
The scalar path seems like generic C code and not restricted to arm64,
curious how that performs against existing (e.g. x86) assembly
optimized implementation.
saeed
