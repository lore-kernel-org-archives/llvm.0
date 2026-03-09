Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13DD3B5842
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074388; cv=none; b=YFe2D3taCNh7RFvTHBs3Q0/S7GRFPoGQzCLnNwlw661gJzxo6wTfpwWmY2JMsd6YSK+XuCvWzy4zauCSB1uqboEWRnkXl7jUhUafU1vDLNeZ/5ETX31ji6yMmRXEm5WZxNrhmFXXXMpIOZ8XcxO98a3NYIJrKrEqma34meZ9YHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074388; c=relaxed/simple;
	bh=bXYSkHY17HtECgpDQua1zdQqh0CmVbiJL+TdSR4Lw+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CRguDXycxNf5bRVIEbUIFhyG2PcN8X0Zo/jr60e5cQoWFl1PRG21RWrxTqVzX6WM7KfGrERfIhJKHPED74Xl5verEfYBcf6A+mrSois9r4DsXzA8XdceU8BzGr4Hr/dVHSRpErrOHf5NQIWJmnsatY2zNAnHtZGuU2TvsFumJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ue6ZOJpF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ue6ZOJpF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 04D1E40C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773074387; bh=IHcXnOJGe4wi/1j99x89ioNGBTSZLhQ504eFvqa86O4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ue6ZOJpFeisd/rkz0nG+XaKXo2SBAxu02lcrMfuatlB1gZHPEEFeZp5J6cWHwMhHC
	 VaLxxOut7dKRtPkkJECMxC2oFMjlygtfU4vV7yHpKcP/dK8UFvURrJ8S+/BDvu6qPz
	 8SXy4DMPj0E9ZIpVyxGrVh9blnc+k1l3am0NzuAk6+3t2RWOUKvh5WzFN5t4EizOjE
	 ESk8TmE+ZXTINj6nzDgCCOrnwGKqnUtUtGanphuq0SmCJ+t0dEa0+GQB1GVHy4MMUG
	 hKrRoALj1dTgaCDUWXxeW3XyjtljEmhos7UpFNsJ9/UhZQfpA/U+ouqWG9o/ZBmN1D
	 cmjf86XBSg0mA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 04D1E40C9C;
	Mon,  9 Mar 2026 16:39:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haoyang Liu <tttturtleruss@gmail.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] tools/docs/checktransupdate.py: add support for
 scanning directory
In-Reply-To: <13926087-127d-423e-a4d6-55b8aabb32ce@gmail.com>
References: <20260308111314.27333-1-tttturtleruss@gmail.com>
 <87zf4hvvep.fsf@trenco.lwn.net>
 <13926087-127d-423e-a4d6-55b8aabb32ce@gmail.com>
Date: Mon, 09 Mar 2026 10:39:45 -0600
Message-ID: <87sea9ufce.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Haoyang Liu <tttturtleruss@gmail.com> writes:

> On 3/10/2026 12:07 AM, Jonathan Corbet wrote:
>> Haoyang LIU <tttturtleruss@gmail.com> writes:
>>
>>> Origin script can only accept a file as parameter, this commit enables
>>> it to scan a directory.
>>>
>>> Usage example:
>>> ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools
>> I've applied this, with one tweak:
>>
>>> +    else:
>>> +        # check if the files are directories or files
>>> +        new_files = []
>>> +        for file in files:
>>> +            if os.path.isfile(file):
>>> +                new_files.append(file)
>>> +            elif os.path.isdir(file):
>>> +                # for directories, list all files in the directory and its subfolders
>>> +                new_files.extend(list_files_with_excluding_folders(
>>> +                    file, [], "rst"))
>> There's no reason to break that line there, so I took the liberty of
>> joining it back together.
>
> Dear Jon,
>
> Thanks for pointing it out, I didn't notice when I make this change, and 
> I'm sorry for that.

Not a big problem!  Thanks for working to make our tools better.

jon
