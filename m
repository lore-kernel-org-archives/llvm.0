Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3533082869
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 21:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722288164; cv=none; b=WQK7ZAsrbGnTgc5iSZuv7rstcwMeBMAeoBzIw4VqDyci0/ApyV7JP8xZEgAY5t3EalsnMPbZ/5A5n16lv0gxKNSMK+VNv+QsoTX9e0OHlsGFhkKBplUM3B7klNMOsngeWEV3A17hsxIy6fYThsPMx2PpHKeaAnFX2Rrl+bZartc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722288164; c=relaxed/simple;
	bh=R9AYkBOD/2XH88pLTZUnOyZr105dFQRdKQvbOfY7Zgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u4nl9/SPlHdSXqRxupipRAKXkX+2jc/35R23ZWaj5DLdu4J952fD/tDtMvmlgQ5vsFz/Ry+TvUS3VIHx7qt5trT2Kb+END+ocpynLk5Cpadhx3D18Ec9KzAEBq28HtqbEaU7nyT3xhYR4DcsRue1+fy+C5e5Ya7P9K4eP3BFhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EILztsLB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EILztsLB"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 52EBA418A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1722288161; bh=RyWZEF0uE9/GpLstC3B/M0wdGvTdWYuUuUk/b7Hmmtw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EILztsLBvixPKyKKQiXvht4WAw9bjPe5PsvtOjA7Qy4IBLaVa1wWZBbVHyqEq5ICZ
	 F9TRmffappnsBxtwjR/aWl7XIJ6+DbxayS0XcEaQzBBZcCBcINzbvn2w7DSrO83IP5
	 Cpo9jyWPXg/af4l6XEfe1kRiLqJWXaTju37ko5fMlKHXK6iDxy2syqGqXp/LNIjqLu
	 S64TJ/Vg/WbdgO0NdVaOOrMHrQtsj8wt6Y88b+t45Wf5W2pH79jhBVjfzbxZp+ulyb
	 /dSJrEYdXdadtg7PjMFOgS9xBiI7aYQUMqxf5Y8w+/DtUYSlf23aEE2gk+nlnIDLnd
	 0mr4mTOp3qJ4w==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 52EBA418A0;
	Mon, 29 Jul 2024 21:22:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: si.yanteng@linux.dev, Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] docs/zh_CN: add the translation of
 kbuild/headers_install.rst
In-Reply-To: <a17a7994657696fbba9c9be29c35629ef512f85b@linux.dev>
References: <20240726145754.2598197-1-dzm91@hust.edu.cn>
 <a17a7994657696fbba9c9be29c35629ef512f85b@linux.dev>
Date: Mon, 29 Jul 2024 15:22:40 -0600
Message-ID: <8734nrao67.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

si.yanteng@linux.dev writes:

>> \ No newline at end of file
> Add a blankline.
>
> With this:
>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

I went ahead, applied the patch, and fixed this.  Next time, it would be
nice if I didn't have to do that final step :)

Thanks,

jon
