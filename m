Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA0D46D082
	for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650537; cv=pass; b=gcZsAky8tyXpzwdmgKSnYZk2O+/+3GN2kIvK2NrlnA/7E07fQ7QGpACKtHruqQNvTKaUSkyZzmt1ivziN8K9C3Y2WjBFTIciLSDjveMLPQfYNsPwf+aWzI2dHtXTkZa3TCJ09gHnzeUbtlRmsWRkM7WB9o1M/F9/17YQsF/4o4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650537; c=relaxed/simple;
	bh=lTgHdKMh+BlzjJFXdBt8hCdAGNDjBwZXNyyCB+G0i5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfCIru3iXNRerpsrc530r9ANzMXqyFjPHiC4CdCoI2g6sXMlsZKlKiPyaFEFmLCPNwWxFftcXkFmOLKFfMXbor7UHMmybOPIcBFq8iTqOiEwNhQcwkNUSxd6ThKyagZc0DhAvm4XIH4JB2uN615aXyc5ZsBjtYQD5vd5GKE+8aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pu3vcINL; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pu3vcINL"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-497deab2d66so3919701b6e.0
        for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 09:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784650534; cv=none;
        d=google.com; s=arc-20260327;
        b=aWIvlNlD6pWct/32J26ZPaPxJbLgirLzGNNE8V3OikwaewyzT/MMP2xN9dOCQFXaDc
         5qEmBY+UeFcbnsxjC2kCAEyWbIUyDui87+op/9RIjYyLk28h41RkINtyVD+Z9mcXHUu9
         DSPJNjnpdV5h3leemfeZNYpcRA4JYz5w/nkIwdvKSzQ70SgkWvU4WUveXwcbeMKcTkmW
         KltvqramkaL6L9rvE7K9SZS6e6UKqJruUZeXXn91iaN1KCNHEh+rcTEjQC4Ou+xe2ZMB
         POwSrbhldCpgQi7gai9kEFPhkx3KULsPCJM/1X/9Th97vs3XnhgfBDUjzll8gZNzX+vZ
         e61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=061OgT0DczhRmlwQ4HiKPIppyoeB89N03B5P6SpVAYA=;
        fh=KtcehI5HWjkIQLQ2lFE3gCHCFuy5S8UzZ/nprswxB0I=;
        b=MURlFDQ/zJ8tyB1Os09gXDhXnxL1xSWulnlOrLjzWdjLeq5zpH1bn7MvOSLm1fHDX8
         BCe50gLyX5q4A7bulekfVjUeSr4jKggG+Nkdsgev3Cny/fAVFL817mw/Ck+4ZcCPhED5
         ueGeQ+OszuDzV9NArqoi3lgR7iexn07GdVT8UitzCwErVsnu6PrLaPAinHfBVzydHOp5
         h/IQ2UygKpPVMA9kiPN+CX78ibBt/o2McQ72OYOk+4CElHglWJMbn+uQ7WQ4eBzZa3Fl
         U/bnJ7ebuaQ/2wYj5npNM2G07ubuKATQ6ZffYpowozfJG/+wgHHf5o0sv4EuDXgN34Nf
         URUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784650534; x=1785255334; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=061OgT0DczhRmlwQ4HiKPIppyoeB89N03B5P6SpVAYA=;
        b=pu3vcINLkOslrVwdTUl0DsSa0CmAXkXVm9rLhDffZAjdXpZGCInVAipCxznd4ovowG
         Ujib5jb7Qr1YzibKeFQ2CxGVrIbbCTiWoVFDBvQooW2tC9ub0uxArp83onNJNAqXTv+9
         9XrU7NM9/rNF39Rkdnn5lR+ptZhYPQ9Y3IglnVg+LX74GwyGIpd9SZnu97eROgW4LlG4
         aj8rQMb1kRKUGZoTTuxCLR8wsz4/Q/oEIH9lOkrr/5MxUiLAEHQk+cnM5xeP8e7gCDfh
         hN2bm14jNgjsvoC94e/ERoN5C6YxCVgtq61Bcvx2M1CfYssgjVbwR1/cqVxh9qwa/ehc
         lwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650534; x=1785255334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=061OgT0DczhRmlwQ4HiKPIppyoeB89N03B5P6SpVAYA=;
        b=IXfGR+abOVv4uBF1RPurGb12GdYjgIdB4ebjPVnQDOtWtBs6x5oGVkKDxAag0MvKrQ
         CYp0h3ctLzJjzkZTh3iXy4Can2/9bgY6xcD3++RVR/P39JuM01kmQJWvIEENcJy5HKXT
         iPyo/ISEkUOYuxdJVDOpXSwuHx1XxENLQ65cgd80KkYUYe24o2xuQl/jby4WMHw9I/nY
         LR0V+QpBVY1ZCf/M7KuJakz7vxIdKpYwMThJLgxecTpnvuZgaWhMT+HBKNwPm7Rok9/1
         7RtBKEkGBD56Jgy+vsy5hfZCYKp7baem27duWT9ca2TtBftILDz8dfvwq2pPQePSsHFH
         iw9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr9gZKsvKuq8KW5ilqS1V4qmaNgIayIVEgT75jN17IbuXPEIQ71T2wTt5TulGcPWVDLl9Cq@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc32rZ+MWdC8wu2sDLQD/YEmO5Gyu7n/7ND5ggjhitDjeQz2/Y
	XiEZTyqdG1zw7NgZB8aqKnRr0vf//OPd/SZUeyvgYYjDWLC0vFyOy03unPwsYdtN+fLkCeI1BDe
	j1LD7KIdpRpc6VkOzI0K0bVzYwi7H4g8=
