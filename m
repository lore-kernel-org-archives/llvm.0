Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794422717;
	b=UPuDeHi35lih/VeRm4nh2z3hpGQsQT2d2DdZZH898D7oFMJ0Mji7bY4rAywGnpB6H/7/
	 QYsgfQSBQkmP0YJrD28KuZs0mWrtKg+5g+cS/unLTsIEyCMEXjUDu19ouAJnIg2OI/kpl
	 ez3v3T8dSl7tJNE+UgFmfyM33S65QJFL6x10dFpxtNKxH/cu6+po8rAeuv/p4myJqb3kn
	 X+PfvGhpdQyxVO9diy2xPmiVtVWveBi0qvOxv4G+S9CRIEb/TRdIGqJKVDYvwRQLYznJz
	 CH1jNr1DV9sWDtTv0oDtusGvvAaco5rLPA5LVDiy+mtqtp966hEJ+ipE7epl2n9PHug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
	b=KiWi9MKLTMgUkeIpwBsvaFhxnX2rdvZ3QOSNv54hbxMP4f7DrYxu2dQHAwGMJytsk0yx
	 rz2YuGtlsDrNok3A3/+UaEch6OGvitkLGXR6ibjwwcIBLgCpeyxdMm9baZjSsqkhcvbgp
	 SEVE6sPV53lcRNutyDxwH3alAgPegyDCeN6Ak1k4bnCS5THQNfSy+iSRt4tOxYgsersJi
	 2MECVywKCs0eaqrhqC7dKNT81bfS6ybifpfgzJWIXN8xnRvN4uKyy96tf92ZPPJrQvlCA
	 0P5JElffi1G1TssZU+IVlB1DueoZrONWyU6ahEZxFvZbOixQLnAoCubaGmy+QYpS3AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ON1TkDyi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808AC606A32A
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 18:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808AC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ON1TkDyi
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2374066f8f.0
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 10:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794422716; cv=none;
        d=google.com; s=arc-20260327;
        b=Dgo0iGmXJiIXbur7EHmTY1O9fu0fZVKJM6BOpBaIXjUXvOUw5AfKX4mKbDlWXpbTUD
         7RPEbmaRlM1tG1pp2gLaNZSmDC/T6xymXqmm+4ME+qrzL4/4eXB8OQop9oBpgbp6PeW1
         fw93DQu3+5rjpNBziDUljn+gvzBI88s7oXdoRgWuyAo96S7dlxG9WsWk/EhI/yzbUFWG
         olWBrps0Alz5qaF7cWRzm381CanBth5CZFbX0pMPiE/Tw2TnTZgzwICOT8qguZxv0mUK
         XYSSby3lQcEiQpYrRKhLan3tKd0ZUQvTU4Gm+l5JKgZ+L2HYefo+PXCaE1jzzXt7kQcz
         KduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
        fh=//1SQnSoRovBm83If0EYUtKXlX1wHu5ErXOho4Uva04=;
        b=rgwFhrulFwv45rwM99sX6vKtpS+7pIaR7HA09WlTyHbRvJFSqPRlSIcbHccMImIH9L
         G4n4ippwDV0aqxLh/UDx5zZwTSlOVfBllP2dCZ1masglUgC4FoT9NzgZ77UYirGubUXi
         o0JhTlYLsel4YAvgL5eZ4GvWcGhxuaWcI9xSLV3+qvKbwGvtWR090fvixYfrM2arGiAp
         x7txHKVHu8Ym9KGFxd2ghfrwNNU/zJuFIb8BZ3Vd7Mowvj+M2DvevdfFT0KU0kfFkPJO
         SUxL4hp7Lvx87Lf15WvWOzaC/gVO93FSpofjffyiFJ70i8bQu/jK1bTCLRJok54xOP2m
         pUPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794422716; x=1795027516; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
        b=ON1TkDyiDq4JRxCBcZD37M/rricpFDot23oFQP8uoTyMa40WKIlCn8FjmfvpHEmeFt
         P8rcvlJoGx8CU3ChuYaiF+bEnZfZfc/FqGYXmsJqwTQos0e67V/p9b23FMafqAERnQyw
         XcnqnNf4CMGEtZtgRXZVsRASWovm6xbZQmK5ixK9rkEP5rht5nWBKOC2+GDlIlX5Yofo
         bL9luL3Vuct78wVpvOxR91Y2eamgYQCOiddoXHvGFWYBzF21RHbzgU5U3D6rBF5CdxU4
         IXe0uuG5GVUUFPL7DdLmeHo0a0Nyo7diEbsL/fz1Kk5OH8jsUwdlYhIeEQEs1Wl9nuIO
         VHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422716; x=1795027516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
        b=WF6uAJwlm2aJg6suAEouYOofJO3AxjTqIECiW6Ky6ReAwdGC4X/4sHhHlOkEeQ/Amx
         1untcyauWxx/1YrxLPN/1sUjLjre+vQQGQ4heDkj2XWooifcNnR9/rmmbqNGpUjiqXnm
         4EOL2RXSm+Thx2MkJuTgt1hKGVpXa6k81TUIubQYN2zgPZXSZwC6YTU9EHZiTd35WOjt
         OcW3L2hi5IjOtTD2yIVwVSD+WHn3HR5apwpgLrDbbGtxKBftDg82idNsG66cu7fkbiLX
         MsjzPD30t58hpg8kJPrdGcaBWu1caN7bOT+Bt0r6wVauECrTZmiaInxYVAkNZevgQruC
         5E1w==
