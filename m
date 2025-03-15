Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB7E18DB2C
	for <llvm@lists.linux.dev>; Sat, 15 Mar 2025 05:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742015945; cv=none; b=Q/L8ift4RCnCJY5h/XviPfTeIuFkJnPmWkMrf8S2IiCy796TBIojLwBvzsoKagq+85AxjLmYLd4KwwA4Hds4kmdBKvFNPDtxCj/KHDutFCB4vtml/rvUInnNp2vDM8P+77BP4ni+aVxQ0wMNa50XqsxArpR8yaU/Sxx5wW5q5N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742015945; c=relaxed/simple;
	bh=gCKOMTSR7SFGeALdClJ4oeqAp32aiNNdltbx70uY+l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=deGusvpQn4+zXi31vwUNTExkadail5rMYgN8tLCOt+CXtqCYltIRkYaZc3AyiGZVMxMZafgnVDtVn/YSTc+JwFu+s6x2TM8mGCLlrcBL+GVHjlW6bECWvbk9NHknaA+eSK8aq2yHGlU8ATftuCSAF575ilZxoSs1K6+uc9XKfGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=Yr4eOeb1; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="Yr4eOeb1"
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id tGmLtFSwPMETltJvFtLAsb; Sat, 15 Mar 2025 05:18:57 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id tJvDt4AO8ecFwtJvEt5q3Q; Sat, 15 Mar 2025 05:18:56 +0000
X-Authority-Analysis: v=2.4 cv=ZsYmKM7G c=1 sm=1 tr=0 ts=67d50dc0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=6Vi/Wpy7sgpXGMLew8oZcg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=7T7KSl7uo7wA:10
 a=ZeKeiZ7te2ZlWvWP_YkA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z9CV7YjZm2q81+e0gd2CqFBpJBtXFWEm4J6h1AlGC2s=; b=Yr4eOeb1ZdZrGAUExLuwFtBdA0
	nLqdok3y8dnsk+9TMsOUiAau/LeIdzsleTe+RsXaC+eKo7WA2vw9O+ZDoCobJc71qNEP3yBDJqSY8
	V33x6N2YcTNMGeKjinas8zekF6sFG+m3BTqfBGYwID5FBalv6TkQt89yt5QjZxYfJvLzeb7cVW6ad
	iDiThwZY6Y4mI/m8APdvW+VOiiQ8w8ndJJqtPNQrZKWVVAZHkKeYbJpAOgmqYWHlwES/MB4nUP7OI
	aXp9T9KRlrJXlq2+RWizYEnzljWrMOMf7yOCuk7ti2bDMNa4xfFfBRwFmlSw3bYfcjxB/e4kNbaZl
	k6L/kZiQ==;
Received: from [45.124.203.140] (port=53524 helo=[192.168.0.160])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1ttJv8-00000003Ac1-2JPJ;
	Sat, 15 Mar 2025 00:18:50 -0500
Message-ID: <17076519-33fd-4fac-a718-784b9597c9e6@embeddedor.com>
Date: Sat, 15 Mar 2025 15:48:30 +1030
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] slab: Introduce kmalloc_obj() and family
To: Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jann Horn <jannh@google.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Marco Elver <elver@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Tony Ambardar <tony.ambardar@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
References: <20250315025852.it.568-kees@kernel.org>
 <20250315031550.473587-2-kees@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20250315031550.473587-2-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 45.124.203.140
X-Source-L: No
X-Exim-ID: 1ttJv8-00000003Ac1-2JPJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.160]) [45.124.203.140]:53524
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDY5l7SVCLuvryFTFtwXOgs7txAC3rn9jy/m1XEGA7zjJvawJkfhI/v6bq9Fi0ZgtxDjhSYWu+ymYW7mLo1rCPN10JE8jpuKcJhC+TeUdTeetEH7CN2E
 ckJpCX8L4UlukkcmsQk2zmnl6rqG6Mth+KhGw8+Setm6FYwdHJ5zm78ZOqTyEOXGqrWuTMKANVj13h8DA47kXHwANQ+Mwae1p24=


> These each return the assigned value of ptr (which may be NULL on
> failure). For cases where the total size of the allocation is needed,
> the kmalloc_obj_sz(), kmalloc_objs_sz(), and kmalloc_flex_sz() family
> of macros can be used. For example:
> 
> 	info->size = struct_size(ptr, flex_member, count);
> 	ptr = kmalloc(info->size, gfp);
> 
> becomes:
> 
> 	kmalloc_flex_sz(ptr, flex_member, count, gfp, &info->size);

I wonder if it'd be better to keep the gfp flags as the last argument
for all these `*_sz()` cases:

	kmalloc_flex_sz(ptr, flex_member, count, &info->size, gpf);

Probably, even for __alloc_objs()

--
Gustavo
