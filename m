Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917022C027C
	for <llvm@lists.linux.dev>; Sun, 29 Mar 2026 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774784666; cv=none; b=qvcfgxLlJAO31ihO2uZSIhrqqrrY3h/cfZIZ+s0C6AFdjrlMMUlBf/8wrKHsdGFd5wuSXXZzPKoCzoSSw1dmsYdGTdkukJEXz/CWSNwwO6QndFwig2YJJmrr5AhdVb0wLxbleWs4P5eyCi/ZCse1xOB2pwoR+CjtP70FxwSexIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774784666; c=relaxed/simple;
	bh=lkgcc4CtMjk1bN0zjQdR/f0eplRuaa0CikSDA4RfA5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RX3XGzRON0YE7Ap+0ON9YqeMJqOymctXkzfBYYuJibaICilSoBJDJiLOQEwVyNiUsd6qxfv7XG0hoEel1u5xsmYJFvky6j/j+DDzc/f5Poka/VQN/3lxO9e9NCaeDNOX+k42B5nG4ruUpFtfQXFEW6cK17bacr2P1Llj0ZXEn88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaRPztiT; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaRPztiT"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so1692596a91.1
        for <llvm@lists.linux.dev>; Sun, 29 Mar 2026 04:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774784665; x=1775389465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Csdueb260dLL4KAw0AfvdDf024yqqfeIAyjh7nn3RU=;
        b=GaRPztiTjmuwtYLH9xvQe3bgoXrNln6Q64dlb008rrTw0U+OcUvBf0Zz1kCGEsl3YP
         CqSW/5+H7JScqg1yTRaocbuULMJpnK+goumYJRwEFAElPuXJSvC5NK8LMQ4E1iMeZ1pI
         lpiLoR40d3UhUrLlF1AzJqdhANP5rCClFIBJl2LpTNI/olaeiqXnuc8GUxRsq/KCFdvA
         6n+fKiv5vPXA1Iif3fx7bujPWkLcDB8KPVtozMdu04ENzuvFe+HgutuvXwZCiD6j6Si4
         8NMvj8jEpSajShHAY61thbAcOpiAGvuLE78GX0ptWtICWWikQ7O+QyTe8vCqlHLWvLoJ
         YzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774784665; x=1775389465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Csdueb260dLL4KAw0AfvdDf024yqqfeIAyjh7nn3RU=;
        b=dw5u7dt3enMNSYUP/mafX5CRiDwa/VSsMBoHILP0prEIsQHNMOFuE8wPSsCo9lAnu2
         g+GpJ34HubGGVqQ/U4SRb7q0gzbW7RKNcut7lZu2nVFL4MGH0aAZFO2X0Jkl8UIt/Nin
         tGdkQJLdmK7I5Q33SVl3r4Jye41m0uoyL0l2Ry7SQTeuGJI0mCRn3arg/AXnx4Yvx6gw
         y8ehITiEP/qWGSkfbLlYmCZYwSgCDgnxA9YZQ8ybXEYr11goBE41qJaRXNTynJ0kgzTd
         zHOH0e2H+XBIvFJ64sXQrrXsFRGObDEUmvcE5rjv8IaBw4xqGLUZPyXpXS6fuyfa1VuC
         tO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXSJuY1WaiYOP5/yhyFS2Aydw+GVh5EPhxeIEPIjBD0iha60/8BqO0zXdtfYPBIRPmFnmm@lists.linux.dev
X-Gm-Message-State: AOJu0YyWwoFAk0ek785Lh4TCvLeXxJrlmVBNWY2tfnPu763BvqrhzS9z
	Q2rWhVdfnvdjiu4JBdrTJ3uLfMvNQwGlv0J4y87kRFTkzFrFP+2VnW8e
X-Gm-Gg: ATEYQzxGmi6rkZy/2Z+HpEJxX0c7X6BxDmuEZ1mTDHqJKOF9j8ZEODhCGWU5cv172H+
	HZXqelRcajGs//zpn21ueFr9Qeb07OPutFKiYE+Go6T4QcscoJxZWZQO9FFlDHM7yAJ/7UUjkI3
	CXTWRE5xDttKzpQ5td3HXG8DuXjy4PAK9QoNPAz9BQjSJGg5NXQktmV23WvVP+IlIeR1j+wxSbr
	g1Bxwu0+NoRGFz1U+MELIX1s1h0pdwxWd2rSZZJk+jvOM/asvwpWdlfO6GIei845Vzyz9PAHtmq
	OiihBI8e/1na8n2Ez8uIE86u3gckBc7CIWSaUMS1o7W6Jn9xvZnZB+84rPJ32E7O/RpN5NiRBxw
	uh8kUtSG+RQyGNjrH5NHjcrH5ugKm1zFNM47EYrXBmrRPykk4hK85WQJwMTzq8+B/XBbTc7JfqM
	ZN9ZOZ2Us5t29IWm2rLTAO8UnWlLaioT5GRVV6t4OBN6qXd/cDAdIIWIv4kpXlZcAGru0U+VS5l
	lZ2zg==
X-Received: by 2002:a17:90b:1e51:b0:35b:e4f8:7b3c with SMTP id 98e67ed59e1d1-35c2fffe870mr8867503a91.11.1774784664489;
        Sun, 29 Mar 2026 04:44:24 -0700 (PDT)
Received: from localhost.localdomain ([188.253.126.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2d7df071sm3174591a91.0.2026.03.29.04.44.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 29 Mar 2026 04:44:23 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	bhe@redhat.com,
	chrisl@kernel.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	nphamcs@gmail.com,
	oe-kbuild-all@lists.linux.dev,
	shikemeng@huaweicloud.com,
	youngjun.park@lge.com
Subject: Re: [PATCH v2 2/3] mm/swap: use swap_ops to register swap device's methods
Date: Sun, 29 Mar 2026 19:44:18 +0800
Message-Id: <20260329114418.39732-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <202603291844.TWh2Ellp-lkp@intel.com>
References: <202603291844.TWh2Ellp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, Mar 29, 2026 at 6:49 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Barry,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-swap-rename-mm-page_io-c-to-mm-swap_io-c/20260328-170852
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260328075812.11060-3-21cnbao%40gmail.com
> patch subject: [PATCH v2 2/3] mm/swap: use swap_ops to register swap device's methods
> config: arm-randconfig-001-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291844.TWh2Ellp-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291844.TWh2Ellp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603291844.TWh2Ellp-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/zswap.c:1057:19: error: use of undeclared identifier 'sis'; did you mean 'si'?
>     1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
>          |                          ^~~
>          |                          si
>    include/linux/mmdebug.h:133:52: note: expanded from macro 'VM_WARN_ON_ONCE'
>      133 | #define VM_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)
>          |                                                    ^~~~
>    include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
>       30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
>          |                                                               ^
>    mm/zswap.c:995:27: note: 'si' declared here
>      995 |         struct swap_info_struct *si;
>          |                                  ^
>    mm/zswap.c:1057:32: error: use of undeclared identifier 'sis'; did you mean 'si'?
>     1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
>          |                                       ^~~
>          |                                       si

Deeply sorry for the last-minute edit—I fat-fingered it.
It should be si, not sis. My sincere apologies.

diff --git a/mm/zswap.c b/mm/zswap.c
index 9bacb1733e1c..b60821758169 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1054,7 +1054,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	folio_set_reclaim(folio);
 
 	/* start writeback */
-	VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
+	VM_WARN_ON_ONCE(!si->ops || !si->ops->write_folio);
 	si->ops->write_folio(si, folio, NULL);
 
 out:
-- 
Best Regards
Barry
