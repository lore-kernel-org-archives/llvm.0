Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68907EA1
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 01:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679276623; x=1710812623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YxjmBq6ikxvqoFB0iL+NlLNlseMTypJf5oOjYf5MAyM=;
  b=hAjOiGw97clEFJe7JLt46/CtXfYzBuTV6MPANYxiu1ABifPE6n3jXS7/
   KVutQpXs+r7gMtna4rkzSiBDrKE0Clw2hdDyZvvtshQZYqS7I4P+CsNFY
   v+2lNDuWRLkEhVVrikfuEIhdgpCrgVWWi6FQI98b174TW3fOuG8eHNV51
   x8LQbVjUhpb/qryJpeIikxBSzyytx1dIGlyt8HsUZ5BjcGA2t3Yk+jAg2
   RqGkuiFqsYJ7y23m9b0omhalrtkWe7hASyvL2AfcaNcdt+u2U7rXaHJCT
   j4f3m49Fufm59VWfM7ejXiObHV8X7DyY9LkuVd6l53sNVj9Xx4Sy0gsty
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="337269057"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="337269057"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 18:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804741234"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="804741234"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga004.jf.intel.com with ESMTP; 19 Mar 2023 18:43:39 -0700
Date: Mon, 20 Mar 2023 09:32:16 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Tom Rix <trix@redhat.com>
Cc: mdf@kernel.org, hao.wu@intel.com, michal.simek@xilinx.com,
	nathan@kernel.org, ndesaulniers@google.com,
	linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] fpga: xilinx-pr-decoupler: remove unused
 xlnx_pr_decouple_read function
Message-ID: <ZBe3oDPvAK4yn6Cs@yilunxu-OptiPlex-7050>
References: <20230317230617.1673923-1-trix@redhat.com>
 <ZBWLeC7UuDf+4dJE@yilunxu-OptiPlex-7050>
 <7cab9365-6493-2de0-bcef-cd46809056a8@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cab9365-6493-2de0-bcef-cd46809056a8@redhat.com>

On 2023-03-18 at 05:59:28 -0700, Tom Rix wrote:
> 
> On 3/18/23 2:59 AM, Xu Yilun wrote:
> > On 2023-03-17 at 19:06:17 -0400, Tom Rix wrote:
> > > clang with W=1 reports
> > > drivers/fpga/xilinx-pr-decoupler.c:37:19: error: unused function 'xlnx_pr_decouple_read' [-Werror,-Wunused-function]
> > > static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
> > >                    ^
> > > This static function is not used, so remove it.
> > I prefer to move the description as the first section. If you agree, I
> > could do it before apply.
> 
> I have no preference, that is fine.

Applied, thanks.

> 
> Tom
> 
> > 
> > Acked-by: Xu Yilun <yilun.xu@intel.com>
> > 
> > > Signed-off-by: Tom Rix <trix@redhat.com>
> > > ---
> > >   drivers/fpga/xilinx-pr-decoupler.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
> > > index 2d9c491f7be9..b6f18c07c752 100644
> > > --- a/drivers/fpga/xilinx-pr-decoupler.c
> > > +++ b/drivers/fpga/xilinx-pr-decoupler.c
> > > @@ -34,12 +34,6 @@ static inline void xlnx_pr_decoupler_write(struct xlnx_pr_decoupler_data *d,
> > >   	writel(val, d->io_base + offset);
> > >   }
> > > -static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
> > > -					u32 offset)
> > > -{
> > > -	return readl(d->io_base + offset);
> > > -}
> > > -
> > >   static int xlnx_pr_decoupler_enable_set(struct fpga_bridge *bridge, bool enable)
> > >   {
> > >   	int err;
> > > -- 
> > > 2.27.0
> > > 
> 
