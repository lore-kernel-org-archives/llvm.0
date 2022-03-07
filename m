Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A87C7E
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 17:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82ECC340F6;
	Mon,  7 Mar 2022 17:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646675671;
	bh=skJXL8/N2xCsgKAp+CXm32RgRJoIRM8CbDaIsqyS5+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVFXmd5iXoXH64fcOXo1x8kyRaopJJw7P0/ydyBOtJiC4KItvqq3AicpSs44vn1R1
	 0hM+MVkZk3BWyZIrzK0QLlWxeI6+8y27fhD63zmOfJk2Z8yrsXoEAm2W53wQmoteGE
	 e20cUSpUPPMvyySRtwRZS2NoBcxsIJbPB8G6IY2NNe6VW4rtq5SrVSoarx0Fy3W3LP
	 YGMaVIkxneeBXxN+M3tq+/BsAanyhmbsfaxP2a9xw2+bX7YhTQVIy9CyDsiPfJh1Cr
	 CUzPiFXLrPGY+blvo1zyWmq4IumfSEMLfUB4f69QbIqyUeRyLkNd8g8HBCmIta1EwG
	 Y96HaS1kd3SMg==
Date: Mon, 7 Mar 2022 10:54:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: trix@redhat.com
Cc: mst@redhat.com, jasowang@redhat.com, ndesaulniers@google.com,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] virtio_ring: Initialize vring_size_in_bytes
Message-ID: <YiZG0Nx9j++bJaA4@dev-arch.thelio-3990X>
References: <20220307174916.892433-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307174916.892433-1-trix@redhat.com>

On Mon, Mar 07, 2022 at 09:49:16AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> On the clang build, there is this error
> virtio_ring.c:1772:26: error: variable 'ring_size_in_bytes'
>   is uninitialized when used here
>   vring_free_queue(vdev, ring_size_in_bytes,
>                          ^~~~~~~~~~~~~~~~~~
> 
> ring_dma_addr was intialized twice, once with the ring_size_in_bytes.
> value.  So fix typo.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

I was getting ready to send the same patch.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/virtio/virtio_ring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 905c882600618..b2b567ebb9120 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1756,7 +1756,7 @@ static void vring_free_vring_packed(struct vring_packed *vring,
>  	ring                  = vring->ring;
>  	driver                = vring->driver;
>  	device                = vring->device;
> -	ring_dma_addr         = vring->ring_size_in_bytes;
> +	ring_size_in_bytes    = vring->ring_size_in_bytes;
>  	event_size_in_bytes   = vring->event_size_in_bytes;
>  	ring_dma_addr         = vring->ring_dma_addr;
>  	driver_event_dma_addr = vring->driver_event_dma_addr;
> -- 
> 2.26.3
> 
> 
