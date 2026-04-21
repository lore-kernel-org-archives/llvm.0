Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF743DB646
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 19:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776800198; cv=pass; b=Eku6UTBget0hdO05ggWDvPQVRB3812cZATnQjGh1zrtsCw1ausuV2waKhbqny+jbq9oOgBvs5d8ZonSF0ddoN0n3LepUOMN4dk8Jft0mLsYUErTKwoD0FWMpXcercWHBAA55Hue/9811ss+0CACwxU/xYAI/p1qUdR7bl0kNIhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776800198; c=relaxed/simple;
	bh=KDyDrtQcsTnTi4edvIvv81FkXtI0n7PgoD4jVxNeh7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+klJHc/oiQg5lzPVewuy+asSnuaAmR0FliY8TOnw+8j8vhEQwAoLwCn1qHTmS6wXKytR0TPOASe50q8MPnEPDCM3RdGx1XVVj0OnYddYDqvChVoU4wDVdg24OHMXvo3fL6eC8WO/bCZjlODmIXWgXIJvwjZrJSvqbp4RXrJv2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W5WLaupX; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W5WLaupX"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c45281a06so6243362c88.1
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776800196; cv=none;
        d=google.com; s=arc-20240605;
        b=BqbD1HJl71eHXUYWwRqy+eXMoiMFRP1ydudF7h5wh/Ub3e8sRD1/mFH4eDyrn+0aaf
         h55JcCycbDeIohwvgi3KXHZwO8Ieldd/5s0gM30ITqjEicj4jKSWcXuUvOB2KJQn30qM
         XcCv78yQ2zvvpvartgx1LMSKHVPk67riZS57dxQ5V+QRTGKSUwuCADUqweYkYZxh2rzY
         UsXjWj2ev/A/2aF7jy2zHcqN4zAyED8zfIQaMLZ+Lk1eNC6ph6kP5rUDFc1KHJWiHrk/
         HDUW4licGn+14IYqgwJV5XdkLzXLwlSgIXdsGXltLl0gmbEIjL3ICELagAWldnM5aSOG
         y+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NfAMTTll8yDZWa49hQI0ctiiuYIPCRYmSkPGD4A/jUM=;
        fh=ss6BXBY5GKrsjVnRNVHh1Jgn7FfJTfw4CNI7gyhYsFk=;
        b=k/d4XnHKv+iyaP3RvaGCLnK9rG25rjkG1sYPn1Yw7IsxnUQueFPFjNl7lx1FFeoL2D
         0y2aByWPuoMRcP4RlESOueCSt8oRT2dzZtsz6ZhE7RFqLRV39cQ0btmQGy1jadqsuzdv
         WmkvpqlMT47f94GgXX0E2kdenfaJePWA8ilBleLn+74jD7jS+pCSrQ6w3O1jhRMrV1aF
         8ijmW+beUfpGrZauI8cn/WF/zKWg+E4MnZ7gIJmXWufahm4mAnuN8tDzt93igEc2t25k
         6ikv1UMhPi4AwJVi3Pie5M3wdJtzWVdP89hivOA83FhQZXqe9529RmiNChMUyyHlFMVY
         nfdg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776800196; x=1777404996; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfAMTTll8yDZWa49hQI0ctiiuYIPCRYmSkPGD4A/jUM=;
        b=W5WLaupXmzvp3jrK9JE3VlNHttYg2hfj1CtsW1rl4/FiqX16RegSvdj+KnHVqPVEsT
         B3CUzzLJ9rD4hcwvj7qkJhLFA19yZpGL95a1rdUA7A0Um7WyGJTGDbRnEK8Lu1qOoznB
         7GqpDk3YgAbdr+Ip5phJHTU4YFcaebVw+jelRaLEMApWB6s1TSC1YEI+MgUlnWfl5/Qr
         pxzfynI8ugIwyCQXS9YUXxWc77UnsTw6VW2YBFm45MmuE0X+zRZQyscPJZkTXCsT+uhH
         DjB1Fp1D3zV02abyQbWOWzABgGjKorDExf+tYnMG0MpuZcXprc8z1bESPm6jIAYgf8Zu
         Z7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776800196; x=1777404996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NfAMTTll8yDZWa49hQI0ctiiuYIPCRYmSkPGD4A/jUM=;
        b=YiAAIeUhgXl5ieOjmRvkDINWDzu+enuIP44n/ceH5vh1j+1dnXFskv+5jXDz6CIS4Y
         Os/BNR7GFkEn8/Jb/dGISLXJsx0RwABnpsIf59nlh4EkGE8qQzuRaWlt06Mcv7CaNPab
         3qYw849L4kUpmkZwsi2Ukr99p/+kbnqQOm7hfrE8MTXnX9UHoUjtuOXcVqYFfjQ/N7As
         SZvyd86cFx4kPz5l2K15wCQD2GQIgkP0GJKa0QF1cQncVkrKDeoTSk32wRvFJ0zmeUPD
         42yft3yQaDBTOIOZcoIvkAcnjcr2G1KpcdfdbrIvMcckQyiDoDZCAeNN+nBhsGx8GG6k
         wTDA==
