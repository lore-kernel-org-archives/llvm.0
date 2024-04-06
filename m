Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0070555E7C;
	Sat,  6 Apr 2024 22:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712443254; cv=none; b=RYu4/ZdHYPx7bqSkh6Hepmm2X3J9MfCWY+050RtvKYEg3t1H0u4V2kRvMC8G+6c0+fEmbm7NanMxROXaxmSsRq6mLlBYuFtHvdIXZBSXYIJYQpRsmbbyMv/ykSA3fnONFGx6jCqFOm2ubiVO6KjsD/upL0LENrU+fI7itHHabJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712443254; c=relaxed/simple;
	bh=ya5N7l00Y8YsPWBwlQpXL8/LHrb/WyVg1tQy2ALoU90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BXO7E+ZZ0l4w4hvR4uIt9Fv65y9Ii/vJTBOPlKBxg135Y8Wu35VKk6CbR07OGFXZxDgUtS0sdro7kidDyPu/Yxoecu9wjw80jDKKoW3hLCL/jh9XyGBmRpKJWy7z3H7rfg55AqlP5jR7ZWxYd7odMXCTsVOMsPtaYVyiIBX6Ux8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzsfYkRh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzsfYkRh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e0ae065d24so27188155ad.1;
        Sat, 06 Apr 2024 15:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712443252; x=1713048052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSfK4DYWjgMvyV/uT21dZSzXx4WeG9M/RrTSO1WqEGo=;
        b=PzsfYkRhsD0StKpXwZH51RTM1hN/BOEmQJiuHfWgwEj4emtzlcoWtiN22h6WNjCVI9
         m6gV2amFncJbvoVvUA2eATi+AG5yw8PdNqWrv2aW4xOO5WI6alnLI1PBbpJRFGTCHAfh
         OCm81YXvrMv26BBgmBZIilRmTIgwVIagCWwv3bivB585b74LbUV0qE5DCUiYz5X1d9E0
         xMuJ6xzc42QJd1SYp8deYPEUDCzfwCmHoca3DbRgzMHeNrFbhtAty7NLjCd9SIIK8xjD
         DYy3s+1wTUSTfdOZ/0fK3Usseu1pcluZUmYybBEFZBbVPL97/GHOZAoU26gDOZwKQnfJ
         3AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712443252; x=1713048052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSfK4DYWjgMvyV/uT21dZSzXx4WeG9M/RrTSO1WqEGo=;
        b=ZkypxjSApAWuMfVJE1ryniIjmZdHXKDHkMIwSbftUOPZTRkhZbhkBl7O9GJWYvB2gF
         BqMo/ohMRIkLT7TeD0fVf0kxhDaoN0cFv4zIjd2HJspFRjr3+08XNobunUIz0zw5HaMH
         CcF4dgFLP4BDAUhRBu5RvYDHq1sTGjXwz03KNUTM+kRomAbzoYhOfUXnD6xeJ6A6bbwx
         3pzOtKRjahvZEkI2yfU47RKhhSkzkTgF/EFqRfxrJGkqf6H9xSqkUAwG14B6S93cG1v3
         nVnFcJFurFRK9CZtZ9wrdUZhLYtZlrI6QuUiuY0nDsCDP3XybP5c1z90r/HuRq/PIO1E
         yP1A==
X-Forwarded-Encrypted: i=1; AJvYcCVaBLRn4ONolFKSiLIub3slT8lHBcje0X53b9C1aXiwKmudf2TJ5y75RosxWYF/U78I+TwSWlPGhR142XUqHu7yJOnIBGPtKlJdKsTdwrvMa2afSJlhixHTfz2Lhqs2hu4/Bck=
X-Gm-Message-State: AOJu0YxipOteoFyPVNbdQnokZ9dpm6XdbeKfjd8Zh28H0H/U4Eq97RJG
	TTPiz41nIdGK245b6JHNb99mTyJEozV7cxRlOlCBG6nsudiDyJAS
X-Google-Smtp-Source: AGHT+IFOk9kHM81QLTCgMT3cvyrNDqwVnfq7ZHWBk30/Pjwvy+YRmEHpkYLTf5SF1D/MKcbQTrUC4Q==
X-Received: by 2002:a17:903:2351:b0:1e2:88fd:c211 with SMTP id c17-20020a170903235100b001e288fdc211mr5359594plh.4.1712443252165;
        Sat, 06 Apr 2024 15:40:52 -0700 (PDT)
Received: from localhost.localdomain ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
        by smtp.gmail.com with ESMTPSA id jf20-20020a170903269400b001dd82855d47sm3869450plb.265.2024.04.06.15.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 15:40:51 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	v-songbaohua@oppo.com
Subject: [akpm-mm:mm-unstable 313/322] include/linux/huge_mm.h:274:16: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
Date: Sun,  7 Apr 2024 10:40:38 +1200
Message-Id: <20240406224038.5412-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202404061754.n8jmZ6s3-lkp@intel.com>
References: <202404061754.n8jmZ6s3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   f43b3aae94511d62174c3b29239da0dd22d0eeb3
> commit: d4358ee0a075e232114dfec0cd162860cfa2771b [313/322] mm: add per-order mTHP anon_alloc and anon_alloc_fallback counters
> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240406/202404061754.n8jmZ6s3-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061754.n8jmZ6s3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404061754.n8jmZ6s3-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from arch/powerpc/kernel/asm-offsets.c:19:
>    In file included from include/linux/mman.h:5:
>    In file included from include/linux/mm.h:1115:
>>> include/linux/huge_mm.h:274:22: warning: variable length array used [-Wvla]
>      274 |         unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
>          |                             ^~~~~~~~~~~~~

This is amazing. powerpc's PMD_ORDER isn't const. I will
move to alloc_percpu instead of using a static array.

Thanks
Barry

