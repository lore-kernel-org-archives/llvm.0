Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF17321FF38
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 02:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761100072; cv=none; b=Tu5Uv4oL33seyWNCIdzu3EAiRzefDhYsyOleeKm8otRACfHCdDOUnehOfyeGdYpaYPFRdjzA9xdGSg2qOPiQYRaz/lHX4/K5s362KOJT6yoOvum/fFP2nK4n+oq/r4k3qIjBezWXTsld+q8IRWrJxhr/wjSQd11QzkrxJs0cZWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761100072; c=relaxed/simple;
	bh=gtxXSsibCJLZR4eJo0X6XeizsPLCRJKnPsqSUiDcNsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UASISn+h7hEGY9Wy0pvbiIGvBW1jPnT/UB02iLuGhqzqBrNz771WOqk2h0D7NDfAZODMU0z5HRiwK62S9M/IG1uJ3FSp73qHQH4RsuvBJFbtipu/ZwJMAlYIdu6ZV+185f+meyZtVoBk0ShXodtCZacgq3nKVe82oCXe1xWXjas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sjQ5bLrx; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sjQ5bLrx"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f343231fcso4341559b3a.3
        for <llvm@lists.linux.dev>; Tue, 21 Oct 2025 19:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761100069; x=1761704869; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xqmP8PXFVjPtIGVNVJySqdODosEn/uc3qt8eNXsbPts=;
        b=sjQ5bLrxYR5MlY019RmUbPM846sIMXva1fGIN0YBJROHoItJ8F7X+c0VKrrfBo+XwO
         PtIXlyjnuP5sG7z9f74ZfNHEVjmsTQnRAJYS/i5M4bYQ7pu0B2PUightvDnulN3ntp78
         sZfmNh4pKukJGmJgLJuJB+9K131/g5GachA+Z6FmNjbqfyxglxmAa2p0o5RPApSn8XC8
         gscPI6CXZeK+M8KOT4nGkDPmX6wMWteNRc6aAeE8m34vDL4A5XmxrTNQCHr+Gzm3YCUz
         GkGbhGEsbFwH70w5HhAt5fa0dzYuq1lTIolUW6pmNb41V+ydgw4QrRypx/01/pDP5Lii
         G2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761100069; x=1761704869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqmP8PXFVjPtIGVNVJySqdODosEn/uc3qt8eNXsbPts=;
        b=hHPsPCgdXzfIinF4Lv/wq5k3uCxRR+QsaS00I7ZGwTyESFmhiNnbbwrGRN53O8SOHy
         rJVPI7+FZTlbwCRW1Ozscpewj3jqdNZRu2I7itSeGtoLnOkZ4ppD1oavLOjGo9A7qgrK
         vHnk/EtvqkN58YJYpgG7B7tXIV9hMO2qMwTAp/FFitqxUfRigN3atmfnC3t5DYbKqON1
         u5Uh+cG7wXWbDrCMRpfwhPwUhXBQccx4kOwQ6Q/dSzDDSUSscNpSl18QIDwSqAmZRmxs
         LMjeaQDSvVCwVxqgWm4aM3+K2MOtyyLI827eHzM6U9S0SVRrRTJL3KhdNSPNAviC4p8T
         jgXA==
X-Forwarded-Encrypted: i=1; AJvYcCVfPfUQr5MCvc0tl24WoMAymMuuUrCmfOeoA4ncANsMqtyNnaEMZS9aj7sda3Walmy0Guxt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1B7mjaaW5m8jxdNu7E1qiJFDNCpqmZnsk0bu8XjR86mCMseMe
	WMi9gpmLwtC3VpDaKVR0S8gRCiksnM1UxzKTPCax1gW5DqzUC76RdoO5Vn0fRK48Ww8=
X-Gm-Gg: ASbGnct5eREu1FODPzClkrJU3EcIcS7x3BhUmYV66d9ituu3Ff/LlF8HPm8UMgzcGVl
	yFfMB9zUbhzqZL6ka+KzbsVeEDuGze1H0/HkB/NAe9ivv/AZw36N4zyyvkyMC4WwJ6wBrkJgZeY
	PZrrmby6863HPDdMqegytyQPDjxLrDyIOywfy+L9gPyRlsJ5/wty7Qz89FiYif6FUZtQ/z+H/t5
	5ZXUs6eL6ge8dunvOPkBj0gVoWZboXvPotePOU0svnsmfzYdrfY3ClZlWkll4NzTE80MOTA8lKW
	0focNOejIzh8BISVveQ5YEw2lNdZkr9hcVjERopi46vMMLgj9D6JFTpSanAP1Z2BCQKjCrKOdVz
	KngqVHYebVZpgznGsnQHMBkm3XIaxDz6B+s6h4QPjRg6amXgykg5OZf1rW0zClA+KOARherUjKM
	ITcg==
X-Google-Smtp-Source: AGHT+IEkOxWVQSWldQc/gAwbJEjuX6oOPBwr0g1WUs0jQjHOfnCn6OF8lZVM21AQiTMGEA1gGzxfjQ==
X-Received: by 2002:a05:6a20:9144:b0:334:3a1d:536 with SMTP id adf61e73a8af0-334a8536f36mr26023352637.17.1761100069036;
        Tue, 21 Oct 2025 19:27:49 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2247a7cfsm940817a91.11.2025.10.21.19.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 19:27:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 07:57:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: tamird@gmail.com, Liam.Howlett@oracle.com, a.hindborg@kernel.org, 
	airlied@gmail.com, alex.gaynor@gmail.com, arve@android.com, axboe@kernel.dk, 
	bhelgaas@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	brauner@kernel.org, broonie@kernel.org, cmllamas@google.com, dakr@kernel.org, 
	dri-devel@lists.freedesktop.org, gary@garyguo.net, gregkh@linuxfoundation.org, jack@suse.cz, 
	joelagnelf@nvidia.com, justinstitt@google.com, kwilczynski@kernel.org, 
	leitao@debian.org, lgirdwood@gmail.com, linux-block@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, llvm@lists.linux.dev, 
	longman@redhat.com, lorenzo.stoakes@oracle.com, lossin@kernel.org, maco@android.com, 
	mcgrof@kernel.org, mingo@redhat.com, mmaurer@google.com, morbo@google.com, 
	mturquette@baylibre.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nm@ti.com, 
	ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org, russ.weight@linux.dev, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, simona@ffwll.ch, surenb@google.com, 
	tkjos@android.com, tmgross@umich.edu, urezki@gmail.com, vbabka@suse.cz, 
	vireshk@kernel.org, viro@zeniv.linux.org.uk, will@kernel.org
Subject: Re: [PATCH v18 14/16] rust: clk: use `CStr::as_char_ptr`
Message-ID: <rd2jyc57e5p6zjhypnxkfnjwsnihs5tsr7r55qnuwbho5jmkxh@53grgiitw725>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018180319.3615829-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018180319.3615829-1-aliceryhl@google.com>

On 18-10-25, 18:03, Alice Ryhl wrote:
> From: Tamir Duberstein <tamird@gmail.com>
> 
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=&[u8]>`.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/clk.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
