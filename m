Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E1443E5E
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 21:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991161; cv=none; b=bipxBtXB6t4M6r7jKqeqrj8sQydZ6cbF/M+nsQv2lfuPkMi/ldo7xKfeyTYIeoCykj8FF7s7+4cRLGCCWeyKysisO1Ds81wqurXeQru4DNeAVj91sby2xyoT1iKi31mNYhtoTBcpU2Tp7RMM4mXb2xHRaq0NPUtlhZLWeowoIrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991161; c=relaxed/simple;
	bh=E5EP89C8aSuUnaX74+VXVio9HwFAaQwDLtCultG/TA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODeJrrjLWvB9VUVN9VkTpZ3IpmDkyRrWzFPQRFGbFizCoTnEAT0Pj6Q+nGQBJlxofCRcdEOBz45tDzoUTKMfB1pRI+AcdwkLrX7n625WOwAucl2owJZ1Tcnt9fIkrIwvAWLZZsT6UL4wyVSA3sWkUMxM4cX5gcWZuMrQbTGRSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eDKKEKPA; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eDKKEKPA"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso6147099e0c.1
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 14:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991152; x=1789595952;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qHHcpy5QeLt7Tn0UZNn69+aN/4XUzCy9zf9R/ItNdpQ=;
        b=EVJxnczWBiC1rhpWDaiWgYsLXFfRjtb1ott4gSNVaSXeLGNAQub50N9fi+pMWbQMPP
         L8AdjPJM50jSfuEvD9t2hnCC+lprND1+/DFVwHrKT09mUQVpQYHpapJOOqNBj6ccZXZ5
         AuJSBm3gmq8cXSQ1YeplVgXutGTR3bDUlEs4QZNpnuFnX8gJS429Va6/WuYhubcpfsgF
         ckSwIIaK7AtWcvKBoctNf2dMHlOnva4S6rsLd+vppuA6Q4555NTO3oQIR10OtAN5f2vE
         nL65O5rsItjyANiYq4qYtLqE7AqfOAXukD905qZVmkenREhjlbAT+Nx9q1WHY6Rvy4O1
         UVRA==
X-Forwarded-Encrypted: i=1; AKwUvBwsjksUk30tPHFe/Nx2QLIEF+W8PYpp1NY1HXOSqcDxzrkw+HwV8L5pyWM52BZerk9XWdfJ@lists.linux.dev
X-Gm-Message-State: AFuF++nVpztQuhXFrL3SwP5kmPv+wGXG4yKuS8XwbXMM75F7RA2XeqrL
	PnDPxU2KMTiffMSKmrs43Vq1uI11w1wNao65wZVuQ/BiOY0sqHZQ55VMxf1GLGf5u1RJY6trUDq
	71ExKd+Kc49vta/CzKaRePxXW43mDP4vdQzvc2cvWaVTWyw6LvkchWRDT1enQ08clAQvLUvfMQ9
	fHocb6oe+FpJwGRG1HzUGy65sqNTZHzgg/S/AHodUWEKIeBFGvXlJboSLq/ElrOXE3G36fnl8jJ
	bxaRmTQqRzLPA==
X-Gm-Gg: AYBFou0nSUoA/Z38gIoREvhkxAdqXtZvr12/VAsetWohJgKgEwFT6s4zD37guJTkDwk
	VxaA5iJYPVn548Iw0Uq9DOy9ZJkfNmDSFGULRMYdluzdNlGN56L6IZKAxF/y5lhF3fca8M64NAf
	i6KYcr9gJhDR6g8raJ4erJ51MofZn2jnUgCn1RQlfwj9e+nsA8pPM3+sl9GfjSGonOVhBb0pmOr
	HNIatmOMyF/Pb0qd/f3C7u9osrMP2KQUBRsQ+OsWB0OperUNu2poODNjJ+Hx7LjoOxuGrDUsJUw
	9t8ZtiqP0yWVBubctieHR/B9RQ/Y/Pz2P0FCaY2bV3qCEgQBJucW9SWO1DEh2Gox68uznrDp1h2
	7P8SZGf1akUAdj0DhL/3RNcsaYjmbTvR37Tg0Oj3WTO07e+EoiYLi2iDb6lLQ8nf3QTjTKNaSm+
	VQBbtSG6iOyONerVHhmu0sw6QLGbIJblmQkuff2UdW9qo=
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id 71dfb90a1353d-5c7ed80403dmr21986622e0c.6.1788991152055;
        Wed, 09 Sep 2026 14:59:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ebf6adbdsm8539275e0c.0.2026.09.09.14.59.11
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2026 14:59:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53094ff7090so57212701cf.1
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 14:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788991151; x=1789595951; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHHcpy5QeLt7Tn0UZNn69+aN/4XUzCy9zf9R/ItNdpQ=;
        b=eDKKEKPAIPAuWTvJbOB7a0DKuc7xFxo5zZGaQ/5ntNbcVmkHPABzFXYLogbsjmhtXP
         D/jhMkgFdMymKVpu4ooKdVfSrJsSiKj6Y0rYmUdRQxYUsJzo44k34SrfqhHXIqNKHPpC
         VJU7+bwN6kcGN0yqfHz9Ij+qmsCXurpr0fWdM=
X-Forwarded-Encrypted: i=1; AKwUvBwMXNNAvsbVEeUDbNp0b4WnfChnukn3YgXWjD3q5y2dfYxxhkxD1U6qm2aEAFGlflKgix0v@lists.linux.dev
X-Received: by 2002:a05:622a:2592:b0:530:3554:6482 with SMTP id d75a77b69052e-530548511c0mr498367731cf.18.1788991151310;
        Wed, 09 Sep 2026 14:59:11 -0700 (PDT)
X-Received: by 2002:a05:622a:2592:b0:530:3554:6482 with SMTP id d75a77b69052e-530548511c0mr498367041cf.18.1788991150882;
        Wed, 09 Sep 2026 14:59:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054180b0asm150783051cf.19.2026.09.09.14.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 14:59:10 -0700 (PDT)
Message-ID: <a4167b18-f1ea-48bb-9287-210bdd4f35eb@broadcom.com>
Date: Wed, 9 Sep 2026 14:58:59 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/8/26 13:55, Lorenzo Stoakes (ARM) wrote:
> A typical kernel build consists of a frustratingly large amount of time
> spent stuck in single-threaded bottlenecks.
> 
> It turns out that there's a lot we can do about this and doing so
> significantly impacts kernel build times.
> 
> This series makes allmodconfig builds up to 36% faster, incremental builds
> up to ~70% faster, and noop builds up to ~90% faster.
> 
> Builds are faster across the board on every device I tested.
> 
> Machines used for perf testing:
> 
> * Threadripper -   x86, AMD Threadripper 9980X, 64 cores, 128 threads
> * EPYC         -   x86, 2 socket EPYC 9754, 256 cores, 512 threads
> * M2           - arm64, 2022 M2 macbook pro, 8 cores, 8 threads
>                          (4 perf, 4 efficiency)

My AMD EPYC 9454P server shows an improvement in the order of 13% using 
the arm64's defconfig and make -j97. Thanks for doing this!
-- 
Florian

