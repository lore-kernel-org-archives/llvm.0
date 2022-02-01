Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969472F25
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 16:32:37 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEw4x-006MKm-Eg; Tue, 01 Feb 2022 16:32:27 +0000
Date: Tue, 1 Feb 2022 16:32:27 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3] seq_file: fix NULL pointer arithmetic warning
Message-ID: <Yflgm3kv1059tIDH@zeniv-ca.linux.org.uk>
References: <Yfgo8p6Vk+h4+YHY@fedora>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yfgo8p6Vk+h4+YHY@fedora>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Jan 31, 2022 at 03:22:42PM -0300, Maíra Canal wrote:
> Implement conditional logic in order to replace NULL pointer arithmetic.
> 
> The use of NULL pointer arithmetic was pointed out by clang with the
> following warning:
> 
> fs/kernfs/file.c:128:15: warning: performing pointer arithmetic on a
> null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>                 return NULL + !*ppos;
>                        ~~~~ ^
> fs/seq_file.c:559:14: warning: performing pointer arithmetic on a
> null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>         return NULL + (*pos == 0);
> 
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---
> V1 -> V2:
> - Use SEQ_START_TOKEN instead of open-coding it
> - kernfs_seq_start call single_start instead of open-coding it
> V2 -> V3:
> - Remove the EXPORT of the single_start symbol

Applied.
