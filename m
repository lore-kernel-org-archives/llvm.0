Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FDE328C2
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 13:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18C1C433C7;
	Wed, 20 Sep 2023 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695216965;
	bh=ZxkDaX0Z2lxf8j4cvuVarbFGbN+WP1U04C+ayh/pOro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RFeQnBCv2wx9+qW//lEh5zRLWduWtBK1fhB1YMNTtVOA55nrez/NvJrThIFR1veat
	 kWzWF3o0x9wi17/xFQLD/E603t1PafK67N4FCqaim8Xwo8JIP/EJTxKUiPGc589TzS
	 HRPLFFCZGSri9Cs+20bB7rM1IsWdvBiQcdhHqXTXv0RVZSq9LzweX23GOSwqTnlrNC
	 0wL0y+JSF7qFHb81eaRHi0fhsE3QN/evL9IpjWPd/mgB+p3VA4PpZvxds1NdfBEwgP
	 5dHBc9S8pf8whTX3YBI+KJRxknwF1dmCKoT3TU5hAj9ji33RTr7lPmXhgq4teHCGas
	 T5hmYA+oRF0aA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20230915200948.never.728-kees@kernel.org>
References: <20230915200948.never.728-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: cr0014114: Annotate struct cr0014114
 with __counted_by
Message-Id: <169521696355.3440140.11697535957050657885.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 14:36:03 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2

On Fri, 15 Sep 2023 13:09:48 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cr0014114.
> 
> [...]

Applied, thanks!

[1/1] leds: cr0014114: Annotate struct cr0014114 with __counted_by
      commit: dfd75548c30c4a27bcc4c81aed0287d2e8b62add

--
Lee Jones [李琼斯]

