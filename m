Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5F3C1970
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903018; cv=none; b=tKYm6jhUkDqkXhgBf01sU+Gp0rBysrkwmBhfJJL9bhxdYeRPKPT9Su2kfZNfVpyysGYy+igY9jr133Ivw7bFuy/4UpBguquRfz864lzAbi1mbg5Uu7kRGA4v/iG83wumPSQ3g0BmAkLOXpCX8xj79Wr/0lBVmvNNy9C4VaZllaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903018; c=relaxed/simple;
	bh=MLxN6shAm2Ln0HLCZSjNmRijlp5EjI4zLoHjLhV2/CY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHZFvhrBULkfUuRa19qDOrrN8j2BLW6rehm6dk42q+A5oSs5ASPID7Aj8mKmcrfiE7c65G9BpOUQOYcO9cwyl++lnyONETK+R8Zl2lXglDeu/t4W2Cjj3U1NCPMXWvSaXBq7XAkTjFq4UOeA/SAsXSdO3cAKELXfbKs2+Jti+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Ueq7n6SM; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Ueq7n6SM"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 290B141DF3;
	Tue, 20 Jan 2026 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1768903008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbegtlNTbPxVcnJRIa09PMJk6eYCLCQm0+QaiVvmwvk=;
	b=Ueq7n6SMwzYlQtIn6/RjVEK4lTjLBdfui5Xh9vyN/OdF9xE69O7KOwJherTsO6mVx5rf4t
	LW074bWAshM3ICX9pKD/xf2wWLdpS55g7wxBtJqelzWSddROloott0dxW6NLMVhNVB5Yej
	g1h0blvApYKjj5kSuQffr//GBvrHJU5XtNUf9BOqR3QahYivPdP8+XJeW7J1srhFn6Jfon
	r6aZAAwgL8z0aPHtXFa9EN9a6WWKJUJv1n6atpnTIGt6dVMQuqO+rHX33cRxHRGUb4s+9U
	VJbhBGAh0eF5LxrhvYRfoV25vu0ZL2Xj95+EVBDs4fCVt1X7dnSKtawLJLuDnw==
Message-ID: <1766d2ae-1224-4d3e-bc9f-786702989a79@gtucker.io>
Date: Tue, 20 Jan 2026 10:56:46 +0100
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
 llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <20260119213516.GA1051134@ax162> <20260119214931.GA1058062@ax162>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20260119214931.GA1058062@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhohgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepfeegvdfgveethfffhedvfffgfeefveetkeegudduvdefleejgfdtveeuiedufeeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmegrsggvrgemjegvsggsmegtrgekgeemudgstdgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmegrsggvrgemjegvsggsmegtrgekgeemudgstdgspdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmegrsggvrgemjegvsggsmegtrgekgeemudgstdgsngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepvdeltdeuudegudffhfefpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-State: clean
X-GND-Score: -100

On 19/01/2026 22:49, Nathan Chancellor wrote:
> On Mon, Jan 19, 2026 at 02:35:16PM -0700, Nathan Chancellor wrote:
>> I will apply this to kbuild-next-unstable shortly to give folks a week
>> or so to voice any objections or give critical review comments.
> 
> During application, checkpatch.pl pointed out that this should have a
> MAINTAINERS entry. Would you be opposed to the following?

Not at all, on the contrary I have some dedicated time and long-term
interest to keep maintaining this.  Please feel free to add me or I
can send an extra patch if you'd rather I did it.

> CONTAINER BUILD SCRIPT
> M:	Guillaume Tucker <gtucker@gtucker.io>
> S:	Maintained
> F:	Documentation/dev-tools/container.rst
> F:	scripts/container
> 
> I will also add scripts/container to the kbuild entry. Now that I am
> looking, it looks like Nicolas has been left out of this whole thread,
> cc'ing him now (even though I assume he should have seen this through
> linux-kbuild but just in case not, the top of the thread is
> https://lore.kernel.org/cover.1767199119.git.gtucker@gtucker.io/).

OK sounds good.  And sorry, get_maintainer.pl didn't mention Nicolas.
I should have checked the KERNEL BUILD entry by hand in the file...

Cheers,
Guillaume

