Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43DF2581
	for <llvm@lists.linux.dev>; Mon,  2 Jan 2023 10:28:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g10so6302839wmo.1
        for <llvm@lists.linux.dev>; Mon, 02 Jan 2023 02:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ruN1yQRxsJ2H59E/8nRfHXr5P9ik8d8Ya3T8OD5cP4=;
        b=NCpqguz+0+y298G1i+bRdhu158D23TS0/cFqbuEH9uaQ0xUap1ZpBLZQ9gTqcfUNAE
         6FoOcm05bcdewGnsvzm0wI856YwCuLFKF/0q6rNRH0jUUBlaRqcBVLgkc2Q5/8/SHwjj
         K0Ivu9ZbwVGPsZTZJsl+7ennV5+20L1y2NpbPbDwfkMJ0iIHNsKx44FPJfBGlol1ZhGc
         OEv0DKWdxu1TzgksH1BdqoTr0wa6VWSaSh1hfvOjM/2bukI+YKACWxuewYYS8Yo/hh2s
         02KtK1YiNp5WZeWS+8rCsVN86tyXOvsxrXgDJlJ98q7nstUXJ1cfombZJuH5xIBMH7L0
         IqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ruN1yQRxsJ2H59E/8nRfHXr5P9ik8d8Ya3T8OD5cP4=;
        b=ZiS/SaVnYDdvMQ53tOcuT5yOp6cIXpsOEqeNTvkRjecdPJkqYfCPkmjSyDz4XHVTe4
         fpGxvtWsyD4x8SJbywpxGqTZ9oXeP9m9BwJDrTBiF1clstiBI1U1ocUZlWXiNg3CYbY+
         ZR8Wg2NgcKB+YDSCdGskvmBdS7i/QuEbf5EJZ+uSO6GNznEbtktbuE/tgELCZ5mXEB0a
         Gy1nvoG21f+db9q/Nkim2ZfFNusWD58pBlpCTEgVK+Go5yHt68P+QY6Xjs1RYE7o9w3t
         3bUu6NSmDon6++Oo45RNOuaMFLb1rA2ML73RZYzwniXBy+JiKjRF4/I2G2PWI/R4xyga
         QYRA==
X-Gm-Message-State: AFqh2kqFNTyibw6mvppqgS6DrvZiZXDEiVIuY0OaZ7CzYR6VR2amWUeM
	g3c8/f+RKiN4I6DNrtEq/WAXrw==
X-Google-Smtp-Source: AMrXdXs3+oHqTiwD20iKTyXrSC1Y9q660G6druCOcY5YaX+HRighIfyyIvAnMk8DvfwOGNKnLzrE/w==
X-Received: by 2002:a05:600c:12c6:b0:3cf:6926:2abb with SMTP id v6-20020a05600c12c600b003cf69262abbmr30868798wmd.7.1672655284796;
        Mon, 02 Jan 2023 02:28:04 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:6950:757d:cd6e:92aa])
        by smtp.gmail.com with ESMTPSA id l13-20020a05600c2ccd00b003c70191f267sm45465878wmc.39.2023.01.02.02.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 02:28:04 -0800 (PST)
Date: Mon, 2 Jan 2023 11:27:57 +0100
From: Marco Elver <elver@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: mm/kmsan/instrumentation.c:41:26: warning: no previous prototype
 for function '__msan_metadata_ptr_for_load_n'
Message-ID: <Y7KxrfQ5FQmqVBAn@elver.google.com>
References: <202301020356.dFruA4I5-lkp@intel.com>
 <aa722a69-8493-b449-c80c-a7cc1cf8a1b6@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa722a69-8493-b449-c80c-a7cc1cf8a1b6@suse.cz>
User-Agent: Mutt/2.2.7 (2022-08-07)

On Mon, Jan 02, 2023 at 11:01AM +0100, Vlastimil Babka wrote:
> +CC kmsan folks.
> 
> I think it's another side-effect where CONFIG_SLUB_TINY excludes KASAN which
> in turn allows KMSAN to be enabled and uncover a pre-existing issue.
> 
> On 1/1/23 20:10, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   e4cf7c25bae5c3b5089a3c23a897f450149caef2
> > commit: e240e53ae0abb0896e0f399bdfef41c69cec3123 mm, slub: add CONFIG_SLUB_TINY
> > date:   5 weeks ago
> > config: x86_64-randconfig-a013-20230102
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e240e53ae0abb0896e0f399bdfef41c69cec3123
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout e240e53ae0abb0896e0f399bdfef41c69cec3123
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash mm/kmsan/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >>> mm/kmsan/instrumentation.c:41:26: warning: no previous prototype for function '__msan_metadata_ptr_for_load_n' [-Wmissing-prototypes]
> >    struct shadow_origin_ptr __msan_metadata_ptr_for_load_n(void *addr,

Probably needs a fix similar to:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9dd979bae4cf76558ff816abe83283308fb1ae8c
