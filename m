Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D549B2580D7
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740748649; cv=none; b=bAvhtGNqAbFO34fin1Xyeh9MwGkh6BwvFHrYvvkXHLfXlV7mbWoYuAcRgdraoDMNVisd9yW3zQ4BBg3mCxeYI1ymgdh7F4JX4T3321ZAFx1LRNxQ2byl/F0xL0Ybya6JfsHFBIiJxrily7wBB542o8qD+ErIZDgE5/HLjqF1THY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740748649; c=relaxed/simple;
	bh=FnWMUMRd1j/WIgF5Sya5jfPGbZ+Bui/KueDqXK90L6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1T0AOfRYT4O/vu+ne5UVTBEhENaGib1G3hJhG5WqzfJig2AMkJbvoB1n7q02l9bL7VJ+e2++pPgmeZgpCfU0+Hpc2HPyTinQos8D8Gu/sGgetW4qN4hEvW0dKasScn+ieNA0gMsaFHfFCttlGZ1vgUDs8n/ZYs5n+F/9LPXykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WcqjftSW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WcqjftSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740748646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Pcj9YZyTthhNcyNh2iFg3oYV0P64Hw9k/1hiz0DuFGo=;
	b=WcqjftSWJAi9Go+Kx0a7meIer4iKpT1zkWD6vmLDyNMrIhqJ81UHPsv4z51HaAfFrQEY3k
	YCufeC36ePlJufaWvm8Mmxh5JQ7khGBrgraHbGO2PsdrdOyUmwB+uXu55+kUocJrtTQoG+
	Y6Ix1md/DIPIPcxgze23PvRMOu6nXj0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-QDEblVa3OZaiTN0SvbkEWQ-1; Fri, 28 Feb 2025 08:17:23 -0500
X-MC-Unique: QDEblVa3OZaiTN0SvbkEWQ-1
X-Mimecast-MFC-AGG-ID: QDEblVa3OZaiTN0SvbkEWQ_1740748642
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-390d73c20b6so1311849f8f.2
        for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 05:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740748642; x=1741353442;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pcj9YZyTthhNcyNh2iFg3oYV0P64Hw9k/1hiz0DuFGo=;
        b=aVrDwzcmz/IMxzR4t0B4vxwQ1BlwS5DGSBfPaCeEYW8D1JIBgpphTfnQIfzgMofe77
         z6xIzFTiUkDhvnxqdl1DyRE7zRoqUjblEZeG8FYollulTQbyI6sVrB6qzu2C/+fQgPtq
         GswrHkGyYp+kTS6JKtO5XJGXCA+oreh74TxRQITkRGs8ByNRR4ClqCKLL2GevGBQIyBq
         4yyi4k/gClnZpwKOLMGirjz7beGbBzZYex15p9Mr8Kgnq5aNuwzl6epC2WA7P1FJpBbF
         lp/QSeRnTgVBQ3n7svQ7v7LCiAY+L1bxPeLIr1JL05VGce6IUZu4UkP/m4r0FY6iLvF+
         gzRg==
X-Gm-Message-State: AOJu0YxOMTEqqrSs2IkQf/y5/u+HhFJ0RC4kvSTVwBL6MkMrRchPXNCu
	naSGnOexKfGqKJvaSkf1ZGru81Nb7VXz0oIqUmM9ZdQCKHyXN9F/trvkqeilKQZPrfQLDFvITIR
	DYqDCElRbOYDckI2RGG8/0d/d+vCIXyHXuDBIHbWkGZxmn+DjEQo=
X-Gm-Gg: ASbGncuyJx62PL3l6F1Pz7/nw4PvDyuQHqYml/zIs6xtuJ3H1bZW58eH/cYML2PgJej
	ig8J5o5FxXTUz8muUDh10ztQC1DgUb5jM6Sa727T/opmFOVcYmBHPat/wPBpacgEEux+NyU+sdS
	XF4la0X7RuKG+18Kk/p1QmBwJFyfcaJeHEiJK79vbTz17ohMHb1BE2VAQ5JLGHtb8xYI+MMd44N
	H6uNxfWNshj7czr2HwaWoIEd+hO0xePpmWuust1VW9Vo6dfsnsRIlnM1CIJNHacT7Xp747j0aJn
	uYI8cqxux+6GSvUCkBP0Lgst
X-Received: by 2002:a05:6000:1a8c:b0:390:eebc:6f36 with SMTP id ffacd0b85a97d-390eebc721cmr2273488f8f.55.1740748642114;
        Fri, 28 Feb 2025 05:17:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCXUH3aHxfFWRiiZXNP9P28vy7MBglNNwOEI3WLec3JkqDUkrv3CsJc0fg2Qk9Ob0Psme6uQ==
