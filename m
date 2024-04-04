Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C55153809;
	Thu,  4 Apr 2024 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712213796; cv=none; b=rB7VpAfPA3rGNU3V0fL224VR3hNPP7Ev7Di/EEeQjZleFtHzL4Mrhq4lCJZ66VB6CxkRltv1Kofck4+d3uQDUJo4F71YMIvhjhv73OgOVtddz6z8cdmsFZdOfR++4aOxV5iokfbm+3DMktjky3asVRpNTvvvCqdSF5RrizVP7sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712213796; c=relaxed/simple;
	bh=dmJxPO62alglVgi5pUTiC0dFb2IdTQW74ytyacCmbUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ia24fGkuS6yuxbVSmneDbgmfs8mIHpbHgmTQKE5tGi8fw8+CH2w0NfQP9hSpKp9uH1jbzdyDbdvFFMWRMFt/pk1Ml7E+EEPuL3+pAalLz0bmot6Kdowrliybl7DbU+bGOEBR6T8OkEiQXNyxJpZExo7RFTApmqlYH9MjOVlsllo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JP+JmnRJ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP+JmnRJ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so5853771fa.3;
        Wed, 03 Apr 2024 23:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712213792; x=1712818592; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LSLitdMdT1UlNRaUakWNHJUJo0RradF6J1sW3PFzcEQ=;
        b=JP+JmnRJSv4nxdtbjZXj5hpAA8ShtRhutz+fnpVTXNpva/QgJx9jjYUwvFcXeDIV0o
         OTm8vyQrcHTMNSSgGTkL9xGZo2enxEwqn6tmKhyEeYogW+2vwUwwm8Vmyfl8UTOOyMQP
         qzX+YS1eAQV+CcfqA5e81+nPVUsqNERUcZxWOv7X4UWrdnFVahddjyQzNWoI10M5GPEd
         /XJ+7f7x6biLOV41SemcFsqQBmYMbJfHwcTs8ipceVDAGi+B0UeUmIs38vMLjc/JbAQ2
         1/lG4VjANCCKmhyVqiRCYHxBk0+4/n6VEXivcffi92zX8/xwk88/hjmgsQBDUnqWCdkR
         F4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712213792; x=1712818592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSLitdMdT1UlNRaUakWNHJUJo0RradF6J1sW3PFzcEQ=;
        b=hJUOQOn6vANdWAd7UOr/yykHYun8XGemZrZVSmign/YWLcj4YMWpykM2WFe9vUUiY3
         vy3d3hlOjuVG1en3jFhcl80Gnif6KsosSGGcB8UPMduWDi9COSpD6Zdm2z6klzZFd5Mm
         rO8fEAzCqk767mKmXFvs7UQxwcpBAf2tRH2RotQmoOhdSeNyGMFa+7heeOTYIkSojBm9
         2Kws44O0wZFqpi1WGF6DCz6zHWi4ib8Jnr71ieaPRbIW/6fQHg4GVTsOa95OtEEdjXa0
         gQG0zmhC4LM0HgSiryaP0zrNJYc7Exr3jWj7LyxG/7xBTQMhc6P4HWPbF4m2NgJx5jN0
         2gFA==
X-Forwarded-Encrypted: i=1; AJvYcCX5U3QBm85SntU0IMHDeMX17CkuOZr87Nbz69CAvk2ozXoRX5UZY3029vcpbH97lx4LFp8Pz01Zgy9IS48Dz9UmPAvxoHoLt3xO/QhszL05KAhHdvpzmPvDAM+llLh4DakvP74=
X-Gm-Message-State: AOJu0YzqW9BhMBsCHC71Qf4G1hzSNwde9hbwIPF6gzDLINMUwWvcc2us
	+JQjbDX8aPjKLEegAJGVk1R+AEei9VVEvaF7rOUlQXjjCP6xT+qZ28NPuXmrKAMQgoQtlG5SSZm
	+NeUdXTq0TLLEE4pollRTg/psFrc=
