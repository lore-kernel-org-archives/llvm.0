Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CC91D7E5C
	for <llvm@lists.linux.dev>; Sat,  6 Dec 2025 23:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765064504; cv=none; b=HotCjC2tiwbohHIexWqC7iCe4R2iWlGJTjGdEvsQj/aDYQ7xjdI9E+Fx6FRRlMv/NGJu3JCayY83n78cNcUmA/ydCV7gB5CSnbvrLXwELxdh0eoxkJAer70ayBW4xv6lfNLKLttZEzE9RERvBQV6ThbZMjt69cm6hpcTqiWt2W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765064504; c=relaxed/simple;
	bh=2Q/7XbQJvjrLnrR/4wKTgacaB87PLU8rSVQMMxnKDKE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mg+Z1jFUN/pEhbchRNvYVjOzHocCkeXsTeyYuK7PRo2ylOmsuY/D+acxQ78oxqel6Vy1fKM19XO0ytO2xpd9cWZ8ZX8GP0X4rsR6m6q0n4sOBsYVQ+Qv256BPZF4cW6ziC5+b4V3uxb49A3fSE7P54hEHD9grpiRUM8OVdDQnx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMEkwoRp; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMEkwoRp"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-641e9422473so2816571d50.2
        for <llvm@lists.linux.dev>; Sat, 06 Dec 2025 15:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765064499; x=1765669299; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=PMEkwoRp2EZLSzgBQuzNbykFZNaIA7BsLuLBK0AG/uqstqrOIebH0/5wWI5HC39pZL
         o6tc59uktcYk8f2vLIsYPnqsnD1X7R+HTVsT2kyiYTJnAe1u+KhOYkEgZT2HUfhOo+Qg
         n4cBVUOAQoj71ppAC+tZ4gbcynMApnSf6QAWeah9828q+1v7vj+M0UfXV1ZYhFQM5U+d
         3jcZo2jg4IceiEi87KS1JH/bXvexr0ZpdbYYpPRvIdewoBaSKAR132/ib5YnQPs+/TMs
         4wDwzY8g9sBzbaU6foz9ferH4vukmp2byaEge0CcYRujvDoJBRdACDa12FVTTrfFvh2Z
         JlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765064499; x=1765669299;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=PdM3zllt3SQLye0bMcTnnDoUswPDEzI7RGRxZjZXEz10yzO/3tytyn8IGCcGAaZczs
         YfvE6oj3SmpM71oVAhuWdBe1dHKfDNOZ9THoNHyWOa6AxT6gFfhM1ESI2MGoFjbFvxzH
         EUHhfeigjRYjSFkoNwGrNZrpizOmZfpYlKhh3L/RuPdlyE/g39fqrcZvVA3RfyfyW//v
         NA7OxC8qC/iZ804rwLleo0Ipcq3RyG0jE5VHBOH5cU0D93cliX4YCo57+tP8zUi5FimX
         j06J+etrgA0rE2OtSO+JEdADYOUr4n80TWB4w+BxrcNLnkNmGj7SGY69Ak62XyXHmWy0
         tQMA==
X-Forwarded-Encrypted: i=1; AJvYcCUqWdBWxxdeYlOnPBfMZDGIHO1NqMNKeFm+huUrNVf8uF6HOHnNU7L4AOqcWX0OI1cs1pqZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyoPXesRigk6SJdlP+cyA3hT6PrNCkIb7bJ44yFdQdSs/LrM7iG
	kAn1+Y5evHNyi5aX1TcN7GmH7YDeqJJyuue++PLW9XwucBdbVts5PNfE
X-Gm-Gg: ASbGnctlfQYoTFzxCcGcszPB5a0yrXJ6v5YIEnjDAR50vMOf3/ayuLBwwOZq7py/N4m
	/UBT9FzYoxx4hdJVLOAkEDc6RUucGMFBesXlCw7iW7+QDJQ8KH1pa8UphZOFmPTRaMD3Xys5SyD
	JdeU7oBPJ6aaH5h8cbZmeId2d/BSR5dNfc1Gi/xbQOhEaBdPCCybdhAjVH8qRupyrJ8+6Ilag+O
	o0Xxmq3qPFXjdCLG5F3CsPvSBt2kX15+G9OIRWXo3Ixq6OqYejRfZbBJ0ZlE8CszRhypiIz1J8z
	hU2AQ3/w9o9SAIs573Y3vL01EQhPdu8WMY0W832kaDgJzuQKaBw/xt4Vkpjkp4czDDa7EvYnbPH
	e66oe3UDVKID68jJlPPX/ZIfGJBS0MTPvcV1VVnVNT1R1hETOrlREaFDH3K4wpzNm/ANkKClbMr
	OTg9eQ9QzU1KEZabN9e91Ci8sJXs5ffnWfgEJLjXZ5n20/
X-Google-Smtp-Source: AGHT+IF0mKyXnKTQB1xhzD6LpgpTfgywW7IIal9fCo1GqYHTHD2NnE85yzsXQBQPCshexFlzlGdhdg==
X-Received: by 2002:a05:690c:7404:b0:788:e74:b267 with SMTP id 00721157ae682-78c33cb321bmr61970637b3.65.1765064498716;
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b7a72dcsm31972167b3.52.2025.12.06.15.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <9ef24254-2761-4a0f-9c4f-342293383800@gmail.com>
Date: Sun, 7 Dec 2025 07:41:30 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
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
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
 <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
 <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The -x argument should explicitly tell (lib)clang what language the file
> is without needing an extension. I don't know why it's not working for
> you...

Didn't realize that I should pass a `-x` to the backend. It works now, 
I'll include it in the next revision. Thanks.
