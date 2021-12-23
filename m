Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E12C80
	for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 12:37:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id ECB6D68AA6; Thu, 23 Dec 2021 13:37:24 +0100 (CET)
Date: Thu, 23 Dec 2021 13:37:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] block: drop needless assignment in set_task_ioprio()
Message-ID: <20211223123724.GA23339@lst.de>
References: <20211223123003.6947-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223123003.6947-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

>  		if (task->io_context) {
>  			kmem_cache_free(iocontext_cachep, ioc);
> -			ioc = task->io_context;
>  		} else {
>  			task->io_context = ioc;
>  		}

Please also drop the now superflous braces.
