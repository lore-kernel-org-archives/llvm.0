Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C31C6BA
	for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaXjq59X"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40a4d04af5cso14055865e9.0
        for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 07:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700492625; x=1701097425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j2/DoAoTwRlTiAW4H0ru7cJtclV8pamlA+0Xn4dEDNA=;
        b=zaXjq59XgjyEf9kugNSTA5LOi9BjegyPv5yantdb+qU0vbrM+j1CPlxG89quzZq2gk
         Ta5kuzK4QyTk95Y7yVgznYu/rzVq7dllwGmKE8QiwYrJtuOnKXqt/ILg/JxzYIIco0wT
         d/YXvpTbFbb+Beqd54qbiMLX9ddJB8gGQzYC0nKIXp7qGF5bf0lRlR/7GeTKapid7AMP
         y2YGg12wxIVUiVCNZO4UJL9xJn+a3vuToxYDuWhXH8EQGDhcq94iMzUNVB9Mw12U5TDZ
         L1npzGpQqjLDcT6WKqzbQa+1dgE67yy+2g2GbpROAq0NYl5yrjiYT/Os5p2vOT/GfqHf
         O9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492625; x=1701097425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2/DoAoTwRlTiAW4H0ru7cJtclV8pamlA+0Xn4dEDNA=;
        b=QB+A8oDW9K1YzjfnGAtsKCCbl1HivTpiTKRzRtnNaqoNEUF8ZTY8RnSa7JspmVuwJD
         HmVZ9hngCQvxba/X+vk+SPqhev8Nmg8+nHuB5PCkC2ozbbe6O1t1HGyzc5PWby4GVeKb
         /gmFWpY8zLo6wL8mio5PI1QTV8qK8D1P9I0mMjfnUe2kkg8EI8zhZc9bSSP3pGsX5trv
         Ll9hmO1M9P9GKGERDWNe+6vYbinMoHFFmI8Wu9KvHB9FZ5mQ5z8vVIAr2Q27wXj0sbvU
         ltmKemft52lPjMVU0fDNZ3fHL7bYgVxyrGM79jRhHz5JVYqgHKn0JeSudQlT9jYT74cy
         jfzg==
X-Gm-Message-State: AOJu0YzON6lyaV76u5z07Br2Yq7N7UePKrMh/uGJUjuaW8AFXKVvVxUp
	oQLq0rwil1sAruf4ODHfk1X+UA==
X-Google-Smtp-Source: AGHT+IEkROT2Zc5Hlz2XunqbDmD4go7yi0hmtqMvT3a8XjwaqPTovpYGT0//l0lNIYQkihxLKReEsw==
X-Received: by 2002:a05:600c:4f8a:b0:40a:5c71:2c3e with SMTP id n10-20020a05600c4f8a00b0040a5c712c3emr6350067wmq.19.1700492624536;
        Mon, 20 Nov 2023 07:03:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c1d0400b004067e905f44sm13831459wms.9.2023.11.20.07.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:03:44 -0800 (PST)
Date: Mon, 20 Nov 2023 10:03:41 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: tomas.winkler@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	alexander.usyskin@intel.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] misc: mei: client.c: fix some error code problem in
 mei_cl_write
Message-ID: <92972476-0b1f-4d0a-9951-af3fc8bc6e65@suswa.mountain>
References: <20231120085343.157381-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120085343.157381-1-suhui@nfschina.com>

On Mon, Nov 20, 2023 at 04:53:45PM +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'rets' is never
> read. Remove some useless code, and let 'buf_len = -EOVERFLOW' to make
> sure we can return '-EOVERFLOW'.
> 
> mei_msg_hdr_init() return negative error code, rets should be
> 'PTR_ERR(mei_hdr)' rather than '-PTR_ERR(mei_hdr)'.
> 
> Fixes: 0cd7c01a60f8 ("mei: add support for mei extended header.")
> Fixes: 8c8d964ce90f ("mei: move hbuf_depth from the mei device to the hw modules")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/misc/mei/client.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> index 9c8fc87938a7..00dac0a47da0 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -2011,7 +2011,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
>  
>  	mei_hdr = mei_msg_hdr_init(cb);
>  	if (IS_ERR(mei_hdr)) {
> -		rets = -PTR_ERR(mei_hdr);
> +		rets = PTR_ERR(mei_hdr);

KTODO: write a static checker rule which complains -PTR_ERR()

This might be complicated because there are parts of networking where
we store error codes as positive values.  But there is enough context in
this function to create some sort of warning about this code.  "Mixing
positive and negative error codes" perhaps?

$ git grep -n '\-PTR_ERR'
block/partitions/core.c:574:                   disk->disk_name, p, -PTR_ERR(part));
drivers/infiniband/ulp/ipoib/ipoib_multicast.c:291:                        -PTR_ERR(ah));
drivers/misc/mei/client.c:2014:         rets = -PTR_ERR(mei_hdr);
drivers/net/ethernet/intel/igb/igb_main.c:8963:                 unsigned int xdp_res = -PTR_ERR(skb);
drivers/net/ethernet/intel/igc/igc_main.c:2639:                 unsigned int xdp_res = -PTR_ERR(skb);
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2348:                     unsigned int xdp_res = -PTR_ERR(skb);
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5431:                         unsigned int xdp_res = -PTR_ERR(skb);
drivers/phy/sunplus/phy-sunplus-usb2.c:278:             ret = -PTR_ERR(phy);
drivers/scsi/libfc/fc_elsct.c:86:               switch (-PTR_ERR(fp)) {
drivers/scsi/libfc/fc_lport.c:1081:                  IS_ERR(fp) ? -PTR_ERR(fp) : 0, fc_lport_state(lport),
fs/ext4/indirect.c:1042:                                ext4_error_inode_block(inode, nr, -PTR_ERR(bh),
fs/jffs2/background.c:48:                       -PTR_ERR(tsk));
fs/ntfs/dir.c:92:                               -PTR_ERR(m));
fs/ntfs/dir.c:312:                              -PTR_ERR(page));
fs/ntfs/dir.c:643:                              -PTR_ERR(m));
fs/ntfs/dir.c:790:                              -PTR_ERR(page));
fs/ntfs/index.c:141:                            -PTR_ERR(m));
fs/ntfs/index.c:268:                            -PTR_ERR(page));
fs/ntfs/mft.c:162:      ntfs_error(ni->vol->sb, "Failed with error code %lu.", -PTR_ERR(m));
fs/ntfs/mft.c:289:                              "mft record, error code %ld.", -PTR_ERR(m));
net/ipv6/af_inet6.c:852:                        WRITE_ONCE(sk->sk_err_soft, -PTR_ERR(dst));
net/ipv6/inet6_connection_sock.c:123:           WRITE_ONCE(sk->sk_err_soft, -PTR_ERR(dst));
tools/lib/bpf/libbpf.c:10044:           errno = -PTR_ERR(ptr);
tools/lib/bpf/libbpf_internal.h:520:            errno = -PTR_ERR(ret);
tools/testing/selftests/bpf/prog_tests/btf_dump.c:59:           err = -PTR_ERR(btf);
tools/testing/selftests/bpf/prog_tests/sk_lookup.c:483:         errno = -PTR_ERR(link);

Quite a few of those were in printks and it might be an opportunity to
use %pe to print the ENOMEM etc strings instead of the number.

regards,
dan carpenter

