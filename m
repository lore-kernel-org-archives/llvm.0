Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DBA2F38
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 17:00:01 +0000 (UTC)
Received: from [192.168.0.107] (cpc108961-cmbg20-2-0-cust263.5-4.cable.virginm.net [80.5.129.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 78F7A66019AA;
	Wed,  6 Jul 2022 17:59:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657126799;
	bh=REOjlu9aoBHmLCEHo1/8HYG9HnPzjIy2CPbchIRfe6I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ViJKcOz/wU9PVKlFqvSw0oSsJUq0sZ7CBqkd85r0a3a6OGnI4HFP+33hBBdlOSYCu
	 W183nV7PDo7nq1Nj0kpl1lPAHvxbYfvtyPa3MF8YAtqDvEP/+kHjw5vRFQ771abRaH
	 CW/3mpP3Wporm6l4YxyQ1VJS4BoOYlMWxjxs1D0ZzuVbh2Qu2DGFszqDb05Xv6Ds8C
	 Fq1XbLD7jTbWVEhnJkFfWc2karjbyiR3nccvLhQbDJ/9ht4US85EvUxr3WhouprNJk
	 nlraxIuFj0xwoYiXQwZvx7PFbOZbFJmLKgEllKgsLLPP5+qSQKY9w/PRxYObR4TcQD
	 ty1+XE/SoipBQ==
Message-ID: <6bbe39f5-a8e7-0b42-1ce9-6d32bbc33096@collabora.com>
Date: Wed, 6 Jul 2022 17:59:58 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: next/master build: 205 builds: 8 failed, 197 passed, 21 errors,
 52 warnings (next-20220706)
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, "kernelci@groups.io" <kernelci@groups.io>
References: <62c5b563.1c69fb81.1240a.62b2@mx.google.com>
 <CAKwvOdnusz+AjYzkW4pyHraJ1_exhwAz9bscMkRiqjiXRj+66g@mail.gmail.com>
 <YsW9la1mD0CneH4b@dev-arch.thelio-3990X>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <YsW9la1mD0CneH4b@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/07/2022 17:51, Nathan Chancellor wrote:
>> ^ interesting, these look new to me, must be from the new CrOS configs.
> No, they come from the ARCH=arm allmodconfig with GCC 10. I am in the
> process of bisecting the exact patch that caused these but it is likely
> commit 85f4bc0c333c ("drm/amd/display: Add SubVP required code").

Ah OK.  We should enable KernelCI automated bisections with
builds too actually since it's not entirely trivial to do by hand
and in particular with linux-next.

Guillaume