X-Forwarded-Encrypted: i=1; AFNElJ9l/ubSDy2IdgaYaqvcBZsRLtAolSIoDiJNDYbvE/azGf1JLP/XXK4MiTKErTJigAAil8zk@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvz6j/9lMHo9xJqqvM7jm2HigwnD6dQ036wwq5k8QgeU3j+v91
	dp7t4MERnrz39yc+ziEiNJUyEA4LIsQOnQxY2hxdsgCNbS0bi05q8ivI1A6sU8tWo39PbyUrkHZ
	K2VSNgZ+qIEDwHQUYP++62iSMe9lz5vow19wmSaOd8liU4GT52iZFDMxQ
X-Gm-Gg: AeBDietm6zLQfmFih+6j54d8qd2WmPmlmfZ6EU04ECIf4rqzuMUMeytMt++gIwVwSH7
	ELgb0lT8rIxe3jewSkspvRU6bV0gvdLilmatEk7qSewaV39V4eLmv6ZXysOYJkcoUSFi1Gb4z6p
	wYIHsUJ7zo7hIcO7Z63CwC32VcDulOQaKblxa1IuW+9GANMe/GVr3awftU5N0sEclkVwngiQIeh
	4mUDEbtuckc309oC2Ij5+Btv0namFSgBRzQesciy5mEXUtK0t/UAto7PtTX9C+SahoOLYarAUyB
	LfmJ00YzcJnTY+Ye9a5aVZ3Hkk3FrEw3rpFSzNH6Lxll3D4UA9beqWJHobxf
X-Received: by 2002:a05:7022:90a:b0:128:d715:b717 with SMTP id
 a92af1059eb24-12c73f82878mr9445101c88.13.1776800195940; Tue, 21 Apr 2026
 12:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260421190351.1976329-1-elver@google.com> <CANiq72=45YiMnJiX-73gc7Y6tVTs3fzmVDQ4WdRBQcgqesYFAw@mail.gmail.com>
 <CANpmjNPiyXdQnEXw=YbCrj4R5+8CvzNPX+C4gNaqW0Kjj2-k5A@mail.gmail.com> <63e461c3-2d8e-47c0-9901-34b53e53f22b@app.fastmail.com>
In-Reply-To: <63e461c3-2d8e-47c0-9901-34b53e53f22b@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 21:35:59 +0200
X-Gm-Features: AQROBzBAqG2pkrNUz0sQsvT8pX1pUF57gXaY236Lkys8RtgZ7RPV7OkqPfaUG6w
Message-ID: <CANpmjNP2=Q5-1+7zC7HaHJ7sqd4Jp9g9NS_SAuw2G3YNWr9M6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Apr 2026 at 21:30, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Apr 21, 2026, at 21:20, Marco Elver wrote:
> > On Tue, 21 Apr 2026 at 21:15, Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> >>
> >> On Tue, Apr 21, 2026 at 9:04=E2=80=AFPM Marco Elver <elver@google.com>=
 wrote:
> >> >
> >> > Add support for the `__access__` attribute, which is supported since=
 gcc
> >> > >=3D 11 but not currently supported by clang.
> >>
> >> > + * Optional: only supported since gcc >=3D 11
> >>
> >> From a quick try in Compiler Explorer, it seems GCC recognizes it
> >> starting with GCC 10 rather than 11. It also seems to be in the docs.
> >> Is there a reason for the 11?
> >
> > Oh, will fix. In the original report by Arnd we somehow concluded it
> > was 11, but I guess I should double check such things. :-)
>
> gcc-10 knows the 'access' attribute, but not the 'none' variant:
>
> echo 'int f(void *p) __attribute__((access(none, 1)));' | /home/arnd/cros=
s/arm64/gcc-10.5.0-nolibc/aarch64-linux/bin/aarch64-linux-gcc  -xc - -o /de=
v/null  -c
> <stdin>:1:1: error: attribute 'access' invalid mode 'none'; expected one =
of 'read_only', 'read_write', or 'write_only'

Good to know. KCSAN requires GCC 11+, so this is fine.
