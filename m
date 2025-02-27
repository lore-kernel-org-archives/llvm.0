Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFBA1C5F0A
	for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740689876; cv=none; b=BAfIpbR3VuNeQhcSr8PqN7si/NDVXGntl/AKLkkZXlL8e6OFYRu8UpKaJKkmu4UVzmKo/ZPHf2o5Fs8FuvG9gwDYQfTIJ+lUaRRgqMzoKSKKb1Ho1S+K7T1/pkRQ09v1V26O9hQP/ku/AsIDbwUjYchsnc4SNYHrkoQDYEqBYe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740689876; c=relaxed/simple;
	bh=gluXi5xULvfSCmFO6bHH+tGO6TqITSnpduH9eMYOsUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PlgSVMulnm/BR4xuue8rruxgtTFrkFIKIhlp9W1LGkdWwUmRlKNn6mmTaJL+U2sbhL7Vh3tB7h/zBrKFCyuLPxB+180mW67yzkdstELHjCCWCGxE1+hKW33JTBZdUDDfc4B0tNvFw39uJAXdN4j8K4gt81PsvivA9v6BJ7quo1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qK1VYcyn; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qK1VYcyn"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e0813bd105so2248003a12.1
        for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 12:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740689873; x=1741294673; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJveyoIEMTCh14ljLF9QNtY0D/cKkIOCAKuSFjWQyQU=;
        b=qK1VYcynJ7MZeRs5Va0JdDWLAKAbfhj0Il81Y3HKPePl3Lz5HZy24ZCD4KYA2mGiCm
         mTGvCNAvUnhTW3fEho87NrO3LAi5DkxZLrIkK0kYFgUbhmSRdpZUM+8mqCfIB5Hjx5iy
         7kpIgq9+xIfKvPlWfPkXjNquaPagNyddPhpbIKuiC58IBn5BJhwqkOBZGe0gpTlvap0i
         k8eZmABJSu+o6gWiGF/Ler1tIpUZ2ZYZW2N1GeXRl8SkYcWShqpn/MBzrzAhvlva3RWK
         I2TuUJ3OB5/l+WJs1/dZB1r1GSVHotnE8hHrT8iulJcwM+SzKiSEVX8YghVG5y5XWiYc
         aM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740689873; x=1741294673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJveyoIEMTCh14ljLF9QNtY0D/cKkIOCAKuSFjWQyQU=;
        b=SLS6NscfVG3K0jlHASmLtnFydkZJzgd+JCFh+lhaGb3QxvUvXcv6di8AE/PBDgbd8O
         /vmUGcSXGDJWCwKUtiDTMc71FQ/QWc3wq5K6FEmQZYs+DuDr4utRn6WM1LndDt3se7Uf
         YLG/l9D5sfVYP+lhnXPOHbmcpgDKKYK2O56vFSQ4wN5O6zjJoJgXtuFGaJK0k5JxwYYY
         wagzuL7RHslCRCyXoovJo8tY7LuQFP36htuytGoPZTNiUqLKlzIXV+W+a+j2QOusifex
         JvVeeC9yJf2IiuJLFZPxyQHGpzOV1yEoMX3/enyA2XA17jqoKU/vOBULq6pXbZjd6Pjz
         s9GA==
X-Forwarded-Encrypted: i=1; AJvYcCXU7hdPicHjNGqdJ5ZVc0EY6EZWzeZloCUyMuZIqFQ8z+EcogeVzoiix58VQ8s6B3ssypr5@lists.linux.dev
X-Gm-Message-State: AOJu0Yzavhn4mHqJw5Pvu4EFlwsOIihydtGZsR1tvvFLMFhQnVWUfM6c
	uX6+VPK1h2ii5MP+rlOM+uId8luTyDSHgw1XcwF6YaxEAk4/a49EjZ+TaC+WoF/d1I/QkT4/NdB
	Qj2+p0RSWweETt02ozZ4ePSPXnlJT/XSJHeU=
X-Gm-Gg: ASbGncuOh3e5lcgZBjR4FcZbx30WuJWa/cutcPpb7jQqB39lrjxCwpi16qgAwbxuVrj
	zkbJpVs7lG8jLVEbcA3C4ktiJ3WHfA90NiVTKr16rfjGR9RWYtcwfYTs44hRsKoLzqGQabIp+Ik
	kIRWfA
X-Google-Smtp-Source: AGHT+IE9iCZk4QUBD23F1Zo14MgZCt7ts5AldRQifiXQN5G9EbVneoxaBJ6AVE8QPXPRd/nmSnWTsNZQXx3ANeOOKU0=
X-Received: by 2002:a17:906:6a13:b0:abe:c849:7aa7 with SMTP id
 a640c23a62f3a-abf265cee71mr95608566b.41.1740689873533; Thu, 27 Feb 2025
 12:57:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QVi27WRYVxmsk9+HLpJw9ZJrpfLjU8G4exuXm-vUA-KqQ@mail.gmail.com>
 <d20da175-2102-4ac0-bf91-0ab8f6b6b317@intel.com>
In-Reply-To: <d20da175-2102-4ac0-bf91-0ab8f6b6b317@intel.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 27 Feb 2025 12:57:37 -0800
X-Gm-Features: AQ5f1JrXKNJ9dmAYpGPhTl0lhC69TTiwaOh5i19eVrAfWoRfJbsOGd1OSppC628
Message-ID: <CAGG=3QX-msHuRffAtNCBoqYo=15Z--5RXbPbJ=Tzkb+C9zNSaw@mail.gmail.com>
Subject: Re: [PATCH] x86/crc32: use builtins to improve code generation
To: Dave Hansen <dave.hansen@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Eric Biggers <ebiggers@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 8:26=E2=80=AFAM Dave Hansen <dave.hansen@intel.com>=
 wrote:
> On 2/26/25 22:12, Bill Wendling wrote:
> >  #ifdef CONFIG_X86_64
> > -#define CRC32_INST "crc32q %1, %q0"
> > +#define CRC32_INST __builtin_ia32_crc32di
> >  #else
> > -#define CRC32_INST "crc32l %1, %0"
> > +#define CRC32_INST __builtin_ia32_crc32si
> >  #endif
> >
> >  /*
> > @@ -78,10 +78,10 @@ u32 crc32c_le_arch(u32 crc, const u8 *p, size_t len=
)
> >
> >         for (num_longs =3D len / sizeof(unsigned long);
> >              num_longs !=3D 0; num_longs--, p +=3D sizeof(unsigned long=
))
> > -               asm(CRC32_INST : "+r" (crc) : "rm" (*(unsigned long *)p=
));
> > +               crc =3D CRC32_INST(crc,  *(unsigned long *)p);
>
> Could we get rid of the macros, please?
>
> unsigned long crc32_ul(unsigned long crc, unsigned long data)
> {
>         if (IS_DEFINED(CONFIG_X86_64))
>                 return __builtin_ia32_crc32di(crc, data)
>         else
>                 return __builtin_ia32_crc32si(crc, data)
> }
>
> I guess it could also do some check like:
>
>         if (sizeof(int) =3D=3D sizeof(long))
>
> instead of CONFIG_X86_64, but the CONFIG_X86_64 will make it more
> obvious when someone comes through to rip out 32-bit support some day.

I vastly prefer the first way if made "static __always_inline".

-bw
