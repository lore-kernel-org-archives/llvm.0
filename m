Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C72C9E
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 17:40:11 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEDuP-005trj-0a; Sun, 30 Jan 2022 17:22:37 +0000
Date: Sun, 30 Jan 2022 17:22:36 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] seq_file: fix NULL pointer arithmetic warning
Message-ID: <YfbJXCWSkc5nSNHC@zeniv-ca.linux.org.uk>
References: <YfauRJpYiAT3yEnK@fedora>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YfauRJpYiAT3yEnK@fedora>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Jan 30, 2022 at 12:27:00PM -0300, Maíra Canal wrote:
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

NAK.  _If_ you want to bother with that at all, at least make it
use SEQ_START_TOKEN, rather than open-coding it; what's more,
kernfs_seq_start() should simply call single_start() instead of
open-coding it.  I.e.
	if (ops->seq_start) {
		void *next = ops->seq_start(sf, ppos);
		/* see the comment above kernfs_seq_stop_active() */
		if (next == ERR_PTR(-ENODEV))
			kernfs_seq_stop_active(sf, next);
		return next;
	} else {
		return single_start(sf, ppos);
	}
and
	return *ppos ? NULL : SEQ_START_TOKEN;
in single_start() itself.
