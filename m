Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1653E3B193;
	Thu, 11 Jan 2024 16:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1748mCs"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cd7ef70a3bso15308861fa.0;
        Thu, 11 Jan 2024 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704989470; x=1705594270; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKzNaPM1+wqR8C57J711Npdwa2aojqdAXpN+xlVXNWg=;
        b=Z1748mCsegZaCtsD5BRCacVHPpNuVxayS1akbU7Y2PJY+6+HdwJkyz7ZOY4/vel86S
         SQUqBGCy72SN5ZpekrFQZZPmBMODAAj+UxqGuHxI3npXFTu1tcrqYwBbTK6O5cvNEL5q
         aiuiHdBf7EGxrqNud7+VWxr1Sq2S9yGMwyYrUlBcgY5f5KhBSjNiDIVYlOo2rG++W5+L
         mRXexs9fwlozH+S8pffvlpXGPlYG5aaxgn8BICMfianyRPD4UZhX/EFFB7KEx0tyEC54
         b0qe2mlDYlOUrakxSPm6CwKWJGGO32MCTwDEphyDmeI2QxVE8D9SuPaP16Qna5hEyBt2
         BObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704989470; x=1705594270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKzNaPM1+wqR8C57J711Npdwa2aojqdAXpN+xlVXNWg=;
        b=rCEv8twsgxzo07UVhd7m+qFwoBHvzXVFb69GXKy5jcKT4W/vkLcMIOvSpA75z53vMR
         kdugSpCKuUads/W6kF/Z1J8FzcBQD6RirRy/OTae8zQUqlr2JjlF8VMHzjIpb6dnDGEd
         s+vwqP/fsz4TptEgPCOXsbPzzRXQXM3V9ivS//09qhhXZgT49KULQAPDVR1VMJ5E4O78
         DiEjbmhvZW1PMnWaF15hkjobilq3xbHOXu4GAKxRmc9QCU6NHTiv3HwmG8eq38wH8DhW
         sBrTJtzq6boOaqCe8DKrggvEH+mfUoMENLcwN6WA6so114ZJul2/5CtF+/qkbgtsrsXu
         3ljA==
X-Gm-Message-State: AOJu0YxrzEiGZQxr5ZBj1vBVZTWhbJNfiJ8uno+ELiwwLToOTxWr2qgQ
	drjLTlq7kExj1LGECyZHx9w54gc2E8M=
X-Google-Smtp-Source: AGHT+IHlfl6w0liWUk8SHjKaWaWMu9q0agSAPQJO2vXrHf/tTB++ecLXKUgnyGM2dU1sNfZmfRWgAw==
X-Received: by 2002:a05:651c:10b8:b0:2cd:6ea2:bffd with SMTP id k24-20020a05651c10b800b002cd6ea2bffdmr25920ljn.18.1704989469782;
        Thu, 11 Jan 2024 08:11:09 -0800 (PST)
Received: from pc638.lan (host-185-121-47-193.sydskane.nu. [185.121.47.193])
        by smtp.gmail.com with ESMTPSA id f10-20020a2e380a000000b002cc68f0c127sm181039lja.134.2024.01.11.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:11:09 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Thu, 11 Jan 2024 17:11:07 +0100
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 12999/13245] mm/vmalloc.c:4652:25: warning:
 variable 'addr' is uninitialized when used here
Message-ID: <ZaATG4vMzeowYTDg@pc638.lan>
References: <202401111304.N5dkFGNe-lkp@intel.com>
 <ZaALWUTLWUglNY0z@pc638.lan>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZaALWUTLWUglNY0z@pc638.lan>

