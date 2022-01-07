Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8B2C9C
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 18:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4241DC36AE0;
	Fri,  7 Jan 2022 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641578506;
	bh=+qjyaVvD6yhc1kx5AMm5KRGcMtQ7L9xt6eaIskMzOus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFPvoDCzdbKjY/3u++IKiLESOg+fEWpwIojSiJHH9L94FEtweCzMRaDfJodymtsNQ
	 Wu8nDhYkKAvNg/h0dt45WIRN/gGWbmK5Gpi06ZkIwJmKYHWYm1hZ5naQmm4ara1jAP
	 B7zXamkBar38fhkXLROUMYvlT9bnN5rwEF6d8B0lRPif5BUZ2W1QCi+dcFDFBl3sH9
	 30efSquzsmsD+jKQ6mgI/xhlIG6rl/Jjq+oQ74euNKqK6S/nHGP/4d+lC+hjqBRviV
	 1Pp1uOqJTfqu168n8NpAkm1TeYrHjLk+wOAwn01hrg2FD9lzq6i//M9MaDzTnNIx1B
	 +zj4HBOeDLZgw==
Date: Fri, 7 Jan 2022 11:01:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Eli Cohen <elic@nvidia.com>
Cc: mst@redhat.com, jasowang@redhat.com,
	virtualization@lists.linux-foundation.org, lvivier@redhat.com,
	eperezma@redhat.com, llvm@lists.linux.dev,
	Si-Wei Liu <si-wei.liu@oracle.com>
Subject: Re: [PATCH v7 07/14] vdpa/mlx5: Support configuring max data
 virtqueue
Message-ID: <YdiABvwrK3WxfHqb@archlinux-ax161>
References: <20220105114646.577224-1-elic@nvidia.com>
 <20220105114646.577224-8-elic@nvidia.com>
 <99150f0c-6814-a0cc-8640-aa8014af6ed0@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99150f0c-6814-a0cc-8640-aa8014af6ed0@oracle.com>

Apologies if this reply is somewhat mangled. This patch did not appear
to make it to the mailing list so I had to use another reply that did to
base it on.

