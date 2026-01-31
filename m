Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB4218AD4
	for <llvm@lists.linux.dev>; Sat, 31 Jan 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866594; cv=none; b=h4+flzQ7VmVzKoVoTt2tgiTt9edVTPFVUxdHu3n+hgotTd8Wep0AcL3/HPTgURy9uvDPG5po++M7DqRWilsPynjfjMaM/WAxK0PPLQ3x0eGr2TppJtzpkSD3z/HTYlyxEvok7ZGQIRCuXrvioKUf74EDQ5gz2lNCZEHvsXiIJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866594; c=relaxed/simple;
	bh=ETjIu9X1UzfMeb2/GaBDScxVgeJExTm8Knq3LrxVE5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=JcgPI9+ZagYy7bfirwpP9t+1pe84otfrV172G/FPXi4cxfvAfafoqrGPdtVNBEgfd3Tibq6NsK4toHNytHoW2UhU0TKvYRErvTnSN0PlmEU9ZPWgDq1x3PvzFpLvF3oQLA7sJ4GC/A7w+gYmyEf0mXzavryCDhEf+2F2/U++G6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=UGyu9OOz; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="UGyu9OOz"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F281D438D7;
	Sat, 31 Jan 2026 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769866585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNbBAYy8eEVK14kERy6x2Yy7Zc40mqn4g0KFfR9rgoQ=;
	b=UGyu9OOzk+A1qmhAfyuNIRh0bm9l9ZyGxJ8JOOVOILBjTzsmBZAsT+91/t1XZDApduoIUm
	5cxPpMBzIkTAs7Y5UAYIBNA9UjgDdTBJfQNbu3I6K0iZ1r0TYVPGT1vvSk3lofIjPeY+By
	9rzsAC/0pQiP265d4qe8hNjEH0Wq79v9DcXgX13kgx+8iCzF4NsY0NCfPeCWCxAiPm01Gr
	LyiZbgqvwpV6twwWoaCN/HNKG6oNuWAwsh9TpiQjBHQp4aWx6SyGUPE0vpgZx6c/F2RvCj
	eNC3MqeLOySNxaoa5AqaSKwWjLLocB/x7qw7XFXWgky/nMnkkPFpv1+ZF/VWCg==
Message-ID: <4848da1a-91bf-4c2d-a6df-63963ee9f0a3@gtucker.io>
Date: Sat, 31 Jan 2026 14:36:17 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
To: Nicolas Schier <nsc@kernel.org>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
 <56209dbc-2dbe-4f52-a703-bcbd9ed3e712@gtucker.io> <aXkceKDeYxUGHLQh@levanger>
Content-Language: en-US
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <aXkceKDeYxUGHLQh@levanger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedvtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfvefhjggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedvheeiieejhfefkeffhfetjefhudevlefgudelkeffteefgfdtveeuleetleehgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemieejtgemudekuddtmehftdehudemsggtrgeimeguughfleemiegsfeemvggstdgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeeijegtmedukedutdemfhdthedumegstggrieemuggufhelmeeisgefmegvsgdtsgdphhgvlhhopeglkffrggeimedvtddtudemieejtgemudekuddtmehftdehudemsggtrgeimeguughfleemiegsfeemvggstdgsngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugephfdvkeduffegfeekffejpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepn
 hgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg
X-GND-State: clean
X-GND-Score: -100

Hi Nicolas,

On 27/01/2026 9:13 pm, Nicolas Schier wrote:
> On Thu, Jan 22, 2026 at 03:12:36PM +0100, Guillaume Tucker wrote:
>> Hi Nicolas,
>>
>> On 20/01/2026 14:54, Nicolas Schier wrote:
>>> Out-of-source builds do not work on my system with podman.  If this is
>>> expected, I think it would be great to mention that somewhere in the
>>> documentation.
>>
>> The v4 now mentions this and also includes a trick using bind-mount:
>>
>>    mkdir -p $HOME/tmp/my-kernel-build
>>    mkdir -p build
>>    sudo mount --bind $HOME/tmp/my-kernel-build build
>>    scripts/container -i kernel.org/gcc -- make mrproper
>>    scripts/container -i kernel.org/gcc -- make O=build defconfig
>>    scripts/container -i kernel.org/gcc -- make O=build -j$(nproc)
>>
>> Would this work for your use-case?  Directory names are entirely
>> arbitrary.  It's not ideal but might be good enough as a workaround
>> until this gets properly supported by the tool in a future version.
> 
> sorry for the long delay.  Yes, thanks for the follow-up!

Great!  Thank you for confirming.  It's now in linux-next.

Cheers,
Guillaume


