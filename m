Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB53E172D
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590518; cv=pass; b=NsUgptY8kVUwO2+HY8Df1w87KOOOb8mhp1kTYxWTxTASTIHi8EgHhIgnSjykzidQ9B2dPDuPSsMQ/TlGjIvl+rL/cOdsJw6nRe/DvFD82Qpr+t7tCS/b54ZxboXsOTFdnbD+oZZnMwh5n1knZ9Z822YUZJ2u/8zSO3ZjWUZfKC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590518; c=relaxed/simple;
	bh=k001GOwiMb4dRczjtWUwITXHZjyE/lTx6um46NJkiUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEFGY+IqTGDp4hp36QnNOXB0mfTP0DahfthNUdbwZPOQrSRss5TNlorFGQEh5HaEU+/btXoqj+WkCj5XhgolsPMMXfw4To7SMeQGJdz8PXNVs1zTdxuZOhAL3uv8O+k40wc0wwTPHJ4jQVBiOAV0CMjk+cw6uZsxoWkyYmKWaQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pNNVQMlp; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pNNVQMlp"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1334825de43so737625c88.0
        for <llvm@lists.linux.dev>; Tue, 12 May 2026 05:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778590516; cv=none;
        d=google.com; s=arc-20240605;
        b=ApwqJDHTcYaLgGEp20JkQqK9+wNDtyhlbFbBA7MAWWEQkdVS1x7VkPLBRRSV5gOt6W
         JreZJ9Ocj4NYRYkc2Sn3m4iaQbQjyLayEYoKuodIOCz5nawQGtcsLMh2u1x6SQigmYyK
         6E+KI5UQ8CEZomrMOeGT/ck1hQyew2fmPDGO6P7ZcvuskgpaLHycZDGN7+J33W+nFNgz
         akLyeN3WW+H0pe09FT3GY4ZRB4b2ZfjMazgtd7dmYsq43B0uN2Oi7DWOLKJQ8k7Qceym
         U4WLdYZ5f/gx+XBMQwAlKcF7uU5k1EnZDjWv0prYQh/vWoVWcLyixVO9xPtiybL3X/uY
         su4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k001GOwiMb4dRczjtWUwITXHZjyE/lTx6um46NJkiUA=;
        fh=C2BOA/FN6xxLV6ySG86KcjM9KAYQs/ihwOP3WgBkirI=;
        b=Xqbh8F8rslJ3+AuPtVqpA18F0ZlE5mjl/D1K0NpgEwBkVZQZEF8T4m+eGpRgeqTjSE
         1EUT2304/mqVmfw8UPV/pMmGua1f/caUoQ7qMk/RB0Gc+lbiL0oemBVoM0/mDzzMYeTH
         Dk7nKf3H/9ceQ8lBaKOtI819wigGpL2pyUgpWjsvEZxQSpkj7UtyCHCpaWAdodADgAFr
         DRa4WIoWwjjObMW9wNi/dAI2mhhLE8LMngo/4sCfowAth5DRp3pT0pVEYQDSWU7POxUJ
         sOyqJGsMF5WelNBPSrLcZCcm6Z3rTfyYC13tgGwBddWaopFCLQ3XB6muKm7A3CgvbS08
         KdRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778590516; x=1779195316; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k001GOwiMb4dRczjtWUwITXHZjyE/lTx6um46NJkiUA=;
        b=pNNVQMlpqyWrhv6GE/d6Z4hBIXmBQl7XXxw2Jgb1Q72DrugJRtKNoa4Vheg+RwdR5O
         KGQXFJjd/8Zi0TZHWBYUwDdp3FGOEEED6zC8NnXYFW84ZzNjNr2ddxB0noikCCDZLUZE
         fLMD52StHOJ7hSV3pNAwYWahAbclx/+w54CbCKfqTLPg0og/dfxn6O43KbrJMH9WvidK
         jGkP2eNU0Iel0838yIQ6flayYXp7A5vHmeBB4tLS0Aia+7SkdG4jMre3HpH6yocNX34w
         8Ycuj3DmX28CKT6waBvccnS8IZGMgGMPur2o2TtW7M2HBcUTAfrf8axsqw1leNDkjXBs
         CF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590516; x=1779195316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k001GOwiMb4dRczjtWUwITXHZjyE/lTx6um46NJkiUA=;
        b=pb8WZH17VG02jSaWC0XZgoN17j3T9ZdQywhvnUhuji/hDXwrtAiL31cINN4l8eEPBv
         WLdX50SUmxdgH4rhiauP7wuKDyEmryhVBpCwmJ6ubpUd6bb/9oHJcYaHIRyH2fQe46T9
         /8lSDufE/WTC1ZprUvzL6fSSTijvwatnrSF8VPa7HGMP7MYL/bBkFzhHW23AiNQFbnRy
         MHhaLZnoUm/wzbP5L2RTjUdl+U78KnbgnBaVzdprtBbugorYqaZJm1KNvRoBkUHoZbgg
         saWJSjub7YJCNF0jf6RwdPiS0QKb/C8bb+yjAoiax/RloZxxB+NoxYRhC9+Z7YEfBU9d
         YwXg==
