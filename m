Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8111E5205
	for <llvm@lists.linux.dev>; Wed,  9 Apr 2025 22:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744238760; cv=none; b=S/R7BqP4SrLjnW/Z28EUy9XmT77qeAi2K0e2hTSJH2Lmh18aXt0NU0abGngdQiRo8a9S/+Ptw4H2XEaxylt9YZ33eNtKSOcjMEcRLEARxDa0QCKUkGkEmG1ybyB7ogj820+yY71eURzyXjIY9QHhnyPer+yyk5RCAXdCFuN7Ozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744238760; c=relaxed/simple;
	bh=2duak/SLImHoGvgM4DFtTkQRZhmG205HyCBGhH7jsDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hVuwcxzw5Ze+hypYGgHytkMVR5eGXod1+X5bHYTLzS5GDZeexcCPkHTchjZhMBMwY6XW3Fu75ByMV03WYxphPteObIsnAyTU29lGrHoAbRl+Sw7nudu2/HJ4v2XnAW0zLy+HL4YgI7yucpAske9dpgAQ60qBXoCHoqu3ry+HaYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MPRC1AEb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MPRC1AEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744238757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ku4yyWjuqPCXvmLiXxONVvSW85vS72t1vVANWUSZuo=;
	b=MPRC1AEbI1LUPwGSpLV0WnK4DS2a7qrYKa2CoK2f+8Q/DLYqNPPlWbm9mbjCPabXBJS6/C
	OCu1bJXMTElUx4u21t0dUH+y8V37Q8IVs/WQjwgoA/rCMfJv93NgVB0ythAWZntrWmQ2Ze
	BJNb74tbjzTZCPijwwIVtuFaJ/Yp8RQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-14-PrFDpZr2ND-Vh4XOVp0KLg-1; Wed,
 09 Apr 2025 18:45:54 -0400
X-MC-Unique: PrFDpZr2ND-Vh4XOVp0KLg-1
X-Mimecast-MFC-AGG-ID: PrFDpZr2ND-Vh4XOVp0KLg_1744238752
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B0CD1801A1A;
	Wed,  9 Apr 2025 22:45:52 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A4EF180174E;
	Wed,  9 Apr 2025 22:45:49 +0000 (UTC)
Date: Thu, 10 Apr 2025 06:45:45 +0800
From: Baoquan He <bhe@redhat.com>
To: SeongJae Park <sj@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tim Chen <tim.c.chen@linux.intel.com>
Subject: Re: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning:
 function 'swap_is_last_ref' is not needed and will not be emitted
Message-ID: <Z/b4mdaNvhdg7FJD@MiWiFi-R3L-srv>
References: <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
 <20250409165452.305371-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250409165452.305371-1-sj@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NorojRoyMqlnmAbi3HXtSkAmWOVaGo5KCZ8-A_xubUA_1744238752
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 04/09/25 at 09:54am, SeongJae Park wrote:
> Hello,
> 
> On Tue, 8 Apr 2025 17:39:59 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > On Tue, 8 Apr 2025 18:06:11 +0800 kernel test robot <lkp@intel.com> wrote:
> > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
> > > commit: 6bb001b6b64ec20d900d0d81294a0f031af59c3e [1753/1936] mm: swap: enable swap_entry_range_free() to drop any kind of last ref
> > > config: hexagon-randconfig-001-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/config)
> > > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081841.jbL7yL0r-lkp@intel.com/reproduce)
> > > 

Hi lkp team,

When I tried to reproduce, I got below failure. Please help check what's
wrong with it. Thanks in advance.

[~]# COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-21 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
Compiler will be installed in /root/0day
Cannot find clang-21 under https://cdn.kernel.org/pub/tools/llvm/files
Please set new URL env variable and rerun
  * crosstool provided by kernel org:
    export URL=https://cdn.kernel.org/pub/tools/llvm/files
  * crosstool provided by 0-Day CI:
    export URL=https://download.01.org/0day-ci/cross-package
clang crosstool install failed
Install clang compiler failed
setup_crosstool failed

> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202504081841.jbL7yL0r-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted [-Wunneeded-internal-declaration]
> > 
> > It's annoying that gcc warns about this.
> > 
> > >     1517 | static inline bool swap_is_last_ref(unsigned char count)
> > >          |                    ^~~~~~~~~~~~~~~~
> > >    1 warning generated.
> > > 
> > > 
> > > vim +/swap_is_last_ref +1517 mm/swapfile.c
> > > 
> > >   1512	
> > >   1513	/*
> > >   1514	 * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
> > >   1515	 * caller have to ensure all entries belong to the same cgroup and cluster.
> > >   1516	 */
> > > > 1517	static inline bool swap_is_last_ref(unsigned char count)
> > >   1518	{
> > >   1519		return (count == SWAP_HAS_CACHE) || (count == 1) ||
> > >   1520		       (count == SWAP_MAP_SHMEM);
> > >   1521	}
> > >   1522	
> > 
> > : static inline bool swap_is_last_ref(unsigned char count)
> > : {
> > : 	return (count == SWAP_HAS_CACHE) || (count == 1) ||
> > : 	       (count == SWAP_MAP_SHMEM);
> > : }
> > : 
> > : static void swap_entries_free(struct swap_info_struct *si,
> > : 			      struct swap_cluster_info *ci,
> > : 			      swp_entry_t entry, unsigned int nr_pages)
> > : {
> > : 	unsigned long offset = swp_offset(entry);
> > : 	unsigned char *map = si->swap_map + offset;
> > : 	unsigned char *map_end = map + nr_pages;
> > : 
> > : 	/* It should never free entries across different clusters */
> > : 	VM_BUG_ON(ci != offset_to_cluster(si, offset + nr_pages - 1));
> > : 	VM_BUG_ON(cluster_is_empty(ci));
> > : 	VM_BUG_ON(ci->count < nr_pages);
> > : 
> > : 	ci->count -= nr_pages;
> > : 	do {
> > : 		VM_BUG_ON(!swap_is_last_ref(*map));
> > 
> > 
> > And it's annoying that VM_BUG_ON() doesn't reference its arg when
> > CONFIG_DEBUG_VM=n.
> > 
> > I'll add this:
> > 
> > --- a/mm/swapfile.c~mm-swap-enable-swap_entry_range_free-to-drop-any-kind-of-last-ref-fix
> > +++ a/mm/swapfile.c
> > @@ -1514,11 +1514,13 @@ fallback:
> >   * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
> >   * caller have to ensure all entries belong to the same cgroup and cluster.
> >   */
> > +#ifdef CONFIG_DEBUG_VM
> >  static inline bool swap_is_last_ref(unsigned char count)
> >  {
> >  	return (count == SWAP_HAS_CACHE) || (count == 1) ||
> >  	       (count == SWAP_MAP_SHMEM);
> >  }
> > +#endif
> >  
> >  static void swap_entries_free(struct swap_info_struct *si,
> >  			      struct swap_cluster_info *ci,
> > _
> 
> This makes my build fails when CONFIG_DEBUG_VM is unset as below.
> 
>     linux/mm/swapfile.c: In function ‘swap_entries_free’:
>     linux/mm/swapfile.c:1565:28: error: implicit declaration of function ‘swap_is_last_ref’; did you mean ‘swap_is_last_map’? [-Werror=implicit-function-declaration]
>      1565 |                 VM_BUG_ON(!swap_is_last_ref(*map));
>           |                            ^~~~~~~~~~~~~~~~
>     linux/include/linux/build_bug.h:30:63: note: in definition of macro ‘BUILD_BUG_ON_INVALID’
>        30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
>           |                                                               ^
>     linux/mm/swapfile.c:1565:17: note: in expansion of macro ‘VM_BUG_ON’
>      1565 |                 VM_BUG_ON(!swap_is_last_ref(*map));
>           |                 ^~~~~~~~~
>     cc1: some warnings being treated as errors
> 
> Maybe we can open-code the condition, or add a macro implementation of
> swap_is_last_ref() for !CONFIG_DEBUG_VM case?

I think we shold do the similar thing as this commit does:
6e8e04291d81 mm/zsmalloc: add __maybe_unused attribute for is_first_zpdesc()

Just add a __maybe_unused attribute to mute the warning. I haven't
tested it because the reproducer failed in my side.

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 2887ed5d34cc..08b52346cc39 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1539,7 +1539,7 @@ static bool swap_entries_put_map_nr(struct swap_info_struct *si,
  * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
  * caller have to ensure all entries belong to the same cgroup and cluster.
  */
-static inline bool swap_is_last_ref(unsigned char count)
+static inline bool __maybe_unused swap_is_last_ref(unsigned char count)
 {
 	return (count == SWAP_HAS_CACHE) || (count == 1) ||
 	       (count == SWAP_MAP_SHMEM);

