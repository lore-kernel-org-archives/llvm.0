Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5167F8
	for <llvm@lists.linux.dev>; Sun, 23 Apr 2023 07:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682233886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ceC3iNLKW3P9TBH89CTY7PMhNXA3IfKqJ2B60MJ0qBo=;
	b=bfIVyGImaY7k1PUEEqf3DEs2+kW5vfCLGwE2NFMmtHG6Q94xe6F5U1aPY7jLxZEGIyCd4g
	oDCM92Bcv5RScJZ+R1KOXNbUD8wHkMtARHNaLSpYhxbFbE8U+jFsQ53ZrAxriajYMljbri
	xld5uWgJLMkQlJOYtUAXZ/VDxuXU2SA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-wGsTfDsLOayYN3kpy6veDg-1; Sun, 23 Apr 2023 03:11:24 -0400
X-MC-Unique: wGsTfDsLOayYN3kpy6veDg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-2f443ca3357so1137946f8f.2
        for <llvm@lists.linux.dev>; Sun, 23 Apr 2023 00:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682233883; x=1684825883;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceC3iNLKW3P9TBH89CTY7PMhNXA3IfKqJ2B60MJ0qBo=;
        b=lxbR0j2CE27ShCSwkZHBuXU4fKuIIci6137a4igz5hzvlZPHrREQYiNDbtcT+6vI9C
         5ow0hvQ4zxEyaSaBRwxXitIK99iowM/XFvNoremZ8efY5KL91EDiwaz8iiGiQWFw/MT5
         kycbSF2NptciFS+SJyqG1YdGnD19WwwSTpVER0UGQWpjxq8scy4MWSqCCyl8SLGjP+3P
         n+PWVfVh1txKpY700j1OdYWC8qjBz0tR5AG3otGLPPMiszgFhWaV3q2/6r33aTsNhJlB
         09HE4u3PBBeXB0lABULaW23g+iid9x0E1KbtoWsOazQu2ZePu/AtFeRZmcAQ0WkckeCr
         aPTA==
X-Gm-Message-State: AAQBX9f7aXlyLirLSuJ5Se5FJoXg7d8Caz/VcTaDkPgXgXdna9863L35
	3/Z1VcIScP0AzICt45H6u7baG+PRwf1qKk94ARVuUXCUigdpCxz6ZEO6CMlKBSL7FE6D5P29eZJ
	4d3KFTzBm/XnHUA==
X-Received: by 2002:adf:ea81:0:b0:2f9:482f:c13f with SMTP id s1-20020adfea81000000b002f9482fc13fmr7303553wrm.46.1682233883821;
        Sun, 23 Apr 2023 00:11:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZObgUlieWTavnnLj3GCGoikt1gVwEERoO+dsv32CrxFVABvK7yT0Ez5YsOk1AoNW4h/9IbHg==
X-Received: by 2002:adf:ea81:0:b0:2f9:482f:c13f with SMTP id s1-20020adfea81000000b002f9482fc13fmr7303541wrm.46.1682233883448;
        Sun, 23 Apr 2023 00:11:23 -0700 (PDT)
Received: from redhat.com ([2.55.17.255])
        by smtp.gmail.com with ESMTPSA id g13-20020adfe40d000000b002f8d402b191sm8043653wrm.112.2023.04.23.00.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 00:11:22 -0700 (PDT)
Date: Sun, 23 Apr 2023 03:11:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dragos Tatulea <dtatulea@nvidia.com>, Eli Cohen <elic@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>
Subject: [lkp@intel.com: [linux-next:master 13449/13717]
 drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: error: implicit declaration of
 function 'mlx5_msix_free' is invalid in C99]
Message-ID: <20230423031041-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC Dragos.
Does one of you want to post a MAINTAINERS patch btw?


----- Forwarded message from kernel test robot <lkp@intel.com> -----

From: kernel test robot <lkp@intel.com>
Date: Sun, 23 Apr 2023 07:29:38 +0800
To: Eli Cohen <elic@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory Management List <linux-mm@kvack.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>
Subject: [linux-next:master 13449/13717] drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: error: implicit declaration of function
	'mlx5_msix_free' is invalid in C99
Message-ID: <202304230755.9jjF6ZJr-lkp@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
commit: b9ca712f33f59e977592cb639c2e00a02f45a146 [13449/13717] vdpa/mlx5: Support interrupt bypassing
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230423/202304230755.9jjF6ZJr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b9ca712f33f59e977592cb639c2e00a02f45a146
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b9ca712f33f59e977592cb639c2e00a02f45a146
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/xen/ drivers/power/supply/ drivers/vdpa/mlx5/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230755.9jjF6ZJr-lkp@intel.com/

Note: the linux-next/master HEAD d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: error: implicit declaration of function 'mlx5_msix_free' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   mlx5_msix_free(ndev->mvdev.mdev, ent->map);
                   ^
   drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: note: did you mean 'mlx5_db_free'?
   include/linux/mlx5/driver.h:1083:6: note: 'mlx5_db_free' declared here
   void mlx5_db_free(struct mlx5_core_dev *dev, struct mlx5_db *db);
        ^
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:14: error: implicit declaration of function 'mlx5_msix_alloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   ent->map = mlx5_msix_alloc(ndev->mvdev.mdev, int_handler, NULL, ent->name);
                              ^
   drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:14: note: did you mean 'mlx5_db_alloc'?
   include/linux/mlx5/driver.h:1078:19: note: 'mlx5_db_alloc' declared here
   static inline int mlx5_db_alloc(struct mlx5_core_dev *dev, struct mlx5_db *db)
                     ^
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:12: error: assigning to 'struct msi_map' from incompatible type 'int'
                   ent->map = mlx5_msix_alloc(ndev->mvdev.mdev, int_handler, NULL, ent->name);
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/mlx5_msix_free +2896 drivers/vdpa/mlx5/net/mlx5_vnet.c

  2885	
  2886	static void free_irqs(struct mlx5_vdpa_net *ndev)
  2887	{
  2888		struct mlx5_vdpa_irq_pool_entry *ent;
  2889		int i;
  2890	
  2891		if (!msix_mode_supported(&ndev->mvdev))
  2892			return;
  2893	
  2894		for (i = ndev->irqp.num_ent - 1; i >= 0; i--) {
  2895			ent = ndev->irqp.entries + i;
> 2896			mlx5_msix_free(ndev->mvdev.mdev, ent->map);
  2897		}
  2898		kfree(ndev->irqp.entries);
  2899	}
  2900	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

----- End forwarded message -----

