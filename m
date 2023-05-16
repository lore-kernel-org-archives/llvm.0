Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59950847F
	for <llvm@lists.linux.dev>; Tue, 16 May 2023 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=LcDzUZgb62SqJv2CsZRf1DXv52dMoUFQ0IMKsoDbAa0=; b=OvCIdYHrmvIK6DhkxUN0vWBNic
	WkgI3z/+JNyzIKmC1S8Tvsyx5V5HeYfavCFENeCWXJnRn87AO/6GwU/bhuQSQBTqd7rmS7jdk1jut
	R7zlAJEa37/SuN3flgyTUrevMXYt/oDLWPbmqMlxmod6CMJf68K8bqbpj57KFkjdUKMJaJMF8P2oE
	UDAgWlNbCWavjv2k/DaK2/dWRiRFfGAZCHwbrRBBr5jeifIdFH3Br2JvY0MvA8r+aEUAtVxkMY/pB
	bAhEGn0bFPzxVDc0A+eIuPPVnKJ1S7EsAEYEyXFqTB3WWXzGBhqmyp1A3bLyKV4m4O21CkdyOP66a
	jvtzFHdg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.94.2)
	(envelope-from <sylvestre@debian.org>)
	id 1pyyNV-002hQZ-Hu; Tue, 16 May 2023 17:22:25 +0000
Message-ID: <9a82866d-2d28-a956-8e01-30bf5b215f84@debian.org>
Date: Tue, 16 May 2023 19:22:23 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: debian builds of clang-17 stale
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>
References: <CAKwvOdn7S61csn2aCYiBVKKz497QyRsF6O2kqSH49zC_TVR2uw@mail.gmail.com>
From: Sylvestre Ledru <sylvestre@debian.org>
Autocrypt: addr=sylvestre@debian.org; keydata=
 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
In-Reply-To: <CAKwvOdn7S61csn2aCYiBVKKz497QyRsF6O2kqSH49zC_TVR2uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Debian-User: sylvestre

Hello


Le 16/05/2023 à 19:17, Nick Desaulniers a écrit :
> Hi Sylvestre,
> Our CI has been alerting to clang-17 builds being 8 days behind ToT.
> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/4986657460/jobs/8927651456#step:4:9
>
> I know the GCP stuff had some recent issues; is that all resolved now?
>
Yes, this part is fixed. it is now a long list of regression...

https://github.com/llvm/llvm-project/issues/62733

https://github.com/llvm/llvm-project/issues/62523

https://github.com/llvm/llvm-project/issues/62461

https://github.com/llvm/llvm-project/issues/62454

(and an issue with llvm spirv)

Not all of them impact unstable but they have been keeping me busy

Cheers

Sylvestre

PS: please use sylvestre@debian.org :)

