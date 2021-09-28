Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A82FAE
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 11:01:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EE476108F;
	Tue, 28 Sep 2021 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632826903;
	bh=4elokg0o9FH5+5sHoV+DUogyPycs4wXHfkpt86cNSUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5UfLHldW5pMxfvjMDqb2cc03GF+hikMXPc9WstlfWt2CclOBSFd9Clp61OC/kE8M
	 IfrCo8rmlIfWZBc37ND0v4pKb3+1H6+9quC6YUU8p1EmIBv1R4lqw3IbUBORvs3f5T
	 WZm746V0PdiAyaB3GO49VNjXOELsRsvulnchZwvP6K7H7IY52woWEhiIJKsOBIW5mF
	 x2Gx7CWToHGAuNZGIGhjFxgcoAtoyyKiL7FD6HUPqbHQZFrcDY+kgZEnMAXzyAf1Pc
	 wAWtt7yldFIBXqLdCDYSA66KV3chOYX4jzWutV7aiXF+yW+6qEnjvhVgKrNjvEIomy
	 Wq2PL66XVz6lg==
Date: Tue, 28 Sep 2021 13:01:37 +0200
From: Jessica Yu <jeyu@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>,
	Sergey Shtylyov <s.shtylyov@omprussia.ru>,
	Sami Tolvanen <samitolvanen@google.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] module: fix clang CFI with MODULE_UNLOAD=n
Message-ID: <YVL2EXeCKA3Leng+@p200300cbcf144d003adeadfffec0265a.dip0.t-ipconnect.de>
References: <20210927121541.939745-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210927121541.939745-1-arnd@kernel.org>
X-OS: Linux p200300cbcf144d003adeadfffec0265a.dip0.t-ipconnect.de
 5.13.8-1-default x86_64

+++ Arnd Bergmann [27/09/21 14:15 +0200]:
>From: Arnd Bergmann <arnd@arndb.de>
>
>When CONFIG_MODULE_UNLOAD is disabled, the module->exit member
>is not defined, causing a build failure:
>
>kernel/module.c:4493:8: error: no member named 'exit' in 'struct module'
>                mod->exit = *exit;
>
>add an #ifdef block around this.
>
>Fixes: cf68fffb66d6 ("add support for Clang CFI")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks everyone!

Jessica
