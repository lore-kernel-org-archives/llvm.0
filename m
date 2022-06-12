Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC07C
	for <llvm@lists.linux.dev>; Sun, 12 Jun 2022 02:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655000787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Po+OITd9LduODB5Ll6LkiNrsN4yFiLHBsGMIZQJ3aw4=;
	b=XuXyb3C+LrMmvFry/8khNl0UE1wcXQEY2Mp6J1Po0FeWoi1yY9b4MBI6ST/rXJSxKcDKwd
	b37+Wb3sD5D3TfimOkaVASRvu9AOv77TSxupJPgyg7wYXKk8j6Hke1z0EUZaMUcvcc2zfz
	KI8IXXq/jXrY391T0rGJSfWjgj5Qt5E=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-zxtyWeSvN6eBI7h4lqyV0A-1; Sat, 11 Jun 2022 22:26:24 -0400
X-MC-Unique: zxtyWeSvN6eBI7h4lqyV0A-1
Received: by mail-pg1-f197.google.com with SMTP id 78-20020a630051000000b003fe25580679so1713512pga.9
        for <llvm@lists.linux.dev>; Sat, 11 Jun 2022 19:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Po+OITd9LduODB5Ll6LkiNrsN4yFiLHBsGMIZQJ3aw4=;
        b=USj2uNOn4J4dOBxvN8SrxHVObfqOXrVUcdvvYyDceRvYt5zhMLzhoTN6TnQfzl1YYI
         VMP9IGMv90EFP/i+zzmV5KrqNSdDYlsfJtx4eRRXBimLo/eCSOG0LGY4BlOlUYcX2V6I
         nKAR5o6e+6/9fGbzPo4SDcueczErLHLZci7U+r17hWpUt427sEjTtn2Z8lmMOdb4Yc5N
         rG+CCMf4CD+CxOhaMP7cCFYnFjBwVIDY3zNFrMCIa9Xq5kRUZzO/mbJm08sl3UdJ6GvZ
         HwYeB8Igih0U8odiyyJnZGGAXI6/+EhxkI9MRzDzBHGdFCSAEpCSCOeIA9DFRGbR/B1e
         lVrA==
X-Gm-Message-State: AOAM532EmD6HtFbON3NQ6jG9Zsd+TMsH3x4GV8Y3SA272MdfIxTX+gMK
	STnglIuIvU+v+VzUP+2MaoGg8S2ocCQO8F1ta3ND7wU3ElcONp/G9aEojKpWj1tEfQeKs1RlNPn
	mEm69tyyuoivpLA==
X-Received: by 2002:a17:902:7449:b0:167:9520:d063 with SMTP id e9-20020a170902744900b001679520d063mr26178526plt.146.1655000781883;
        Sat, 11 Jun 2022 19:26:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSUdWj0g6z3wcj79WuGy61sOTinJ+Xh99UhjKXW2wg576bkRRUKMKz5+wx7YOmEnrejlsPhA==
X-Received: by 2002:a17:902:7449:b0:167:9520:d063 with SMTP id e9-20020a170902744900b001679520d063mr26178517plt.146.1655000781571;
        Sat, 11 Jun 2022 19:26:21 -0700 (PDT)
