Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE4E1774D
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 11:15:45 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fe2d218eedso57019245e9.0
        for <llvm@lists.linux.dev>; Wed, 09 Aug 2023 04:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691579743; x=1692184543;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdOgII60Og+bqAR+MgVZz+ZgwgOC15u6vTysGLiYTo8=;
        b=5VJ25N7sQ/Yfzsp1Apyq9lRgTmiyMJY4TIBi3Ht1aXZPvDVTC2WPE5ZjuqqoG5C1/v
         HBfs/8/w+LCAKOqGbkIUdBy8syXtwgS0FN5GO+qPK4Lk/c1k67TYsfuv4yku8B1oYAwH
         MYH/aB+X394txyr30nKz3ZvkfTqDekt/kezMd6IaKclHiFUi20NPkMAHJY56e/Ot5fAE
         oBWrf9l3yFmQXQ31pkJr0mJS5xKBny6FLaNeEVOV5isb/c2oumRQS6IU77/9gvWcu89n
         MFpvwlS6tytsboH9+kxkEGSTO1e1UeRrjn7KJY9m1oZ7QcxpNQZ5Ujra/OQEny6I9sV1
         RVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691579743; x=1692184543;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdOgII60Og+bqAR+MgVZz+ZgwgOC15u6vTysGLiYTo8=;
        b=UQ/Dn3Uc7ewGGP16SC5YmgHCWRKC1kaOoGJGOwri1tMuBnwj2PyHpcTISUgDSguosC
         3qPynhGu+9+OABXsOcDYKOx5kGSVLxsNabSZLXa54KyprfW9NW0Ywbyw0MhZGr4ChPh6
         aGcV/d8H6dfGdYDEObeoEoC0M+oAwpy8U9gD3CmrbOjZj0OdZWPQLFHqhqBeoHVEf8xy
         n7D5+nrEqiOR3K8ZL534BaCB0pzFxsvaFL8+f4TkEIi8b7v6zq0jmUYWiN8pHQskAv4K
         sGRDpWKUi+h/G/yfzCO91ajGwaiLzjRB2RwfW2n2WY8b8g/GalcHRWHY1bTbvlcs5NqY
         4J9A==
X-Gm-Message-State: AOJu0YysJG+u7RM6QLmeoq18BzJC5ka2qlKgO/fe5p+ntJ4VrWAFNhlA
	S2FjSlVR0UcAmI5suj4TuzQfJw==
X-Google-Smtp-Source: AGHT+IHwDk+rpqdwrzIETPQychYDSJpoMKmg2GdrOjZChQTHQdm/v6UEqiR/2iTj269J/GMWIm2u7Q==
X-Received: by 2002:a7b:ce07:0:b0:3fe:45e5:f6ee with SMTP id m7-20020a7bce07000000b003fe45e5f6eemr1838933wmc.19.1691579743145;
        Wed, 09 Aug 2023 04:15:43 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:9c:201:9ce0:327a:6e5a:3533])
        by smtp.gmail.com with ESMTPSA id p25-20020a1c7419000000b003fe2bea77ccsm1696267wmc.5.2023.08.09.04.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:15:42 -0700 (PDT)
Date: Wed, 9 Aug 2023 13:15:37 +0200
From: Marco Elver <elver@google.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [linux-next:master 8173/8441] include/linux/list.h:53:13:
 warning: '__preserve_most__' calling convention is not supported for this
 target
Message-ID: <ZNN1WdZ5J/e5OPAt@elver.google.com>
References: <202308091820.0dPY7D6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308091820.0dPY7D6f-lkp@intel.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

On Wed, Aug 09, 2023 at 06:27PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   21ef7b1e17d039053edaeaf41142423810572741
> commit: fee8feb67f0b2954eb7a2a259122e43a15cf3a52 [8173/8441] list_debug: introduce CONFIG_DEBUG_LIST_MINIMAL
> config: hexagon-randconfig-r041-20230808 (https://download.01.org/0day-ci/archive/20230809/202308091820.0dPY7D6f-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091820.0dPY7D6f-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308091820.0dPY7D6f-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from arch/hexagon/kernel/asm-offsets.c:12:
>    In file included from include/linux/compat.h:14:
>    In file included from include/linux/sem.h:5:
>    In file included from include/uapi/linux/sem.h:5:
>    In file included from include/linux/ipc.h:5:
>    In file included from include/linux/spinlock.h:56:
>    In file included from include/linux/preempt.h:12:
> >> include/linux/list.h:53:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
>    extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
>                ^
>    include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
>    # define __list_valid_slowpath __cold __preserve_most
>                                          ^
>    include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
>    # define __preserve_most notrace __attribute__((__preserve_most__))

To silence this warning, we can just guard it based on known-supported architectures:

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c88488715a39..c523c6683789 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -128,7 +128,7 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
  *
  * clang: https://clang.llvm.org/docs/AttributeReference.html#preserve-most
  */
-#if __has_attribute(__preserve_most__)
+#if __has_attribute(__preserve_most__) && (defined(CONFIG_X86_64) || defined(CONFIG_ARM64))
 # define __preserve_most notrace __attribute__((__preserve_most__))
 #else
 # define __preserve_most
