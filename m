Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3E192D7D
	for <llvm@lists.linux.dev>; Mon,  4 Nov 2024 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730749290; cv=none; b=J0dN6k9wcT1+FmCItCgzToooc/9CHFbtpOH+2RFt31seeazdRDgEsZC+Uy4i7bUO2Jv9mKdSKrcTxn2gINCNjyzA4hokaEFQd6m0Abd7RIHsy11vvf3OJfkqJ8WuewIRg9TZDOo9SOzfk2zkvGHt1QIBpPwASux9QkgxxzHFdF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730749290; c=relaxed/simple;
	bh=TlfnKi73QV/9wCkfGcRyEygU9J9eNazH15v8tXAdF3o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bB5CqjQKq0rDrjttBtpEYChQ+pUq8009dR92Qm2PMdbZtPo0lGjJvtT2I4L3fdtRKRsYJahWm9Rvg0dyPVVJ04edxJ2kS87s42vuRBPtAQjnB8bCl3673Us69gh6Nz1mUK9ZRwqwO89cnNF2RkRoSc7z55G3ZAoy6z8sdNpxqFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=n8PZ+lvd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="n8PZ+lvd"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 479A142C30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1730749286; bh=/IFed8QuxmGzZBbHkfBNbEfyJ1RoaIBovaPG1f0VPG8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n8PZ+lvdV9S8DRrV5uughGMOtaA9H3oWENpGvlYt/sC2JQoufU1tcxY54Ptc9v2tC
	 GZtZM7inLdMb3Yg6hJr21LWAY5u/TYR1V1M6N1BZY2JeX9pA5Rh22sWTTP11xVydlV
	 L7aqqZFthR/iVCvg+akLG1EMYJDr6AW0o1X4BsrOEOZkeVwA3GsWdm8ywJvgXzrxTr
	 8KUmLUeJrUFWIT5li55End9O/KFWWamMROt8jQEW913d5F3fFqJ4B0dhJS6qa0namB
	 gziO8YJDsdCDAuzVKp0LxwQQMp79ykXyEG6y1/rg0UiUVae33IF2xZ8VT1JDZUuraP
	 XHhzFLoqK0O/A==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 479A142C30;
	Mon,  4 Nov 2024 19:41:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <dzm91@hust.edu.cn>, si.yanteng@linux.dev, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] docs/zh_CN: add the translation of kbuild/llvm.rst
In-Reply-To: <20241023153235.1291567-1-dzm91@hust.edu.cn>
References: <20241023153235.1291567-1-dzm91@hust.edu.cn>
Date: Mon, 04 Nov 2024 12:41:25 -0700
Message-ID: <87wmhi7pne.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Finish the translation of kbuild/llvm.rst and move llvm from TODO
> to the main body.
>
> Update to commit 145082ebfcf0 ("Documentation/llvm: turn make command
> for ccache into code block")
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  .../translations/zh_CN/kbuild/index.rst       |   3 +-
>  .../translations/zh_CN/kbuild/llvm.rst        | 203 ++++++++++++++++++
>  2 files changed, 205 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/kbuild/llvm.rst

Applied, thanks.

jon
