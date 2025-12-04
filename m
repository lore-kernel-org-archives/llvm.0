Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0765933032D
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836803; cv=none; b=NsLWUKu2o5/7UfKQ7jKJG/w3/aByP9o1hv1r0NQ3wq7Wuooickl6p3iz1+3+Cn2kGoGtYxwbiHDwie7unmCpGgscRu6kC380brAcokS50e7RXmDlzpORT1C14iekIIWRrygmDlIJcx0+EWXQGWGeD6jByKx+Cw3ZAD+gqq78/ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836803; c=relaxed/simple;
	bh=5nYFVp69QLdOo49fMh37kOqCk58/nQX82HtuIDyE89o=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LE6o7DxBg1pIevgCf9I3EnEjf4ZfgGFpl6069fknSR1G/s/fH7O4Np7ifKkNRcGclAacJrkJqY4g/R94DcpOcVAHDLuqqEnD3MB4vzfTXaCoYQs8LrTHjBy17Q+soPrm+vEUCXwqpRG2FcQTK5LtPv3BmnZpOwjIQuUfkoXEJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETbgg32d; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETbgg32d"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78aa642f306so6226847b3.2
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 00:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764836798; x=1765441598; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VEV9l3fSrsq44TPrk2Pd9zy/qdoP+RNvY5XPGpJtMhE=;
        b=ETbgg32daDg46gzhqA8WP5EW+oZCURKQ6/BgYMdkOTiGBhg1CO6dudTv6kK/CdnCKk
         6U440vjKE/cxq0FiTOmIAJFa1U3uxryaSIu7lyfFnUnPiWlyA1z+WqHyDz2afWdjalTV
         6D2ZAKYEBM5OLLzQV1Y09yaHvGqd4gMi2V4NSA7S89z8+ClDdwm0taWWT+06FvUcRwCf
         3fyvnd7B5LEyBnJ1SV4PBTgKsgZcHJxvm450Zgrlks/jhLgJrpdeWma7xFVoW0jnkVz9
         jTRnixIOt8VooP1houqSkOg3asD8BKk69x9nHxXf3LdGOuICcYemAe11ZVDeU4UvMYUY
         3Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764836798; x=1765441598;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEV9l3fSrsq44TPrk2Pd9zy/qdoP+RNvY5XPGpJtMhE=;
        b=uWMzVt3LmGFiIZS0OHct6SMThNrYUGvAnBWkdWgiO/RX4crdCJQvI9GgfAn3OS4M74
         zutO/Krr0Zf1+g8jlGKJREpq2GwkbWWu9g7GkEA++CeiSwnQKv7fQl2ZM/x2oPXl9e84
         1tPjx6cirkMp4RxGGGzzwEf7FmAzOsB5YIn/hggKAbJEOK8OthGg2WZtqx8jhaJRWhQ1
         iyUwvQigJ817IiDFufDMaOmJL2rXtU+iUIKn/hYIILvVFVCATl0hOux3foR6Qt/vu87i
         iJyqsSV+N2SzEGN/0hYfYSdKqqbKV73EURBeR1rkUVun5v1v9Z4YK0LBTaGCEo/FgXPy
         3ALA==
X-Forwarded-Encrypted: i=1; AJvYcCXB1VUcQ7bKdv05WjcOjKmazVHhwIHax1cpUk8LPzSJWgtyYes/d/meeeawck+fBJDJxjDR@lists.linux.dev
X-Gm-Message-State: AOJu0YxH1TM2CzIFe+AnZkvuWJXIgofoc9wMHs5Iqd9SVll4Q+stJ+gZ
	24EFpYVq6G6Qxt5SAImmwS22tyr0Wx8U7YgQkFnLbQrtRAEtuEgK2r/6
X-Gm-Gg: ASbGncvh9Na69ScHOfHfOLt1honXViz9UwyTYOHL6YqUwn1OcIQiFh++r70XAg1+hVW
	S6UfX6+Ly1ais1SMSVtt8X9Na7ZqQGSAq4OoHJxhZOO9pELODJWnDg1wpsZJ1pBu0W75QDYISeQ
	GkRHNJNC38pZCxgnzon+/IGeBrx8rxkt3H2DDEuEzjRBNDAFjIHht4qG88NzfwK+lCNYSger9ka
	iHlmEEBHayIZZdm93iyc1NS24syYX49kT8Ote8RBiShk7dLPIqDbOCD1TArzfEQiHoYocgKQC8T
	qiHAzF6XHSPa1ZA2j6jKQni27Vk1e4o2XAX26b73+ou15kNLS2fGn9y0zGIjOW06DF5V6KtivGm
	vQG8f4jgw4/oKxciTcb87IVC1CjIRRL7NoGR4Ia9UYE3PfjaPTeUohj1Z78kaj3NkBE9EH9aQBm
	lvOIGXTEtD52aU2ar+efx5G83cD2ylCyJcMRucRcxm
X-Google-Smtp-Source: AGHT+IEToPXaJNU3FPitOhzv7XRD5fMJv3RarJ69HwAUtDs8DEKyQvLYwMwVPCfHblHOk8hTaaSfgg==
X-Received: by 2002:a05:690c:6f06:b0:788:e1b:5ec5 with SMTP id 00721157ae682-78c18956f0emr15033157b3.70.1764836798216;
        Thu, 04 Dec 2025 00:26:38 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ae534sm3349687b3.3.2025.12.04.00.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 00:26:37 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <74cf3591-fe3d-4005-a5af-269e4c806d9f@gmail.com>
Date: Thu, 4 Dec 2025 16:26:28 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] EDITME: RISC-V: re-enable gcc + rust builds
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
Content-Language: en-US
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore the "EDITME" in the title, I forgot to remove it from `b4 
--edit-cover`.
