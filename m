Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5AB37CD41
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535495; cv=none; b=HlNuFY/9ZBU8ol5y09IZjUtd2iH1joQu9vxeBTCRD1tWIhjI26IhQQRRE9HgE2fYKOPPFda8OxwglLdrI5og7jVu7tLnX3oakVZSFDLWmaKo/Ipx2YdpVFCGMUQ9JhovnVfMIxQApKzZYof7mi70ArY7vVetaU/r5O78WR0eMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535495; c=relaxed/simple;
	bh=3Vzte3b1zLfQQJBgi5xEQ7PzA9z5e7EmHBF4s8am6qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlUe8VOr8lUplwFkNNVguPZJL0OvOqEu5g4dK9eXIqBTN/rbzj86OpmkLgmsEeEikFhRZuysvjnZ+j1LkuULFyaqzJNMYZM3tCUweXSUkNj9WLhziz7C9OXdeEnf+g8pS0DEuvsN7MDcPGXR69MIRg7r1IAZYRvC8B4Sgy1DiZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8SOZeEQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8SOZeEQ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439c56e822eso1092909f8f.2
        for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535492; x=1775140292; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jv2EfhMbcWOA2sU2awQXAMiSQ1dwjbJBc3BzfW+6rZQ=;
        b=r8SOZeEQDD5Tk4gakY5aAqCXIO/kOa11nygDqp2RxTHbcoMT621g0QKIDAom4Tf5mh
         j+0vcJlpsNOn+xrtYjykL7luvzrzdM9pK9+HC3SUxVVOiuimqFH3FlxyDtb2Llmx57cU
         /5xRrDWcYzSRPy8s3zWGAvzTQOFrvoUsNVttxHObs1mItmcvsZk79EUbNUQhWMKDhzZX
         vPF/NUQNvUeYX5sWUKwEJPbivLo4aQjhvgm6KxgrQ4AOg+ZNGHxRSjVlO0wepWC14KSl
         OaU0D3BdUEHZFbsK/ZBSBv6ooPBImIypB/EXjmFgJfyo/VrPzKCLBpXw9pCk0va/MNEi
         BaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535492; x=1775140292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv2EfhMbcWOA2sU2awQXAMiSQ1dwjbJBc3BzfW+6rZQ=;
        b=WxxZ0JPMWKDFG7wV7Yz1iBlYTjr8OW/g8Q3sqpxSCwitfkMo42rhKU711ekLBlq4aB
         fFezp7YaENhgSpZpPPMWgORTl+T/RJ7kR2sVvY2PnuRV+f70F6dwxmZfHx0EK2Lv4Cot
         x5E0m9IeA7RQVGf7p+IwebraAjwy9duzOaaINdi1klyrkx9oQu/Vmfejn5JLL85H8svv
         YAJzvoOpSjhCmezCp0rrFtSpBUpmzlChrMjKUHHLB96zirFv21FcAnPcZxSrxeA2r3T+
         iG0NqT+PqA/r8vQQ6lLGaHmOyPCiaX+6xzZznj7ssLDaT1z46TRFAPwR9wlMIflgr46j
         uIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV99z8BB89pWwXhfOA1jScbaz5EZhYB73ls6UO+R3F6x/FiFMz4Fgo7cqG6dp3P5GMzcT/X@lists.linux.dev
X-Gm-Message-State: AOJu0YypDlGiYowvTXLWPEV4neY4hxy1VSyPZbjWJYlR4uP0C9xKr0D/
	LRMeJdkJfnT92mZkWR31JMogQ9uOuCqrAK/mfh3K/PDoIloEjaA8OPtM
X-Gm-Gg: ATEYQzzH6eIfuqKvTa7leHftQ+c92zEcsink3f41yF+VvecERniZrMI9U4ZXy0q4Z1u
	RnV//yw8vuo9y9VLG5KQ7tL2I6Le9EIpx0Sj27LECOSfYq47iJM1ox+aOALAO3+evW0i2ydI7E5
	gfXrw2+DMRS4NOvPnv/jrWd7bilhQI4ZMeu78qcEKNvTM2inqBYb9P3oIgwZ3CZawmGHHEnLMNw
	WqpO+no/OHAiuYAYNs8+XoMMuK/GuY72YVj7fgnasJMRfhBdfIC1XRVA6FKn43UJoHQ02misnPi
	MNBvvc81HnsWTx/PWpK8eon30E4cTYrM+vV4sUc82yfglwbYkiaezdrUD/z2AR4zdeQVWuKkzdd
	whDOfBM3LnYFSD3g0G6hJskFjvqYfyd8bReTrAnakc37kJ6anoo1B7wP71lxtQ5Ko4OLqb7l1VY
	CAzX7hFqzhjJazHTqdkF7lN4apedNmxj/KkUpZ
X-Received: by 2002:a05:6000:4381:b0:43b:5672:f02 with SMTP id ffacd0b85a97d-43b88a21651mr11427910f8f.7.1774535491079;
        Thu, 26 Mar 2026 07:31:31 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:d2a7::cebd? ([2001:871:22a:d2a7::cebd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm8063097f8f.1.2026.03.26.07.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:31:29 -0700 (PDT)
Message-ID: <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
Date: Thu, 26 Mar 2026 15:31:26 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com,
 akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net,
 justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev,
 lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com,
 morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
 richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 urezki@gmail.com
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miguel,

On 3/26/26 2:47 PM, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 11:10 AM Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
>> target. It should probably not be -linux target to avoid this? Probably
>> it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
>> CPU_32v7, so we should not need to consider the other variants.
> 
> I think Christian tried several targets back then and eventually
> picked that one.
> 
> Christian: what was the reason to pick the `-linux-` one? e.g. was
> there something you wanted to rely on that target spec that you
> couldn't enable or disable via `rustc` flags or similar?

It should probably be fine to use armv7a-none-eabi. I've mostly used
arm-unknown-linux-gnueabi since I though it needed to match the
bindgen-target (which is -linux-gnu for all architectures) and 
because from what I understand clang also uses arm-linux-gnueabi [1].
Also when I selected the target I thought that we would also support
armv6, but since I had no v6 hardware to test on I disabled it.
[1]: https://github.com/Rust-for-Linux/linux/blob/rust-next/scripts/Makefile.clang#L4

Cheers,
Christian
