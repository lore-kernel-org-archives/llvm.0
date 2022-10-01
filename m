Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109D1FBA
	for <llvm@lists.linux.dev>; Sat,  1 Oct 2022 03:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664593279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m0ck6iUk51ffgGo9SGt8BSmgO+hgV/Obr1Ob0T0y4QU=;
	b=hYnQ+VHerFvuShU4eQdVFyK/2tggERwFMVj65+EfOl8/3bdFgsoXe8K/Xf0zor5oH8RL3K
	ygKtrFRM9OhlmQ8xwCEe/9wt6OV8EaceeIB8ASj8dIH0D+nN2j1JRXhZqpMAQipSKVOz3q
	RiYTvuvCc4ScwrXs3oZWWWYpRpK3i20=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-UjBorpgVO9uAxbP3-WcPKg-1; Fri, 30 Sep 2022 23:01:13 -0400
X-MC-Unique: UjBorpgVO9uAxbP3-WcPKg-1
Received: by mail-qv1-f71.google.com with SMTP id i1-20020a056214020100b004afa3dbf35dso4066627qvt.14
        for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 20:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=EUUDG0/kTi+On3NhyxpgnsN2yq5yApPmgt3dSfPzxe0=;
        b=2Dcrtl0tN/Z55lZ+5IrpcFAK4m4QPJ4RzX1ypoQyEuLzAZH173i9invFgySLH2HWP7
         2vNce3H8QmyzJ9MBdV9oFdojcAAshkB8ksN/jPKNlBDgcq2r11gXupGLynm/mhg1GRld
         mALKLxF0zQdDp/ytKX2/A8QLT1AVBz+Mw5KBdCJtoqtP8hP0tlVsfQ5GbHc63kOgNrEL
         kqqk9L/8HO379FA08D6/jam9sT6a1JC+pbKNQ5cYj+J8ytLcUMl1hVM6rOtG7hO/ySvB
         94T8RN4bbu74Crp4D95l0LcSUzEJlJYhk8GddLRH08Ryi4VGVWP670BTrRVA7VU0Mx3p
         d6DQ==
X-Gm-Message-State: ACrzQf1z4BabfYupH+3Du9F/98UUlNtcH3or9Uln616TAdB0MTG9Ntn1
	NenHTvc2NTD9SbnfURRTKUqidvK4X2CPWXmRi+q4rKlFdO7GSoEZg3v5leqVSViJ1Ga/vPUS1ID
	y+Ux2Iu37pZY/4Q==
X-Received: by 2002:ad4:5bcd:0:b0:4af:9074:8c96 with SMTP id t13-20020ad45bcd000000b004af90748c96mr9561749qvt.51.1664593272545;
        Fri, 30 Sep 2022 20:01:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6sxJKfEPLLRZBasOEm1JZ9RQjmuZmascRGpmSJP9STt0gjOzGVBt+/SysUUr24SGvltdvNLA==
X-Received: by 2002:ad4:5bcd:0:b0:4af:9074:8c96 with SMTP id t13-20020ad45bcd000000b004af90748c96mr9561720qvt.51.1664593272202;
        Fri, 30 Sep 2022 20:01:12 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id a30-20020ac8435e000000b003438a8e842fsm3586750qtn.44.2022.09.30.20.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 20:01:11 -0700 (PDT)
Date: Fri, 30 Sep 2022 23:01:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yang Shi <shy828301@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	syzbot <syzbot+152d76c44ba142f8992b@syzkaller.appspotmail.com>,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, llvm@lists.linux.dev, nathan@kernel.org,
	ndesaulniers@google.com, songmuchun@bytedance.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Subject: Re: [syzbot] general protection fault in PageHeadHuge