X-Google-Smtp-Source: AGHT+IEEcxcmbMU09J0hrilIBRlyZ2FZNmR22nx764QfdoK2BFHoDfyWDmh6Y7Mc7L2Wmmb1oG8fv98gWw6Xrhz8aoY=
X-Received: by 2002:a2e:990f:0:b0:2d7:f07:89f8 with SMTP id
 v15-20020a2e990f000000b002d70f0789f8mr1271505lji.45.1712213792127; Wed, 03
 Apr 2024 23:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiWhfdc4Sw2VBq_2nL2NDxmZS32xG4P7mBVwABGqUoJnw@mail.gmail.com>
 <87edcruvja.ffs@tglx> <CAFULd4bVEUBEidTLbHNzRaJbSjXm99yC8LT=jdzFWb7xnuFH7g@mail.gmail.com>
 <87bk7vuldh.ffs@tglx> <CAFULd4arHT+_fy9_oUNpmsvyfVPGaeB_pdeuqVS3UTpP5R757A@mail.gmail.com>
 <CAFULd4b0HN6eUJsOW6po8Hf16T3eMhjdKUvw-TS8yncNn-+Vyw@mail.gmail.com>
 <87bk7ux4e9.ffs@tglx> <CAFULd4aEe2KU=UXEt2=GeLQq2uTSFvydBiwAdSa7B6T61Am=5w@mail.gmail.com>
 <878r2ywk3k.ffs@tglx> <CAFULd4YG21NdF_qNVBGDtXO6xnaYFeRPvKicB=gpgUUqYE=4jw@mail.gmail.com>
 <20240403175723.GA2667607@dev-arch.thelio-3990X>
In-Reply-To: <20240403175723.GA2667607@dev-arch.thelio-3990X>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 4 Apr 2024 08:56:19 +0200
Message-ID: <CAFULd4bzZuv=gW63jay_mMuPSAdh01Y=LhdVHXq51-cYPCJR0A@mail.gmail.com>
Subject: Re: arch/x86/include/asm/processor.h:698:16: sparse: sparse:
 incorrect type in initializer (different address spaces)
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Arjan van de Ven <arjan@linux.intel.com>, x86@kernel.org, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Sparse Mailing-list <linux-sparse@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, llvm@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000dc1a7f06153fd66f"

--000000000000dc1a7f06153fd66f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 7:57=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:

> > > > With GCC, you can use __typeof_unqual__ (please note underscores)
> > > > without -std=3Dc2x [1]:
> > > >
> > > > "... Alternate spelling __typeof_unqual__ is available in all C mod=
es
> > > > and provides non-atomic unqualified version of what __typeof__
> > > > operator returns..."
> > > >
> > > > Please also see the example in my last post. It can be compiled wit=
hout -std=3D...
> > >
> > > With gcc >=3D 14. Not so with clang...
> >
> > Please note that clang-17.0.6 currently fails to compile kernel with
> > named address spaces [1]. So perhaps kernel can use __typeof_unqual__
> > (available without -std=3Dc2x) in the hope that clang implements
> > __typeof_unqual__ in one of its next releases, following the examples
> > of GCC [2] and MSVC[3].
>
> This is now supported in clang 19.0.0 (main):
>
> https://github.com/llvm/llvm-project/commit/cc308f60d41744b5920ec2e2e5b25=
e1273c8704b
>
> I have inquired about applying this to the 18.x series, such that it
> would either make 18.1.3 or 18.1.4, but that is still open for
> discussion.
>
> I think the error that I mentioned at [1] is resolved with using
> __typeof_unqual__, I tested this diff, which is likely incorrect but
> allows me to continue testing without that warning/error due to -Werror:
>
> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.=
h
> index 20696df5d567..fc77c99d2e80 100644
> --- a/arch/x86/include/asm/percpu.h
> +++ b/arch/x86/include/asm/percpu.h
> @@ -95,7 +95,7 @@
>
>  #endif /* CONFIG_SMP */
>
> -#define __my_cpu_type(var)     typeof(var) __percpu_seg_override
> +#define __my_cpu_type(var)     __typeof_unqual__(var) __percpu_seg_overr=
ide
>  #define __my_cpu_ptr(ptr)      (__my_cpu_type(*ptr)*)(__force uintptr_t)=
(ptr)
>  #define __my_cpu_var(var)      (*__my_cpu_ptr(&(var)))
>  #define __percpu_arg(x)                __percpu_prefix "%" #x

