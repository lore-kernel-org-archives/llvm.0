Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB951378
	for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 08:20:18 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1AC3D68BEB; Wed, 23 Mar 2022 09:20:15 +0100 (CET)
Date: Wed, 23 Mar 2022 09:20:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] nvmet: remove redundant assignment after left shift
Message-ID: <20220323082014.GB26611@lst.de>
References: <20220318013014.90698-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318013014.90698-1-colin.i.king@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

applied to nvme-5.18.
