Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83733F2
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664297120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WTa5rbKShIyGoJknw92BfG1x+s2qAF7vnnJsM/DzVR4=;
	b=B6TIVQ4GPArgvF9RElfTrazUomBp0Pc4uT1WPlTMuCLJyugtJBS0yEoXTyotKBToPw186+
	7wmNgiBaSnkipuTx2zAe4+sEkAcC/Wgq0aMQsBbSPp7S/4MAeqiy5okKgbZWanU0Rj7Cml
	Dxx6jMU3qkPLA6fprrU4HKhmcl5Ga3U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-132-75thC4uFMCi0F0p35c04DQ-1; Tue, 27 Sep 2022 12:45:17 -0400
X-MC-Unique: 75thC4uFMCi0F0p35c04DQ-1
Received: by mail-qk1-f197.google.com with SMTP id bm21-20020a05620a199500b006cf6a722b16so7708506qkb.0
        for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 09:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=WTa5rbKShIyGoJknw92BfG1x+s2qAF7vnnJsM/DzVR4=;
        b=bKk/KZkfmKX/tSRl8ZnUSt0B2ro1Btxqh/BmabTQAkliIt5+gRJB1qsC3e5o2SQQOW
         8FCkRscSr9LMsCowEk78JHK145aw6V25V5rTcWGF4NssUrRbBlPjPX3PuuD0cOIJ6dAS
         pnyHIVfr+Nv+FKswzVFVzQmZ2AS5wLOw+Gnbf3MrSPrXnc3qZr3BwlvrYd1GKnPy+WOX
         xFBbNOixggBTpsohedvYPEcWScnaqWKuthS7prgMRv5r+8uDqFIPhLw1RufojoLF9o/L
         KidTz2gIGqETMKfT+2UGCdKChxk1fLoQ0mZvSVHsLT4JMryE20W5VrO0XCXfLY5QRo3/
         g3NA==
X-Gm-Message-State: ACrzQf36GB6uQ6ooaKMisUDRBU8qa4pHtSJWygL1q55pjzEb91aARgKg
	sxpRQUYcKGDiWRQ7qXu4VPXZZmoit08KDR+VW2U7QW1uxVziurm+s8fBoXxpiUBqUmoYMRjVBVq
	hzxfvn2KI04WVKw==
X-Received: by 2002:a05:620a:2601:b0:6bc:70bb:c56b with SMTP id z1-20020a05620a260100b006bc70bbc56bmr18970162qko.416.1664297116778;
        Tue, 27 Sep 2022 09:45:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5AgLFJmBdANYEOVOVCK9odrG/eAgjCtDCyK2CtvVPq8D05QAsmkYI+yJDhMCoTJ31v1Bm/4A==
X-Received: by 2002:a05:620a:2601:b0:6bc:70bb:c56b with SMTP id z1-20020a05620a260100b006bc70bbc56bmr18970133qko.416.1664297116560;
        Tue, 27 Sep 2022 09:45:16 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id a19-20020ac84d93000000b00342fc6a8e25sm1082638qtw.50.2022.09.27.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 09:45:16 -0700 (PDT)
Date: Tue, 27 Sep 2022 12:45:13 -0400
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
Message-ID: <YzMomT+OusJnLOPC@x1n>
References: <0000000000006c300705e95a59db@google.com>
 <Yy4g/BKpnJga1toG@monkey>
 <7693a84-bdc2-27b5-2695-d0fe8566571f@google.com>
 <Yy5WHvioerD2Sev1@x1n>
 <Yy8dBrmvDmqlsRXE@x1n>
 <Yy9T/JmVb4ymf6WM@monkey>
 <YzDuHbuo2x/b2Mbr@x1n>
 <YzMjxY5O6Hf/IPTx@monkey>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YzMjxY5O6Hf/IPTx@monkey>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Sep 27, 2022 at 09:24:37AM -0700, Mike Kravetz wrote:
> This should guarantee a read fault independent of what pthread_mutex_lock
> does.  However, it still results in the occasional "ERROR: unexpected write
> fault".  So, something else if happening.  I will continue to experiment
> and think about this.

Thanks for verifying this, Mike.  I didn't yet reply but I did have some
update on my side too.  I plan to look deeper and wanted to reply until
that, because I do think there's something special on hugetlb and I still
don't know. I just keep getting distracted by other things.. but maybe I
should still share out what I have already.

I think I already know what had guaranteed the read faults - the NPTL
pthread lib implemented mutex in different types, and the 1st instruction
of lock() is to fetch the mutex type (at offset 0x10) then we know how we
should move on:

(gdb) disas pthread_mutex_lock
Dump of assembler code for function ___pthread_mutex_lock:
   0x00007ffff7e3b0d0 <+0>:     endbr64 
   0x00007ffff7e3b0d4 <+4>:     mov    0x10(%rdi),%eax       <---- read 0x10 of &mutex
   0x00007ffff7e3b0d7 <+7>:     mov    %eax,%edx
   0x00007ffff7e3b0d9 <+9>:     and    $0x17f,%edx
(gdb) ptype pthread_mutex_t
type = union {
    struct __pthread_mutex_s __data;
    char __size[40];
    long __align;
}
(gdb) ptype struct __pthread_mutex_s
type = struct __pthread_mutex_s {
    int __lock;
    unsigned int __count;
    int __owner;
    unsigned int __nusers;
    int __kind;                                              <--- 0x10 offset here
    short __spins;
    short __elision;
    __pthread_list_t __list;
}

I looked directly at asm dumped from the binary I tested to make sure it's
accurate.  So it means with current uffd selftest logically there should
never be a write missing fault (I still don't think it's good to have the
write check though.. but that's separate question to ask).

It also means hugetlb does something special here.  It smells really like
for some reason the hugetlb pgtable got evicted after UFFDIO_COPY during
locking_thread running, then any further lock() (e.g. cmpxchg) or modifying
the counter could trigger a write fault.

OTOH this also explained why futex code was never tested on userfaultfd
selftest, simply because futex() will always to be after that "read the
type of mutex" thing.. which is something I want to rework a bit, so as to
have uffd selftest to cover gup as you used to rightfully suggest.  But
that'll be nothing urgent, and be something after we know what's special
with hugetlb new code.

I'll also keep update if I figured something more out of it.

-- 
Peter Xu

