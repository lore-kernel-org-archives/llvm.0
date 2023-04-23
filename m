Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FC3A5B
	for <llvm@lists.linux.dev>; Sun, 23 Apr 2023 10:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682247023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDrD5X/OiEBtaK2jddY1Sv/gD8GVeQI6JOwQzfOQk/E=;
	b=J9anbqWlw/xBS46nRAESQv3HuwQ6ObJf1ncg9++tiN+/4IQOnPzBCdgOeGtIQmEjpQq4gF
	KXfIcqfH1ZNtoUk6PKfKROP8hddUbovt4PUSo00xsVMiFf2n9pGPoD6FsLjvnTogqF5zXU
	LA1OOyTebYgvB0WwIHgxistperwj14Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-RHOHSJXjNCuQGLFeqrXrfA-1; Sun, 23 Apr 2023 06:50:22 -0400
X-MC-Unique: RHOHSJXjNCuQGLFeqrXrfA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-2f55f0626a6so1199387f8f.3
        for <llvm@lists.linux.dev>; Sun, 23 Apr 2023 03:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682247021; x=1684839021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDrD5X/OiEBtaK2jddY1Sv/gD8GVeQI6JOwQzfOQk/E=;
        b=BrWmYWxEmW97NdchbyGB2f5Xk0dy8PrayWBaohWpF0m+xTOh+pRlicOfuy4tI4Gu0c
         z5sGDtjYfWxP+vwr9iTVJkVyfQ5OqYxsuksTH0lxCt8rJAlecKr2tjBrwnX5AkZrOEGE
         CtchAU+qDIjE2MzKdxxREc1xkOM2NOkjn41M6y7wMAoJb3J1lBb/FS72ympqllAM5mcH
         WDtv/xeZL2eCTd1eH1s2dvJful/1hYPhMfXN5wi59/1ZHa6PQ3t+IP8ctDPmJANt4Q9P
         /d8C8Le7H2tZzKM81sKypTZnH5dda8EcJJtQ+P9vdlvvi5UIrWdWU79QiQbk24URKIuV
         73dg==
X-Gm-Message-State: AAQBX9d5CLYdDn52C4FiCF7oHVQUytKRWPbEwUgpORvtZB0IhLXJHl66
	805MkPR1XO+o40FEH5kAa+RB7VX7WDMsLsLp4oQPIbdl8pNIIEakiJ6nAhHv4gpfXC3/MRaBri9
	97r6qzyNGCE5+7w==
X-Received: by 2002:adf:dbce:0:b0:2f0:e287:1fbc with SMTP id e14-20020adfdbce000000b002f0e2871fbcmr7449923wrj.11.1682247021238;
        Sun, 23 Apr 2023 03:50:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bUOXAKGqipY9yIByLrmVxzMUQ7GNVFXJ721u1Th9gqS+2RP29I63/Sh5kxkxNFci3ahvuJKg==
X-Received: by 2002:adf:dbce:0:b0:2f0:e287:1fbc with SMTP id e14-20020adfdbce000000b002f0e2871fbcmr7449915wrj.11.1682247020966;
        Sun, 23 Apr 2023 03:50:20 -0700 (PDT)
Received: from redhat.com ([2.55.61.39])
        by smtp.gmail.com with ESMTPSA id m7-20020adfe947000000b003011baf89b3sm8424172wrn.40.2023.04.23.03.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 03:50:20 -0700 (PDT)
Date: Sun, 23 Apr 2023 06:50:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Cc: Dragos Tatulea <dtatulea@nvidia.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Saeed Mahameed <saeedm@nvidia.com>
Subject: Re: [lkp@intel.com: [linux-next:master 13449/13717]
 drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: error: implicit declaration of
 function 'mlx5_msix_free' is invalid in C99]
Message-ID: <20230423064954-mutt-send-email-mst@kernel.org>
References: <20230423031041-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54003816E028203645CCA441AB669@DM8PR12MB5400.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB54003816E028203645CCA441AB669@DM8PR12MB5400.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry got confused. Referring to the robot warning here.

