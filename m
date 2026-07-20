Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9104E3A542B;
	Mon, 20 Jul 2026 04:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784520013; cv=none; b=nWsOsIEhyGf/ZPbfoxEtqmoIfV4tAl46gpzov+qbiYicLOCh5gnYNpX4gsxOG9rvtdHMsmdQCRGTe6b6AuSjmofp1vcpNyDUb1jVkuPOly3/d5M0R6h8D4XfHIYuRss+eFRhRFyyOYfYjrYPodKc4rR/rTPUjrFGdOwhsNfAmhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784520013; c=relaxed/simple;
	bh=8hxwepvwRNJWG6kAFHYrlks8EgP7LT+DhNIq5eyZkgA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fMgO4RSPX0Pia9nypowi2JEajlobgIDMKMJeDdtgPMpcnx0STh0Er21n8LZYGYn3vAdz4A6IQ6T6OsZOaaKc0x8X+c7SXTeJU2cYM5bl2v4XXxyOdcplf9iFcbFgcZml5e7tvwNlT4VwDHRbTVkc5ynpRlMgaqFDx86WGIlTCcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=T+pZl7Aj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Cx/HANVw; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="T+pZl7Aj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Cx/HANVw"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id 49E7B13002DC;
	Mon, 20 Jul 2026 00:00:09 -0400 (EDT)
Received: from phl-imap-16 ([10.202.2.88])
  by phl-compute-09.internal (MEProxy); Mon, 20 Jul 2026 00:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784520009;
	 x=1784523609; bh=pks8NSaA+5EntNYd31Fvj/x0Gef6lBSUxpuNusRUtWU=; b=
	T+pZl7AjzIgv6+NN9omjPqra4NuZVQcoCFJ736hpUfKXeBwc5NmbBo3lpfyG/5fV
	RtxZaD/5DySUCxVsp100Yvs+PcadEVnkyaKGyhV8k55lUFMYsyDTukIztHKMfm/R
	3pgUFwsyRqjmtZ8nXm7ERw6S6ToSlQ3e6UMoUYHvotKnbvUbrQ0wLO5k4lzS+gP0
	D7SmPKavqrue4nZflXjTKTWOOqK5Ek2VkrVFH1sYQE/PX9H/IFuy3xEndBvsSzcF
	6ds+zFJKkMORs6YI2eHu9+BTBtorlF72OO2jSafRWTUDALBYCKHK28l+WQIbDiM0
	fhHT5Lw46FvfMeQp+xo0DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784520009; x=
	1784523609; bh=pks8NSaA+5EntNYd31Fvj/x0Gef6lBSUxpuNusRUtWU=; b=C
	x/HANVwJgobuQWErE2hyvUaqO5ECWZRo1/VSTi6kTN4JjKz++zZ9w/MElIqJNCK0
	DHsjK1myWbL0sMwRy32UuLuY+RqXwn8B+rlAlB7b/er2N1x7E+Bi1OV9Gt9P/ebr
	4izEJUzVk5rCW1XzIJ6+xZ7QbfyOT/Q+3NJKOuTetUrxqcxw9J1RFFDpdL2vmXKZ
	c8IEDh9djJd6GyQQQjnbvM5N32LMxT9gheAYDOeuY/fDV8NBewmRZNXhBRCru/ef
	1vBpSB4uh2HUd1DEHVV1YBoGzNrZWPWWf5mLAl/4ECZ6FD5v5DfeNuo4A6P6ZoTS
	CiV0H1yH7EsElHe8QeNHQ==
X-ME-Sender: <xms:SJ1dauwqv5VsVQdq005ZXBCsO3guKUa8CIwUQ6RvZ3b8oEPheH5o5w>
    <xme:SJ1dalEiFJgscsSxXyCgFqywjKSWlgPi-ucqselVJtfxFiLHsEJV-b1yA_R5pHCZJ
    cFOkyvh0lomDK3sb-taILuCZKDD0J96lIWVpIAOYt2_s-_Nk2qzZAg>
