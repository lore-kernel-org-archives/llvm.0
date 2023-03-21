Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6298A3212
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 08:23:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 570FE2800C1;
	Tue, 21 Mar 2023 09:23:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1679386994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ETMQewYqFOxyEeyfz++LRASMN6UldVLdJx3vLdRJ+U8=;
	b=mTDUcu6EONftfdBT/BsJcZJqtvG9Hk0H4pY103xW/8Mr82A+Qx85EGQ7yY0DlbFTzgcCDj
	j/wcpNDwLJWATK8eozJ5mYt5NKPtlTaXEw2xOBWWYeglb6LqyZ5s3qNLNEnUjG1majMlRr
	Cnl5tN4nJWK9dcY5BLw7UFgqCrpqR014t3U65ZDUf3/8uQAcX4yeoU9fVUVc6MlTn+gelG
	XOm5xQ8cRcojI3L8pczOamv8AWo+L0SsKPxa/wHJvyQJ0bKsTG2bQ7TmR29UY2nqblZFC3
	KRfSvqdqkLzvIXWmmeZb5ib31/IcuebKi/kZkw+Nxld2ZqwsUHz5furCUGKlug==
Message-ID: <e30b31c9-9b18-80a3-8ff0-97b958ab0b8f@cachyos.org>
Date: Tue, 21 Mar 2023 09:23:07 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] module/decompress: Never use kunmap() for local
 un-mappings
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Chris Down <chris@chrisdown.name>,
 Nick Terrell <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, live-patching@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Ira Weiny <ira.weiny@intel.com>
References: <20230315125256.22772-1-fmdefrancesco@gmail.com>
Content-Language: pl-PL, en-US
From: Piotr Gorski <piotrgorski@cachyos.org>
In-Reply-To: <20230315125256.22772-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Reviewed-by: Piotr Gorski <piotrgorski@cachyos.org>

W dniu 15.03.2023 o 13:52, Fabio M. De Francesco pisze:
> Use kunmap_local() to unmap pages locally mapped with kmap_local_page().
>
> kunmap_local() must be called on the kernel virtual address returned by
> kmap_local_page(), differently from how we use kunmap() which instead
> expects the mapped page as its argument.
>
> In module_zstd_decompress() we currently map with kmap_local_page() and
> unmap with kunmap(). This breaks the code and so it should be fixed.
>
> Cc: Piotr Gorski <piotrgorski@cachyos.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Fixes: 169a58ad824d ("module/decompress: Support zstd in-kernel decompression")
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>   kernel/module/decompress.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/module/decompress.c b/kernel/module/decompress.c
> index bb79ac1a6d8f..7ddc87bee274 100644
> --- a/kernel/module/decompress.c
> +++ b/kernel/module/decompress.c
> @@ -267,7 +267,7 @@ static ssize_t module_zstd_decompress(struct load_info *info,
>   		zstd_dec.size = PAGE_SIZE;
>   
>   		ret = zstd_decompress_stream(dstream, &zstd_dec, &zstd_buf);
> -		kunmap(page);
> +		kunmap_local(zstd_dec.dst);
>   		retval = zstd_get_error_code(ret);
>   		if (retval)
>   			break;
