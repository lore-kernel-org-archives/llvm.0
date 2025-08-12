Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6939017993;
	Tue, 12 Aug 2025 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755022063; cv=none; b=qjZGQSCqFUTlCt9IBXVWWVqvnN3ryaYY0S9QWf8R0RAWX2pgh8qREOb26J+fjNiuLqEoF2c3I+bL8cDMYlWo/HkbUDsIu7aY/7lXJKPRgnQ8h2g7rXFSHx/4LUv+CyyRE/cDqd30YW1xqbz5rxtwxXlo/hXba8vxRLwBz0O90s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755022063; c=relaxed/simple;
	bh=7tVlMxBxSUqDkQ/YT+j6av2beaKwd8lQaB291K7ue9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUGbgWL1vRK+gMgRq7DeeT0JkdsfCHHmtPNfaf2khm3G8xfhnDTjnkrZ2cklIjg6PAlBHkVecGzhuTEqrATAZkpRnUzZt/kDsnfo8jrCwWanlhDPYwEQNRZgc24aZVs5HEUb0ljS/dF1So2iv47i9gu9FbHb8MIO92wbWTN1R14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMw++2i9; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMw++2i9"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b46ec4d5d0aso1819858a12.2;
        Tue, 12 Aug 2025 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755022062; x=1755626862; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7tVlMxBxSUqDkQ/YT+j6av2beaKwd8lQaB291K7ue9Y=;
        b=MMw++2i986U161RSqHFGiZkXH2MsPVHFY/R4vksy91fYD3rbZYsCwbDZx6WaZJzU73
         WLtLABMHnBti3EBKsk/gnKVpnFImxsf4UWBVTnzaRaUdR11U0b1e/F0RWE6EoPTahbJb
         AGC2hj/PO3IRbDcoMubkkyS3efsDliTslnVQDFbXydNYczUvoJZd8liHt+/BA32WlYMw
         opMYFdZgyxgbLWH2JbIWpoHtjw1DA9q585EwnfhacnpsG6OPu6OYcbz0IcWtB7rceTTh
         z35pTYdFrTIICX8DaRCwRHOG7JAHy0/C3aSSw6jAQ0X6yeDPbaA6/4CNIBHLSpQuVsAX
         Uq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755022062; x=1755626862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tVlMxBxSUqDkQ/YT+j6av2beaKwd8lQaB291K7ue9Y=;
        b=BC4HJBWv2FvBp++8e7zuMNKmY/Y8Z8yEnua8tijvQdvjeAj4iAkfxsso48VXtPMDjk
         Bo4RZ2u/+MBdF2rSEi/G37QjOo5a+rck96kZ6h8lBMDX5FxxVlcq+THBNcon1sJWpaZA
         4/aUhRwgYnKBfH0Iyboqifu+c+zH54lICIa0mXV24cH4VrY2LfvmQoiyALVTBj8aiNWZ
         4I8kfks/9eFlmsIPK+6fvcezObhpEH6yIdpP0qkjsnxpa2FDB4MYY6kayPiT8JFYcpLX
         Q6Xls9eXdrSzbD+Ge1rPKdoaGeg5cdgwusq8XfQvb2dsTKE5vKLmZWk5Tot4A+duNROg
         8xSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2bJeU5XuYDkAHcH8l37Mrs9s6+DaJYmKtf90hIzYIAy3z36SSpYOsM9G2FqAKFnCDuUgl@lists.linux.dev, AJvYcCWz/vawvCKMEWH7wPEFRk8/EW9CNxJaFdNiQ3+Q1kQoi05uVM8BgUyJUFd2l1pUD20Fr6YFmAGFlYqv5tQ4rw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxuiIVyPLJBTKOPwFvRIhwJ4ChuA7AbuQKtmDQhnxEkotpaVxu
	2/KopQMMND7Hu7iLeQAGfT2xVwLg/UmpivQ1pskH6gp95dcHUnqW+dX8
X-Gm-Gg: ASbGncsrNA3WmYnJZmFJD8WVMFq1p2JIwrrh4Z8v3KdEE8dcacC1MOHa7kYhj1Ihq75
	C76JSVaiJIJfzouhJlIPG7JypPQ0/wNJ2kWTe3DQFBZmsEq0A3mJt5xFcP881zWfTT0Ttze+ovF
	ReiNZeUTJZEwR/iAwZ2RDCglHdfo6/SQR/MyemdyTifRLazoRr+rPAAU+JTqRH4MvGOmjmUvv0i
	HtY3nOxalcIAuHfpH3jIKHDKJvV7jMBzyoasVVtdRPLKwJ8xGS5DLIip7fqmGr9XN6cevNs1euX
	ZYxnKh/XvqOm99AnZYGc436yUhdSHsPgg+Zntca9/fiYq4U7+1GNdWGLtlX5cnWHthpbcLc5pZE
	IQgtFFH+JVm89wwtdeXF+08PphQIGcA==
X-Google-Smtp-Source: AGHT+IH2eAbhw6s8RrO6LOuLceoPWy7RgMZVatbE8YimrP9qcp0B/w2fFg+C1Bb2gud7MsEdF4yB8g==
X-Received: by 2002:a17:903:2447:b0:240:9006:1523 with SMTP id d9443c01a7336-2430d0b1ea3mr2286925ad.10.1755022061514;
        Tue, 12 Aug 2025 11:07:41 -0700 (PDT)
Received: from fedora ([2405:201:5501:4085:eece:e0ff:6b68:de2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89a077csm305678965ad.138.2025.08.12.11.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 11:07:40 -0700 (PDT)
Date: Tue, 12 Aug 2025 23:38:06 +0530
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] rust: kernel: introduce `unsafe_precondition_assert!`
 macro
Message-ID: <aJuDBtpYijOBQUJa@fedora>
References: <20250808192005.209188-1-ritvikfoss@gmail.com>
 <202508122341.rb7U1Q2P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202508122341.rb7U1Q2P-lkp@intel.com>

If someone's referring to it in the future, this was doctest issue.

It’s actually the second time I’ve hit it.
On my end, this error wasn't occurring when compiling the kernel.

What I was missing:
1. Enable `Kernel Hacking > Kernel Testing and Coverage > KUnit`
2. Enable Doctest in `Rust hacking > Doctests for the 'kernel' crate`

I can now reproduce capture the issue locally.
Won't happen again :)
