Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27AF24F29;
	Tue, 15 Nov 2022 17:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133C9C433B5;
	Tue, 15 Nov 2022 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668533097;
	bh=CA6i1sqRTbMa1FGKZ4RFb8QPs+epwJ3N8FFNkuCpEIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5QzybH/nnyVypx9C0Kw+ctxt3SAu3y1U7PoZReYnPXJmFK8GlugnmWlM07YFoYWa
	 MFhQR44Ulo5f/Ldtak9fH/l1IROiTL2kepcaXa4K2uo1E0Kyg8YkfQSDBiKPcT+/j4
	 BFXuOvFUaxDEXTkvKXTEaEQhAYOvF/cpMR1bIoJoNirzGC6TZGlYBlVOpVHAxgUqjR
	 mEqwsnqosvmpUZtidehhN92TqbUt7h1Y+5f90zJhb5acuyMm1I/vnIUFH/BWzyECI8
	 px3hXIG+vvaPPq7W8qlEwBpsUOyboanSWfbUIgLgeczRZFz7VGHU2dkwEBBLtIreBS
	 xQ8wpLN/MDsCQ==
Date: Tue, 15 Nov 2022 10:24:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [linux-nvme:nvme-6.2 26/41] drivers/nvme/host/core.c:5122:6:
 error: assigning to 'int' from incompatible type 'void'
Message-ID: <Y3PLZxNwqioynAtw@dev-arch.thelio-3990X>
References: <202211160055.rbjs32vH-lkp@intel.com>
 <edda71f4-9912-d336-6d5b-0e1e102d4bfe@grimberg.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edda71f4-9912-d336-6d5b-0e1e102d4bfe@grimberg.me>

On Tue, Nov 15, 2022 at 07:16:07PM +0200, Sagi Grimberg wrote:
> 
> > tree:   git://git.infradead.org/nvme.git nvme-6.2
> > head:   e2deb6d1a5b2dcff71f429a64fb516186aa0382c
> > commit: c1658b482f1bec9ebafa49eec69a29aebbc23556 [26/41] nvme-auth: don't ignore key generation failures when initializing ctrl keys
> > config: i386-randconfig-a016-20221114
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          git remote add linux-nvme git://git.infradead.org/nvme.git
> >          git fetch --no-tags linux-nvme nvme-6.2
> >          git checkout c1658b482f1bec9ebafa49eec69a29aebbc23556
> >          # save the config file
> >          mkdir build_dir && cp config build_dir/.config
> >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> > > > drivers/nvme/host/core.c:5122:6: error: assigning to 'int' from incompatible type 'void'
> >             ret = nvme_auth_init_ctrl(ctrl);
> 
> Christoph,
> 
> Can you fold this into the offending commit please?
> --
> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> index a50b0743728e..273f4f95f425 100644
> --- a/drivers/nvme/host/nvme.h
> +++ b/drivers/nvme/host/nvme.h
> @@ -1063,7 +1063,7 @@ static inline int nvme_init_auth(void)
>         return 0;
>  }
>  static inline void nvme_exit_auth(void) {};
> -static inline void nvme_auth_init_ctrl(struct nvme_ctrl *ctrl) {};
> +static inline int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl) {};

Won't -Wreturn-type flag that this function is not returning a integer
value? I assume that wants 'return 0'?

Cheers,
Nathan

>  static inline void nvme_auth_stop(struct nvme_ctrl *ctrl) {};
>  static inline int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid)
>  {
> --
> 
> If not, I can send a patch to fold in.
> 
