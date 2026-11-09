Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242593;
	b=PVZvclyCoDrWcCdiBrivY7uyyV/hiXYgd19wh+ycUmi1HlfEBiNgNU1EhcNg1cy609ok
	 axldYCOpw+lxRME+rT2C1JluGz9BgLjAxOfgwfjade17Ju2X0ectdESw9FptQwcCvDSot
	 JKmMaG45EoX0QRcdJnbTvfbuWxS1TTEMJP5x5U0Nbu/tvjyytfZK6NRvwnv/EDHfWcec8
	 G0xwGeugEkZWbbh6f+T2SAe3b630gfDH5DrzCegCA3vB5Ppyw/Pl6ZaUVhz8KYvk4g94D
	 XR20rfpJk4hiTtdeFgY871zgIp9K7IgpVIKzGMdx2tW2zcLYR6oSgSN71c66KtfYZgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
	b=1kakZXZh62miP3UnsiTnuLMUbwb16v5ElUKD5DuxsM8qoRJIy8yW15g0f7rOBBpD11T2
	 BYpmV44Og6/vvibqb3kOL5TBeWTZRawpyDnrNY4Fda6GKHsZkNcqUvoGib/sjD9BXYTDH
	 XOqeS/owrJKSpheFf2NN/w729noPjqQBG6ulHFYneiMLtzKPOUjeZjMe5Z+Npvbhr7LXk
	 AmB02XesxiEh3gFLNylY6Z1xmx1LZyQB3voiuVMmyQQIrmQ5uhhXIOu0FRcAYnArjc350
	 vvB2mNxH09Zi+yDWBex/UEdNan32s0EHKV8uIi5ukVySlSJ4sr1jM0p+XiHfrycrmhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="E2X/DSE2";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DBB606A333
	for <llvm@lists.linux.dev>; Mon,  9 Nov 2026 16:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4DBB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=E2X/DSE2
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so13493125e9.1
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794242591; x=1794847391; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
        b=E2X/DSE2Ej4Kj+dupPPw3s1did20edslk2RTTmA2log2RA4KsxPO5JtwxI42mzD8Uj
         icgvsynMc/EMyjPMRt8CKypgi8TN2PR0cDty3SUNvqKhnr0tlRx6MVfzX8EPsQkQ0+cI
         wojAHbPQ/91twkHrmo0ONjhyNEVkOFVZJeSOhlJurd5tj3jqt2Jchq70+FAaiAZyqCZD
         HjvtmA8QBwvHBwaXaFRZY89IRwHXgXa9Hwk+VUAb14QncgKLUe3bslwDotbNiLXKuvv9
         9O8sHr5wMGqNNBUGcmZHqF+3B36iaYxAE26ugVy8h3BtgETFpKn2ZZCXxPVqbpC8Ut4K
         HDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242591; x=1794847391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
        b=KNSGXBsvlLD6N9W9yVN2jKNIomSCq150rKMM17fB4Jd0dI95ga6KwdZiy0Lt/jIFsH
         2aI6P6b9TvBlROEtszOn4I1mzrZ4BnFKdj0D9Y+cvy/RtnQ9DSMj3JfTDjlNKLoO5VXH
         WhIzWUiWskpquYafeVpGzF6MLuM0A9aA8AqRCHAkMmZT/GJ7A2zXzikcy55m7cSAE/SF
         98GAunTVrvcHM/ubicMgbj9fIjmPjjZ/N2Qq0WWP5f+c6b9OioLj6qDRfyuF6nCW/8+D
         1s45IaOX74iRHqMFrnIDE7nYB6R1p4dHlo30C4TMb5gZOpbv/9tXYHaM7Zh0JESF9Wbc
         mpvQ==
X-Forwarded-Encrypted: i=1; AL+hErH8JKxdGHwsJKgJrpXzDb9cv78kkpkDGFntS/EKmY8xkG103NkHiErY51C7Vyk2t/ltxk0E@lists.linux.dev
X-Gm-Message-State: APuU4Z9WbUrF+PfY95ASP3RokpLaRml7kDI7IVmZr956f7YQyVZ/U9xI
	OgHzmtEPhhNtqI3US6u5FKOi5B6Xe+L4Jx5eVZcP1EVfKiLP6S5PqOYnl7EGctXFYLs=
X-Gm-Gg: AYBFou3LimwFt0qvOAt7HTHIpVfENBSYxyOpEm/IBfdh7tVd+J6yBvuJyJqIIHDBA1B
	lr5AiUD41PkH499x/fS2Yv0iTkCq4jIOOBb2Qjw0Hv5KO5fL3YNEmMB5oB6W+QNMyAdoT6kH6XK
	7+0XR5y2dKnI6FfJpRHTKKxiRdYP7XmczlgKmV6WqRmNh3vDsgxluGZHGMcRp9B/sz+QU7uv3sP
	M/hD6P4nG1KDSZPoPyGZr/yp2kYex/03pCuOO1rlAMnHazYhkm2SOtNuFJVfYXDLBU3gCNB02Pt
	p4+c7oHaCHsSulgkoDwwiO4bpZzfn2SMpNVBBraQ7fmC1GS3gg2ZaESzVURo0e2bssGa/K9PXCe
	8t+3ceMbOZvRUggAVVEldQppCTU52m5Wb1pwiURYiSfxMlGD1uHLrSmxMH5OC3nGOPJ9vgfIgma
	pH4O62Zo8wZqh+NsRr5ZsDRCrYa4HFilBf45le+eaaMhUum5f3ygSnu/EEjUEwuxGZPE0PulL5N
	K5ooV/g4N6T+FMNDWK0odA9RhcEvwSBW9rxSDtZVa4if+t9FWwe/cfSOE2ttudNow2Yo4tUnWFD
	R5TnfMVqCj1OapyqAJhQpi8Qbiq2peVpCxmxbe1gdtniu78EtcOdFLE3jkBak1z4
X-Received: by 2002:a05:600c:3508:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ba015b8c6amr1961265e9.0.1794242591012;
        Mon, 09 Nov 2026 08:43:11 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d8ae9fsm806785e9.3.2026.11.09.08.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:43:10 -0800 (PST)
Message-ID: <1dddcf29-36a9-4ffd-999f-54b730c9ea27@suse.com>
Date: Mon, 9 Nov 2026 17:43:09 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] modpost: cache section relocation mismatch state
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 7:20 PM, Lorenzo Stoakes (ARM) wrote:
> For every relocation modpost invokes check_section_mismatch() to determine
> whether there is any kind of mismatch between the source and destination,
> and if so which classification applies.
> 
> Each time it does this it invokes section_mismatch() which iterates
> through the sectioncheck[] array every time it's called.
> 
> When walked a relocation section the source is fixed and there aren't many
> targets, so the same names are looked up over and over again.
> 
> Therefore cache not only mismatch categorisation but also whether a
> mismatch even exists for a given section and look up the sections in the
> cache.
> 
> Special indices (undefined, absolute, common) take the uncached path as
> before.
> 
> This results in very significant speed ups for allmodconfig incremental
> builds.
> 
> modpost is on the serial tail of every build that links vmlinux.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        8.5s     8.3s    -0.14s (-2%)
>   x86 defconfig, touch mm/vma.c, clang      7.7s     7.6s    -0.13s (-2%)
>   x86 allmodconfig, touch mm/vma.c, gcc    33.9s    29.4s     -4.5s (-13%)
>   x86 allmodconfig, touch mm/vma.c, clang  31.9s    27.9s     -4.0s (-13%)
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Looks reasonable to me.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