Message-ID: <YzetdU37ekZ6N2II@x1n>
References: <Yy5WHvioerD2Sev1@x1n>
 <Yy8dBrmvDmqlsRXE@x1n>
 <Yy9T/JmVb4ymf6WM@monkey>
 <YzDuHbuo2x/b2Mbr@x1n>
 <YzMjxY5O6Hf/IPTx@monkey>
 <YzMomT+OusJnLOPC@x1n>
 <YzYrYVeA0b9d5dos@monkey>
 <YzcTt3P3ofvbGQmi@x1n>
 <YzdhuZmfQCjLFEMO@monkey>
 <YzeqUTDay7AcnP7r@x1n>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YzeqUTDay7AcnP7r@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="/2ttB/dmRH7GVaAc"
Content-Disposition: inline

--/2ttB/dmRH7GVaAc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Sep 30, 2022 at 10:47:45PM -0400, Peter Xu wrote:
> Hi, Mike,
> 
> On Fri, Sep 30, 2022 at 02:38:01PM -0700, Mike Kravetz wrote:
> > On 09/30/22 12:05, Peter Xu wrote:
> > > On Thu, Sep 29, 2022 at 04:33:53PM -0700, Mike Kravetz wrote:
> > > > I was able to do a little more debugging:
> > > > 
> > > > As you know the hugetlb calling path to handle_userfault is something
> > > > like this,
> > > > 
> > > > hugetlb_fault
> > > > 	mutex_lock(&hugetlb_fault_mutex_table[hash]);
> > > > 	ptep = huge_pte_alloc(mm, vma, haddr, huge_page_size(h));
> > > > 	if (huge_pte_none_mostly())
> > > > 		hugetlb_no_page()
> > > > 			page = find_lock_page(mapping, idx);
> > > > 			if (!page) {
> > > > 				if (userfaultfd_missing(vma))
> > > > 					mutex_unlock(&hugetlb_fault_mutex_table[hash]);
> > > > 					return handle_userfault()
> > > > 			}
> > > > 
> > > > For anon mappings, find_lock_page() will never find a page, so as long
> > > > as huge_pte_none_mostly() is true we will call into handle_userfault().
> > > > 
> > > > Since your analysis shows the testcase should never call handle_userfault() for
> > > > a write fault, I simply added a 'if (flags & FAULT_FLAG_WRITE) printk' before
> > > > the call to handle_userfault().  Sure enough, I saw plenty of printk messages.
> > > > 
> > > > Then, before calling handle_userfault() I added code to take the page table
> > > > lock and test huge_pte_none_mostly() again.  In every FAULT_FLAG_WRITE case,
> > > > this second test of huge_pte_none_mostly() was false.  So, the condition
> > > > changed from the check in hugetlb_fault until the check (with page table
> > > > lock) in hugetlb_no_page.
> > > > 
> > > > IIUC, the only code that should be modifying the pte in this test is
> > > > hugetlb_mcopy_atomic_pte().  It also holds the hugetlb_fault_mutex while
> > > > updating the pte.
> > > > 
> > > > It 'appears' that hugetlb_fault is not seeing the updated pte and I can
> > > > only guess that it is due to some caching issues.
> > > > 
> > > > After writing the pte in hugetlb_mcopy_atomic_pte() there is this comment.
> > > > 
> > > > 	/* No need to invalidate - it was non-present before */
> > > > 	update_mmu_cache(dst_vma, dst_addr, dst_pte);
> > > > 
> > > > I suspect that is true.  However, it seems like this test depends on all
> > > > CPUs seeing the updated pte immediately?
> > > > 
> > > > I added some TLB flushing to hugetlb_mcopy_atomic_pte, but it did not make
> > > > any difference.  Suggestions would be appreciated as cache/tlb/???  flushing
> > > > issues take me a while to figure out.
> > > 
> > > This morning when I went back and rethink the matter, I just found that the
> > > common hugetlb path handles private anonymous mappings with all empty page
> > > cache as you explained above.  In that sense the two patches I posted may
> > > not really make sense even if they can pass the tests.. and maybe that's
> > > also the reason why the reservations got messed up.  This is also something
> > > I found after I read more on the reservation code e.g. no matter private or
> > > shared hugetlb mappings we only reserve that only number of pages when mmap().
> > > 
> > > Indeed if with that in mind the UFFDIO_COPY should also work because
> > > hugetlb fault handler checks pte first before page cache, so uffd missing
> > > should still work as expected.
> > > 
> > > It makes sense especially for hugetlb to do that otherwise there can be
> > > plenty of zero huge pages cached in the page cache.  I'm not sure whether
> > > this is the reason hugetlb does it differently (e.g. comparing to shmem?),
> > > it'll be great if I can get a confirmation.  If it's true please ignore the
> > > two patches I posted.
> > > 
> > > I think what you analyzed is correct in that the pte shouldn't go away
> > > after being armed once.  One more thing I tried (actually yesterday) was
> > > SIGBUS the process when the write missing event was generated, and I can
> > > see the user stack points to the cmpxchg() of the pthread_mutex_lock().  It
> > > means indeed it moved forward and passed the mutex type check, it also
> > > means it should have seen a !none pte already with at least reading
> > > permission, in that sense it matches with "missing TLB" possibility
> > > experiment mentioned above, because for a missing TLB it should keep
> > > stucking at the read not write.  It's still uncertain why the pte can go
> > > away somehow from under us and why it quickly re-appears according to your
> > > experiment.
> > > 
> > 
> > I 'think' it is more of a race with all cpus seeing the pte update.  To be
> > honest, I can not wrap my head around how that can happen.
> > 
> > I did not really like your idea of adding anon (or private) pages to the
> > page cache.
> 
> I don't like that either, especially when I notice it breaks the
> reservations... :)
> 
> Note that my previous patch wasn't adding anon or private pages into page
> cache.  PageAnon() will be false for those pages being added.  I was
> literally doing insertion of page cache for UFFDIO_COPY, rather than
> directly making it anonymous.  Actually that's what shmem does.
> 
> > As you discovered, there is code like reservations which depend
> > on current behavior.
> > 
> > It seems to me that for 'missing' hugetlb faults there are two specific cases:
> > 1) Shared or file backed mappings.  In this case, the page cache is the
> >    'source of truth'.  If there is not a page in the page cache, then we
> >    hand off to userfault with VM_UFFD_MISSING.
> > 2) anon or private mappings.  In this case, pages are not in the page cache.
> >    The page table is the 'source of truth'.
> 
> Sorry, I can't say I fully agree with it.
> 
> IMHO the missing mode is really about page cache.  Let's imagine when we
> create private mappings upon a hugetlbfs file that has some pages written.
> When page fault triggers, we should never generate a missing if cache hit,
> even if the pte is null.  Maybe that's not exactly what you meant, but the
> wording is kind of misleading here.
> 
> I'd say it's really about hugetlbfs is special in treating private pages.
> Note that shmem wasn't treat it like that as I mentioned.  But AFAICT
> hugetlbfs is different in a good way because otherwise we could be wasting
> quite a few useless zero pages dangling in the page cache, and AFAICT
> that's still what we do with shmem - just try to create 20M shmem
> anonymouse file, privately map and write to them and see how many mem we'll
> consume..  It's not optimal, but still correct IMHO.
> 
> > Early in hugetlb fault processing
> >    we check the page table (huge_pte_none_mostly).  However, as my debug code
> >    has shown, checking the page table again with lock held will reveal that
> >    the pte has in fact been updated.
> 
> Right, I found it in the hard way. I should have been reading code more
> carefully: it's caused by CoW where we'll need a clear+flush to make sure
> TLB consistency (in hugetlb_wp):
> 
> 	if (likely(ptep && pte_same(huge_ptep_get(ptep), pte))) {
> 		ClearHPageRestoreReserve(new_page);
> 
> 		/* Break COW or unshare */
> 		huge_ptep_clear_flush(vma, haddr, ptep);
> 		mmu_notifier_invalidate_range(mm, range.start, range.end);
> 		page_remove_rmap(old_page, vma, true);
> 		hugepage_add_new_anon_rmap(new_page, vma, haddr);
> 		set_huge_pte_at(mm, haddr, ptep,
> 				make_huge_pte(vma, new_page, !unshare));
> 		SetHPageMigratable(new_page);
> 		/* Make the old page be freed below */
> 		new_page = old_page;
> 	}
> 
> The early TLB flush was trying to avoid inconsistent TLB entries in
> different cores.
> 
> So far I still don't know why the hugetlb commit changed the timing, but
> this time since I tracked the pgtables I'm more sure of its cause.
> 
> > 
> > My thought was that regular anon pages would have the same issue.  So, I looked
> > at the calling code there.  In do_anonymous_page() there is this block:
> > 
> > 	/* Use the zero-page for reads */
> > 	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
> > 			!mm_forbids_zeropage(vma->vm_mm)) {
> > 		entry = pte_mkspecial(pfn_pte(my_zero_pfn(vmf->address),
> > 						vma->vm_page_prot));
> > 		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
> > 				vmf->address, &vmf->ptl);
> > 		if (!pte_none(*vmf->pte)) {
> > 			update_mmu_tlb(vma, vmf->address, vmf->pte);
> > 			goto unlock;
> > 		}
> > 		ret = check_stable_address_space(vma->vm_mm);
> > 		if (ret)
> > 			goto unlock;
> > 		/* Deliver the page fault to userland, check inside PT lock */
> > 		if (userfaultfd_missing(vma)) {
> > 			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > 			return handle_userfault(vmf, VM_UFFD_MISSING);
> > 		}
> > 		goto setpte;
> > 	}
> > 
> > Notice that here the pte is checked while holding the page table lock while
> > to make the decision to call handle_userfault().
> 
> Right.  That's a great finding, thanks.  It's just that I found it great
> only after I found the whole story on the CoW in progress.. I could have
> been done better.
> 
> > 
> > In my testing, if we check huge_pte_none_mostly() while holding the page table
> > lock before calling handle_userfault we will not experience the failure.  Can
> > you see if this also resolves the issue in your environment?  I do not love
> > this solution as I still can not explain how this code is missing the pte
> > update.
> 
> Yes this patch will fix it which I tested.  But IMHO there're quite a few
> wordings that are misleading as I tried to explain above on why page cache
> still matters (and matters the most IMHO for MISSING events).
> 
> Meanwhile IMHO there's a better way to address this - we're in
> hugetlb_no_page() but we're relying on a pte that was read _without_
> pgtable lock.  It means it can be either unstable or changed.  We do proper
> check for most of the rest code path for hugetlb_no_page() on pte_same()
> but we just forgot to do that for userfaultfd.
> 
> One example is IMO we shouldn't target this "check pte under locking" for
> private mappings only.  If the pte changed for either private/shared
> mappings, it's probably already illegal to be inside hugetlb_no_page().
> Logically for shared mappings the pte can change in any form too as long as
> under pgtable lock.  So the lock should logically apply to shared mappings
> too, IMHO.
> 
> In summary, I attached another patch that addressed it in the way I
> described above (only compile tested; even without writting the commit
> message because I need to go very soon).  Let me know what do you think the
> best way to approach this.

