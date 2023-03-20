Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F2E4FB
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679322474; x=1710858474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LUNrtdSwwHMc4qJtxtzF+hn2LllZTlHtaPhQKDeqGkU=;
  b=GXwQ0+YtxGOjjuGLV711AkGV+iBW1evYt/SexzTbFeG7ViHaaz6pANKg
   /KE1B4kyccpcnb+Ltdmr+zrfRBVCDIfky2pWfKTCKDg2aWnIru98Hza4k
   BlhQOKkmBHd+VDOt2w5ZPqBDv3rELW/0viZa795Otfmg7kme6R0tHmqfO
   4hJLOU2aYnK/00qjIOL5uIFT4rR9EoD7v7JC1QJRxRS4H/68z878Ekf6/
   4K1lo+Mv+bQ0BYWdv19ZD3xhfhiv0pQm4YpfPbWPcyq6VxmGTdcV8eXym
   Jmg1NoqBKGcBmoETZI/kDe3sgQHZlmdZ1aGB95w+aup+bQ5y8ToOpxU9+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341033329"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="341033329"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 07:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="713588571"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="713588571"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga001.jf.intel.com with ESMTP; 20 Mar 2023 07:27:50 -0700
Date: Mon, 20 Mar 2023 22:16:26 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Tom Rix <trix@redhat.com>, mdf@kernel.org, hao.wu@intel.com,
	michal.simek@xilinx.com, nathan@kernel.org, ndesaulniers@google.com,
	linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] fpga: xilinx-pr-decoupler: remove unused
 xlnx_pr_decouple_read function
Message-ID: <ZBhqutJChvRkUsRL@yilunxu-OptiPlex-7050>
References: <20230317230617.1673923-1-trix@redhat.com>
 <c8eaefed-e1fd-e0c1-7e8f-561c20632646@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8eaefed-e1fd-e0c1-7e8f-561c20632646@amd.com>

On 2023-03-20 at 08:40:22 +0100, Michal Simek wrote:
> 
> 
> On 3/18/23 00:06, Tom Rix wrote:
> > CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
> > 
> > 
> > clang with W=1 reports
> > drivers/fpga/xilinx-pr-decoupler.c:37:19: error: unused function 'xlnx_pr_decouple_read' [-Werror,-Wunused-function]
> > static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
> >                    ^
> > This static function is not used, so remove it.
> > 
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >   drivers/fpga/xilinx-pr-decoupler.c | 6 ------
> >   1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
> > index 2d9c491f7be9..b6f18c07c752 100644
> > --- a/drivers/fpga/xilinx-pr-decoupler.c
> > +++ b/drivers/fpga/xilinx-pr-decoupler.c
> > @@ -34,12 +34,6 @@ static inline void xlnx_pr_decoupler_write(struct xlnx_pr_decoupler_data *d,
> >          writel(val, d->io_base + offset);
> >   }
> > 
> > -static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
> > -                                       u32 offset)
> > -{
> > -       return readl(d->io_base + offset);
> > -}
> > -
> >   static int xlnx_pr_decoupler_enable_set(struct fpga_bridge *bridge, bool enable)
> >   {
> >          int err;
> > --
> > 2.27.0
> > 
> 
> It should be fixed like this instead.
> 
> Thanks,
> Michal
> 
> diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
> index 2d9c491f7be9..58508f44cd49 100644
> --- a/drivers/fpga/xilinx-pr-decoupler.c
> +++ b/drivers/fpga/xilinx-pr-decoupler.c
> @@ -69,7 +69,7 @@ static int xlnx_pr_decoupler_enable_show(struct
> fpga_bridge *bridge)
>         if (err)
>                 return err;
> 
> -       status = readl(priv->io_base);
> +       status = xlnx_pr_decouple_read(priv);

OK, I'll drop the previous fix, and waiting for the new one.

Thanks,
Yilun

> 
>         clk_disable(priv->clk);
> 
