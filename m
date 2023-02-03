Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E3D29A8
	for <llvm@lists.linux.dev>; Fri,  3 Feb 2023 15:40:05 +0000 (UTC)
Received: from [10.101.1.132] (ip-185-104-137-32.ptr.icomera.net [185.104.137.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D3B76602F05;
	Fri,  3 Feb 2023 15:40:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675438803;
	bh=XT+0Kpt9XssEBiYGUgWT3AdMr3kbbqgonP7RwP555rg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jqigyZMGKF1YMfy+M2oXL0oSp/6I7w5pkpOU3i3Si9moEQiYAhgkMqXB0fkoSW7u7
	 NjQgGL+nOrkmPLk1OaplN8c9lrAUAG2WhfmyRdjK1U5y2jioHtp7RtwCMlyVoUbbls
	 kBdjhW3DlIPVLO4wfTiadlMK725n2idbJ9M3ymobNojR/HQ09vMwEx9/Lg4nEFT438
	 jlKbSixk95Adn2uEJlnJ8QUJCX993zS7JJcTUeBbq/kDNtOx79OWzDuTUpuloR0V57
	 ieGBIOGkHEjfLilDc1zEYoY2F6NhWpcnWi0wKS9GMuVWxGd7kO0KjinZ6RITp29G0s
	 EUJ5pHRJfF4EQ==
Message-ID: <6a7db0df-4f91-293a-35a9-2af77fa36dff@collabora.com>
Date: Fri, 3 Feb 2023 16:40:47 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] selftests: add missing ')' in lib.mk
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev
References: <7de08f7f11551d6b8195c3e5d801db2fae3f49a9.1660048017.git.guillaume.tucker@collabora.com>
 <YvKM/J5xO8gKto+p@dev-arch.thelio-3990X>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <YvKM/J5xO8gKto+p@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/08/2022 18:36, Nathan Chancellor wrote:
> On Tue, Aug 09, 2022 at 03:20:46PM +0200, Guillaume Tucker wrote:
>> Add missing closing ')' in lib.mk in a call to $error().  This only
>> affects LLVM / Clang builds.
>>
>> Fixes: 795285ef2425 ("selftests: Fix clang cross compilation")
>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Ha, I see Mark just came up with the same fix many months later :)
Shame this wasn't applied back then, for some reason...

Guillaume