> On 1/5/2022 3:46 AM, Eli Cohen wrote:
> Check whether the max number of data virtqueue pairs was provided when a
> adding a new device and verify the new value does not exceed device
> capabilities.
> 
> In addition, change the arrays holding virtqueue and callback contexts
> to be dynamically allocated.
> 
> Signed-off-by: Eli Cohen <elic@nvidia.com>
> ---
> v6 -> v7:
> 1. Evaluate RQT table size based on config.max_virtqueue_pairs.
> 
>   drivers/vdpa/mlx5/net/mlx5_vnet.c | 51 ++++++++++++++++++++++---------
>   1 file changed, 37 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index 4a2149f70f1e..d4720444bf78 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -131,11 +131,6 @@ struct mlx5_vdpa_virtqueue {
>   	struct mlx5_vq_restore_info ri;
>   };
> -/* We will remove this limitation once mlx5_vdpa_alloc_resources()
> - * provides for driver space allocation
> - */
> -#define MLX5_MAX_SUPPORTED_VQS 16
> -
>   static bool is_index_valid(struct mlx5_vdpa_dev *mvdev, u16 idx)
>   {
>   	if (unlikely(idx > mvdev->max_idx))
> @@ -148,8 +143,8 @@ struct mlx5_vdpa_net {
>   	struct mlx5_vdpa_dev mvdev;
>   	struct mlx5_vdpa_net_resources res;
>   	struct virtio_net_config config;
> -	struct mlx5_vdpa_virtqueue vqs[MLX5_MAX_SUPPORTED_VQS];
> -	struct vdpa_callback event_cbs[MLX5_MAX_SUPPORTED_VQS + 1];
> +	struct mlx5_vdpa_virtqueue *vqs;
> +	struct vdpa_callback *event_cbs;
>   	/* Serialize vq resources creation and destruction. This is required
>   	 * since memory map might change and we need to destroy and create
> @@ -1218,7 +1213,7 @@ static void suspend_vqs(struct mlx5_vdpa_net *ndev)
>   {
>   	int i;
> -	for (i = 0; i < MLX5_MAX_SUPPORTED_VQS; i++)
> +	for (i = 0; i < ndev->mvdev.max_vqs; i++)
>   		suspend_vq(ndev, &ndev->vqs[i]);
>   }
> @@ -1244,8 +1239,14 @@ static int create_rqt(struct mlx5_vdpa_net *ndev)
>   	void *in;
>   	int i, j;
>   	int err;
> +	int num;
> -	max_rqt = min_t(int, MLX5_MAX_SUPPORTED_VQS / 2,
> +	if (!(ndev->mvdev.actual_features & BIT_ULL(VIRTIO_NET_F_MQ)))
> +		num = 1;
> +	else
> +		num = le16_to_cpu(ndev->config.max_virtqueue_pairs);
> +
> +	max_rqt = min_t(int, roundup_pow_of_two(num),
>   			1 << MLX5_CAP_GEN(ndev->mvdev.mdev, log_max_rqt_size));
>   	if (max_rqt < 1)
>   		return -EOPNOTSUPP;
> @@ -1262,7 +1263,7 @@ static int create_rqt(struct mlx5_vdpa_net *ndev)
>   	MLX5_SET(rqtc, rqtc, rqt_max_size, max_rqt);
>   	list = MLX5_ADDR_OF(rqtc, rqtc, rq_num[0]);
>   	for (i = 0, j = 0; i < max_rqt; i++, j += 2)
> -		list[i] = cpu_to_be32(ndev->vqs[j % ndev->mvdev.max_vqs].virtq_id);
> +		list[i] = cpu_to_be32(ndev->vqs[j % (2 * num)].virtq_id);
>   	MLX5_SET(rqtc, rqtc, rqt_actual_size, max_rqt);
>   	err = mlx5_vdpa_create_rqt(&ndev->mvdev, in, inlen, &ndev->res.rqtn);
> @@ -2220,7 +2221,7 @@ static int mlx5_vdpa_reset(struct vdpa_device *vdev)
>   	clear_vqs_ready(ndev);
>   	mlx5_vdpa_destroy_mr(&ndev->mvdev);
>   	ndev->mvdev.status = 0;
> -	memset(ndev->event_cbs, 0, sizeof(ndev->event_cbs));
> +	memset(ndev->event_cbs, 0, sizeof(*ndev->event_cbs) * (mvdev->max_vqs + 1));
>   	ndev->mvdev.actual_features = 0;
>   	++mvdev->generation;
>   	if (MLX5_CAP_GEN(mvdev->mdev, umem_uid_0)) {
> @@ -2293,6 +2294,8 @@ static void mlx5_vdpa_free(struct vdpa_device *vdev)
>   	}
>   	mlx5_vdpa_free_resources(&ndev->mvdev);
>   	mutex_destroy(&ndev->reslock);
> +	kfree(ndev->event_cbs);
> +	kfree(ndev->vqs);
>   }
>   static struct vdpa_notification_area mlx5_get_vq_notification(struct vdpa_device *vdev, u16 idx)
> @@ -2538,15 +2541,33 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
>   		return -EOPNOTSUPP;
>   	}
> -	/* we save one virtqueue for control virtqueue should we require it */
>   	max_vqs = MLX5_CAP_DEV_VDPA_EMULATION(mdev, max_num_virtio_queues);
> -	max_vqs = min_t(u32, max_vqs, MLX5_MAX_SUPPORTED_VQS);
> +	if (max_vqs < 2) {
> +		dev_warn(mdev->device,
> +			 "%d virtqueues are supported. At least 2 are required\n",
> +			 max_vqs);
> +		return -EAGAIN;
> +	}
> +
> +	if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MAX_VQP)) {
> +		if (add_config->net.max_vq_pairs > max_vqs / 2)
> +			return -EINVAL;
> +		max_vqs = min_t(u32, max_vqs, 2 * add_config->net.max_vq_pairs);
> +	} else {
> +		max_vqs = 2;
> +	}
>   	ndev = vdpa_alloc_device(struct mlx5_vdpa_net, mvdev.vdev, mdev->device, &mlx5_vdpa_ops,
>   				 name, false);
>   	if (IS_ERR(ndev))
>   		return PTR_ERR(ndev);
> +	ndev->vqs = kcalloc(max_vqs, sizeof(*ndev->vqs), GFP_KERNEL);
> +	ndev->event_cbs = kcalloc(max_vqs + 1, sizeof(*ndev->event_cbs), GFP_KERNEL);
> +	if (!ndev->vqs || !ndev->event_cbs) {
> +		err = -ENOMEM;
> +		goto err_alloc;
> +	}

