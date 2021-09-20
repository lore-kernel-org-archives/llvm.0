Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D693FC0
	for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 22:22:56 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id m3so71170819lfu.2
        for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 15:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dQAwy4pCmDHOI3u6mGzWC09yM6AY5TZbAb+EzcINoJY=;
        b=l1YvkaPVcmsLmCzP/adji66ECXNL6GnStXg3pZnnxLrw8wQQ0k0pT2XGIjRmhhAbJ7
         l3XJYx6IozNpijtPCDgKp19fje2lGqqkciiR9xgjUBfn5K/umXo2o4RWKURs3/PBNN19
         TYviLxZKVDajDpntLIoLPU5R/cTjxpe5j19dNkQSnFl1LYdy3LmdXk6NPdcP00yfJSQB
         idqc7ZYKJZxGHP031t1JwCkx+8Va3+8J1rfXPSs/gn2Oip3WZUE/lRXx0pyZtdDksxPz
         KDKBif9kXhnBbr3eBTDUNkP7fi8GdpqrBKv5Nt7LbeTl5abmaXpAzKvtu5S/fXwqk8GH
         ENIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dQAwy4pCmDHOI3u6mGzWC09yM6AY5TZbAb+EzcINoJY=;
        b=GuR2wYIu5ZFzAHPURkKVw46gh3dFwESlTKJOQdrTM76p6MlNUysrcYFs4BNXAOofOR
         1Z7GPcRtvrHT6NIu23a6osZ5YgkfhkBmik5ywvoo4YJm0oDCWwLNB/8QzNDbEtDxjNee
         g1s7opfzpKQGDRwRf3EmRTxWwTVwlg7TGt2d/IjajUA3tgojH1HDuDZTUQDlqx2v566s
         sw0D0aMCFrwBUzfGfHxmkwfovrFs+27H+BvIdcHOYG0q9CYaQ5Oq3slEwQdcN5bh4Pwt
         mcxstsuLO/kFdSUvebFjP0AJR/ZKli5FzXp+R1rmUhWDzQYbXaFtxYsYkb8atNOkxtuS
         tucg==
X-Gm-Message-State: AOAM531yTL0GB3qpqn8bfMQo69t2dlr9/2nuFNzVnjiFu4ao/yPiAIFS
	Dn2NBMSB6YnWmz9B/TvquT/x8NQuHcNqZnsro3SxNTa9aU63XA==
X-Google-Smtp-Source: ABdhPJy9EIwxCSbxw21oV3HzHr7d5RrPONZ42z/PHJcx8ml/tRKL/7PWTp2+Supfjib5qof+CvxYpNKqurTURUgCka4=
X-Received: by 2002:a05:6512:2294:: with SMTP id f20mr9928095lfu.489.1632176563813;
 Mon, 20 Sep 2021 15:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210920165347.164087-1-trix@redhat.com>
In-Reply-To: <20210920165347.164087-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Sep 2021 15:22:31 -0700
Message-ID: <CAKwvOdkSt5VymxtJ4jmOe9LM1rdy+CV7yYXhjCgOFAgbKGEPfQ@mail.gmail.com>
Subject: Re: [PATCH] octeontx2-af: fix uninitialized variable
To: trix@redhat.com
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, 
	jerinj@marvell.com, hkelam@marvell.com, sbhatta@marvell.com, 
	davem@davemloft.net, kuba@kernel.org, nathan@kernel.org, schalla@marvell.com, 
	vvelumuri@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 20, 2021 at 9:54 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Building with clang 13 reports this error
> rvu_nix.c:4600:7: error: variable 'val' is used uninitialized whenever
>   'if' condition is false
>                 if (!is_rvu_otx2(rvu))
>                     ^~~~~~~~~~~~~~~~~
>
> So initialize val.
>
> Fixes: 4b5a3ab17c6c ("octeontx2-af: Hardware configuration for inline IPsec")
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch, but it looks like Colin beat you to the punch.
In linux-next, I see:
commit d853f1d3c900 ("octeontx2-af: Fix uninitialized variable val")

> ---
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> index ea3e03fa55d45c..70431db866b328 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> @@ -4592,7 +4592,7 @@ static void nix_inline_ipsec_cfg(struct rvu *rvu, struct nix_inline_ipsec_cfg *r
>                                  int blkaddr)
>  {
>         u8 cpt_idx, cpt_blkaddr;
> -       u64 val;
> +       u64 val = 0;
>
>         cpt_idx = (blkaddr == BLKADDR_NIX0) ? 0 : 1;
>         if (req->enable) {
> --
> 2.26.3
>


-- 
Thanks,
~Nick Desaulniers
