Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070482577
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CFv20VENgen3x7L95b1GUkC/ibHa7tFH1DQYKnb44WI=; b=dnyHr9RCYMd7+Vf/UseACkAOE5
	fkfmfV9P0ATGxgg0gWcLhnXiCh7rnpYfN2LXvHoUGYw+xiFGMmzv5M7BjAAZ0X68UN1My58wn9XWt
	k2efLephKeMugvYAUk/OYftYo8GUYbiXiaFSh0Fq7R1te3xywmf9FTsrP1BZPeRmuu1+ZSLnsYg4k
	5fW9LQPGyPZ/5+LLoBC4hBr4jNPKvwxObqqDrz1GFYtxvG8yP7cwUANRn2oMzOJigbE+5jb5gPI8J
	mMgumSi5fnF3n/tIkdnXDlvERyS3xllbxS96+2+1GihCQbOGtiau7qe0wsm0DRRw1mC9J+xksRWWy
	eNmM6a8w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npw2X-008NxB-0F; Sat, 14 May 2022 17:58:53 +0000
Date: Sat, 14 May 2022 18:58:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 10018/11651] fs/ntfs/aops.c:378:12: warning:
 stack frame size (2224) exceeds limit (1024) in 'ntfs_read_folio'
Message-ID: <Yn/t3Fr/snB2tp8h@casper.infradead.org>
References: <202205150117.sd6HzBVm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202205150117.sd6HzBVm-lkp@intel.com>

On Sun, May 15, 2022 at 01:36:48AM +0800, kernel test robot wrote:
> config: hexagon-randconfig-r041-20220513 (https://download.01.org/0day-ci/archive/20220515/202205150117.sd6HzBVm-lkp@intel.com/config)

Hexagon.  Don't care.
