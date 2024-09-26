Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F00182
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 00:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727308860; cv=none; b=RXmsDQMdDLe9BAZtgRth34KhJQNXB9dwMAom4FMrngAEdjJ8SYqX79iGVciCfifNfFfy6YDJVvGZvEmUsEj7qxNavuV/8Gpa43zHseT+ofWRaQtRYTlwLu/GDFrwbfW6gDcOe87/438iiPaCwi8Y297riQ8ot4GvkHgWaLCEiY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727308860; c=relaxed/simple;
	bh=BRlZIBO2y/xAVIRFSMfbTOWt4y/TMHCA4wppJ2Xy5Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4Kkv2IEGcwF+O2bXhiVxYH0sralm7RbL6C9K9hERsuLwy5RCJkDDvOtqRg63wCCTN7g9X37fhNjQgHduQrhhO4ZRiKu+fzSIEVaEhdTzlawxIDPBTsV+fk9ktgtzkuMdGiAKV6lVllNQkgwOz0ewAxm5pamOZzGEYew/tmuDj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DnO6Y75w; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DnO6Y75w"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-207349fa3d7so44145ad.1
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 17:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727308857; x=1727913657; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPuMIPtkFUqqXprChJbKt7gTP4JuGanqczP3oBY5vrw=;
        b=DnO6Y75wEGc97kuSEetS4dO5xXX4H/JfXhq8fR4PHzi6wFumeo4BBkDNx5t19/g7Tv
         KGXyTQng21xGOLjSmXfL1zJ5Iv40khQ+zINaLlo36BtqQhZpHVPCs0rXwEX5cxyLBmr8
         eYXci2uVL/xcjkLlQbF8KagylXgq7OuGWR3VwtavU1n2UR6lZvfGAKdwSecqj1Go8v6D
         gWjG9aWTLiGHae9TvNr2SBz/XlUZQAssGHb8fmp7yFXMSryYt1tKVho0dWpo5xfzrrD4
         8xN0rwBufdfbU/J9+1Fx8Fyz1Zyje4h27IYiaPgPUDHqlVa71Eu9Q/2sEIYm3pWJ0cW+
         mT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727308857; x=1727913657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPuMIPtkFUqqXprChJbKt7gTP4JuGanqczP3oBY5vrw=;
        b=ORDfH4D+4i8zx1dm7IXLcILHDQrW8TIT5MAsVuj9wIMcWV+IGgvlq49fgFPEVM06C7
         8iFprBolbxb/lNUOkfh0Ovdv6vk8rdmpOCa51BnuhFONHvSncVnpYlWyFpwWW7IGXKl0
         XyJDdvfxYgeXyLnjOZBYOeZ2cKaq+e9YIkkp194jqCZLyLJ06NA1gYz+qGwZ9r8TM3X5
         sJJJSlfVgBKEm4Jd0i6WBQaalsnJ63BTwewgg1L2f6gH++EdbvTBIyQEw3qwdlkbwSrD
         Y7Y2umEFEEo6qx0Ubt/Yku8jynx9QlU3V12CjKS602xKz8cAGj9/5ArTTAFkmrwrsU46
         wW+A==
X-Forwarded-Encrypted: i=1; AJvYcCULt3JbEx550qcpJ2EGvyy+UDtF2WZxPumLEcByQ2jDTsvsJ8cbkaVJ6He8Cy87eS0jtHUV@lists.linux.dev
X-Gm-Message-State: AOJu0YxYmG8wOaaaSwyXBSCR5w39r5dhxEvB4RRPiyAt+2pXTgv8bLXS
	lMw2J3vklnDGqd/kx8dpZVQUWW4IfCHH5opCiMPaqO5YcogKR601MthZ1BtMQw==
X-Google-Smtp-Source: AGHT+IFhjnkWy3FRA/CwSvG5CGnMdRcwTo96YK+0WkkTkGo3zIVuPlKKZn2oyrmo/1I+PT8z7lwKjA==
X-Received: by 2002:a17:902:d506:b0:20b:b52:3f7c with SMTP id d9443c01a7336-20b1b47470emr1341395ad.18.1727308856775;
        Wed, 25 Sep 2024 17:00:56 -0700 (PDT)
Received: from google.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17e1806sm28912165ad.166.2024.09.25.17.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 17:00:56 -0700 (PDT)
Date: Thu, 26 Sep 2024 00:00:53 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Gatlin Newhouse <gatlin.newhouse@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] cfi: encode cfi normalized integers + kasan/gcov bug in
 Kconfig
Message-ID: <20240926000053.GA3188344@google.com>
References: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com>

Hi Alice,

On Wed, Sep 25, 2024 at 08:10:18AM +0000, Alice Ryhl wrote:
> An alternative solution is to inspect a binary created by clang or rustc
> to see whether the faulty CFI tags are in the binary. This would be a
> precise check, but it would involve hard-coding the *hashed* version of
> the CFI tag. This is because there's no way to get clang or rustc to
> output the unhased version of the CFI tag. Relying on the precise
> hashing algorithm using by CFI seems too fragile, so I have not pursued
> this option.

I suppose there would be no need to hardcode hashes in the test,
it's enough to verify that the hashes for the compiler-emitted
functions change when integer normalization is enabled. Still, I
agree that this doesn't sound worth it in this case.

> diff --git a/arch/Kconfig b/arch/Kconfig
> index ee58df8b1080..b8066bf43153 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -829,7 +829,7 @@ config CFI_CLANG
>  config CFI_ICALL_NORMALIZE_INTEGERS
>  	bool "Normalize CFI tags for integers"
>  	depends on CFI_CLANG
> -	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
> +	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
>  	help
>  	  This option normalizes the CFI tags for integer types so that all
>  	  integer types of the same size and signedness receive the same CFI
> @@ -842,6 +842,22 @@ config CFI_ICALL_NORMALIZE_INTEGERS
>  
>  	  This option is necessary for using CFI with Rust. If unsure, say N.
>  
> +config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
> +	def_bool !GCOV_KERNEL && !KASAN
> +	depends on CFI_CLANG
> +	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)

This looks reasonable to me. Thanks for the fix!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
