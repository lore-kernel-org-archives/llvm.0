Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185F72563;
	Thu, 22 Dec 2022 08:40:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 55C9867373; Thu, 22 Dec 2022 09:40:11 +0100 (CET)
Date: Thu, 22 Dec 2022 09:40:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Keith Busch <kbusch@meta.com>, linux-block@vger.kernel.org,
	axboe@kernel.dk, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, hch@lst.de,
	martin.petersen@oracle.com, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] block: save user max_sectors limit
Message-ID: <20221222084011.GA12920@lst.de>
References: <20221221162758.407742-1-kbusch@meta.com> <202212221657.yQawgPsu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212221657.yQawgPsu-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Dec 22, 2022 at 04:32:10PM +0800, kernel test robot wrote:
> >> block/blk-settings.c:138:49: warning: comparison of distinct pointer types ('typeof (limits->max_sectors) *' (aka 'unsigned int *') and 'typeof (BLK_DEF_MAX_SECTORS) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]

Yeah, that's not going to work.  BLK_DEF_MAX_SECTORS should probably
become an unsigned constant to fix this.
