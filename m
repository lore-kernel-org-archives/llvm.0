Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E53221DAD
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 23:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769469377; cv=pass; b=IR38GcBNuot2EMYfOTnC0Srs1lRZ73LLJBmkCfbXwkqlG9HC4hVllvTxJ5A4lHzW4gnW91rzy3T1zGUS9pHE9oNHt8U07IBwDUDdcN+02PHk5NAxDGdPBBlC9Mgv8dltQjadUoCmKM9VDfogf/12SaIRihJwkLERVLJEX3nMYLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769469377; c=relaxed/simple;
	bh=2uFOIbbEt+daOOS5BiDub0Af3Bbuf50PWSRLoGgUqI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gG4z4/S/2mnR+uqdDir1/XYepWTFmAPAmVjADOA1SpRnx6gWJGMrhVrzMWc82n0GAHSl3OkxlObcuB4ZoGQikjwzm8Bf2zo1ws7dYbuXassvXaujFOTc40nI7CnVBJuU07G8LeFSEWqusM3xZ5BMEIuh0dQ4j6hjuhjFgJNEZ+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ESugPCVX; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ESugPCVX"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1248d27f293so4589619c88.0
        for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 15:16:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769469375; cv=none;
        d=google.com; s=arc-20240605;
        b=AUiumtgmv0xWLUelZ2tYnRCBrAnOoHlBjQ8revAbxE2evX6qrOVS8BGsO8egfpyOiT
         5x/ZNsS5fNEef2W/7UJiQGAx/GTkyNd/hemGqFEuI08QYJ0h/htGbxEfgL1qIFCUfW31
         T6Pb3BePdUlhZlbDfw31FxKP799vfbO5gsi4tUYuL5tHguBOU1Es1HENRvmcqJP6x3I1
         VSoOcrWm/X0HgwNT8y9wqsKOa9ZtY6KH3YanU+gV9j8qxGtDKWReXqZDwvvUYNEpC05t
         sO2xhrG2KpMq0dl6apOOClrqjiP2bQ0PrZfVtaUbzSMhRA1O5yCDAIP6Sf2zvHjluHCS
         mIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2gVqs+YSL9tkjaJJdsqPr0duAJEHrfSLsOJ+i8YF7aY=;
        fh=OgsigD+Ki5fdAVlLD2btinASAOx5gqklxQnrBhqmU/I=;
        b=HA2F/IptsU4yV6xSgNsHVyApW/Y9JJmigscrmUQsLauqB1ugZ+dFQLXhp5uvwhJpi1
         SoKSIdqg8AA/2NlcZwQrJFrYp7xyZJSUFij8QiPsGsxMvNFs4RmkNZ0XcBBMH2/IUH5i
         ppw0DD/UHmUvPZ9bioaZYsSimxAydjjYUUWb1Nm5iXNWB5+cGSiilqB6R3Cr1LvFSRbM
         uIv505E4bpr/wzxN3cm0mY0I2kCWLMTvjVwaasfobvOzPjssTTOzdkj9nF1HYSNuMZUA
         Lk4UTFqOG8SzaR+oUHiyOUI9lSbxVo+t5gGAyly3KIbGAYitPAS6W6ISPWmsv/aX1jUH
         jVnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769469375; x=1770074175; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2gVqs+YSL9tkjaJJdsqPr0duAJEHrfSLsOJ+i8YF7aY=;
        b=ESugPCVXHLcVuzUmCBFvDCyrBrt6+siBwnl2jTyIY2hilDAsb48uRZW9ZqXq0Nf9lj
         9LKF+gtMhbCVRzHTtbundxNZ0vNbzKxemCR9GvG/apnFSmY2JaUncWAuJJI9UkzYlOtw
         b39KU+V0rhN25A3KDVj/ucSfgetH/hUiucaAFASfxLkij5HkctZ0wHeY045sG4HsaHSd
         ULmARvXc3bXF7hi575Y39yyzogfsSY+16jpe3GqaMc70A3S0CCkjOg7qKzqCcBg8uNJP
         /2n7Hx8+TktxAAOdbHBmNnajHCeEGKL+xPlZirBRBOUOWx941kSEfeckZKKNDSxx10ts
         H0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769469375; x=1770074175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gVqs+YSL9tkjaJJdsqPr0duAJEHrfSLsOJ+i8YF7aY=;
        b=QUwLy5zWKRTDJdid57xZpmKpgvJocuRwS+DIAwouXmJdBOq27mH+y1vTFRPf4F9P2P
         vN+A0sGhxu0SOKfiMBzRw5sfQtq0lHf2BACZXzntiFG6BxHnZ5BAW/QjbkB9jSrpPkRo
         TRgq6JnBzZJeDdW9ujLxESg0C6QyAGoCfV6PisMYCiIctKprGvKYfQdosAP+CO6C2Ysn
         OQ++amty2eWwZ704XGEhZrLwLv+UkDnCZoaSgGhSSoN+RvB0beMHAWwaZPxn8phqojZm
         fEVNxMOeLcwJ1jTKSsIDKGIDP8c9LSMvJBtT5jIIpGghwI7pW8nlAKOy+gkmqE+KmAL0
         aN3A==
