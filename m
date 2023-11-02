Received: from xmbgsz5.mail.qq.com (xmbgsz5.mail.qq.com [113.108.92.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A5E1642F
	for <llvm@lists.linux.dev>; Thu,  2 Nov 2023 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="g4M9jZMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1698935318; bh=vXlKBRHvNub2ggaMH+0mx9+DOFMDH691qFaLcYjo3U0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=g4M9jZMW9yu3GeHTsFwzkbAvys6V/U1Es5roISQw479K6l/sd6g+CGBHI5Og82414
	 QS6ZUCL3AlYQRdss9DsA4dqeWotbYAqljRW1EFgqBZaVaufUNQXAitljqHZGy9aplw
	 8Ubc4pvBU8SFRSaYAWOOEuSRLHUNhz3Z0dWxI9Mg=
Received: from [192.168.71.17] ([114.93.60.151])
	by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
	id B9FA8EA5; Thu, 02 Nov 2023 21:46:31 +0800
X-QQ-mid: xmsmtpt1698932791t0qal6u3j
Message-ID: <tencent_43E55580901FF6162FFFE418CFA7BFE3C80A@qq.com>
X-QQ-XMAILINFO: NvKyM24IHTKStqgV7c37iClZzhL/cIwwLQgieaaeU/XLgSwja/hd4K53MSEufe
	 VIFjoE5Th3QXClreifDw1wEUQiEkUIOi7O20Jyqj33tK0ezezSdCDyjmxB/1yJN6MKCvxAwH/Y6K
	 ixN0TNLMySRlLLHd0kWrdoK8X2xcvR/Bsa939O9kp2yyjJtwTKJR728DpSJlKIUHH8DRnQ/SoZE0
	 R70yqQfWYLyfd3Nuv8gwXxmyj51vGGA3qXQxBbLV+yGx5YpHHWwN4gJNMjydFSW3WsnPZe2nAqBW
	 irM4PGicEZT4lc02lUlOyJbANn7uPtOOYIihXsLcsbQ+B7wHpBAUqicNrOEr4cOzUoDvKdj8YeB1
	 gr2Rs7Ej925+/PQU1jOoBBNx3NWj6EK18WH9F+FPM2mJ2b0YzeABTQpjPXZvmvKPYTpT190VJjBq
	 x5yDkpufid2moIYqGVTDRp6F/3M1ndWZBdDv27nLvLo9zdxA26FYpq6D1O7cIYAaAyKIN/olpwIH
	 /Xyg+egLH3CuHBv7sV7eV0bpkR83b/nA7/pFBkk7ns9YgepPVlWtYJcpo+ZaxMR6uwSpgV3NkYQ1
	 uw2Twu4VcvIUM7af60QQQRF8DsHs21C36UM7MO2/tzD+ACnt++abLMqBlSAygoE77tG/WCvQoPTo
	 /56a3rvPxd4BWIGu1YqBy/z/REJixYakzTp8CnjXNdSkfc7za+X+/2xGIlsCUr9mUl+y3qHLXsd6
	 uN+4I32DlZLIjdmNMP4rchOJvrqAcYL3XgZdkk1IbDkdjoSeIXoJBvXnBHJpUmSc6SFl9yXcp042
	 ELQiFuFMPtezKBrjGsX5+dDnWd15K0zZc83+IDsemXZ7LOVtwbxPpKH4aYIIk2pNQj/u8PBIYWn2
	 eegbBUvw6GfyLvb8iUTCk2tEn5pYeWs5ZHfYn3GPoRXUBqRKM8Rkm3J25Pys4ZmHaCZF4pshkl9P
	 148ClhVSE5xscviXy1jRjYWXKkcIIWiRfDmTxttSTzZw5KYcd26uF/3pc5bFjT
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-OQ-MSGID: <47c865e2-fb34-4634-aec3-c08110cd9f0c@qq.com>
Date: Thu, 2 Nov 2023 21:46:31 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: fix null ptr defer in hugetlb_vma_lock_write
Content-Language: en-US
To: Rik van Riel <riel@surriel.com>, Edward Adam Davis <eadavis@qq.com>,
 syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, llvm@lists.linux.dev, mike.kravetz@oracle.com,
 muchun.song@linux.dev, nathan@kernel.org, ndesaulniers@google.com,
 syzkaller-bugs@googlegroups.com, trix@redhat.com
References: <00000000000078d1e00608d7878b@google.com>
 <tencent_2A675773C6D47370E36A4966A3BA2444F705@qq.com>
 <3382634358afa9b95dc4f6db8a53a136d4b9e9cb.camel@surriel.com>
From: "Yin, Fengwei" <nh26223@qq.com>
In-Reply-To: <3382634358afa9b95dc4f6db8a53a136d4b9e9cb.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/11/2023 22:27, Rik van Riel wrote:
> On Wed, 2023-11-01 at 14:36 +0800, Edward Adam Davis wrote:
>> When obtaining resv_map from vma, it is necessary to simultaneously
>> determine
>> the flag HPAGE_RESV_OWNER of vm_private_data.
>> Only when they are met simultaneously, resv_map is valid.
>>
>> Reported-and-tested-by:
>> syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com
>> Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private
>> VMAs")
>> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
>> ---
>>   include/linux/hugetlb.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index 47d25a5e1933..1a3ec1aee1a3 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -1265,9 +1265,11 @@ static inline bool __vma_shareable_lock(struct
>> vm_area_struct *vma)
>>          return (vma->vm_flags & VM_MAYSHARE) && vma->vm_private_data;
>>   }
>>   
>> +#define HPAGE_RESV_OWNER    (1UL << 0)
>>   static inline bool __vma_private_lock(struct vm_area_struct *vma)
>>   {
>> -       return (!(vma->vm_flags & VM_MAYSHARE)) && vma-
>>> vm_private_data;
>> +       return (!(vma->vm_flags & VM_MAYSHARE)) && vma-
>>> vm_private_data &&
>> +               ((unsigned long)vma->vm_private_data &
>> HPAGE_RESV_OWNER);
>>   }
I am wondering whether this line should be:
    return (!(vma->vm_flags & VM_MAYSHARE)) &&
	((unsigned long)vma->vm_private_data & HPAGE_RESV_OWNER);

or even:
    return (unsigned long)vma->vm_private_data & HPAGE_RESV_OWNER;

because mm/hugetlb.c has:
	"We know private mapping must have HPAGE_RESV_OWNER set."

> 
> This could be cleaned up a bit by moving the HPAGE_RESV_OWNER
> definition (and its friends) into hugetlb.h, as well as the
> is_vma_resv_set() helper function.
> 
> Then __vma_private_lock() can just call is_vma_resv_set(),
> and open coding a duplicate of the same code.
> 
> Not having duplicates of the code will make it much harder
> to "miss a spot" with future changes.
> 
> I am still struggling to find a place where we might leave
> HPAGE_RESV_OWNER behind on a pointer that is otherwise NULL,
> but if your tests show this fixes the issue, I'm all for it :)
> 
Like you said, vma->vm_private_data is cleared during fork().

But I saw following possible code path in child process:
hugetlb_wp()
     unmap_ref_private() if alloc_hugetlb_folio fails
         unmap_hugepage_range()
             __unmap_hugepage_range()
                 set_vma_resv_flags(vma, HPAGE_RESV_UNMAPPED)

vm_private_data become 0x2 which is none NULL without HPAGE_RESV_OWNER
bit.


