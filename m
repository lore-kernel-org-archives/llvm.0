Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D44E277CB0
	for <llvm@lists.linux.dev>; Mon, 28 Jul 2025 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753730643; cv=none; b=s+6QAznb0YTl3cuDatN9gygDR7ouDZBHhpfPXvmW+pbdv642clgzsrAgccjm/dtlyZje19kd3UQhQxlF0FUzhdSozaEJqS5Rc9dUtTmHai27f1aNUjJ7TXK1ZmwshUlz6WOC4OjwFatJwugCpuJlpFFlBpSkXcbU0PQg1WTAYjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753730643; c=relaxed/simple;
	bh=fPSNOGH7XyRNlYLuvoJbmFgPLyv4gtFTW/Z1XDOcJBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEDs+MsHm5wzuE3/pK/e3hKpEyXbNf3isvHT1XTuDXRcQrwPR67PGx5LGmzDOUQlw2YHpk/JpPkgu6WlCTKMqM9vz9KdkHdLYhQGVn4xmlNdexCzSkeAwDT0wGnJV/WzcdKyL/5DSjSxyOb9xwrOgiuKu9qljQ0UloqWnycpSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OGtTGcWf; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OGtTGcWf"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74b54cead6cso3138498b3a.1
        for <llvm@lists.linux.dev>; Mon, 28 Jul 2025 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753730640; x=1754335440; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3EpnuB7zTUqYSeFqP3vThQ9a5pqY5H3+hi7C80bQ0U=;
        b=OGtTGcWfjEREj2rFEk68AXsQcoIWl+qug3WN2onzp3WOEAX8pzlcvRXwdnFHK8QGgJ
         YbviGnU4tg+r19h/zxIlmE++9lzFSz0KZc8RYal+ttf9UIvFDttromvDy25/BtJ86vES
         9WX6kFORkg3v+XLf29iE/Ws4Rq6EuRw77U36ImQDu+aqi27SjOuwkzocndozO4zNxwVI
         GzGVqiJ70uHCnVDTdTT5hVWIQVq4Q8hKHk5zql39QyB0hQ8+TUWyOaSwSFU1Y5SwOiR8
         gAnBfetEmPEeU3xpGTcV3UqKhmDohBse07sS5npRBN8bevSwRaGSFa5PqhcAWBSXiyX8
         AqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753730640; x=1754335440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3EpnuB7zTUqYSeFqP3vThQ9a5pqY5H3+hi7C80bQ0U=;
        b=ueFMsIXZO+rVe4hws9p5hKwCq7lXypNyVI3VRlaEckKuj4q6q5K6dV8uGSEUS8AdQm
         /rgn+0eWj/yfpzJVdOHYGpdLBxjOGLklngaFfJhcrVFAq3F8eqpEnu/YhPJrQ+7Li6Oq
         g16xRHyvZBYbFylTax9bP3edgNUeyedHmxleU5HJzOdLm5Ay9cSmbruJK8ohPMn5vt28
         4i8wFHa91y5aLEN/BSBX2huLPldFyUwEC16lSsINqZbUGzkK7uApr0NggS6uGjtj4DyE
         0C1AjoVfrR0r+KZmD53GC+wDwAB8HFa/TL6873vAS1YmkWsdcwOy6EZcNn92C7qtCRpG
         dn0g==
X-Forwarded-Encrypted: i=1; AJvYcCVFsdSBKcVUAz7WJ9ecbeCkzXUNZZexL7/VuZuYryX+QBWJqEsdGhoaUOGrNNIZCflfm0hi@lists.linux.dev
X-Gm-Message-State: AOJu0YyS20ctxIUxfu/HHjB73N36WPG2YuQ4lrBCoiV+9pIzrQFj7CRF
	xUg0rlxIrED9N3Si78+thXfzovxWXs5aafTBWbIfuJ0AlBq1M7WcPvHH4ZUmjuGjFUA=
X-Gm-Gg: ASbGncshCnjGt2rc49YPyPVCe9w0tSU2D8UMp6B55PBTZwZSNnPQHcxGrb5rqpxyMlR
	Ek4CGhEdpAa2xnjdQbW2K/hG5phb7EuWapgrKsxHpyzC3RWT8w9/6K0Td3QlfBYs23RBtdmE8kr
	NM7YEVDEYaD8WDnUngR7Kl2h4fzfVSgkxHcOSEYHYag1b8YITbtBOxmrHGa44nWewyNrUp6RmIA
	qCjTJo1FmwGNV9NSu9Su9My8jyEMIHzInmd2mp2Phd7ko5YTJjoOC/sAG6MYSzT2CNoVQc87IxJ
	MioSR7TRl/FqM7eW40Mm0c6o459agXEjZd2+3sNNkFU9P64UHjpJ49ie6N27+1DL2TCRIIA5Ccm
	kYCfk7VhucHKUSJeuxdeoMQOfqK0o94I2
X-Google-Smtp-Source: AGHT+IEBPPMIaQlSu5uKVWCdzZHJc0FhuYbrfheptoNcuXeIv+/Kd5lGGATtoszSal7LwhGI4xAJ2w==
X-Received: by 2002:a05:6a21:6d96:b0:220:9e54:d5cc with SMTP id adf61e73a8af0-23d70190c47mr24772860637.31.1753730639759;
        Mon, 28 Jul 2025 12:23:59 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f67a8basm4451072a12.40.2025.07.28.12.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 12:23:59 -0700 (PDT)
