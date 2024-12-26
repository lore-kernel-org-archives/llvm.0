Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5C814600D
	for <llvm@lists.linux.dev>; Thu, 26 Dec 2024 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242704; cv=none; b=u4KaFpFOUJLIyqtylU9mTEreQ/bpDiR1xDMBSGpmNPazjtlKEIB021pTDjbinNA0RyqI/tZPHlXLoYijFBUou6WbwRPZQ1yIXiEqqQaIxPXdTLyeor5QivoY0oPuNJJIFTSYH91EFGZ43qpdGYHR27uU/m0gbqp9sEYC+yq+7A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242704; c=relaxed/simple;
	bh=KIbE1b0fqIHR6t4DbcpHz0fGfYw9U88y89LFbkpYtVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFH7iG23KUxgZbCd4hNVQikqGQhRR8epGW76s/+EJY5juhjXEkLAheQA1y2GN8xfYkd0VIaBuXi6eXghV6VJ/pdFbKOEG3SlCfbFKYuTl26ewD5T98f78ueRtH/DT6wfm1tutARl0PoyM/0j3nAuR90hojj/Z5Gu0LSup2qYehE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ACaUYdzu; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ACaUYdzu"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4679b5c66d0so1628741cf.1
        for <llvm@lists.linux.dev>; Thu, 26 Dec 2024 11:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735242701; x=1735847501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwzvVo3A9tqwYP/Mb4qBWoe8LalbJFa9pYp37BvyRxY=;
        b=ACaUYdzu0rIcTL4P2OOs5C5iRYZf3/TTLoPcamB//Tk9Enu4ApXUIkucCMaI3h6tnm
         FkC/6IPsyzoEv0uFVPhBfEHr2F9fMQ9tnku/afqMejPpTWt7T6UmVGLUOkm3ulknHePy
         qfow4oPOEXQGhrpZqHH6eTDQqvPY9tmlxV3EeMKbkhwUv6piz6jw1R5i/fdMlo+yQcmH
         Y19HAihdDsr/ZqDEWeiTKqUumyornPBg6ypEjqhWYD40DM/uFaMySfDoRRdMVqDWwURC
         N1VSyHlGD4W94TxX0jxeLl10aTAtZJC3e9YPrwGCcNemmSZ5g5Hiq8Z7VvSvuJmC/Rq/
         lUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242701; x=1735847501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwzvVo3A9tqwYP/Mb4qBWoe8LalbJFa9pYp37BvyRxY=;
        b=BZqU9Enbd5b3jYj0Ys8Qwl4oZ/FppdBTu45/BJYRT5pV8N4G1yDefs2bHLmVuMd5W0
         rNZmlqwGCmsoB+wkQP8BbueuKfFNDdUoRKMm+qMCAtvdtRTgwBKgavVzFDiA/vc4yaTX
         SrLpbYjxgA0sBKO6R6hHpYd/tSAPs+k7JPN1HpZAoiwyS62ZR0Ox7Iq6aglwHP+dxrO7
         F83mTwODDyBJSRA8DEpByZjBle7fCB3Hof9TK3kwA2ipB8nvQY73CFrQPEhHEYL1EYic
         rR7+MxLahAnzEtLtQZeu2djtnE8rNt6az90AXSuK1ntntVuggIUogoaQ6AqqqV2RFd8+
         6wOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5sh0VZzxbCItlEjbkzIRmCEGQJh64dYGUtSl27KuNTFCHgOEwaGDPkBLCVz9iwncncjj0@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1ZNDMrI7l2Bsxg+9QgkYWTYVy/UTrO1dXC+yakJuzJiILws0Z
	zmiixJYMgFe49xLpSesn+4I/RTVJMnzFl2rhyL28jc2WUh0vTzygjhSbYJvP2GL45npxCA2YeSk
	0DnSWupLqK4GnLFI0Cms6AxziMfjVrS4EY1om
X-Gm-Gg: ASbGncvqqCc+GzReqYv67H16WlBroVEDhyyg381PbB0r7FztbIVoBmam7dBq44rgdKR
	PpvU93pNSAxSgaqLx/liXbywtuGJ4mvMuMmaIdA==
X-Google-Smtp-Source: AGHT+IHBdFc9hhlRPZCBWUc3Iy779E66gX61RcLkTGDPxcjXvqPzHzBcKuM/XFvHtqdVCG4f0JtV0UMo/Gw0tXwDT0g=
X-Received: by 2002:a05:622a:1823:b0:466:a11c:cad2 with SMTP id
 d75a77b69052e-46a4c00cc98mr19789051cf.7.1735242701233; Thu, 26 Dec 2024
 11:51:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241226170710.1159679-14-surenb@google.com> <202412270328.HiJX1mRt-lkp@intel.com>
In-Reply-To: <202412270328.HiJX1mRt-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Dec 2024 11:51:28 -0800
Message-ID: <CAJuCfpHb23mRT6bS8LNd79Zm0XU9eq9hB671G21UnkU992j82Q@mail.gmail.com>
Subject: Re: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping the vma
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 11:41=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 431614f1580a03c1a653340c55ea76bd12a9403f]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/mm-introduce-vma_start_read_locked-_nested-helpers/20241227-010925
> base:   431614f1580a03c1a653340c55ea76bd12a9403f
> patch link:    https://lore.kernel.org/r/20241226170710.1159679-14-surenb=
%40google.com
> patch subject: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dump=
ing the vma
> config: hexagon-randconfig-002-20241227 (https://download.01.org/0day-ci/=
archive/20241227/202412270328.HiJX1mRt-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241227/202412270328.HiJX1mRt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/debug.c:189:54: error: no member named 'vm_refcnt' in 'struct vm_ar=
ea_struct'

Ugh, ok. On architectures with ARCH_SUPPORTS_PER_VMA_LOCK=3Dn this will
happen. Preparing a fix.

>      189 |                 vma->vm_flags, &vma->vm_flags, refcount_read(&=
vma->vm_refcnt));
>          |                                                               =
~~~  ^
>    include/linux/printk.h:514:35: note: expanded from macro 'pr_emerg'
>      514 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
>          |                                          ^~~~~~~~~~~
>    include/linux/printk.h:501:60: note: expanded from macro 'printk'
>      501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__V=
A_ARGS__)
>          |                                                            ^~~=
~~~~~~~~
>    include/linux/printk.h:473:19: note: expanded from macro 'printk_index=
_wrap'
>      473 |                 _p_func(_fmt, ##__VA_ARGS__);                 =
          \
>          |                                 ^~~~~~~~~~~
>    1 error generated.
>
>
> vim +189 mm/debug.c
>
>    178
>    179  void dump_vma(const struct vm_area_struct *vma)
>    180  {
>    181          pr_emerg("vma %px start %px end %px mm %px\n"
>    182                  "prot %lx anon_vma %px vm_ops %px\n"
>    183                  "pgoff %lx file %px private_data %px\n"
>    184                  "flags: %#lx(%pGv) refcnt %x\n",
>    185                  vma, (void *)vma->vm_start, (void *)vma->vm_end, =
vma->vm_mm,
>    186                  (unsigned long)pgprot_val(vma->vm_page_prot),
>    187                  vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
>    188                  vma->vm_file, vma->vm_private_data,
>  > 189                  vma->vm_flags, &vma->vm_flags, refcount_read(&vma=
->vm_refcnt));
>    190  }
>    191  EXPORT_SYMBOL(dump_vma);
>    192
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
