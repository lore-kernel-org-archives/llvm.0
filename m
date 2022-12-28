Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957331C07;
	Wed, 28 Dec 2022 16:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD04CC433F0;
	Wed, 28 Dec 2022 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672243604;
	bh=9G0+6z+ndU6BIQFkkvajID1aZBDKwELvY/UH+TeWjjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNvz80ENk4eBWU6NihmHDVHgtnWKkm8ymkKhFoMtSeq+8fabmgQaIS9mD1lJrOyLo
	 8McmZX/LD15YN017su13KDLwka5F40OZI4seLE7xU1dmIXvrULH9bHTSU2Q7CrCxWB
	 JUOmgAibHLv9na57UqSCUG/wn3p0o6sdkCnYlRBFkBswm1fNcpNwzqXLjp/od8fcpz
	 M6gAVjEog01H3shfET2nTPhtw2dSb7BzEiktEHX2IvhCL/iwAnogP0BCGxFZzQnqru
	 tqwe+6dvGFtfLcU2DjnmGLxy491PaBi0YkhuV+CIcj+cku4TEc8Y6UbiS5o5J1MufH
	 kTr34QpT4lKjg==
Date: Wed, 28 Dec 2022 09:06:41 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <lkp@intel.com>, Keith Busch <kbusch@meta.com>,
	linux-block@vger.kernel.org, axboe@kernel.dk, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, martin.petersen@oracle.com,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCHv3 2/2] block: save user max_sectors limit
Message-ID: <Y6xpkcEn0BZw4cYE@kbusch-mbp>
References: <20221227191009.2277326-2-kbusch@meta.com>
 <202212280931.RDVmPBnX-lkp@intel.com>
 <20221228155111.GA388@lst.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228155111.GA388@lst.de>

On Wed, Dec 28, 2022 at 04:51:11PM +0100, Christoph Hellwig wrote:
> On Wed, Dec 28, 2022 at 10:04:16AM +0800, kernel test robot wrote:
> > >> block/blk-sysfs.c:254:20: warning: comparison of distinct pointer types ('typeof (max_hw_sectors_kb) *' (aka 'unsigned long *') and 'typeof (2560U >> 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
> 
> Seems like the local max_sectors_kb variable also needs to be turned
> into an unsigned int from the current unsigned long.

Yeah, and gcc didn't complain about it, so looks like I need to add
clang to my dev setup.
 
> And btw, while I'm getting philosophical during my early morning
> coffee here, I wonder if we need to actually get rid of or at least
> bump BLK_DEF_MAX_SECTORS.  It's pretty ridiculous for modern devices,
> and with CDL support that defintion would also include hard drives
> eventually.

It looks like there's a bit of history around that value. I was hoping
we could just get rid of it entirely and let drivers choose their own
defaults.