IMO, the above change is not correct. Currently, the percpu variables
still live in generic address space, and the above casts are used at
the usage site of the percpu variable to convert pointer from generic
to disjoint __seg_gs address space (please see [2], section 6.17.5).
The -Wduplicate-decl-specifier warning at [1] (if correct) perhaps
points to the percpu accessor chain. GCC does not care about duplicate
__seg_gs conversions (the operation is idempotent), but the issue
should be corrected nevertheless.

BTW: With the above approach we get all the benefits of named address
spaces, but *not* checks for invalid access between disjoint address
spaces. This check is currently done by sparse (this is the reason for
__force in the above cast chain), but the check is not enabled by
default. The proposed improvement would *define* the percpu variable
in __seg_gs named address space, so the compiler will error out with
"assignment/return from pointer to non-enclosed address space" when
invalid access is detected (please see attached testcase, should be
compiled with gcc-14 due to usage of __typeof_unqual__) or warn with
"cast to generic address space pointer from disjoint =E2=80=98__seg_gs=E2=
=80=99
address space pointer" with explicit cast.

[1] https://lore.kernel.org/lkml/20240320173758.GA3017166@dev-arch.thelio-3=
990X/
[2] https://gcc.gnu.org/onlinedocs/gcc/Named-Address-Spaces.html

Uros.

--000000000000dc1a7f06153fd66f
Content-Type: text/x-csrc; charset="US-ASCII"; name="seg.c"
Content-Disposition: attachment; filename="seg.c"
Content-Transfer-Encoding: base64
Content-ID: <f_lukvrsfr0>
X-Attachment-Id: f_lukvrsfr0

aW50IF9fc2VnX2dzIHZhcjsKCnZvaWQgZm9vMSAodm9pZCkKewogIGFzbSB2b2xhdGlsZSAoIiMg
JTAiIDo6ICJtIiAodmFyKSk7Cn0KCmludCBmb28yICh2b2lkKQp7CiAgcmV0dXJuIHZhcjsKfQoK
aW50IF9fc2VnX2dzICpiYXIxICh2b2lkKQp7CiAgcmV0dXJuICZ2YXI7Cn0KCmludCAqYmFyMiAo
dm9pZCkKewogIC8vIHJldHVybiAmdmFyOyAvKiBlcnJvciAqLwogIHJldHVybiAoaW50ICopJnZh
cjsKfQoKaW50ICpiYXIzICh2b2lkKQp7CiAgaW50ICpwOwoKICAvLyAgcCA9ICZ2YXI7IC8qIGVy
cm9yICovCiAgcCA9IChpbnQgKikmdmFyOwoKICByZXR1cm4gcDsKfQoKaW50IF9fc2VnX2dzICpi
YXoxICh2b2lkKQp7CiAgdHlwZW9mKHZhcikgKnA7IC8qIChfX3NlZ19ncyBpbnQgKikgKi8KCiAg
cCA9ICZ2YXI7CgogIHJldHVybiBwOwp9CgppbnQgKmJhejIgKHZvaWQpCnsKICBfX3R5cGVvZl91
bnF1YWxfXyh2YXIpICpwOyAvKiAoaW50ICopICovCgogIC8vIHAgPSAmdmFyOyAvKiBlcnJvciAq
LwogIHAgPSAoaW50ICopJnZhcjsKCiAgcmV0dXJuIHA7Cn0K
--000000000000dc1a7f06153fd66f--
