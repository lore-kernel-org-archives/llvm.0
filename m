Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFDB28B7C6
	for <llvm@lists.linux.dev>; Mon,  4 Aug 2025 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754327715; cv=none; b=Lm/OsGrM69M1q8E9TQojdUVB6U2V5KnUD+BZ1SMuwS08h6IjzZrsgesE1A5jn0QqHn0lg8B/R0avTvpcRRJVO01/nE98PRPb0OW1ci/CFzBMLJuOh/VyMlT0GQX0GlXM8eonxbWoq+lxZuNkZTw66GEcTmYJvNff9KZ9GYsQ9hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754327715; c=relaxed/simple;
	bh=BSv3IA5IuUJhTBGL3xkgYTrQYKCsOpXUGxp4B+QDShQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQdRRK1UoSILbxPQ3z1SCZhxkGwbg9VJqTtkNR0iATQLD6vAfvDwhVkfV+RnTeeFP3vazQsmi/KVJvP9iE+khTHNka+FNrHb6gz+Yn5NSmidc23qEvWu34VMpzP4hdfOwLTJNxccY2rmAXA/9XX0xWfyUdb+i4Q5Do/SW9k8sNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhFd1XHD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhFd1XHD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7825e2775so3867580f8f.2
        for <llvm@lists.linux.dev>; Mon, 04 Aug 2025 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754327709; x=1754932509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ES2rPSb96ZRcMua/upicMCXBbX2m2hK2sP3TCwY9yY=;
        b=ZhFd1XHDkVA4DluUley4tvybBl+H/+RIJ/Oywoy9UFCULAxK8isIlIYH98bDuxeI/z
         dHT1x4WJ+UgtKorZkA0wwmPhfiy1k99YmBoofFMGp/KcvMOUSucMkWfyHldSVUMspQ3G
         IpN+Mrcy3pGN/cPdo4YMDE6WwnZS68RieJEj1PGqRNzD3e4jfnmHdzhXHEi4V8T6fWmy
         /9B5BxcKjhIN5MYoaq20dXkyL7f2UgDtJI+d+4oNewY5RoVhUw5HZp3CWLRZWHSCxo+a
         tUCcgY1tOacJKqKfS0mkpHNGGYp93MDGwWJNE47l2BJN+BYmVTWgKiO34fZSRToEJGGz
         zctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754327709; x=1754932509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ES2rPSb96ZRcMua/upicMCXBbX2m2hK2sP3TCwY9yY=;
        b=NEIueaukCqH7o1mfxF9Unk+43UXLzwT4S8IZZjHndSkorGlTNInsDbkwDau3fOy4x/
         ELKuIrli42Iz4XkXytqm5aLf38VB9u3qKMt1LptIcdRITdCcJbPY6NatHh3Yl0YcWztj
         AVp8bb9mVWlF+6GaGhwpgK41aodg80ujrMlEIemlplPXjPXay3UzV4zLB2GflnO6h/nF
         23LDT6k2n2E3dfmC1FPt6Rjvtsyjm2up6mHSgeExgRaStQw/b6ZLMYF+BT7xGmh3OxOc
         OpX/zn/ex57+IxDMVpAUWz1M0VVnue2h+DeDRVTrUVSVxZgZBZ5D/hTB1OuICEICoJEB
         T/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWg5KhOV1sLgjO92LK7uamYwEmQk2tFhLSvtsF9EfCNreh8dG/N+QJyaGzkfAMOHJCX8NTj@lists.linux.dev
X-Gm-Message-State: AOJu0YzlzaBfXhD2UdTq2fRwT3OhNN6DCbeklHXf/d1n4L3fp3B5cpkY
	58eFUgoO2/+MhVbzzBW2xAPzppcFPKYvyNF3zWF+STrH+E3bCUeiPKpd
