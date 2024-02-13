Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C352B125A9
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 05:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707802398; cv=none; b=g677gl33j4EjCWojqYGK18R66YZ9DyOF1aLmvT0BQagutzC5beXNKCLtyHSx0iIF2TrdOOSRcvIXuLtNNENS38b42RNH3xIG+LVe8770fX6DvBp/MQGCnRyeCFGl8IF25639A6pf+x5v1wF90Hs0l7ArKsBh6JeuHDb4lK9Z+uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707802398; c=relaxed/simple;
	bh=02Q8SrULMcBSD7ttAGWmB8PIKrympbUDiwhvHFHIOIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgskWD6qIYiYM6rCLzAizQ4e1Gv2UlpujPMZvi1Mq9vT4W8P36LrWjSVXBnCZJFdI0Wl88ObEJHr8Npmm8eIftUt0TxRXUfMKi4jRgapZBZHumafEuDNnoTwHDNEgHtxqzvmJT6U8PhRkeHkp9QYg+isUUsa6BCJ5YimCx7yHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RT00wacb; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RT00wacb"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56101dee221so4241a12.1
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 21:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707802394; x=1708407194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XETlmfsLFShyCAFBnC+zhCwZVHqHy0Tkff4Gvlg5js4=;
        b=RT00wacb33RKW2/ABFl1gUs8zICd10bmRAwsYLIHEKu2DEixMnn+2Zwx5j8wHLkd8W
         Xe4OTTB0mBAjMVftlqF4vUc9qbRaO6t1Es5GiKL2zjDCXlCbMi+BhLE89a8dbUNcKKMG
         jBQXK96o3LQJNGblGpWo8M8+A9cW/RM7Wum/YuKitzYfxPdJ+OVSa8MjiYK9n1atdDBf
         3cAm5bDtWsB7mQ5LBQbOfh1k8F5q2QBOLtTCDPEFzzji3Z0HyEzSGNWkmq/m+Q2zdCT2
         FRGRcvYLus393EzgUc9va8n+u/dmZXg/1ZJEoH1tfs+7PxYGR53XkGJ/aBSiHUb+9VeV
         vOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707802394; x=1708407194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XETlmfsLFShyCAFBnC+zhCwZVHqHy0Tkff4Gvlg5js4=;
        b=p9nhTaLPB0FFSCFbQ+8tGSA1a8oSAB+cm8ssFirXFGgHLHLWDIy+cJScDJMCa05orr
         vO0LCB17CtmPNbJHJ1od74o/UT9giZRA4+CIMJXbAQ6jChWD1br5brNKHCOGQZPiBUiz
         FKWY8TmWQ4rsYMbbNsisiBE/squNf8ebi+ijF1q+bH5xJM1BKmeaHRSwRp9L7dRhIXS+
         mRUms368SzRdI9FkaC3MViJiWPAeRXM7LThmb4iLNWmiQkb0jHDOKS9oDws2U5RPLnIl
         IJukEPjFCj4XJd4hlAngP7ISBM7vlY1LmM1lYHeIZWwDso7OJK4b3dXebg+CLT+bK3+3
         814A==
X-Gm-Message-State: AOJu0YwWQJJAYhMCiLG79YQrba0M3PGXi1LV4aR509yyBL4jtmd2hjo8
	rGMdrzFvCdNXIidogu/LsTWMWOJFfV3qk1V4ZMObOiAxVKdb1s0RQVq1dKZvbOJKjdrKvyJg6cZ
	0Ghfk4YEPV8+h/xFS+7xcWkjlKL8LG8Xv7AAk
X-Google-Smtp-Source: AGHT+IGZwj4j5QHgqbf9M6ktVVQXLrk8Drh5qXX7tCSAml5AXcdIY2mAHCO3BaKHjRfwXHDOxgMo1HGswGGrIk/pIvc=
X-Received: by 2002:a50:f615:0:b0:561:d84d:f6ce with SMTP id
 c21-20020a50f615000000b00561d84df6cemr80706edn.6.1707802393936; Mon, 12 Feb
 2024 21:33:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240207-s390-lld-and-orphan-warn-v1-0-8a665b3346ab@kernel.org> <20240207-s390-lld-and-orphan-warn-v1-7-8a665b3346ab@kernel.org>
In-Reply-To: <20240207-s390-lld-and-orphan-warn-v1-7-8a665b3346ab@kernel.org>
From: Fangrui Song <maskray@google.com>
Date: Mon, 12 Feb 2024 21:33:02 -0800
Message-ID: <CAFP8O3KuJRuDFC3M=4DS2SVjzo-gcKzNYVAPLmsexnjEifOuZw@mail.gmail.com>
Subject: Re: [PATCH 07/11] s390/boot: vmlinux.lds.S: Handle DWARF debug sections
To: Nathan Chancellor <nathan@kernel.org>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ndesaulniers@google.com, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 4:15=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> When building with CONFIG_LD_ORPHAN_WARN after selecting
> CONFIG_ARCH_HAS_LD_ORPHAN_WARN, there are several series of warnings for
> each file in arch/s390/boot due to the boot linker script not handling
> the DWARF debug sections:
>
>   s390-linux-ld: warning: orphan section `.debug_line' from `arch/s390/bo=
ot/head.o' being placed in section `.debug_line'
>   s390-linux-ld: warning: orphan section `.debug_info' from `arch/s390/bo=
ot/head.o' being placed in section `.debug_info'
>   s390-linux-ld: warning: orphan section `.debug_abbrev' from `arch/s390/=
boot/head.o' being placed in section `.debug_abbrev'
>   s390-linux-ld: warning: orphan section `.debug_aranges' from `arch/s390=
/boot/head.o' being placed in section `.debug_aranges'
>   s390-linux-ld: warning: orphan section `.debug_str' from `arch/s390/boo=
t/head.o' being placed in section `.debug_str'
>
> include/asm-generic/vmlinux.lds.h has a macro for DWARF debug sections
> named DWARF_DEBUG, use it to clear up the warnings.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/s390/boot/vmlinux.lds.S | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/s390/boot/vmlinux.lds.S b/arch/s390/boot/vmlinux.lds.S
> index ff8c62d84f98..83af17bfe630 100644
> --- a/arch/s390/boot/vmlinux.lds.S
> +++ b/arch/s390/boot/vmlinux.lds.S
> @@ -122,6 +122,8 @@ SECTIONS
>         }
>         _end =3D .;
>
> +       DWARF_DEBUG
> +
>         /*
>          * Sections that should stay zero sized, which is safer to
>          * explicitly check instead of blindly discarding.
>
> --
> 2.43.0
>

Reviewed-by: Fangrui Song <maskray@google.com>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
