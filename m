Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7173C8728;
	Wed, 25 Mar 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436817; cv=none; b=RmiJBi1QEDoAvQqt0wgBhkeLKqySUvrgGYfWTCSryDbTtPopCy7fNQzvAg4HFALQpLvfm22n5PYtswgautd4R3zyNRPOOKZXSSLiIKx6d3R8EmdbmUtGHL1dZsNEA1wNLgvcySyzJOHoTRvfa7aGcNsY9EEt7ejoqxf055Kr09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436817; c=relaxed/simple;
	bh=6eAoP8umGafawtXPql+xN1b7YnBGcg+Q8lsnnMIEWso=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=gyzjR7tVmC3yayI/P/Jq6st/8cIjkayLSy+JYH/7KkAZ0uc9G9j7qWIheHXoIkzhKZ+bcpigV3BrDPAdmYNM6ZbnoG9sFC349eJH8w6UAWSAH7MFnAOaqk51OlV9bBZ7+OFHN5M730kdwXO1pPwONsTsIE7hu3b/ogkPW9IoFIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRyUaIWq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRyUaIWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEB9C4CEF7;
	Wed, 25 Mar 2026 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774436816;
	bh=6eAoP8umGafawtXPql+xN1b7YnBGcg+Q8lsnnMIEWso=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=nRyUaIWqK+EK936RHQ4rF884ek+7MlmCvJIKDWJTP8marlz7YDyd2y/FsRODE4sR1
	 SNzNjEmkKU7Yq76vpXD9yTrLSg74KEVXsbj6mYZxC36dSOhL/pLhC1kPd2OUkjhMnA
	 io59v6rL4SgT7H75p9UjZksHWrshwsBanbmpy5QRxuWwjWBq8c9gs5XKlFGEt7qUXa
	 ODluilLF1wWr3BuoXP2FkcVgYomuu6cCYVThICeWQv1CgliA+zo6ZWJWjFSkYbyXsZ
	 bTDCTdsswUJY6qwyZSXqf/Zfo/vuqtRUYrXBJ9IaMOpnT96qSXkpj+vcceBduc1sF7
	 xUHO8g+s3kosw==
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 12:06:50 +0100
Message-Id: <DHBTCP3NHE62.3N96AD6O1L7CK@kernel.org>
Subject: Re: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
Cc: "Andrey Ryabinin" <ryabinin.a.a@gmail.com>, "Alexander Potapenko"
 <glider@google.com>, "Andrey Konovalov" <andreyknvl@gmail.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <kasan-dev@googlegroups.com>,
 <rust-for-linux@vger.kernel.org>, <llvm@lists.linux.dev>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
 <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>
In-Reply-To: <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>

On Wed Mar 25, 2026 at 10:26 AM CET, Alice Ryhl wrote:
> We do not pass -fsanitize-recover to clang, so for consistency we should
> not pass -Zsanitizer-recover to rustc. Thus, remove these flags.

Isn't this because clang forces it regardless? Is this true for rustc as we=
ll?
