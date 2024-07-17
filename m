Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D291E526
	for <llvm@lists.linux.dev>; Wed, 17 Jul 2024 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721231640; cv=none; b=tBnHVIAptMQfNof6W/EOoRbhD7ehxJ7GCX3/tYI3jtms1q1gFY0Yb35w/gdDqmmz977dHL6lrlumbci6e9LepU5fFgK7VrT+tPsTw/8EdLfHokvJqTDEo91l5212hvv0TI3J2xeAIdATkp+vsKewlT50iqmGe6lxN6xNABkeQvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721231640; c=relaxed/simple;
	bh=Wp07UcAhRL1R8uio7WTjm5z67oRHHmiAHs6r7E4fMQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYf3IqR4jxRTvtlVBJ9ELVTLePxHeB5s2p2Q9XlwQOxbQEaVcMSKhsJ+PFf9UZM8x6mOUZwhV3Av2pRvtVN0niKskg9wfq94USnDnhvKWH+cPNqQ22Ry8xbb69rRKuR2YHvDSDdO0AqP7sdRb5q6+1fXMVEmJ32F5AG1TUScAiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjMiCW5z; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjMiCW5z"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eee298bd2eso50571801fa.3
        for <llvm@lists.linux.dev>; Wed, 17 Jul 2024 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721231637; x=1721836437; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0TYXvXsyKDm9Gm/9jOvNezoSc7ZaWUr4fn7rE/8S8Y=;
        b=WjMiCW5zu3d7KlBOWVB+BfGQghMiFgObvlq8lGJPtWIyF/6vsIJ5EzHYE6CINZ+KyM
         UlRSeTzG45C/wAumal0Hu7QU7OecaBz2UZZCMkG2PwzXRIbS3TC/HD+ufujVZxGq5Ymv
         98J+B+eIAqewNMjT9v0VdImSKGzrAUQqbg3evGRxfHiVFBYQgjigx98oTw3urlFlB331
         8/I+l3DCHQoHHTCWDG/JNOiUH6cDmJ1XjB4GM/pUr4Qb50MGFUCyj4TrXE71yPy5aXBD
         sgsU0reKFdmEp9haQtj88BQUHl1xHf6Pw9vZvUbm+9rlp8hOkJgpSW4kzLs1DZgx/B3/
         irVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721231637; x=1721836437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0TYXvXsyKDm9Gm/9jOvNezoSc7ZaWUr4fn7rE/8S8Y=;
        b=lSXIc+IRxIrIiJpVz98K35PDD/LxescP5H6gFSwAd3JXU7ljOcEmN1a8YFDSRAJ/Fj
         xvHv7zVhu0gePziDdIOelVbttv4R8T9vJ2Gp82R/171xdJGOpEZDDJlNoOvJy78ZNm+P
         esLXO1D/BuLj63LVYKcHLf5HVQ0XyijudAgtGcq5ES7dVSy6E6doHiWXFWNi/qIhsUzS
         ZcLgvT7Y3qlVHaNG7J0a7Wzor3hIFdqQte42MqfWDhCyR2w1WM4dgYQZw98kG1vm8lJS
         otLYUOk7b1c47+f8EljwbhqZWhSaDdvnOmK7gwTnKH2jsqqnh/EWASdH7LXz3Icnyoaj
         ywAA==
X-Forwarded-Encrypted: i=1; AJvYcCWb9d7ZYyvRCYofMO9tNtOdn0Zz0ffuk3n7t+8MP/BvcBLH00BzGCJ5g2l50bZOvCSQAW3IBs/jTEz7Z/BbBiFMH5XcPA==
X-Gm-Message-State: AOJu0YxSIDBlQxk79HkVfa8lxCo5fZMRix2ozt6+V62jIMLDm7EL7136
	sg1c3TzT6Pp1+1Pgf9vRzwM8TjZRN3fyk1ynlybz4JkTE5arpHOIQYw5M61+poPI4Vmt6gZRNmT
	wJVLmL5d2CLL2jrv6QTYC/PTjn93v1+0B+cw=
X-Google-Smtp-Source: AGHT+IFNav3o99G1G2XxxGKHijLrtShRGKEGj6GgPTIRzOWdanAGWRINlj3DG/YMJbdC5qahMmsK20OvTUaf4xOp83w=
X-Received: by 2002:a2e:7304:0:b0:2ee:7b7d:66df with SMTP id
 38308e7fff4ca-2eefd0c3f91mr14440341fa.9.1721231636473; Wed, 17 Jul 2024
 08:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240526175655.227798-1-ubizjak@gmail.com> <ZpfX4KelYaXsHlHe@gmail.com>
In-Reply-To: <ZpfX4KelYaXsHlHe@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 17 Jul 2024 17:53:44 +0200
Message-ID: <CAFULd4YyoVvM3BnF8Ln3XD-kacavERjMCpw=1hXwCACvTPF1gg@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/percpu: Fix "multiple identical address spaces
 specified for type" clang warning
To: Ingo Molnar <mingo@kernel.org>
Cc: x86@kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 4:40=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > The clang build with named address spaces enabled currently fails with:
> >
> > error: multiple identical address spaces specified for type [-Werror,-W=
duplicate-decl-specifier]
> >
> > The warning is emitted when accessing const_pcpu_hot structure,
> > which is already declared in __seg_gs named address space.
> >
> > Use specialized accessor for __raw_cpu_read_const() instead, avoiding
> > redeclaring __seg_gs named address space via __raw_cpu_read().
> >
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Bill Wendling <morbo@google.com>
> > Cc: Justin Stitt <justinstitt@google.com>
> > ---
> >  arch/x86/include/asm/percpu.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percp=
u.h
> > index c55a79d5feae..aeea5c8a17de 100644
> > --- a/arch/x86/include/asm/percpu.h
> > +++ b/arch/x86/include/asm/percpu.h
> > @@ -160,7 +160,10 @@ do {                                              =
                       \
> >       *(qual __my_cpu_type(pcp) *)__my_cpu_ptr(&(pcp)) =3D (val);      =
 \
> >  } while (0)
> >
> > -#define __raw_cpu_read_const(pcp)    __raw_cpu_read(, , pcp)
> > +#define __raw_cpu_read_const(pcp)                                    \
> > +({                                                                   \
> > +     *(typeof(pcp) *)(__force uintptr_t)(&(pcp));                    \
> > +})
>
> So shouldn't this be carried together with the patch that enables named
> address spaces on Clang? Is it possible that this patch might not be need=
ed
> in a Clang version where named address spaces work as expected?

No, as diagnosed by Clang, there are indeed two identical specifiers,
so the patch also applies as a general patch.

Regarding Clang, before enabling the feature, issue #93449 [1]
(internal compiler error) has to be fixed.

[1] https://github.com/llvm/llvm-project/issues/93449

Uros.
