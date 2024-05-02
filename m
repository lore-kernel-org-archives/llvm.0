Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E8515E7F4
	for <llvm@lists.linux.dev>; Thu,  2 May 2024 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714667306; cv=none; b=ZHnTCt3RYLPnrjzENog+wv8ydBUboO3dDA30HVsClA3twiWdXY5IxjNiRL5L0dkXEp1RFRMv3KjppO1UQc9cxwlOX7zncyDUjLsyPSUB2HkC6o3WBmRs0Ob5JOgo5Gr4jBQy6u4iO3UmPBIR3+LKySzIPBw98UlbGx9KW1cUGZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714667306; c=relaxed/simple;
	bh=cPAEAfZCFpHr1ejRgb5jMikPnd9naocdSVNVeAIcaz0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GucXTZbps0QjCXwxTdT8nOg4RWgfWFD2uBn1tLCrUCr87ov9VGJLA0ynd3D2wtIh0IQcFgqk6s2lDrkdTqIgUWa8ZEOiw726GPcG76KBeuOZKg+UoZkyArexaG7n6L2zjxlH97Gc6R390kKSQFTE5NdG3xRcgk2SU0OKRfJP7oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TC4uuHDn; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TC4uuHDn"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7F33B47C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1714667304; bh=6NmphtOhLUKQV/7zjuo/dnNPm6FaMp7K+BhXaJtid6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TC4uuHDnmhk3UDHlhiT7ovVqoaDTSwH3U0yf3y+FPMYwJ9eB8yUeKCsaKC1T0qQbq
	 Kw6Dq7BcKG9c4pDutsrHF0Y1NOgp8/EPWGWJr1dp0yLVIbiOyPtFf8Ez8npApSmHqm
	 X1HGvsdylwT/Y/CIN44D2uA+kOmqdID75ORx6AvjmvqKkvffMqr4oI7E/EG0FYyoIR
	 4ssni4SOdHQ7ClzWxHLQEr4jSV10TF0X28TLqTHbW21BghKukRZJZaNSMlednilKZ9
	 JDG+siloQmn4apBo6A5+QA4hm0KIR0YOHJLPEl86EKcOyGIaj2oSahMpk3SBhidp7V
	 DVLjxtwAlm/2Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7F33B47C39;
	Thu,  2 May 2024 16:28:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yanteng Si <siyanteng@loongson.cn>, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 alexs@kernel.org, dzm91@hust.edu.cn
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to
 6.9-rc4
In-Reply-To: <cover.1714113680.git.siyanteng@loongson.cn>
References: <cover.1714113680.git.siyanteng@loongson.cn>
Date: Thu, 02 May 2024 10:28:23 -0600
Message-ID: <8734r06uvs.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yanteng Si <siyanteng@loongson.cn> writes:

> v2:
> * As Miguel's comments, translate commit 01848eee20c6
>   into Chinese, as well as commit 81889e8523e6. By the way,
>   these two patches haven't appeared in the doc development
>   tree yet, maybe we could consider merging them into the
>   rust tree?
> * As Dongliang's comments, translation "=E5=9C=A8... =E5=89=8D=E6=B7=BB=
=E5=8A=A0" other
>   than "=E5=89=8D=E7=BC=80".
>
> v1:
> The Chinese version of rust seems to be way behind,
> even though we did translate to Chinese at the beginning.
> Let's keep them up to date. :)
>
> Yanteng Si (4):
>   docs/zh_CN/rust: Update the translation of arch-support to 6.9-rc4
>   docs/zh_CN/rust: Update the translation of coding-guidelines to
>     6.9-rc4
>   docs/zh_CN/rust: Update the translation of general-information to
>     6.9-rc4
>   docs/zh_CN/rust: Update the translation of quick-start to 6.9-rc4
>
>  .../translations/zh_CN/rust/arch-support.rst  | 14 ++++--
>  .../zh_CN/rust/coding-guidelines.rst          | 12 +++++
>  .../zh_CN/rust/general-information.rst        |  2 +-
>  .../translations/zh_CN/rust/quick-start.rst   | 50 +++++++++++++------
>  4 files changed, 56 insertions(+), 22 deletions(-)

Series applied, thanks.

jon