X-Received: by 2002:a05:6000:1a8c:b0:390:eebc:6f36 with SMTP id ffacd0b85a97d-390eebc721cmr2273463f8f.55.1740748641691;
        Fri, 28 Feb 2025 05:17:21 -0800 (PST)
Received: from ?IPV6:2a02:8070:4688:86a0::a40b? ([2a02:8070:4688:86a0::a40b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47965f3sm5181588f8f.9.2025.02.28.05.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 05:17:21 -0800 (PST)
Message-ID: <58c86080-94a1-449c-8186-eb6478a9653a@redhat.com>
Date: Fri, 28 Feb 2025 14:17:20 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5933/6583] include/linux/page_ext.h:131:20:
 error: call to undeclared function 'page_to_section'; ISO C99 and later do
 not support implicit function declarations
To: Luiz Capitulino <luizcap@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202502261733.Ma0eUGKJ-lkp@intel.com>
 <e5aec89c-a7d5-453a-8883-e3c025db2e5b@app.fastmail.com>
 <8cece92a-6ad0-43fe-9916-eeb850c039e1@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8cece92a-6ad0-43fe-9916-eeb850c039e1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d5xuT2Ldnbk_wI81OVxCZF7otnHEDLAQLPhDTaH0WjQ_1740748642
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.02.25 15:24, Luiz Capitulino wrote:
> On 2025-02-26 09:10, Arnd Bergmann wrote:
>> On Wed, Feb 26, 2025, at 10:46, kernel test robot wrote:
>>> commit: a2d6e9c1a867bb9f13943cb8483e2ab85b630bcd [5933/6583] mm:
>>> page_ext: add an iteration API for page extensions
>>> config: i386-buildonly-randconfig-004-20250226
>>
>>>
>>>      In file included from arch/x86/kernel/asm-offsets.c:14:
>>>      In file included from include/linux/suspend.h:5:
>>>      In file included from include/linux/swap.h:9:
>>>      In file included from include/linux/memcontrol.h:21:
>>>      In file included from include/linux/mm.h:8:
>>>      In file included from include/linux/pgalloc_tag.h:12:
>>>>> include/linux/page_ext.h:131:20: error: call to undeclared function 'page_to_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>        131 |         iter->start_pfn = page_to_pfn(page);
>>>            |                           ^
>>>      include/asm-generic/memory_model.h:64:21: note: expanded from macro
>>> 'page_to_pfn'
>>>         64 | #define page_to_pfn __page_to_pfn
>>
>> I'm getting this on all configurations that set CONFIG_SPARSEMEM
>> but not CONFIG_SPARSEMEM_VMMEMMAP.
> 
> Oh, thanks. I didn't build with CONFIG_SPARSEMEM_VMEMMAP=n.
> 
>> There is also a possible problem with linux/page_ext.h
>> including pgtable.h and mmzone.h, which I think can lead
>> to circular header inclusions with linux/mm.h.
> 
> Thanks, I'll look into this.
> 
> Andrew, I think you'll have to drop this for now. I may not
> have the time to look into this this week.

If we feed lookup_page_ext() the PFN instead, and let the caller
of page_ext_iter_begin() deal with the pfn_to_page(), we should be able to
make it work.

<linux/mmzone.h> still needs to be included, but I assume this should be
fine for now.


 From a526d3819de7e36a45743d447638b7251881e508 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Fri, 28 Feb 2025 14:10:15 +0100
Subject: [PATCH] tmp

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  include/linux/page_ext.h | 20 ++++++++++----------
  mm/page_ext.c            | 14 ++++++--------
  2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 33a118b31a222..0c4ff10969453 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -2,7 +2,6 @@
  #ifndef __LINUX_PAGE_EXT_H
  #define __LINUX_PAGE_EXT_H
  
-#include <linux/pgtable.h>
  #include <linux/types.h>
  #include <linux/mmzone.h>
  #include <linux/stacktrace.h>
@@ -95,7 +94,7 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
  
  extern struct page_ext *page_ext_get(const struct page *page);
  extern void page_ext_put(struct page_ext *page_ext);
-extern struct page_ext *lookup_page_ext(const struct page *page);
+extern struct page_ext *lookup_page_ext(unsigned long pfn);
  
  static inline void *page_ext_data(struct page_ext *page_ext,
  				  struct page_ext_operations *ops)
@@ -119,17 +118,18 @@ struct page_ext_iter {
  /**
   * page_ext_iter_begin() - Prepare for iterating through page extensions.
   * @iter: page extension iterator.
- * @page: The page we're interested in.
+ * @pfn: PFN of the page we're interested in.
   *
   * Must be called with RCU read lock taken.
   *
   * Return: NULL if no page_ext exists for this page.
   */
-static inline struct page_ext *page_ext_iter_begin(struct page_ext_iter *iter, struct page *page)
+static inline struct page_ext *page_ext_iter_begin(struct page_ext_iter *iter,
+		unsigned long pfn)
  {
  	iter->index = 0;
-	iter->start_pfn = page_to_pfn(page);
-	iter->page_ext = lookup_page_ext(page);
+	iter->start_pfn = pfn;
+	iter->page_ext = lookup_page_ext(iter->start_pfn);
  
  	return iter->page_ext;
  }
@@ -155,7 +155,7 @@ static inline struct page_ext *page_ext_iter_next(struct page_ext_iter *iter)
  	if (page_ext_iter_next_fast_possible(pfn))
  		iter->page_ext = page_ext_next(iter->page_ext);
  	else
-		iter->page_ext = lookup_page_ext(pfn_to_page(pfn));
+		iter->page_ext = lookup_page_ext(pfn);
  
  	return iter->page_ext;
  }
@@ -181,9 +181,9 @@ static inline struct page_ext *page_ext_iter_get(const struct page_ext_iter *ite
   *
   * IMPORTANT: must be called with RCU read lock taken.
   */
-#define for_each_page_ext(__page, __pgcount, __page_ext, __iter) \
-	for (__page_ext = page_ext_iter_begin(&__iter, __page);  \
-		__page_ext && __iter.index < __pgcount;          \
+#define for_each_page_ext(__page, __pgcount, __page_ext, __iter)	     \
+	for (__page_ext = page_ext_iter_begin(&__iter, page_to_pfn(__page)); \
+		__page_ext && __iter.index < __pgcount; 		     \
  		__page_ext = page_ext_iter_next(&__iter))
  
  #else /* !CONFIG_PAGE_EXTENSION */
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 23ad30597c05c..19cc0af9c5651 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -165,14 +165,14 @@ void __meminit pgdat_page_ext_init(struct pglist_data *pgdat)
  	pgdat->node_page_ext = NULL;
  }
  
-struct page_ext *lookup_page_ext(const struct page *page)
+struct page_ext *lookup_page_ext(unsigned long pfn)
  {
-	unsigned long pfn = page_to_pfn(page);
+	const int nid = page_to_nid(pfn_to_page(pfn));
  	unsigned long index;
  	struct page_ext *base;
  
  	WARN_ON_ONCE(!rcu_read_lock_held());
-	base = NODE_DATA(page_to_nid(page))->node_page_ext;
+	base = NODE_DATA(nid)->node_page_ext;
  	/*
  	 * The sanity checks the page allocator does upon freeing a
  	 * page can reach here before the page_ext arrays are
@@ -181,8 +181,7 @@ struct page_ext *lookup_page_ext(const struct page *page)
  	 */
  	if (unlikely(!base))
  		return NULL;
-	index = pfn - round_down(node_start_pfn(page_to_nid(page)),
-					MAX_ORDER_NR_PAGES);
+	index = pfn - round_down(node_start_pfn(nid), MAX_ORDER_NR_PAGES);
  	return get_entry(base, index);
  }
  
@@ -245,9 +244,8 @@ static bool page_ext_invalid(struct page_ext *page_ext)
  	return !page_ext || (((unsigned long)page_ext & PAGE_EXT_INVALID) == PAGE_EXT_INVALID);
  }
  
-struct page_ext *lookup_page_ext(const struct page *page)
+struct page_ext *lookup_page_ext(unsigned long pfn)
  {
-	unsigned long pfn = page_to_pfn(page);
  	struct mem_section *section = __pfn_to_section(pfn);
  	struct page_ext *page_ext = READ_ONCE(section->page_ext);
  
@@ -523,7 +521,7 @@ struct page_ext *page_ext_get(const struct page *page)
  	struct page_ext *page_ext;
  
  	rcu_read_lock();
-	page_ext = lookup_page_ext(page);
+	page_ext = lookup_page_ext(page_to_pfn(page));
  	if (!page_ext) {
  		rcu_read_unlock();
  		return NULL;
-- 
2.48.1


-- 
Cheers,

David / dhildenb

