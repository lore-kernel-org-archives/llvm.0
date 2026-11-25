Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795647527;
	b=qKWWQsdR665jFd/5A59MyI1/zVhYJXZ8Y1w1AClHPUjmdO0BixFzOess8buIGV9WfbZB
	 vszZswfvXwkJx6CpGSIHvk0XQFEhIkT/isu4B/Znlj3zOQ4CWG65Zy7xKiDEmFbxpLxQ+
	 88HxnR9bl24jYAY5wOY4aRtbQ0I5xwfQb5d6BW1kjDmrx/zsZxAGjxCp4e3ya/9ldIp75
	 KLvYY1tgLgbfKvIpNzMEYGxofTG1NBj/H8YZDkq1R/55+3+HxIaEVhCmbiW0LDcbPrJdg
	 bPkBHM/8ojjAl9XRMgXSvgHqXgI87eiZBlBimiszO100roWFT7F5U3bSQG0m3D1SuFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bifZaCO4TaTv8tA7DvDvwVwTAzZVHPafBMZMdjCezBc=;
	b=NM3aWvp691uRNR/YI24nXzuZqqehc2jYHHX56skTCuWXLI0MbdKavrbcBzg0RgiVnX+N
	 iROTYQE9YXwf4N1Zk/sFeHPlBizX27xby/hJ+5f3UFjJv7zqPJdL0XvUSqKQg2pSiC12u
	 2GYeA8iO53bzYT595O+gyRspRieBkOaO0hZWuMB8MMfO6oE7l7063gqnt7qs+rRyWYGVJ
	 e2e+/WKOecnVHvDUJckHsqQltQbUY22akCoSXnGjLNAlvX9hBC3hyGrZewy/nM0AHvFGD
	 lSxzOEuGTwtvwk37LDp/yr/ewQfPhfiOxxuGo5Lx0V1OsJf+YuRq7s1Lg5tWy5CM9Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZSsM3faI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462FB606A33A
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 462FB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZSsM3faI
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so1787908241.2
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:58:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795647526; cv=none;
        d=google.com; s=arc-20260327;
        b=GvJ4E1U/FNYUnWYt0Ct5h6pouvkNZOf5lST3LKWrGMZepRxa+SglGnx6JW+AyLnSE6
         SnwgKWP3UVACSXcRUsFoWyOmztoSEujIyLqFEv59h1Y9d651y3Shi1Cln0LZ4xEsnidV
         0uMnJNFGbrBdgGezS0LVidYej9TH70vcApcV0EkgKajBK8srF3+F6mK6M6iJR1zhLGdg
         4HVa+MkPC9M4NzHzKJaqjTHou15nN1Ia+zgl7XM73eK9oHKCcdGKyHQSrHMAqIGQ0Oj8
         2PfN3XCEpH+JRWF8QR/4TxirFb3jrWMai9yfsSfCcIq0R9RHUAHKIxD3BxQTLLioQIu2
         o9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bifZaCO4TaTv8tA7DvDvwVwTAzZVHPafBMZMdjCezBc=;
        fh=7RzWYcCsR5ESRUUoFOsNnmJoTwWx84lY1egLhTyS3aM=;
        b=XZi8JiC9vwocfeWgwLZ8ADUldUu3DoBj+bYHhdNOMovm1g/l/gfJ6vSDuZC+44CJAC
         c9oc9xm/sdwQcN2SlWQsJMTt4FR3Q9rBORxmamVTePJ9UgTUPGqmmxX3R/tvBUXzXqsA
         nzvzXnbgfUiTbMcrg2cc7bYAuIePOUctzoIbavzqhNvwSamd2IJVDiya1JSBapZ12I9y
         RlquDPKOWSoWeEH0uAPDcw2NWVDMA4n8KsqvQVWITmjxtCYWf4+qNkkoYvpQ2sFSza+y
         dXcXhKC73jo5+8vig9ziYasctwDXtOb5I4t7fAfcs4naDh/jTOqWz3Ne+lsa9Qm5b/+a
         JWhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795647526; x=1796252326; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bifZaCO4TaTv8tA7DvDvwVwTAzZVHPafBMZMdjCezBc=;
        b=ZSsM3faI2X3+B67vQQg2B/6FBjCjbqAJc4wZXVT3nLlXFGnE+waxhwKI1VwcfivlDk
         sIPKBw+lCqGVnDV8P3H7ec/M5Hk+8TsLCRtGHuYjCQO8cQzJ0ai83O1wZdJs/y6IqxLB
         vBOClrr5g6F2IwmL/qSQSKIbx+klCs3SMxxouFDKOEG3TfcIHBtDH1o4SWATDrYq5ObX
         CbBmDfHPCtcvsqEgwvfeCZCVQCEQ0HIr/1hKNscK9AsJSv9o72xuRBdxjn3rwYvYXzsh
         2PdEd5TTDcegw1vUFwZ0PJ5BfgfEn1Iwh/tuNpfvRNexErx0vjDXvA1lM4JeMKkMYT8F
         GoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647526; x=1796252326;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bifZaCO4TaTv8tA7DvDvwVwTAzZVHPafBMZMdjCezBc=;
        b=C9QPCZV/xm9OpjwA9hfTjIDg0DuuMQSkIuH8JeSOjdezuKahNuIOZq9I/PfAKFjqY5
         BwPkIEq4jEqXe/o+rs1lsOyE0yEZfBYJ+u8N1pdCyXCJMaU1yPe2pdkn9WVqLWOIPRYI
         1EWygsTHu0FKIhw/qYAXH1hoi7htXQIuKua9TYIimIPOExCdGv6kUq4zAzVbXSnTuQPH
         EfEodwHKQQB9HPKe6iRBXz7EMnW+m8TwE932V3ddDvxYDGryh14UhvRV5xUYrPA9621N
         WNUg9CkK/zj9Xjg1gHa1y6X1N/tEHawzphlIVzs75v0QGMRZ7e+w8zMj8H3zDwpywUxd
         Xn/A==
