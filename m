Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1866481CE
	for <llvm@lists.linux.dev>; Thu, 29 Feb 2024 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709193387; cv=none; b=hhQ3i8QqQLDkUIhmihsJEDlvMakQlveBZpc6i20zKz89xzmp6thCtJpIN8Fr2XXIsR3JsygO1t7okvIfVAeL7cwV4XiiItwb75knu5DkFmi/nLfzu1ohZroWYrNqlfwzy4GmF7jumy0BcFbG9IZtt3Dpe/dkaGMIlD84N4cP5Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709193387; c=relaxed/simple;
	bh=q5m5axH+BLCl2agZv8n9DXtP46+hpfFVeTafKX3WiDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CWfz9lEZQmg9F5COqQm8HzoaF3DpNapsgOrbpyVX1K+DYf/3NEWTuhskNz2a7y0dPZsmJxjEc6qrKsdBgVY36zDFAzmsIaX++lKb0bv5OHk8tnpTqaOT8J6olwxJsDRgGZB/Lh1DoNOpjL/fqZ7ikSo1XnXSbuhKpLN8TjFwpOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OcNZpG3O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OcNZpG3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709193384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rZYUQ2/MyEIs+wTU4JfVi5JkU9l2GM3/3Nd9NcCBnAo=;
	b=OcNZpG3OqsPzefSEb+z7yVLiWaxHDw4HUkeb04QiETegz7Tlhyw0xJ736Ay30oBZuQ2gpy
	uwLfIUnvV+l1pziHTd3UTUK0HFOV7Hst26lC31qASqJBYt43dn+W8KMrf08DXNm9Xi8VU2
	Xbzt66PwreGN6UgicytwGfp2GSmwhNo=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-jRKidtlHOOK5GhVDkkGUFQ-1; Thu, 29 Feb 2024 02:56:22 -0500
X-MC-Unique: jRKidtlHOOK5GhVDkkGUFQ-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3651eecf80dso1091695ab.1
        for <llvm@lists.linux.dev>; Wed, 28 Feb 2024 23:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709193382; x=1709798182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZYUQ2/MyEIs+wTU4JfVi5JkU9l2GM3/3Nd9NcCBnAo=;
        b=oR2bR7o62YPWbQeQgvtmPboXjmX6Vl69ulELPLDjfq5h1V9NBNJ+D7dPiarJlP/N4x
         jOP5azGYNdUCDEpD4d0TBbQT+VzgtYgY/XHyYCFU5rueBzMN6/vemvhj7VNG1gt7XIMk
         oqBh/35Y36OCJx/YfibZyAXLYdkdkuw1Cmq3cJbJUtceiuRq1fQxf11pfptJN8pT+C6p
         +KrZxmOCapkY++nTDtbOJPsiXgtgMF4T5ZLnXlI01ornYCD6Ga+WwZlIyb4VCG6Ec7Rq
         +4fghJ2gFCWpW2sJ6MBGCSpnGTwouQUw0Pn3wYgTuriReVkfdZkM5l0zcvzukGT/m0D6
         cVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnGxHJ6XX9cyKp3yyYIEvGSv77zuWgcTinLaH7pcU6wRf8XFWDA2kQIg473B0Nbh7oJHWKZaOdsfqttwpGZQbO8alG+w==
X-Gm-Message-State: AOJu0Yyx/vdpvjQQHJqYDwPm6KT16dttcukerLO9dKB8Sm5+P2ipeyMg
	jnZM0H2DcAuAOOocwO/5Mq8Lgm4o5D98qaXYQ2cZEgrVf1MPS1yWRXZHMA2iiiYdnhB01OyRpSO
	3A6xh5QECG2H2pdZFz/XUsL26oVGEq3PW2DnbWtMLiwB/+popCk0=
X-Received: by 2002:a05:6e02:20ee:b0:365:aeb8:26d1 with SMTP id q14-20020a056e0220ee00b00365aeb826d1mr1725570ilv.0.1709193382278;
        Wed, 28 Feb 2024 23:56:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFK2Caj/CnSM8btPacrXhbRxxuWkGYLUk6S0weGtsslNFGdZ2LEbvNGX15pEdr1SssPwwCMDw==
X-Received: by 2002:a05:6e02:20ee:b0:365:aeb8:26d1 with SMTP id q14-20020a056e0220ee00b00365aeb826d1mr1725558ilv.0.1709193381990;
        Wed, 28 Feb 2024 23:56:21 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id ff11-20020a056a002f4b00b006e57b37a932sm664588pfb.9.2024.02.28.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 23:56:21 -0800 (PST)
Date: Thu, 29 Feb 2024 15:56:11 +0800
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Yang Shi <shy828301@gmail.com>,
	Muchun Song <muchun.song@linux.dev>,
	Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 5/5] mm/treewide: Drop pXd_large()
Message-ID: <ZeA4m7DK03oHE1Kz@x1n>
References: <20240228085350.520953-6-peterx@redhat.com>
 <202402291233.CVhChP2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202402291233.CVhChP2c-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Feb 29, 2024 at 01:17:36PM +0800, kernel test robot wrote:
> >> arch/x86/include/asm/pgtable.h:1099:19: error: redefinition of 'pud_leaf'
>     1099 | static inline int pud_leaf(pud_t pud)
>          |                   ^
>    include/asm-generic/pgtable-nopmd.h:34:19: note: previous definition is here
>       34 | static inline int pud_leaf(pud_t pud)           { return 0; }
>          |                   ^

This is CONFIG_PGTABLE_LEVELS=2.  IIUC patch 5 didn't do anything wrong,
but when renaming pud_large() it caused this confliction, while in the past
it was a silent confliction between the old pud_leaf() macro and pud_leaf()
defintion, the macro could have silently overwrote the function.

IIUC such pud_leaf() is not needed as we have a global fallback.  I'll add
a pre-requisite patch to remove such pXd_leaf() definitions.

-- 
Peter Xu

