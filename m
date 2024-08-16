Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480EE1448E0
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723847324; cv=none; b=IpYpK8maEh9uVAnfmKjUd1Sa56rqElQ9apq8z9nktMQrn5fcsPnKBbBjqkN+NBMdioawYX27TjKdv7JbqlmNQzRUBzpGg3b2Ip90qA9QmXnEcMhMiVzMW7QcaSz/agukfqorumkVZq4EXJzEGKuUEkMzxPWraP/tMqxs9N9XVF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723847324; c=relaxed/simple;
	bh=ADhPSC1RhrKTMeythfJmEvj3BHtdnbZi/eyzE1FFOkM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G435E/ISKdPJ+yfrWGy5bi81QL1IlFz0lTKveasdUX28sIkmhsJwocu4vbnrmNTI1l6ofUWVE6UAY+wWctRxjVT/YCeU/Pv/pCT+2yv/q3boiAerYnwaU9Z6Pq0lOlMsxDFbqKp+gYoMY5G2JO59VUSI7jiLQfWefHxQkvuxG9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hHwHpY00; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hHwHpY00"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 34957418AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1723847322; bh=GKR9Vn7868L+Axm2dm3bCL+LGD3nmVjIy+IUhUe3Va8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hHwHpY00zu+RpXn5tp7iWafFG6zdVWc3K9z3CauGEOnQcWHbIiacd+qsHE2nk1a/A
	 knjpA6zn8kHJPdF51hVcrGhipgu5cyLl6bFEPu2w0KQwAQzHgT0csCXtzXnOU3c8jv
	 vw3n02Hr0Z8755fgj80rDCJiW2ivxRi0194I+wKjhom2PcZNm7vG4v58zre0VC4ccA
	 8nbQxAfv9eo5j3R1dBHthwFh5MXj5HUSHHdcEXPszDgBGFefWCJVojQ7W3E2B5CefM
	 +zqmKoxPnBGbpMzg7+YkAa7g+p6l0rGiMowVQ9WgI8vWHuOyM85vSKj0PW61Bk7q2T
	 BK9Xu9qruyxmg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 34957418AB;
	Fri, 16 Aug 2024 22:28:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haoyang Liu <tttturtleruss@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, Haoyang Liu
 <tttturtleruss@hust.edu.cn>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6] docs/zh_CN: Add dev-tools/kcsan Chinese translation
In-Reply-To: <20240810082245.5934-1-tttturtleruss@hust.edu.cn>
References: <20240810082245.5934-1-tttturtleruss@hust.edu.cn>
Date: Fri, 16 Aug 2024 16:28:41 -0600
Message-ID: <87ttfkhzl2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Haoyang Liu <tttturtleruss@hust.edu.cn> writes:

> Translate dev-tools/kcsan commit 31f605a308e6
> ("kcsan, compiler_types: Introduce __data_racy type qualifier")
> into Chinese and add it in dev-tools/zh_CN/index.rst
>
> Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
> v5 -> v6: Fix a typo.
> v4 -> v5: Translate link into Chinese as well according to reviewer's advice.
> v3 -> v4: Added original English text for proper nouns and modified some unclear experessions. 
> v2 -> v3: Revised some sentences based on reviewer's suggestions and updated the KTSAN url.
> v1 -> v2: Added commit tag and fixed style problems according to reviewer's suggestions.
>
>  .../translations/zh_CN/dev-tools/index.rst    |   2 +-
>  .../translations/zh_CN/dev-tools/kcsan.rst    | 321 ++++++++++++++++++
>  2 files changed, 322 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/dev-tools/kcsan.rst

So I applied this, but ended up unapplying it.  It adds a whole pile of
docs build warnings:

Documentation/translations/zh_CN/dev-tools/kcsan:223: ./include/linux/kcsan-checks.h:370: WARNING: Duplicate C declaration, also defined at dev-tools/kcsan:370.
Declaration is '.. c:macro:: ASSERT_EXCLUSIVE_WRITER'.
Documentation/translations/zh_CN/dev-tools/kcsan:223: ./include/linux/kcsan-checks.h:419: WARNING: Duplicate C declaration, also defined at dev-tools/kcsan:419.
Declaration is '.. c:macro:: ASSERT_EXCLUSIVE_WRITER_SCOPED'.
Documentation/translations/zh_CN/dev-tools/kcsan:223: ./include/linux/kcsan-checks.h:451: WARNING: Duplicate C declaration, also defined at dev-tools/kcsan:451.
Declaration is '.. c:macro:: ASSERT_EXCLUSIVE_ACCESS'.

[...]

You really do need to do a build test before sending changes like this.

The problem is the duplicated inclusion caused by the kernel-doc
directive:

> +.. kernel-doc:: include/linux/kcsan-checks.h
> +    :functions: ASSERT_EXCLUSIVE_WRITER ASSERT_EXCLUSIVE_WRITER_SCOPED
> +                ASSERT_EXCLUSIVE_ACCESS ASSERT_EXCLUSIVE_ACCESS_SCOPED
> +                ASSERT_EXCLUSIVE_BITS
> 

We really just can't do that with the current build system; the best
thing is to put in a note saying to see the original document for those
declarations.

This would be good to fix, perhaps with a variant of kernel-doc that
doesn't generate the duplicated declarations, but until somebody does
that we have to work around it.

Thanks,

jon
