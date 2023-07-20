Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73D4182C0
	for <llvm@lists.linux.dev>; Thu, 20 Jul 2023 14:13:40 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b734aea34aso12540021fa.0
        for <llvm@lists.linux.dev>; Thu, 20 Jul 2023 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689862418; x=1690467218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ERQ0Qu3T6Bz3k+ywQiOUif0b4ZsQ7lChxmwFwBw8hTs=;
        b=HSBJvB5Cd67p4JvLMey/aDWMBCFn6p1aofMqSm7puXk2Ghe97RK1IUwyT6UeEcagmt
         B8vCUMxGdt03qsSm2JDLEOeYj6H9FosR8gPhmQ6SoMRYcvbEpSs+O/vOG8h0AQkFlAaz
         R4cDr1oN0ubZLBRmJWWgGUlzR4z932clQBBY3uJ9ywJIW8WCU0korUD/d1k0Ml8dzzTc
         r6q4hd4x/meKCqpCDr6JrjKIo+NozsTwnXXaI14miR1xwv9klqL99XDDcY70E6oqsbO4
         pIv5z8jI58a6jpZkME/nitDks7wnthn9AsUerus6IeW2wwvLxVbuqUqDxOhnpkAU4JZw
         IrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689862418; x=1690467218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERQ0Qu3T6Bz3k+ywQiOUif0b4ZsQ7lChxmwFwBw8hTs=;
        b=bpIZiQpl98b8h58uGoYZrfx4TBJZSciFQJWTS7voNFwwdAuFb06MCdPHlbj9NTUNHu
         YWP6HEs/gCQDZ2rBsYtsq23jA2eSCYdwVQtZKFRFnVRgdbHCastg8U2x2HswSWmAp8UQ
         ZcYpHixiY7nQXZeHItINcnhcBrkfHOyCXMoDzkgI0PEhReEVw1O0uDq/FWVBoDmStbPu
         47g/BxgtxUrAOQ0J7+gvN4Dx8XdG52JVNKGfIM3Q9O+bFVFe2iLbjZwplquExY1tcRde
         tRZGYqyHhcxMQ9BRZpUkdYWlHWWnnazOL5GgFRjjJ98r8vb7mJ3GOAvkZCfzVvRk6RuM
         oizQ==
X-Gm-Message-State: ABy/qLbclhIzTL93VBkDhvn/tPIZNlukgrOjnwWXAHgkfS/ZFWX0TKo+
	A7xVeoxjUWu8y2Ld35dnJt39dA==
X-Google-Smtp-Source: APBJJlHBphGKstGk7EBxhAe0LG1t1rqwF3LxHgC2TQIHknyOF/bOOSmH41DtrjQ6hKYblqDd4QJoEw==
X-Received: by 2002:a2e:9695:0:b0:2b6:dc55:c3c7 with SMTP id q21-20020a2e9695000000b002b6dc55c3c7mr2066251lji.20.1689862418392;
        Thu, 20 Jul 2023 07:13:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n15-20020a1c720f000000b003fc0505be19sm1270545wmc.37.2023.07.20.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:13:35 -0700 (PDT)
Date: Thu, 20 Jul 2023 17:13:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linke Li <lilinke99@foxmail.com>
Cc: linux-mm@kvack.org, mike.kravetz@oracle.com, muchun.song@linux.dev,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Linke Li <lilinke99@gmail.com>
Subject: Re: [PATCH v2] hugetlbfs: Fix integer overflow check in
 hugetlbfs_file_mmap()
Message-ID: <5630f9d8-660f-46ec-8e44-91b00e301bb2@kadam.mountain>
References: <tencent_710619B2865DE8AC059D51A027D919CBD00A@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_710619B2865DE8AC059D51A027D919CBD00A@qq.com>

On Thu, Jul 20, 2023 at 09:49:39PM +0800, Linke Li wrote:
> From: Linke Li <lilinke99@gmail.com>
> 
> ```
> 	vma_len = (loff_t)(vma->vm_end - vma->vm_start);
> 	len = vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> 	/* check for overflow */
> 	if (len < vma_len)
> 		return -EINVAL;
> ```
> 
> There is a signed integer overflow in the code, which is undefined
> behavior according to the C stacnard. Although kernel disables some
> optimizations by using the "-fno-strict-overflow" option, there is
> still a risk.

It's not a risk.  Better to say, "although this works, it's still a bit
ugly and static checkers will complain".

I wouldn't have commented on the commit message except that this patch
checkpatch warning so you're going to have to redo it anyway.  Run
scripts/checkpatch.pl on your patches before sending them.

WARNING: please, no spaces at the start of a line
#49: FILE: fs/hugetlbfs/inode.c:158:
+    if (check_add_overflow(vma_len, (loff_t)vma->vm_pgoff << PAGE_SHIFT, &len))$

WARNING: suspect code indent for conditional statements (4, 16)
#49: FILE: fs/hugetlbfs/inode.c:158:
+    if (check_add_overflow(vma_len, (loff_t)vma->vm_pgoff << PAGE_SHIFT, &len))
                return -EINVAL;

total: 0 errors, 2 warnings, 10 lines checked

regards,
dan carpenter

