Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9EBEAF4
	for <llvm@lists.linux.dev>; Sat, 10 Feb 2024 00:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707526142; cv=none; b=Z/4XsIFWshoQKcrKp3mb9BaspV0PjczrSnuo/iyqkwCYn7sTdsvYZoV8/sQ9lbIE43xIMDOmKIwHKchazh/msYIqldfxy7i7X12lBJODBfKrPwyZTIZADCcST7CKCo0KJNqj6ut/9of/6IiTdMVJM/uer1K5r6V+SuPSTD00cjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707526142; c=relaxed/simple;
	bh=hrEhIt0za4zXX+4YcZvr59C24AojcEa8uuOYHTznHjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIqI6jjbZe+Lra7p7dEFNx32lzc1uAEz+H/vUKO8W4iVAPJ2moKj/lpLavs+mVFO5MiwsyuZl3DrAeruv8Y1HW+ZRO8haftHQOKdEH831NYL38t9Nl/Hy1OGKJyYHJcUfhUsTFpFHeKlGBsHC9yHEgVXJSNpNPGwSZpp9LRQkWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mq6YYoi+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mq6YYoi+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d74045c463so13328405ad.3
        for <llvm@lists.linux.dev>; Fri, 09 Feb 2024 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707526141; x=1708130941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xhIOsBixkq6X+I5UtLFYmEvlA1q4nQi2Uk71zOMtrW4=;
        b=mq6YYoi+o3TStqh54FOQkrzYWdzj4d0rwxao4K/E3KpL7iPS3MKR8outOLq76blZFj
         QR+CbzRsl2PRqSmTyUnlEatjzobybfo2omUUh3KQJKnmgVsN1mZVmbkxQxQVTovVMDeI
         ey9u08hinOwFAuXMXxC/amCbXt/k2J7aDx+5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707526141; x=1708130941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhIOsBixkq6X+I5UtLFYmEvlA1q4nQi2Uk71zOMtrW4=;
        b=N8haRFoDig6XgQzuK39P+X/w0Vol5VaGnM3uotFSRlX4PwdaDC/yBohrAE+khxKuV8
         vuMXcmWHXblGb42H25KoSsEuJO42LcGKGgwKz//5jgNwMtec4Z+O5udTUw5LKlEFpe4B
         rAlFjsByi6u+a6TyKS247HCotAEAW65kXIzDcpuIkigr/JK15EzXkBXTSSxaQmgTPK3x
         qbsN+3XHOlzdnZEXa0ieD4Jh6WohB1HIfjByIxzGTXGVjyKNZi0JDKXqTYPX4BxYeiWS
         ZDD8MOBv2c9gXL1wUoU59vYpNmnOq1f4rIPzwE3Mh038/bqmyQY8iBIVewjqs+ewrwqT
         7zXw==
X-Gm-Message-State: AOJu0Yy/KQrSl4gbQDRH3tcS64MiuepFV/kkU67aNUg7+mpjmkjG/GF2
	9pjV7oCEhpyF9AxSj7eo2luXQrlu4RHr2QrBryAy60ykaUtmr42tPae1Z6/mBw==
X-Google-Smtp-Source: AGHT+IGqFQmp48EV/HeK/ohKlHb7zxUA5fEEZHeG+9UTzYyujZAJTn94wWRhwDxrqBopNav53lCKsg==
X-Received: by 2002:a17:902:ea09:b0:1d9:b8cb:3665 with SMTP id s9-20020a170902ea0900b001d9b8cb3665mr1167619plg.36.1707526140735;
        Fri, 09 Feb 2024 16:49:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVI0SOI2E3VC0AE0of9/MYFRR0yVYQzthkFmv0JW7fA/SJQhhnnI3Nj5OEsNvrtNcdRFhHpOf5u+C3DGYEj7y1QmZKG9DqmJxhSLGKUmKRtiym081eBwXvmlPvnPoRFbYozaBCVcEzpfdzvKL5XsE6na+cvYGSIz8z/iw3GGz5NgMjZyC8x1ylmlUU500p9eC7PsDUz3qdjaUJ4lDemv8WJ00f0xgTx30k9IBXOA4ukuDuItip5wN0tqF2XRRURTeOK4zFlkc/U1xMHtLiGXHCiJxbOfRkGuI6qbhSgFvTKnpkPDxwJIq+B0WYaKEtx/pSF/bhP69oEmAjzAfeoA5ZDA9/FFXosjMJlFihIuYBkey/d
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902748300b001d9eef9892asm2062122pll.174.2024.02.09.16.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 16:49:00 -0800 (PST)
Date: Fri, 9 Feb 2024 16:48:59 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, maskray@google.com,
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: Fix changing ELF file type for output of gen_btf
 for big endian
Message-ID: <202402091648.2B8D95062B@keescook>
References: <20240208-fix-elf-type-btf-vmlinux-bin-o-big-endian-v1-1-cb3112491edc@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208-fix-elf-type-btf-vmlinux-bin-o-big-endian-v1-1-cb3112491edc@kernel.org>

On Thu, Feb 08, 2024 at 01:21:06PM -0700, Nathan Chancellor wrote:
> Commit 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> changed the ELF type of .btf.vmlinux.bin.o from ET_EXEC to ET_REL via
> dd, which works fine for little endian platforms:
> 
>    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
>   -00000010  03 00 b7 00 01 00 00 00  00 00 00 80 00 80 ff ff  |................|
>   +00000010  01 00 b7 00 01 00 00 00  00 00 00 80 00 80 ff ff  |................|
> 
> However, for big endian platforms, it changes the wrong byte, resulting
> in an invalid ELF file type, which ld.lld rejects:
> 
>    00000000  7f 45 4c 46 02 02 01 00  00 00 00 00 00 00 00 00  |.ELF............|
>   -00000010  00 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
>   +00000010  01 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
> 
>   Type:                              <unknown>: 103
> 
>   ld.lld: error: .btf.vmlinux.bin.o: unknown file type
> 
> Fix this by using a different seek value for dd when targeting big
> endian, so that the correct byte gets changed and everything works
> correctly for all linkers.
> 
>    00000000  7f 45 4c 46 02 02 01 00  00 00 00 00 00 00 00 00  |.ELF............|
>   -00000010  00 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
>   +00000010  00 01 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
> 
>   Type:                              REL (Relocatable file)
> 
> Cc: stable@vger.kernel.org
> Fixes: 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> Link: https://github.com/llvm/llvm-project/pull/75643
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Yeah, looks good to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
