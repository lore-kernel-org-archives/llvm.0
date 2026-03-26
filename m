Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6C3A1E6C
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 05:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774503652; cv=none; b=mIu9Vgj66BDLkHnu+7CiLJtG1kL4RWGEe1RXzRmZORvajpuu31BHY6H1MTCXUMoi8zhevr8R7PsA61BMGR0eJWTQTbf/Kw7eB+ZVnOIB/HmBnWQ0FgZsuZCppiSIX27Xt0QcVPw/Xo2jQD5LkXXUCoUS8qLjJrL6wE4tREdPUXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774503652; c=relaxed/simple;
	bh=n9xjHtpRhSH9ix3QmcQLv0kr4+Yq4N4rwcbqb/HE28g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPEMhpQZAsJbJ8B+6QTavi3lgxV5/iQifvv7HMgx25nNsHo9LjPIhg6GPVgDNmSFipQrAmFfz20oMiLLU9hj4wRy8LeQq4PYQ9ZTm+mW4OpMSAbpXNIEqjuOuRhrOPYIV4S6KhpBN9EezJWLt6LHPRUZlyvowh7IFe/TlTOk92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=ijgkR2m3; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=ldcLAgFv; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="ijgkR2m3";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="ldcLAgFv"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1774503290;
	bh=n9xjHtpRhSH9ix3QmcQLv0kr4+Yq4N4rwcbqb/HE28g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ijgkR2m3ExNXd2ith8CSWReGK6oM8F+dwRcN39lTcaP5QRKaFSL2C7Hry7+WTcTEv
	 fLpTTixlufdp1FjAzY91YETdJPIkJX4CotIeLNltvQQtmbQtiCcat3dkq1K4Zrmen4
	 CyP5KubsCneIzrox4OAoqDPlgNa+NVpW5z5LDiHaIz97yCpqANNeyMaKJ20XZIxG6u
	 QkTrXwsfgas7w8i1czLe2DPYmWhBAMAMhIi7Msai1TXaJueYxcUnvaAvggh4ucfvor
	 OsD0RXxdk6gO6vEcb5XRybbtwrtonLUphRvS5J0fqDqQcvdzQWR1mRFsdJYP3XkzS2
	 enIVECQ4Vc98dzvMEYyAMNhUtG3rqKX7K7KePl8F6UaRWzBSDNn++WsPQev9REGcM6
	 laduIln+ZZSR8TC1YcIwLA/Q2bPL75jVfD3O2itd+XFwK0VxfsGRe+iz+YQ+aEPlIA
	 HsY2uKAjaVrx4f2w2Pr8OjOKJDAyiYTpgovWbnYQwDvEvCTUt4z+7RYiH4JxgBxfcU
	 4YAkQwlBf+M+ki5fPPkEP9kWsuxjHBI14t2LQZModPKQOGUEJbc9/gOubHm4p1UIW6
	 CBIA3YoVUd5FpHd/lWaVxfhzkPeuVcE0FwfC+ck3tgnNaLDNhjw6tjLdyl5M7BfRkn
	 KeCU8ffvDKTc6ch+pcecUYn0=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 9EE201E8335; Thu, 26 Mar 2026 13:34:50 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1774503287;
	bh=n9xjHtpRhSH9ix3QmcQLv0kr4+Yq4N4rwcbqb/HE28g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ldcLAgFv276uo5NW6LPy7yICCVgujhSzmWWh6jq+0as7zdXji4UzHT6jmt4Pz/+33
	 S3izhb/lP9G6bwJL2/2H1qTs2LUaVuCj/ABRbszrZp4q62JjEXq55nTfRp2SvLuI9R
	 fm906bBysocD7LOT3MwsI7/Yswz4Tiu7PEgJoKZ1suCr2uP3hzygBpq9Y/uHrCvnlV
	 hL320KohBE1/nJw3XzMRLlA2C6A8q7IH7kiC+wl1eGgKbZUpqeffPGP1oYo0M96OJC
	 b7+eOTWzv4JyqwtBOF8ElsXU3R7ytXb6QQaJ6JxxljEQwj2nIYkCAf94e9nYx5u4JE
	 4903DdFW1gSuzq8xO+jxBKsA7ZEGlu1on8XW++IES/3QjXnfMvh/tT99aAmzDk70mK
	 Q12zsoXnahHRQZEKsNXsV7IS8i6e64DETF7+FG/6LFPOLnJzdxuyTYZMWVs6YLIIDG
	 aFSeffc9zYPYLL5KHnYpKyLYtJTLbeBA1SbKt6JO1LkMj8NOUC7hfwUzjxN/oHDv2z
	 3/L5hJqEG8WzvGUCwLtLeVT2cCVUWYkRhKzxdIUzYLENGP4vUxvX5aCNKe1wTm38eG
	 Uoepqbm42xqept2Sy0Ah2AWCkqIRpUM2alnyL+hUrW0AW3Nejd9c4XWG434jAvhFQB
	 SI3cbpjzbw15rKzFZT3TjCdA=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id DC56A1E737C;
	Thu, 26 Mar 2026 13:34:46 +0800 (AWST)
