Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D86B13706
	for <llvm@lists.linux.dev>; Fri, 14 Jul 2023 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E/uvTGpdsO84eiBOXbT08FQEwaKw+LLHao9zm8yjSI4=; b=FP8ruYQiZTFFixHtvuSZCr1ita
	rJQGcgxW8kFtC8roPSOdSCvH8bEYqEFlpn/XITGepsrsk6ZA1tFBQUXfpAGXr6CEA5rfBb7Z7HR5b
	PB7zD4r0mmk+R/jllJhh724eFKrz7kMu82qNzjLSMgqTNbxrpRfBCM76EjJrRUf1t3qN+9V7fLE+4
	g+qq3/QVKQa5V792KuCl+vfx5AQlBVPDI6KaNutoEKeG9UOIiexyXlvofL35xGncDqz4E4EK4rr0e
	HL6815YJaDVt3hkTen0eFGsrGj61X8oI/1ZIv0/LkccCAdmJiTzFKzOfsXGVksvAPAQwFzTOhuLhb
	3AllT3NA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qKIHo-0013fW-LQ; Fri, 14 Jul 2023 12:52:40 +0000
Date: Fri, 14 Jul 2023 13:52:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: linke li <lilinke99@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, Linke Li <lilinke99@foxmail.com>,
	linux-mm@kvack.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, trix@redhat.com,
	ndesaulniers@google.com, nathan@kernel.org, muchun.song@linux.dev,
	mike.kravetz@oracle.com
Subject: Re: [PATCH] hugetlbfs: Fix integer overflow check in
 hugetlbfs_file_mmap()
Message-ID: <ZLFFGLQ6H/9RCaVf@casper.infradead.org>
References: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com>
 <65f4c60a-9534-56dc-099f-ee7a96e0ccaf@redhat.com>
 <CAKdjhyBRcCFDiA923x0FLNYzs5vafENm96iAqV2XiDD_eTWBUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKdjhyBRcCFDiA923x0FLNYzs5vafENm96iAqV2XiDD_eTWBUQ@mail.gmail.com>

On Thu, Jul 13, 2023 at 03:55:55PM +0800, linke li wrote:
> > So we're adding code to handle eventual future compiler bugs? That sounds
> > wrong, but maybe I misunderstood the problem you are trying to solve?
> 
> Sorry for not making it clear. My focus is the presence of undefined
> behavior in kernel code.
> Compilers can generate any code for undefined behavior and compiler
> developers will not
> take this as compiler bugs. In my option,  kernel should not have
> undefined behavior.

The point that several people have tried to make to you is that
*this is not undefined behaviour*.  The kernel is compiled with
-fno-strict-overflow which causes the compiler to define signed arithmetic
overflow to behave as twos-complement.  Check the gcc documentation.