Date: Mon, 28 Jul 2025 12:23:56 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "nathan@kernel.org" <nathan@kernel.org>,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"jeffreyalaw@gmail.com" <jeffreyalaw@gmail.com>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"mhocko@suse.com" <mhocko@suse.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>,
	"david@redhat.com" <david@redhat.com>,
	"masahiroy@kernel.org" <masahiroy@kernel.org>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"nicolas.schier@linux.dev" <nicolas.schier@linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew@sifive.com" <andrew@sifive.com>,
	"monk.chiang@sifive.com" <monk.chiang@sifive.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"morbo@google.com" <morbo@google.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"ved@rivosinc.com" <ved@rivosinc.com>,
	"heinrich.schuchardt@canonical.com" <heinrich.schuchardt@canonical.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"surenb@google.com" <surenb@google.com>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIfOTC6CfyCsaEpv@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
 <aIO8uSqiplnyyNOd@debug.ba.rivosinc.com>
 <a19c1338f2fa4cb19a4f8b7552ff54ded20b403a.camel@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a19c1338f2fa4cb19a4f8b7552ff54ded20b403a.camel@intel.com>

On Fri, Jul 25, 2025 at 06:05:22PM +0000, Edgecombe, Rick P wrote:
>On Fri, 2025-07-25 at 10:19 -0700, Deepak Gupta wrote:
>> > This doesn't update the direct map alias I think. Do you want to protect it?
>>
>> Yes any alternate address mapping which is writeable is a problem and dilutes
>> the mechanism. How do I go about updating direct map ? (I pretty new to linux
>> kernel and have limited understanding on which kernel api's to use here to
>> unmap
>> direct map)
>
>Here is some info on how it works:
>
>set_memory_foo() variants should (I didn't check riscv implementation, but on
>x86) update the target addresses passed in *and* the direct map alias. And flush
>the TLB.
>
>vmalloc_node_range() will just set the permission on the vmalloc alias and not
>touch the direct map alias.
>
>vfree() works by trying to batch the flushing for unmap operations to avoid
>flushing the TLB too much. When memory is unmapped in userspace, it will only
>flush on the CPU's with that MM (process address space). But for kernel memory
>the mappings are shared between all CPUs. So, like on a big server or something,
>it requires way more work and distance IPIs, etc. So vmalloc will try to be
>efficient and keep zapped mappings unflushed until it has enough to clean them
>up in bulk. In the meantime it won't reuse that vmalloc address space.
>
>But this means there can also be other vmalloc aliases still in the TLB for any
>page that gets allocated from the page allocator. If you want to be fully sure
>there are no writable aliases, you need to call vm_unmap_aliases() each time you
>change kernel permissions, which will do the vmalloc TLB flush immediately. Many
>set_memory() implementations call this automatically, but it looks like not
>riscv.
>
>
>So doing something like vmalloc(), set_memory_shadow_stack() on alloc and
>set_memory_rw(), vfree() on free is doing the expensive flush (depends on the
>device how expensive) in a previously fast path. Ignoring the direct map alias
>is faster. A middle ground would be to do the allocation/conversion and freeing
>of a bunch of stacks at once, and recycle them.
>
>
>You could make it tidy first and then optimize it later, or make it faster first
>and maximally secure later. Or try to do it all at once. But there have long
>been discussions on batching type kernel memory permission solutions. So it
>would could be a whole project itself.

Thanks Rick. Another approach I am thinking could be making vmalloc
intrinsically aware of certain range to be security sensitive. Meaning during
vmalloc initialization itself, it could reserve a range which is ensured to be
not direct mapped. Whenever `PAGE_SHADOWSTACK` is requested, it always comes
from this range (which is guaranteed to be never direct mapped).

I do not expect hardware assisted shadow stack to be more than 4K in size
(should support should 512 call-depth). A system with 30,000 active threads
(taking a swag number here), will need 30,000 * 2 (one for guard) = 60000 pages.
That's like ~245 MB address range. We can be conservative and have 1GB range in
vmalloc larger range reserved for shadow stack. vmalloc ensures that this
range's direct mappping always have read-only encoding in ptes. Sure this number
(shadow stack range in larget vmalloc range) could be configured so that user
can do their own trade off.

Does this approach look okay?

>
>>
>> >
>> > >
>> > >   out:
>> > > @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>> > >   	if (!s)
>> > >   		return NULL;
>> > >
>> > > -	*__scs_magic(s) = SCS_END_MAGIC;
>> > > +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>> > >
>> > >   	/*
>> > >   	 * Poison the allocation to catch unintentional accesses to
>> > > @@ -87,6 +100,16 @@ void scs_free(void *s)
>> > >   			return;
>> > >
>> > >   	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
>> > > +	/*
>> > > +	 * Hardware protected shadow stack is not writeable by regular
>> > > stores
>> > > +	 * Thus adding this back to free list will raise faults by
>> > > vmalloc
>> > > +	 * It needs to be writeable again. It's good sanity as well
>> > > because
>> > > +	 * then it can't be inadvertently accesses and if done, it will
>> > > fault.
>> > > +	 */
>> > > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > > +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
>> >
>> > Above you don't update the direct map permissions. So I don't think you need
>> > this. vmalloc should flush the permissioned mapping before re-using it with
>> > the
>> > lazy cleanup scheme.
>>
>> If I didn't do this, I was getting a page fault on this vmalloc address. It
>> directly
>> uses first 8 bytes to add it into some list and that was the location of
>> fault.
>
>Ah right! Because it is using the vfree atomic variant.
>
>You could create your own WQ in SCS and call vfree() in non-atomic context. If
>you want to avoid thr set_memory_rw() on free, in the ignoring the direct map
>case.
