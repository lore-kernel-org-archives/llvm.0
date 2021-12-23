Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1490A2C80
	for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 12:57:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2403B68AA6; Thu, 23 Dec 2021 13:57:24 +0100 (CET)
Date: Thu, 23 Dec 2021 13:57:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] block: drop needless assignment in set_task_ioprio()
Message-ID: <20211223125723.GA24681@lst.de>
References: <20211223125300.20691-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223125300.20691-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)


Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
