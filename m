Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10F1DE4D4
	for <llvm@lists.linux.dev>; Tue, 28 Jan 2025 21:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738100230; cv=none; b=qXcooNTll1EE73qmUQ9EQ/YWqzGzrN2uWWNwNUQEHEU8n3v2Pt8+Ou1N2lCW+BZuQSX4uvJmTIpN7FJcSXBH2Ug5qj/AjfOXf3zfnYU3y1TEIkSj8eVMbbRtAn1WkYT4BI8RY9XdToQiSlF0isK1UqVg5drxc8NQ2s42KjGonKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738100230; c=relaxed/simple;
	bh=t9v9MrLhQXftvOBAs3wP1knReZZnZ9nfwNfQRZ1P9gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mch8fXqZgxtfY/t2L5L4jwGkR92sH4Tt46LmnyorribyNpayu6ZjoQZ27sdQjJTRU3ldlkPUq4KZR4mxfZHhlA8Ti+vfFl7iHjH/nl5jRYipDC6vK3qdEnEWw+RkCMoCC2yW7Q9FIomeT5Sxnrfui0DK+jf5s3BqUZfx+bb9v5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=SudOELqd; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="SudOELqd"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YjJXF6hSHzlgMVb;
	Tue, 28 Jan 2025 21:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738100209; x=1740692210; bh=Cb5Ew8HL0XbNt41H04ArOXHw
	yWZezSxHGJd8TBs12Mc=; b=SudOELqdAsDAwxiDHH88IhEj4iUAUENck+4gPD1X
	DsG+RA/BJUxugXyCCU+v807ObSJ6sx3RiofdFU5N1fuQOePR8ZXJKRqSQyr2+3sZ
	7vs1CKCm6mBYNvIZ2dc6BiMs/3vZgf16KaDQAbeBhHUIjb2bCMQsjV3TQDknKbHc
	GJuaOpeLSar87LvVoGaop2piTmvCK2u1qOYzeLElqnRQU0cQqt9ZbbrtPEy4oEPM
	3dENFyroJTKifkQeHRHRjZW+B2ezgGR7wOKLOrz0EN8TmgaaRMACS8ghD2DZbz3R
	ZpcFmnE6VwtRaXOEBcR82FGiqH1U6EbLiWKHxaZ5ANEviQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id FFA6bTQLJjIv; Tue, 28 Jan 2025 21:36:49 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YjJWt19GBzlgMVQ;
	Tue, 28 Jan 2025 21:36:41 +0000 (UTC)
Message-ID: <6a45a521-71a3-4087-9320-b8aeecea205a@acm.org>
Date: Tue, 28 Jan 2025 13:36:39 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmstat: Fix a W=1 clang compiler warning
To: Ivan Shapovalov <intelfx@intelfx.name>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Rientjes <rientjes@google.com>, David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Joel Granados <joel.granados@kernel.org>,
 Sourav Panda <souravpanda@google.com>, Kaiyang Zhao <kaiyang2@cs.cmu.edu>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241212182425.ad1f7894cd0f00b2e34bbaed@linux-foundation.org>
 <20250122015818.3308696-1-intelfx@intelfx.name>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122015818.3308696-1-intelfx@intelfx.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/25 5:57 PM, Ivan Shapovalov wrote:
