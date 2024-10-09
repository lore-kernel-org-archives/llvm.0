Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856618CC0D
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462857; cv=none; b=ovmGim2Rgqu5acb1m20bsQMTc0KnygdhpRimgTjDh5V+P3cqESbf3T3hMGYkZWbPtE+wLBYC6EJ+IQg5toWiQZ6AY3ToyMl3dwzWEy4MAOQRb2z/Qs/z5IqCAJSU/C/AziftWoHrQ6mvp5fs9Iihw28J8Wl5n0BjPsAgg6kOQcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462857; c=relaxed/simple;
	bh=k/zZEnbeleUoj/ObdgPZErMIxzolRJMUPjTuayZSUHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhxcAMM2WQRPE1lj2Jta0vSxM76Z4TSmBPOh87dwP0iN61smPZ4cZewTtCprpj26IedIUO3p+6WRnHyLgmUiwLODjQd29LSJbqUbhG3C/lnVf5HviLLlHkCLQV5bssxvScEoeEM+i9BQ/+Y0P/D8wiF+o0ccZ3ldi/9mTeDSb2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2958560009;
	Wed,  9 Oct 2024 08:34:05 +0000 (UTC)
Message-ID: <850ede17-6eb3-4269-bec6-2a2a0a629eee@ghiti.fr>
Date: Wed, 9 Oct 2024 10:34:05 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Jason Montleon <jmontleo@redhat.com>,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr>
 <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>
 <20241009-tamale-revisit-7d2606c5fdf3@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241009-tamale-revisit-7d2606c5fdf3@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alex@ghiti.fr

On 09/10/2024 10:23, Conor Dooley wrote:
> On Wed, Oct 09, 2024 at 10:10:14AM +0200, Alexandre Ghiti wrote:
>
>>>> , it is better
>>>> to disable gcc + rust builds to match the original intent, and
>>>> subsequently support it when an appropriate set of extensions can be
>>>> deduced from the version of libclang.
>>>>
>>>> Closes:
>>>> https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@redhat.com/
>>>> [1]
>>>> Link:
>>>> https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413e@spud/
>>>> [2]
>>>> Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with
>>>> rust support")
>>
>> I also fixed the Fixes tag ^, it contains 13 characters instead of 12 and
>> added a cc: stable tag.
> FYI, checkpatch is not an arbiter of truth, and I intentionally left the
> 13th character that git determined it needed to have there. Apparently
> the kernel now has enough objects that there can be 12 character
> collisions.


Ok, thanks for the explanation: do checkpatch and the documentation need 
to be updated then? Is that a known issue?

 From https://docs.kernel.org/process/submitting-patches.html:

"If your patch fixes a bug in a specific commit, e.g. you found an issue 
using git bisect, please use the ‘Fixes:’ tag with the first 12 
characters of the SHA-1 ID, and the one line summary."


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
