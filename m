Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1C5A937
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 17:15:17 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pFHZE-0000fQ-01; Tue, 10 Jan 2023 17:33:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F2460C25EA; Tue, 10 Jan 2023 09:30:40 +0100 (CET)
Date: Tue, 10 Jan 2023 09:30:40 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
	trix@redhat.com, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH 03/14] MIPS: Prefer cc-option for additions to cflags
Message-ID: <20230110083040.GB5608@alpha.franken.de>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-3-658cbc8fc592@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228-drop-qunused-arguments-v1-3-658cbc8fc592@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jan 04, 2023 at 12:54:20PM -0700, Nathan Chancellor wrote:
> A future change will switch as-option to use KBUILD_AFLAGS instead of
> KBUILD_CFLAGS to allow clang to drop -Qunused-arguments, which may cause
> issues if the flag being tested requires a flag previously added to
> KBUILD_CFLAGS but not KBUILD_AFLAGS. Use cc-option for cflags additions
> so that the flags are tested properly.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: tsbogend@alpha.franken.de
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/Makefile             | 2 +-
>  arch/mips/loongson2ef/Platform | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
