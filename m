Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F37F
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 01:34:28 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4107e6fb0e8so38347511cf.3
        for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 18:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20221208.gappssmtp.com; s=20221208; t=1692840867; x=1693445667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Om/ivCHVAhRwD7zWkX5toeItMM4JgUzapHEvOHWSE4=;
        b=axbfktD0hGOymILWFI4Lf5iVAv6oZ8SrmQ3iwjqyffzqVF0npiTUuOmgzua4uZmpyt
         vtiHxCI/wtBbo45e87rU8FmjhIR9NsF2DaZQTooFef4RMI/hMlmTVlWoyQmDhiUJPqjn
         P2fkxWLzds28tR5jAccvGCwRbs9EU6ySu49kyvD3/8mvcu7Zq9o20+VhAoolVj9faLLX
         AF9I0d7l05RD2jKaF+zMT2UIabtultw1EUhWLZB3CwxttQHmW8Lihn40N/AJh/D+1UaB
         p84wV1vA0QojsBdQPfyXTS0KiKSDjd9KaUhaY2fxVlbDivRtZQTlBaFxFiWZpZMnC6xT
         PouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692840867; x=1693445667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Om/ivCHVAhRwD7zWkX5toeItMM4JgUzapHEvOHWSE4=;
        b=LkxVBnCRBTCGhxEWEXDYyfVyT6bdW4a2OlfLx+fynEb7iKLfpZ1SsJn3C+Z1ldvcrs
         H38EQEzmQkzdKHjkD86U+y4VsD847t8XTD+3ENKFNa8ktqd8ZjLJDUZ8gDSD5gIJ2knA
         TbQaEnnULszQtBQKmtAO5dWrvj1oBYP2TJpX9VmtCIqj1yoGCEuxI4LUDRHeaYY06wcs
         46VEya5e4fH9AtiaNrjkw42F9Zuh6TdFBiYl8RNuXO/Jd489tkhyqofI98Em7+pYW3bj
         u3Uknj1Ul9zLfzmGVwjyHINQZwxg331KeP5uNwVk9uYtAWpQVGQkX2V4VihlCWjHzO5w
         SxnA==
X-Gm-Message-State: AOJu0YzTYMoIz9nSkQpHWb7Zy/jLhVfuqFxGC/pSOnVfGMFZYo5kaobl
	RT1KSp6mnsm5UW30O9NpGulLLQ==
X-Google-Smtp-Source: AGHT+IFvgoSrMDdsAH3npNUBskPs/Btd4QwdQ3ZKKw/QPTg1kM+PzOBEwjb/X+iASBAYYeJcebp8Lg==
X-Received: by 2002:a05:622a:138c:b0:411:fc77:5863 with SMTP id o12-20020a05622a138c00b00411fc775863mr2226710qtk.34.1692840867176;
        Wed, 23 Aug 2023 18:34:27 -0700 (PDT)
Received: from localhost (2603-7000-0c01-2716-7ffd-0cf9-a739-5564.res6.spectrum.com. [2603:7000:c01:2716:7ffd:cf9:a739:5564])
        by smtp.gmail.com with ESMTPSA id z8-20020ac87108000000b0040331a24f16sm4064786qto.3.2023.08.23.18.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 18:34:26 -0700 (PDT)
Date: Wed, 23 Aug 2023 21:34:25 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>, Mel Gorman <mgorman@suse.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] mm: page_alloc: consolidate free page accounting
Message-ID: <20230824013425.GA52469@cmpxchg.org>
References: <20230821183733.106619-9-hannes@cmpxchg.org>
 <202308240628.YoW5rQTu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308240628.YoW5rQTu-lkp@intel.com>

On Thu, Aug 24, 2023 at 06:40:58AM +0800, kernel test robot wrote:
> >> mm/page_alloc.c:6702:2: error: call to undeclared function '__mod_zone_freepage_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            __mod_zone_freepage_state(zone, -MAX_ORDER_NR_PAGES, MIGRATE_MOVABLE);
>            ^
>    mm/page_alloc.c:6702:2: note: did you mean '__mod_zone_page_state'?
>    include/linux/vmstat.h:319:20: note: '__mod_zone_page_state' declared here
>    static inline void __mod_zone_page_state(struct zone *zone,
>                       ^
>    mm/page_alloc.c:6754:2: error: call to undeclared function '__mod_zone_freepage_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            __mod_zone_freepage_state(zone, MAX_ORDER_NR_PAGES, MIGRATE_MOVABLE);
>            ^
>    2 errors generated.

Ah, that's in the new unaccepted memory bits. I'll fix those up in v2.
