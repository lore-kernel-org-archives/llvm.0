Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E9A3090CC
	for <llvm@lists.linux.dev>; Mon,  2 Mar 2026 06:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772433375; cv=pass; b=qnpWndZrPNKl9YGUNy38jeE7/k84n44Qu8FVw+2qH/9OuL1fXeRh9B2arWJenDl1qYDNzI3I4RILDodQCWuJhl3GWt1eFlCxQ5GHmQ11iq606wEqdws6M2/x0RySQF6Y/EI7pqK1s6Dg9ZUawibLewN7Xa5x7gWbGKjy1AJlqFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772433375; c=relaxed/simple;
	bh=2mzkZ+7ay5mPOTVxHTRghXB7Yvl5MwH5CneKgQvRVOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePAmcwmQDV5NxuNJE5gqOHxPKTsOmkSMr1dY/SoaoRO6v1oe7f1UYwFZ22zcMXeTJ+F/z5FxGuiMPGA2NY6DDsc7Rs4DzfqJG+6XQVlPSxnTBwr/rc/0KtSb/ufLD90b3eLmYx/1CzlE/t2ouUVjCAWo4zBRiz/oh1hbZaX4hBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqMxyE1+; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqMxyE1+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38706f96202so40451771fa.3
        for <llvm@lists.linux.dev>; Sun, 01 Mar 2026 22:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772433373; cv=none;
        d=google.com; s=arc-20240605;
        b=XCXHHkULB6lyGK9LTMWnFcrFaPkW+DwCUSOIHx1jeKIhx/fUeSR2oVtJku3/Ix9Gir
         YOZuKjwr33tysO/F2mSQjOnlW9IonBeavUAAhD2BS0onJ86fyEhgCipZYkgGbN+5B+fj
         c7XDAD8jqpJ1k+KxjTVd2xef/URggfKhi+TRU0dL4Y4m5R6TTJGEo6ndRwXc/CfsMYvx
         /xP6pjyNw96Phsm6Df3DOFgjh88T4xGqXEn0PBNWwe5ya+KJ/O5AuTilGMrQeUbUGLbE
         3iQAwU6E2+JPsXonyZbd2IXpABDNR69lyp5R5zVu2kZ0H026uzSdfYk1dl47v+HqFzIb
         CfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9pmNPDeirZpzNt2b2qSmOZwVDIdXzjn8yvY6dGccuss=;
        fh=p3xj8wdwCIwJLOIcxY1w2bvkCjCmSZQpYJmo5o+Si08=;
        b=TNtpcYGloC/WHqK0IKRvi0Gqvwwhu/qqKA4eyXTTKCgGtcXvtZV8pBQlD0ltHT+TDY
         lS0yh+WDhspNltN6Iflwc04VlROBajMQ0dl/ZC1G5Jv18lLUPZUCQYhArsvMU0N1svVZ
         CTgtEL+cNYMg5W4yPs+O8e1eqbT/Gx31856+VHFQscjC5TSTKgw5mXYg5yDrs2RZ6qsj
         UgUpCW3obsBvC+pKPvCwrLxl8GXzrGUawks3cVtla8if3bK1VrR9ynbnP1onDuSzDq6S
         AR7X9WjUl0yz/XYtrFLFsKLk3/V3EAGKR2OpgyeJi/+/bELkWtZivuUK6ZfBW7H0dRzv
         sC9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772433373; x=1773038173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pmNPDeirZpzNt2b2qSmOZwVDIdXzjn8yvY6dGccuss=;
        b=YqMxyE1+ol1n59OnIbbWgHUGQLwXM2Nu2imnlzEmIM6uK73/vpUkreLKkDARbvA2T1
         /+Ac0fLzeYBbX0v1yVdk8v4/qoPn25KLaN03Gs1eDNDlfSzvCiWPOq7BjKH9lFxWt8Uf
         XELA0f1U1hejEsQq4F3iyrzyEtw0Uxm24LHZPJxEcbrryoFi3QXvTPsRa/r2/fxTnGpB
         pDa4/GoSKUY5VKBd2XvMWmn5tH41yIKtNgUcSewIcC/5YsDvU5kjO+md7j00W6nGhZDM
         x9xcrYIvJM139B7ykKX//pF1z/cSYPxoNWYJYUhvTSllQzodRig6JhDmVxd+1xnzX81h
         4Q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772433373; x=1773038173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9pmNPDeirZpzNt2b2qSmOZwVDIdXzjn8yvY6dGccuss=;
        b=gZePchPyl2Jx3S3FmyUmx5cGRSvLrOcpEq3ARpPBRXmUR3POlGUkQy+VNFrIkI8LL+
         0n+DMkpoXfv+JupSzcZJtjXMqhmN3QX403p0kqp09epDfqxBgdx6LbxI10ES5zuXXqAF
         6y9kN443saFDCc+a4iE+ec1lQaJ+q2QuXDBXz63pT/vphSsNA0mxroGcUDc3aalm5ZM+
         BXS2sY/pLWlm8pJYfZmMi5557+Kyt8VVTOsqfFEwSUGe67GLuUsCcrqBAop4pkvT+imr
         GZOUVWyEImcAw3NqLMoSIMODdEkXkonfuBvV54LQnbcMSRqaPQEq46JfzD5VM/LXNhnC
         jkYg==
X-Forwarded-Encrypted: i=1; AJvYcCVFr5MbeGHHmboxvoCXV09GDmgc59CcKqpJepZrXIjyxR/AQW1XgPjDqs3ZzgQpKTu6RMML@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+LcRdhk8PIQVipe6N/U8BDj9+a13AsZtjmgb97fqzJROQCjr/
	65aw4SdjPn0gR/2/EICAb07aPsTcYXUJwI7GMLvs5kcdxqzg7RtFZAJQRQDRD+H4WWH1T2n45MB
	xqYDwQa/uPy0MZ/uaHosBy2PCAhy5qpM=