X-Gm-Gg: AfdE7cms8tivIW9OOjl48KC/g7sXXESzxd4SjWbai5Ej4EhrfrQU1bMkviXhdSwK55R
	lEh8vC2u8xN6Zw85wxe8xN1XqV/v961YOf5hVvdUYrHqPWf/tksQzW69fB4gDB44sz5jA9oitsH
	hHcMborwZhcwoixVONapBx0TBrp0r1PrTtRnTy2I2qkAMbGF68YGz0MFW4hFLbVuuuOzKelMAYr
	IOu5aQ32qe9jxOKFW2ZiW/ujVhhkyAqJktmGnQopOMtnIF9LlKzpxzSwzuu9VY=
X-Received: by 2002:a05:6808:1719:b0:495:ca1b:7865 with SMTP id
 5614622812f47-4aaaa45f35fmr115856b6e.11.1784650533635; Tue, 21 Jul 2026
 09:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260719175857.4071636-1-ap420073@gmail.com> <20260719175857.4071636-3-ap420073@gmail.com>
 <CAHS8izMU4gQCH2v0dcOFkjP6Sxj7RUvC8=Baet=+pFXG24qh7A@mail.gmail.com>
In-Reply-To: <CAHS8izMU4gQCH2v0dcOFkjP6Sxj7RUvC8=Baet=+pFXG24qh7A@mail.gmail.com>
From: Taehee Yoo <ap420073@gmail.com>
Date: Wed, 22 Jul 2026 01:15:21 +0900
X-Gm-Features: AUfX_myzxRudA1U0N4kTpj_-EeksspXQRshMpn_Oino0jucUwXolnXuNEcZWdbw
Message-ID: <CAMArcTXba+A+MR2rpODbpdWbHOE3XLi6RfkCsK9fjgWzzTxSow@mail.gmail.com>
Subject: Re: [RFC PATCH net-next 02/13] net: devmem: extend memory provider
 for knod
To: Mina Almasry <almasrymina@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Alexei Starovoitov <ast@kernel.org>, 
	amd-gfx@lists.freedesktop.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Andrii Nakryiko <andrii@kernel.org>, Bill Wendling <morbo@google.com>, bpf@vger.kernel.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, David Airlie <airlied@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	dri-devel@lists.freedesktop.org, Eduard Zingerman <eddyz87@gmail.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Eric Dumazet <edumazet@google.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Hoyeon Lee <hoyeon.rhee@gmail.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Leon Romanovsky <leon@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rdma@vger.kernel.org, llvm@lists.linux.dev, 
	Mark Bloch <mbloch@nvidia.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Michael Chan <michael.chan@broadcom.com>, Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Shuah Khan <shuah@kernel.org>, Simona Vetter <simona@ffwll.ch>, Simon Horman <horms@kernel.org>, 
	Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 4:44=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>

Hi Mina,
Thanks a lot for your review!

