Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191535;
	b=jtNzrIhwu4X9cIng9p7kKSeeVAUWpAMn9N4VPqh6uqLOLF9yWnNZKB8OgjhvGZEOOPYO
	 8za/hU0nnCDRZ2SLMA8vAhKo6TazPxuq5nSlHo6fGc5YVU/E9srBJczJwzCxG3Fp4D4bw
	 0cawWZokchgF5fcpnIq3Jegp5CYlLdEpQBGwoNC9hCdxWlK7ChU1hR70WZfEsKKTNCXJg
	 bEzSwBnTbMKEPj4DoGPahODtcaJIZpM/GQDNZITNiHXrOgpWy4vmDgxRAKvC+TEXjl82M
	 J4P1Xnsr1cyDDiiWmInlW3jVZEop/GRr8FVl5BqXBXaHgW76ytDu1RkRYM6GBStaNfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BrCnzItk6Eo8xbqsyLw/nHqEQlRmEOOyoUz0lwAU35A=;
	b=oZJ964g2YDF64fRIZjX78AgMMoei45h7beYh+Bnlp9rIwhpvd4u3d3ujNsjDJ2dhKxjE
	 FD33dVg7n4rDFb1Kj4Olpq68XlSRFuJotcvn/Op1EOtgAG9JmVNDGFLqWGBmQD63ZKzbl
	 qnfyDvDOG5mcQubKj/sOPBJ47+ulN6hUYvoLwdpctCRZuXF8gpotYyPrLyKLOhupV4s+p
	 d5HhPBKgg+Mxe/MRx7QtXW6mUVy9nI6vJq5ecGC3Ydv1C0ryXJXJD6/9WX6UKEJDwjD0F
	 E3AVhAhjaCSXXzxUA0wcbhUPlQAHdGbhNvs+JQid9NprEsEEjg8esA70P0LSaJoXG0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vk7R7jQ5;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195C60A2607
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 16:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0195C60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vk7R7jQ5
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8504515e9.3
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191533; x=1795796333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrCnzItk6Eo8xbqsyLw/nHqEQlRmEOOyoUz0lwAU35A=;
        b=Vk7R7jQ5H7CepmB/Apx7EzFR7KIblcub38dXHBwcNHpffcUM0ZaJ0DTupfxTI3TPBH
         fl04dsxAFntSLe9LGbcLZiy8YwN6RL+yOwo+YEGoHk6CGVie+vWeg2IXf2t1LrSWE7IL
         6tB7QnikFnTYj5X/8X3aYB+RiLreqbqXffhnmAhK7wbrgjWvB9I9iXOlQVJ2Vj+naaUG
         AtQmJpkW8eqwAMvNw1NLy1EJ00Woyeps6JetIstpz7fZNs7c0Y9hUIEDZeBrrRpX800k
         1fgFNSa8mrw0ddgHb2Yu9vG5UNOMA7rarDW2gznAC0Nqa8J5+J6WjQbS0HGx2xnSgpMv
         J6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191533; x=1795796333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrCnzItk6Eo8xbqsyLw/nHqEQlRmEOOyoUz0lwAU35A=;
        b=0F7NhNm26lzOwYszSxsstGr+dz1kQf6Sm2+H4EdrNP13pu3sSkwZ0beco9q4Gr6KN0
         me1rQat4jK9JvjpRCZdcraAms9ieR0ttEqF2mTT3b4wG6ooS7yo6C0h9Qos87vNdbwIn
         JdUYgyQ6UG+uxAaOhtCHLKLj43Ox9jQ9Zd9f63vKEpEhh0NGMWX9Q4zcRUm/Dl0jPZEg
         vZPvB742cBxbi3WFlfZF1kUMygWdewI/xqkn3jB7WnqQn+iGAYwucB4yarwia9MtdZeG
         426ZdSJ7v3qfW9PS77D3zFIzjFAyW6OqvMuqa+QWObC+Cv/uoE6BiYzLnRyxJ2WuEj1B
         AfHw==
X-Forwarded-Encrypted: i=1; AL+hErF/8YpeMbpIyNGzcczRgHzP1+L7Q3W4lmltbg/WHzWqpOGRPA5XlJZiVPbbzbgRnWbo+y1l@lists.linux.dev
X-Gm-Message-State: APuU4Z84oEHeHAoGbfMDH89V4YNiQ1HsbpIPFfyAC8sy5ztBXA4H7nKM
	RZS8wN+0YZ3vEOy5OV9YpAdUYedNeJloT7tX+v6W7SYE8xLZDVi11NgP
