Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C54CB3C;
	Thu, 11 Jan 2024 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3L9X7BE"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cd8bd6ce1bso6964071fa.1;
        Thu, 11 Jan 2024 07:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704987483; x=1705592283; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tB1E0ugJK0L2KvGbNzmJDN1gpsgaCYbTOW0J/2QoMFk=;
        b=O3L9X7BEnSdJnTj0maaFf6rq3AkbrYG5059HaVx0BatOWZQc7ss0m16pj0eGoqrkal
         /wzcAZE+cfL2rDj3C8Dui8hP1kcSXANZ5SDsWmP/qa0pR6zyLu2UWsjMS8C/WAJNr2vK
         7PXkksiZKhdJ8R8Lzafhk4Z6JF2ljCTOpNLwdvoyPvAupk/qB5Ck+snekMsncNguNtv1
         UVpBBJkylkW5C7kauB5xRF8YZvMMi0slPBX/vIvzhjeNnWUDUGo/9MkKy3ETOtof/amK
         HRa5QyU3ILNxNFA8uXcJXmqGdVp/9JRtwORcejIHucuTc8ojTKt4GxkSNZrh9G/Gb1Ik
         HJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704987483; x=1705592283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tB1E0ugJK0L2KvGbNzmJDN1gpsgaCYbTOW0J/2QoMFk=;
        b=xTekeRA5ffiKoY6NR68ph/W7zAc+0h66s2zh/Rtr7qMEl10223myccU5cj415iYmRZ
         RksijpNX+mEJhn4GY+e8BIFl4GHs5rRxHQFYWC4xADoSNS59l+QFUgrBuPmtewJDxWnO
         MhJKeneB4KbVsWswxllNaXAC4FP7W7lmu4SKsW1DibdzrRDudr6bEcWGR/urBJdOQhW3
         k54lw9Sat1KDp56Y4iUaXvlsXXEcM7Ngf7cNxVOinUQs7xB4YSDl4HAwcD3OzHiwKPWq
         eXwVtWzOyVGY7Dq5LLqvdrNay/VGrw7miHt7U3a4T7HqBn1X0sAyj1dmKYv1I22C4ico
         IoFQ==
X-Gm-Message-State: AOJu0YxZuLZv2dMjhNM9Wt/i7lzdvo17W89XpjqC9Wwj1k89e4LCV2de
	Cj7SosJH4FvOnrX05iO6UzQ=
X-Google-Smtp-Source: AGHT+IGSaV5E1Nu8lvLDmrSs+V2HXQYAgLdni6E7SHxF3rpvN64HoSAR4JS53m1gH71mWlE4IsfqJA==
X-Received: by 2002:a05:6512:61c:b0:50e:ca97:5afb with SMTP id b28-20020a056512061c00b0050eca975afbmr420236lfe.18.1704987483272;
        Thu, 11 Jan 2024 07:38:03 -0800 (PST)
Received: from pc638.lan (host-185-121-47-193.sydskane.nu. [185.121.47.193])
        by smtp.gmail.com with ESMTPSA id w11-20020a056512098b00b0050e8ea87dcesm225717lft.169.2024.01.11.07.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 07:38:02 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Thu, 11 Jan 2024 16:38:01 +0100
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 12999/13245] mm/vmalloc.c:4652:25: warning:
 variable 'addr' is uninitialized when used here
Message-ID: <ZaALWUTLWUglNY0z@pc638.lan>
References: <202401111304.N5dkFGNe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401111304.N5dkFGNe-lkp@intel.com>

On Thu, Jan 11, 2024 at 01:13:59PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
> commit: e88b85b81d5313a69cb62829b957d4a9ecde600b [12999/13245] mm: vmalloc: offload free_vmap_area_lock lock
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20240111/202401111304.N5dkFGNe-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111304.N5dkFGNe-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401111304.N5dkFGNe-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/vmalloc.c:4652:25: warning: variable 'addr' is uninitialized when used here [-Wuninitialized]
>                    va = __find_vmap_area(addr, &vn->busy.root);
>                                          ^~~~
>    mm/vmalloc.c:4645:20: note: initialize the variable 'addr' to silence this warning
>            unsigned long addr;
>                              ^
>                               = 0
>    1 warning generated.
> 
> 
> vim +/addr +4652 mm/vmalloc.c
> 
> a10aa579878fc6 Christoph Lameter       2008-04-28  4637  
> 5bb1bb353cfe34 Paul E. McKenney        2021-01-07  4638  #ifdef CONFIG_PRINTK
> 98f180837a896e Paul E. McKenney        2020-12-08  4639  bool vmalloc_dump_obj(void *object)
> 98f180837a896e Paul E. McKenney        2020-12-08  4640  {
> 98f180837a896e Paul E. McKenney        2020-12-08  4641  	void *objp = (void *)PAGE_ALIGN((unsigned long)object);
> 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4642) 	const void *caller;
> 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4643) 	struct vmap_area *va;
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4644) 	struct vmap_node *vn;
> 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4645) 	unsigned long addr;
> 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4646) 	unsigned int nr_pages;
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4647) 	bool success = false;
> 98f180837a896e Paul E. McKenney        2020-12-08  4648  
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4649) 	vn = addr_to_node((unsigned long)objp);
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4650) 
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4651) 	if (spin_trylock(&vn->busy.lock)) {
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02 @4652) 		va = __find_vmap_area(addr, &vn->busy.root);
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4653) 
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4654) 		if (va && va->vm) {
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4655) 			addr = (unsigned long)va->vm->addr;
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4656) 			caller = va->vm->caller;
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4657) 			nr_pages = va->vm->nr_pages;
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4658) 			success = true;
> 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4659) 		}
> 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4660) 
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4661) 		spin_unlock(&vn->busy.lock);
> 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4662) 	}
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4663) 
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4664) 	if (success)
> bd34dcd4120d7e Paul E. McKenney        2020-12-09  4665  		pr_cont(" %u-page vmalloc region starting at %#lx allocated at %pS\n",
> 0818e739b5c061 Joel Fernandes (Google  2023-09-04  4666) 			nr_pages, addr, caller);
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4667) 
> 86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4668) 	return success;
> 98f180837a896e Paul E. McKenney        2020-12-08  4669  }
> 5bb1bb353cfe34 Paul E. McKenney        2021-01-07  4670  #endif
> 98f180837a896e Paul E. McKenney        2020-12-08  4671  
> 
> :::::: The code at line 4652 was first introduced by commit
> :::::: 86817057732a9ce9cefdb6f513b6554a55ebbbbb mm: vmalloc: remove global vmap_area_root rb-tree
> 
> :::::: TO: Uladzislau Rezki (Sony) <urezki@gmail.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Same, i sent the patch, but just in case i post it here:

<snip>
From fa613edf6c3d700a02ef109cbd42633b5df30abb Mon Sep 17 00:00:00 2001
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Date: Thu, 11 Jan 2024 13:04:07 +0100
Subject: [PATCH 1/2] mm: vmalloc: Fix a wrong value passed to
 __find_vmap_area()

There was a type in the vmalloc_dump_obj() function. Instead
of passing a real address which is "objp" an "addr" was used
what is wrong and not initialized.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: e88b85b81d5 ("mm: vmalloc: offload free_vmap_area_lock lock")
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

it can be folded into: e88b85b81d5 ("mm: vmalloc: offload free_vmap_area_lock lock")
or applied as a separate patch.

--
Uladzislau Rezki
