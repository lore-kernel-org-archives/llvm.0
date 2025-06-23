Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9E01DF75A
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750659735; cv=none; b=lagC8lw/c6yBZdNr4HBFMHZg+QBALCKIUJ7q08dqlk1iyml4089rctM9tIc5m2UIBksj2ta/WGTSQv/wqwth50uB4QanggWzx2phA+njfphgXWCdT3EO6FsGM9gGlvJpWiBIwrL2iEhgpxWUqnAD7L910qm09+BpriBbe6ZdVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750659735; c=relaxed/simple;
	bh=0GviJ4C43LDU6PSrh2071vRUi2rtBfBORn6lykbuEsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTlIsXbizOkBUcwb0+m7/wGsteRcmvoCRdgDeFCDYJyKSGlT3D+EIcEcnmkrrq+F26HRAnh32ZJX+LLO0yTcDt/tpR8nmQ8lnowImwjlBW5d9ThFtAUwTCskzH2yuodyiIfEN6nsdPQWUqvrpBmyjihyhhGm21IQEAixjcozm+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsAPM4PF; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsAPM4PF"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3137c20213cso3796493a91.3
        for <llvm@lists.linux.dev>; Sun, 22 Jun 2025 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750659733; x=1751264533; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjaVo7z5thcmzA/Idtk2W4NhEJVEWcJtCaNKpGwgS2c=;
        b=LsAPM4PFIS0H/MZfb2HvFCoFTN7Qe9dDQzBRsWmctb3QNweyqslF09x09iX56vGJKV
         r/pyEEs5E1g7T2/fP1ZHVsjf7N3mTRZecCA4nTA+Yxjk/8AzH+z9bLeZ8+BZPEJxn+pC
         G3aFspiTgf/M4g6pC1qWiW/461ptjjedFwPH+sYKzr8UPOTy5SO39Tc01g0aiMN1DpsK
         qxTZqIFyIN5b3KW4OEGJDDLFGuwNv40XMaWUKJb0hbLgKEuvK661lxzzBE1w3KsVzBDb
         RcTF2dGa57TiMSgE97O2QrNqFiTBLImhNPSEB/7B9w0MN3q3hh6JLnUJWTuCrL77fBnS
         WG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750659733; x=1751264533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjaVo7z5thcmzA/Idtk2W4NhEJVEWcJtCaNKpGwgS2c=;
        b=a9m9q+KvmLpX0T6EFPtDiHF0YaJCCTQtxn3XX2vETH9o06cqPRN1dHhkTVWbTe9b6c
         o+hV6J8dMRE4Miu5h7k37LzHhmme5XGfuNxpqn2hUmh+OSeosuyS66SbMbjg58aGhjqY
         Ly/mq0UduMhP2rgDIwR6W7/N0dU5yar2iNzwvbuBBTdLfUQSvZOMlLDbEs9VwgU3/Jg6
         szC/EWgAbkoyF+zMdpIOAwNE1xg6V8PVGd8Ge9wzKuD2AXOHyCKZfgWcVPP8xvXsOE6l
         08wyvffMQx1iAfGMbkfjheRC0kYM6n6qEaJrv89X4fyK6d0JcKuDS3CQoFPDYiBITOlt
         17KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF0V3SB8HKGsMJSkTRg/YCa+0UMpOZuCCpoAhyXN6+MnukgPqv3mpyVNAmDyUZnxMXqeDk@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfxza1b6PsaRWLrow6iJCeLhAXnUiqE3XklsRA4TlnGwTtuZ7Z
	LNfj/LhcI+RzapXwCarhIk+FqbjVCbMSbQMs4ybBz+k/BkJVuTc+SGhIjAHaB5h2jrs=
X-Gm-Gg: ASbGncviGqW9mzrGe3ngbRML+pa0R4tfRl6m4c7S6FV6/VRpRL81ztEmhBPV5XH14dU
	VoKMZoNcIv2epTQGkRQZupQt9U5i6usAIi9IHbPpp19Bk25FGs94DJeMu9OTuGKmcLxXLbaMlsS
	RY7qjsp35ef4RDdVTpHP9G+3OAVXZQ67XbWvIZI5OoKB5MH4+e/ekky7Dmaw5BdiXy9lPhjXJnn
	RUy9a2SaZByctX+YwNxW79DRrRqBHgatE7XtB+D2F9WkVwmT3HKyh0xYrFUu86JWJPiJHuBFpW4
	IeQmVOmnOKa2OURa182wSjOqJStFut0spskGTswEIIw5XWj4ZJrxttyOZZAPE9s=
X-Google-Smtp-Source: AGHT+IHTC8DDc643Bby1AguMJbpjpU8RoaZSO7asfpNMZjv5HFpnG7zervZfVFZEkHAcEV/Plpb2eg==
X-Received: by 2002:a17:90b:1fcc:b0:311:b0ec:135b with SMTP id 98e67ed59e1d1-3159d8d6282mr19886141a91.24.1750659733212;
        Sun, 22 Jun 2025 23:22:13 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a3c9sm75875175ad.95.2025.06.22.23.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:22:12 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:52:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-pci@vger.kernel.org,
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 4/5] rust: replace `kernel::c_str!` with C-Strings
Message-ID: <20250623062210.she33z5hfouu5jgj@vireshk-i7>
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
 <20250619-cstr-core-v12-4-80c9c7b45900@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-cstr-core-v12-4-80c9c7b45900@gmail.com>

On 19-06-25, 11:06, Tamir Duberstein wrote:
>  drivers/cpufreq/rcpufreq_dt.rs        |  5 ++---
>  rust/kernel/clk.rs                    |  6 ++----
>  rust/kernel/cpufreq.rs                |  3 +--

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
