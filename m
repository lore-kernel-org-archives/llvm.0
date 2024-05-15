Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4377538DE0
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 04:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715747236; cv=none; b=c2JlSjxREPiKSecp+9EZX/fZqsuvUDq+hG6pxLZq9DWMSWZ1/1jIkwkI43GwFPYPPGGrMqf4MY3hFLUgDWf2/kusSvIsCFL6kBhmPmkRBupgNHRPTpIJTIuKrCLizS33rgVWjwbXLB7aogYKinBRzzD3vP5fNrSdJqQTKCk/hTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715747236; c=relaxed/simple;
	bh=uG3TlZQYwVsJzNK3nRYCiUcbCmFyKeITsFWYtpbGuRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFNFZTzZwhCbKcXFUIOpqIFZfCDx+1TLZZl7IAibkmRjySuBGTbbF2whutPrfhtwrks2KPpn+uEhfDYAOHP7eHzsfA0LjU2kUt/wan3UUyL1uBtlMXy9CHbZNK+3FdTZb8TMpgfTkzUw26Gws0jgj0EdQRD1I7Qd9iJ0QZrdEmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3EQOBhL; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3EQOBhL"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61bed738438so64252267b3.2
        for <llvm@lists.linux.dev>; Tue, 14 May 2024 21:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715747234; x=1716352034; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WiEIOLpsixcgy3ozP40X2dZ487g1O4kcCzqIi9RaQQg=;
        b=P3EQOBhLSws9L3HmOVXoJo4qOkqrJKp7Ozqn5AkTdTdcut+lzak29ellhPQd6oSc1y
         DpLsmSpAMhZzyzw1Aq2Jizs4KLXBwbavKGPCVvMGisimNGYeNAPgvuc0rGNMBlt+DjLh
         5TxwQdJNoJe43fGE6f1CUUXzBp/JsktmfTl+rU/yAO21wYpdmBsCoU16ktSupJruqYiX
         T5rfDNDtZg5qKeI9PK4ftSqhrGkEhqkFZ4+ZTD9kKWc8lYqcc8LqQ8ZF/HXnivnc04cK
         v+41aob9C5M6Uh0w0/9aYM6KUIMl21uWHnI9gaDbaEQLPCOCO4mWEdAt9YjBrKiBV88A
         MSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715747234; x=1716352034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiEIOLpsixcgy3ozP40X2dZ487g1O4kcCzqIi9RaQQg=;
        b=OhBb+6jJ6wPyK5H7/U0jzeoT54mgcpdmnBtJMFPKpcFLLT1SUTvfpdYhmaL0lRND5x
         aPfMx5ujlu+cFVqJzIz/gOnW6GPA7MLvzYZI6paYyHD5MPCag+u7CsBbSiuI2cb/AvBJ
         RfaBFVoHXONDGyOM9N/MsjMwe9P2k2aoYXN+6Nge9/C8s5ZpyxT70UPnPfMKHgRSAHdo
         ij/BFTJugm2Lv5hZjQrPvFJYya1ShnjIcEohBihTmw0fSRm4rWonTGe3UtueCpJOKOxe
         c8VtVG/Qis5XIXb1z6n6ljf98Whrmgsfv/v37MXjUVHmlj1N2thdHdTA894Ye/QJX9IJ
         kavw==
X-Forwarded-Encrypted: i=1; AJvYcCX75EDdgmJdV6J09IGkeq5suGIPkN1q41f0SZ7E0Y09Qmt9HPSiO3NDVvZHQxeH2PkKvYXpp7UdN9nPNSxVnHd2H2yuwg==
X-Gm-Message-State: AOJu0YxLuJ1kQ052dEn+pPVTCfLqzs7rGlc3apPApG/vL9AQqqnQmELQ
	yDrS34E7LJZWdxvOSI0/XSCtssXai9vbtUB+HVklIxuQlKqI+3O8
X-Google-Smtp-Source: AGHT+IE9EzcDblcgyUuBQZl41P24ypu366NHZpYiJI7vY8L3WexEfNpzbwPKX6UF0opw3iJhK9/P0g==
X-Received: by 2002:a05:690c:f87:b0:61b:1e81:4f65 with SMTP id 00721157ae682-622afd979demr174326217b3.0.1715747234119;
        Tue, 14 May 2024 21:27:14 -0700 (PDT)
Received: from server (S0106f85e42401d5e.cg.shawcable.net. [174.0.240.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ade2besm10350742b3a.98.2024.05.14.21.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:27:13 -0700 (PDT)
Date: Wed, 15 May 2024 04:27:11 +0000
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/4] selftests/binderfs: Fixes to binderfs_test
Message-ID: <ZkQ5n4pZYv2PfwmH@server>
References: <20240515010805.605511-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515010805.605511-1-xandfury@gmail.com>

Adding Shuah Khan<skhan@linuxfoundation.org> to cc.

-Abhinav.

On Wed, May 15, 2024 at 01:08:01AM +0000, Abhinav Saxena wrote:
> Hi everyone,
> 
> My name is Abhinav Saxena. I am a graduate student at the University
> of Calgary. This is my first patch series for the Linux kernel. I am
> applying for the "Linux kernel Bug Fixing Summer Unpaid
> 2024". Apologies in advance if I made any trivial mistakes :)
> 
> This patch mainly includes issues reported by checkpatch.pl.  The
> changes include:
> - Running clang-format on `binderfs_test.c` to fix formatting issues.
> - Updates the macro close_prot_errno_disarm macro.
> 
> Testing: I tested patches on my local machine (ARM64 ubuntu) with
> checkpatch.pl and running the selftests.
> 
> Best,
> Abhinav
> 
> Abhinav Saxena (4):
>   run clang-format on bindergfs test
>   update close_prot_errno_disarm macro to do{...}while(false) structure
>     for safety
>   Macro argument 'fd' may be better as '(fd)' to avoid precedence issues
>   add missing a blank line after declarations; fix alignment formatting
> 
>  .../filesystems/binderfs/binderfs_test.c      | 204 +++++++++++-------
>  1 file changed, 126 insertions(+), 78 deletions(-)
> 
> --
> 2.34.1
> 
