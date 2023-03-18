Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393FEC0
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679134243; x=1710670243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i/ijir56tdBUgAEBFOFtWVndt9Fv/1cvvyoH3zkEQNA=;
  b=Qc3LBL30sHkoafrSutP7p8I5/6eOcIcFVMH/Y1H+/Qxg/0gLfKw+v9f6
   /z30qbWwje3UKToZp/AMiUmv4K1ldNB5VmBlQPVIk1qUSZLXN778WP36Z
   pXEjsRYYNcfLESkPttxbZydzgkMseYQFZza6z5jZDusGCvYO/s6rCkezJ
   hgN8/szmCnsmLpgYmStl+imIi9QmJ5XJHnkeM4F+aymTf7od6BWvdGcDn
   ZqN9azlh6EapcJALON3KlILjgSxS80vtOviWbCuty0yNZSUc1i/RZOWdV
   jUpjU99YRvcBSPvMe7/Pcns9dBK2hU37kYcIQD1aHvAzpy0v9SMrzoejf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322271178"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="322271178"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 03:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="769655413"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="769655413"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2023 03:10:41 -0700
Date: Sat, 18 Mar 2023 17:59:20 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Tom Rix <trix@redhat.com>
Cc: mdf@kernel.org, hao.wu@intel.com, michal.simek@xilinx.com,
	nathan@kernel.org, ndesaulniers@google.com,
	linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] fpga: xilinx-pr-decoupler: remove unused
 xlnx_pr_decouple_read function
Message-ID: <ZBWLeC7UuDf+4dJE@yilunxu-OptiPlex-7050>
References: <20230317230617.1673923-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317230617.1673923-1-trix@redhat.com>

On 2023-03-17 at 19:06:17 -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/fpga/xilinx-pr-decoupler.c:37:19: error: unused function 'xlnx_pr_decouple_read' [-Werror,-Wunused-function]
> static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
>                   ^
> This static function is not used, so remove it.

I prefer to move the description as the first section. If you agree, I
could do it before apply.

Acked-by: Xu Yilun <yilun.xu@intel.com>

> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/fpga/xilinx-pr-decoupler.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
> index 2d9c491f7be9..b6f18c07c752 100644
> --- a/drivers/fpga/xilinx-pr-decoupler.c
> +++ b/drivers/fpga/xilinx-pr-decoupler.c
> @@ -34,12 +34,6 @@ static inline void xlnx_pr_decoupler_write(struct xlnx_pr_decoupler_data *d,
>  	writel(val, d->io_base + offset);
>  }
>  
> -static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
> -					u32 offset)
> -{
> -	return readl(d->io_base + offset);
> -}
> -
>  static int xlnx_pr_decoupler_enable_set(struct fpga_bridge *bridge, bool enable)
>  {
>  	int err;
> -- 
> 2.27.0
> 
