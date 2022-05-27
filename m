Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0971FA5
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 15:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C537C385A9;
	Fri, 27 May 2022 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653663655;
	bh=w2NpgxycBt0MlxXt3B1Zn+UQJWJ0TS1e6pxN8egk8P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bK3T7dG5/k2NysuzvqujWInfNl0CLANvUvpi+c8CIZv6Hn5aN1yYEG9bjZQLe+RbW
	 6LrdLBsmidPVkPvTXUIHLv3G117tOTGXXdxU1PzChfvY5W/bGUCDojDoNoNexF1ZOm
	 C/xB/WknfheckSX/W3m4P1WrNu21YsdjClQSG5KVQv/B/X6qG6nOsUV5eCTvXO8M+j
	 wBVISt1eB1TzvzczPRIeg2HngrJx5y9xAV+iRm0Hw2Wxi/lyzR6e/CfOebL1ldiSM0
	 jX/2+y1P/u2CH9qLsdsXTmm4ERiLI/crehQ1AWDVhAOZWOwBMyHSN0v5XCEG+5CTeb
	 TlLwMG5+cQI0A==
Date: Fri, 27 May 2022 08:00:53 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>, llvm@lists.linux.dev,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v7 1/8] kbuild: replace $(linked-object) with CONFIG
 options
Message-ID: <20220527150053.4khs5rlu4vetoxca@treble>
References: <20220527100155.1996314-1-masahiroy@kernel.org>
 <20220527100155.1996314-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220527100155.1996314-2-masahiroy@kernel.org>

On Fri, May 27, 2022 at 07:01:48PM +0900, Masahiro Yamada wrote:
> *.prelink.o is created when CONFIG_LTO_CLANG or CONFIG_X86_KERNEL_IBT
> is enabled.
> 
> Replace $(linked-object) with $(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT)
> so you will get better idea when the --link option is passed.
> 
> No functional change is intended.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh
