Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589B15680
	for <llvm@lists.linux.dev>; Thu, 13 Jul 2023 07:56:09 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fbf1f6c771so752224e87.1
        for <llvm@lists.linux.dev>; Thu, 13 Jul 2023 00:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689234967; x=1689839767;
        h=cc:to:subject:message-id:date:from:sender:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWc1kwBXlooW52GInseesObOXCmA4do/WYm4jVF0oTk=;
        b=bK4trt4UL+dxunXDoQNJl8B3ONBnUGkfUVcPUnObBOSvbL98iRsHLOxU+2S3HfTmJ0
         kl0uAZNnG2l7Qa6nlqhRBWsWNaLM+JW6lMrEbl9Bo1+5T5BEQ4G5Nqw8SVF0Sa71PGTK
         sSn0JDdS2PWX8qQT8KzTwXKyTNJXJsw8xVOQcjAmI3NyhpkdcmUhJZLiRBhku5pqfVuC
         l90r6lLvgOLSrYEQk9yHpjb8ZpBfbrIaCyCHS1O1wjKOu6sE6S1JCwMRaZE0EQMXB/q4
         qlIqTiHx56NaD1dxmmia3d94FY5o9gRf3zGwAMxkehD5dDtlIHXXHao4t+6kW5TQBnmX
         4SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689234967; x=1689839767;
        h=cc:to:subject:message-id:date:from:sender:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWc1kwBXlooW52GInseesObOXCmA4do/WYm4jVF0oTk=;
        b=FfXObAPuM+DcCVYRSNimwHU+V67KwsTkjvcxwNA/thyf7C8IQDiN3rFnsOVDTXTRMa
         498bXlxT1prDvqoDKz4kc6ahmL1DVt5qxyknR6nKAtgU4dreZq5kJDe5M/N+LrEA+CU8
         k3fK340GFLj4PvUtZdEEcOuee50SoPkhi+L2QEAp0aARhc+xaLbMn1msFJW+sRXcjc59
         3buUxvd32niEbaCJWrZB72tG99gAVK7loa15H4TBRoJh7nf2t2Tgz8j9oYorwlcQR8ig
         vWcAQu0PZDoo5CVIN7MtdndWZW7dAvFTPaTw7z22niOmvj52gYOltF+CpSvYB74yMX4F
         rB6g==
X-Gm-Message-State: ABy/qLbgZUtLv9IsTEYse28mG0lptFggd8vSLGc7k5rKwT8173sa0PxV
	17g1QCtP6pj2BvFoPv9ijZh9upjFhfk7Qjem6KE=
X-Google-Smtp-Source: APBJJlHIFwdXoq3fEeouuZHA3uRgotwmI8xtAA9OvUeQRBGjHbAdQIve77otqj4pB4KAcLWTqy9vCoLfVILX4h+g9FY=
X-Received: by 2002:ac2:43c4:0:b0:4f8:5f32:b1da with SMTP id
 u4-20020ac243c4000000b004f85f32b1damr515861lfl.24.1689234966774; Thu, 13 Jul
 2023 00:56:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com> <65f4c60a-9534-56dc-099f-ee7a96e0ccaf@redhat.com>
In-Reply-To: <65f4c60a-9534-56dc-099f-ee7a96e0ccaf@redhat.com>
Sender: cl1ntlov3@gmail.com
X-Google-Sender-Delegation: cl1ntlov3@gmail.com
From: linke li <lilinke99@gmail.com>
Date: Thu, 13 Jul 2023 15:55:55 +0800
X-Google-Sender-Auth: mLUbCrxKcTjFCSMauTl1sicDTA0
Message-ID: <CAKdjhyBRcCFDiA923x0FLNYzs5vafENm96iAqV2XiDD_eTWBUQ@mail.gmail.com>
Subject: Re: [PATCH] hugetlbfs: Fix integer overflow check in hugetlbfs_file_mmap()
To: David Hildenbrand <david@redhat.com>
Cc: Linke Li <lilinke99@foxmail.com>, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, trix@redhat.com, ndesaulniers@google.com, 
	nathan@kernel.org, muchun.song@linux.dev, mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"

> So we're adding code to handle eventual future compiler bugs? That sounds
> wrong, but maybe I misunderstood the problem you are trying to solve?

Sorry for not making it clear. My focus is the presence of undefined
behavior in kernel code.
Compilers can generate any code for undefined behavior and compiler
developers will not
take this as compiler bugs. In my option,  kernel should not have
undefined behavior.

I double check this patch, this patch can not solve this issue well. I
am considering a new
patch below. The new patch do overflow check before the addition operation.
```
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -155,10 +155,10 @@ static int hugetlbfs_file_mmap(struct file
*file, struct vm_area_struct *vma)
  return -EINVAL;

  vma_len = (loff_t)(vma->vm_end - vma->vm_start);
- len = vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
  /* check for overflow */
- if (len < vma_len)
+ if (vma_len > LLONG_MAX - ((loff_t)vma->vm_pgoff << PAGE_SHIFT))
  return -EINVAL;
+ len = vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
```
