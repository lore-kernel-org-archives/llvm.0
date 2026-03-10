Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F392FE079
	for <llvm@lists.linux.dev>; Tue, 10 Mar 2026 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154356; cv=none; b=u4SrlMQahacN1yUZOdMWZk5QDyPLq1tUfSLvZDqGNb14yqRY6paJkT4rvGdttSiiKy7+sA+pDrQjkRJdfZs3VAXh/Fmej26eC3iw+m0t2spKx17OlQ+SkCvJ2ebHIvwRvy26Ukyx6Bndtr8H1/yltPF7rkKlZL150pRJ7t5wX9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154356; c=relaxed/simple;
	bh=nNT08OXZ+foj3c8qL6cEktLfXz4SEfmFoLf3u4thxeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NBgUo23sOt8Vde/40Mchp+CqJcFV+TxUA8DI6jVYcJXfhAHKVwWYr66BRXjGazNUXIglDaabk9sCRMcSTN8FFpP1D7uQF38sNnddbcSjqDydCN6uyQFO4aGm5FYOgBntcSGkgvqryxKTO9Nvhb7TRmhM4sXOuoOHd66HtZyUJ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkH8WyQx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkH8WyQx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so109350515e9.2
        for <llvm@lists.linux.dev>; Tue, 10 Mar 2026 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773154353; x=1773759153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml1c+QBVKH1G4D7WQDxLbH41bxeuoQxcf06ZreXxasU=;
        b=HkH8WyQxlKONg9L/wr2QIAv8FFXVsqdsCHVZ5J4p+TeUmg7jiRa4swC5IVaCx/XVD9
         vil4feWQc8zk/BPTiK4Ctn46nrTLUypFUW8gxXg2wrJA0iM8rCvf+MrOaiOJRofMiNad
         ON8e2nPDtAqhiyXNTpCSG5Fo9tV78gMBGRmW+MEppdz6rCBIIA7CKWVZrSCPba69XTWf
         X0W5PdKYdG9ynlFjXnCxwBmqiae8nNidPDuXXwU5lEUItWEiHT6/fN/oBLQEwJd+91QS
         L7y62hxSnhi/cm2vRwlRWb25Gt4JhBsh091QweS6IfTDlafvZQ5Z3r3/lN76lKKAQo6d
         aPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154353; x=1773759153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ml1c+QBVKH1G4D7WQDxLbH41bxeuoQxcf06ZreXxasU=;
        b=Nxc7qvw0zEG3v6b1DwBPIX8n7/rhAlQL1QOcdzDEaD7U1MeGmrffXlXCu2M+4xnkZ1
         pNctPYxz312up3FFOQU9WBWHplh1SKtrDLGbqhuPFipWc46XavQFk2Kbb9ZQPOvp0xyF
         YlHvjoBER44NmaSkDHioi+Dm9PlW2nFxc+iX2oJumvHOMpvHSLWwYKrNlpX+5jHbl8NS
         rrpDfT4Vo+V2xMfvS03gGnoKPZtymHUCtrJbnQtqVlZyHsE+fLsSgurZzhT5dhXAOsTt
         2enDHTN03WyNv5Q5lSiVOJQs4dGo7/AvSy2eSritTRscRwW8f28ZvBmnIjXzMYyF0mhW
         tXCw==
X-Forwarded-Encrypted: i=1; AJvYcCXy4uOHlqxVqBGcUETCDwzH+V29XDkDy/C1UutlInLMvBibErLPFuFgS6nxDIyc8HnEdarV@lists.linux.dev
X-Gm-Message-State: AOJu0YzG1dyNfIfAOzPgW+jLPzxfAO74llrs90O3mUGzQuJTEcE2jqPu
	O+JV9XOwOpNW/klIXH1hwXC8zqKoDbfOxvy0UhGdfogSBGATHjNI6Fvt
