Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E789C7E
	for <llvm@lists.linux.dev>; Sun, 25 Sep 2022 07:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664090269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FnuW0+nquE7jeCs1wGd25t/HgD5sAtMc07QK9kih2sQ=;
	b=B97KTn2dpYAt61kIInCLOK/2Ro6Wst4uMijGFSzgHYRdcZYdeHN2Z3ugLtJoUKxafz8yNC
	sWsj/xIEwaV1yrv9Q1SsmiCxhVHRLyjrG7MDBtCipNp9CsQ1df0T63dAJdIXFk2HpFvimj
	SNz8dinnXFQVzc5AwMsgibAO84z47E8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-7nFoMco5NfiSWhiUbHz0GQ-1; Sun, 25 Sep 2022 03:17:48 -0400
X-MC-Unique: 7nFoMco5NfiSWhiUbHz0GQ-1
Received: by mail-qt1-f198.google.com with SMTP id fz10-20020a05622a5a8a00b0035ce18717daso2685921qtb.11
        for <llvm@lists.linux.dev>; Sun, 25 Sep 2022 00:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=FnuW0+nquE7jeCs1wGd25t/HgD5sAtMc07QK9kih2sQ=;
        b=5LgL+c7xuNIuFoh6Vb7GFEGEM1bMAYN0OqHH3fQu0O7WwXWBIDidgTmAlc9/e6UPli
         eCc/eGYt6HybZS/DNCjcc/OgTuZFIpqZ4lTF1gHScqCZylg5xQqNu6B2u1RV6U5wqNY+
         n/GhO9h2HlJpEZI79KGTetURfR7YUTav2sgYh1Yy2z2rdq1K4IS/08lFPQ/bteAwpznL
         AtvnCBIDCh57MhroyEIOG7x4Zif7YLtdfcdzgOziUkIj/9991N/tXvyM89kZYIqF1Ym4
         g688H+n18RWfMd3XdSe49GBUw1HiOqycQHGxjXY5UVl+T/yuNwdINpkSIDTIHZLmKhPY
         p/Wg==
X-Gm-Message-State: ACrzQf2BO7drkAfemPglEkynQBZ2hLGA5TylQLduC+Vl4moTgD5TxA4d
	d0mdTx8tzijG4LOi1tvkmYiig9BSOnlTxbGuRw4QvutH6cIDBpMvi6vN6NfCEi6Tsoa+/sbxqHP
	pjWAVJm3OnzVfdQ==
X-Received: by 2002:a05:620a:c8f:b0:6cb:e329:b5b9 with SMTP id q15-20020a05620a0c8f00b006cbe329b5b9mr10667188qki.95.1664090268096;
        Sun, 25 Sep 2022 00:17:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4u6YF4dJIrwAN1QRZGgvTOpwH6qKYsc23O//LxYiiudu83+P6fv+LpA21i63RBBqqlayo//g==
X-Received: by 2002:a05:620a:c8f:b0:6cb:e329:b5b9 with SMTP id q15-20020a05620a0c8f00b006cbe329b5b9mr10667159qki.95.1664090267816;
        Sun, 25 Sep 2022 00:17:47 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-96.dyn.eolo.it. [146.241.97.96])
        by smtp.gmail.com with ESMTPSA id bp30-20020a05620a459e00b006c479acd82fsm10375465qkb.7.2022.09.25.00.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 00:17:47 -0700 (PDT)
Message-ID: <e340d993bce8e1b2742fba52ac6383771cfaddae.camel@redhat.com>
Subject: Re: [PATCH v2 04/16] skbuff: Phase out ksize() fallback for
 frag_size
From: Paolo Abeni <pabeni@redhat.com>
To: Kees Cook <keescook@chromium.org>, Vlastimil Babka <vbabka@suse.cz>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton
 <akpm@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
 Alex Elder <elder@kernel.org>, Josef Bacik <josef@toxicpanda.com>, David
 Sterba <dsterba@suse.com>,  Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Jesse
 Brandeburg <jesse.brandeburg@intel.com>, Daniel Micay
 <danielmicay@gmail.com>, Yonghong Song <yhs@fb.com>,  Marco Elver
 <elver@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
 linux-btrfs@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-fsdevel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
 dev@openvswitch.org, x86@kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
Date: Sun, 25 Sep 2022 09:17:40 +0200
In-Reply-To: <20220923202822.2667581-5-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
	 <20220923202822.2667581-5-keescook@chromium.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2022-09-23 at 13:28 -0700, Kees Cook wrote:
> All callers of APIs that allowed a 0-sized frag_size appear to be
> passing actual size information already

AFAICS, not yet:

drivers/net/ethernet/qlogic/qed/qed_ll2.c:
	skb = build_skb(buffer->data, 0); // -> __build_skb(..., 0) 
		// ->  __build_skb_around()

drivers/net/ethernet/broadcom/bnx2.c:
	skb = build_skb(data, 0);

I guess some more drivers have calls leading to 

	__build_skb_around(...,  0)

there are several call path to checks...


> , so this use of ksize() can
> be removed. However, just in case there is something still depending
> on this behavior, issue a WARN and fall back to as before to ksize()
> which means we'll also potentially get KASAN warnings.
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  net/core/skbuff.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 0b30fbdbd0d0..84ca89c781cd 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -195,7 +195,11 @@ static void __build_skb_around(struct sk_buff *skb, void *data,
>  			       unsigned int frag_size)
>  {
>  	struct skb_shared_info *shinfo;
> -	unsigned int size = frag_size ? : ksize(data);
> +	unsigned int size = frag_size;
> +
> +	/* All callers should be setting frag size now? */
> +	if (WARN_ON_ONCE(size == 0))
> +		size = ksize(data);

At some point in the future, I guess we could even drop this check,
right?

Thanks!

Paolo

