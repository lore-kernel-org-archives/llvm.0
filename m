Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0FC64C
	for <llvm@lists.linux.dev>; Sun,  1 Oct 2023 03:15:52 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-690fe1d9ba1so3426829b3a.0
        for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 20:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696130152; x=1696734952; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Z+g/FhlsBEqj0ssrxrGUZoJT4P358LfexzMwY5PQkk=;
        b=YS8ctlusE2ZFHFRZYA8lgXBr5LBm4Dkwi87VeLZw5sWJjaEKPZcPGcLh3ATlShzt+2
         Y54twaOpqYdBU6Jx3Z5YWTUEA45meyqVbBhW7Us/ND1JfnkezxKfpaYSFMNCuw/yU3ob
         EFzQlsyA/Zr+16sk+ApRHuKIls2yjiVoqLLfsD9soQOXWbO5uFsat8RVOdcLaEGpQ8Z9
         COgRbsGo970tdS6FLE9mBF0mIRjyX0iVT9S2Jn67BI0eGlNxyfqRA22bBYRnzfXFWOR+
         fN6SOKCSs1xWqaYrho5Pst7usEnnl6eSB+TLYMhXD2JMyh1hsGTNou2xOXwYmGgwdBo8
         MyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696130152; x=1696734952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Z+g/FhlsBEqj0ssrxrGUZoJT4P358LfexzMwY5PQkk=;
        b=Vb4npO9IaHS5oQ4HubGqrC0MOgaKuC+1lLz+im4LriLI+OyHeW8MTFKOWj2txzYBuB
         JfR0OK+OgtEcGMQrBoR+M8BamSPTSAXsY9f/I3YHOP9aTSZDFXDrWrASmUlcGteY6CjQ
         AsjE92oRRHJ5jZDFoZSIdgYLfiSKRyQDvNjY8TsxXrLI0oM8lMNoOW4PXoX67a/TwEGH
         IM4p0jW8c2rLD8PXvwyX/uS6/ygLsZ13z3yMAn6QeHVIW6pX0F6uG+sNtSruf1WnDoZ7
         d4Y9wrYUtnev13SMkwdke5os30tKwqBpTfgb69usQ21i+PMpWe4dPsap1Pe/Kg8LT1k3
         FpcQ==
X-Gm-Message-State: AOJu0YzIvbSePXKhgem1Z7mUt7724oplqbNtQjDrYyD6qT0kSmRaCaUC
	SSIi1ELLCErrJmiwCt5yxed/fQ==
X-Google-Smtp-Source: AGHT+IGurqhbCIPjsxXeILgMQH1jgLBUPTNbX2v4+oj78vQxmGTcAw0c/QFAKPtIPrt2YhUot7Nm1A==
X-Received: by 2002:a05:6a00:4682:b0:68f:c8b3:3077 with SMTP id de2-20020a056a00468200b0068fc8b33077mr7939703pfb.1.1696130152436;
        Sat, 30 Sep 2023 20:15:52 -0700 (PDT)
Received: from [10.4.72.5] ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id x26-20020aa784da000000b0068c0fcb40d3sm17287322pfn.211.2023.09.30.20.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 20:15:52 -0700 (PDT)
Message-ID: <07261663-9082-4ce2-b326-a23a94974a33@bytedance.com>
Date: Sun, 1 Oct 2023 11:15:47 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] fixup: mm: shrinker: add a secondary array for
 shrinker_info::{map, nr_deferred}
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <20230928141517.12164-1-zhengqi.arch@bytedance.com>
 <202310011038.Q1iDUi0v-lkp@intel.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <202310011038.Q1iDUi0v-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch will be folded into one patch with 
https://lore.kernel.org/lkml/20230911094444.68966-41-zhengqi.arch@bytedance.com/, 
not a separate patch.

Thanks,
Qi

On 2023/10/1 10:58, kernel test robot wrote:
> Hi Qi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on next-20230929]
> [cannot apply to linus/master v6.6-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/fixup-mm-shrinker-add-a-secondary-array-for-shrinker_info-map-nr_deferred/20230928-221637
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20230928141517.12164-1-zhengqi.arch%40bytedance.com
> patch subject: [PATCH] fixup: mm: shrinker: add a secondary array for shrinker_info::{map, nr_deferred}
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231001/202310011038.Q1iDUi0v-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011038.Q1iDUi0v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310011038.Q1iDUi0v-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> mm/shrinker.c:99:12: error: use of undeclared identifier 'shrinker_rwsem'
>             up_write(&shrinker_rwsem);
>                       ^
>     1 error generated.
> 
> 
> vim +/shrinker_rwsem +99 mm/shrinker.c
> 
>      76	
>      77	int alloc_shrinker_info(struct mem_cgroup *memcg)
>      78	{
>      79		struct shrinker_info *info;
>      80		int nid, ret = 0;
>      81		int array_size = 0;
>      82	
>      83		mutex_lock(&shrinker_mutex);
>      84		array_size = shrinker_unit_size(shrinker_nr_max);
>      85		for_each_node(nid) {
>      86			info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
>      87			if (!info)
>      88				goto err;
>      89			info->map_nr_max = shrinker_nr_max;
>      90			if (shrinker_unit_alloc(info, NULL, nid))
>      91				goto err;
>      92			rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
>      93		}
>      94		mutex_unlock(&shrinker_mutex);
>      95	
>      96		return ret;
>      97	
>      98	err:
>    > 99		up_write(&shrinker_rwsem);
>     100		free_shrinker_info(memcg);
>     101		return -ENOMEM;
>     102	}
>     103	
> 
