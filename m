Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F973BC4F6
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902382; cv=none; b=iHn0KVppCNWTE774KwQ2IZimFjTACN2GlJY91eFjB5bpo1cvJ7qaIk2fb4otgr6Oof5VZETIv3LhPZfyKGkYGU5n7ZfnJ+35Qcj4ZlOf39iJ9QJskxwUE2itSEapq1ZxYaUp3vZpZsN5nU8h10/aFYMlEw6cU19c8rQg+oF3VZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902382; c=relaxed/simple;
	bh=sqBdNVqugHD6YY6WnRSD5OVCeoVjd7Zp35fCfc+iE0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DaMYjsa1muX4bMCieCyBkLjPRK2TmoZ5bP3XKy/t0gLfQLfMMrlJa1m1qbZBL0sOzXM7FD/9V/wSV2JT9XaLzilYX+MpSsX5R0TtbkaHUX7kgsPHuRyWp9sr7s9CzY18S9A3yf8AbayD88hq/8bE3b7oTMXkbHrqiWxwr6MthY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=bYdIFzWJ; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="bYdIFzWJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32AB641DDB;
	Tue, 20 Jan 2026 09:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1768902377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSzTlCavTkx6uaNC6I5C8OOKGogzKCivYUt/96O7C+w=;
	b=bYdIFzWJawmVmAvUSyjRGm0yc2pp9qZCWZTf2uVYRJObxlHzZV3LHR4nRaO2otc9zVa3kv
	IsiHT4FZDnarDRraw4j2ay6nIzfvf40Oz9Jim2yHpwgMEm5aIdQNLHLqnIIK9dHq2zom75
	nI4U2lem/XIdHBTjjNYNn04ELpCqIjoO6BnfKj53v8QX24ZPEYBpbOWuObf3g7eXfJ4pSl
	Ststqzw3rrEKaNkKnKUYC4+28PCUSHROkwQo90xR0pKdttgI+alaZk1hKGWXBYxu1shUNO
	SedNwPRj2c2v4Svf77f2JOLofUmidqbXkZLzBIjdhinzu30DGCKZGUsptHCLiA==
Message-ID: <4d4ec41f-1203-4cef-8f49-402440f3e983@gtucker.io>
Date: Tue, 20 Jan 2026 10:46:15 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1767199119.git.gtucker@gtucker.io>
 <20260119213516.GA1051134@ax162>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20260119213516.GA1051134@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedttdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhohgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepfeegvdfgveethfffhedvfffgfeefveetkeegudduvdefleejgfdtveeuiedufeeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmegrsggvrgemjegvsggsmegtrgekgeemudgstdgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmegrsggvrgemjegvsggsmegtrgekgeemudgstdgspdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmegrsggvrgemjegvsggsmegtrgekgeemudgstdgsngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepfedvteeuieegudffffeupdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh

Hi Nathan,

On 19/01/2026 22:35, Nathan Chancellor wrote:
> I went over the script and the documentation and it looks pretty good to
> me at this point. My only comment would be potentially referencing the
> TuxMake container images in the example section to give folks a
> "prebuilt" container option while getting the kernel.org container
> images sorted out but that can always be done in a follow-up change.

Well the tuxmake LLVM image is mentioned in the first example:

    scripts/container -i tuxmake/korg-clang -- make LLVM=1 defconfig
    scripts/container -i tuxmake/korg-clang -- make LLVM=1 -j$(nproc)

So that should just work out of the box.  Or did you mean to add
something else to the docs?

But yes, the topic of available container images will be something to
expand upon once the tool starts getting used.  If things go well
with this initial version then we can try and move forward with
hosting first-party images as per the other discussion thread:

    https://lore.kernel.org/all/cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io/

> I will apply this to kbuild-next-unstable shortly to give folks a week
> or so to voice any objections or give critical review comments.

Sounds great, thanks!  I'll spread the word too once it's available
in linux-next.

Cheers,
Guillaume