X-Gm-Gg: AYBFou1/U+BnUdr1BM2nVKTcw5INO4OYGV24SSguiVDJhyyMwaGAy8JnIpJ+DIlM05s
	w/5SJXqpxExan1yB5WZc/6l7s9T1+lC/tscODiKePZEaEIJDS08yvP9vnECA3Qm+TnUR1fAmLsL
	7zIcQ6o08f9oJaJgkSSq/FemMot1RPBxh1N9juUENJMSvEd+HXTqeVIgeWzTyQ4NQSCC3Xkpj7U
	lM5775AJ+va+Ev1uho4dS7NsWhjazu+YbexM1vuD1uV2tfNwZNFQay8ADYwhj5uTC1sjyuJNyB8
	Lnmtemi9caw9JRh0vBPHUvPR92N50TA+CwM42PjQ/sH6+yExe/WTC32i3Dv5VpfwA/oJF+HVe9n
	lgiWncpiG+gqo3Q6/Kce0B1sXN43L89LZ38xy7ZHaAdL0x+BeElQaujNswVCRf6SK4CDhobBGnS
	X5HnuOzWzXhYVrDhMtNLjXqPWnFfIU2PfGvcFiDDPAeEu1gy8EJaMPpEtO2vdNTZUurPHjuQBgM
	4OEWJnB3qurlgjWUoS1ezlET9u2nHvqGNJ38WLGvgsaUiHz51bj2kxqT9vKiPyJnYe1HLcEJ2MC
	Ipk3tce1gKQv77oJNakJ29YKPVdoOia3Hol9AqNvChtywZyFDjLxCA4H3cP3J5ddHQ==
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr80104035e9.22.1795191533093;
        Fri, 20 Nov 2026 08:18:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f278dsm47042095e9.0.2026.11.20.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:18:52 -0800 (PST)
Date: Fri, 20 Nov 2026 16:18:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Usama Arif <usama.arif@linux.dev>, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120161850.5b5fec5e@pumpkin>
In-Reply-To: <20261120153539.GW2668564@noisy.programming.kicks-ass.net>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<20261120104534.GO2668564@noisy.programming.kicks-ass.net>
	<20261120140200.53ec2557@pumpkin>
	<20261120153539.GW2668564@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 16:35:39 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Nov 20, 2026 at 02:02:00PM +0000, David Laight wrote:
> > On Fri, 20 Nov 2026 11:45:34 +0100
> > Peter Zijlstra <peterz@infradead.org> wrote:
> >   
> > > On Thu, Nov 19, 2026 at 01:31:08PM -0800, Usama Arif wrote:  
> > > > +#ifdef CONFIG_X86_64
> > > > +#define __stackleak_poison __stackleak_poison
> > > > +static __always_inline void __stackleak_poison(unsigned long erase_low,
> > > > +					       unsigned long erase_high,
> > > > +					       unsigned long poison)
> > > > +{
> > > > +	unsigned long count;
> > > > +
> > > > +	/* Short spans do not amortize the startup cost of REP STOSQ. */
> > > > +	if (erase_high <= erase_low + 512) {
> > > > +		while (erase_low < erase_high) {
> > > > +			*(unsigned long *)erase_low = poison;
> > > > +			erase_low += sizeof(unsigned long);
> > > > +		}
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	count = (erase_high - erase_low) / sizeof(unsigned long);
> > > > +	asm volatile("rep stosq"
> > > > +		     : "+D" (erase_low), "+c" (count)
> > > > +		     : "a" (poison)
> > > > +		     : "memory");
> > > > +}
> > > > +#endif    
> > > 
> > > Gemini seems to suggest 16-32 words would be sufficient to amortize the
> > > REP STOS setup.  
> > 
> > That really does sound like wishful thinking.
> > Especially if you go back a few generations on the cpu architecture.  
> 
> How old? I mean, Interlagos old, sure, but nobody should care about
> performance there I think.
> 
> AFAICT Nehalem and later should be good with the 16-32 words. As would
> all the various Zen chips.

Have you got an accurate source for the setup costs for 'rep stos/movs'
for the various architectures?
I didn't find one last time I looked.
Last time I measured rep movs I was using mfence to synchronise with rdpmc
and that takes even longer - so you only get the per-byte costs.
(You can use data-dependencies which have minimal overhead unless you
go back to to some pre-zen amd cpu.)

You get 16 bytes/clock until Haswell which will do 32 if rdi is aligned.
Icelake might increase that to 64 bytes/clock.
Agner has zen2 onwards at 32 bytes/clock.

Agner also has zen3 and Icelake being able to do 2 writes per clock.
If that is achievable for the writes being done (the loop isn't a
problem) then it also takes a while for the 'rep stos' to catch up.
(Then you have the cost of the I-cache misses ...)

David

