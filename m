Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7156823CD
	for <llvm@lists.linux.dev>; Sun, 30 Oct 2022 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667119996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ug3pxX4HPcbNDxJWRXky7y5LLTOMNoC//3Zjo+CrCY=;
	b=BgkZEfhsVIKwo+eUm10XAxvR7om5nBfaKx6iGFCpH6Mm3Rg244DhbKcqrcV4Nzr53hkInY
	EfyenMIyadYG2IgZWaMq1W85/UQdoqDTeO+qfygDdhFV3sg2kxImB5QpNOABFe+O39CZ2D
	pisnzFAtCcjR6ZRAJDE6k5Ka46t9zXk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-WGkXEpcCMNiXL-sqIJgpiA-1; Sun, 30 Oct 2022 04:53:13 -0400
X-MC-Unique: WGkXEpcCMNiXL-sqIJgpiA-1
Received: by mail-wm1-f70.google.com with SMTP id s7-20020a1cf207000000b003cf56bad2e2so1854800wmc.9
        for <llvm@lists.linux.dev>; Sun, 30 Oct 2022 01:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ug3pxX4HPcbNDxJWRXky7y5LLTOMNoC//3Zjo+CrCY=;
        b=3POkj79XyGDS32OaOpWHqF/1Z3KAxjHWyKQjPv9vP9b/7nfd89t4X30iu82qjLQ1x9
         JMsYE5Zf3zXbsQ4BUumfgICza//bHvxKLuoA3gcZg5kQitzn9ha3abBS0UTa2SspGr/u
         Hil/z0GkCuwbxe6FJJSk4lPyaUz6DK7eYm5BkLlA5cqQ1xIYgCPNkO7wtj81GyJSg5Gj
         FC290yWoUQEi+rLfXTFOHQiRz6t+628RDW7idZ4YZUrnPiQUC2MK8op2j57YsPf6gpSg
         ZDvD9p6lF+WBatUYo203zD5cKpRoPLAqx6cmFfRxfkrkmm19A6/xRwIEBU3tkjT18Vsx
         MbZA==
X-Gm-Message-State: ACrzQf2XHfQqH8p5ax0CtjbaRvt7zf3tcleSrDYhT1ktRlM7s/diFr6S
	yndpSFPCZwVh5YWFYQrf/XPPd4P9Tna1iH1nYkj5PjcfhHQTEbcvdgcLGx/xVh8RSj0SD/jyXTU
	N7nQWsmHGOBSv6w==
X-Received: by 2002:a05:600c:1c1e:b0:3c6:fa3c:32a9 with SMTP id j30-20020a05600c1c1e00b003c6fa3c32a9mr14441638wms.203.1667119991857;
        Sun, 30 Oct 2022 01:53:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lZDMsSed4FBRL/Hmhwu+Bl/MfjZMGqk9SKCEp2LGFbK6UB8TlHAzXk7aWZHqw19d4RXP8OA==
X-Received: by 2002:a05:600c:1c1e:b0:3c6:fa3c:32a9 with SMTP id j30-20020a05600c1c1e00b003c6fa3c32a9mr14441626wms.203.1667119991534;
        Sun, 30 Oct 2022 01:53:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72e:3a00:ac1c:31e7:ee53:498d? (p200300cbc72e3a00ac1c31e7ee53498d.dip0.t-ipconnect.de. [2003:cb:c72e:3a00:ac1c:31e7:ee53:498d])
        by smtp.gmail.com with ESMTPSA id bi22-20020a05600c3d9600b003b31c560a0csm3849232wmb.12.2022.10.30.01.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 01:53:11 -0700 (PDT)
Message-ID: <5a434798-9083-c806-4d3c-f0cb4f27e559@redhat.com>
Date: Sun, 30 Oct 2022 09:53:10 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Mike Kravetz <mike.kravetz@oracle.com>,
 syzbot <syzbot+f0b97304ef90f0d0b1dc@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, llvm@lists.linux.dev, nathan@kernel.org,
 ndesaulniers@google.com, songmuchun@bytedance.com,
 syzkaller-bugs@googlegroups.com, trix@redhat.com
References: <000000000000ed009f05ec257623@google.com>
 <Y13GwSF8e6vMyYyY@monkey>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [syzbot] WARNING in hugetlb_wp
In-Reply-To: <Y13GwSF8e6vMyYyY@monkey>
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.10.22 02:35, Mike Kravetz wrote:
> On 10/28/22 22:15, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    247f34f7b803 Linux 6.1-rc2
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=14a9efd2880000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=a66c6c673fb555e8
>> dashboard link: https://syzkaller.appspot.com/bug?extid=f0b97304ef90f0d0b1dc
>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=112217b4880000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105f4616880000
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/de212436b09b/disk-247f34f7.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/63c4feda220f/vmlinux-247f34f7.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+f0b97304ef90f0d0b1dc@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 3612 at mm/hugetlb.c:5313 hugetlb_wp+0x20a/0x1af0 mm/hugetlb.c:5313
> 
> This warning was added with commit 1d8d14641fd94 ("mm/hugetlb: support write-faults
> in shared mappings").  It is there 'by design' as this this specific
> type of write fault is not supported.
> 
> 	/*
> 	 * hugetlb does not support FOLL_FORCE-style write faults that keep the
> 	 * PTE mapped R/O such as maybe_mkwrite() would do.
> 	 */
> 	if (WARN_ON_ONCE(!unshare && !(vma->vm_flags & VM_WRITE)))
> 		return VM_FAULT_SIGSEGV;
> 
> If there is an actual use case for this support, we can look at adding it.

Right, it's by design and in retrospective it was the right approach to add this
check there. We seem to have a way to trigger a hugetlb write
fault without VM_WRITE set from GUP. We have to fence that.


Interestingly, I thought I tried to trigger that exact scenario.

a) Have a MAP_PRIVATE, PROT_READ hugetlb mapping
b) Try writing to it via /proc/self/mem, triggering debug access with FOLL_FORCE

The expectation is that this will fail with -EFAULT on hugetlb. I could have
sworn that it did the right thing when I tried :)


But staring at follow_hugetlb_page(), I think we will end up triggering a
write fault (FAULT_FLAG_WRITE) on hugetlb.


The easiest fix might be to special-case hugetlb VMA in check_vma_flags():


 From 39d2a525cae62e7d2766ecfc4337ed4d59555d9d Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Sun, 30 Oct 2022 09:45:50 +0100
Subject: [PATCH] mm/gup: disallow FOLL_FORCE on hugetlb mappings

TODO

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/gup.c | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index fe195d47de74..b934687efdec 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1076,6 +1076,9 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
  			 */
  			if (!is_cow_mapping(vm_flags))
  				return -EFAULT;
+			/* hugetlb does not support FOLL_FORCE. */
+			if (is_vm_hugetlb_page(vma))
+				return -EFAULT;
  		}
  	} else if (!(vm_flags & VM_READ)) {
  		if (!(gup_flags & FOLL_FORCE))
-- 
2.37.3



-- 
Thanks,

David / dhildenb