Received: from [10.72.12.41] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id s4-20020a170903200400b0016223016d79sm2188658pla.90.2022.06.11.19.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jun 2022 19:26:20 -0700 (PDT)
Subject: Re: [ceph-client:testing 7/9] lib/iov_iter.c:1464:9: warning:
 comparison of distinct pointer types ('typeof (nr * ((1UL) << (12)) - offset)
 *' (aka 'unsigned long *') and 'typeof (maxsize) *' (aka 'unsigned int *'))
To: kernel test robot <lkp@intel.com>, David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 ceph-devel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
References: <202206112305.4DdsErK8-lkp@intel.com>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <a1a3edde-7b44-eb09-6695-e7c57356b96e@redhat.com>
Date: Sun, 12 Jun 2022 10:26:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202206112305.4DdsErK8-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=xiubli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thanks for the warning report.

These was introduced by one DO NOT MEGE patch, which should go into 
mainline via David Howells's tree IMO.

-- Xiubo


On 6/11/22 11:10 PM, kernel test robot wrote:
> tree:   https://github.com/ceph/ceph-client.git testing
> head:   7b864d005b1f7f6a144420e180891b6401078407
> commit: 3adeefbfca0fd57cc943b7ec0330385f48041f0c [7/9] [DO NOT MERGE] iov_iter: Fix iter_xarray_get_pages{,_alloc}()
> config: riscv-randconfig-r034-20220611 (https://download.01.org/0day-ci/archive/20220611/202206112305.4DdsErK8-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ff4abe755279a3a47cc416ef80dbc900d9a98a19)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install riscv cross compiling tool for clang build
>          # apt-get install binutils-riscv-linux-gnu
>          # https://github.com/ceph/ceph-client/commit/3adeefbfca0fd57cc943b7ec0330385f48041f0c
>          git remote add ceph-client https://github.com/ceph/ceph-client.git
>          git fetch --no-tags ceph-client testing
>          git checkout 3adeefbfca0fd57cc943b7ec0330385f48041f0c
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> lib/iov_iter.c:1464:9: warning: comparison of distinct pointer types ('typeof (nr * ((1UL) << (12)) - offset) *' (aka 'unsigned long *') and 'typeof (maxsize) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
>             return min(nr * PAGE_SIZE - offset, maxsize);
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:45:19: note: expanded from macro 'min'
>     #define min(x, y)       __careful_cmp(x, y, <)
>                             ^~~~~~~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
>             __builtin_choose_expr(__safe_cmp(x, y), \
>                                   ^~~~~~~~~~~~~~~~
>     include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
>                     (__typecheck(x, y) && __no_side_effects(x, y))
>                      ^~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
>             (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>                        ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>     lib/iov_iter.c:1628:9: warning: comparison of distinct pointer types ('typeof (nr * ((1UL) << (12)) - offset) *' (aka 'unsigned long *') and 'typeof (maxsize) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
>             return min(nr * PAGE_SIZE - offset, maxsize);
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:45:19: note: expanded from macro 'min'
>     #define min(x, y)       __careful_cmp(x, y, <)
>                             ^~~~~~~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
>             __builtin_choose_expr(__safe_cmp(x, y), \
>                                   ^~~~~~~~~~~~~~~~
>     include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
>                     (__typecheck(x, y) && __no_side_effects(x, y))
>                      ^~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
>             (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>                        ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>     2 warnings generated.
>
>
> vim +1464 lib/iov_iter.c
>
>    1430	
>    1431	static ssize_t iter_xarray_get_pages(struct iov_iter *i,
>    1432					     struct page **pages, size_t maxsize,
>    1433					     unsigned maxpages, size_t *_start_offset)
>    1434	{
>    1435		unsigned nr, offset;
>    1436		pgoff_t index, count;
>    1437		size_t size = maxsize;
>    1438		loff_t pos;
>    1439	
>    1440		if (!size || !maxpages)
>    1441			return 0;
>    1442	
>    1443		pos = i->xarray_start + i->iov_offset;
>    1444		index = pos >> PAGE_SHIFT;
>    1445		offset = pos & ~PAGE_MASK;
>    1446		*_start_offset = offset;
>    1447	
>    1448		count = 1;
>    1449		if (size > PAGE_SIZE - offset) {
>    1450			size -= PAGE_SIZE - offset;
>    1451			count += size >> PAGE_SHIFT;
>    1452			size &= ~PAGE_MASK;
>    1453			if (size)
>    1454				count++;
>    1455		}
>    1456	
>    1457		if (count > maxpages)
>    1458			count = maxpages;
>    1459	
>    1460		nr = iter_xarray_populate_pages(pages, i->xarray, index, count);
>    1461		if (nr == 0)
>    1462			return 0;
>    1463	
>> 1464		return min(nr * PAGE_SIZE - offset, maxsize);
>    1465	}
>    1466	
>

