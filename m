Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027618D
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 00:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664151074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aK8oEr6Mo1r3LJjWh8qC8wg2ZbpaqIAd/c7oyUSXWrA=;
	b=HBO5wigpGSysqqI0rymLm575OWBCjrOvz564lZ39clHiZMXzofzNPG+XwIfDxtGp8fUF/Q
	JDbJvkmgUk6w/RZVVylgQ/gyhanf/mvoJOgJ0+OcppRqq3VvSRIJvfo1+FDr2GkzcF+ymJ
	5ZW9Uy0SEFgMJjcWj9787ADDVf+ZFNU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-tg-1TfwWOO2juykwZKV6MQ-1; Sun, 25 Sep 2022 20:11:13 -0400
X-MC-Unique: tg-1TfwWOO2juykwZKV6MQ-1
Received: by mail-qk1-f199.google.com with SMTP id bj42-20020a05620a192a00b006cf663bca6aso3917368qkb.3
        for <llvm@lists.linux.dev>; Sun, 25 Sep 2022 17:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=aK8oEr6Mo1r3LJjWh8qC8wg2ZbpaqIAd/c7oyUSXWrA=;
        b=Er0RcgJFUq6bky4NkIgF+PFiALf2r9fuE/axbMii6r0/6mwqK55dZs27E5TVA8gxsg
         KRKZwWArps4/lAu+oYOVAuVyHpJcxo7mJsKvxy+6/BU65MrdsERJa462EJeGp/MgaWzR
         0TnK4NiuFFLFMn+Ktv80/1t5m/L+vhH/JnhuBFoPKEo3GjotLq5qtl8GuwyfJ2Ptk9lW
         jVNMRc+6wPUP+JOrs/nuI0/DjO1AFYXJxeevNLciqlxVGSH7zjSz7DhsjZHZzjOaKnCz
         5XZY76C2lpGQcj1Q9RncvSSHSwoqXimVNteCsm4cssn+R7dR7tIPuviKYfs8IcohXCSU
         6I4g==
X-Gm-Message-State: ACrzQf1TlSsvZi7wYAKYeCqPCq6jTx8B8Y4yYxZp41e1kSwOZ588JeyQ
	0qcxET4yzZTv+LTxHp61/6yffjgAh1vF2lu3Cec/5+5uYQOtFbz1WmjKdxqz+Usb6BWCBVMS1BP
	bZKBFvA8Zd6/Aqw==
X-Received: by 2002:a0c:a9d5:0:b0:4a6:3ec0:74ba with SMTP id c21-20020a0ca9d5000000b004a63ec074bamr15496715qvb.31.1664151071930;
        Sun, 25 Sep 2022 17:11:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43SNkGk46w9cMJaZj4k1tISHBtvYVuTHN92lm9iGTPf61F+K085X1BBI2xtFUatWbkHwjQCA==
X-Received: by 2002:a0c:a9d5:0:b0:4a6:3ec0:74ba with SMTP id c21-20020a0ca9d5000000b004a63ec074bamr15496698qvb.31.1664151071664;
        Sun, 25 Sep 2022 17:11:11 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id bi16-20020a05620a319000b006b58d8f6181sm10636112qkb.72.2022.09.25.17.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 17:11:11 -0700 (PDT)
Date: Sun, 25 Sep 2022 20:11:09 -0400
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
Message-ID: <YzDuHbuo2x/b2Mbr@x1n>
References: <0000000000006c300705e95a59db@google.com>
 <Yy4g/BKpnJga1toG@monkey>
 <7693a84-bdc2-27b5-2695-d0fe8566571f@google.com>
 <Yy5WHvioerD2Sev1@x1n>
 <Yy8dBrmvDmqlsRXE@x1n>
 <Yy9T/JmVb4ymf6WM@monkey>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yy9T/JmVb4ymf6WM@monkey>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Sep 24, 2022 at 12:01:16PM -0700, Mike Kravetz wrote:
> On 09/24/22 11:06, Peter Xu wrote:
> > 
> > Sorry I forgot to reply on this one.
> > 
> > I didn't try linux-next, but I can easily reproduce this with mm-unstable
> > already, and I verified that Hugh's patch fixes the problem for shmem.
> > 
> > When I was testing I found hugetlb selftest is broken too but with some
> > other errors:
> > 
> > $ sudo ./userfaultfd hugetlb 100 10  
> > ...
> > bounces: 6, mode: racing ver read, ERROR: unexpected write fault (errno=0, line=779)
> > 
> > The failing check was making sure all MISSING events are not triggered by
> > writes, but frankly I don't really know why it's required, and that check
> > existed since the 1st commit when test was introduced.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c47174fc362a089b1125174258e53ef4a69ce6b8
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/vm/userfaultfd.c?id=c47174fc362a089b1125174258e53ef4a69ce6b8#n291
> > 
> > And obviously some recent hugetlb-related change caused that to happen.
> > 
> > Dropping that check can definitely work, but I'll have a closer look soon
> > too to make sure I didn't miss something.  Mike, please also let me know if
> > you are aware of this problem.
> > 
> 
> Peter, I am not aware of this problem.  I really should make running ALL
> hugetlb tests part of my regular routine.
> 
> If you do not beat me to it, I will take a look in the next few days.

Just to update - my bisection points to 00cdec99f3eb ("hugetlbfs: revert
use i_mmap_rwsem to address page fault/truncate race", 2022-09-21).

I don't understand how they are related so far, though.  It should be a
timing thing because the failure cannot be reproduced on a VM but only on
the host, and it can also pass sometimes even on the host but rarely.

Logically all the uffd messages in the stress test should be generated by
the locking thread, upon:

		pthread_mutex_lock(area_mutex(area_dst, page_nr));

I thought a common scheme for lock() fast path should already be an
userspace cmpxchg() and that should be a write fault already.

For example, I did some stupid hack on the test and I can trigger the write
check fault with anonymous easily with an explicit cmpxchg on byte offset 128:

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index 74babdbc02e5..a7d6938d4553 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -637,6 +637,10 @@ static void *locking_thread(void *arg)
                } else
                        page_nr += 1;
                page_nr %= nr_pages;
+               char *ptr = area_dst + (page_nr * page_size) + 128;
+               char _old = 0, new = 1;
+               (void)__atomic_compare_exchange_n(ptr, &_old, new, false,
+                               __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
                pthread_mutex_lock(area_mutex(area_dst, page_nr));
                count = *area_count(area_dst, page_nr);
                if (count != count_verify[page_nr])

I'll need some more time thinking about it before I send a patch to drop
the write check..

Thanks,

-- 
Peter Xu

