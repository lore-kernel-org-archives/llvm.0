Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D8A63A0;
	Fri, 16 Jun 2023 07:01:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id EF5A967373; Fri, 16 Jun 2023 09:01:14 +0200 (CEST)
Date: Fri, 16 Jun 2023 09:01:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Song Liu <song@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 06/11] md-bitmap: refactor md_bitmap_init_from_disk
Message-ID: <20230616070114.GB29500@lst.de>
References: <20230615064840.629492-7-hch@lst.de> <202306160552.smw0qbmb-lkp@intel.com> <CAPhsuW5T4ULiYmCDoLwiaQRKP1OsMDhAez_hrzge_WkXxiWsNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW5T4ULiYmCDoLwiaQRKP1OsMDhAez_hrzge_WkXxiWsNQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jun 15, 2023 at 11:53:49PM -0700, Song Liu wrote:
> I fixed this one, and applied the set to md-next.

Thanks!