X-Gm-Gg: ATEYQzzgJz1bJamJqDiEF4g2vfmR1x5mpB3eijSUMRrvb964AMNCAFJCeDUG8CfLAH1
	J17hKtL7pCOh8QsXwGoSD0KX0kpxwJSp7Juemgsgv4osPOOQRajfXZ/dg6Zzc1P/QHpuzxS5FCj
	aQgDc2/+ShFNjSuopMXFRHJ/fJDuensAmgSCix71tsyHN/H5f9L0wan/jklI58jpnRrgVpRSuZh
	5ArCU+WzarQpoAXCN00j4qst/FG5HhkcBBfkk58vryo9BkrwM0kAvMH0OicbWbLjfwyRKPCDsIV
	9SO+Z53ZjxlQHLfzLTxaxerAMsNs7SXbyvFfPjnW6XExuPfNKkQKY51W9+HShQMblRx38Hhd8uR
	G52tSU+6WANMGHYp3Dl7vZc2vz0KO7hNpsRCta5cfBE1G/qhPfcagbQ8fq5odgMH68XW2e5Mv2F
	H2dkcvpBrIskEaJCj3FddsHP5spEAYb87UvdQ3V5roE/qFedqEb1i3oeffiZVVIXPz
X-Received: by 2002:a05:600c:8b5b:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-485269305e5mr250455895e9.13.1773154353218;
        Tue, 10 Mar 2026 07:52:33 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada3b43sm37635135f8f.13.2026.03.10.07.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 07:52:32 -0700 (PDT)
Date: Tue, 10 Mar 2026 14:52:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Xie Yuanbin <qq570070308@gmail.com>, willy@infradead.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, david@kernel.org,
 justinstitt@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 ljs@kernel.org, llvm@lists.linux.dev, mhocko@suse.com, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, rppt@kernel.org,
 surenb@google.com
Subject: Re: [PATCH] mm: optimize the implementation of WARN_ON_ONCE_GFP()
Message-ID: <20260310145231.1680db9b@pumpkin>
In-Reply-To: <be647d6b-9bcb-41c8-bfcf-7fa03d2b942f@kernel.org>
References: <aa7p3eQfEuh2wObQ@casper.infradead.org>
	<20260309155933.41179-1-qq570070308@gmail.com>
	<be647d6b-9bcb-41c8-bfcf-7fa03d2b942f@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2026 11:55:55 +0100
"Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:

> On 3/9/26 16:59, Xie Yuanbin wrote:
> > On Mon, 9 Mar 2026 15:40:13 +0000, Matthew Wilcox wrote:  
> >>On Mon, Mar 09, 2026 at 11:38:11PM +0800, Xie Yuanbin wrote:  
> >>> As shown in the commit message of commit 242b872239f6a7deacbc
> >>> ("include/linux/once_lite.h: fix judgment in WARN_ONCE with clang"),
> >>> the code "unlikely(a && b)" may generate poor assembly code if it is
> >>> actually "unlikely(a) && unlikely(b)" or "unlikely(a) && b".  
> >>
> >> Why fix this in multiple places in the kernel instead of once in clang?  
> > 
> > If a and b is both unlikely, then "unlikely(a) && unlikely(b)" will
> > generate better code than "unlikely(a && b)". This is also true for gcc.  
> 
> What are the details of how it's better for gcc?

I'm not sure about that specific case, but I've definitely seen gcc
generate sub-optimal code for some un/likely() of compound expressions.
The underlying cause is that the code is (probably) first transformed to:
	bool tmp = expression;
	if (unlikely(tmp)) ...
this means that you lose some of the short-circuiting that happens
early in the code generation of 'if (expression)'.

It is also not at all clear what you want the compiler to generate.
For 'unlikely(a || b)' you want 'if (a) goto x; if (b) goto x' so that
the 'likely' path is the no-branch one.
But for 'unlikely(a && b)' you still want 'if (a) goto x; y:' which means
that the 'b' test is out-of-line and has to be 'x: if (!b) goto y' to
avoid a branch when a is false - but that means you have a 'normally
taken' branch after the test of b.
That pretty much means the compiler has to decide which unlikely()
to ignore.
So it only makes sense to do 'if (unlikely(a) && b)'.
Indeed even 'if (unlikely(a) && likely(b))' may be better!

	David

> 
> > As for the issue of clang judging twice, I have already submitted it to
> > clang:
> > Link: https://github.com/llvm/llvm-project/issues/167117
> > However, even if clang fixes it, this optimization will not be merged
> > back to the old version of clang.  
> 
> That's life and not worth complicating the kernel code for. This is not
> about making it functional, only about perf.
> 

