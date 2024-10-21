Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ADE139566
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 15:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729524227; cv=none; b=c8odcJwBkxSrcfeVsIuNnJGqA8dkYgedjpGIFoIEuWc6G+MZvoqhRzhBSnEkMqVmjUH5L/bvxEIBNbOOEK8ld1/2tpMMAVVaEcqRL4ZYsuR+jwYKkdGklkWAaCMNPxNaZ6a6BMujSaJe3jS7G2veHAg363pyrVc97f9fK2bmdHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729524227; c=relaxed/simple;
	bh=7pU6vkbGnprUGktKk+a7ZZkR/p1JECpfVOIKBVS7138=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A4dEg1AF0TjeM6NRcE0Uv+xf/arWygGt+kwd9YH+CoE4WvGynCoTR52D0/XoGREjRjcc3BvhdZD2pyp2m226E1aafYBR+xr0C1tS6F3P8qrlEWgPcxWfq3/9Z4hVuNwQpL8uBb0QAkCO9zncb4q1aPThZLzLl0xvDlgCRuNFbZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SR2aVyJn; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SR2aVyJn"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C300642B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729524219; bh=6Jw+esIEWfg5ZWvEfD6M9DRTfBpL3wluszkI2M9kyEE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SR2aVyJnFE8EsbjVIj+P96LTeY7Ae6IuZrPA/LARPe+Hc6zGWAYSqn/J8bPy9S11q
	 SG5irqhZ/M2XlFX42+5ARCR5qojEK+b4N/4weECBK4Zdx90fXzEwSSdgUsR4/I4HX3
	 e8TWml+R+mgJilv80nffXDC5ezMwi/sKTD8HingrRQN+YGjBM4Lbc4NoUDxe8Vxpmo
	 tOzMp36QwiJ61x+jjqN7ih4WkK4F7/WLAuoHMCHfh6tzb9R9mC82SG5VrS2sb0E5sf
	 l1LlKiVnJP79bS4HFA2fpRuCWr7XqCuseAPw7wHGm4XcytB+Gag98sCm4OTcDPitXV
	 mZysEx04FGy7w==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C300642B3D;
	Mon, 21 Oct 2024 15:23:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haoyang Liu <tttturtleruss@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, Haoyang Liu
 <tttturtleruss@hust.edu.cn>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] docs/zh_CN: add translation of dev-tools/kmsan.rst
In-Reply-To: <20241019142243.88712-1-tttturtleruss@hust.edu.cn>
References: <20241019142243.88712-1-tttturtleruss@hust.edu.cn>
Date: Mon, 21 Oct 2024 09:23:38 -0600
Message-ID: <87v7xltr7p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Haoyang Liu <tttturtleruss@hust.edu.cn> writes:

> Add translation of kmsan.rst and remove it from TODO list.
> update to commit 3f53d1b4a4d2 ("docs/dev-tools: fix a typo")
>
> Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
> v1 -> v2: fix incorrect translations
>
>  .../translations/zh_CN/dev-tools/index.rst    |   2 +-
>  .../translations/zh_CN/dev-tools/kmsan.rst    | 392 ++++++++++++++++++
>  2 files changed, 393 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/dev-tools/kmsan.rst

Applied, thanks.

jon
