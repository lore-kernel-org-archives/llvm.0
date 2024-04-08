Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FFA1487F8
	for <llvm@lists.linux.dev>; Mon,  8 Apr 2024 21:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712612311; cv=none; b=YjY0Sq8N9lQWpssA+u4iprXB/puLe4OHkyXCbH9IMwZlHabxQYZU8WmDcoEbz3V8EVdEmhuPFd3GQr+zXoBgl7wyP4wg+s3JHfybey0HZHN7vn/CzYkbwgJy+Lrn/efFTAfvXmnbqHUjtb78BIDi994kYlIQNqxD6nLypVKDPtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712612311; c=relaxed/simple;
	bh=KY52t5SmcD33X1njIiCPQT2nlbfZxUYuE3YXh3Y14iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4S2efv7ZYJUrpPoMuqwEKHgYk94HvoHph0tmfvcIntzO7X2ecVgGBFgntH5CsRXIks+RP1aJPdFZokfIlK7REBF0Fow/dXJcWbIF/q57wHkcCjjpO9xddETRXImQy2kTsp4zFw4yv+hVbTKPx+xx05E86WQB66s+iHLtkuyj0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FgJDaul6; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FgJDaul6"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-36a0d09e6ffso19449595ab.0
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 14:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712612309; x=1713217109; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aMfPSpNtTsh6dXJQMFw9y71ouwbsnwGiuVvfGa0D6/g=;
        b=FgJDaul6V+AAz/9OF+l9xxgUxqktq9+Pz+P5k9EYmfQnHOjQDdhL/lmd/8U5YKFps4
         uZqzo+y/L3CK12MQt2LZhbmhnxX3p2/uI2oH0vBndD4Rsafh7v+bLmp9glKjONImAQ6m
         dIF30MY7e/UwnUd+l8Bfccd/2oHw7CBVP0hZ1hoRke8zig+LH9HSjIoHA4yxwYAyMiSu
         vndEYbRcwVgO9K0jQ/lGikQwAvWj2pP16wzvUOIxM4i5xejjz+JGRzM9LWT3j8p6f0Qi
         1gsffNXtz+Q6Z/wE/PLsdVPnSNvcszjh1CKbHiDVYjNHxwgVoWTeMdvtazQvbxiu/oTB
         0lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712612309; x=1713217109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMfPSpNtTsh6dXJQMFw9y71ouwbsnwGiuVvfGa0D6/g=;
        b=N06+OZv2A1d7aYjMHfmC+ydiPyTKkAtcDyHBTyJeeQ0IkGjQ0brwrDGVSxXyqJV2OL
         7aFNNWtQd1MSRk8dTDqAZFXdZxuJm+lM9D5/FndBITp17t7zgDBl05xKlYBgmf/PxFGo
         Zx8HpYkIoradDf57U/luMq0KIGVa12tGCJKLy3kEO4vn31XsCb+/iVwcGNhHprI20PuG
         ckbsyuQimZSVGeC33BSzZUv/fgNUKm8YPR4/nEYK4oGrBHrmCdAZEM8vQ9s+RN7O27WI
         nxXKWdk+3qWMlIgn8tfAsJDAdAxG1Du0CJLg42DwKrIhRkwes+UAdNNQlTucQjZp7zCV
         s2QA==
X-Forwarded-Encrypted: i=1; AJvYcCWU7MKwVBqAfXyiSWkG9y2dyhGAYHE9OyG2EUqeTeB2f/wGbKlvTR/olF0nFvYWgaRTrgB+Zhn/KryF8T/fmk+tjFI/WQ==
X-Gm-Message-State: AOJu0YzKwUJDzAxog88y5jbyl/zpAFcvPT6DCDYODszcNfN01AmXXLAK
	AM0B41+AuoGqcszN2RdQ7CC8MQFno00RwHbAIulQdHNw87BTlC1CDcx8Q754DQ==
X-Google-Smtp-Source: AGHT+IEqoqkR5AWqou6onCNjn8vaNElyi1V6FD1NmKsITlpZWvsr/E3SBZIBNs73yi5+UHFFMvVmXg==
X-Received: by 2002:a05:6602:3f02:b0:7d5:c902:62ef with SMTP id em2-20020a0566023f0200b007d5c90262efmr11294477iob.13.1712612309089;
        Mon, 08 Apr 2024 14:38:29 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id bv24-20020a056638449800b0047a4a3e14b8sm2775504jab.174.2024.04.08.14.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 14:38:28 -0700 (PDT)