On Thu, Jan 11, 2024 at 04:38:01PM +0100, Uladzislau Rezki wrote:
> On Thu, Jan 11, 2024 at 01:13:59PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
> > commit: e88b85b81d5313a69cb62829b957d4a9ecde600b [12999/13245] mm: vmalloc: offload free_vmap_area_lock lock
> > config: arm-defconfig (https://download.01.org/0day-ci/archive/20240111/202401111304.N5dkFGNe-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111304.N5dkFGNe-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202401111304.N5dkFGNe-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> mm/vmalloc.c:4652:25: warning: variable 'addr' is uninitialized when used here [-Wuninitialized]
> >                    va = __find_vmap_area(addr, &vn->busy.root);
> >                                          ^~~~
> >    mm/vmalloc.c:4645:20: note: initialize the variable 'addr' to silence this warning
> >            unsigned long addr;
> >                              ^
> >                               = 0
> >    1 warning generated.
> > 
> > 
> > vim +/addr +4652 mm/vmalloc.c
> > 
> > a10aa579878fc6 Christoph Lameter       2008-04-28  4637  
> > 5bb1bb353cfe34 Paul E. McKenney        2021-01-07  4638  #ifdef CONFIG_PRINTK
> > 98f180837a896e Paul E. McKenney        2020-12-08  4639  bool vmalloc_dump_obj(void *object)
> > 98f180837a896e Paul E. McKenney        2020-12-08  4640  {
> > 98f180837a896e Paul E. McKenney        2020-12-08  4641  	void *objp = (void *)PAGE_ALIGN((unsigned long)object);
> > 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4642) 	const void *caller;
> > 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4643) 	struct vmap_area *va;
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4644) 	struct vmap_node *vn;
> > 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4645) 	unsigned long addr;
> > 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4646) 	unsigned int nr_pages;
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4647) 	bool success = false;
> > 98f180837a896e Paul E. McKenney        2020-12-08  4648  
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4649) 	vn = addr_to_node((unsigned long)objp);
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4650) 
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4651) 	if (spin_trylock(&vn->busy.lock)) {
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02 @4652) 		va = __find_vmap_area(addr, &vn->busy.root);
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4653) 
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4654) 		if (va && va->vm) {
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4655) 			addr = (unsigned long)va->vm->addr;
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4656) 			caller = va->vm->caller;
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4657) 			nr_pages = va->vm->nr_pages;
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4658) 			success = true;
> > 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4659) 		}
> > 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4660) 
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4661) 		spin_unlock(&vn->busy.lock);
> > 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4662) 	}
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4663) 
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4664) 	if (success)
> > bd34dcd4120d7e Paul E. McKenney        2020-12-09  4665  		pr_cont(" %u-page vmalloc region starting at %#lx allocated at %pS\n",
> > 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4666) 			nr_pages, addr, caller);
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4667) 
> > 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4668) 	return success;
> > 98f180837a896e Paul E. McKenney        2020-12-08  4669  }
> > 5bb1bb353cfe34 Paul E. McKenney        2021-01-07  4670  #endif
> > 98f180837a896e Paul E. McKenney        2020-12-08  4671  
> > 
> > :::::: The code at line 4652 was first introduced by commit
> > :::::: 86817057732a9ce9cefdb6f513b6554a55ebbbbb mm: vmalloc: remove global vmap_area_root rb-tree
> > 
> > :::::: TO: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> Same, i sent the patch, but just in case i post it here:
> 
> <snip>
> From fa613edf6c3d700a02ef109cbd42633b5df30abb Mon Sep 17 00:00:00 2001
> From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
> Date: Thu, 11 Jan 2024 13:04:07 +0100
> Subject: [PATCH 1/2] mm: vmalloc: Fix a wrong value passed to
>  __find_vmap_area()
> 
> There was a type in the vmalloc_dump_obj() function. Instead
> of passing a real address which is "objp" an "addr" was used
> what is wrong and not initialized.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: e88b85b81d5 ("mm: vmalloc: offload free_vmap_area_lock lock")
> Closes: https://lore.kernel.org/oe-kbuild-all/202401111810.TKPIXLCs-lkp@intel.com/
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  mm/vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index e30dabf68263..43a6608e1397 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4688,7 +4688,7 @@ bool vmalloc_dump_obj(void *object)
>  	vn = addr_to_node((unsigned long)objp);
>  
>  	if (spin_trylock(&vn->busy.lock)) {
> -		va = __find_vmap_area(addr, &vn->busy.root);
> +		va = __find_vmap_area((unsigned long)objp, &vn->busy.root);
>  
>  		if (va && va->vm) {
>  			addr = (unsigned long)va->vm->addr;
> -- 
> 2.39.2
> <snip>
> 
> it can be folded into: e88b85b81d5 ("mm: vmalloc: offload free_vmap_area_lock lock")
> or applied as a separate patch.
> 
Wrong "Fixes" tag. Please see updated version:

<snip>
From 98f1fd2d3913f3b7bcbe49785a78f67999151f1c Mon Sep 17 00:00:00 2001
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Date: Thu, 11 Jan 2024 13:04:07 +0100
Subject: [PATCH 1/2] mm: vmalloc: Fix a wrong value passed to
 __find_vmap_area()

There was a type in the vmalloc_dump_obj() function. Instead
of passing a real address which is "objp" an "addr" was used
what is wrong and not initialized.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 86817057732a ("mm: vmalloc: remove global vmap_area_root rb-tree")
Closes: https://lore.kernel.org/oe-kbuild-all/202401111810.TKPIXLCs-lkp@intel.com/
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e30dabf68263..43a6608e1397 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4688,7 +4688,7 @@ bool vmalloc_dump_obj(void *object)
 	vn = addr_to_node((unsigned long)objp);
 
 	if (spin_trylock(&vn->busy.lock)) {
-		va = __find_vmap_area(addr, &vn->busy.root);
+		va = __find_vmap_area((unsigned long)objp, &vn->busy.root);
 
 		if (va && va->vm) {
 			addr = (unsigned long)va->vm->addr;
-- 
2.39.2
<snip>


