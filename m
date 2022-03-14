Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B356AB3
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pMJTaScS4byrcx8FOghvfu/S1us65v7BrF2Jbfl4qTg=; b=NH/fSe+V6fhCP8oc91us13bAUZ
	egzjpYUV2TI7Pj2K0OvioWzc4btSc1Uhx0tsK4DWvigkUJpy/CbqJUS9Tnhk6IehO7dHtAXUH1xna
	/aMj3Gq88il5cb4yj8u7JVoGfqMH3xZOe/syBoWEjdha1Mr4TZHKXDN3gnpZlpMMEnGp5IxA+XYZr
	IEM1coren+qQvIgrVnL8931g7IlfJ/cgtpS3fYEkgxfV+YaJAuDG9Rg/L9YTUSOlHN+9LbSbWXXne
	eelF0Qt1Q2607RACjEFT25m0RRkqp9Mu6I8S7d7ZvKDCy9YI0DKOwuEzUxpPThqwn/A43Cjl1lgZS
	evub9vcw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTr4i-004N9Z-CO; Mon, 14 Mar 2022 20:13:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 56B59300325;
	Mon, 14 Mar 2022 21:13:50 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 13275203C7999; Mon, 14 Mar 2022 21:13:50 +0100 (CET)
Date: Mon, 14 Mar 2022 21:13:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] x86: Avoid CONFIG_X86_X32_ABI=y with llvm-objcopy
Message-ID: <Yi+h/h6xcTQBdQBY@hirez.programming.kicks-ass.net>
References: <20220314194842.3452-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314194842.3452-1-nathan@kernel.org>

On Mon, Mar 14, 2022 at 12:48:40PM -0700, Nathan Chancellor wrote:
> This is based on -tip x86/core and I would like for both patches to go
> with the IBT changes so that there is no build breakage.
> 
> Masahiro Yamada (1):
>   x86: Remove toolchain check for X32 ABI capability
> 
> Nathan Chancellor (1):
>   x86/Kconfig: Do not allow CONFIG_X86_X32_ABI=y with llvm-objcopy
> 

Mucho gracias, I was indeed seeing a lot of that. I was also in the
process of rebasing that tree, so I'll stick these on top.