Date: Mon, 8 Apr 2024 21:38:26 +0000
From: Justin Stitt <justinstitt@google.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Long Li <longli@microsoft.com>, Ajay Sharma <sharmaajay@microsoft.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Shradha Gupta <shradhagupta@linux.microsoft.com>, 
	Konstantin Taranov <kotaranov@microsoft.com>, linux-rdma@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/3] RDMA/mana_ib: Prefer struct_size over open coded
 arithmetic
Message-ID: <bvcyipeq22p3gtozzpb3jkmp2tcjgil2hru3ecussflroxiz2r@4nr3f7elpmvs>
References: <20240406142337.16241-1-erick.archer@outlook.com>
 <AS8PR02MB72375EB06EE1A84A67BE722E8B022@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB72375EB06EE1A84A67BE722E8B022@AS8PR02MB7237.eurprd02.prod.outlook.com>

Hi,

On Sat, Apr 06, 2024 at 04:23:36PM +0200, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
> 
> As the "req" variable is a pointer to "struct mana_cfg_rx_steer_req_v2"
> and this structure ends in a flexible array:
> 
> struct mana_cfg_rx_steer_req_v2 {
> 	[...]
>         mana_handle_t indir_tab[] __counted_by(num_indir_entries);
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the calculation "size + size * count" in
> the kzalloc() function.
> 
> Moreover, use the "offsetof" helper to get the indirect table offset
> instead of the "sizeof" operator and avoid the open-coded arithmetic in
> pointers using the new flex member. This new structure member also allow
> us to remove the "req_indir_tab" variable since it is no longer needed.
> 
> This way, the code is more readable and safer.
> 
> This code was detected with the help of Coccinelle, and audited and
> modified manually.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  drivers/infiniband/hw/mana/qp.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/mana/qp.c b/drivers/infiniband/hw/mana/qp.c
> index ef0a6dc664d0..4cd8f8afe80d 100644
> --- a/drivers/infiniband/hw/mana/qp.c
> +++ b/drivers/infiniband/hw/mana/qp.c
> @@ -15,15 +15,13 @@ static int mana_ib_cfg_vport_steering(struct mana_ib_dev *dev,
>  	struct mana_port_context *mpc = netdev_priv(ndev);
>  	struct mana_cfg_rx_steer_req_v2 *req;
>  	struct mana_cfg_rx_steer_resp resp = {};
> -	mana_handle_t *req_indir_tab;
>  	struct gdma_context *gc;
>  	u32 req_buf_size;
>  	int i, err;
>  
>  	gc = mdev_to_gc(dev);
>  
> -	req_buf_size =
> -		sizeof(*req) + sizeof(mana_handle_t) * MANA_INDIRECT_TABLE_SIZE;
> +	req_buf_size = struct_size(req, indir_tab, MANA_INDIRECT_TABLE_SIZE);
>  	req = kzalloc(req_buf_size, GFP_KERNEL);
>  	if (!req)
>  		return -ENOMEM;
> @@ -44,20 +42,20 @@ static int mana_ib_cfg_vport_steering(struct mana_ib_dev *dev,
>  		req->rss_enable = true;
>  
>  	req->num_indir_entries = MANA_INDIRECT_TABLE_SIZE;
> -	req->indir_tab_offset = sizeof(*req);
> +	req->indir_tab_offset = offsetof(struct mana_cfg_rx_steer_req_v2,
> +					 indir_tab);
>  	req->update_indir_tab = true;
>  	req->cqe_coalescing_enable = 1;
>  
> -	req_indir_tab = (mana_handle_t *)(req + 1);
>  	/* The ind table passed to the hardware must have
>  	 * MANA_INDIRECT_TABLE_SIZE entries. Adjust the verb
>  	 * ind_table to MANA_INDIRECT_TABLE_SIZE if required
>  	 */
>  	ibdev_dbg(&dev->ib_dev, "ind table size %u\n", 1 << log_ind_tbl_size);
>  	for (i = 0; i < MANA_INDIRECT_TABLE_SIZE; i++) {
> -		req_indir_tab[i] = ind_table[i % (1 << log_ind_tbl_size)];
> +		req->indir_tab[i] = ind_table[i % (1 << log_ind_tbl_size)];
>  		ibdev_dbg(&dev->ib_dev, "index %u handle 0x%llx\n", i,
> -			  req_indir_tab[i]);
> +			  req->indir_tab[i]);
>  	}
>  
>  	req->update_hashkey = true;
> -- 
> 2.25.1
> 

Thanks
Justin
