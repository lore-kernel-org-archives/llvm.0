Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5F171B1;
	Thu, 13 Aug 2026 00:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786579394; cv=none; b=YxR9Xi6a5fLIpaI7uHcZHMUiciXbCnvGs1M/3EqswboKBHV5Svt0N2snbEy/W7QwTJt6DFk/Jfdo4RwL0xjd5hsmzvcHTzVlFYO1FuHa7ACOOIAKdjqFsgJMabeEilbuvTZ0XS/51vf3B9pMufv/2QeDjvFwWfy2h0FJUU6gz50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786579394; c=relaxed/simple;
	bh=Nw4IP/ihXtEetVmgAgrZNRKY/RwVNKbR3nM5JlJYolI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQXJn50u2hZw1iRykUZ2tQIny+YwhCR59xoNC8MToAJpGoQFlGP1XN9xIZHrl7vx6sAORa7oRdz2JSR+0OYuNmu4FBkGT+qcRZaCkUTm+x+eR0taEP3c68Wj/63DQ7teVco7skFRKUON86OswLWcN0jN7F21tM4TD/71XmSJwt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=e9rphySl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e9rphySl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=N3MHtg8IYqPOe/jtnOOj2nPC3S2Ixh8R0wm+at1M4gg=; b=e9rphySlQlTSngYZg9iCPbe7tz
	5g9heth7UUZaHKP+ym3GXPwsnh6gYyfozfHzNEUGHPt+4UU6InJEXxhogbROqkBzUpqbjJKGCb7Uh
	yBMMSJ/Lh497M5QfhzOhqKnKVs91vr/8Norjm6gOUoiOMoKup9tOOS2gcD97kFCr5rnXZd0TU5P+/
	FmwByYh1dV503sgAIK51Zw6bNU+ZDONB5LcfZa30VHNELCtTIiV3aArgR+EkrktNhzMmM/TYir9c9
	I1d/o3uNkawK6wu1TIGmeA4l0wVf/XUVX/hNYWseoKapRCZJP7Wuc9PkjjCAI5gqd3FMT9j7qA3zk
	CFBY5wrw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIuP-0000000HBMq-09QO;
	Thu, 13 Aug 2026 00:02:57 +0000
Message-ID: <da510a49-d570-452a-9fda-84e4915573f4@infradead.org>
Date: Wed, 12 Aug 2026 17:02:55 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Docs: software-requirements.rst replace optional tag
 with footnotes
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
 <20260812122426.1636227-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260812122426.1636227-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/12/26 5:24 AM, Manuel Ebner wrote:
> The optional tag isn't obvious nor defined. Therefore replace with footnotes
> like the one of Sphinx.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  .../process/software-requirements.rst         | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/process/software-requirements.rst b/Documentation/process/software-requirements.rst
> index 5fdfcf6a0c01..a31e0ae20498 100644
> --- a/Documentation/process/software-requirements.rst
> +++ b/Documentation/process/software-requirements.rst
> @@ -33,20 +33,20 @@ you probably do not need to concern yourself with pcmciautils.
>  ====================== ===============  ========================================
>  bash                   4.2              bash --version
>  bc                     1.06.95          bc --version
> -bindgen (optional)     0.71.1           bindgen --version
> +bindgen [#f1]_         0.71.1           bindgen --version
>  binutils               2.30             ld -v
>  bison                  2.0              bison --version
>  btrfs-progs            0.18             btrfs --version
> -Clang/LLVM (optional)  17.0.1           clang --version
> +Clang/LLVM [#f2]_      17.0.1           clang --version
>  e2fsprogs              1.41.4           e2fsck -V
>  flex                   2.5.35           flex --version
>  gdb                    7.2              gdb --version
> -GNU awk (optional)     5.1.0            gawk --version
> +GNU awk [#f3]_         5.1.0            gawk --version
>  GNU C                  8.1              gcc --version
>  GNU make               4.0              make --version
>  GNU tar                1.28             tar --version
>  GRUB                   0.93             grub --version || grub-install --version
> -gtags (optional)       6.6.5            gtags --version
> +gtags [#f4]_           6.6.5            gtags --version
>  ip-route2              6.14.0           ip -V
>  iptables               1.4.2            iptables -V
>  jfsutils               1.1.3            fsck.jfs -V
> @@ -54,7 +54,7 @@ kmod                   13               kmod -V
>  liblzma                5.8.1            lzma -V
>  lzop                   1.04             lzop -V
>  mcelog                 0.6              mcelog --version
> -mkimage (optional)     2017.01          mkimage --version
> +mkimage [#f5]_         2017.01          mkimage --version
>  nfs-utils              1.0.5            showmount --version
>  openssl & libcrypto    1.0.0            openssl version
>  pahole                 1.26             pahole --version
> @@ -63,8 +63,8 @@ PPP                    2.4.0            pppd --version
>  procps                 3.2.0            ps --version
>  Python                 3.9.x            python3 --version
>  quota-tools            3.09             quota -V
> -Rust (optional)        1.85.0           rustc --version
> -Sphinx\ [#f1]_         3.4.3            sphinx-build --version
> +Rust [#f6]_            1.85.0           rustc --version
> +Sphinx\ [#f7]_         3.4.3            sphinx-build --version
>  squashfs-tools         4.0              mksquashfs -version
>  udev                   081              udevadm --version
>  util-linux             2.10o            mount --version
> @@ -72,7 +72,13 @@ xfsprogs               2.6.0            xfs_db -V
>  xz                     5.8.1            xz -V
>  ====================== ===============  ========================================
>  
> -.. [#f1] Sphinx is needed only to build the Kernel documentation
> +.. [#f1] bindgen is needed to generate Rust bindings
> +.. [#f2] Clang/LLVM is an alternative to GNU C (gcc)
> +.. [#f3] awk is needed with CONFIG_BUILTIN_MODULE_RANGES set

or if CONFIG_SYSTEM_BLACKLIST_HASH_LIST is set.
or if objtool is being used with ARCH=x86.

> +.. [#f4] gtags is there to generate tag files through ``make gtags``
> +.. [#f5] mkimage is used when building a Flat Image Tree (FIT)

or to create a U-Boot image (ARCH=arc, ARCH=arm, or ARCH=powerpc).

> +.. [#f6] Rust is only required when enabled
> +.. [#f7] Sphinx is needed only to build the Kernel documentation
>  
>  Kernel compilation
>  ******************

I probably missed a few since I didn't spend lots of time on this.

But I do like this approach instead of just saying (optional).

-- 
~Randy

