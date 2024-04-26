Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C654147C7D
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138931; cv=none; b=PF1W6AKjsOA51Fnnqy/loZLS2MQapDuUKqp1hBgRSVeYVOUa/kb5prt6qz8vikJTGM8Vs2mZsmUQRQ3i5ft6xBqEmX/OYnnz5zT7CmPArPetqrP9GKH/IHOFCO8mDe7wVCOmKBhqaA1CXal7vUBNab7L18InCujgX+/m9mC+Wyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138931; c=relaxed/simple;
	bh=lMASuYSAWlb/OFH47whEQtY61SuOybHxX5LnchWYxhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hmqZ18CyeXNBTfx9u0ymJbIFYpCRrWQ3jURVTyFpsNELuQqxiDJWnDqZ5FtIZs6aTfYP9p0iaYOPq9y3mZ6vDrOrM7UWjS5/nIhurdOKdGoVEzyhQ3aTIBr32qs2nMorBQ73rssQlAzqF2rG9JrJ8uVRjaF8ufsW5SoxKaLJZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=k5C9hv0f; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="k5C9hv0f"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7AA6B47C49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1714138929; bh=7rOcTis8EEoysHUL6NeDDmWTPEZBEhe6W7eTVPyU8JE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k5C9hv0fSGguou9GMFdSfFN0yn3tq0FUF1Dz/1z256Q/NaWDLROF8DR2yRiqDnUsk
	 4RCLCnU6fGMCjMAH/29CVgXISu05qCelHmxI+81g+J2tY7sPEyQDOdgCjLBWwB0G8d
	 QSsqQgfSQXKM9IDpV3tQwI2cbD5AJbZpXwTIArXa6oRckeAnYEFDSWh9YEDL/WjmrD
	 FzGPlMad83QZADt2c20tTV7OTDAK96GxqHypy0G92mvlSCNNtvwMLZfNt7zokXcxLf
	 j5Sc4yc0iqN8PKnXukcyccw3rGfNnJGe7CpZx1AKRDaRV38+ywYcTN/ouaf96bLKYN
	 fFl08qtJ8x+iA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7AA6B47C49;
	Fri, 26 Apr 2024 13:42:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Yanteng Si
 <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to
 6.9-rc4
In-Reply-To: <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
Date: Fri, 26 Apr 2024 07:42:08 -0600
Message-ID: <87zftgnsun.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Apr 26, 2024 at 9:00=E2=80=AFAM Yanteng Si <siyanteng@loongson.cn=
> wrote:
>>
>> v2:
>> * As Miguel's comments, translate commit 01848eee20c6
>>   into Chinese, as well as commit 81889e8523e6. By the way,
>>   these two patches haven't appeared in the doc development
>>   tree yet, maybe we could consider merging them into the
>>   rust tree?
>
> The former is in `rust-fixes`, which will be sent to Linus for this
> cycle. So the English docs will be updated sooner than these updates,
> if that is what you are asking.
>
> For the other one, it is in the RISC-V tree and I assume it will be
> sent into the next merge window. I don't know how you normally handle
> that (i.e. translations being updated at the same time or after a
> cycle), but either way, I am not sure why you would want them to be
> merged into the Rust tree?

I guess I don't see any reason why the translation couldn't go through
docs-next as usual?  It will all even out during the merge window,
right?  Or am I missing something?

Thanks,

jon
