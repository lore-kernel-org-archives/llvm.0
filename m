Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C433F9;
	Thu, 24 Nov 2022 19:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D94DC433D7;
	Thu, 24 Nov 2022 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1669318398;
	bh=G56naonxExe7awqWZ+LhcMgkDZMstSLkFYMHI57lu1g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SU39a5DBzMXR3TEnheVgcYN0443XrbpK2XZtZmfh8dhOCXZv7H18uGN8Gw1E5LbGG
	 epCdVT9C/k2lKHeqsrKeuGUbhFegzpALqmpA+JpAdW/HI4aPlKaxNYcR6JnYI59I36
	 WqHDawhZv9UwCUt5ZAR4nrlJPcW4T6jstzu+ane0=
Date: Thu, 24 Nov 2022 11:33:17 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
 vishal.moola@gmail.com, Matthew Wilcox <willy@infradead.org>, Jann Horn
 <jannh@google.com>
Subject: Re: next: x86: clang: mm/khugepaged.c:1428:45: error: variable
 'pmd' is uninitialized when used here
Message-Id: <20221124113317.37ca142d58b5e7efecd1facf@linux-foundation.org>
In-Reply-To: <CA+G9fYtMoRLC0-9hnpw6+fb_i-6jqLNQH83Q90JqyXO7aCJwNw@mail.gmail.com>
References: <CA+G9fYtMoRLC0-9hnpw6+fb_i-6jqLNQH83Q90JqyXO7aCJwNw@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Nov 2022 21:07:48 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> LKFT CI system noticed clang-15 build failures on x86_64 and i386.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
> ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu-
> 'HOSTCC=sccache clang' 'CC=sccache clang'
> mm/khugepaged.c:1428:45: error: variable 'pmd' is uninitialized when
> used here [-Werror,-Wuninitialized]
>         page_table_check_pte_clear_range(mm, addr, pmd);
>                                                    ^~~
> mm/khugepaged.c:1415:2: note: variable 'pmd' is declared here
>         pmd_t pmd;
>         ^

Thanks.  Due to "mm/khugepaged: fix GUP-fast interaction by freeing
ptes via mmu_gather".

Jann, I'll just do this for now:

--- a/mm/khugepaged.c~mm-khugepaged-fix-gup-fast-interaction-by-freeing-ptes-via-mmu_gather-fix
+++ a/mm/khugepaged.c
@@ -1431,7 +1431,6 @@ static void collapse_and_free_pmd(struct
 	 */
 	if (vma->anon_vma)
 		lockdep_assert_held_write(&vma->anon_vma->root->rwsem);
-	page_table_check_pte_clear_range(mm, addr, pmd);
 
 	tlb_gather_mmu(&tlb, mm);
 	pmd = READ_ONCE(*pmdp);
_

please check.