> On Sun, Jul 19, 2026 at 11:03=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> =
wrote:
> >
> > Extend the devmem memory-provider path so a knod accelerator can back a
> > NIC page_pool with accelerator-exported memory (dma-buf), letting the
> > NIC DMA received packets directly into accelerator memory.
> >
> > Signed-off-by: Taehee Yoo <ap420073@gmail.com>
>
> Changes look fine in general but I do not understand in the design how
> the page_pool not bound to rx queue would be used. Maybe elaborate on
> the design in the commit message or cover letter in the next
> iteration.
>

Sorry, this is not clear from the commit message or cover letter.

We added a custom provider type for page_pool that allocates GTT memory
- host memory that is also mapped to a GPU VA, which lets us copy between
VRAM and host without a separate staging buffer. So when the XDP verdict
is XDP_PASS, or on the IPsec path, this page_pool is used for the
allocation. To configure the page_pool with our KNOD backend, we
define mp_ops/priv in knod_core.c and set them directly as the
page_pool's mp_ops/priv, rather than going through netdev_rx_queue.

As a result, each combined channel has two page_pools: a NETMEM
page_pool created by the device driver to refill the RX ring through
the normal netdev_rx_queue path, and one CUSTOM_PROVIDER page_pool
created and managed by knod core for the XDP_PASS / IPsec allocations.
The latter is created per channel by knod core, so it is not bound
through netdev_rx_queue.

We will describe this distinction in the next revision.

> > (cherry picked from commit d511a8cb3e229f8f5cf060985880d45bd384db87)
>
> I guess remove unintended cherry-pick tag.
>

Yes, we will remove it.

> > ---
> >  include/net/devmem.h                    |  58 +++++++++++++
> >  include/net/netmem.h                    |   9 +++
> >  include/net/page_pool/memory_provider.h |   4 +
> >  include/net/page_pool/types.h           |  23 +++++-
> >  net/core/devmem.c                       | 103 +++++++++++++++++++-----
> >  net/core/devmem.h                       |   7 +-
> >  net/core/page_pool.c                    |  22 ++++-
> >  7 files changed, 198 insertions(+), 28 deletions(-)
> >  create mode 100644 include/net/devmem.h
> >
> > diff --git a/include/net/devmem.h b/include/net/devmem.h
> > new file mode 100644
> > index 000000000000..f1c3895d7833
> > --- /dev/null
> > +++ b/include/net/devmem.h
>
> Try to keep only include/net/netmem.h and net/core/devmem.h rather
> than add an include/net/devmem.h
>

Thanks. We will keep the declarations in include/net/netmem.h and

> > @@ -0,0 +1,58 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Device memory TCP support
> > + *
> > + * Authors:    Mina Almasry <almasrymina@google.com>
> > + *             Willem de Bruijn <willemb@google.com>
> > + *             Kaiyuan Zhang <kaiyuanz@google.com>
> > + *
> > + */
> > +#ifndef _NET_DEVMEM_H
> > +#define _NET_DEVMEM_H
> > +
> > +#include <linux/dma-direction.h>
> > +#include <linux/err.h>
> > +#include <linux/types.h>
> > +
> > +struct device;
> > +struct dma_buf;
> > +struct dma_buf_attach_ops;
> > +struct net_device;
> > +struct net_devmem_dmabuf_binding;
> > +struct netlink_ext_ack;
> > +
> > +#if defined(CONFIG_NET_DEVMEM)
> > +struct net_devmem_dmabuf_binding *
> > +__net_devmem_binding_create(struct net_device *dev, struct device *dma=
_dev,
> > +                           struct dma_buf *dmabuf,
> > +                           enum dma_data_direction direction,
> > +                           const struct dma_buf_attach_ops *importer_o=
ps,
> > +                           struct netlink_ext_ack *extack);
> > +int net_devmem_bind_dmabuf_to_queue_direct(struct net_device *dev, u32=
 rxq_idx,
> > +                                          struct net_devmem_dmabuf_bin=
ding *binding);
> > +void net_devmem_unbind_dmabuf_direct(struct net_devmem_dmabuf_binding =
*binding);
> > +#else
> > +static inline struct net_devmem_dmabuf_binding *
> > +__net_devmem_binding_create(struct net_device *dev, struct device *dma=
_dev,
> > +                           struct dma_buf *dmabuf,
> > +                           enum dma_data_direction direction,
> > +                           const struct dma_buf_attach_ops *importer_o=
ps,
> > +                           struct netlink_ext_ack *extack)
> > +{
> > +       return ERR_PTR(-EOPNOTSUPP);
> > +}
> > +
> > +static inline int
> > +net_devmem_bind_dmabuf_to_queue_direct(struct net_device *dev, u32 rxq=
_idx,
> > +                                      struct net_devmem_dmabuf_binding=
 *binding)
