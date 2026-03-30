Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6839FCC8
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904958; cv=none; b=QTHFamQ922XZnaZU7UHztBrPIEeUqdQe1WVKcO5lAxek8gL+rXXjjuzxRzFyjH8os3/ACtqXbN2zcyNVMYtn9BygTCgBfXdQyv6v+v+yhJijDsU0vUqCVfIQTXmmZe1ZXCIOofmGl2WCuooY6wp7z8fYUQHVB4zKz1S6BWdBDCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904958; c=relaxed/simple;
	bh=IMhQOsjCudR6+sxrPIeCmFwxdNjsHtb9hubGsjZ+tdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGmKRXoeBMVwBLY9qOzwCMtAkokYGmmk7nKBm9j+bI1bBsR1Rnucg9EJTQZM+iuS8XEJ7Hc10Lr4ornQE/uX1Zm7EWWISBDHEQw9xU95Yo5PvTtYfsGsWC9ItFkJ0C0Ro3HBgGqdCRJMDEsN8P6twjVopbPP1kyt0t8g76EpDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHRVsZ1+; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHRVsZ1+"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so2019768e0c.1
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774904956; x=1775509756; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlsVcWSeeIpbPnsSYMwOt0k3yfDPRs+s8ihr0jHypXY=;
        b=oHRVsZ1+BxkgYzbJuEfuqFImsS1jVujyAZ41l0AzrI/ogLVQducrpL5BVshi42bESm
         0nbVtC5NhW+/2yX4whCE+KLLavraAZlEgmM0EtwESffCCM1564XFCw2i28Qs895GbNfO
         0iFlRMt0Xdj+5D+0mCDQ9KhXsxEUiW4yuyfF7DjFPzts9Q7vxD7i3uXIE6TVLhE1f6JQ
         hsfYjPkNR5NFv2bMBK2zDLVjqw3tPHJpmNlw8G/pWwC4vmtJlgPBcZ0hsiFhL2p6wR5k
         CfudNAHHVxgPooyfjLOcUevuU3UU+we4dW75EHtmC22MPcNvc4SCddwktV09JGYQPgki
         2Zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904956; x=1775509756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlsVcWSeeIpbPnsSYMwOt0k3yfDPRs+s8ihr0jHypXY=;
        b=YTgG3Bp6TjIzC3yxkbv1Ji235TLYTQ3my6HJ/ZuWHWXEMjpmBnMlHutx9zH5C5krc+
         f3HZrLe8qE3eFlxRHGXjxjbHjlrbN9ZdTinyXQuTaceDwnsuDu0gNRMbBG6mJL1rAceA
         Oo2ntxZKxoBJS2JsUFzMMDnnuqUh4ProN1m53E87VsJVUPYKNquDrxZM4sTcSBbo9e6L
         AaMHZK6/5glqqoT++9/bjPqI54QrHuq/99lWBGPWypJpydB9/t8H6DdJytzAAYiPqlsm
         ZiRxs9HeeizhaY94Lpp658eej3mEzLI63eeUPj/FajAUsz1kAoJXJiO1tsJ03/S7l56+
         cw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9Hsl1Wv6mkPSf+X1NF+QBpHOhmugbGRMuNJjK7fZNXj9nPurlJVWx5CVjjrdgVYdyOHzQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyLToSm3aa/YmEHTp3d+fDzn1onOV1bUYwJZlPq+Q9Ce0sek4/B
	XDrDK2Uifg1ozPddNnAHDBWnntQ84emR0DxODba3uYw+eqqHLP6/D3Nd
X-Gm-Gg: ATEYQzx1rlJnR40Y3d/tNjyPJjCjT6IRZ7yBBPyrQqdFADvW7O8QLT9MfrEQbzQVuol
	i/Ga8WGr1CGnf2K9MMeoCq3m8DSfcgn2x2Z9sBXDRQhGqX0Z9wwtcN4zjNAcXYL/9BtFJw5Bss5
	zvGn0KX/PchOlOtqEP/AOo4ZSqyL8N132o2eY1DEagfRT4ZrvQ8wvgLoDz7AF5JggiZfPktTw/+
	bEE1DfS6SwEPDnFaLMgA6uFuyvn6Ivt6tJEqEaU35p+S8u5Lx8Sxug6IBfSaLg0tL/LtONwoJ3D
	+gXSndeLbGggRqZWV/UgMU+wILc9/xDYIhxREpBHSq2eKEFWTvMCsmyipo4phpDu0weRLc3o2lm
	kNkRhCPwAmuwjMrfmd6C3Op2waehWf/BWimyTGMF6QcDNe0jDDm9jz46P/5wTNQpxOFYHW9OGlC
	R7WCl3XPHlQ6CSOjgXvtEVoVJiXLbdgEblJ3mO
X-Received: by 2002:a05:6122:3c44:b0:56b:9ba4:1372 with SMTP id 71dfb90a1353d-56d4a5f8c0emr5672211e0c.9.1774904956234;
        Mon, 30 Mar 2026 14:09:16 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:d2a7::cebd? ([2001:871:22a:d2a7::cebd])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a333c9sm9989448e0c.13.2026.03.30.14.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 14:09:15 -0700 (PDT)
Message-ID: <f159850d-5fe6-4329-9703-b355305fd106@gmail.com>
Date: Mon, 30 Mar 2026 23:09:06 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe
 <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 a.hindborg@kernel.org, acourbot@nvidia.com, akpm@linux-foundation.org,
 anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net,
 johannes@sipsolutions.net, justinstitt@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org,
 mark.rutland@arm.com, mmaurer@google.com, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
 richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 urezki@gmail.com
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
 <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/26/26 6:30 PM, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 4:18 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
>>
>> I'm not sure if this is still true, but I believe it used to be the case
>> that the -linux-gnueabi target has one behaviour for enums (fixed size)
>> whereas -none-eabi, the size of the type depends on the range of values
>> included in the enum.
>>
>> Certianly, when Arm Ltd were proposing EABI, EABI had the latter
>> behaviour, and I think there were cases where Linux used "enum" in
>> its UAPI.
> 
> Short enums? I see `c-enum-min-bits` in the armv7a-none-eabi built-in
> `rustc` target, and indeed:
> 
>     #![no_std]
> 
>     #[repr(C)]
>     enum T {
>         A,
>         B,
>     }
> 
>     pub static S: usize = core::mem::size_of::<T>();
> 
> is 1 for that one, and 4 for the other.

I guess we could use a custom target spec, but I'm not
sure if that is worth the hassle of adding another one.

Cheers,
Christian