X-Forwarded-Encrypted: i=1; AL+hErF3rjn7sVISu6IursziLokG+U4t9QTUuIVRgh4yv6l86Kzdqlgpw/l9oBkcvrzwx941v2fE@lists.linux.dev
X-Gm-Message-State: APuU4Z8AAuy8cVvZKWvB9NtiDHAaj6maNtH/4DKkbIMSqaps0XOYFFqD
	DnkGgF0lPy8RD9xB4kVMdgZhdQEreQlH+mr+kx4gZ7LUtmYtoe+hPMIYb7viPGgRCumqcQn3WMG
	a8E+svFjCfxTAKje/N0Wc0Ke0LXK1MfCJDopioHqj
X-Gm-Gg: AZFdTZdxGTKE9Vpltun6LFeTxZ1VPTMPO6u+WX4cDhgSW7QUsVihf8osUxPMPAqYih8
	m0GOQbbElDOz4UQ6bL0P8U4XHTdkbdc8O/qS2jhDrYQWqdXkdqd+4wQ9J6egJVe4rW6g/pcVIqE
	gjz34MOVcwg4Fjf0KJ9kXvaB3s90ZuFTFo88BnsVB/gI9sPqcNaDWxlsM7PhMW6rQQLgkndzLJ7
	UVuUBTzNXK3KrALsZhHhDZ3oJ+ATcdHHUGMCEE8nZZ+mv8ggnjbMUgamvKPXSpVaZcsmcfbgFbY
	bMVE6tGi/KaSrhzXUZcYBkjZnD12N47CvhbB6yb/5y1TPuoer9f1XuC+kQSPRZ0/SabNdky69is
	jeBhRXa/CIHhpDGD+mSJtqUk7PnKNYDywrp8qbZZG637n6JtBNQjjK2/hMPArdJA0+cM=
X-Received: by 2002:a05:6102:c4b:b0:7cc:174b:f7bc with SMTP id
 ada2fe7eead31-7d7397267a8mr10844584137.15.1795647525632; Wed, 25 Nov 2026
 14:58:45 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125222713.1450385-1-elkin@google.com> <16ad231f-0cba-40a0-992a-a0d430da5a91@kernel.org>
In-Reply-To: <16ad231f-0cba-40a0-992a-a0d430da5a91@kernel.org>
From: Elkin Cruz <elkin@google.com>
Date: Wed, 25 Nov 2026 14:58:34 -0800
X-Gm-Features: Aa3M54rX82vBgzUZ__ab0jzhalBL3zfUm3mwj2OyMozxs06Jy0Mm2mHqwLtG9LM
Message-ID: <CAC_6YktiaVRXr3jbfx1ybhhxzHbO4NyMnseg9CLL5CNJgYbCvw@mail.gmail.com>
Subject: Re: [PATCH] mm/migrate_device: use locked folio in migrate_device_{range,pfns}()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Before you send any more: if you cannot reproduce it in the tree, don't report it.

As with the previous report, this one is just a hardening patch on a
theoretical case.

Please ignore this patch.

Thanks again for the feedback!!
Elkin
