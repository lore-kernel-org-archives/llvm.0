Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7527C7E
	for <llvm@lists.linux.dev>; Tue,  6 Sep 2022 06:51:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C77EC68AA6; Tue,  6 Sep 2022 08:51:42 +0200 (CEST)
Date: Tue, 6 Sep 2022 08:51:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-nvme@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [linux-nvme:nvme-6.1 9/10] drivers/nvme/host/rdma.c:989:50:
 error: use of undeclared identifier 'nctrl'
Message-ID: <20220906065142.GB2190@lst.de>
References: <202209060308.61PnxPmE-lkp@intel.com> <20220906063903.snht3lkixtdt2tkq@carbon.lan>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906063903.snht3lkixtdt2tkq@carbon.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Sep 06, 2022 at 08:39:03AM +0200, Daniel Wagner wrote:
> Argh, my devel setup(*) obviously didn't compile the rdma bits. Do you
> want me to send an fix on top of this or do you want a new version of
> the patch?

I've fixed it already.
