Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D68AA1;
	Tue, 15 Nov 2022 18:52:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E6E6468AA6; Tue, 15 Nov 2022 19:52:32 +0100 (CET)
Date: Tue, 15 Nov 2022 19:52:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Nathan Chancellor <nathan@kernel.org>,
	kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [linux-nvme:nvme-6.2 26/41] drivers/nvme/host/core.c:5122:6:
 error: assigning to 'int' from incompatible type 'void'
Message-ID: <20221115185232.GA32242@lst.de>
References: <202211160055.rbjs32vH-lkp@intel.com> <edda71f4-9912-d336-6d5b-0e1e102d4bfe@grimberg.me> <Y3PLZxNwqioynAtw@dev-arch.thelio-3990X> <5d14f4b9-5c1d-9caa-e70d-576bac98abc3@grimberg.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d14f4b9-5c1d-9caa-e70d-576bac98abc3@grimberg.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 15, 2022 at 07:52:35PM +0200, Sagi Grimberg wrote:
> Didn't even compile it...
> infradead is down again, I trust that Christoph applied this fixup 
> correctly...

Yeah, I already manually fixed that up after I did a AUTH=n build
after the first report.
