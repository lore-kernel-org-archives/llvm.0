Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525602FFFB5
	for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771417386; cv=none; b=UkwSR/caWK5km/2IoxFoCjzodxtob2d+PIHBPtX624EsX0Q2WrN5ydp4zlQ8zE4YpJM22b27wrHMoItGwp66YSeuHs4hUIlTFIvtXq2nNXCaOPfjARWKb8pC8bccN17tvv0rkIXwOxrQZd9cuq4YSfNVj/Rcr3m+9nTj1uvuv10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771417386; c=relaxed/simple;
	bh=rSi/zGdLx94wonyB5Nc+KkoFxaiaTjxmDzpadVtJyR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ/UitsLSXhTaCh+KonW/pMDK3aJLllSVTQ3Pzs2IQLPVyWiXBF5mqTGh6j1DWM/Qtl4cbT5igocTRgN6vqgU+dF3yueATE7p5tfo8E+gtSOvzxeFMbS/T5rRg4Sw18KDq1BvR2rutyeJ+8PxE4liuL07h4ikpT2rzIIVPJUmno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GR8X2I+M; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GR8X2I+M"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c6de0364915so3003001a12.2
        for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 04:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771417383; x=1772022183; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x/l1g6wqb0NZRc7ZX34WwaHpuKkAAz4lIDkW1nuJe3Y=;
        b=GR8X2I+Mf/kmYwFwktpuP4TJRBshJXFEmx+KTUismJWfTVSHYbqE+oQMkuuBYbdiqF
         fdaonpi7F1CAi9livG8OSrLLQtF0fvutcqcStLp1/C+0AQkGOE2vZn1tiyyP6RPdu5G/
         jjJZgGehQ5Dw1lIIfax6grsRi05PqEW1DO8SablpKIIH4GY6RrI9bFRVbtpqzXMoFVOd
         aeWrTB+qAJryVXRPuc3Up3WbG662vN4HIRnw3iyeNuWT0InrQP+VVZVSzij+QWxCvQT5
         lnwbn+dTiAUHTBdgMisu9Prw69mmc1Y1FqLQN9zP5/bK+aXKD6dVEGK1D4Wi6/rGXbje
         IgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771417383; x=1772022183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/l1g6wqb0NZRc7ZX34WwaHpuKkAAz4lIDkW1nuJe3Y=;
        b=A/sFrEe55RLPOhUacjqSs8fzg8oUjqhiGmRzhK2E7wUnSbTlq6FeCU4t0zX99Wsqv5
         wocIN+gsLhfJSNxUKANLPZ6lSx3IvG4cMzStgsfoeil0oJwmhS8MojNt3AAjf/WrmYEL
         Et++U6hOPwPaePTX9sluMxWBBsHbEs+za/VwWiPxzNwH1c/YWPrp2aSoCKSmuK1SVJoL
         K71NscQsM2sg2bWeafjdGTznomtAoOtm/p7bmb7MUCUu/FuLskdFOBwkZ+S4V9ZKnbwA
         2e9i3QRA6UJs0veTM3fBEKcYCbgN/GdFZFWijfqqwBnohhgeyumAGMi67xvRg1Edtt7S
         M6dg==
X-Forwarded-Encrypted: i=1; AJvYcCVi7NgDWrnDAiu+nxDAtgE5RhyPid56RE4Q6E+Wj5SjpsUJUnbFUAdBCXdYEaJDFuwcrxu4@lists.linux.dev
X-Gm-Message-State: AOJu0YxgnVYmuPjdCdlY8dgua4YEaDj6JrgmLfDnJqrcFDkrTdBLE8my
	e76tXGVKH34r8Pcdu8CL327+TteisGOTuLFXLxuUV+jWtykszTga42Ti
