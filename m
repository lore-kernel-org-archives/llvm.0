Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D174D3BE160
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 16:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072448; cv=none; b=dSN2T1fo6CBuyZ/J9BW+cVB4x7uQdVhHZu7XyY4CSvmhOKd+ygEJ3z5Tf4TM2jJc/weBcKMQT/QKOGLc9TBwt0Oaxd8XhAZp+SlSUzWgux+mw9IVVDJi16qk6QbCUoeFhvtnPyQ3sAqQwAE2ULrvbnyxyfA+yYXlOao17iJnr7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072448; c=relaxed/simple;
	bh=IpP2F3lWUTFrCZtkUJ3fvVhCFT1noQrwi4/6IxRJCsA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Km7EhqMx2cDWliPikiyrdge5U6HEkcLoR+mZGbE3BTNbNe2UZlpuAHwopv2CC+6S9hldh17O89gEHxDuCp5dSsPEJljGXrX2t0kHnqKS3NAzc+x5Jx0Bk49DokJvuCOCfK4bvE1lLpTCxQvehVWF62omQ+eiJZqZhf0zKYybHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jmioQdSO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jmioQdSO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 32A3440C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773072447; bh=auyBzhlqUYO96+vk8KXycuyCg5IcOb8m2GbAfTCJnCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jmioQdSOpAyfUi6XMxJxWxrvm2gi8zxU3WF6wi6b76kI8u4ZWW5EFlK0hN9BPU2Cu
	 Gmcm6JQWXuceErVijgMythgM9WQrm0JTIIIbmypWt43rcBA3QYLhAinW/zGuvtiIWz
	 3NSUpj0Xzj0CawzXOXLocFzVohRrbtcPn3knXeag6UaMHA1Jrl56fNMMf2GrvZebjX
	 nNowWu8TMpim6sQPXTLi4UMkiz3XMu3ME19qh0bnChHSXnwUMlUOPS62+d23sFtCZF
	 svJNEThmhNDC4NAPOUvKGqsO9cvX5twcWbshP+sAiU2//tcVgMWVXLohI23I22bsKj
	 9kk/Q3a3car1A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 32A3440C9C;
	Mon,  9 Mar 2026 16:07:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haoyang LIU <tttturtleruss@gmail.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>
Cc: Haoyang LIU <tttturtleruss@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] tools/docs/checktransupdate.py: add support for
 scanning directory
In-Reply-To: <20260308111314.27333-1-tttturtleruss@gmail.com>
References: <20260308111314.27333-1-tttturtleruss@gmail.com>
Date: Mon, 09 Mar 2026 10:07:26 -0600
Message-ID: <87zf4hvvep.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Haoyang LIU <tttturtleruss@gmail.com> writes:

> Origin script can only accept a file as parameter, this commit enables
> it to scan a directory.
>
> Usage example:
> ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools

I've applied this, with one tweak:

> +    else:
> +        # check if the files are directories or files
> +        new_files = []
> +        for file in files:
> +            if os.path.isfile(file):
> +                new_files.append(file)
> +            elif os.path.isdir(file):
> +                # for directories, list all files in the directory and its subfolders
> +                new_files.extend(list_files_with_excluding_folders(
> +                    file, [], "rst"))

There's no reason to break that line there, so I took the liberty of
joining it back together.


Thanks,

jon
