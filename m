Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE0156C6F
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 22:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723084; cv=none; b=lzE8Cyqzfv0McKKj3CxMhaCWK9KywF9WHALVX8QdWoTx/jFqtXQdc+BZAHgrJ0euGCHbHrUvfvX3kBmqZK28DncatesZ0GpcdrLCUfnyin2v6omUmvNXPKrxyMZZxR8zh/8X3brvZZW2fmvI2hTxDFkuA2brG34DssNPF6Wf/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723084; c=relaxed/simple;
	bh=VwEUW5iJSlm9/CNOOGua3OLreSG4GLGoycOCFAen6TA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8jwCaeplfjD3o577vmK4aOQTIdD8UUVR+yieXgrUkaiqttKBIbHhqRryFqysqZX49WwOAomYUyD+J8TEngWHuL6bHycYu7lyZR9O9Euk571Rtb8dwSIuAqL5k2TlyC4piyaHrZjglb9n46yWgTVWMoWx5xsST1IFL2viV0YCIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6YFCWBl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6YFCWBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5B2C4CECC
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 22:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729723084;
	bh=VwEUW5iJSlm9/CNOOGua3OLreSG4GLGoycOCFAen6TA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l6YFCWBlx+WocJvqZxGt+InK5bbZNO1eENB38gzsctM28XUMT9FDu/BgdaM9RG2RN
	 BCrQ/tKpO9lpRVDU//X46kWpV7AreBgSIw6c5vzS0Q+F4y1DAc7p539gKqjZoVtOnU
	 2oVZP/AS1xjJThFjNJcWQsQYNDND2YFNJ2oMagFMF+SWFcy894NcyvzZM5OcrDmsR1
	 cfumPN92gazRPcEgkt3txnigPTVenRANDdJbKgp8I9oASzMuhE16avqdsQ8zZEYohh
	 l5Oy0EtnJ9M8S+GFEvnqb4IfCx5ltnZ1N/H9lpItgqdlEChnM+Znzveqc+iGdw3PmI
	 0z6/QLNP0HNnw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e6c754bdso256585e87.2
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 15:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUt4fFs07eS6KL936bAAlz0pP5vY4RdBqb8yogGE+B70ROHjYWFqeCX6lm7M8u5h2eTKUjO@lists.linux.dev
X-Gm-Message-State: AOJu0Yx38xBMVVdMaNeB+okIIoV3mLTIcQuj37m6sFjQ+jryDPlJvaqX
	ghw1fzEZK1LjOdlVZyab766eewFRPSOUlG2BhJ7M/o5ocdCXVbpBHmDA/OPY5hrVcWr+rxYTpYD
	2jO6h5XaP0OQX+ZNML2ESCCCEKW4=
X-Google-Smtp-Source: AGHT+IHyzRu/ldUleBZN0H1xDjB/FopQEnCZUwTujKPi2G+VLc25xRuTEBUL/G6AcOYTxEAuXp0DVLn7acQsknI4qtU=
X-Received: by 2002:a05:6512:ad5:b0:539:e2cc:d380 with SMTP id
 2adb3069b0e04-53b1a341cb6mr2080833e87.27.1729723082566; Wed, 23 Oct 2024
 15:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <38508cf1-7d44-4656-8060-973e820b2957@paulmck-laptop>
In-Reply-To: <38508cf1-7d44-4656-8060-973e820b2957@paulmck-laptop>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 24 Oct 2024 00:37:50 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFA2_LNpZcrGh0GJyE0_9BaRC_ypnP3eigVG=Vf4B+gqg@mail.gmail.com>
Message-ID: <CAMj1kXFA2_LNpZcrGh0GJyE0_9BaRC_ypnP3eigVG=Vf4B+gqg@mail.gmail.com>
Subject: Re: [BUG] Argument-alignment build error with clang
To: paulmck@kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>
Cc: kobak@nvidia.com, mochs@nvidia.com, rui.zhang@intel.com, 
	rafael.j.wysocki@intel.com, sfr@canb.auug.org.au, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(cc Dan, Nathan)

On Thu, 24 Oct 2024 at 00:26, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Hello!
>
> Running rcutorture on next-20241023 got me lots of these:
>
> drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned argument to 4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>           156 |                         (void *)efi_pa_va_lookup(&th->guid, handler_info->handler_address);
>
> This is built with CC=clang.  I don't see this diagnostic with GCC.
> But we are supposed to be able to build with clang, so...
>
> The first argument is the address of one of these:
>
> typedef struct {
>         __u8 b[UUID_SIZE];
> } guid_t;
>
> Where UUID_SIZE is as follows:
>
> #define UUID_SIZE 16
>
> But this guid_t is a member of one of these:
>
> struct prm_handler_info {
>         guid_t guid;
>         efi_status_t (__efiapi *handler_addr)(u64, void *);
>         u64 static_data_buffer_addr;
>         u64 acpi_param_buffer_addr;
>
>         struct list_head handler_list;
> };
>
> One can argue that this structure must be 16-bit aligned on a
> 64-bit build.  So maybe this is a bug in clang's diagnostics, hence
> linux-toolchains on CC.
>
> Thoughts?
>

Also discussed here:
https://lore.kernel.org/all/CAMj1kXFXimHaGdeDBH3fOzuBiVcATA+JNpGqDs+m5h=8M_g+yA@mail.gmail.com/T/#u

I agree that this looks like a spurious warning. Even if the alignment
of the type is only 1 byte, the fact that it appears at the start of a
8-byte aligned non-packed struct guarantees sufficient alignment for
this particular use of the type.
