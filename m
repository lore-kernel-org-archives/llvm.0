Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EC41AB50F
	for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 21:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726003779; cv=none; b=qmT05n9i7T+LTaWlag2K9z0YxUNSnLgdm50ivIzrWpxqo0MqvgSmZMUVJ72IqrP9YgKfnzvxCRVXBWfiD5FLl+9bTBIBgSehDnC3Lk+L0nNd1Vprl+Zak8yWUMx2UKLp3mcw41o96Ng9iuAeVkSznqyCRfQxzZiQ3QwdRmcD328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726003779; c=relaxed/simple;
	bh=Ynqn4nAJCQb3K91P/VTtiGu0x1IN7vkR3zg8XkgCzF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cyJkSqYloo0GUtJKV6liJlgMKQUSyOvmwc5sc4as5fLxCXVjlCx0yaDtlAmgKPBHNeIcqf5SGPiIXxqytI8/8Wv2f1hAgiFGC8sktHat94bw75v/TfU8Jlyvu94KdEBPBj1rZ/Ll8Yivy8XTqtE9+H7Qb3Am5T94co+ibOfkzns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=o+iCojLz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="o+iCojLz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 093BF4188E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1726003777; bh=zp8fJpAfCbl72Th6GiF5qBWF4ZzlCNk5ypC8iY8soVM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o+iCojLzgGJmKlIWeAfHi54FvVQk4yWSIqP6dI/9GOVgPRc007xVEPhTUsxqFNNQR
	 U9PmqGLY3+tWrQL7tDQtCklcNTLGTLeUwnGOAI4c76VrtyBC7fZlPAz2+Cpc+prkID
	 2WiTxRmXPUIktt2cwfaegWIFizznC+Ym3pmW5B5/QKQdYPpqV1qVhVWBtd0/gmi4Tg
	 iXqPy9T3oE9kuEijdU1W06g+WM5yf9b9B63dgcpGlTxVFzN4SAjKQdvpXwHBHbC4TS
	 mUOuJKo2WPOxWwkaoMMMyk/YBHCXfFhaHGN0ITozQvcIZJmwNHJEVOrDKgPHSwoSsT
	 SxbPge4UaDF9Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 093BF4188E;
	Tue, 10 Sep 2024 21:29:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>, Yanteng
 Si <siyanteng@loongson.cn>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: hust-os-kernel-patches@googlegroups.cm, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] docs/zh_CN: add the translation of
 kbuild/gcc-plugins.rst
In-Reply-To: <20240907070244.206808-1-dzm91@hust.edu.cn>
References: <20240907070244.206808-1-dzm91@hust.edu.cn>
Date: Tue, 10 Sep 2024 15:29:36 -0600
Message-ID: <87ed5r6vun.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Finish the translation of kbuild/gcc-plugins.rst and move gcc-plugins
> from TODO to the main body.
>
> Update to commit 3832d1fd84b6 ("docs/core-api: expand Fedora instructions
> for GCC plugins")
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> v2->v3: fix sign incorrect pointed by Alex
> v1->v2: fix comments from yanteng
>  .../translations/zh_CN/kbuild/gcc-plugins.rst | 126 ++++++++++++++++++
>  .../translations/zh_CN/kbuild/index.rst       |   2 +-
>  2 files changed, 127 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/kbuild/gcc-plugins.rst

Applied, thanks.

jon
