Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A626829B0
	for <llvm@lists.linux.dev>; Mon, 17 Apr 2023 18:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245CAC433EF;
	Mon, 17 Apr 2023 18:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681757728;
	bh=jpvGVC73BKKb3zx3vqvMtfK1QJtXKHouU9cI0yUXfAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nOK8sMjEU4Wb4MD/qUb4cZSsCxNFAA3MKO0hekNxrSMI973fsTIRwQbtfPWlHiUOZ
	 CL1UxIVw2mK5N1SyVVJufbiWMVt9zAvrnGQrLsb2Y/VP+C5vRUX0/K+H772BxBrnqW
	 gV76kKx1vWJgQ/GSQMsAmsvKeNWqBpQZAejLoQVL7+2ISot2MyJVxgxHl3mzMKqghK
	 fSxQgS/yktU520k2AyHVAefJzS0Vv3xSOSgHn0ZyLM8JVhlOjLNY2YlcF7yE6WZqp2
	 nUASHScS5EGGleflSPArRKwjWGJOmiX0SIfs+JOLrRUXEE4PGZke7FTHmbREz9aX/P
	 SCV2DFfCIIaFw==
From: SeongJae Park <sj@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	llvm@lists.linux.dev,
	Vineet Gupta <vgupta@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH] [v2] mm: make arch_has_descending_max_zone_pfns() static
Date: Mon, 17 Apr 2023 18:55:25 +0000
Message-Id: <20230417185525.1420-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230415081904.969049-1-arnd@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 15 Apr 2023 10:18:20 +0200 Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang produces a build failure on x86 for some randconfig builds
> after a change that moves around code to mm/mm_init.c:
> 
> Cannot find symbol for section 2: .text.
> mm/mm_init.o: failed
> 
> I have not been able to figure out why this happens, but the __weak
> annotation on arch_has_descending_max_zone_pfns() is the trigger here.
> 
> Removing the weak function in favor of an open-coded Kconfig option
> check avoids the problem and becomes clearer as well as better to
> optimize by the compiler.
> 
> Fixes: 9420f89db2dd ("mm: move most of core MM initialization to mm/mm_init.c")
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: fix logic bug reported-by: kernel test robot <oliver.sang@intel.com>,
> see https://lore.kernel.org/oe-lkp/202304151422.5e4d380b-oliver.sang@intel.com

I was also encountering similar issue, and confirmed replacing the old version
of this patch with this one fixes it.

Tested-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

> ---
>  arch/arc/mm/init.c | 5 -----
>  include/linux/mm.h | 1 -
>  mm/mm_init.c       | 4 ++--
>  3 files changed, 2 insertions(+), 8 deletions(-)
