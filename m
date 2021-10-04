Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47F3FC9
	for <llvm@lists.linux.dev>; Mon,  4 Oct 2021 03:44:49 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id c4so10177344pls.6
        for <llvm@lists.linux.dev>; Sun, 03 Oct 2021 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Niqrq0J1KTVYT0myMYXWMhyJmpkyp9spREFhBg+KqDI=;
        b=Vs1GimwYyLGQzKtDuxp34o1WuR3R2HfwGe1WnKcDrrjDQIkOdowhDMdptbAWAMb2Am
         gRkMS/48iwixZC6HIVkbP9VuQBPrlQp8LwHDCfmkGJ16EFAg7pIMfBw4kyUo4btI/Fll
         06hOXB4QwW2uz6bZEDAtMt2h2KN6Itlw/Z7T3opv1zdJqjvYkzRz2C0PL8hcmLHdvLku
         h4XzLh3wiZHlOt3OF0YI3xpESmtToKP7e4LSk9JA5A2BCXPwgwtNF9wP3X/Nbb3Cb8ee
         ou/YFFSsIVk9k5761cPW0m2jjLosorbWMEwzlE7FGP1UFnbtXkM0AIWtRfaJXd5uknAO
         O+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Niqrq0J1KTVYT0myMYXWMhyJmpkyp9spREFhBg+KqDI=;
        b=VHVY4VDeu6CsGh1Ujv5C4SKQVvl6q5d23u/hNzMrgWuUoD+BE5ea2P34y+ERbfWt76
         KCpQaE7MhBdj+dW18TxvKc5tprxfeDTDTnfsSt7kUs24XjlsioVebrYU9VhD6kAm98ns
         6+zcPSDyWCw+ydMPVnxY+3BfxUXT8wr79PTpoj/Jigrc43taSKSOWx92EQgAc/GzjAsi
         0JGUQtiRuTSPmjlctSvkKasuM4VbwBAgXqVASwxdYzPXZXBZzhusUbktZkTM4qiAjVV9
         HZ03S7Ztph0ERfOTIHk6vp6yCljv6qGXgraAM0oNG0kVrHPeKOWUobwRlmqY87KZPfei
         lOew==
X-Gm-Message-State: AOAM5336KeVl/vzwjtB7Rz0HNBMjMIWpyam4xj7weCZth3ymIV4aKgC0
	Lo4XwMFIsn4cjcvv4B2UtXw=
X-Google-Smtp-Source: ABdhPJyJ+W71sIbsXYWswo225VxJjwNbbyU++d7qQlnxo2gMJ4FQ/hudHyr+TQLXaH2NsH0Dk3jrJA==
X-Received: by 2002:a17:90a:9f91:: with SMTP id o17mr14594834pjp.225.1633319089223;
        Sun, 03 Oct 2021 20:44:49 -0700 (PDT)
Received: from ubuntu ([171.224.177.7])
        by smtp.gmail.com with ESMTPSA id fh3sm13734240pjb.8.2021.10.03.20.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 20:44:48 -0700 (PDT)
Date: Mon, 4 Oct 2021 10:44:41 +0700
From: Nghia Le <nghialm78@gmail.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org,
	nathan@kernel.org, ndesaulniers@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	lukas.bulwahn@gmail.com, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb.c: remove dead store in demote_size_show()
Message-ID: <20211004034441.GA114074@ubuntu>
References: <20211003114113.109463-1-nghialm78@gmail.com>
 <YVm2MHbhEU0b7HPM@casper.infradead.org>
 <ccee8f63-f5dd-6231-5625-a67ad3b80a6d@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccee8f63-f5dd-6231-5625-a67ad3b80a6d@oracle.com>

On Sun, Oct 03, 2021 at 07:36:54PM -0700, Mike Kravetz wrote:
> On 10/3/21 6:54 AM, Matthew Wilcox wrote:
> > On Sun, Oct 03, 2021 at 06:41:13PM +0700, Nghia Le wrote:
> >>  {
> >>  	struct hstate *h;
> >> -	unsigned long demote_size;
> >>  	int nid;
> >>  
> >>  	h = kobj_to_hstate(kobj, &nid);
> >> -	demote_size = h->demote_order;
> >>  
> >>  	return sysfs_emit(buf, "%lukB\n",
> >>  			(unsigned long)(PAGE_SIZE << h->demote_order) / SZ_1K);
> > 
> > I'd suggest this function would look better written as:
> > 
> > 	int nid;
> > 	struct hstate *h = kobj_to_hstate(kobj, &nid);
> > 	unsigned long demote_size = (PAGE_SIZE << h->demote_order) / SZ_1K;
> > 
> > 	return sysfs_emit(buf, "%lukB\n", demote_size);
> >
Thanks Matthew for the clean code.
> 
> Thank you Nghia Le for spotting this, and thank you Matthew for the
> suggestion.
> 
> This is still just in Andrew's tree and subject to modification before
> the next merge window.  I am still expecting additional comments on the
> series.
> 
> If another version of the series is needed, I will include Matthew's
> suggestion.   If not, I will ask Andrew how he would prefer to fold in
> the changes.
> -- 
> Mike Kravetz
Thanks Mike, so we will wait further comments from Andrew and others.