On Sun, Apr 23, 2023 at 07:29:45AM +0000, Eli Cohen wrote:
> Are you referring to kernel robot warning or to updating MAINTAINERS?
> I was not the maintainer of anything so not sure what you mean here.
> 
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Sunday, 23 April 2023 10:11
> > To: Dragos Tatulea <dtatulea@nvidia.com>; Eli Cohen <elic@nvidia.com>
> > Cc: llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev; Linux Memory
> > Management List <linux-mm@kvack.org>; Michael S. Tsirkin
> > <mst@redhat.com>; Saeed Mahameed <saeedm@nvidia.com>
> > Subject: [lkp@intel.com: [linux-next:master 13449/13717]
> > drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: error: implicit declaration of
> > function 'mlx5_msix_free' is invalid in C99]
> > 
> > CC Dragos.
> > Does one of you want to post a MAINTAINERS patch btw?
> > 
> > 
> > ----- Forwarded message from kernel test robot <lkp@intel.com> -----
> > 
> > From: kernel test robot <lkp@intel.com>
> > Date: Sun, 23 Apr 2023 07:29:38 +0800
> > To: Eli Cohen <elic@nvidia.com>
> > Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory
> > Management List <linux-mm@kvack.org>, "Michael S. Tsirkin"
> > 	<mst@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>
> > Subject: [linux-next:master 13449/13717]
> > drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: error: implicit declaration of
> > function
> > 	'mlx5_msix_free' is invalid in C99
> > Message-ID: <202304230755.9jjF6ZJr-lkp@intel.com>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > master
> > head:   d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
> > commit: b9ca712f33f59e977592cb639c2e00a02f45a146 [13449/13717]
> > vdpa/mlx5: Support interrupt bypassing
> > config: x86_64-allmodconfig (https://download.01.org/0day-
> > ci/archive/20230423/202304230755.9jjF6ZJr-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project
> > f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-
> > tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-
> > next.git/commit/?id=b9ca712f33f59e977592cb639c2e00a02f45a146
> >         git remote add linux-next
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout b9ca712f33f59e977592cb639c2e00a02f45a146
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> > W=1 O=build_dir ARCH=x86_64 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> > W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/xen/
> > drivers/power/supply/ drivers/vdpa/mlx5/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202304230755.9jjF6ZJr-
> > lkp@intel.com/
> > 
> > Note: the linux-next/master HEAD
> > d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89 builds fine.
> >       It may have been fixed somewhere.
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: error: implicit declaration of
> > function 'mlx5_msix_free' is invalid in C99 [-Werror,-Wimplicit-function-
> > declaration]
> >                    mlx5_msix_free(ndev->mvdev.mdev, ent->map);
> >                    ^
> >    drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: note: did you mean
> > 'mlx5_db_free'?
> >    include/linux/mlx5/driver.h:1083:6: note: 'mlx5_db_free' declared here
> >    void mlx5_db_free(struct mlx5_core_dev *dev, struct mlx5_db *db);
> >         ^
> > >> drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:14: error: implicit declaration of
> > function 'mlx5_msix_alloc' is invalid in C99 [-Werror,-Wimplicit-function-
> > declaration]
> >                    ent->map = mlx5_msix_alloc(ndev->mvdev.mdev, int_handler,
> > NULL, ent->name);
> >                               ^
> >    drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:14: note: did you mean
> > 'mlx5_db_alloc'?
> >    include/linux/mlx5/driver.h:1078:19: note: 'mlx5_db_alloc' declared here
> >    static inline int mlx5_db_alloc(struct mlx5_core_dev *dev, struct mlx5_db
> > *db)
> >                      ^
> > >> drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:12: error: assigning to 'struct
> > msi_map' from incompatible type 'int'
> >                    ent->map = mlx5_msix_alloc(ndev->mvdev.mdev, int_handler,
> > NULL, ent->name);
> >                             ^
> > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    3 errors generated.
> > 
> > 
> > vim +/mlx5_msix_free +2896 drivers/vdpa/mlx5/net/mlx5_vnet.c
> > 
> >   2885
> >   2886	static void free_irqs(struct mlx5_vdpa_net *ndev)
> >   2887	{
> >   2888		struct mlx5_vdpa_irq_pool_entry *ent;
> >   2889		int i;
> >   2890
> >   2891		if (!msix_mode_supported(&ndev->mvdev))
> >   2892			return;
> >   2893
> >   2894		for (i = ndev->irqp.num_ent - 1; i >= 0; i--) {
> >   2895			ent = ndev->irqp.entries + i;
> > > 2896			mlx5_msix_free(ndev->mvdev.mdev, ent->map);
> >   2897		}
> >   2898		kfree(ndev->irqp.entries);
> >   2899	}
> >   2900
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests
> > 
> > ----- End forwarded message -----
> 

