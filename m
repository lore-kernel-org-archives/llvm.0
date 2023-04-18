Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FA12572
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 12:42:12 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Q13Mc6q1Vz4x3Tj
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 14:37:00 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
	by andre.telenet-ops.be with bizsmtp
	id mCci290131C8whw01CciYR; Tue, 18 Apr 2023 14:36:53 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pokZe-00H56B-Ey;
	Tue, 18 Apr 2023 14:36:42 +0200
Date: Tue, 18 Apr 2023 14:36:42 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Arnd Bergmann <arnd@kernel.org>
cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
    llvm@lists.linux.dev, Vineet Gupta <vgupta@kernel.org>, 
    Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
    "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Naoya Horiguchi <naoya.horiguchi@nec.com>, 
    linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, Biju Das <biju.das.jz@bp.renesas.com>, 
    linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] [v2] mm: make arch_has_descending_max_zone_pfns()
 static
In-Reply-To: <20230415081904.969049-1-arnd@kernel.org>
Message-ID: <cab7df5e-a7d7-ce15-20fa-31afe6f7180@linux-m68k.org>
References: <20230415081904.969049-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Arnd,

On Sat, 15 Apr 2023, Arnd Bergmann wrote:
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

Thanks, reverting commit 413d478d3b366d09 ("mm: make
arch_has_descending_max_zone_pfns() static") in next-20230417 and
applying your v2 makes Salvator-XS regain its DMA memory zone.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
