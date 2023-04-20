Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF78BE9
	for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 13:57:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9C5582AE;
	Thu, 20 Apr 2023 13:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9C5582AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1681998670; bh=/HYRZYBMpyNaQ4v0vpG/OhEOPSI9xHRsqndtnAocw4E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bhC8AhpYrKjnmG0JnaW5RjTdER8iwG3G9nb9BVcOk0OWAqZvcmFSN+uKIUl12S50F
	 9laIZQSjgAjxGM/PVJLj+W/FrOvzr3BH5VVoX87cvtjl4C/vHvyPZrP0HbZvCw90Jp
	 WAcl4prNQZpTyHiOsaNNz+mkN6YzzVK6vUYj7wvmFk/NKnKrCnLTe6Slza7Ps8LEZo
	 xl2lJ8YHebgy4ADc2T7yNAimxczjySSTobX4BbeTMCtB0F8Jxy3g1HN+ZXgbSQHzgo
	 GQuh9SmuyoAesda/zFn2MvfWTvaNk8M1m1C1I5Vfj2Rhthd6wxZIf9AUWsz/XMHVMh
	 By7WDlZJoyZxg==
From: Jonathan Corbet <corbet@lwn.net>
To: Zipeng Zhang <zhangzipeng0@foxmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 masahiroy@kernel.org, codeagain@codeagain.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, Zipeng Zhang <zhangzipeng0@foxmail.com>
Subject: Re: [PATCH] Documentation/process/changes: Escape --options to fix
 Sphinx output
In-Reply-To: <tencent_CB1A298D31FD221496FF657CD7EF406E6605@qq.com>
References: <tencent_CB1A298D31FD221496FF657CD7EF406E6605@qq.com>
Date: Thu, 20 Apr 2023 07:51:09 -0600
Message-ID: <87sfcuu0fm.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Zipeng Zhang <zhangzipeng0@foxmail.com> writes:

> Add an escape character to resolve the problem of
> "--version" being displayed as "=E2=80=93version".
>
> Without such escaping, -- is rendered as =E2=80=93 (en dash).
>
> Signed-off-by: Zipeng Zhang <zhangzipeng0@foxmail.com>
> ---
>  Documentation/process/changes.rst | 38 +++++++++++++++----------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

Thanks for working on improving the documentation!

I understand where you are coming from, but this may be one of those
cases where the readability of the plain-text documentation has to win
out.  Those backslashes are ugly and seem unlikely to be maintained
going forward.

The right solution, if it is possible, is to convince Sphinx to stop
messing with "--" altogether.  Substituting em-dashes is of limited
cosmetic value and, I think, is something we could do without.

Thanks,

jon