> > +{
> > +       return -EOPNOTSUPP;
> > +}
> > +
> > +static inline void
> > +net_devmem_unbind_dmabuf_direct(struct net_devmem_dmabuf_binding *bind=
ing)
> > +{
> > +}
> > +#endif
> > +
> > +#endif /* _NET_DEVMEM_H */
> > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > index bccacd21b6c3..3ddfbd37500f 100644
> > --- a/include/net/netmem.h
> > +++ b/include/net/netmem.h
> > @@ -127,6 +127,15 @@ static inline void net_iov_init(struct net_iov *ni=
ov,
> >         niov->type =3D type;
> >  }
> >
> > +/* Global page index within the dma-buf, accounting for multi-chunk
> > + * scatter-gather layouts where each chunk owner's niovs start at 0.
> > + */
> > +static inline unsigned int net_iov_binding_idx(const struct net_iov *n=
iov)
> > +{
> > +       return (net_iov_owner(niov)->base_virtual >> PAGE_SHIFT) +
> > +              net_iov_idx(niov);
> > +}
> > +
> >  /* netmem */
> >
> >  /**
> > diff --git a/include/net/page_pool/memory_provider.h b/include/net/page=
_pool/memory_provider.h
> > index 255ce4cfd975..4b58a9702fb7 100644
> > --- a/include/net/page_pool/memory_provider.h
> > +++ b/include/net/page_pool/memory_provider.h
> > @@ -23,6 +23,10 @@ bool net_mp_niov_set_dma_addr(struct net_iov *niov, =
dma_addr_t addr);
> >  void net_mp_niov_set_page_pool(struct page_pool *pool, struct net_iov =
*niov);
> >  void net_mp_niov_clear_page_pool(struct net_iov *niov);
> >
> > +void page_pool_provider_set_netmem(struct page_pool *pool, netmem_ref =
netmem,
> > +                                  dma_addr_t addr);
> > +void page_pool_clear_pp_info(netmem_ref netmem);
> > +
> >  int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
> >                       const struct pp_memory_provider_params *p,
> >                       struct netlink_ext_ack *extack);
> > diff --git a/include/net/page_pool/types.h b/include/net/page_pool/type=
s.h
> > index 03da138722f5..3e866f249768 100644
> > --- a/include/net/page_pool/types.h
> > +++ b/include/net/page_pool/types.h
> > @@ -31,8 +31,16 @@
> >   */
> >  #define PP_FLAG_ALLOW_UNREADABLE_NETMEM BIT(3)
> >
> > +/* Driver-managed pool with a directly-supplied memory provider, not b=
ound to a
> > + * netdev rx queue. Setting this flag requires page_pool_params.mp_ops=
 and
> > + * .mp_priv to both be set.
> > + */
> > +#define PP_FLAG_CUSTOM_MEMORY_PROVIDER BIT(4)
> > +
> >  #define PP_FLAG_ALL            (PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV=
 | \
> > -                                PP_FLAG_SYSTEM_POOL | PP_FLAG_ALLOW_UN=
READABLE_NETMEM)
> > +                                PP_FLAG_SYSTEM_POOL | \
> > +                                PP_FLAG_ALLOW_UNREADABLE_NETMEM | \
> > +                                PP_FLAG_CUSTOM_MEMORY_PROVIDER)
> >
> >  /* Index limit to stay within PP_DMA_INDEX_BITS for DMA indices */
> >  #define PP_DMA_INDEX_LIMIT XA_LIMIT(1, BIT(PP_DMA_INDEX_BITS) - 1)
> > @@ -54,11 +62,11 @@
> >   * would have to take a slower code path.
> >   */
> >  #if PAGE_SIZE >=3D SZ_64K
> > -#define PP_ALLOC_CACHE_REFILL  4
> > +#define PP_ALLOC_CACHE_REFILL  256
> >  #elif PAGE_SIZE >=3D SZ_16K
> > -#define PP_ALLOC_CACHE_REFILL  16
> > +#define PP_ALLOC_CACHE_REFILL  1024
> >  #else
> > -#define PP_ALLOC_CACHE_REFILL  64
> > +#define PP_ALLOC_CACHE_REFILL  4096
> >  #endif
> >
>
> I'm guessing this is just a workaround/optimization. You need a proper
> change for this, maybe make it configurable arguments when creating a
> pp or something.
>

