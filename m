Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E3A1363
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 01:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664501398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o0qwcHOqcRJEPJox6d6ejyTZ0YHPJhGhid3eXT/4M8s=;
	b=iBHhzeF6eEZ9js025twCwLwCqL55luxgaQQC/1aU5RkUXOyCOgFD9+uoCsd/ihSKwxGOyZ
	ZIemzY8sacyGCalHPMVQ/InFyj0YyylNuvAmeDnyDJq41/iOSCOSeJHOXTbUSVDBRi7L1X
	A3VnkDxBT2UhV4PaL24ODmf4OFmOa7w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-mwbsGmvhNb2UhgQzHRfiGA-1; Thu, 29 Sep 2022 21:29:57 -0400
X-MC-Unique: mwbsGmvhNb2UhgQzHRfiGA-1
Received: by mail-qk1-f197.google.com with SMTP id n13-20020a05620a294d00b006cf933c40feso2670578qkp.20
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 18:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=o0qwcHOqcRJEPJox6d6ejyTZ0YHPJhGhid3eXT/4M8s=;
        b=Z2rbP+ye3h0a+sfsvbTiBCJkvZfay74kX0sTRXttCTd66yeELF1GRK8y6VOF3ohzWf
         Ywr/wcfFzwXs2F6bacpWp+8olmvYn1p0/l4ticLk6CX3SaZItSKkJAAyXlBO7d6gFed+
         I8C6gyNzkvBvO4k/Mplm5wNEzZL3OIBpg/jKzA++kfHj5j/5XJ2xOz9Gpufko6Jdj0VI
         3Ht3CuHzWP+PFNQUIbuoQ8Vr890FI+O/BIKzlP+6BUaE9swchZX3lqRkcz9y/hqq2EhP
         KMQ/yEGJlTE31hEmACdwLB3J0s10zEwanDzQj9aqvsJzUDXRj2oGtX0IiesFviRWycd+
         u4NQ==
X-Gm-Message-State: ACrzQf061P8Jpm6MBEVcXzjeI44CGfDg5LIPkdv52juWG1pONKPO5xDR
	oIalwK2525wYaq09fXFky9Vz73b1N5/2erhl0NcOLIz3726vIv+0qCpOvNbCASQz0vdVs52wngI
	T/CJBuVzXcZ+6mw==
X-Received: by 2002:a05:620a:16b9:b0:6cd:ee77:4223 with SMTP id s25-20020a05620a16b900b006cdee774223mr4452121qkj.114.1664501396709;
        Thu, 29 Sep 2022 18:29:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4s3EFkkJr/z6Co6lGuauJk3Y11JdFiTHgJ5pNpuAn6mB5jv+A5uo3QGvuI6PK/j5Yj6jEgcg==
X-Received: by 2002:a05:620a:16b9:b0:6cd:ee77:4223 with SMTP id s25-20020a05620a16b900b006cdee774223mr4452105qkj.114.1664501396380;
        Thu, 29 Sep 2022 18:29:56 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id a5-20020ac85b85000000b0035ba7012724sm678681qta.70.2022.09.29.18.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 18:29:55 -0700 (PDT)
Date: Thu, 29 Sep 2022 21:29:54 -0400
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
Message-ID: <YzZGkhNpluNHhTc3@xz-m1.local>
References: <0000000000006c300705e95a59db@google.com>
 <Yy4g/BKpnJga1toG@monkey>
 <7693a84-bdc2-27b5-2695-d0fe8566571f@google.com>
 <Yy5WHvioerD2Sev1@x1n>
 <Yy8dBrmvDmqlsRXE@x1n>
 <Yy9T/JmVb4ymf6WM@monkey>
 <YzDuHbuo2x/b2Mbr@x1n>
 <YzMjxY5O6Hf/IPTx@monkey>
 <YzMomT+OusJnLOPC@x1n>
 <YzYrYVeA0b9d5dos@monkey>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YzYrYVeA0b9d5dos@monkey>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, Mike,

On Thu, Sep 29, 2022 at 04:33:53PM -0700, Mike Kravetz wrote:
> I added some TLB flushing to hugetlb_mcopy_atomic_pte, but it did not make
> any difference.  Suggestions would be appreciated as cache/tlb/???  flushing
> issues take me a while to figure out.

It seems the UFFDIO_COPY for hugetlb is the major issue here, in that for
private mappings we don't inject the page cache.

I think it makes sense in that e.g. we don't want to allow a private
mapping to be able to write to the page cache.  But afaict that's not
correct because UFFDIO_COPY resolves exactly page faults in page cache
layer for file backed memories.  So what we should do is inject page cache
but mark the page RO, waiting for a coming CoW if needed.

I'll attach one patch fix that will start to inject the page into page
cache for UFFDIO_COPY+hugetlb even if mapping is private.  Another test
patch is also added because otherwise the private hugetlb selftest won't
work after the fix applied - in the selftest we used to use DONTNEED to
drop the private mapping, but IMHO that's not enough, we need to drop the
page cache too (after the fix).  I've also have the test patch attached.

Feel free to try out with the two patches applied.  It started to work for
me for current issue.

I didn't yet post them out yet because after I applied the two patches I
found other issues - the reserved pages are messed up and leaked.  I'll
keep looking tomorrow on the leak issue, but please also let me know if you
figured anything suspecious as I know you're definitely must more fluent on
the reservation code.

And that's not the only issue I found - shmem can have other issues
regarding private mappings; shmem does it right on the page cache insertion
but not the rest I think..  I'll look into them one by one.  It's quite
interesting to dig multiple things out of the write check symptons..

-- 
Peter Xu