Obviously I never remember to attach things when I meant to.. Sorry for the
noise.  Attached this time.

> 
> (During debugging this problem, I also found a few other issues; I'll
> not make this email any longer but will verify them next week and follow up
> from there)
> 
> Thanks,
> 
> > 
> > From f910e7155d6831514165af35e0d75574124a4477 Mon Sep 17 00:00:00 2001
> > From: Mike Kravetz <mike.kravetz@oracle.com>
> > Date: Fri, 30 Sep 2022 13:45:08 -0700
> > Subject: [PATCH] hugetlb: check pte with page table lock before handing to
> >  userfault
> > 
> > In hugetlb_no_page we decide a page is missing if not present in the
> > page cache.  This is perfectly valid for shared/file mappings where
> > pages must exist in the page cache.  For anon/private mappings, the page
> > table must be checked.  This is done early in hugetlb_fault processing
> > and is the reason we enter hugetlb_no_page.  However, the early check is
> > made without holding the page table lock.  There could be racing updates
> > to the pte entry, so check again with page table lock held before
> > deciding to call handle_userfault.
> > 
> > Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> > ---
> >  mm/hugetlb.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 60e077ce6ca7..4cb44a4629b8 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -5560,10 +5560,29 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
> >  		if (idx >= size)
> >  			goto out;
> >  		/* Check for page in userfault range */
> > -		if (userfaultfd_missing(vma))
> > +		if (userfaultfd_missing(vma)) {
> > +			/*
> > +			 * For missing pages, the page cache (checked above) is
> > +			 * the 'source of truth' for shared mappings.  For anon
> > +			 * mappings, the source of truth is the page table.  We
> > +			 * already checked huge_pte_none_mostly() in
> > +			 * hugetlb_fault.  However, there could be racing
> > +			 * updates.  Check again while holding page table lock
> > +			 * before handing off to userfault.
> > +			 */
> > +			if (!(vma->vm_flags & VM_MAYSHARE)) {
> > +				ptl = huge_pte_lock(h, mm, ptep);
> > +				if (!huge_pte_none_mostly(huge_ptep_get(ptep))) {
> > +					spin_unlock(ptl);
> > +					ret = 0;
> > +					goto out;
> > +				}
> > +				spin_unlock(ptl);
> > +			}
> >  			return hugetlb_handle_userfault(vma, mapping, idx,
> >  						       flags, haddr, address,
> >  						       VM_UFFD_MISSING);
> > +		}
> >  
> >  		page = alloc_huge_page(vma, haddr, 0);
> >  		if (IS_ERR(page)) {
> > -- 
> > 2.37.3
> > 
> 
> -- 
> Peter Xu

-- 
Peter Xu

--/2ttB/dmRH7GVaAc
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-mm-hugetlb-Fix-race-condition-of-uffd-missing-handli.patch"

From fe9e50551f3fdb7107315784affca4f9b1c4720f Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Fri, 30 Sep 2022 22:22:44 -0400
Subject: [PATCH] mm/hugetlb: Fix race condition of uffd missing handling
Content-type: text/plain

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hugetlb.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index dd29cba46e9e..5015d8aa5da4 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5557,9 +5557,39 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
 	if (!page) {
 		/* Check for page in userfault range */
 		if (userfaultfd_missing(vma)) {
-			ret = hugetlb_handle_userfault(vma, mapping, idx,
-						       flags, haddr, address,
-						       VM_UFFD_MISSING);
+			bool same;
+
+			/*
+			 * Since hugetlb_no_page() was examining pte
+			 * without pgtable lock, we need to re-test under
+			 * lock because the pte may not be stable and could
+			 * have changed from under us.  Try to detect
+			 * either changed or during-changing ptes and bail
+			 * out properly.
+			 *
+			 * One example of changing pte is in-progress CoW
+			 * of private mapping, which will clear+flush pte
+			 * then reinstall the new one.
+			 *
+			 * Note that userfaultfd is actually fine with
+			 * false positives (e.g. caused by pte changed),
+			 * but not wrong logical events (e.g. caused by
+			 * reading a pte during changing).  The latter can
+			 * confuse the userspace, so the strictness is very
+			 * much preferred.  E.g., MISSING event should
+			 * never happen on the page after UFFDIO_COPY has
+			 * correctly installed the page and returned.
+			 */
+			ptl = huge_pte_lock(h, mm, ptep);
+			same = pte_same(huge_ptep_get(ptep), old_pte);
+			spin_unlock(ptl);
+			if (same)
+				ret = hugetlb_handle_userfault(vma, mapping, idx,
+							       flags, haddr, address,
+							       VM_UFFD_MISSING);
+			else
+				/* PTE changed or unstable, retry */
+				ret = 0;
 			goto out;
 		}
 
-- 
2.37.3


--/2ttB/dmRH7GVaAc--

