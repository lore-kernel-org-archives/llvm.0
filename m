Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6454A321A1
	for <llvm@lists.linux.dev>; Fri,  8 Dec 2023 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eTVv/x5f"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5c5fb06b131so1547844a12.0
        for <llvm@lists.linux.dev>; Fri, 08 Dec 2023 07:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1702050309; x=1702655109; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aSIhejMi2RvmJNFCsKZgxBFrupMMmn935wC4f2iCNQg=;
        b=eTVv/x5fZzoRs8+D10TJrfrbrNZgTDE6n7CDMkbDkbyvMfkz/fBgy9d/5HmzclmpGU
         VnGpCbRAvWFJv9Bqc+uQY5BwUGGwFQzJV0OlqMHM7wkdlY9xMmc7u07bekNtHoJXB0xq
         19Um+sxevzUr6vpxLQz6hcePmJITYMvovvpqBSU2dHZhMkRT/vOGIHScAALapldDCs2u
         fGr0eg5TZBCs79dXqU/OH6wjhAe5UXFqG8GB46RBf/W6uhCiF38ZFbB5U0WrUGYIBbpz
         Aj+UOx4vmmiaarerx7CvyCMM17H0fUQAM+aYMwupswgFDqhtl50b7RKqYJkbWtzZDUYD
         eH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702050309; x=1702655109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSIhejMi2RvmJNFCsKZgxBFrupMMmn935wC4f2iCNQg=;
        b=sFaNSsiz9fxxA3UA0e4VgjjGQ5ta1e7wt6PwOkFGQtl4Qvev7olXAHjkhRF6tIm+DR
         KeBD9pqBJCWCwhvev4XfeDt0xcDi7+aHv8MMKBbVc4e+Hh3mXMlZKo1SDoC25I68hJpa
         22ZGnKi1k8GgeCC2xnDanrEfhkGocdXKFy9ExxH47hzg5lC5LVriZQ1DODkS65WyM+K2
         v00q9KoiW3nH+1YhsQ9lTCVSgWibGS/hgshV2ZXWqEeRodm27owWrGAex0PwnVtZlyJB
         jcwYq0WUvKm4iVqcoKYoBp1dZAnjWbt7l7aCslonemuNaIxLG226qN9lyu4oXTyH9DOC
         /j7A==
X-Gm-Message-State: AOJu0Yz7IWsZLRG2Kr2KpP+ktoxorssEZK9gxdar0MPa4VRKqGbB8F33
	q5x5TGrIUWw+Ybnm980aHydDTA==
X-Google-Smtp-Source: AGHT+IGdUUbB++2LBRHDq+4gTXricXvOqgQFyCf+OZTByWhnSGPh/zvXwXZbFMSj/bMMd8fVtscIDQ==
X-Received: by 2002:a05:6a20:3ca3:b0:18b:ec94:deed with SMTP id b35-20020a056a203ca300b0018bec94deedmr208781pzj.45.1702050309405;
        Fri, 08 Dec 2023 07:45:09 -0800 (PST)
Received: from [10.4.166.75] ([139.177.225.252])
        by smtp.gmail.com with ESMTPSA id fb32-20020a056a002da000b006ce7ed5ba41sm1698369pfb.55.2023.12.08.07.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 07:45:09 -0800 (PST)
Message-ID: <35bff89e-a984-42e3-a6e7-1933b12b6451@bytedance.com>
Date: Fri, 8 Dec 2023 23:45:02 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] mm/zswap: make sure each swapfile always have zswap
 rb-tree
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Vitaly Wool
 <vitaly.wool@konsulko.com>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Seth Jennings <sjenning@redhat.com>, Dan Streetman <ddstreet@ieee.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yosry Ahmed <yosryahmed@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-kernel@vger.kernel.org
References: <20231206-zswap-lock-optimize-v1-1-e25b059f9c3a@bytedance.com>
 <202312082309.xvC0Rdd9-lkp@intel.com>
From: Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <202312082309.xvC0Rdd9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023/12/8 23:17, kernel test robot wrote:
> Hi Chengming,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 0f5f12ac05f36f117e793656c3f560625e927f1b]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Chengming-Zhou/mm-zswap-make-sure-each-swapfile-always-have-zswap-rb-tree/20231206-174717
> base:   0f5f12ac05f36f117e793656c3f560625e927f1b
> patch link:    https://lore.kernel.org/r/20231206-zswap-lock-optimize-v1-1-e25b059f9c3a%40bytedance.com
> patch subject: [PATCH 1/7] mm/zswap: make sure each swapfile always have zswap rb-tree
> config: i386-buildonly-randconfig-002-20231208 (https://download.01.org/0day-ci/archive/20231208/202312082309.xvC0Rdd9-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312082309.xvC0Rdd9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312082309.xvC0Rdd9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from arch/x86/kernel/asm-offsets.c:9:
>    In file included from include/linux/crypto.h:17:
>    In file included from include/linux/slab.h:16:
>    In file included from include/linux/gfp.h:7:
>    In file included from include/linux/mmzone.h:25:
>>> include/linux/zswap.h:53:43: warning: non-void function does not return a value [-Wreturn-type]
>    static inline int zswap_swapon(int type) {}

Ah, will fix to return 0 when !CONFIG_ZSWAP here.

Thanks!
