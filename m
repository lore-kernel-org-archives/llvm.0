Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CF62D9EDD
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796322; cv=none; b=Os0KccIw51uFhgSylGF3FvGh5ZzBypxc4Qno29kh/wcur2aa763ne2avXCVm0R5EiFREYqaz5fRw0EwfRamVRO7VwYu6VNOFmhhnYZCvturYhSkVD+7zQYL5xwb6a0qnb9A1ycIwKB0PiCTwf0B3nrKodgfetAT8PYjCe04nnZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796322; c=relaxed/simple;
	bh=M1o1kOh6VqP4CN6/zqp8bynioGZKC94OCphZddFeq6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqh9jQschguKY1JmFa1Bu8y+IgRAY0GmeuE2lIQS+m12+iRObT62UcHhKAcNoPxIcJJFaoUejXziC8EDvJiDhzYUH/4rQgA75OiC/eOmPU5qTQX/tdwPuUTGvhAhFky0kcjEG3j3d6aePVeK+KBWcaP4GAO3+K1GASN6KKy4VDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E3VocqBC; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E3VocqBC"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4edacc41dc5so14290151cf.0
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 09:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762796317; x=1763401117; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YSOpGWJwXMs0s/g4qCwlIsfD5sl3RCmHWkcwp+GKrsA=;
        b=E3VocqBCZuHo5V/OmG4N0iQBO8+SLIVDZEOcT/0YZc4dcVT96PPnAXG+JOwk8G2Xky
         FQ9CVI1BtIHTu2LCs+is4dkMlrRgMI6RclwVJAv64BdsIRj53AOdY7DycbxJrOBms0xI
         j5D2TPHvxlYVNzcbczeFASLnRnoIm6kYrMT/HLtTNrH76iBTB1TxOCYY6wAF72THORTl
         OtDfKrpcTm3sJnGVDEucuS1g8IaROn5yKIdotQbwYCS6TFEBIZtqYa+02TAGR0uS0ff1
         4ahx7OFsRaX8V9Yfq3js1cWplOJsz4HfYJrGY/sqnObh8bOTU9SRTRAOniPznL9FAv5f
         4Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796317; x=1763401117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSOpGWJwXMs0s/g4qCwlIsfD5sl3RCmHWkcwp+GKrsA=;
        b=ekhEJxYhjjGfdLCNOR9bwwfj6lDUh9fFUQW/tng7QZ/BMlZG9/4zohJprcnAZiMmUv
         PVz0JzXjkC0XFO7WBtCx6aIUcfX9d/mA2BWHYfOiClhh0NCjLtcE6ofaNLV+sVpUpj5I
         NktBuZHgk6IswffD0RtpAav13o7vYM0yLjj/e7UWHjcHDzE58knGKlnHHqkPnPl04j8N
         BvkzwkOdaXYiFt8N6HDOCnUDYE2zTb/cwIYFKH9qZ5E6VS3NCoZO7MBp6KMPdLlrZqGN
         R4Mj33+BtOX+6b4ULDtuNFsr1meYAZHqb73XX7K8sEVOhi62uRq5GroO6Lzh2AKbrl3c
         ZPng==
X-Forwarded-Encrypted: i=1; AJvYcCUhya8JE6zNqgFpERkB9CeFc5Y4Gl9m7GJsEF2PjmaK6v5DG/9ofY0kwY/9qilC4rA0N+hK@lists.linux.dev
X-Gm-Message-State: AOJu0YxtsBGKDf/sU9wEE/wpH5AA4VLsV6yQ8Fg38HGg5HfUXBzM6GVT
	rRTCzFydCaEYggCBtBwv23NNcQJsIyQWZajah2brh4fJHrdrT62pQlaal2OAATNZjP1a6xbdimA
	hxzQJtb+3cGxM367qJVstzETAAPNCu/uIR1Zrvhwb
X-Gm-Gg: ASbGncs4H0mH5+cVnZBua1m9RjsXY8sqb0Z1mfrsO5fmk+6JNyO1TIcOi1Z2baTAtDJ
	aRrcmV2hku9+kRDEwQHvfxfgCXq+o8A8C3zg6q+2NkCfBx2z53+MgcNKSEvtgflCyb1hPghgie8
	gtDdZhsH4hqFQEAQQ857v4gt4dPimTz2lomhYCYQ3PtSUBvG9WoOVQzgP2eeM8J4gP+/eKZuMXm
	cBPQh2CJhL+dyuPOICuUFxVM80MZGrTUBM/BVE6Etn2JlzAIyBN30rJddCiTYn2663BD8TaoG3i
	73+uRxxXrxYQcuHOWWrN3gZ7/A==
X-Google-Smtp-Source: AGHT+IFr1gTkxV/2KbejHCAfn9cmRrtPm5R67TTLAIre2TRAH5dAXb9YnE16dsLdFYHK6GdY4jiLnljrS99RBkOdtpA=
X-Received: by 2002:ac8:5856:0:b0:4e8:baad:9875 with SMTP id
 d75a77b69052e-4eda4e70d87mr109099991cf.4.1762796316364; Mon, 10 Nov 2025
 09:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8319582016f3e433bf7cd1c88ce7858c4a3c60fa.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <8319582016f3e433bf7cd1c88ce7858c4a3c60fa.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 10 Nov 2025 18:37:59 +0100
X-Gm-Features: AWmQ_bnlgBiH0JekOxzwX-3tPMF5D_wHyW4PzCjMfs9TphH4P9izG_-i06SXddA
Message-ID: <CAG_fn=VUx7GkcjuYO3oRH7ptgKVtzQNChW1xKL+1SPfJ=XvWwQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/18] kasan: sw_tags: Support tag widths less than 8 bits
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +++ b/include/linux/kasan-tags.h
> @@ -2,13 +2,16 @@
>  #ifndef _LINUX_KASAN_TAGS_H
>  #define _LINUX_KASAN_TAGS_H
>
> +#include <asm/kasan.h>

In Patch 07, this is changed to `#include <asm/kasan-tags.h>` what is
the point of doing that?
Wouldn't it be better to move the addition of kasan-tags.h for
different arches to this patch from Patch 07?