Agreed. We will rework this as a per-pool setting instead of changing
the global page_pool cache size.

> >  #define PP_ALLOC_CACHE_SIZE    (PP_ALLOC_CACHE_REFILL * 2)
> > @@ -67,6 +75,8 @@ struct pp_alloc_cache {
> >         netmem_ref cache[PP_ALLOC_CACHE_SIZE];
> >  };
> >
> > +struct memory_provider_ops;
> > +
> >  /**
> >   * struct page_pool_params - page pool parameters
> >   * @fast:      params accessed frequently on hotpath
> > @@ -83,6 +93,9 @@ struct pp_alloc_cache {
> >   * @queue_idx: queue idx this page_pool is being created for.
> >   * @flags:     PP_FLAG_DMA_MAP, PP_FLAG_DMA_SYNC_DEV, PP_FLAG_SYSTEM_P=
OOL,
> >   *             PP_FLAG_ALLOW_UNREADABLE_NETMEM.
> > + * @mp_ops:    driver-supplied memory provider for a pool not bound to=
 a
> > + *             netdev rx queue (NULL to use rxq->mp_params instead)
> > + * @mp_priv:   context passed to @mp_ops
> >   */
> >  struct page_pool_params {
> >         struct_group_tagged(page_pool_params_fast, fast,
> > @@ -99,6 +112,8 @@ struct page_pool_params {
> >                 struct net_device *netdev;
> >                 unsigned int queue_idx;
> >                 unsigned int    flags;
> > +               const struct memory_provider_ops *mp_ops;
> > +               void *mp_priv;
> >  /* private: used by test code only */
> >                 void (*init_callback)(netmem_ref netmem, void *arg);
> >                 void *init_arg;
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 957d6b96216b..9e21cffc9643 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> > @@ -121,12 +121,9 @@ void net_devmem_free_dmabuf(struct net_iov *niov)
> >         gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
> >  }
> >
> > -void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *bindin=
g)
> > +static void
> > +net_devmem_binding_unpublish(struct net_devmem_dmabuf_binding *binding=
)
> >  {
> > -       struct netdev_rx_queue *rxq;
> > -       unsigned long xa_idx;
> > -       unsigned int rxq_idx;
> > -
> >         xa_erase(&net_devmem_dmabuf_bindings, binding->id);
> >
> >         /* Ensure no tx net_devmem_lookup_dmabuf() are in flight after =
the
> > @@ -136,6 +133,15 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dm=
abuf_binding *binding)
> >
> >         if (binding->list.next)
> >                 list_del(&binding->list);
> > +}
> > +
> > +void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *bindin=
g)
> > +{
> > +       struct netdev_rx_queue *rxq;
> > +       unsigned long xa_idx;
> > +       unsigned int rxq_idx;
> > +
> > +       net_devmem_binding_unpublish(binding);
> >
> >         xa_for_each(&binding->bound_rxqs, xa_idx, rxq) {
> >                 const struct pp_memory_provider_params mp_params =3D {
> > @@ -151,6 +157,47 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dm=
abuf_binding *binding)
> >         percpu_ref_kill(&binding->ref);
> >  }
> >
> > +/* Bind/unbind variants for in-kernel offload importers that drive the=
 rx
> > + * queue lifecycle themselves. The mp_params are poked directly, witho=
ut the
> > + * tcp-data-split/XDP guards or the queue reconfigure that the netlink=
 control
> > + * plane applies through netif_mp_open_rxq()/netif_mp_close_rxq().
> > + */
> > +int net_devmem_bind_dmabuf_to_queue_direct(struct net_device *dev, u32=
 rxq_idx,
> > +                                          struct net_devmem_dmabuf_bin=
ding *binding)
> > +{
>
> The LLM says in this function you need to check if the queue is
> already bound to a devmem tcp memory provider.
>

Right. We will reject the bind if the RX queue already has a memory
provider.

Thanks a lot!
Taehee Yoo

> --
> Thanks,
> Mina
