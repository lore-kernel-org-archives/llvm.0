Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4294623A4
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 07:50:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 481C968AFE; Mon, 10 Oct 2022 09:44:09 +0200 (CEST)
Date: Mon, 10 Oct 2022 09:44:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	Xiaoming Ni <nixiaoming@huawei.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andi Kleen <ak@linux.intel.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] fs/select: mark do_select noinline_for_stack for 32b
Message-ID: <20221010074409.GA20998@lst.de>
References: <CAKwvOdkEied8hf6Oid0sGf0ybF2WqrzOvtRiXa=j7Ms-Rc6uBA@mail.gmail.com> <20221007201140.1744961-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007201140.1744961-1-ndesaulniers@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Oct 07, 2022 at 01:11:40PM -0700, Nick Desaulniers wrote:
> Effectively a revert of
> commit ad312f95d41c ("fs/select: avoid clang stack usage warning")
> 
> Various configs can still push the stack useage of core_sys_select()
> over the CONFIG_FRAME_WARN threshold (1024B on 32b targets).
> 
>   fs/select.c:619:5: error: stack frame size of 1048 bytes in function
>   'core_sys_select' [-Werror,-Wframe-larger-than=]

Btw, I also see a warning here with all my KASAN x86_64 gcc builds.
