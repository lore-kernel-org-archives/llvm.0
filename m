Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FEA485939
	for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044778; cv=none; b=gVIG7AnplbF0l6IPTKQoZWXdPWXH5xUhMrDIGqPYJHJ0lJtkofQ/+4jE/qJb5Wg27a7j1cmw0kX9tL4/zVjL8XFW4mU2g1PeC9pKlt/mGTw0x3NkRx8mtyXdvKdP/mmw0YBnkzWNbSXFj3nQRlVi8YuWLtpoeo7N3CoS/519bys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044778; c=relaxed/simple;
	bh=aV14/F8DsF3P9FHVwJuzeIJuUW3zK2f3SCDMKZGJuA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNH8rG0h9uBL2AqH8xJiG4C5BGSnzIFA8Dr18FwbT9WL2tOSBWQoSHVHY+wNjJKJTZy0b1UgVpXBnWWHO39UhBJJ8iuUaBbup65jV6WiZDfXOY24BqrOZQdyzOvA2D2h3A9uaHeOapIC7U86sAJwY3HbjwPSvRSGhKOluUTbv3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AJPsJev0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AJPsJev0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso5065891f8f.1
        for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789044773; x=1789649573; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ei/562soKHFJqkSdXuQm6X1dYNc/yFpT8LphVTPsPBs=;
        b=AJPsJev056zjeJYfIbT5ea76BkAK4nvd5m7kOy6mHrj62lE7LpF0NnoUMqg1URaf9O
         JW0O1gMAFWDv4blXZiORBdjkotD6vnNqLIXj64DNRqPzhfL+t7cy7fFexsGl3dNAKCn4
         mlF93szx6YR/aRWQ+KCXWygQmL1g+ws9Uh9H6nTmbhcRWxwyVBVyObuwyNiTM62aw+8q
         a6qN0nYgI7Rtt/TPe6zy2BP0SbUnY9MCidDIlfjgc5wPHmNVO5l2TaXx08CVTU8fIBrw
         XIxaLt78Q/ZMXIAgu7pbp4UipjxhHl3flQTiNu0/QUUOlAl3WJDSRbDZ4HLw+dPSyAQV
         LuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044773; x=1789649573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ei/562soKHFJqkSdXuQm6X1dYNc/yFpT8LphVTPsPBs=;
        b=AX92IJT05SrczasyHpWWvtPPMcVO/VKuiUgY1RsHwl6ael9EXmEpkOULmekV8p9Clh
         jPq1rDZAYtOIvhvoSUD996E3hvWpFxZg0a5CVCOwphp8nCGNrIfmFXwO8D1RPsKvgU5j
         V8KdLji0lQMfH6F0X7m66nI2XGKQQIhO33HL/WZ5qy8mCbqg30oQzU+rbbNzXzBD7x9q
         kK/M4M0W0IrI30tVfwpBJ2XHPXBgPiWemrKu/i901Ci41SrgxJ/vHWpyi0PmiA/qaf9R
         2xCeYJ5Gx4XhtLYC5O9GUMeQ1oLxclZt7Gck0Qpr6Jx2anWjyrOCWOfKybn6Lwm0z5O2
         dyzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJwSMpbksWqsPz4GoSUBzMUwp3MAettvBz8sCwuOtdGsqRBymzOPkoXNXourdqC3FDGsBy@lists.linux.dev
X-Gm-Message-State: AFuF++lJcmwBe+meGc4NNJ7+iuKOQu70RK4kkj5eCcHjoyTcmhc5pFFs
	Wooj3X7q54Z5rd1v5HqYk4DUWHlT3WoTrbk0upjM6MWwdJdusvfD7PQ5DrCUf32rwIU=
X-Gm-Gg: AYBFou34Mu+3adAfUQOVzuBuOn9HczjNZz1YegYqNU/oIUEieAdG6ZAQZE6Q/6Ugif4
	VoHInEKJD7EvtU+Ns9KzlVuAIq3a4xGdgM/I2+WxePUNAdwv9h/NtXq+rcT0w3AA1vcznrBVYxc
	Bb86Pn5Qzk9ylTdpcESAP4RtkCAFvs0g295KRXDKMgv+po1H6+hSd7kzWFFpN94Yh1cf/AxNezn
	mBOUpzBoXuZaUFvwcfZs/zmDtuOf66ArxDMX+tVtCCoBg9mbI7s2XLLM0dyUhRuWohCF3jvwjHC
	Qx9i5St5g901lUbzCVvUwbWwGrvDGheWcV1k2cbThUnI5pymrcWL0DVQ4RPVuCx18EEEEz5UBZm
	spa8ANXJ/SHciOHkymODqeTiiCN5AGdTJIcyBq0zGuTQjcP9TIyPWCEO5FPqg/8xDaOSJEu/P15
	cMpxgPU4yjAx9Gq41+P61k+bO+0mQxUJVKMH5CqwHT2MjQ2Q0rUlIh/7A2WLrITX9B+R9gnWt7M
	5vLLLh9ysJ/sqcjp6tZG+XJooQSjK1ID1w=
X-Received: by 2002:a05:600c:620d:b0:49c:fc6e:a3d6 with SMTP id 5b1f17b1804b1-49cfc6ea731mr404244015e9.21.1789044772934;
        Thu, 10 Sep 2026 05:52:52 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm286173185e9.4.2026.09.10.05.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 05:52:52 -0700 (PDT)
Message-ID: <434a7a10-d83e-4402-be91-816bbbc15bb7@suse.com>
Date: Thu, 10 Sep 2026 14:52:50 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/23] modpost: hash module source per-file, not per-byte
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-13-5dc1ac01672d@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260908-build-speedup-v1-13-5dc1ac01672d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 10:55 PM, Lorenzo Stoakes (ARM) wrote:
> modpost spends a long time md4 hashing module source at a per-byte
> granularity.
> 
> Fix this by doing this hashing per-file instead by accumulating a per-file
> buffer in parse_file().
> 
> All 11,189 .mod.c files and Module.symvers were confirmed to be identical
> with this change applied.
> 
> This is especially impactful for allmodconfig incremental builds (where
> CONFIG_MODULE_SRCVERSION_ALL is set).
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, touch mm/vma.c, gcc    40.6s    38.2s     -2.4s (-6%)
>   x86 allmodconfig, touch mm/vma.c, clang  36.2s    35.0s     -1.2s (-3%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  scripts/mod/sumversion.c | 56 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 44 insertions(+), 12 deletions(-)

Support for the module srcversion is being removed in "module: remove
MODULE_VERSION() and srcversion" [1] and scripts/mod/sumversion.c should
be gone completely.

[1] https://lore.kernel.org/linux-modules/20260731-module_ver_remove-v2-0-c9163858f382@linuxfoundation.org/

-- 
Thanks,
Petr
