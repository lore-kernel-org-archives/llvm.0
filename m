Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DA22F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC748C340EE;
	Sat, 14 May 2022 21:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652565440;
	bh=7/bA4w4G8YLE2TIhdgRqh26nw+jS5nqBcytlMpBLt6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLvjaR/bAqfxtbZbegiNJzcBeRj8fW3Pok6tKrFToxFQmVLDB2F6lMMHXRdMK/g2g
	 nm8R7ZUJTaSHGZSllh/ylnHppOPM5fcHDcmpx3H6nyWUTwEk7YDeeiJKE71yuFYyNG
	 mkF2qKCl18lDy1IcJZYwAJIvfPBYevDFdNWXQlFmJSufcl04mnF85bTkmxHmhpmikw
	 ArJStkUXtR8NNb6n44njMt94gjJ14qC/T8sZ/Zv8wihkQuRNECoqQ9pGFw+FUUcqUl
	 TX03OufZuA+Qy/xEG904myMtwQJTgtVIwBVkGDGm8i26ZbyVe11FgeWDx7o4qxyIyH
	 5S/pwvvAuwVgQ==
Date: Sat, 14 May 2022 14:57:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matthew Wilcox <willy@infradead.org>, Brian Cain <bcain@quicinc.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-hexagon@vger.kernel.org
Subject: Re: [linux-next:master 9995/11651] fs/buffer.c:2254:5: warning:
 stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio'
Message-ID: <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
References: <202205150051.3RzuooAG-lkp@intel.com>
 <Yn/YsTpOh898B30l@casper.infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yn/YsTpOh898B30l@casper.infradead.org>

On Sat, May 14, 2022 at 05:28:33PM +0100, Matthew Wilcox wrote:
> On Sun, May 15, 2022 at 12:23:46AM +0800, kernel test robot wrote:
> > commit: 2c69e2057962b6bd76d72446453862eb59325b49 [9995/11651] fs: Convert block_read_full_page() to block_read_full_folio()
> > config: hexagon-randconfig-r041-20220513 (https://download.01.org/0day-ci/archive/20220515/202205150051.3RzuooAG-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
> ...
> > All warnings (new ones prefixed by >>):
> > 
> > >> fs/buffer.c:2254:5: warning: stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio' [-Wframe-larger-than]
> >    int block_read_full_folio(struct folio *folio, get_block_t *get_block)
> >        ^
> >    1 warning generated.
> 
> Now show the warnings that were removed.  This patch renames the
> function, and I bet there was a similar warning before this patch.
> 
> But basically, I don't care about stack usage on hexagon with clang.
> AIUI, it's a known bug.

For what it's worth, it seems like this is just 256K pages being 256K
pages... MAX_BUF_PER_PAGE is PAGE_SIZE / 512 so *arr is 2048 bytes big
in this configuration. You'd see a similar warning with PowerPC but that
configuration is non-standard:

fs/buffer.c: In function ‘block_read_full_page’:
fs/buffer.c:2337:1: warning: the frame size of 2064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
 2337 | }
      | ^

It would be nice if the Intel folks could look at recognizing a function
rename so that you are not bothered by reports like this.

As a side note... Brian, is there any reason for 256K pages to exist for
Hexagon? This has been an option since Hexagon's introduction but is it
actually used? 4K pages is the default and the help text says "use with
caution". Perhaps the choice should be turned off altogether for
CONFIG_COMPILE_TEST so that we cannot select this configuration and
bother developers with these reports.

Cheers,
Nathan