>> Spose so.  One always suspects that adding a typecast is a sign that we
>> screwed things up somehow.  The relationship between enums lru_list and
>> node_stat_item is foggy, and I'm unsure whether this is the place to
>> make the transition it.  Perhaps lru_list_name() should take an
>> `unsigned int' arg instead.
> 
> All of these *_name() functions do seem to expect arguments in range of
> the corresponding enums, so perhaps keep those args typed as a form of
> self-documenting code, and do this instead?

If nobody objects I will submit this patch for review after the merge
window has closed:

Subject: [PATCH] mm/vmstat: Fix W=1 clang compiler warnings

Commit 30c2de0a267c ("mm/vmstat: fix a W=1 clang compiler warning")
suppresses some but not all compiler warnings that are reported by clang
when building with W=1 about NR_LRU_BASE and NR_ZONE_LRU_BASE. Hence
revert commit 30c2de0a267c and instead make NR_LRU_BASE and
NR_ZONE_LRU_BASE integer constants instead of enumeration constants.

Cc: Ivan Shapovalov <intelfx@intelfx.name>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
  include/linux/mmzone.h | 22 +++++++++++++++++++---
  include/linux/vmstat.h |  9 +++++++--
  2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9540b41894da..92ed919ea99d 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -135,10 +135,19 @@ enum numa_stat_item {
  #define NR_VM_NUMA_EVENT_ITEMS 0
  #endif

+/*
+ * NR_ZONE_LRU_BASE and NR_VM_ZONE_STAT_ITEMS are often added to 
enumeration
+ * constants of another type than enum_zone_stat_item. Define these 
constants
+ * as an integer instead of enum node_stat_item to prevent that the 
compiler
+ * warns about enumeration type mismatches when these constants are used.
+ */
+#define NR_ZONE_LRU_BASE	(1 * __NR_ZONE_LRU_BASE)
+#define NR_VM_ZONE_STAT_ITEMS	(1 * __NR_VM_ZONE_STAT_ITEMS)
+
  enum zone_stat_item {
  	/* First 128 byte cacheline (assuming 64 bit words) */
  	NR_FREE_PAGES,
-	NR_ZONE_LRU_BASE, /* Used only for compaction and reclaim retry */
+	__NR_ZONE_LRU_BASE, /* Used only for compaction and reclaim retry */
  	NR_ZONE_INACTIVE_ANON = NR_ZONE_LRU_BASE,
  	NR_ZONE_ACTIVE_ANON,
  	NR_ZONE_INACTIVE_FILE,
@@ -155,10 +164,17 @@ enum zone_stat_item {
  #ifdef CONFIG_UNACCEPTED_MEMORY
  	NR_UNACCEPTED,
  #endif
-	NR_VM_ZONE_STAT_ITEMS };
+	__NR_VM_ZONE_STAT_ITEMS };
+
+/*
+ * enum lru_list constants are often added to NR_LRU_BASE. Define 
NR_LRU_BASE
+ * as an integer instead of enum node_stat_item to prevent that the 
compiler
+ * warns about enumeration type mismatches.
+ */
+#define NR_LRU_BASE (1 * __NR_LRU_BASE)

  enum node_stat_item {
-	NR_LRU_BASE,
+	__NR_LRU_BASE,
  	NR_INACTIVE_ANON = NR_LRU_BASE, /* must match order of LRU_[IN]ACTIVE */
  	NR_ACTIVE_ANON,		/*  "     "     "   "       "         */
  	NR_INACTIVE_FILE,	/*  "     "     "   "       "         */
diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index 9f3a04345b86..eb115b9a50f4 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -135,8 +135,13 @@ static inline void vm_events_fold_cpu(int cpu)
  #define count_vm_vma_lock_event(x) do {} while (0)
  #endif

+/*
+ * item##_NORMAL has type enum vm_event_item while ZONE_NORMAL and zid have
+ * type enum zone_type. Suppress compiler warnings about mixing different
+ * enumeration types by converting item##_NORMAL into an int with '1 *'.
+ */
  #define __count_zid_vm_events(item, zid, delta) \
-	__count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
+	__count_vm_events(1 * item##_NORMAL - ZONE_NORMAL + zid, delta)

  /*
   * Zone and node-based page accounting with per cpu differentials.
@@ -515,7 +520,7 @@ static inline const char *node_stat_name(enum 
node_stat_item item)

  static inline const char *lru_list_name(enum lru_list lru)
  {
-	return node_stat_name(NR_LRU_BASE + (enum node_stat_item)lru) + 3; // 
skip "nr_"
+	return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
  }

  #if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)

