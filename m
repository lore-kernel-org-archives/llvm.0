Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166EE2E716A
	for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 08:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761552856; cv=none; b=CfQQNMj93BuR8hrPo5GLUdzHt6+vkvGFr8HUyi5nz1poOZopFhk1QTIAl0arugUGPKMK0DVQ0sAoidEVzn5UwjDR+B5ITkvgYVNFgkm03hWNfzok/35OhkcQe6oXglDnucO+wpEaC9gRKPvKtVebKhu16trXUZoKfwaVYN4vnwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761552856; c=relaxed/simple;
	bh=etqLAq7gFst0cSiu6SvH9Ue38STXBB7ceWx2V9z48vY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTswjQxgL5czvdqhus7KXKy7QMG6wlZ2OLZh/URe6/HJHfPhzwc2YYKhvNyYhErsRV+Q9OjECVt5nwJZ+NFqRPxAQfLnqoPJ4095zxTtszWECo7/XLO0cNZf2ezmuto6Lpvb/ic1d+pkHIR5QQrc6OtRYiOXRsAmhZQrkcg27hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjiTo6sp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjiTo6sp"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-427091cd4fdso2472140f8f.1
        for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 01:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761552852; x=1762157652; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSHu/ivuk7OTgOMQRpfxc8sNj6kHssvRHTUG1SNhELU=;
        b=CjiTo6spf0/qyhoSWI0CjBjDn5FXZozcS6/fEP5SNVTEUS6okXZjHDUhYMVtzqG8PK
         ijoYUOb6D4FVrSu5HG2PnD2y9C4mfZQq/2bAFWHRhMpKGVJiV/PR8Qh7YyJ3PMABPx4F
         hrY1c0p0pPC0haw3HJFpq4kYiRZBJauK0TOOBiyXg6rFR3/KS/4qE7087Te5KEMC2BZU
         /M0MhFACYa0PLa50oVw1oYGudYji6MC38z9EzRXPODu+8lgkUp6l69hdDXVEPxWU2a0J
         PSbIXEi1p15HBio185SwF1owW7LHgboGVo/A07OSUQpoX70bBRk+OtRiwVWx2aZ1aYQ0
         lMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761552852; x=1762157652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSHu/ivuk7OTgOMQRpfxc8sNj6kHssvRHTUG1SNhELU=;
        b=ZC2rYB5SonwVMUM0Hww+7TKooOkDQVHQs8vCR6fRuAz5JIR7CEq+N+OJcPLbPAOnXf
         Qtf8O3Wapln/maYrCqi+VcpTQ+1FezwV0BJC7gM1pm05C3HscjLvjQWO7TTWNa52alvh
         AjiZw2ZdzVJTA7Rum3nhRDQHhw+t9dWISChyhT3Bjf6Ph2QcN1RiJU2TKPAa3g/pr4wi
         T73o0xBbqkXSZNJDqHiGw3B6/G9QrrbaUmSpPRXhasF3QEuZm0U1H2/nnabR776ancwE
         06XROIqrC6gtcKUIG2B0Q9KEY6L1/xKNLtzGlxr4xlCaIaF9UADMcD2XSJj0tHD50QvC
         QN7g==
X-Forwarded-Encrypted: i=1; AJvYcCUvMatlXrPnNODxRnWl+c7oER6ajgtDh5PtaHzXgmnehVgd0o6RtONvdihwPE17yC0HMu7l@lists.linux.dev
X-Gm-Message-State: AOJu0YwkFQOjer19Vzp8JQv+nDrAh/J+fQHd5NLJ6OrdBncMm9VZ3oOo
	BwZh2WRMWVSBtl6MNfi/rtJiwKL+RDQXmfgQyDZKcOx6FoY4DWAAFJgF
X-Gm-Gg: ASbGncvGLtbNwALaUCePHcGU7c33oBgQY2pVanvQH+/DZcv6ZJnOfVdGQ2yloxC6v8R
	R43J/hgfwUEJ1kuE6N+S3poh2xAbNmnftMCqLfrse1rNzIRUJbCI3qgQH70LFYvG6u2I39yA4Gn
	qOixEUvdz4eckDb6k4h3zwM1mh/pJzRygooTiM0pmHGKPq1KQAUWLHiFzkPHyvWYQEHGv5W8KQd
	Mr4zsQwUfyntN2cpmtmmivNzzBrEx1Xl4Tv1jw9O403Ag5AKq7JGsSAPws2otVmfaygxCk+qsJx
	t/PgdtmVjLJadkRidDaO+MbMeta5bdAXvwN9FGWiEdJUqp+U5PCN5CzylICloij2DfcWeMgiEnp
	3d2qUN9J+xQ0zV6C0ssj9ylS3JIK178UdHvZhpWQUntmT35/w5P8tidJFDwqZFKlqWE1Rss0=
X-Google-Smtp-Source: AGHT+IFFKQfLGx2QdYO29wjJqWg+dPw9x5/f0UKf4PSXFO3HYbVj3gV1HeTpZudQpFAVTpuMJ53ygg==
X-Received: by 2002:a05:6000:4a09:b0:427:62b:7f3 with SMTP id ffacd0b85a97d-427062b07f9mr28406369f8f.33.1761552852032;
        Mon, 27 Oct 2025 01:14:12 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5768sm13058047f8f.24.2025.10.27.01.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 01:14:11 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 27 Oct 2025 09:14:09 +0100
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, llvm@lists.linux.dev, khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jiri Olsa <olsajiri@gmail.com>, sam@gentoo.org
Subject: Re: [PATCH v2] selftests/seccomp: fix pointer type mismatch in
 UPROBE test
Message-ID: <aP8p0Td0LLa6Odit@krava>
References: <aP0-k3vlEEWNUtF8@krava>
 <20251026091232.166638-2-nirbhay.lkd@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026091232.166638-2-nirbhay.lkd@gmail.com>

On Sun, Oct 26, 2025 at 02:42:33PM +0530, Nirbhay Sharma wrote:
> Fix compilation error in UPROBE_setup caused by pointer type mismatch
> in the ternary expression when compiled with -fcf-protection. The
> probed_uprobe function pointer has the __attribute__((nocf_check))
> attribute, which causes the conditional operator to fail when combined
> with the regular probed_uretprobe function pointer:
> 
>   seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
>   expression [-Wincompatible-pointer-types]
> 
> Cast both function pointers to 'const void *' to match the expected
> parameter type of get_uprobe_offset(), resolving the type mismatch
> while preserving the function selection logic.
> 
> This error appears with compilers that enable Control Flow Integrity
> (CFI) protection via -fcf-protection, such as Clang 19.1.2 (default
> on Fedora).
> 
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>

Reviwed-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka

> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 874f17763536..e13ffe18ef95 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
>  		ASSERT_GE(bit, 0);
>  	}
>  
> -	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> +	offset = get_uprobe_offset(variant->uretprobe ?
> +		(const void *)probed_uretprobe : (const void *)probed_uprobe);
>  	ASSERT_GE(offset, 0);
>  
>  	if (variant->uretprobe)
> -- 
> 2.48.1
> 
