Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA171F4611
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741083501; cv=none; b=i/lrMEVI6vVajT8iUXdK/v8SdXKt0F4J9UFyjF3gGAaazC1Emv3OoL2pPr6fKYweoTKIgSSZ/khjYYpaJAqypDQfVXNsEf/EKSxUcHik8K2cl4VCpCZnjv9swjt0k9Y9r7fVw/VxVFpTxPraESGv400Kggiat6NehDXgiah40Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741083501; c=relaxed/simple;
	bh=Bfnzv1Cy+QaLm5BRN0VgsvZutnU9et4W4XCIe4/LVvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE/52gMYb/+PO9RqDXuT0Fu6nPwfUD3P34/Be1zXrWasxfx5uMhirlTTVco6X/Zrs1yop9fdAdHmronpy2UaJmxC4E6SOZ7sNxhEoFcbZj/M3Mvbdew4+lL5/c3AUYaw/HyA00umSZTAHUY3kPY3Pl5CcqB17Pol43ZUdbwexSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ajKHvtec; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ajKHvtec"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-438d9c391fcso47165e9.0
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 02:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741083498; x=1741688298; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cHHGVIwYUugRFpPbUWW4QxwSvbgE0LZxVDWqc5K4qXA=;
        b=ajKHvtecmxAE+txSy1J51hbQlVeVgG+IWkY9SCpbiLOpOZRB6kcGAyH4/4oDZslkaE
         pGwqI3YybLgMd4iw7xk7iKohY06O8kYEWOkQzCEHe3Y7ETEVYm0JhsOcf0LNNsjDlNRG
         hjZLVaHyp4zfIcNZT3C75p9p62VgghN1fxnope4XwZ/ui69RwXep8vgqIZBCJ6zT5llp
         0tGAmhB/yW/5ky0wS1KTVmaabHksejejCASL96tzmOi9b7IFDQwWY1iSt8KdPiKnKqAo
         /UrPvkfJs+wmCTAvrKLZ/SZ9khWWKp+bqyuyW6mRWKfABtXEHPWxNzZ6r8s/jbN0Lv9G
         loNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741083498; x=1741688298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHHGVIwYUugRFpPbUWW4QxwSvbgE0LZxVDWqc5K4qXA=;
        b=E/P4d8lo6bIHJkBp0EH4ByXEymi5exsj7+kkLF8Assa5JWAW+KKIqTycpFzQbw/gYB
         LE0RpEllyEdkZikefHB9o7PldD5UDAwx1mrv9JAu0VtN0P2uVGm5vufWhacAjfAcmF8L
         ZkJPQmqKySJFZnLYrmTPDGWoNIPzqKVKixGwtPYLQAL+5Mdxjp7dNZabSKhfp4xbssG9
         wqBD4tJefXU9pMRxSWAQ3kZoqK59rwFWXczZE80C4RxYRf0hTNFs7SpFuFDv7fcs6NdC
         Y2iiZ9G1uA1tUE7n9KwHDz+JdY2vlDu3f3XPfOtfR3ryCN48OCawKvQt56xqL+w+0NAr
         U71g==
X-Forwarded-Encrypted: i=1; AJvYcCVpw34uS3ZYGg7oiewfMrPtNpjgpuIdFfgXTq6x6Bhh4NNKM9iqRJ1thYnrOTqL3GBrQG+u@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Rly8uF76CVK1amZYV5WwA+4gIsSAlZY0bzOnM62EgdnmIGYI
	933wBULQzWNZFy5pEa7eSVJ3fUKvTvkyRoArpSK9W8lw8Kjxaqm8g0N1vM44wg==
X-Gm-Gg: ASbGncsdtClX7XNY9MJ3B8cT/YsmebJ3Trae5IR0YxIPIdx+SwTb0Kdphx09kQ73wfQ
	Ef0c/jo9DbsTXxaqqL6+2FMEH6BWUifkDEUU41FodzHaW8YbtPQnnTmWP0xOSnWcgUnhofG1QyH
	p9fjVyBS5xYgWdfz20SeZ+lBvlT58j4VSZezkH+saxawPIaiW2eOb4s1OqLf9cdoNXCiHQ/95bP
	74CWIMnxuh7kECe7JMdDcV4/3xhSmg+KspxJGQ/+K0EhPpdWKTTy9P3uOFdUv/C+v7I95apCin7
	k4oBloAA/NDVWBEaCJYiTIJMliyV4jyLhM7ph5U9CbW+B+5GlXcV+9Id3cFNPIjyLByTHnUl3sm
	tfu1A
X-Google-Smtp-Source: AGHT+IF1PXtKs5JYeKClxwK1lAzDe1Sy+Hic0+WUm5WKWP2ZPJezaTOmzVJ6ghefB6dnk3leGQIlaw==
X-Received: by 2002:a05:600c:43d4:b0:439:9434:1b66 with SMTP id 5b1f17b1804b1-43bcbe262d7mr789425e9.1.1741083497923;
        Tue, 04 Mar 2025 02:18:17 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com. [34.78.232.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7dcfsm17460567f8f.55.2025.03.04.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:18:17 -0800 (PST)
Date: Tue, 4 Mar 2025 10:18:13 +0000
From: Brendan Jackman <jackmanb@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: Add lockdep assertion for pageblock type
 change
Message-ID: <Z8bTZVYd0fJLbgl7@google.com>
References: <20250227-pageblock-lockdep-v1-1-3701efb331bb@google.com>
 <202503010129.rJvGqZN1-lkp@intel.com>
 <20250228182804.GB120597@cmpxchg.org>
 <Z8WQEpv7BNtDDoH3@black.fi.intel.com>
 <20250304101357.66067dd3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304101357.66067dd3@canb.auug.org.au>

On Tue, Mar 04, 2025 at 10:13:57AM +1100, Stephen Rothwell wrote:
> Hi Andy,
> 
> On Mon, 3 Mar 2025 13:18:42 +0200 Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> >
> > On Fri, Feb 28, 2025 at 01:28:04PM -0500, Johannes Weiner wrote:
> > > On Sat, Mar 01, 2025 at 01:31:30AM +0800, kernel test robot wrote:  
> > 
> > > The patch is missing a dummy in_mem_hotplug() in the
> > > !CONFIG_MEMORY_HOTPLUG section of <linux/memory_hotplug.h>.  
> > 
> > +1, I just stumbled over and this is not fixed in today's Linux Next. I'm
> > wondering how this was missed during merge into Linux Next. Stephen?
> 
> I just get what people put in their trees.  There are no conflicts
> around this and none of my builds failed, so I didn't see the problem.
> Has someone sent a fix patch to Andrew?  If so, if you forward it to
> me, I will add it to linux-next today.

Andrew has backed it out of mm-unstable now. There's a v2 [0] which
still has runtime issues but AFAIK it's not in any tree yet.

[0] https://lore.kernel.org/linux-mm/20250303-pageblock-lockdep-v2-1-3fc0c37e9532@google.com/

In case it helps calibrate expectations: I think this particular patch
had been reviewed but in general some patches get into mm-unstable
without any review being recorded at all. My understanding is that
Andrew squints at it and goes "that looks like it will probably
eventually get merged" and puts it in so that people get a view of
likely upcoming changes.

So if an issue like this reaching linux-next is a big problem then I
think the solution is not to merge mm-unstable. I'm not sure how
high the bar is supposed to be for feeding into linux-next.
