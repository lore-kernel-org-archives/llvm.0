Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2E97FA;
	Sat, 17 Jun 2023 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mDQPfyS2nUhOyxsfCsKDJMwn3pRIhtyEUzYxdacYO1Y=; b=F6yc55slJTmZvsnQuNgmtPHJMN
	Vs/L0JmYl8+6beJDJwKFaE12TuNoSu0QMPF5VcjClhAmPP9vrMAp/m1QFbK8UTOfUKyuokOZllZ5G
	2a8r2lV1WhPtG+7zoVcxswjR4uQngJL1SsB0MkEKDqHH6xPCredZUf7Q1d/VgrEWExZSqJN3Zsx+e
	Z0hMfi+NO+613nfm0gB7Gw0XgOWkowvzgqn9TDjO75v34MmpAUXAykwr/lWQOEHbI5FWzT45L3STr
	MuKEYVbHtQSSbkxfTPc4W4vdOnLW9Wq4pFXXDGD4RwbHBcvVHaneTbZGUpfY9BWZqs7giZAhnbArq
	veEWYLgA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qASJL-003Ahg-1j;
	Sat, 17 Jun 2023 09:33:35 +0000
Date: Sat, 17 Jun 2023 02:33:35 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [mcgrof-next:large-block-20230616-hacks 37/38]
 fs/iomap/buffered-io.c:830:42: warning: if statement has empty body
Message-ID: <ZI1974T8xpWyBIed@bombadil.infradead.org>
References: <202306170021.8TZdCFER-lkp@intel.com>
 <ZIzMxFPbJWnuyHHI@casper.infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIzMxFPbJWnuyHHI@casper.infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Fri, Jun 16, 2023 at 09:57:40PM +0100, Matthew Wilcox wrote:
> On Sat, Jun 17, 2023 at 12:13:42AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230616-hacks
> > head:   5416cb31017b28b25627f4f5b8292af96bb65f58
> > commit: ddf48d516b57d686874c57ffa3630ea19c4b7fdb [37/38] iomap: Copy larger chunks from userspace
> 
> This patch is out of date.  Luis, can you replace with the v3
> patches, please?
> 
> https://lore.kernel.org/linux-fsdevel/20230612203910.724378-1-willy@infradead.org/
> 
> (there will be a v4, but so far all the changes are to comments)

Done! I put them on the bottom of the queue, so to make changes
on top of yours easier:

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=large-block-20230617-hacks

  Luis
