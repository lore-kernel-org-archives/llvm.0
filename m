Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45653F329E
	for <llvm@lists.linux.dev>; Sat, 19 Sep 2026 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789810794; cv=none; b=CW7LNMV+bAzP72FPTLMQy16gv6FT1F04jX414RWSKcUOCW/GF+lRgcgS/RSxhFBSMJU8v0chem8YDiXMH6UIop0vIu8rh5ICd3pRo/4sehU0gWHyDdsZ6dE+GcPMOT4OLI19HHCBbd2coJ4K0OhpuOAakkJWEO5yAGvcgECsRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789810794; c=relaxed/simple;
	bh=tHdHCeV3i/53pBzx+BvRaG4iEMebCHpkPsy50Fuskxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvB1wVhBEJJleEjtiU/2odtZsF2aHUtluxKD2AGFv7Hv71ZFXpYWBU8gVIkZed31pMzMz2xgqDNkIlUg+p2MSQeW82MiQPDzFAv9Oya6H04+CYa22VqwUoMZ0hJoLMTl+oTpDMIx08WEHMJgspM03eXlD4OtGDjtM1/q6uxQtac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sg1wCHoa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sg1wCHoa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so10945725e9.0
        for <llvm@lists.linux.dev>; Sat, 19 Sep 2026 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789810791; x=1790415591; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7D6znmpASqvbzZksdBAJ2aUTbJ7HvmNoE6FBY58urg=;
        b=sg1wCHoaMydQeOhirBZX/Bfs7ox+NaL/OyK5VMCmheS1Jxnq/JO0GZsXXLYod+v9BZ
         2vJi+INLltjC7uOVZXgm3uIVDKA0ECuJndbCGbbRgVNjTqhJS0AgSn9SQuAJwRuBwGJU
         +sCx4QsbsdVat4i8xwLhwWeWReEXOdXUbGWF8cBpRzQU0GYv74QUQdcQp6KB24yGWTJt
         +4CQaNxD7O3U1VEgcjsKWj6Zdy8CRcfCzPYWN0KT9pDGpnEhtZjxLgdGAOxOxA5HeD89
         H2J9dtnI8PfOtd1Ohpiu/YSzdBF695eDWusaqmdiL/OlQhxVTKXVvzKpb4jb+xCAZ2wf
         QwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789810791; x=1790415591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7D6znmpASqvbzZksdBAJ2aUTbJ7HvmNoE6FBY58urg=;
        b=VxYerXg2fe29AaGfN6qGPC2A0k4Jw64lWMmP45bSDubjxgX+fn8heJklcJskWdCixS
         ElhYGcXXF9ugQV2/F2OwmoD70CSIWqM5ozREK566mkFYNbfM83RCtTxAyp0UQ6NQYm2G
         IE72i3sHqNQQ/PdX2VP8DMOuQVWJ6a/P6LYTzt4z+f8uFACuMkSx7bBslCUoQUpeKgLg
         Va/3t6eUqbOYW0sN07F4NJg1c1SbU3HmsLnEGNbgyo2affsdcHji0Jk3EDSWAiYd1VIH
         MKSEv0GodhxQZlYjJDdcEnDXSdyiK9Gfl9wwo0RodS25NSl2b10KpKtgrwGG8vd30Oxj
         T5wg==
X-Forwarded-Encrypted: i=1; AKwUvBxjYstBELGHesU6q6zIIkAlOtYWAEn/NN/DhuF91aduUrt7Am1f3i/dMfs9GjfL8TAuq0NT@lists.linux.dev
X-Gm-Message-State: AFuF++nSSF13FYJT6ika7MsM3QXfLEoH1oIQ6twde0HXLBkcBLMxdJPJ
	zxl8dEPgDXrKEXeBP+HpYlTC1pJNIPyaWdt7gq6nMqHjBTRvnWgEE19S
X-Gm-Gg: AYBFou2liheKrsQqxRhERYK1ATGAunZ3tBB2zjCeGGLZNm5T/IyOs49sSY9ugrDPD9z
	u9SY16ZI4ontsll9qcdD6eJaUyJHSwSfVZjjp4Nw7RYdW3rRlNwIJA1JfSjQAiAu7AT/BA6mKyH
	f+yIulauN3GSJ63l/nDUCMGizgAcI5xQKlyo3LllaGSmAYMGskmdYSbLRv+h/C9iuF97MUu2/8l
	Ew8R9MQM5V773RoPRphY56M/MO4jdZVhIV4uOyzHz3Ya4d4fdq2jnuAUtvY+9sqvX6bFWXUVRit
	OOCG07/vXxlQloYqJ5KstYaGV8W1oynTj1SAfLRbw8aejG/htxcvJcLPfLTjEm3ZGeg4yKNq4ru
	pWIa84J4kDNE9lZVEysJ8X4rCGGKKRZGJvZ5qt+rFj0aMhopt4f9sLf7eV/P/ibN7sgOtZUEgXp
	w4vDQrWS++yQ+e9PODbqTua/NN1SG+KUj/n3TKc5reHrMV6B9dXu5TsD6yMEgHh7G4OGbchMHrC
	kh5hjvBzktlzp+CnaQNKBDsyj9zDyK9BUqgY93wOWPrbTJ7cbZt8KOngzd07m7fW2rpJO5FYPMd
	0P1tNjFhOn2kn1GrsUuTcXaeB1duVsclUBN+61Cesy7Iqp2Q7sYB4h3WcZ8pFhgfWz3sRgKnYq5
	lPDGrSOTk
X-Received: by 2002:a05:600d:848f:10b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fc5735351mr48923145e9.20.1789810790822;
        Sat, 19 Sep 2026 02:39:50 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ca43edsm124495965e9.0.2026.09.19.02.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:39:50 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:39:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/5] slab: handle ERR_PTR values in kfree and hardened
 usercopy
Message-ID: <aq5YL3P6tuFy4eTU@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
 <20260903203720.63689-4-kmehltretter@gmail.com>
 <497a85d3-e062-4930-bcb8-c86a8205e7b2@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <497a85d3-e062-4930-bcb8-c86a8205e7b2@kernel.org>

> > +	if (WARN_ON(IS_ERR(object)))
> 
> Wonder if WARN_ON_ONCE() would be better.
> Also wonder about the benefits for hardening (as opposed to debugging).
> Without this check it would fault. Now it warns, but hardened setups often
> use panic_on_warn anyway, so the result is the same?
> 

Yes, I'll switch to WARN_ON_ONCE().

You're right about panic_on_warn. The benefit is a clearer diagnostic
and, when warnings aren't fatal, returning before virt_to_page().

I'll split out the ERR_PTR patches as Harry suggested and recheck the
KUnit warning-count test with WARN_ON_ONCE().

Thanks,
Karl
