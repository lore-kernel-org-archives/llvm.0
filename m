Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB013328C2
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 13:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8A0C433C7;
	Wed, 20 Sep 2023 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217098;
	bh=MyCAno+Typ3Yr4BLMU6h3QlWS7zHWSznNBq20IG/hZ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HYPx5Cw7siByQfRBmkfiJTGU5/KSdXUe/j1JzXgKgppFCoVKP66HFQzjd64sQeJpc
	 VlHht7kihGKDlwmVgvwOeI4Z1X3SLXX60sr+PTYw3cw1qgfWyT4+ePPLS3MNMmY7NU
	 9soxYAvvyL1QEBhiiWll89mC77slQPV6UyRtE9SrijgovvPAYz+vS8PlMqm9xCqq02
	 b2jmvtLACPXjFQlLOS5BqrP4WmNeF22abOfpBlKaAas9tzlO2amypxoy/fpok91LE2
	 7VT9HJbRgHkABUBGS4HCjU73momCRPHXRQV6OiqXRqxWHb6YbrjhGDK6cKfmYv/NTZ
	 gLwxMUIHkc+2A==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20230915200955.never.871-kees@kernel.org>
References: <20230915200955.never.871-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: el15203000: Annotate struct el15203000
 with __counted_by
Message-Id: <169521709594.3441150.12806820197236573672.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 14:38:15 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2

On Fri, 15 Sep 2023 13:09:56 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct el15203000.
> 
> [...]

Applied, thanks!

[1/1] leds: el15203000: Annotate struct el15203000 with __counted_by
      commit: 1d6d5c03fabeb5e5bb7fd7ac3319a8c5471be9e8

--
Lee Jones [李琼斯]

