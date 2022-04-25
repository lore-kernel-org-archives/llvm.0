Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BC77C
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650873871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8f4fE6IYdVj/twVD/+DJWond2u+iNcuU3vy06rRPI4=;
	b=AIhreeQ2+xiPAh1H5aP1C0thn3wJAhKZNE3d2nwcvO5/1vZP+OZOXORX+pKJkzhRk/tDi1
	sQ70zg0OuIxfk1r3i0/sHT9iCLJHQ5F5C1AHunrNvTTjm/iMm+J1UdAS4ubplkThcWl10W
	/nXotVZcXx+bxTuD6uwMAm0FDbn+3w0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-jRbo3-zKPlGCkQ_X2qehlg-1; Mon, 25 Apr 2022 04:04:30 -0400
X-MC-Unique: jRbo3-zKPlGCkQ_X2qehlg-1
Received: by mail-wm1-f71.google.com with SMTP id v191-20020a1cacc8000000b0038ce818d2efso6454356wme.1
        for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 01:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=N8f4fE6IYdVj/twVD/+DJWond2u+iNcuU3vy06rRPI4=;
        b=VB4vVxLrwyA+MANNUg1fzCzL14iK9TZIubBp9DwvSE8wDqg1pMGc95pqrS2cN0RLFH
         mNwVDJX301nM5rKhv1qu4tkfWqs+Z/pCasV4usvD93zWe8ye/I+TZohwfvqwSfcXdVIv
         UIHVxJN8FUXAKwFggK3liVGFBtVWAsd0SBnDK9UNPO3rA+wslANTVAr0Fqd0ukmbWwsz
         CWDGbhBAOISEz/PrU4ff8ObaP8YFQ/kOnopYt2mHZV7a5vkCNJAYDUgm5OZxRrE9AcHV
         /sAezfdlXO/tYktNz4Lo2TWTBh+AnFu20X2eXspXEDOXTz1mi7fhyphnuwPPDcDF+f0d
         ntRg==
X-Gm-Message-State: AOAM533JxKSSbV84ztWF/UHn2WRPYXnL7k7ArIZyCZj+NNZbSn1Ka0Q4
	Ysb+GA0ECJr3XQdVUy1klWSkNfXkuq5ZEN8ZgeNNErANdi8NFIumiPb+GMBIrGOTcWVp+4gFZ2W
	lcnpbyQ8f20kopw==
X-Received: by 2002:a5d:5889:0:b0:20a:9707:39c with SMTP id n9-20020a5d5889000000b0020a9707039cmr13454298wrf.54.1650873869298;
        Mon, 25 Apr 2022 01:04:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHXd+uZj5EXJCQ4ArjuZpEu8IU9qMfpi/Bi4crZ1SrHy3v7d6AifKMd/UoRx5duNYkxn3anw==
X-Received: by 2002:a5d:5889:0:b0:20a:9707:39c with SMTP id n9-20020a5d5889000000b0020a9707039cmr13454283wrf.54.1650873869034;
        Mon, 25 Apr 2022 01:04:29 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:490d:ed6a:8b22:223a? (p200300cbc700fc00490ded6a8b22223a.dip0.t-ipconnect.de. [2003:cb:c700:fc00:490d:ed6a:8b22:223a])
        by smtp.gmail.com with ESMTPSA id t9-20020adfa2c9000000b002061561d4a7sm8402748wra.96.2022.04.25.01.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 01:04:28 -0700 (PDT)
Message-ID: <1d67fd1c-29d8-d5a6-4d36-17fd238385cd@redhat.com>
Date: Mon, 25 Apr 2022 10:04:27 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [hnaz-mm:master 34/291] WARNING: modpost:
 vmlinux.o(.data+0x234bc8): Section mismatch in reference from the variable
 fc2580_driver to the function .init.text:set_reset_devices()
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202204241241.dnUrBBvT-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <202204241241.dnUrBBvT-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.22 06:21, kernel test robot wrote:
> tree:   https://github.com/hnaz/linux-mm master
> head:   ba42854fa9997614e0ffdbc35b082df3ba6e59da
> commit: 477a4d0f1f38e738d1a50d5005b79aca719c30bc [34/291] mm/hugetlb: take src_mm->write_protect_seq in copy_hugetlb_page_range()
> config: riscv-randconfig-r015-20220420 (https://download.01.org/0day-ci/archive/20220424/202204241241.dnUrBBvT-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/hnaz/linux-mm/commit/477a4d0f1f38e738d1a50d5005b79aca719c30bc
>         git remote add hnaz-mm https://github.com/hnaz/linux-mm
>         git fetch --no-tags hnaz-mm master
>         git checkout 477a4d0f1f38e738d1a50d5005b79aca719c30bc
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> WARNING: modpost: vmlinux.o(.data+0x234bc8): Section mismatch in reference from the variable fc2580_driver to the function .init.text:set_reset_devices()
> The variable fc2580_driver references
> the function __init set_reset_devices()
> If the reference is valid then annotate the
> variable with or __refdata (see linux/init.h) or name the variable:

I don't see my patch causing that. Seems unrelated.

-- 
Thanks,

David / dhildenb

