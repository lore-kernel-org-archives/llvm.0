Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B23396E4
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856092; cv=none; b=ezJ1mtXvmo3pU46q47mqgbDQ3+sF2WbsiSDdq1ZIK0BUEHs2qIaKso2SDiOJct+go8B91boe0KUAckqhPTLPQWQ/+tTXkvulVQxgRUdRAt+FnBS85SLjNtd3XR+79IswLP4KZLgtJGfZ/lfckAYbXkSpQpjmiKabYikYIe4DaGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856092; c=relaxed/simple;
	bh=QCoNa0bAFU4qkhO5GhIkfapiatY4Py/cCoDedmB34wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAX/b/a+DPucawNLEc48n6VmiU8MgRfnQrn62ojzCICNdzLeWFTRnkA9uU6tySBLDZ7p/E+ngn6MICQq6nktXbw1pnhFN/sfPQYOU9nFiADJUb3gX+c7EvD8brkgdZe2WVHNaqwKVoeZCNyd7WTZRX0whj4apMXQVfDmftpTrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2fDgGGrY; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2fDgGGrY"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3437af844afso2516842a91.0
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762856090; x=1763460890; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QCoNa0bAFU4qkhO5GhIkfapiatY4Py/cCoDedmB34wk=;
        b=2fDgGGrY6H7Z48/v/sbgr1rDZskF6CBiCoifqpODYMaIhfUJZfmZkgGqIJI1sH+WRF
         rh5f0YQ7klGIKDejy+jaPl8S+7lUgIXMVSbh1yidbtm6XeSMYbV1LHrMHc6HxrS+bMAF
         p6NaZryqF5x8NFFOk5kPkT1gv6Wq9Fmw90Rp3CzQTK5zszPPwQCLgCWT3pjkZt0pXDib
         W7380JzqIPAKwdd1XCjZMmlDsHUI2qyD+QIH6e4uJd460TLny2Y/MwbK7I/6EGjw8zVM
         SgoFCNe2PMHM+ZabjOyq1fNKmPza8qii0TR8corYHA3bAgPqzoi+R71qYFWXcpQ7uFX6
         83Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856090; x=1763460890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCoNa0bAFU4qkhO5GhIkfapiatY4Py/cCoDedmB34wk=;
        b=EhoQy+OZh67JjtkoC9R5Fl5yUpYvZHmIMJnF2anaL6S3Sb1eZjRNoD3rVEepS0Ext/
         UQD/tvl02PzcAJIfBeWxbXHu1JTh2kjuMWa9mcluxutXsyQOoBnMdkGg3fouiz/NgIFj
         ASX2nvaGREiueU46ihJd1whgVGALAHdOeHUP25qxAQASjGqLMTQgpGr3Ay3BDvZhiErJ
         Za/xfGlxobHSAqWGPq0htUN4LpkRJqboWhMW+2Zr+FM2CZ4SN5gqlPuYx87gO2e7HCkG
         lrYLW/6I8ivS/Jnt/MGK+Gz9y+al9Yv4nJGJiH8d712HJCc6LD1QfA3IR1egGiyvLwSf
         jHwA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Ip3c3c6hc/DRgD6eZo7lLj532/EEh5PQitEjwW2IGesUEjkiPn7Tn5Ocrg8gbr8+2bYi@lists.linux.dev
X-Gm-Message-State: AOJu0YyHZuunvFuivEPp65+oGPezXUsUMpQZ111xmv6swjHoUbB0Cpfc
	oU0JoH3sIkG9VbtOtbpuQFitwzf4c7LaQ5PhCJiNbX8LqegX7zCMkOwd4uMX4dePjOdAQUhvlVW
	4GRIhFuVy9i7keV8FMZxzh8ZjC+wfKLqgGzv1aQV/
X-Gm-Gg: ASbGncumJCQyldBCPsgX3bVxfBuIZ8vDKXfLVIBObg80zSDb4xrFq5Boug9+600nkvk
	e+hdHJeBgpzna4CuJl/SWQYItE+Rf+D1uJXIivXO2xbXgL94XFac27w205eegfg9Dhra8U+z2/F
	9pE1Y+AK+AOzh3pERwMhjz83Vgz5Sc05S2i1S8PNKos7sUluqFZTsVUZ7HPbQ7vSLYyXD6nUy3z
	dbBsE9Xz6PHxTNwapKOh9/I1zhVxKYXzbhh1/3+vaCmUQu2FKYwKBgS6uS4z7NF6pdL+/Eg8UW4
	syezc63P/6HWJa7mO43aGTa7XWekRoRCO8fo
X-Google-Smtp-Source: AGHT+IFQSxMJjSbUGKNKNlHPOvAOCrOFIwylDJVM9WLCE9houa0HQsWEPCsgreAvWbtMbfV9H0B8kgzaUxxNh9fow8M=
X-Received: by 2002:a17:90b:1f87:b0:340:bb64:c5e with SMTP id
 98e67ed59e1d1-3436cb89ac3mr14436274a91.14.1762856089911; Tue, 11 Nov 2025
 02:14:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8b0daaf83752528418bf2dd8d08906c37fa31f69.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <8b0daaf83752528418bf2dd8d08906c37fa31f69.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 11:14:12 +0100
X-Gm-Features: AWmQ_bk1ReQnmXZU019ENpKczYWPK1RduG0S2XHhWai-9JyZu-To_X33SgyNVa8
Message-ID: <CAG_fn=UzrdF4v_0iK5b+DHDhFG5pD-W4cac62YYK5x2hgPx9yA@mail.gmail.com>
Subject: Re: [PATCH v6 15/18] x86/kasan: Handle UD1 for inline KASAN reports
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

> +++ b/arch/x86/mm/kasan_inline.c

The name kasan_inline.c is confusing: a reader may imply that this
file is used for CONFIG_KASAN_INLINE, or that it contains inline
functions, while neither is true.
I suggest renaming it into something like kasan_sw_tags.c
