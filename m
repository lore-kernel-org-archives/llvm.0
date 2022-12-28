Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729001875;
	Wed, 28 Dec 2022 15:51:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7EA5968C7B; Wed, 28 Dec 2022 16:51:12 +0100 (CET)
Date: Wed, 28 Dec 2022 16:51:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Keith Busch <kbusch@meta.com>, linux-block@vger.kernel.org,
	axboe@kernel.dk, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, hch@lst.de,
	martin.petersen@oracle.com,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCHv3 2/2] block: save user max_sectors limit
Message-ID: <20221228155111.GA388@lst.de>
References: <20221227191009.2277326-2-kbusch@meta.com> <202212280931.RDVmPBnX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212280931.RDVmPBnX-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Dec 28, 2022 at 10:04:16AM +0800, kernel test robot wrote:
> >> block/blk-sysfs.c:254:20: warning: comparison of distinct pointer types ('typeof (max_hw_sectors_kb) *' (aka 'unsigned long *') and 'typeof (2560U >> 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]

Seems like the local max_sectors_kb variable also needs to be turned
into an unsigned int from the current unsigned long.

And btw, while I'm getting philosophical during my early morning
coffee here, I wonder if we need to actually get rid of or at least
bump BLK_DEF_MAX_SECTORS.  It's pretty ridiculous for modern devices,
and with CDL support that defintion would also include hard drives
eventually.
