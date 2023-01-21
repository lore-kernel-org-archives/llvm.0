Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BA429AC;
	Sat, 21 Jan 2023 14:28:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 70C3668CFE; Sat, 21 Jan 2023 15:28:16 +0100 (CET)
Date: Sat, 21 Jan 2023 15:28:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, cluster-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-nilfs@vger.kernel.org
Subject: Re: [PATCH 7/7] mm: return an ERR_PTR from __filemap_get_folio
Message-ID: <20230121142815.GA6786@lst.de>
References: <20230121065755.1140136-8-hch@lst.de> <202301211944.5T9l1RgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301211944.5T9l1RgA-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Jan 21, 2023 at 07:52:54PM +0800, kernel test robot wrote:
> Hi Christoph,
> 
> I love your patch! Perhaps something to improve:

And I don't love all this hugging when something doesn't work.  It feels
passive aggressive.

That being said, in this case the error is becaue the series is against
linux-next, so applying it to mainline won't work.