X-Gm-Gg: ATEYQzx0jdDYucnatgnaRIQDguQM+yMgu0y351iNzzZcj8udrwRK3EuPlTodylaannd
	sb+VAZJddB2LnG5o0rxlnmP0e1F/8zkUh+qDLBYZn6/dnIsUc8WBZbMd6YBTMzR+9qoXyv1L49G
	+3Kcr9iwvvtp/XEdytSN1Bcd8WuPVdU1xcxraQBuygy1UuTxPASyLexuY4TccEn8y6yP/0nI4yj
	R8hJam5LKQwAvxvgzTP9tBpmQN/P/5f/B7vWfviDCIveL0VNoo9w6Twrrf+XIMKf683S3wbhOj3
	VgvxdRQd9ienVPznjI3TKu7mw6gimh9x0+PYSr4Y6Xx6CuIG+YVZ1BL0jgDRSF1I2ir3ssGj2nR
	ZwkoP+eoQ9L0hPPQ99T8Vom745Gw=
X-Received: by 2002:a05:651c:2123:b0:382:4d6b:993b with SMTP id
 38308e7fff4ca-389ff365a4bmr80217491fa.35.1772433372378; Sun, 01 Mar 2026
 22:36:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302060247.7066-1-yuuchihsu@gmail.com> <CANn89i+O5b0xfcP5GLtUopqHz2ppewK9zSr4995jsjCPM+3AFQ@mail.gmail.com>
In-Reply-To: <CANn89i+O5b0xfcP5GLtUopqHz2ppewK9zSr4995jsjCPM+3AFQ@mail.gmail.com>
From: Sam Su <yuuchihsu@gmail.com>
Date: Mon, 2 Mar 2026 14:36:00 +0800
X-Gm-Features: AaiRm5370M-3aS4oZ0cTBd8XDVVI1Uw-ouldM7nEfiGAhn2Xv88YDaO3hyfPcuM
Message-ID: <CAPAzCqHgoiMBC0=r0vAH6jP=J=HVVxDbnQjAUOcgR6MHE2mNsQ@mail.gmail.com>
Subject: Re: [PATCH v2] net: ipv4: fix ARM64 alignment fault in multipath hash seed
To: Eric Dumazet <edumazet@google.com>
Cc: davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Got it! Thank you so much for the clarification and all your help with
the review.

Best regards,
Yung Chih.

Eric Dumazet <edumazet@google.com> =E6=96=BC 2026=E5=B9=B43=E6=9C=882=E6=97=
=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:12=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On Mon, Mar 2, 2026 at 7:03=E2=80=AFAM Yung Chih Su <yuuchihsu@gmail.com>=
 wrote:
> >
> > `struct sysctl_fib_multipath_hash_seed` contains two u32 fields
> > (user_seed and mp_seed), making it an 8-byte structure with a 4-byte
> > alignment requirement.
> >
> > In `fib_multipath_hash_from_keys()`, the code evaluates the entire
> > struct atomically via `READ_ONCE()`:
> >
> >     mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_=
seed;
> >
> > While this silently works on GCC by falling back to unaligned regular
> > loads which the ARM64 kernel tolerates, it causes a fatal kernel panic
> > when compiled with Clang and LTO enabled.
> >
> > Commit e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire
> > when CONFIG_LTO=3Dy") strengthens `READ_ONCE()` to use Load-Acquire
> > instructions (`ldar` / `ldapr`) to prevent compiler reordering bugs
> > under Clang LTO. Since the macro evaluates the full 8-byte struct,
> > Clang emits a 64-bit `ldar` instruction. ARM64 architecture strictly
> > requires `ldar` to be naturally aligned, thus executing it on a 4-byte
> > aligned address triggers a strict Alignment Fault (FSC =3D 0x21).
> >
> > Fix the read side by moving the `READ_ONCE()` directly to the `u32`
> > member, which emits a safe 32-bit `ldar Wn`.
> >
> > Furthermore, Eric Dumazet pointed out that `WRITE_ONCE()` on the entire
> > struct in `proc_fib_multipath_hash_set_seed()` is also flawed. Analysis
> > shows that Clang splits this 8-byte write into two separate 32-bit
> > `str` instructions. While this avoids an alignment fault, it destroys
> > atomicity and exposes a tear-write vulnerability. Fix this by
> > explicitly splitting the write into two 32-bit `WRITE_ONCE()`
> > operations.
> >
> > Finally, add the missing `READ_ONCE()` when reading `user_seed` in
> > `proc_fib_multipath_hash_seed()` to ensure proper pairing and
> > concurrency safety.
> >
> > Fixes: 4ee2a8cace3f ("net: ipv4: Add a sysctl to set multipath hash see=
d")
> > Suggested-by: Eric Dumazet <edumazet@google.com>
>
> Nit: Use of Suggested-by: implies I made the original suggestion for
> this patch (before the V1)
> I simply gave a feedback on your V1. The idea of the patch came from you =
:)
>
> So next time, do not add a "Suggested-by:", as the expected step is
> that I add a Reviewed-by tag when I am happy with a new version,
> if I see it in time before it is merged.
>
> No need for a V3, this is simply a reminder for your next patches.
>
> > Signed-off-by: Yung Chih Su <yuuchihsu@gmail.com>
> > ---
>
> Reviewed-by: Eric Dumazet <edumazet@google.com>
>
> Thanks !