Clang warns:

drivers/vdpa/mlx5/net/mlx5_vnet.c:2574:6: error: variable 'mvdev' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (!ndev->vqs || !ndev->event_cbs) {
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/vdpa/mlx5/net/mlx5_vnet.c:2660:14: note: uninitialized use occurs here
        put_device(&mvdev->vdev.dev);
                    ^~~~~
drivers/vdpa/mlx5/net/mlx5_vnet.c:2574:2: note: remove the 'if' if its condition is always false
        if (!ndev->vqs || !ndev->event_cbs) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/vdpa/mlx5/net/mlx5_vnet.c:2574:6: error: variable 'mvdev' is used uninitialized whenever '||' condition is true [-Werror,-Wsometimes-uninitialized]
        if (!ndev->vqs || !ndev->event_cbs) {
            ^~~~~~~~~~
drivers/vdpa/mlx5/net/mlx5_vnet.c:2660:14: note: uninitialized use occurs here
        put_device(&mvdev->vdev.dev);
                    ^~~~~
drivers/vdpa/mlx5/net/mlx5_vnet.c:2574:6: note: remove the '||' if its condition is always false
        if (!ndev->vqs || !ndev->event_cbs) {
            ^~~~~~~~~~~~~
drivers/vdpa/mlx5/net/mlx5_vnet.c:2534:29: note: initialize the variable 'mvdev' to silence this warning
        struct mlx5_vdpa_dev *mvdev;
                                   ^
                                    = NULL
2 errors generated.

I was going to send a patch just moving "err_alloc" right above "return err;"
but I don't think that is a proper fix. I think this patch is going to
result in memory leaks on the err_mpfs and err_mtu paths, as ndev->vqs
and ndev->event_cbs will have been allocated but they are only cleaned
up in mlx5_vdpa_free_resources(). Additionally, I don't think the
results of these allocations should be checked together, because one
could succeed and the other could fail, meaning one needs to be cleaned
up while the other doesn't.

Cheers,
Nathan

>   	ndev->mvdev.max_vqs = max_vqs;
>   	mvdev = &ndev->mvdev;
>   	mvdev->mdev = mdev;
> @@ -2627,6 +2648,7 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
>   		mlx5_mpfs_del_mac(pfmdev, config->mac);
>   err_mtu:
>   	mutex_destroy(&ndev->reslock);
> +err_alloc:
>   	put_device(&mvdev->vdev.dev);
>   	return err;
>   }
> @@ -2669,7 +2691,8 @@ static int mlx5v_probe(struct auxiliary_device *adev,
>   	mgtdev->mgtdev.ops = &mdev_ops;
>   	mgtdev->mgtdev.device = mdev->device;
>   	mgtdev->mgtdev.id_table = id_table;
> -	mgtdev->mgtdev.config_attr_mask = BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MACADDR);
> +	mgtdev->mgtdev.config_attr_mask = BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MACADDR) |
> +					  BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MAX_VQP);
>   	mgtdev->madev = madev;
>   	err = vdpa_mgmtdev_register(&mgtdev->mgtdev);
