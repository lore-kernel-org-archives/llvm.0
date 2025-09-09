Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198033EAF1
	for <llvm@lists.linux.dev>; Tue,  9 Sep 2025 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438805; cv=none; b=UC3tsqaUhMpSm57C86ltf1hIh2+eWO9cQSUZgmKQKoxTEdkMMkQXBZKXVLE7rjz2Xw6pH2YsXzYEQ0byQ4bQiAR0JCpy5bxWGkBBYunJzDDPxOqw1mZ95SADpIUbBb1LUCKfZ9hcJ6wqu6uK4EasX/rdYwO2ZdHTlGSXZWbP4wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438805; c=relaxed/simple;
	bh=N+pGwPw9MZww6G+9DA4s3ooxnN9i57hMzT73xzakERs=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fVuqGZ2xAuOKBdC2S/K3Tz3PGyhhs6fnu9osCUH20v8X9wi5lpXltLxhoOPXErMnm2iJE295yozx7we/4zDHiJMHKiEm7aUI6C0Uzmmi5HwpAVs8KDpqL2I3SbmPKDA5DQUF3CCgM8EePdMTg2tYV7NrhUcGpFbTn6dG4sHcnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdXe3xnn; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdXe3xnn"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e96fc00ad79so4932873276.0
        for <llvm@lists.linux.dev>; Tue, 09 Sep 2025 10:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438803; x=1758043603; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0oIkfurNYJ8ubibO+ta3BmDEx7AccbTt3F6wYbDoMRI=;
        b=EdXe3xnnxITlztUXYzDC5jlRd+ZEy6t8mE334xqE6BD/ig5KcYADh4tJiBrMxt9Whr
         7+Zg5Wo2nG3PEeSSlewtsPD9p57lDfZEMIeB0xAEWSLFVpVpqf/TIHMV8M/8bxV81EeO
         JLd2181MIYGBUMwabWeiXhhbuOw8y10YkQ+iE2rcqkn8aweEPcVGm7qOLy687IhfxbQd
         pFCiOSU9wSFKTJEePDB/ZHLwDwSBb3jlzI4YqpmD341UAuLMnAB/nvQFEWYlvv6tlAqs
         ZNWKYKNJLKmOq6bUVPmrrs2yv3V8MM6KhE8rbD/yRP8IxZjHCoi3NGJNn7SY6CKFelpf
         SVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438803; x=1758043603;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0oIkfurNYJ8ubibO+ta3BmDEx7AccbTt3F6wYbDoMRI=;
        b=Zn+bXJWCh19342QMpcGSdBxRXsUruVzv++ftE6j29Nx8XqgW38NpJOkcXJ0Vpp06cd
         bX+24fy6priydfv68GpeiSkTtn1pMyPWkTm+JBE8anPz3M77+J+Yof2OMu49Sw3uyk8A
         XpyWUqtj4k5O+F0Y3s4q0N/cBGgD3UMYbMOklmfQNfcBUOoTvjAROMbgxW1yJ/4gvLpV
         IXSx6mhI7nmGg/Z13Iq4vthtNykP7LhniTEkftAZ9MONyFI4ez2r8qEQYeXPY1UvuJ8m
         vTekBmCJ9md+akWuwaVVkay9K2vU3E3d2NFCnGOrlTLKVwaVNdoyn0Kjk7yYNtJQpazn
         UQsg==
X-Forwarded-Encrypted: i=1; AJvYcCXqSKqmbrIUtq54bRuW+hkJWB1ixUG0UxInwL+DAjuYcaTM1Js1lAoAhg7v4uLZWE/yzmkQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw31SjHa8H/MD069JWCYSJ+99XKihakEJZgRO/7+6urasAPxs/Z
	cv+zKwfdYyjkQNHicT8q2zcP8MAWlgjUKMQPYIP1g8Rxd/jfcIVh6J6R
X-Gm-Gg: ASbGncvLq2JqzPR7lo0xX3SdumC5HTeKc0MlH40YtBXLoACzJnVRCDfp5+TZjUaxzkx
	s1xfLMx6A3YX7016OF8uAkA6rHbZffd6i1TXl9BZ7BUM5cjgFwbzEnvyT8esGIAE4fbSfkHBixl
	sZUgW75Kt3YJ2dQH7TF7Rhjs/+kDk4PGadG3j5xnU+6D+5eN+/+On1RqF/vpj1W4t88H/rvtsOs
	iGmoWF1ks1nrCBCQLrvCIq63GV955HnsW3HmJnPj0Fo2UdfeNsw2tM4Iv4CRh3aVKFQBWy/Gq6B
	wwCXKeo+2WEU6PsvGjuO16EYt5p2ABfe89JGHNvL7dt4xy6RE/9CRFthQTp/YRl5U5O7d1tEwBc
	7X82wF1ZBez3ZWBpmr42rYI/cIopzG6IwzXYRoUBT26U3CjzHrDc6
X-Google-Smtp-Source: AGHT+IGWvHZDYiA4RGkwYsweLqhI/RtpyRtGhg9Auj53oYUggWnrYnKSkAk9+pz7VYUcyUr/yHalzg==
X-Received: by 2002:a05:6902:2b8c:b0:e97:1bc:b273 with SMTP id 3f1490d57ef6-e9f662ee3b5mr12680572276.21.1757438802651;
        Tue, 09 Sep 2025 10:26:42 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e9bbdf1fcbasm6726070276.6.2025.09.09.10.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 10:26:42 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <a78dca6d-5504-4f46-910b-820cb9ca750c@gmail.com>
Date: Wed, 10 Sep 2025 01:26:33 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/25 1:12 AM, Miguel Ojeda wrote:
> To clarify, since this probably targets the next cycle, there is time
> to discuss and get feedback to do whatever we feel it is best
> (personally, I can take a look after Kangrejos at some point). Is
> there a particular rush for this?

Nah, no rush, as long as it works so that RISC-V distros can deliver 
Rust-based components, that's the main issue I'm trying to address.
