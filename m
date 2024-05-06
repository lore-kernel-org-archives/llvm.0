Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E12213BAEB
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 17:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715016889; cv=none; b=BDftKBhVl3sVw28B4R0f5bfRCcqCMKjoMWu4Ruc0p3IDQPfkGv3MbZ6PSKF2F2bs8h7pWs9vVznwfXNalkWHoCK/YzO3cHh0ij+L1hH2rYvc+h2s8dRbxsAYBtfOtssC3wGJvYCg4Xn6qZV7xkXj/0gwO31h+sq8RCVoE/XcIps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715016889; c=relaxed/simple;
	bh=TI5DRoryTSvM2Mo1Mcc+qwJ+bi6PRG7slThxsyfLRog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDrIJejmKS6+vpTBL6DIHbI5Otg+FIym8RF08t1yXvZK5kdCXhLd4kQkFjaE0p47ls8M5op7ojzb12bw8bfueQ2j7S31WaZZWb7mza+18fdtMjm7JB8vOxUDgbDRnXlXexeEQ6l1BK9V4N/eNHc1lLFqM11zIcCtzA0TWV/FdHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yj7H7AZn; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yj7H7AZn"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-572a1b3d6baso856a12.1
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 10:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715016885; x=1715621685; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAx91jBQp8b9D9u8QWwgtb//mlM/+KKl3bZWksOtlc8=;
        b=yj7H7AZnhUlIsHY66zXDpsJyL+0czrmTec5YSA9j0khDjKkXfoCx0mYAfZ3qz8+S+s
         R9PQ6VaX1tgGKg5Rd+TXPChMtgoyy5xb2HuN+absHCXCyTtGEYTYIBJ/7S+VELpeAaif
         dICNGlOiDJ70ETcvefXfYT536OpYS6hCK0pkp1WqyeGDz7N/QtHzKdDz5m7jfgZdq11X
         rJnztLZvmgqwYxiTgwicPmeF+GJmPVQXIf6zuaNYDOVPWtHcW7UvFNUUUtGgjYSYHfHs
         kSljbx1rIJA2MDmro3lJPi/XGboQymR9rjdT8ByHtJDwW23AvoD0HuWzd8bblcSZCT8T
         EGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715016885; x=1715621685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAx91jBQp8b9D9u8QWwgtb//mlM/+KKl3bZWksOtlc8=;
        b=vh7yBsbvzbEt4aHVJaMRYhq3gB2BehVtRDeFpB4d0bpxywWF7tA1lo3Ft42DN4YdLT
         PJokyqQesVi9nS9sKt4fhfNWgxdpoeIrFyMQyu1WxMFLpSCdaTXUQ813SUYSFw9HHP3E
         QbK+jaIghr4T8ruXFIozHrEv4cskYFY5giGYPK9iMPYA1zwX9VFU4uthma60wuGqw4al
         NoEbSH3c6Q02l27ckNKT/h3SbYSJE+k3RhTiMf/yRW2HrwOkZFwj2zO+PD1QhjOa2yYC
         Lw8Ow2R5mi+n2oJpsEHmpARvty7mE7bbNDzYJFh0Am2kQ+Zx+0oDyaOBT6egbMW/TdlZ
         7hkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmTbaN5nm/fUJmTdKTc2GQnhzu6u3snYmjArtRBiSgM5ZQ2q3KTmi/bvSnVZNejTXlT7qodNY0fZ6CCF0gdsEn8h2S2A==
X-Gm-Message-State: AOJu0Yzak0KMrcciKxsWcl5tg/OhLQjRUG6NOyjH6Yxu7+XvZY+rzdCQ
	J9ZpVwjtf47fyxSB4eN1pctu/1SZ0j97SJuU2PH+Tc+vfAZQeAVVEL8TS0xrzPfdPF09d+SxnXg
	qqAOvOCqrLkqJ8zuj6ew0+igvRZlF4VUhWizd
