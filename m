Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E847023AA;
	Wed, 16 Nov 2022 06:07:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 49CB868AA6; Wed, 16 Nov 2022 07:07:07 +0100 (CET)
Date: Wed, 16 Nov 2022 07:07:07 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [linux-nvme:nvme-6.2 26/41] drivers/nvme/host/nvme.h:1030:1:
 error: non-void function does not return a value
Message-ID: <20221116060707.GA19088@lst.de>
References: <202211160745.7DFOlBj7-lkp@intel.com> <9c9e54d2-7ed8-0ecd-0742-4bc5e6ef7739@grimberg.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c9e54d2-7ed8-0ecd-0742-4bc5e6ef7739@grimberg.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks, fixed up again.