X-ME-Proxy-Cause: dmFkZTGhKstYLaAN2GiTT4l29zGUepsRdOtJZ7qimrgY64/Gb+a/5gas8/+eDhM00XjHp7
    FdFd8OKRBQeyW6Ocazq5drep90p2XPJuVbyS1ccaMgljLDLzD7DyRQuy+Ka/8hSxTSIEkN
    kjzgSUwL5RCljSLRR6ODL+DaeL7OIQv+5CFN3cO/m8VQaB+MApx3ndo7QaVmwhrAsY8XbY
    JeqAprDQ2qDyqmtgAaDhPzwUXZpJmDAV8pdDTRi+4duvaFZWZVTzOuMIksETMwbI3KdC7N
    IQ1fIZ8yPsyZvqLeX5id55yxh3qzNZxtHSmcnNvnFxHDuqp8fsPTF1SOAYX+FpjP7FLaKg
    NuVNY5k8k0suv7tMg7xJHjpzYmDA/l1OzeCxYNWrcXgAah1fNKgKqSxojNJpagv8ZHSOgc
    mMWB07cqM8MgY+RFks1B3uCuJ8tXJtKJBp+TgrPjqj41hDVfh54rI5Fa+dDhvvCAiZ8/LD
    dt84wEO9HziKNNUh6ib9vkohZjRzGzrYmsT9usIZf8Ryw3EkOV8XnGELj6d91fadnf9LAa
    2WleP4ILslRGpPpMqatVL7KUtKhLpJOEWRKq5h/AfvCuc/9NWSbo5WaVvmPwOwhG2yPR/4
    KkuFss4FILLkpcDU7A8DOj7L3rSQp9aikLV5wKrA6Vj5bGGaVLgw6vla5pKQ
X-ME-Proxy: <xmx:SJ1dakAH59F2MIM6M7flSldqL3yS0ILIaK-Dmktaqqtre0MFrXuz-w>
    <xmx:SJ1dam9MgzDcx7R3TpCs9lHQNXTisAYSf_Wpj-SegESJFSOhQMuw2A>
    <xmx:SJ1daoRB7h9HwGJjzICkQNs1xum0NYOoP6J8YehVQyczLL4HhaMM3Q>
    <xmx:SJ1daiVkyvyYJnll183BOuBwADivEG0TcjaKi_Q8TFT_WHE-65-eZQ>
    <xmx:SJ1daq5oXPJLMhnkIyFZOQ42Od3ngN9LJdLSzXWMpQC0xnJoVpkWWQnN>
Feedback-ID: i51fe4b43:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2A4E62CC0083; Mon, 20 Jul 2026 00:00:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AtrZI9yLaAjF
Date: Mon, 20 Jul 2026 12:59:46 +0900
From: "FUJITA Tomonori" <tomo@flapping.org>
To: "Boqun Feng" <boqun@kernel.org>, "kernel test robot" <lkp@intel.com>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>
Message-Id: <378be3c6-2789-49f0-95bf-44f0f61a24b4@app.fastmail.com>
In-Reply-To: <al15JgmfEzQHF3YA@MacBook-0RXW5>
References: <202607190048.vAGhOcAV-lkp@intel.com>
 <al15JgmfEzQHF3YA@MacBook-0RXW5>
Subject: Re: [paulmckrcu:dev.2026.07.13b 75/86] warning: constant `WARN_ON_FLAGS` is
 never used
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
Thanks for the report.

On Mon, Jul 20, 2026, at 10:25 AM, Boqun Feng wrote:
> On Sun, Jul 19, 2026 at 12:38:20AM +0800, kernel test robot wrote:
>> tree:   https://github.com/paulmckrcu/linux dev.2026.07.13b
>> head:   04b88652be5bc3b092a63198d1b2bebaf46b9e72
>> commit: f41634950050921c691e1fabdafc0304c2aedfdf [75/86] rust: sync: add SRCU abstraction
>> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260719/202607190048.vAGhOcAV-lkp@intel.com/config)
>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190048.vAGhOcAV-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202607190048.vAGhOcAV-lkp@intel.com/
>> 
>> All warnings (new ones prefixed by >>):
>> 
>> >> warning: constant `WARN_ON_FLAGS` is never used
>>    --> rust/kernel/bug.rs:126:19
>>    |
>>    126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
>>    |                     ^^^^^^^^^^^^^
>
> [Cc Miguel and Tomo]
>
> Is this one supposed to fix the issue?
>
> 	https://lore.kernel.org/rust-for-linux/20260712102802.3013600-1-tomo@flapping.org/

It doesn't. I've just sent a fix:

https://lore.kernel.org/rust-for-linux/20260720035510.4048145-1-tomo@flapping.org/