X-Forwarded-Encrypted: i=1; AFNElJ/dh2h4jCFT2LeBejL7tDmNeCuod2OYyIg866Gv38EWEbMeMTMoR0JjMITAEOBCADdmHael@lists.linux.dev
X-Gm-Message-State: AOJu0YwD8cx6cvMYgkXrlZtTkWz6VblAxUwnE8hlZWk740C4x+T7DVX5
	XcPQZALKQB5ym5ULTNiRuB9yO+3AKZVtBw4Hl/9x+YjF+FmNtmKYxZwXCpEFcmMt06oT+sz0yfZ
	attxCR1K9NRRp4CtIR/MYjElw9ZwWLm7LvSNXa4bg
X-Gm-Gg: Acq92OEGp9BEHH12SZSXFPaaseHYoydU+GFxcZWC9owZ5dalOBowdFULZGoxGCygmRE
	axu4tqDK/Kpnf37jreNpOpgQlVbx+7q3aufbJIiZ3z7YExB1XPmcfmWkce3sxa+PpbCjSJYMLB1
	dsV5ck0yDT4ERwRsPSZA6MZXo9PpqMAAOz5ggNOM7yEdFYopl1sLFSpxn8te/a2MwzVwD3dnVig
	1AQqDy/xkbisNgQ6aqBn1DcwqiABrVtGzdGv7GIxwNqvzhEZ02bZ5jOR0H5P7f/3COjn0U0tpMw
	98xcErM9pg62i2+7EXouQS2WETsrjJgevxRvBKlrJsHX
X-Received: by 2002:a05:7022:2529:b0:12a:6a64:81ee with SMTP id
 a92af1059eb24-132a7edc7a5mr7596782c88.3.1778590515386; Tue, 12 May 2026
 05:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com> <20260511200136.3201646-2-elver@google.com>
 <afc2202a-2e0b-43e0-9556-06be2da33c83@kernel.org>
In-Reply-To: <afc2202a-2e0b-43e0-9556-06be2da33c83@kernel.org>
From: Marco Elver <elver@google.com>
Date: Tue, 12 May 2026 14:54:38 +0200
X-Gm-Features: AVHnY4JQX5cZZPTvWGLXHBJoCN4agKvIY9SusDXvPP6Ojv3wTK7cyl5mLfOsNmM
Message-ID: <CANpmjNN0-b0TG2=7SsPpRuubwTWYfoAiYgnnM_5-39SoVfv=Pw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM randomness
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, 
	David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, 
	Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 12:37, 'Vlastimil Babka (SUSE)' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> On 5/11/26 22:00, Marco Elver wrote:
> > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> > to identify the allocation site. _RET_IP_, however, evaluates to the
> > caller's parent's instruction pointer rather than the actual allocation
> > site; this would lead to collisions where a function performs multiple
> > allocations.
> >
> > With the generalization to kmalloc_token_t, we now generate the token at
> > the outermost macro, and using _THIS_IP_ would fix this for all cases.
>
> Hm but it means in patch 1 we make things even worse and then fix them
> again, and also improve what was suboptimal prior to the series.
> Would it be instead possible to reorder patches 1 and 2 so we improve the
> current state first, and then introduce typed partitioning without any
> changes to the randomized one? (aside from changing the previously correcly
> used cases _RET_IP_ to _CODE_LOCATION_).

It won't work (it could be made to work if _THIS_IP_ wasn't broken).
The compiler is supposed to maintain semantics of a static variable in
a function, even inline functions, and refer to the same static
variable -- and because kmalloc_type is an inline function, if
_CODE_LOCATION_ is the non-_THIS_IP_ version, it'd break.

Even if _THIS_IP_ wasn't broken, the other complication is introducing
the slab.c vs. outside use of kmalloc_type differentiation.

Both these problems go away if we make this patch 2 (using
_CODE_LOCATION_ on the outer macro, not in an inline function).

While I understand that maybe we could have considered this as a
stable backport, I think it's borderline; the feature isn't broken
per-se, just slightly lower randomness than perhaps intended if size
is a constant expression. A minimal fix prior to the macro rework
currently eludes me.
