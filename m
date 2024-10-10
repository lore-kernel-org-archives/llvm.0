Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1761CFEB1
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728591663; cv=none; b=TDWoH+2RE6IYKSHlUP4ld3RS1hCevQQoGpbfjmrwnpFm0pWsb885pbAOeXps/OUazR9ag4oj1snoR2lJo0XmzfXj7oLTl3A6dljkdHxYR6XODaZB+JXKpXjcptKYO3xmNtOIxbp58KRi9AjtLlfriDiZ/t9MZjTkexy2OpEabnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728591663; c=relaxed/simple;
	bh=9WfALPVOfJZ/mFKzAYvK//SVHWXbd2ywhl9rOI2AlWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYt4eYyK2YhqRvr/w4dDZvWxWBgTAwtwPVSq+3PmjgyUv7WjqNH8u70yX3bjhy7X1uS8RvEUVNJA/GHDVeFiAIQS5ZvvUOibWjJZM93f0koBfYT5aNpA9lpjpOL2L2TeHGvX0kGX43Sxrjnzsh2ZWXiCkJPC9wCfXiG049lerBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UFaDCxy2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UFaDCxy2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20ca03687fdso27465ad.0
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 13:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728591661; x=1729196461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bsUUagQLMxpsg1s3OtRahk2ocs42xsdekbZ732TOaq8=;
        b=UFaDCxy2PyntwWuHtJFp+PooNaWGeh+VcGPQiFmSpJeJ9SOaDuWGKeK8YVTHdVmpSM
         aqlK657E3Mj4pR1bV/fUTsju/Y1wKt8k0M4KjovNh93wskNfZPsyAoF14fpb/0Rf/S5e
         BiZSCOdg0zOlp976jXDSDxdFEuHl74XhfWiMi2dORJ141XA2QtR6BOyCkv1Y4Gqck5hu
         sCJnV5Pjw8oh2VuUlp2UCSH3KcZ0ZLjvVWUIuepHAW1OIV5fSx4GCfBCObmarbm51OST
         16/EZMi/2STDSkVjuCeSo0woZAH/dbUtUmOSPrggxn+Oehu1FNi2gTAIwIm3B+h2+/wO
         eJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728591661; x=1729196461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsUUagQLMxpsg1s3OtRahk2ocs42xsdekbZ732TOaq8=;
        b=uf44oI8gw7DWScYO/eC8FnXKq/F9YpiJ4ZbFy6eY6jVsPvqFJYL0zOgb7KijxfkGmv
         GtzhCWJlTAvkPZNx0JUha/I73D64OqmY22H3VM1XbyjspUndYa8pjrvfUgsr1I4kr0e/
         ArtX4YkngVbogDR+s4nl8XUVnqzmS8f4uEmuK0RAhM9zAFXwSelKChGOaGOTl8LgurSj
         8OnME8eJ0P0qXtCNLzBNZu9y0qv18sQTkzAwr/SQ3QpTdNS/BoFlkxk6/Zzx2zY3/LYQ
         etKCICxdcY2ihtrfrZanXB6jePJdYUQ3bK7fnb9sUN66nbhUmNWQUgDKK5x6cHCVbvNd
         oo/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQCvOWNJdf17JqbRKg32Dl/4f5Zt0S6apb3QTnEZWEIDbHrovYXnzM/ctnt9L3HYRsYcGw@lists.linux.dev
X-Gm-Message-State: AOJu0YxG2aNk6+UUH7kMGI0Lh7G+StWHDyQyKbvVwsq2PliK5CbM6RMM
	RReE/T6df0BJ/4HV1gEDImWm4o6sMtVLC8nu+/7llTqX+PIr862wsQlDoGP3/Q==
X-Google-Smtp-Source: AGHT+IGX1gGCNGtPua6Jc81nhJD2bm6jRchIK8UyVGA97X9p4VXx4bjHZm0n+42YHrQKT4AF6r5IpQ==
X-Received: by 2002:a17:903:248:b0:20c:7409:bcda with SMTP id d9443c01a7336-20c9ee81b5emr668245ad.14.1728591660965;
        Thu, 10 Oct 2024 13:21:00 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5f0a3f4sm1779389a91.29.2024.10.10.13.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 13:21:00 -0700 (PDT)
Date: Thu, 10 Oct 2024 20:20:56 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] cfi: fix conditions for
 HAVE_CFI_ICALL_NORMALIZE_INTEGERS
Message-ID: <20241010202056.GA845212@google.com>
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-2-8f114956aa88@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-icall-detect-vers-v1-2-8f114956aa88@google.com>

On Thu, Oct 10, 2024 at 09:38:27AM +0000, Alice Ryhl wrote:
> The HAVE_CFI_ICALL_NORMALIZE_INTEGERS option has some tricky conditions
> when KASAN or GCOV are turned on, as in that case we need some clang and
> rustc fixes [1][2] to avoid boot failures. The intent with the current
> setup is that you should be able to override the check and turn on the
> option if your clang/rustc has the fix. However, this override does not
> work in practice. Thus, use the new RUSTC_LLVM_VERSION to correctly
> implement the check for whether the fix is available.
> 
> Additionally, remove KASAN_HW_TAGS from the list of incompatible
> options. The CFI_ICALL_NORMALIZE_INTEGERS option is incompatible with
> KASAN because LLVM will emit some constructors when using KASAN that are
> assigned incorrect CFI tags. These constructors are emitted due to use
> of -fsanitize=kernel-address or -fsanitize=kernel-hwaddress that are
> respectively passed when KASAN_GENERIC or KASAN_SW_TAGS are enabled.
> However, the KASAN_HW_TAGS option relies on hardware support for MTE
> instead and does not pass either flag. (Note also that KASAN_HW_TAGS
> does not `select CONSTRUCTORS`.)
> 
> Link: https://github.com/llvm/llvm-project/pull/104826 [1]
> Link: https://github.com/rust-lang/rust/pull/129373 [2]
> Fixes: 4c66f8307ac0 ("cfi: encode cfi normalized integers + kasan/gcov bug in Kconfig")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

This looks correct to me. Checking the LLVM version is definitely a
better option. Thanks!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
