Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75F72C9E
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 10:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05B1C00446;
	Wed,  8 Dec 2021 10:05:18 +0000 (UTC)
Date: Wed, 8 Dec 2021 11:05:14 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>,
	kernelci@groups.io, linux-fsdevel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC 3/3] headers: repurpose linux/fs_types.h
Message-ID: <20211208100514.7egjy5hraziu4pme@wittgenstein>
References: <20211207150927.3042197-1-arnd@kernel.org>
 <20211207150927.3042197-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211207150927.3042197-4-arnd@kernel.org>

On Tue, Dec 07, 2021 at 04:09:27PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/fs_types.h traditionally describes the types of file systems we
> deal with, but the file name could also be interpreted to refer to
> data types used for interacting with file systems, similar to
> linux/spinlock_types.h or linux/mm_types.h.
> 
> Splitting out the data type definitions from the generic header helps
> avoid excessive indirect include hierarchies, so steal this file
> name and repurpose it to contain the definitions for file, inode,
> address_space, super_block, file_lock, quota and filename, along with
> their respective callback operations, moving them out of linux/fs.h.
> 
> The preprocessed linux/fs_types.h is now about 50KB, compared to
> over 1MB for the traditional linux/fs.h, and can be included from
> most other headers that currently rely on type definitions from
> linux/fs.h.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

I tried to apply the series to take a closer look but it fails to apply
cleanup down to v5.15 and any release after that. What's the base I
should use for this?