X-Forwarded-Encrypted: i=1; AJvYcCXG0ZuW1YKdXw/OXC1xdsZd97ze+o7c0sijsNo2r3GY4LCHelI1FLwRVO0CesZhJQX6o6qe@lists.linux.dev
X-Gm-Message-State: AOJu0YzFMb/wEMfd9LvygAQiCxgFmU16UQuX/chw7ghHw6eGmDioxQkv
	cqTxfTuf2JMEsbjADOlE5wFEdIV5lSwuTkFjxlKxcEGqo/kQ5hVACBmUoUVw0GcU73ne9L/7pVF
	OyS+qWaIp3yNazx0PqSMrfEFx+7EZiIWCxmy/wpYu
X-Gm-Gg: AZuq6aIDoyXgdtYPwKg+ZzkVO55B0To2ZhQV5tnPgJ/3vdYm2vNILCv0ZYz7S7GXtCN
	E1MpID6gdRFAccn8mM5SaMK0wAD+KRNNXkS/JYYfMqMK+dX1YGGnslmkIYkiTCJIW/7mSJLEbj7
	Gt3YZozGtQ9FA8hROii/00nbpVsAhzolKZy56X3Wyw6fqda7U6Y8+OMpYRvT+bxukHSB5VsyQ5q
	CIv6DA7lPHfW1hRorgRuo07WZaTqJEGEANGbJMy4wu7EwG6BhKFDgsv8Jq71v99DoBJD2bm6GlO
	iPvbUdM7MTSVzW0c2NbEdck56ks=
X-Received: by 2002:a05:7022:4189:b0:119:e56b:c73d with SMTP id
 a92af1059eb24-1248ec0da9cmr2570569c88.2.1769469374916; Mon, 26 Jan 2026
 15:16:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com> <20260126002936.2676435-3-elver@google.com>
 <20260126111643.534c8274@pumpkin>
In-Reply-To: <20260126111643.534c8274@pumpkin>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 00:15:38 +0100
X-Gm-Features: AZwV_QiD3_ipngjN37zY3RtrCwuNKR0vaNI3HEz51trEIWvcYYXjpjyuf605hOE
Message-ID: <CANpmjNNUGzgLxSj78ptW-t5ux7WL7sq3q-h9acGEfJxC2u==hQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Jan 2026 at 12:16, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Mon, 26 Jan 2026 01:25:11 +0100
> Marco Elver <elver@google.com> wrote:
>
> > Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> >
> > 1. Replace the _Generic-based __unqual_scalar_typeof() with the builtin
> >    typeof_unqual(). This strips qualifiers from all types, not just
> >    integer types, which is required to be able to assign (must be
> >    non-const) to __u.__val in the non-atomic case (required for #2).
> >
> > One subtle point here is that non-integer types of __val could be const
> > or volatile within the union with the old __unqual_scalar_typeof(), if
> > the passed variable is const or volatile. This would then result in a
> > forced load from the stack if __u.__val is volatile; in the case of
> > const, it does look odd if the underlying storage changes, but the
> > compiler is told said member is "const" -- it smells like UB.
> >
> > 2. Eliminate the atomic flag and ternary conditional expression. Move
> >    the fallback volatile load into the default case of the switch,
> >    ensuring __u is unconditionally initialized across all paths.
> >    The statement expression now unconditionally returns __u.__val.
>
> Does it even need to be a union?
> I think (eg):
>         TYPEOF_UNQUAL(*__x) __val;      \
>         ...
>                 : "=r" (*(__u32 *)&__val)       \
> will have the same effect (might need an __force for sparse).

Unsure, but we might be treading on UB even with -fno-strict-aliasing
given all the inline asm around here.

> Also is the 'default' branch even needed?
> READ_ONCE() rejects sizes other than 1, 2, 4 and 8.
> A quick search only found one oversize read - for 'struct vcpu_runstate_info'
> in arch/x86/kvm/xen.c
> Requiring that code use a different define might make sense.
>
> I also did some x86-64 build timings with compiletime_assert_rwonce_type()
> commented out.
> Expanding and compiling that check seems to add just over 1% to the
> build time.
> So anything to shrink that define is likely to be noticeable.

The compiletime_assert_rwonce_type() is for the benefit of the
asm-generic variant, which is implemented like the 'default' case here
by default. This here is only the arm64 override of all that with LTO.