X-Forwarded-Encrypted: i=1; AL+hErGQu/k82Y2kwQO0vsxglkz5oX+ZjGgbeZJjgxI7VKpuMVv8S5psg9JzHtfQ8+QKlPJZKJn4@lists.linux.dev
X-Gm-Message-State: APuU4Z9xxecmk/rqRKo5Dk5IG9ZOA7qsXjCS8ssZaXoqtjRxznHLvzGG
	+yDdQoGYuQZWX9Csy2SY4zZtArjspG6/5+LeNguszpo6y4hddZJV1bP/qQRNFFROa89PqiIWvzD
	YYkpf+GM/FG2R2xik69Efbn/ZFsLrox/vi+miKIDw
X-Gm-Gg: AYBFou0jdiN4u2b5GgFa95Hg/ACFMRYNI4kyVY66cAG748rksxwbk5OYLb7nG7VCAL9
	sL4rGg2VHigeDVfT2Zl0ghYYBX0xFL3IF3JROERmP+jZ0IrLRa2zjWlVZqzVZZBTWpKHhLa1RsV
	cZEAB8wPYlPNp2bHj7JHbkZ/12O9r9Zy25wWcAYPX0edh6RjikSfIraZf+PxuY6QwbbEYUCLTSj
	OASD7cWGbDzIzym4cCwQpKyS1mZcFb4Rd5V5G2PUmYIqqexSBNmbRTv/4858V/SXYsYy2bZpvcw
	SMAL+4LQZ+3vroPDbjD7HtfJQ2lVjBk5X+Q7SSagE9PM7VQTJ/WJbiAFg0XePo8QRNcTyOIzlbv
	/0v5DPCHecHtZJT9tvDYyrO+JP1B+t2KXk85KGX+YdUXjgjPz+AzV1BDPo9Uj2FOic0cM5wuxSR
	W/ljog82EFImp4zz7K1Je1zq/lFnmSMyasqKpIJEkTGsDT57hyEO30+CFLzGnsC3x2DdkxWIy0b
	7M1pZ90eJpP315eXLwFqNtTH9YbfT9d9kxvqA==
X-Received: by 2002:a05:6000:2003:b0:490:50c1:f359 with SMTP id
 ffacd0b85a97d-499c708323emr6448339f8f.39.1794422715208; Wed, 11 Nov 2026
 10:45:15 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
 <CAKwvOdnFG1ACEvGPXGW1XK_3QN+5UaR_9EumhmrsyKOs0aYCPQ@mail.gmail.com> <20261111183611.GB1452558@ax162>
In-Reply-To: <20261111183611.GB1452558@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 10:45:04 -0800
X-Gm-Features: AclHuK_9r4Vz5uKygUGZIUoOcqYm2micCjZcbpAhINBsrpfAWKW6AJJEGMK37sw
Message-ID: <CAKwvOdnmJ6TCdtr+LPK9nBtwF24QY6-cQA3PRocuvd_gQUpJ9Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jordan Abrahams-Whitehead <ajordanr@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Julian Braha <julianbraha@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:36=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Wed, Nov 11, 2026 at 08:51:05AM -0800, Nick Desaulniers wrote:
> > Jordan, I know you were playing with -Wl,--icf=3Dall recently.  Looks
> > like the kernel does not use it; AFAIK, no one has ever tried.  Even
> > -Wl,--icf=3Dsafe.  Worth a shot to see if it boots.  If we did, we'd
> > have to update this kconfig check (the linker flag is only supported
> > by LLD).  Even if the result doesn't boot, it's perhaps worth doing
> > builds with BOTH to see what kind of savings are possible at the
> > limit.
>
> FWIW, ICF came up once before through OpenMandriva defaulting it on in
> their toolchain.
>
>   https://github.com/ClangBuiltLinux/linux/issues/1341

oh, I forgot about that.

maybe worth researching at some point. Low priority, but filed

https://github.com/ClangBuiltLinux/linux/issues/2189

to track this at least.

--=20
Thanks,
~Nick Desaulniers