Message-ID: <e6bcf016-4739-4ba4-a46c-c0416c07400f@davidgow.net>
Date: Thu, 26 Mar 2026 13:34:42 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, aliceryhl@google.com
Cc: linux-um@lists.infradead.org, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 a.hindborg@kernel.org, acourbot@nvidia.com, akpm@linux-foundation.org,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 gary@garyguo.net, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com,
 nicolas.schier@linux.dev, peterz@infradead.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com,
 will@kernel.org
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260322192159.88138-1-ojeda@kernel.org>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260322192159.88138-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/03/2026 à 3:21 AM, Miguel Ojeda a écrit :
> On Tue, 03 Feb 2026 11:34:07 +0000 Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> To get rid of these helper symbols, provide functionality to inline
>> helpers into Rust using llvm-link. This option complements full LTO, by
>> being much cheaper and avoiding incompatibility with BTF.
> 
> I have been testing this. I think we can go ahead with it, with a few
> notes.
> 
> I will reply to a couple other bindings in separate emails to avoid
> spamming people too much.
> 
>    - I will mark the Kconfig option as "(EXPERIMENTAL)", since that is
>      what the commit message says and it allows us to be a bit
>      conservative.
> 
> 
>    - Clang passes `-Werror=unused-command-line-argument`, which means
>      under arm (i.e. 32-bit) we get:
> 
>        clang: error: argument unused during compilation: '-U arm' [-Werror,-Wunused-command-line-argument]
> 
>      And under UML I see:
> 
>        clang: error: argument unused during compilation: '-I ./arch/um/include/shared' [-Werror,-Wunused-command-line-argument]
>        clang: error: argument unused during compilation: '-I ./arch/x86/um/shared' [-Werror,-Wunused-command-line-argument]
>        clang: error: argument unused during compilation: '-I ./arch/um/include/shared/skas' [-Werror,-Wunused-command-line-argument]
> 
>      So we would need e.g. `-Wno-unused-command-line-argument` there
>      close to the `-Wno-override-module` one, unless Kbuild or
>      ClangBuiltLinux thinks it is important to keep it for this case.
> 
>      On the other hand, regardless of whether we fix this (and another
>      issue in a separate email found thanks to the UML build), we could
>      instead add `depends on` listing explicitly the architectures where
>      this is going to be actually tested. That way maintainers can decide
>      whether they want to support it when they are ready. Thoughts?
> 
>      Cc'ing Nathan, Nicolas, Nick, Bill, Justin, David, UML, ARM.
I'm quite happy personally to just have 
-Wno-unused-command-line-argument here, given that it otherwise is 
working pretty well on UML and 32-bit UML.

That being said, I expect it won't get a lot of testing (regardless of 
architecture) while it's hidden behind CONFIG_EXPERT.

Cheers,
-- David
