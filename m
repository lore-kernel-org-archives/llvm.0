Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017985394
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662658336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7vdQ2qu0Q6UDlUW5EZdgzJdAsSSxP2qYnUiFlv2QNY=;
	b=Bn6SJJAMwnBcaQjfFT0vfJjfdn8Dfv8Ur/YwcD2OPS1Df0WBqKxSJs1wLMl/EZXiwYH8jf
	6vYAy2yP5iDz2p/AtZZIXEMorvxbdpn1xK6jD/4p3VFOQ6VDEU2t4gpoaXS3Nftd+mr/iI
	/3FtZl5kvubppNoUjNFVMbgvvRjFsQU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-_rd8x_SOPQGvU3XqFdL8lw-1; Thu, 08 Sep 2022 13:32:15 -0400
X-MC-Unique: _rd8x_SOPQGvU3XqFdL8lw-1
Received: by mail-qv1-f69.google.com with SMTP id c6-20020a0ce7c6000000b004abe95fbed8so3530127qvo.11
        for <llvm@lists.linux.dev>; Thu, 08 Sep 2022 10:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date;
        bh=N7vdQ2qu0Q6UDlUW5EZdgzJdAsSSxP2qYnUiFlv2QNY=;
        b=tyr5IMcH32fjj9YtiWgJLkATj+WutxXQoGPRSKJAE36TvhALdZu6vy23ulMc2aAxwO
         MlRXAANNAXlKwY50tDWwjXkrLg8eUszqGYd9kQkoGHMiSEMH5Ie7TxlJS1NWKIaQLRU8
         uGtHgFKY4EKMvsv6MRF1hQJhnuOOk65ejTLeKYFyCvw9xqOLcXiNLCulYc9XvrILUG0w
         Rbr2R7Cq/hQ16NJQMQ/MtTNVmu9doBUD9QS4XDVq6w1ylD+maO2gHS29d819TqjLzBkc
         rRso3iLlceYDvumstMTSUeRqT1W9WnMlt75uQG6cJ9jCClSAKVNqv34Ho2ip6sraZaC7
         1Kjg==
X-Gm-Message-State: ACgBeo0urruzIB1j04ToutHy9YffoRQFUwFqHrFbdjkZSeONoAxq378A
	O/PcgbgKavaP590CpKdDmdxA7qzRisz65B7GUPJ3M5nzSob1NMqsNUSDsx9G1SufnvyevfmPx3X
	tRnv+FWKlcBd5tQ==
X-Received: by 2002:ad4:5945:0:b0:4a5:152:d8e6 with SMTP id eo5-20020ad45945000000b004a50152d8e6mr8510330qvb.42.1662658333329;
        Thu, 08 Sep 2022 10:32:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4biu4IOf8QOZOTBDthSkpB4JaGuO2sUxFbWnMeyn/O3XvvxcKXZxr1atHiP+B5uZ0zDM5YaA==
X-Received: by 2002:ad4:5945:0:b0:4a5:152:d8e6 with SMTP id eo5-20020ad45945000000b004a50152d8e6mr8510320qvb.42.1662658333130;
        Thu, 08 Sep 2022 10:32:13 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id z4-20020ac84544000000b00343057845f7sm14191528qtn.20.2022.09.08.10.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 10:32:12 -0700 (PDT)
Subject: Re: [PATCH net-next] net/mlx5e: Ensure macsec_rule is always
 initiailized in macsec_fs_{r,t}x_add_rule()
To: Nathan Chancellor <nathan@kernel.org>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Boris Pismenny <borisp@nvidia.com>, Raed Salem <raeds@nvidia.com>,
 Lior Nahmanson <liorna@nvidia.com>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
References: <20220908153207.4048871-1-nathan@kernel.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <43471538-22b3-b80e-a1c6-7f3e24bc414a@redhat.com>
Date: Thu, 8 Sep 2022 10:32:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220908153207.4048871-1-nathan@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/8/22 8:32 AM, Nathan Chancellor wrote:
> Clang warns:
>
>    drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:539:6: error: variable 'macsec_rule' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>            if (err)
>                ^~~
>    drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:598:9: note: uninitialized use occurs here
>            return macsec_rule;
>                  ^~~~~~~~~~~
>    drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:539:2: note: remove the 'if' if its condition is always false
>            if (err)
>            ^~~~~~~~
>    drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:523:38: note: initialize the variable 'macsec_rule' to silence this warning
>            union mlx5e_macsec_rule *macsec_rule;
>                                                ^
>                                                = NULL
>    drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:1131:6: error: variable 'macsec_rule' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>            if (err)
>                ^~~
>    drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:1215:9: note: uninitialized use occurs here
>            return macsec_rule;
>                  ^~~~~~~~~~~
>    drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:1131:2: note: remove the 'if' if its condition is always false
>            if (err)
>            ^~~~~~~~
>    drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:1118:38: note: initialize the variable 'macsec_rule' to silence this warning
>            union mlx5e_macsec_rule *macsec_rule;
>                                                ^
>                                                = NULL
>    2 errors generated.
>
> If macsec_fs_{r,t}x_ft_get() fail, macsec_rule will be uninitialized.
> Use the existing initialization to NULL in the existing error path to
> ensure macsec_rule is always initialized.
>
> Fixes: e467b283ffd5 ("net/mlx5e: Add MACsec TX steering rules")
> Fixes: 3b20949cb21b ("net/mlx5e: Add MACsec RX steering rules")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1706
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Tom Rix <trix@redhat.com>
> ---
>
> The other fix I considered was shuffling the two if statements so that
> the allocation of macsec_rule came before the call to
> macsec_fs_{r,t}x_ft_get() but I was not sure what the implications of
> that change were.
>
> Also, I thought netdev was doing testing with clang so that new warnings
> do not show up. Did something break or stop working since this is the
> second time in two weeks that new warnings have appeared in -next?
>
>   .../net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c    | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c
> index 608fbbaa5a58..4467e88d7e7f 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c
> @@ -537,7 +537,7 @@ macsec_fs_tx_add_rule(struct mlx5e_macsec_fs *macsec_fs,
>   
>   	err = macsec_fs_tx_ft_get(macsec_fs);
>   	if (err)
> -		goto out_spec;
> +		goto out_spec_no_rule;
>   
>   	macsec_rule = kzalloc(sizeof(*macsec_rule), GFP_KERNEL);
>   	if (!macsec_rule) {
> @@ -591,6 +591,7 @@ macsec_fs_tx_add_rule(struct mlx5e_macsec_fs *macsec_fs,
>   
>   err:
>   	macsec_fs_tx_del_rule(macsec_fs, tx_rule);
> +out_spec_no_rule:
>   	macsec_rule = NULL;
>   out_spec:
>   	kvfree(spec);
> @@ -1129,7 +1130,7 @@ macsec_fs_rx_add_rule(struct mlx5e_macsec_fs *macsec_fs,
>   
>   	err = macsec_fs_rx_ft_get(macsec_fs);
>   	if (err)
> -		goto out_spec;
> +		goto out_spec_no_rule;
>   
>   	macsec_rule = kzalloc(sizeof(*macsec_rule), GFP_KERNEL);
>   	if (!macsec_rule) {
> @@ -1209,6 +1210,7 @@ macsec_fs_rx_add_rule(struct mlx5e_macsec_fs *macsec_fs,
>   
>   err:
>   	macsec_fs_rx_del_rule(macsec_fs, rx_rule);
> +out_spec_no_rule:
>   	macsec_rule = NULL;
>   out_spec:
>   	kvfree(spec);
>
> base-commit: 75554fe00f941c3c3d9344e88708093a14d2b4b8