X-Gm-Gg: ASbGncsg9dIqmka6sviG33/IsNvuzAsPYjKsBpT4d91Prby9y2v2tFJR2aKrCTFmceN
	LSAc7ezjGP42yCuHCRg0t669Cn6ZTJcV6DsorOFeH9XaiSQ4K5rvexefUc2XgFibsOEibsqjSdV
	hdjdkidko1pWhhQgfvpssIAviFrAT6RPhJISSaJNiRVEWo6vnDbjlHHNl+N+uWTaw9OSTrhMmKk
	fR8YbqtXS7S6e5G1K07O2DO8mybRkIg1C8q9tyhYGhyPh+vp3KeYaKNg0W76YesqL/zBUl42YDK
	FiZLF5m5D/BMv2+Dgq+to26XxzKlmSpaW1bsGnYCzcbgGkRk4gR645CCH+uSIUBFXLrq+VFLcMD
	u99kDNZPwCflo4HQw3yCGnFimN10both5ZXmfYPbw9V27C0McLrpDSVsrVCpzyA==
X-Google-Smtp-Source: AGHT+IEpNawQWUPhZIXoNWLCtN2+qaXCsKArzNXCXzW1yE3i7/WUxeM9GsxIUXvlWMi666W2l82q6Q==
X-Received: by 2002:a05:6000:40c9:b0:3b8:893f:a185 with SMTP id ffacd0b85a97d-3b8d94cf20dmr7323692f8f.53.1754327708754;
        Mon, 04 Aug 2025 10:15:08 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ae8esm16051546f8f.61.2025.08.04.10.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 10:15:07 -0700 (PDT)
Date: Mon, 4 Aug 2025 18:15:06 +0100
From: Stafford Horne <shorne@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 10/17] openrisc: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aJDqmoUNhwWeAlpa@antec>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-10-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804164417.1612371-10-kees@kernel.org>

On Mon, Aug 04, 2025 at 09:44:06AM -0700, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add missing __attribute_const__ annotations to OpenRISC's implementations of
> ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
> functions that always return the same result for the same input with no
> side effects, making them eligible for compiler optimization.
> 
> Build tested ARCH=openrisc defconfig with GCC or1k-linux 15.1.0.

THis looks ok to me.

> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/include/asm/bitops/__ffs.h | 2 +-
>  arch/openrisc/include/asm/bitops/__fls.h | 2 +-
>  arch/openrisc/include/asm/bitops/ffs.h   | 2 +-
>  arch/openrisc/include/asm/bitops/fls.h   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/openrisc/include/asm/bitops/__ffs.h b/arch/openrisc/include/asm/bitops/__ffs.h
> index 1e224b616fdf..4827b66530b2 100644
> --- a/arch/openrisc/include/asm/bitops/__ffs.h
> +++ b/arch/openrisc/include/asm/bitops/__ffs.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
>  
> -static inline unsigned long __ffs(unsigned long x)
> +static inline __attribute_const__ unsigned long __ffs(unsigned long x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/__fls.h b/arch/openrisc/include/asm/bitops/__fls.h
> index 9658446ad141..637cc76fe4b7 100644
> --- a/arch/openrisc/include/asm/bitops/__fls.h
> +++ b/arch/openrisc/include/asm/bitops/__fls.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
>  
> -static inline unsigned long __fls(unsigned long x)
> +static inline __attribute_const__ unsigned long __fls(unsigned long x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/ffs.h b/arch/openrisc/include/asm/bitops/ffs.h
> index b4c835d6bc84..536a60ab9cc3 100644
> --- a/arch/openrisc/include/asm/bitops/ffs.h
> +++ b/arch/openrisc/include/asm/bitops/ffs.h
> @@ -10,7 +10,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
>  
> -static inline int ffs(int x)
> +static inline __attribute_const__ int ffs(int x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/fls.h b/arch/openrisc/include/asm/bitops/fls.h
> index 6b77f6556fb9..77da7639bb3e 100644
> --- a/arch/openrisc/include/asm/bitops/fls.h
> +++ b/arch/openrisc/include/asm/bitops/fls.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
>  
> -static inline int fls(unsigned int x)
> +static inline __attribute_const__ int fls(unsigned int x)
>  {
>  	int ret;
>  
> -- 
> 2.34.1
> 
> 
