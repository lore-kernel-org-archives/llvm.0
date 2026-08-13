Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746513E3159
	for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786626963; cv=none; b=E0t32zKpD6tSCJybWAp2S/xC+qAlpY3iNl7h7n4C7dQ9vpMUlMrv8DkwxlWDuVAR+JfGg/fC0bRdVAbTDV/ycM23kzfOMxP+xUZkjT1N7J0xvG/4o4WofCam6mUizFFN20zhyZCbPXPjbE5tldpt9O2G/jvoobUvrDZ9QV7Tsnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786626963; c=relaxed/simple;
	bh=JuVUoKayiiL7qIdW39da2OcshqPAHX5dg6xMBzLZVqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kgR45N8unlkOVK/CJ+P6sphhYgneZYKn2AM/PvG1m1pxiURr9oMZMduP6aYgBXysfFZ/5EKiq0yzc5ubFIbXXS7JJbrGZG6JeHFzWfXzlRW/TRFl53JsUaPkV98F2f2QRcX6jivMNy0omt1rGlopDr0xpQRTQSLSm55C8CTf644=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gz59xaAc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gz59xaAc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CE883408EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786626955; bh=CJOUmOrM8iHXXIY7dV6uC8aAvdcDOoC5XB9mKJMan54=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gz59xaAcRdVhw6JA+IdG6B1Lu1eFLylxKVmFbhY8bh12+/zIO/+/J7nFYCXWNYUWI
	 dOOeQA+plFt5cSuCVQW+kR4Yk+JUlDV9xw4/jrRPpZ0C620V/sR5MnTKy7+t+jIaN/
	 buZu01a03a0B7vV01EbqvmdoE2JA2kyWl2qjrQhc4WuUh/PEmHGrwIkLDG9Yepy7Ae
	 C5csBRmGb3GU0OpWXdvP721Uo5xZU4v7D2E2m88DApUBMSwu8vQB/QMfR8AUv1iUYl
	 udqrWewaJsnXGuJsmNum6qdSJ5kWrRzHXmu2M+aVHJ76bEnTXhro+fxmR/ylHZ7oa5
	 RM5Vn8ZNxov4w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CE883408EE;
	Thu, 13 Aug 2026 13:15:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 5/5] Docs: software-requirements.rst replace optional
 tag with footnotes
In-Reply-To: <20260812122426.1636227-2-manuelebnerli@mailbox.org>
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
 <20260812122426.1636227-2-manuelebnerli@mailbox.org>
Date: Thu, 13 Aug 2026 07:15:54 -0600
Message-ID: <87tsoyi2k5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> The optional tag isn't obvious nor defined. Therefore replace with footnotes
> like the one of Sphinx.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  .../process/software-requirements.rst         | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Explaining the optionals seems like a fine idea.  I'm a bit less
convinced about the mess of footnotes.

Especially since many of the entries that are *not* marked as optional
really are.  You only need e2fsprogs if you're using ext4.  gdb only if
you're wanting to run a debugger.  jfsutils seems truly optional, etc.
Even GCC is optional if you're using Clang.

I'm not sure what would be best...perhaps replace the --version field
(which people can figure out) with an explanation of when each
dependency would be needed?

jon
