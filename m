Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26AD33F5AD
	for <llvm@lists.linux.dev>; Sat,  7 Mar 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772880541; cv=none; b=BZ4xdFxW/P7fxMOGg40z6clTe2K+uz7HsSgOtMp/WnwkJcXtlwCvsCfPPnwDbYtr6g0VohNK48ea7q26WtYF/TERUslj4uDw2XJQHdqGjCjZBehBxipEX0ucwIDyB8vHlQmD/t+phYom9Bf48b/on/AYWOSYXhLWhCzQjbiI2Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772880541; c=relaxed/simple;
	bh=bW3uNLa37AGgpuD3PilSHT1kxQZsv1w6wIpP/h4MEMk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CUWAbpGmITybn8uJWsomDguThADuSOa0HWTYp/Y6p9JUG2XuN9CmH3kZL2g1K7iA+YuSikDHDZxP7tBNTC80+nEIIc2Je7zHrRf1mxuoK3ETBUJfQFS3JJqte9B/c2q/7pO1J1Dl/I3gsY0wydb+OBzG53P/1lFW+16K+Kd1Igk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dV8YnIAx; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dV8YnIAx"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so3846435f8f.3
        for <llvm@lists.linux.dev>; Sat, 07 Mar 2026 02:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772880538; x=1773485338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b14AMZ+66hp6uBXDJUal+aByvvtFKTBOlVI3PBplX1I=;
        b=dV8YnIAxgp+vzuPkJxCOa/J28Z6oJ8dfDq8E6usOaGhYrS27xNF31thiqsZ1/7aO5J
         vUOL4SSOiQQMeVB1ASimB7r7uMuRY6e6371Zx8y8favlR1AmB2dULyRHozr1OrVNK6uK
         ZuBDVkfZMvs1ENU8w0ygYtbwc5AHkZu0U8AFCB1xgv8pGd2HEi4keFtpIbP8NgludrmO
         n+8H7UUYtr85RTc/BWVJHy9LWzUcG4Nr+vMESafQAO1EfPSAbdDNE1AXM9yHAJHhoS+D
         vAh4uEnQglRjUfKZ8Cf8y7EOX3oPI1dF7OvYcJd7xPItRb1qerYPlPdmznQDvxFjOGgN
         Tkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772880538; x=1773485338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b14AMZ+66hp6uBXDJUal+aByvvtFKTBOlVI3PBplX1I=;
        b=XfHxxYlFZDMMMeT7aTbG3b/xr9vlfyllOXesllFTCOip0sMX9HIwhTsbxAMvXSRyga
         eLfvFI9GX67hbwpbsgNo2Y194b3bGr9SsyzSf3BukjvoM2NVtv4v83BcllokmjiAEaqw
         QRAecCD30ZoIJhZmbt0Qhgb0L5HWip7DBmd3YpR+cjcs7yRvRc0Pmj5/TEcfi6WYnTk4
         +ozMLfQsQ+kSysEj0sKm+P+oGprPFhTZRZdmIR7j+2b3FnFgzhp7OWO96vA3iKr3y3nY
         QgHLeefyx2H84xYrF77Q79yEc26OQFz7/eFPW15HsX9+vx4MA0Xf1PI0KED71/N5bWnq
         YwzA==
X-Forwarded-Encrypted: i=1; AJvYcCXe7k92LUfXfhzf0MoI7OP8AXqtMDhxesBaajjsR3JYq3YlHq8mCygo0gr5j4Vm/QwhIda3@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpv5VaM9DtJcHn5Z14EPwME8PkODMU2GB06cvQ2yNvOfaPgA1m
	PH67tzAw7HdLRrbAUCpdtw8dVPhWdfjvC3P3Wvv+2OM//U3wm6FdWK9F
X-Gm-Gg: ATEYQzxyHupRnQakIYrdCOsKD7R2hIiKadcwpC/saaOTq+5ZjdGYbWsJDMmPTrxtkNO
	St53GbVPCHDS5WdUvZpwlJ6OkkDqqMcjVKu3/pOD6vk8URL1bhPYUHMcLfbwTjFKS8qu8fzdv06
	7WmYGSmtBigPEUxTB18HwqHaIsnog7GdAIL6r8urIMNsFcK+k3XIZRuNT4akeELynHRLkxS9oTS
	HmYEfMte8aTojJAhwjLTFW+WiXXIgztxiCY41Nzdz6IKk76aYnJH/ZKu+UUHm7rLoAYNWnCmFEl
	eCFEiiTy+JZPXaQ+glPgvlCI/utj1fGWn0iKgt+P11ZMHy1/Tt38h+3534W1WVQHVTnm3GQ6VeV
	9keKlEgv9o1DsRtk+NbK5zYSSHD7B0581HjM20SPOwT6uwqg0635B0VHkdAAGyl5yUUVZtRyywg
	Fej9ba+sqqu64XptaNn2hPj0+g0/xXY7VbNz9taJwF9b/+ATcM97B8CpzQP9UWOdcrkwSIjQAia
	Os=
