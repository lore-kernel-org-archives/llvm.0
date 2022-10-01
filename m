Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96B51FAA
	for <llvm@lists.linux.dev>; Sat,  1 Oct 2022 01:27:01 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso65646fac.6
        for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 18:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bwaljk9bMFsHFPpi2g0reCn+S/XOlT+W+Bl94iOVkvQ=;
        b=WposWcam7HVvl3NN1munnWrH/EfoLXOc6yAg/zfxik6r33YW3dufb+7AuWma2k/g+v
         AJB1Wuy2BADf8j7+bvfE/KXYvDWsd0/YMWv+wvBWAdnqxIrQ0bormcP4eIa7JfcNbAfQ
         pVGaqJZ4trM/VA5BF4FLpcGaVMzOL69t+teBoR8qwUzWwMu2/lxZimsWn/jAx7rrn3ri
         ZBtcl9yQ9md469196fKJu7yZRpaC0gFdlT8ZJIMpWsW1riWuTvKfet8PNN8BuyU9mfKY
         pb9MIjoOUHa/U2R9JwwbONzn0sVY+bJgj5UEmTUx5KCtlhW5I3XSWej9YtLGO09IEpb4
         nkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bwaljk9bMFsHFPpi2g0reCn+S/XOlT+W+Bl94iOVkvQ=;
        b=cHOSxAezH1z5e6jjlm5SAql7tWfWclsSzeJFrA9QVYplkorQGDXKDpLZn8dcvfs6RA
         mROyPuigul9LFNaovdrA5wdQ6UtFlvZxVi4YvHJeGbCvz1fzT8adlSu59ocpHgWg59fA
         txL+xKY2EF3nMnCARs6KmXq10W3kx+VgOGhcnWlebYTRgGEwvOJQ3Q5zIzUlp7aZKBWR
         nccHXAhouBV97n6is8ctywJaJuQCsTxSRAOzZQ0plI6o8h/3I4/cDJv/OtlFv3XBTule
         P1y0ny1+gifrMx7gEG6aI2IBuuopRHp4HwWJLUomSRIsLYlYNEQ08pvs8BTscr3mqetl
         w1tA==
X-Gm-Message-State: ACrzQf2+z+cnJ7cI+ij3I/0YPoehoT8NhTlmPvMHAY/0ei+AwWJsb2J5
	9P4WUBV3DZWKwM0MzJDzYRM=
X-Google-Smtp-Source: AMsMyM63HcFllZzb/9IfRphHEcUm8Ine83s/BsOjhy3xhheKbMxyGIMnJ4xBcMo3b9H2unq/P1QIkQ==
X-Received: by 2002:a05:6870:c34b:b0:12b:3ba8:1a92 with SMTP id e11-20020a056870c34b00b0012b3ba81a92mr435107oak.114.1664587620655;
        Fri, 30 Sep 2022 18:27:00 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id r84-20020aca5d57000000b003512f3195d7sm878403oib.30.2022.09.30.18.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 18:27:00 -0700 (PDT)
Date: Fri, 30 Sep 2022 18:24:47 -0700
From: Yury Norov <yury.norov@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [linux-next:master 7287/11993] s390x-linux-ld:
 topology.c:undefined reference to `__tsan_memcpy'
Message-ID: <YzeW3yqxvkpYKCxa@yury-laptop>
References: <202210010718.2kaVANGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210010718.2kaVANGb-lkp@intel.com>

On Sat, Oct 01, 2022 at 07:12:48AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   274d7803837da78dfc911bcda0d593412676fc20
> commit: aa47a7c215e79a2ade6916f163c5a17b561bce4f [7287/11993] lib/cpumask: deprecate nr_cpumask_bits
> config: s390-randconfig-r023-20220926
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=aa47a7c215e79a2ade6916f163c5a17b561bce4f
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout aa47a7c215e79a2ade6916f163c5a17b561bce4f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    s390x-linux-ld: ipl.c:(.text+0x1004): undefined reference to `__tsan_memcpy'
>    s390x-linux-ld: ipl.c:(.text+0x1046): undefined reference to `__tsan_memset'
>    s390x-linux-ld: arch/s390/kernel/ipl.o: in function `reipl_fcp_scpdata_write':

I can't reproduce the bug. In fact, the build is broken for me on
next-20220930. To make the s390 image somehow building, I commented
out some functions that aren't found by the LD.

Thanks,
Yury

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 886de028a901..d696d78132a0 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -235,6 +235,7 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
        return ERR_PTR(ret);
 }

+void __iomem *of_iomap(struct device_node *np, int index);
 static int __init al_fic_init_dt(struct device_node *node,
                                 struct device_node *parent)
 {
@@ -249,7 +250,7 @@ static int __init al_fic_init_dt(struct device_node *node,
                return -EINVAL;
        }

-       base = of_iomap(node, 0);
+       base = NULL;//of_iomap(node, 0);
        if (!base) {
                pr_err("%s: fail to map memory\n", node->name);
                return -ENOMEM;
diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 7633b227b2ca..4e4c9d9743bf 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1122,8 +1122,8 @@ static int request_and_map(struct platform_device *pdev, const char *name,
                return -EBUSY;
        }

-       *ptr = devm_ioremap(device, region->start,
-                                   resource_size(region));
+       *ptr = NULL;//devm_ioremap(device, region->start,
+               //                  resource_size(region));
        if (*ptr == NULL) {
                dev_err(device, "ioremap of %s failed!", name);
                return -ENOMEM;
diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 230c2d19116d..9f88be3c2b08 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -49,6 +49,7 @@ static bool afs_dir_dirty_folio(struct address_space *mapping,
                struct folio *folio)
 {
        BUG(); /* This should never happen. */
+       return false;
 }

 const struct file_operations afs_dir_file_operations = {
