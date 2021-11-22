Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5BB2C82
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 09:58:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B542814C3;
	Mon, 22 Nov 2021 10:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1637575095;
	bh=f2jhVUKv6s52hV3/IC2eYnDVlUxjKpkzOLepxVO4OCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMb8ZXQSzMcCf3qh2k4HBpdL+jyckPVLAt/ycXNiRg8SDjchu3EUqxViqdC2CKReF
	 sMaC0OnKG7tjH9gKXMWDvrOYWENRgKMfajuf4G2NPqEIB9MzANVz6A2nXJ2s8ig1iy
	 IzeNv208YSiF5Pq4pgZoG5Iis1lbENhbE0dnEKWU=
Date: Mon, 22 Nov 2021 11:57:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 05/10] media: mc: mark a debug function with
 __maybe_unused
Message-ID: <YZtpnjPcGxVwhe61@pendragon.ideasonboard.com>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
 <8a18223a184901971137954903ad59bd152d0d47.1637573097.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a18223a184901971137954903ad59bd152d0d47.1637573097.git.mchehab+huawei@kernel.org>

Hi Mauro,

Thank you for the patch.

On Mon, Nov 22, 2021 at 09:26:07AM +0000, Mauro Carvalho Chehab wrote:
> The gobj_type() function translates the media object type into
> a name, being useful for debugging purposes. It is currently
> not used, but let's keep it around, as it can be useful.

Don't we usually remove dead code, and add it back later when and if
needed, unless we know the code will be used in the near future ? I
don't care too much either way.

> So, mark it with __maybe_unused, in order to shut up a
> clang warning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/mc/mc-entity.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index f40f41977142..b0ea145ac9c0 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -14,7 +14,7 @@
>  #include <media/media-entity.h>
>  #include <media/media-device.h>
>  
> -static inline const char *gobj_type(enum media_gobj_type type)
> +static inline __maybe_unused const char *gobj_type(enum media_gobj_type type)
>  {
>  	switch (type) {
>  	case MEDIA_GRAPH_ENTITY:

-- 
Regards,

Laurent Pinchart