X-Gm-Gg: AZuq6aJr0ZqHHoiVD18ZxOcKYLEqSUTtpcox1mKR6+B7WQz5B+T1utgoxGAjeE37etL
	0X8yN9OjGN+HcRWxScHOUwPR5PFbuUC2Xn9MWflIjvle7En3DU3lGeOdyolKK93aW/ZvesQn4RN
	bEUix2oJOIkF0IIQ9r8Jr2RV8/hV1uBzqblYeQdkYJ3eQ4A2FwMEfZHY7HNKOnE1TLIkAX2C2rQ
	dqQ74gnZODaI+yn40pLHHBd14S4y9T3B5/oTUC1M2B7vivI2H+SmXo4hTJwirSfMTiInFusuGGN
	22dAge9nnV8Q3nUimyKAmKB6DNHSqkR+5JQw8dgHCaGC04um2Xrqi2/59zVddVQmh6uDurJ7PyA
	VGjAWz2M++dIS2BIlIxcxUXiQaeEKj8qEhafJTc1P9TycdR4T5AUmGV/YmHiy0h0qgS/lHh4U4U
	aTIs0ZBmaphrLGZC4GJRwzYBIGBwk3BYaZ7dWfRTmS+K9AxpZOjXfp8rFK9EI=
X-Received: by 2002:a17:902:cccf:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2ab4cf4f481mr176018015ad.12.1771417383553;
        Wed, 18 Feb 2026 04:23:03 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358878c2a52sm1180707a91.6.2026.02.18.04.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 04:23:02 -0800 (PST)
Date: Wed, 18 Feb 2026 20:22:54 +0800
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org, kernel test robot <lkp@intel.com>
Cc: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Youngjun Park <youngjun.park@lge.com>, 
	linux-kernel@vger.kernel.org, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH v3 09/12] mm, swap: use the swap table to track the swap
 count
Message-ID: <aZWuLZi-vYi3vAWe@KASONG-MC4>
References: <20260218-swap-table-p3-v3-9-f4e34be021a7@tencent.com>
 <202602181835.58TEynxc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602181835.58TEynxc-lkp@intel.com>

On Wed, Feb 18, 2026 at 06:40:16PM +0800, kernel test robot wrote:
> Hi Kairui,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on d9982f38eb6e9a0cb6bdd1116cc87f75a1084aad]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-swap-protect-si-swap_file-properly-and-use-as-a-mount-indicator/20260218-040852
> base:   d9982f38eb6e9a0cb6bdd1116cc87f75a1084aad
> patch link:    https://lore.kernel.org/r/20260218-swap-table-p3-v3-9-f4e34be021a7%40tencent.com
> patch subject: [PATCH v3 09/12] mm, swap: use the swap table to track the swap count
> config: i386-buildonly-randconfig-001-20260218 (https://download.01.org/0day-ci/archive/20260218/202602181835.58TEynxc-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181835.58TEynxc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602181835.58TEynxc-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/swapfile.c:1627:6: warning: shift count >= width of type [-Wshift-count-overflow]
>     1626 |                 VM_WARN_ON_ONCE(ci->extend_table[ci_off] >=
>          |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     1627 |                                 (BIT(BITS_PER_TYPE(ci->extend_table[0]))) - 1);
>          |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
>        7 | #define BIT(nr)                 (UL(1) << (nr))
>          |                                        ^
>    include/linux/mmdebug.h:123:50: note: expanded from macro 'VM_WARN_ON_ONCE'
>      123 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
>          |                                     ~~~~~~~~~~~~~^~~~~
>    include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
>      120 |         int __ret_warn_on = !!(condition);                              \
>          |                                ^~~~~~~~~
>    1 warning generated.

Nice catch from the bot. It's a new added sanity check in V3 just
in case the swap count maybe grow larger than UINT_MAX, which should
never happen, but just in case.

I really should just use the existing helper macro for that:

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 801d8092be51..34b38255f72a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1624,7 +1624,7 @@ static int __swap_cluster_dup_entry(struct swap_cluster_info *ci,
                }
        } else if (count == SWP_TB_COUNT_MAX) {
                VM_WARN_ON_ONCE(ci->extend_table[ci_off] >=
-                               (BIT(BITS_PER_TYPE(ci->extend_table[0]))) - 1);
+                               type_max(typeof(ci->extend_table[0])));
                ++ci->extend_table[ci_off];
        } else {
                /* Never happens unless counting went wrong */
