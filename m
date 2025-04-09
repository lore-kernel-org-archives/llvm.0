Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D5B2AE8C
	for <llvm@lists.linux.dev>; Wed,  9 Apr 2025 02:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744165507; cv=none; b=Ht8PPA9FMF7REY6er3VRTULeTXbapgjAKcIVPwOi/cwFMiSPue1NHWpVelcmdQEV8sWqEnUAHHxdVyaUqVszdR6b9Fb5HH4GEwUJyKP8qMrVfTRr3f+0ZlQnSLHwBX3uCKoIs8ZT1LnHhAFH/LMuSZCHg+zio6n31+Ww6hyDIIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744165507; c=relaxed/simple;
	bh=3ToDU4qL2+ls7eBfZ00BuUUCVMF5z4UWw3lNs7pFcPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gzoES4sOLc6X7bwlQnJX+Ebh8bXB3J8LuheoyqADgTphARX/zWnAjGAfLX0j2fXhEwQhrBstuUunt63d7w4FaUKss0YkeY12Pz+IKaCo3odMFZxu36cqAUf5QNtqUdi8y2cje+4yO06W2bpHedQUZ+IGjbcbbYFBK21JnsRAmp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XG80HE1N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XG80HE1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744165503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=viubT93gH39g0FQkvdGZnqOQNHK3ZEdHNZSdQRbLEBE=;
	b=XG80HE1NGEk2mECVsZNsdoLity/PVdDeRaVW8afpalAM5qG0hxI6rGdJMtSKgkvCgjBM1G
	L5wwE1VRqs9eH1wZzdkPDrzIgnE26yAfm22ygJsJbdzvk0e6huhMYPPFiCWJg38P2aOy+T
	shyDgD7DpmX9y0ABbuXg37485U8skJ4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-2UVoF_rkM--J4w6KkhOSBw-1; Tue,
 08 Apr 2025 22:24:59 -0400
X-MC-Unique: 2UVoF_rkM--J4w6KkhOSBw-1
X-Mimecast-MFC-AGG-ID: 2UVoF_rkM--J4w6KkhOSBw_1744165498
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CDEDD180049D;
	Wed,  9 Apr 2025 02:24:57 +0000 (UTC)
Received: from localhost (unknown [10.72.112.61])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15C963001D0E;
	Wed,  9 Apr 2025 02:24:55 +0000 (UTC)
Date: Wed, 9 Apr 2025 10:24:51 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tim Chen <tim.c.chen@linux.intel.com>
Subject: Re: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning:
 function 'swap_is_last_ref' is not needed and will not be emitted
Message-ID: <Z/Xac9o6acRutAvr@MiWiFi-R3L-srv>
References: <202504081841.jbL7yL0r-lkp@intel.com>
 <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2c_sFSKki68lj7Tze3DAhne3V_8JrXOCWdZlD-KRpBo_1744165498
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 04/08/25 at 05:39pm, Andrew Morton wrote:
> On Tue, 8 Apr 2025 18:06:11 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
> > commit: 6bb001b6b64ec20d900d0d81294a0f031af59c3e [1753/1936] mm: swap: enable swap_entry_range_free() to drop any kind of last ref
> > config: hexagon-randconfig-001-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504081841.jbL7yL0r-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted [-Wunneeded-internal-declaration]
> 
> It's annoying that gcc warns about this.
> 
> >     1517 | static inline bool swap_is_last_ref(unsigned char count)
> >          |                    ^~~~~~~~~~~~~~~~
> >    1 warning generated.
> > 
> > 
> > vim +/swap_is_last_ref +1517 mm/swapfile.c
> > 
> >   1512	
> >   1513	/*
> >   1514	 * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
> >   1515	 * caller have to ensure all entries belong to the same cgroup and cluster.
> >   1516	 */
> > > 1517	static inline bool swap_is_last_ref(unsigned char count)
> >   1518	{
> >   1519		return (count == SWAP_HAS_CACHE) || (count == 1) ||
> >   1520		       (count == SWAP_MAP_SHMEM);
> >   1521	}
> >   1522	
> 
> : static inline bool swap_is_last_ref(unsigned char count)
> : {
> : 	return (count == SWAP_HAS_CACHE) || (count == 1) ||
> : 	       (count == SWAP_MAP_SHMEM);
> : }
> : 
> : static void swap_entries_free(struct swap_info_struct *si,
> : 			      struct swap_cluster_info *ci,
> : 			      swp_entry_t entry, unsigned int nr_pages)
> : {
> : 	unsigned long offset = swp_offset(entry);
> : 	unsigned char *map = si->swap_map + offset;
> : 	unsigned char *map_end = map + nr_pages;
> : 
> : 	/* It should never free entries across different clusters */
> : 	VM_BUG_ON(ci != offset_to_cluster(si, offset + nr_pages - 1));
> : 	VM_BUG_ON(cluster_is_empty(ci));
> : 	VM_BUG_ON(ci->count < nr_pages);
> : 
> : 	ci->count -= nr_pages;
> : 	do {
> : 		VM_BUG_ON(!swap_is_last_ref(*map));
> 
> 
> And it's annoying that VM_BUG_ON() doesn't reference its arg when
> CONFIG_DEBUG_VM=n.
> 
> I'll add this:
> 
> --- a/mm/swapfile.c~mm-swap-enable-swap_entry_range_free-to-drop-any-kind-of-last-ref-fix
> +++ a/mm/swapfile.c
> @@ -1514,11 +1514,13 @@ fallback:
>   * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
>   * caller have to ensure all entries belong to the same cgroup and cluster.
>   */
> +#ifdef CONFIG_DEBUG_VM
>  static inline bool swap_is_last_ref(unsigned char count)
>  {
>  	return (count == SWAP_HAS_CACHE) || (count == 1) ||
>  	       (count == SWAP_MAP_SHMEM);
>  }
> +#endif
>  
>  static void swap_entries_free(struct swap_info_struct *si,
>  			      struct swap_cluster_info *ci,
> _
> 
> Kemeng, can you please review that comment "Drop the last ref...". 
> From its positioning it appears to be describing swap_is_last_ref(),
> but swap_is_last_ref() doesn't do those things.

Indeed, maybe below change can be squashed into above patch from Andrew.

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 2887ed5d34cc..baaf8ad29a6b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1536,8 +1536,8 @@ static bool swap_entries_put_map_nr(struct swap_info_struct *si,
 }
 
 /*
- * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
- * caller have to ensure all entries belong to the same cgroup and cluster.
+ * Check if it's the last ref of swap entry in the freeing path.
+ * Qualified vlaue includes 1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM.
  */
 static inline bool swap_is_last_ref(unsigned char count)
 {

