Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A296E220F5E
	for <llvm@lists.linux.dev>; Thu,  4 Sep 2025 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027729; cv=none; b=EK7oGpi6kQCJQ8qZiCSByGbnEYelXr+hsegEvpxJVn8Zt9M2rcdGe7Ul4upt23SunzWIPmZAhL1qeOEVM9/UFC0vEqeY6yqZWwc3RaZMQygrW7PlLCwh1YQBg71lM4UF3VxdqDncp9p3EwuQZPPwogkH3E0ReCyq/NfsoW02sGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027729; c=relaxed/simple;
	bh=ObU4Wx3QtgVq3rqd74BvUsTOrGB5gvFPA6dTxle016M=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GScQ1vq5IKg+xFxfxBsEFodYYHbFBAjynZwgrOQEv4r/9eTSrhGJ+ko4FLdWhMU6aBCOt5prGFVE7Mk7RPkkXX4n/WhXSp87IaInCtNcTFBRPMpTcNtrlp5eh1d2dluDvfdfLBPCpN56LZ49I2SRGWUqZsyBUC0ohLFY+aJEOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3L7iyzq; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3L7iyzq"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d603f13abso18070277b3.0
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 16:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027726; x=1757632526; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tpsuh96BYhE6mmizhC+t09E/UhsUORGOygG5WIux6Ag=;
        b=I3L7iyzqxI13LnU0PkXkm0q5MvUxY6kL5YTu5Hle0IByWrxv6b/uyjgDcWx1/6k50M
         gz1Vrsa2pDcQ7C7D9qV41+Wf9QochXizmqDA48YvPQttH+y6t8f5BLrOGOhBLsIe3a+b
         SiTpHZrBVEUs7+oppxpSuNR5QJ1aV/HGe8EuX13SVo8O/7DN+c09/68rz0tx86lKEZ1g
         9vk691py0YvA4wHqm0l5vso1x4cjG5oYsUPn76P/Dn8sWXe51w2MeQTigS3LT22WLHyD
         MraaHS7pK0fnGyYIYTxj0nhKKo4Kzv79L6Ydjltg9zVkjXruct+VZ3P+YL52IzVvx2Rl
         rlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027726; x=1757632526;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpsuh96BYhE6mmizhC+t09E/UhsUORGOygG5WIux6Ag=;
        b=iqwUDjfRCp9WoUOQDtP9/IcXZsoJkFuT+dggZZUnTGUGQ3NobJASArO0rWIIq8yNeg
         WJZPnLwFlmuSlbF3m31MwvEh7AmL/796KjXvRFj040YE8rD+pmXsXBbxBxBcnlEWSQ2V
         PWUrkhC8qiCsT8Nls9HMvKBjHAZ+VyxWhvbSTHCZdpKXj9IPLX8dfJRlmhsn7dVZh4c2
         Bcz57H80Y+oQsIEFMYm0NREuFRg3gSc9cHsvLizoAoqzLVR0FSEApgAYeVpK07DXzAT1
         W9VOV/0+mNLieSm9PbTusSZvxFozPcISkuxSWyIBOdTEiplcfl0hSp/rq0VyaUXZEKRQ
         S7MA==
X-Forwarded-Encrypted: i=1; AJvYcCU3NwOtklCuSSUpegxk7Wupuh7RRSwRYXJQb9UIFglnxn/OzdCPLJrZS5d9bE86JYrrSbW4@lists.linux.dev
X-Gm-Message-State: AOJu0YwwQ4cgGpQNDfO8FFDTzCkhNz+GpGzw9NPyl2yrcvkGkFUJAPqk
	H+RpHQxIRXYY7rYPTEAR4aKXaKwLuwUWNq6Fb4TkPrZZVTLMy8ej8dcx
X-Gm-Gg: ASbGncuESAogA/gr8OYiZfOCnEazbFaoAVfaVyStyXbI4wIvHda/pXEjrDxXnVFsVND
	I1kA53vi8zb20ukP0wh67HoOAYhNAvUqO6yLpevNuPEWKWIslkF4CemNPmggm7odjg/XzUA0KyC
	mR/21D0XuT3/8sGepHUAXHiDOf7KE5sVwFHGw9ZmwSVvMR9vHZgGkmh1S2lKJ/lLeo4F4hf5lyB
	Gb8okQE0thYaz8pF++Y1qC7XKzHtRkcoDazG76rhRKorST4haGTg0gPmPlZSMlFp3DVNTfHSVlY
	wLEhZhDeZjAyalXreJ1wVOxy+lChyaDkgvxwltm1pgEnX9MjOEgcXN1XsEKoNqTMJZkxhmWRjFo
	pOhTwSHAAPyrfAjCN7kClJQV7Qhm3iyDRC1sgtlzHVVQU/DSrGjkEUgr54HgjXmE=
X-Google-Smtp-Source: AGHT+IHnQqPIbJOAu33e4UiDHC0K7E2hrlF3HKVf3SiLs0oAF7WqPL0Qhjae/HNmcjm8lQ9kydnXvQ==
X-Received: by 2002:a05:690c:630e:b0:71f:e154:7aa2 with SMTP id 00721157ae682-722764d161fmr242712347b3.25.1757027725963;
        Thu, 04 Sep 2025 16:15:25 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a82d6abbsm24968377b3.15.2025.09.04.16.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:15:25 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <fb47fe55-7e9c-4d2b-91d2-1c6f29a77f79@gmail.com>
Date: Fri, 5 Sep 2025 07:15:15 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: get the version of libclang used by bindgen in
 a separate script
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, Tejun Heo <tj@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Jan Hendrik Farr <kernel@jfarr.cc>,
 Shakeel Butt <shakeel.butt@linux.dev>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 rust-for-linux <rust-for-linux@vger.kernel.org>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/25 7:24 AM, Miguel Ojeda wrote:
> Hmm... I am not sure it is a good idea to move that into another
> script. Do we really need to intertwine these two scripts? The rename
> isn't great either.
>
Because of adding a new Kconfig symbol for the Rust bindgen libclang 
version, then we have three places manually calling bindgen for 
rust_is_available_bindgen_libclang.h to get the version. I'd like to 
merge them into one script so that it's easy to maintain in the future. 
But if you prefer not to, I'd also be willing to revert it.

For this approach and naming, I referred to script/cc-version.sh 
rustc-version.sh and rustc-llvm-version.sh.
