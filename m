Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112799;
	b=iow5qdr1UihQ2KZ33V5OzsVH+24dEEgqiQlhedsX5BqwlxpCpQrK+tFvrNWK0dQdknZ+
	 rEL8//TvKGiWq534/tmgE5JZUj711KKRZVZ7dYWSsw0jLMHVLMIrl5Patt8BKvhjNrBci
	 zX2aGE/nDnr8Kxsa028BriwGNDgBTnG0WMw6Wki+bFo4jAUfrLEEGCyhy5gQgD6LiEdoG
	 7tD90AHdYORDMXqqGHYSQNdKe3SXPiMDJd0yn20uiIm8/aRjFLTZjBdnpap05uHYerBlX
	 OC4AMvZSYDNWiEmSXF2AGm6gkcE7vW0syKQ4MCsTcqP0yFwPhvnAjpQoN0TJNqvyE9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112799;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oJCBxP4ULd1aGaiXR7VGdkikuMjsvHQubcW980ipQrE=;
	b=SeNF3SKat6WWxmquk/8He0/lPX54hdALuwxUnyugFKnTb0tfGkTZ4gYzR0dwLfeSRK2J
	 Ezp1cC0aX+PyTa6FgObb0uJzXsiE5u4J7lXkxNhbzxTVcPTQAh2gcgxjb0P8FC2npTerP
	 urNfjrlDnY/Ma3QL8RuODupCbbVf1s7lQB+q3oKxqudY5Dtm8ipTtnhn/Zqn/9Okak3j2
	 jegMnRlKGXRDETU/ncbLx99m0POnAI4kZAhYy3WmveCcohoShxGfA0FcOIlGmzGCQgrB6
	 Mm55aPdiLCbJgCdUCjy8VAXWccKH7e91uGSQ0Sxb+BDnoUkgieeQ4dJBSMsNKFzSjlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mnTo4Dt+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E97606A330;
	Thu, 19 Nov 2026 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mnTo4Dt+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8664B1F000C4;
	Thu, 19 Nov 2026 18:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795112798;
	bh=oJCBxP4ULd1aGaiXR7VGdkikuMjsvHQubcW980ipQrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mnTo4Dt++NXNpWbpPzPaD4O3G3wXwUDtr6wR+HvlNFyJ+gkk7vYC6FNgnKDdc2V0r
	 4XzKiKpAf71jYEaug4VH0mhOB1zpzdTdB5FR+iYSspSPbi6pgJIwgwYvZWyPO494uw
	 sYny9LvZGH7XbhrXK69WQG3KhJypWITsc95UTByEeq17aAUdfplJWHBzBCfVPN3Jun
	 nmqOCWIcQx3TH11BW8asMkFs9q1cizBE6oZORji8VS0HPx7Ob6+w07c8L+5udp/X6k
	 Kt4ECsoKHOWMSdhLBHrw9JF/zvP4A5/tWrg7adh4NPgd9tzPrGEP2eWu0u1Bqb7fr5
	 NvbKytx4YtkZg==
Date: Thu, 19 Nov 2026 18:26:34 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] mm/backing-dev: pass "%s" format string to
 device_create() in bdi_register_va()
Message-ID: <av8_U9OpmR7FtHzh@gremlin>
References: <20261119170517.1515872-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119170517.1515872-1-irogers@google.com>

On Thu, Nov 19, 2026 at 09:05:17AM -0800, Ian Rogers wrote:
> bdi_register_va() formats (fmt, args) into bdi->dev_name via vsnprintf()
> and then passes bdi->dev_name directly as the format string argument to
> device_create(), causing vsnprintf() to run a second time on the already
> formatted device name with no variadic arguments. If a caller formats an
> identifier containing '%', device_create() interprets it as format
> specifiers and reads arbitrary stack slots.
>
> Pass "%s", bdi->dev_name to device_create().
>
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wformat-security enabled; fix and changelog drafted with an AI coding
> assistant. Build-tested under LLVM=1 W=1 and -Wformat-security; not
> runtime-tested with '%' in backing-device names.
>
> Fixes: 6bd87eec23cb ("bdi: add a ->dev_name field to struct backing_dev_info")
> Signed-off-by: Ian Rogers <irogers@google.com>

Seems reasonable so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/backing-dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index fad1495d3b20..58373d494d92 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -1097,7 +1097,8 @@ int bdi_register_va(struct backing_dev_info *bdi, const char *fmt, va_list args)
>  		return 0;
>
>  	vsnprintf(bdi->dev_name, sizeof(bdi->dev_name), fmt, args);
> -	dev = device_create(&bdi_class, NULL, MKDEV(0, 0), bdi, bdi->dev_name);
> +	dev = device_create(&bdi_class, NULL, MKDEV(0, 0), bdi, "%s",
> +			    bdi->dev_name);
>  	if (IS_ERR(dev))
>  		return PTR_ERR(dev);
>
> --
> 2.56.1.708.g77570a6a1d-goog
>

--
Cheers, Lorenzo