X-Google-Smtp-Source: AGHT+IHjg392EHjEwddfHI/2Y3LFhkNgzJzNtK3yboLc4F8Z0MarAFd5M8O7Vs9QWsYnjhEWlcgHfrTLnkJYuegmefE=
X-Received: by 2002:a05:6402:1343:b0:573:8b4:a0a6 with SMTP id
 4fb4d7f45d1cf-57308b4a0ccmr93285a12.5.1715016884637; Mon, 06 May 2024
 10:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501180622.1676340-1-edliaw@google.com> <osgrbhnqlyh5yw4y4x6wjggx56dogsgje5yy3mkpu75ubs3zwg@5tliydzky37k>
 <b55272cb757743548c789aa8c0efa448@AcuMS.aculab.com> <CAFhGd8rAW4Mkctq5VkcfVjw_yr=jVdXaWbYXP-vmeVpw7q4ruQ@mail.gmail.com>
In-Reply-To: <CAFhGd8rAW4Mkctq5VkcfVjw_yr=jVdXaWbYXP-vmeVpw7q4ruQ@mail.gmail.com>
From: Edward Liaw <edliaw@google.com>
Date: Mon, 6 May 2024 10:34:17 -0700
Message-ID: <CAG4es9WYrN_tOV1Uxi_ytO2qDRRZW5_uN=2p3iCg=P0r3mM3Og@mail.gmail.com>
Subject: Re: [PATCH v3] selftests/vDSO: Explicit unsigned char conversion for elf_hash
To: Justin Stitt <justinstitt@google.com>
Cc: David Laight <David.Laight@aculab.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Andy Lutomirski <luto@mit.edu>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"kernel-team@android.com" <kernel-team@android.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 10:16=E2=80=AFAM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> On Sun, May 5, 2024 at 6:21=E2=80=AFAM David Laight <David.Laight@aculab.=
com> wrote:
> >
> > From: Justin Stitt
> > > Sent: 01 May 2024 20:55
> > ...
> > > > static unsigned long elf_hash(const unsigned char *name)
> > ...
> > > Is it possible to just change the types of the parameters of vdso_sym=
()
> > > or does that trigger even more warnings on the callsites of vdso_sym(=
)?
> >
> > Isn't the problem the definition of elf_hash()?
> > A '\0' terminated string really ought to be 'char *' not 'unsigned char=
 *'.
>
> Right, although note this comment just about its definition:
>
> /* Straight from the ELF specification. */
> static unsigned long elf_hash(const unsigned char *name)
> {
>
> which indeed matches [1]
>
> [1]: https://man.freebsd.org/cgi/man.cgi?query=3Delf_hash&sektion=3D3&apr=
opos=3D0&manpath=3DFreeBSD+7.1-RELEASE

How about I move the type cast into elf_hash, like libelf does
https://sourceforge.net/p/elftoolchain/code/HEAD/tree/trunk/libelf/elf_hash=
.c#l47

diff --git a/tools/testing/selftests/vDSO/parse_vdso.c
b/tools/testing/selftests/vDSO/parse_vdso.c
index 413f75620a35..33db8abd7d59 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -56,12 +56,15 @@ static struct vdso_info
 } vdso_info;

 /* Straight from the ELF specification. */
-static unsigned long elf_hash(const unsigned char *name)
+static unsigned long elf_hash(const char *name)
 {
  unsigned long h =3D 0, g;
- while (*name)
+ const unsigned char *s;
+
+ s =3D (const unsigned char *) name;
+ while (*s)
  {
- h =3D (h << 4) + *name++;
+ h =3D (h << 4) + *s++;
  if (g =3D h & 0xf0000000)
  h ^=3D g >> 24;
  h &=3D ~g;


>
> >
> >         David
> >
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, M=
K1 1PT, UK
> > Registration No: 1397386 (Wales)
> >
