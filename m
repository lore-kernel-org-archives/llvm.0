Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A46F13FF7
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 08:27:57 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD4F266072EE;
	Mon, 18 Sep 2023 09:27:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695025669;
	bh=0xZU9+BT1Lhziqj2peG186RnTVEcjM4RamFlwc9caGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MCpXWpONy0BtkabzIDxKDZdBpclb4KkEO/vjdiqSRSgOHkRqs5VNUf+0IHZZbqH0M
	 /ThenAX6gk3cHjl8PWjJi5TIhQ079I4XgooYj4242puGEmZxRvwUmWhHZFE5AmJpXr
	 ORZtBymDne4IYqhlQ1R/QdHE2t9Qit3dqRD439i4wlJBAaQlKb1zLcxp39+PckL9YB
	 nu94/qKIEKzqSCn9Zm41J7txDh35e7GHSSVVn/g8k1VBoiJz/3ZGD2dUffJGlf9w51
	 JLkn7z1KFZppAxaC/KIp9MGLZ1MjWHILB5YhduiOD1DFe1dAAdyqZUv8QLvf/+TRvy
	 8Tlz+R9eNyBJQ==
Message-ID: <c2664bc3-d932-8340-b0f6-8fb1f1604464@collabora.com>
Date: Mon, 18 Sep 2023 10:27:45 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] leds: mt6360: Annotate struct mt6360_priv with
 __counted_by
To: Kees Cook <keescook@chromium.org>, Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene_chen@richtek.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201020.never.433-kees@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230915201020.never.433-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/09/23 22:10, Kees Cook ha scritto:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mt6360_priv.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Gene Chen <gene_chen@richtek.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

