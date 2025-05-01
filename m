Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17F02505D2
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 20:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746130546; cv=none; b=f23IROZN51QLCwMDCh/uOy64P5YnxgMfsiUpQTM9UK6MpMbNNYGSYs65timjx7RJQ6P5nxaLmB+KTNwPufzHs5XFkhbMXtJh7odYeXYbf0TNdvpdsHFD8hlwQHcbYr9nQGaYjrF6/5L91N0WCQYvanCfsLNgIp69ipqMH9W3xGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746130546; c=relaxed/simple;
	bh=FEQPFMqC2aSqAO0+LCL7aLTH7lQASLanG1HCrQJCXiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmPvAdy00NdZdf3dba2Pqt8hbXDuMnjnq3h6JEBTjz3SYIAWNvRUE2ej6DRKGqC4bzFpPq9u0KfMI+794krQ1CBgwtnhEfV3gM/lhejB7c3fwLf8qDEA2KtcXuHzPgWNTg5Sn+9c9e1j1MDH+AjSfK+GOqJuJ/joiURf7MYUfmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KjPGdUv/; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KjPGdUv/"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d8c4222fc9so33165ab.0
        for <llvm@lists.linux.dev>; Thu, 01 May 2025 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746130542; x=1746735342; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsgFo/RejhPC8ntitgtfydngcD4MvQ2F4ZVpjB7CD0k=;
        b=KjPGdUv/rQrCRvliQFSJLGp2oNV7zBBBX1BpZ7jQmsRAjwiE77dJ+IgbvCaIdD4Daa
         BylqY90KZcdcUL6Sq9ndC+2ukQvsWykLFQi/MHVIxoBiWPIDRGvr8fJPasxVGj1i/Tp2
         4IdU9Yb23gPIaH1zKDlXwDsYC3iy1iMx/C4y83Jn3aed9BJQ7uPx+D7ES2KFSCq8oTVR
         7jNuHjr6PTbz92/VpLFE6F2L3ehS/BtaeDzxFVZv6w/hk8cykOa5uN4FiQb+ZKh6AQoN
         0+tkQZRAdjMT8YEtdq05xZPtufGpIvXdG9R2xzJVG/NcoFYB6nVxugRK/xTF6r7y96D5
         XLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746130542; x=1746735342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsgFo/RejhPC8ntitgtfydngcD4MvQ2F4ZVpjB7CD0k=;
        b=QAPNgxlJ7d5ez7asOkv+Wvsw7S9weoUpCrvY6CDVtOYtJsiw0DX8aKcoQeDyQKkRlw
         ZlW2g69SvU6VY1leik8uxVPPXdQzC5v6+Dgl9SAveJkmNCxkhKyDesSIqdrZbJbrs39f
         1EEphxvi2bkTcKd8rI70c8YEuW+3qTElgOOb+jo7AYqf4TLeg+SVI8eQF2DrLh5W54rD
         ItpWgTT0I6Ra1TcCF/9noQL55baCp3dl/nt93ciQy27NUPlgvg2iXvGkcKFEEGajQ7Ge
         a57KADyaKxTQQdSTfu3jsxoNUkPiifj06nOl3xjHm8A4FqIeg5iUQXyjUGxvOwg/Nwv7
         guYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIbaCu32qv2j3MJ3P4kprEw4SDVtiDC0NMMqBiOQBSjs/dWD3yJEXIDqf2EQA3nYmRj09g@lists.linux.dev
X-Gm-Message-State: AOJu0YyuIShXdPLLgEdgaOmMIVHfMqQBcf26ZfO6TFnZug18rby1Xqrj
	dJtCwZ7UWejrPKp30ARj2/FL0G3zqzGd60AYCtpY69iwI8yy9RNULjzHDMzXK/pbgQXphIQ9RSu
	mnMp4fYBu1A4krUytgmfbMJ/d8lcgTHbYn6bc
X-Gm-Gg: ASbGncu1jACXJ9DjFXqGEd4cy0jtgdK8FTCqqdf/OPxjIFVAdkf3kgSg8tpdUQ2OqV7
	Gy5/V382xybj68e5o4zyhmWXjMc8R72UgUMB8dsae8sFn8Fq+VmPnngquBEWZtN/iVvZ0eQtq1i
	Ip7eihzR09OdwieSZeOEuFHRaKPt8guVnFvXUK+X6p+vgzBHYjhQk=
X-Google-Smtp-Source: AGHT+IGexfc/fZhfpYElfZIWeUZ/mWRcKXSby/mukAKUwR/YGvuJbqqmXJrKBpRTecHo8TIfYhvpJv/OrpWwn+7OPV8=
X-Received: by 2002:a05:6e02:749:b0:3d9:36bd:8c59 with SMTP id
 e9e14a558f8ab-3d970168792mr3865215ab.9.1746130541633; Thu, 01 May 2025
 13:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com> <20250430171534.132774-5-irogers@google.com>
 <20250501210729.60558b33@pumpkin>
In-Reply-To: <20250501210729.60558b33@pumpkin>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 May 2025 13:15:30 -0700
X-Gm-Features: ATxdqUGiib1N4S2UorD2RWA-lOkt4hHY0zEinkBd0HTa1nh7ilOIujgC_soxr-I
Message-ID: <CAP-5=fXrhsZYJwjJzqb-zMg+UoC-bKoYCjstq8yD9wHNCfbS5g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] math64: Silence a clang -Wshorten-64-to-32 warning
To: David Laight <david.laight.linux@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Jakub Kicinski <kuba@kernel.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 1:07=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 30 Apr 2025 10:15:33 -0700
> Ian Rogers <irogers@google.com> wrote:
>
> > The clang warning -Wshorten-64-to-32 can be useful to catch
> > inadvertent truncation. In some instances this truncation can lead to
> > changing the sign of a result, for example, truncation to return an
> > int to fit a sort routine. Silence the warning by making the implicit
> > truncation explicit. This isn't to say the code is currently incorrect
> > but without silencing the warning it is hard to spot the erroneous
> > cases.
>
> Except that the extra casts make the reader think something 'extra'
> is going on.
> For readability you want as few casts as possible.

Agreed except when not having the cast can introduce bugs which is why
the cast is always required in other languages. Consider in Java:
```
class a {
  public static void main(String args[]) {
     long x =3D args.length;
     int y =3D x;
 }
}
$ javac a.java
a.java:4: error: incompatible types: possible lossy conversion from long to=
 int
     int y =3D x;
             ^
1 error
```
Having -Wshorten-64-to-32 enabled for building with clang would allow
possible mistakes to be spotted, but that's not currently possible
without wading through warnings that this series cleans up.

I also don't really think anyone will be confused about the purpose of
the cast in something like:
```
al =3D (u32)a;
```

Thanks,
Ian

>         David
>
>
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  include/linux/math64.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/math64.h b/include/linux/math64.h
> > index 6aaccc1626ab..f32fcb2a2331 100644
> > --- a/include/linux/math64.h
> > +++ b/include/linux/math64.h
> > @@ -179,7 +179,7 @@ static __always_inline u64 mul_u64_u64_shr(u64 a, u=
64 mul, unsigned int shift)
> >  #ifndef mul_u64_u32_shr
> >  static __always_inline u64 mul_u64_u32_shr(u64 a, u32 mul, unsigned in=
t shift)
> >  {
> > -     u32 ah =3D a >> 32, al =3D a;
> > +     u32 ah =3D a >> 32, al =3D (u32)a;
> >       u64 ret;
> >
> >       ret =3D mul_u32_u32(al, mul) >> shift;
>