X-Received: by 2002:a05:600c:46d1:b0:483:6de6:37ad with SMTP id 5b1f17b1804b1-48526979684mr86005375e9.34.1772880537714;
        Sat, 07 Mar 2026 02:48:57 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237ec557sm62390935e9.2.2026.03.07.02.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 02:48:57 -0800 (PST)
Date: Sat, 7 Mar 2026 10:48:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Xie Yuanbin <qq570070308@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, surenb@google.com, mhocko@suse.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mm: optimize once judgment with clang
Message-ID: <20260307104855.1de4fc28@pumpkin>
In-Reply-To: <aavd4hoAO1DFLuJP@kernel.org>
References: <20260307065405.37473-1-qq570070308@gmail.com>
	<aavd4hoAO1DFLuJP@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Mar 2026 10:12:18 +0200
Mike Rapoport <rppt@kernel.org> wrote:

> On Sat, Mar 07, 2026 at 02:54:04PM +0800, Xie Yuanbin wrote:
> > commit 242b872239f6a7deacbc ("include/linux/once_lite.h: fix judgment in
> > WARN_ONCE with clang") helps optimize performance and size under the
> > clang compiler, but the modification is not complete.  
> 
> How much does it actually optimize for size?
> Note that performance is really not critical here because we are already
> dealing with slow path of debug code.

I suspect that unlikely(a && b) is really horrid - the compiler could
easily generate x = a && b; unlikely(x).
Probably enough to change to unlikely(a) && b, but if it is a slow path
perhaps just remove the unlikely().

	David

>  
> > Port the modification to WARN_ON_ONCE_GFP(), VM_WARN_ON_ONCE_PAGE(),
> > VM_WARN_ON_ONCE_FOLIO(), VM_WARN_ON_ONCE_MM() and VM_WARN_ON_ONCE_VMA().
> > 
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
> > ---
> >  include/linux/mmdebug.h | 8 ++++----
> >  mm/internal.h           | 3 ++-
> >  2 files changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> > index ab60ffba08f5..a167c5aa525e 100644
> > --- a/include/linux/mmdebug.h
> > +++ b/include/linux/mmdebug.h
> > @@ -60,7 +60,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
> >  	static bool __section(".data..once") __warned;			\
> >  	int __ret_warn_once = !!(cond);					\
> >  									\
> > -	if (unlikely(__ret_warn_once && !__warned)) {			\
> > +	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
> >  		dump_page(page, "VM_WARN_ON_ONCE_PAGE(" __stringify(cond)")");\
> >  		__warned = true;					\
> >  		WARN_ON(1);						\
> > @@ -80,7 +80,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
> >  	static bool __section(".data..once") __warned;			\
> >  	int __ret_warn_once = !!(cond);					\
> >  									\
> > -	if (unlikely(__ret_warn_once && !__warned)) {			\
> > +	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
> >  		dump_page(&folio->page, "VM_WARN_ON_ONCE_FOLIO(" __stringify(cond)")");\
> >  		__warned = true;					\
> >  		WARN_ON(1);						\
> > @@ -91,7 +91,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
> >  	static bool __section(".data..once") __warned;			\
> >  	int __ret_warn_once = !!(cond);					\
> >  									\
> > -	if (unlikely(__ret_warn_once && !__warned)) {			\
> > +	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
> >  		dump_mm(mm);						\
> >  		__warned = true;					\
> >  		WARN_ON(1);						\
> > @@ -102,7 +102,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
> >  	static bool __section(".data..once") __warned;			\
> >  	int __ret_warn_once = !!(cond);					\
> >  									\
> > -	if (unlikely(__ret_warn_once && !__warned)) {			\
> > +	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
> >  		dump_vma(vma);						\
> >  		__warned = true;					\
> >  		WARN_ON(1);						\
> > diff --git a/mm/internal.h b/mm/internal.h
> > index 6e1162e13289..52367f52d623 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -93,7 +93,8 @@ struct pagetable_move_control {
> >  	static bool __section(".data..once") __warned;			\
> >  	int __ret_warn_once = !!(cond);					\
> >  									\
> > -	if (unlikely(!(gfp & __GFP_NOWARN) && __ret_warn_once && !__warned)) { \
> > +	if (unlikely(__ret_warn_once) && !(gfp & __GFP_NOWARN) &&	\
> > +	    unlikely(!__warned)) {					\
> >  		__warned = true;					\
> >  		WARN_ON(1);						\
> >  	}								\
> > -- 
> > 2.51.0
> >   
> 

