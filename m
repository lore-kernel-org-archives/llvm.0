Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDA47F
	for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 07:29:12 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id l7-20020a056830154700b0065563d564dfso1392678otp.0
        for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 00:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date;
        bh=ZsVr0q7yabDdKFmE4b0RvYJDpC4ReAh7J6+IaRkZIac=;
        b=MgP3Bi14j1EF47j8QRIFn8p0mfiL4/3LY6SQNRqnp1QBkgKiPN0SgFnSU1m6htUBMH
         q9DRtpuc86QAspRW4NWxak+QLSzUG+L+hmdnFEjJZ9Ueaq/JfM2nSD/K9CWPOZzyEU9i
         fpyjZIXHufF3pdQI4jcY2Z8OEomcx4fN99nFQejM3QptJwSd3KGiAxwTnT/4C6dPD1dp
         luG4+GaWZbWvbPC2QgUw/zZu/wYeR/F/Br/TbjMxn98k9YY0KTSSrhkpO/HImWNVduMs
         6xnZKp0W9GtlRhzsUiBtzO5kj9ZO7/9IfHbzVu4nQFX8QUvHJCWUPScUyKnfE9STBnzq
         QrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=ZsVr0q7yabDdKFmE4b0RvYJDpC4ReAh7J6+IaRkZIac=;
        b=mv0AzKRsVJmZNq4IRQHPticpX33gClyYsv26mcOa091XPmPgHh1MgBFdSzx0Hs26fu
         TEd12HDffTUtN6ip/fT2Z+BxAS7CfV+oYOjLcLQpfBuO1HKRtbof7/+aEh0JDhu/nWKr
         Fa/6+TcbtH/6fk5hnUccJgWLe7TlCn+Dx79ArwqdcOQ55rTRoX6n+XWcbMGJTMM3McaU
         zNG+wmL9EyhMYV0foYTmSL1KE72Uexwn6K7V/S5xtrnm/ZxyZZKI2TLoqtEaXnxZBagt
         f787a/qe/vyC4CV0ogvVeW86GBy38BJBUZXHccXSF3i92OnswpqwbMhXbw7nqkWP8/vz
         4XFQ==
X-Gm-Message-State: ACrzQf22fRs2JEIG/iZdHheT1qOudjonQ9pT96CDHW5nNHu3QV9PGqnB
	rz0WNu9YnI72od1ik7FJMlW0ZQ==
X-Google-Smtp-Source: AMsMyM7rHX9avXVvGti6b14/UhSMtpCFTnD4H/T7tGZQ0DnOKU/conEyd8/+GV2Sa0mhjuKYTnQ/KQ==
X-Received: by 2002:a9d:150:0:b0:659:f778:3b90 with SMTP id 74-20020a9d0150000000b00659f7783b90mr5552597otu.183.1664004551986;
        Sat, 24 Sep 2022 00:29:11 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id m9-20020a056870a40900b0011f390fdb0asm5883375oal.12.2022.09.24.00.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 00:29:11 -0700 (PDT)
Date: Sat, 24 Sep 2022 00:28:52 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Nathan Chancellor <nathan@kernel.org>
cc: Hugh Dickins <hughd@google.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
    Peter Xu <peterx@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
    Yang Shi <shy828301@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
    syzbot <syzbot+152d76c44ba142f8992b@syzkaller.appspotmail.com>, 
    akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, llvm@lists.linux.dev, ndesaulniers@google.com, 
    songmuchun@bytedance.com, syzkaller-bugs@googlegroups.com, trix@redhat.com
Subject: Re: [syzbot] general protection fault in PageHeadHuge
In-Reply-To: <Yy5M0Ht6X3hFuq/S@dev-arch.thelio-3990X>
Message-ID: <ff6b391-9ec3-56a3-694c-c1954bde146@google.com>
References: <0000000000006c300705e95a59db@google.com> <Yy4g/BKpnJga1toG@monkey> <7693a84-bdc2-27b5-2695-d0fe8566571f@google.com> <Yy5M0Ht6X3hFuq/S@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Sep 2022, Nathan Chancellor wrote:
> On Fri, Sep 23, 2022 at 05:14:38PM -0700, Hugh Dickins wrote:
> > 
> > But me, I cannot even get the latest linux-next to boot: next job.
> 
> Maybe I can save you a bisect:
> 
> https://lore.kernel.org/all/Yy4GoMMwiBaq3oJf@dev-arch.thelio-3990X/

Many thanks Nathan, yes, you did save me a bisect with that link.
And I managed to get a patch to revert the badness,
I'll reply there on that thread now.

Hugh
