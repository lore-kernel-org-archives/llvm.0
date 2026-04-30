Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0DE40629C
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557634; cv=pass; b=cK7RYohPeV5O1LI0gehHiM7XZj1jfzUMxbNR2IJuXDZx1cIjgOvtzI+jV6YKw2j5hlxNDXf6dsM5NC4AiDPFwSsdc61cdPGFlPnI28cZ5T3Q5lQ7Wsln75PqduUGu1Dg71PM2ZLnzCY0RCgLMv10wXiFdMl9l8NdCFjiBeoa8Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557634; c=relaxed/simple;
	bh=q11TjLbVvV8woWQJHWB4Pgl2P7O1TL92s7zig4m0+0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnsFWsf7zuFDuuVGU+/0bb9runm/VNOUzK8yhK6LiAN2K6DaPZjtHMoUSbQyL00Vlyzhd0DMcBqdpg6qfYVoetGVlMtd7j9Gx9Szm4KyN8GJnqOjrr1W9vaPXW3BsYqEEIyNJJ9mLkRqyGM/Oe7i8WqOnd/mc5W1nU/7Rv3gRJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fgIDg+xC; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fgIDg+xC"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c88e5f4aeso675503c88.0
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 07:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777557631; cv=none;
        d=google.com; s=arc-20240605;
        b=KsH148c8my0hQ50JypWXIo5HTK9shrwIsseUGlpZkYdZqoeQ/5d3VCn9MaPUHx1yq1
         vGQ/5qffkVKynnc7CbpU58aAm2VewGRj378Bq5e4LUKr6fBawandipLFJLB+aPC/4iTf
         7EzSmDhaolndI6S5n5A+4Dis2/a7veU5CnwVe1skfU7byWczqOIZUR805iA0+E8CpE8X
         k20qd35mfr9LTw4Bfaza+xIyJ8ZMwO9iya+R5OvEsYQXm9o9e2AQqqi1zIAINNE30MnT
         stptpyzardbzRpWGgaqdHPjiF8+bBUnJ55RKpX63hWrdU2XBHx1rGE8BP9rPJhVnrRLO
         iLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FWbWmLupSF1aasSwvHeKUZ8NUkzaQhzFHcG2dLXCb2Y=;
        fh=A2skUjFQxSn/xklbHk6LgzSwpE9Tyb9EZTEf5R4kx6I=;
        b=a1LxKQZTzcNrzALjXp4B7WZiLYlnUT89prXjfhmrOtm7KTPdPQOGBj3nNbW51wkbv/
         YctQFTS1Vq3DOccOT7Aya8tVUydCb8Tg5WvO9QN9VL4aDVdLsJplAsmivsp9v6YZEbVE
         SOeJz9DJSEdJbt1o+8zZGriB1+k6/JxlPE1C1if7eWVSjQZI38l1dpAfxGqfe9TSyXVb
         MQYi68eFwfppobBGFBoMzkPXdKrB/hYrgBVcgRfGeK56ra642tA/1qkQUqmwBu2EUe3b
         YG1hBxvnkrq3CWzQO32Dsfj152hIfs6+q2LowREzHwEJI/n1O9ycmogf5XEPvtflqSxv
         y06w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777557631; x=1778162431; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FWbWmLupSF1aasSwvHeKUZ8NUkzaQhzFHcG2dLXCb2Y=;
        b=fgIDg+xC9/DAra35YRleWoOZvPRsE3dKJVSs9MMXZdUms9/KWpOZFNvTqxbJ9vgkHL
         N92BNoeVqoZpcDGeUx5voFi6uLS5yrqs3CSRDzkdbhznHweASfHgmd6NDdKQNcG3X64L
         4fkm3vIUfVR1dcBDgBpHh8AamhKbhKp+eeE8bjH/+eA/B3AjaUrS3JKMzcAd55/XJB4/
         L+gCZD/riWwdRiwExPXKCVXeTrFG64WhDx/w5lhszmsxJaraFyamE2qtIRb8VO1oVXSe
         /rEbJSuYqBjoJz8Y77ern7CPv1WDu8gUwMmNMScUjIvP+fAd9riqxpJ/SZ2xlZBorRG2
         LgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557631; x=1778162431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWbWmLupSF1aasSwvHeKUZ8NUkzaQhzFHcG2dLXCb2Y=;
        b=FhZCnPKcnjy7ZJsL4F2hiisaCmmWB4sjTzt5ICLjzqUENkPWznOo3LE08mJROH6s3c
         j6I68DYIFppPk1u3jBaY5FdgMe67a/A855JSZGqc4Qdgo53Zm6tYSyxPGCt5mCTYsv3x
         tXYfS4rCSNnqiMfiAeLji+3cnPv05kBfJqqxRJWvzfRwVrz4kZvbLROEmsuQ94Nb2Z0J
         gIa7jny0ZkFXelbxHT5adVdZxkUGtxiHEu9baUQh2SRcvvol4C9W80MgPSlpLELOspX/
         6EjYsfQkzWJpp/aQ+lbIUuS1Y40/VT9vHi0REufqxzbvZPPzOsbP0hyyMwwUtOo+JywP
         GXIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hiJz1fBjZMxTvfoaEEzXxUKspDxv6kzip0IdwIWfSSdpN3BrKqX1ifZJ0gHXVX3l4GJEp@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0hkoAoggG5vtLQsQvKw497zJXuSFXvnxuE9JTNCeLhi+40cy9
	svGCCLBwHdw9guu2bVO+Ds+MbfYpi5QXsJolIm4G4QYcj9yKb+k9kP1np72TPbj1GcfRbzzPE/R
	vLj/KlpxSZMEXGD1NPfsbuiCf82z6uyOjOLPJw3nd
X-Gm-Gg: AeBDiete/J8PM1Wfng0dCMS0hoOJu6PzK14q9IbnYaNcOlAhQGlDe5JsF/RPm1OePMJ
	i/9JguUXtK/xk4RUhrGgI7Ji35x3DOul1l3drbGO6Ibz5nQjkYGxy2bah86BOhJXxg/GQy/WnC7
	N1GmyxC/Dh5yNHBYFoCShTjTZx4tSyRjUACXk8xZORAM74LNc7fcRlKFF6m1ynWuOfrQYIPQNZV
	O8B49fMuYkAQy6zFHT2h2KZnLhNLNbzGosgd+m+EO5Q44nubAKrGt7d9ahbKWcVi9KVmwejqa9H
	Y6kUC4sBSyqVGt7RiqaHaOgBr077Cs8U5vjWuOEYF1+a2yqCH8B9ezp7u4k=
X-Received: by 2002:a05:7022:92c:b0:129:1d25:f1da with SMTP id
 a92af1059eb24-12dec602250mr1294888c88.3.1777557630763; Thu, 30 Apr 2026
 07:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424132427.2703076-1-elver@google.com> <20260424132427.2703076-2-elver@google.com>
 <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org>
In-Reply-To: <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 30 Apr 2026 15:59:52 +0200
X-Gm-Features: AVHnY4L3BCY_keL_qhcVurJjgr2ukKogo3SaEXX5idcPkTjREyzfeKAeC-ucDp0
Message-ID: <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] slab: fix kernel-docs for mm-api
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 15:40, Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
>
> On 4/24/26 15:24, Marco Elver wrote:
> > The mm-api kernel-doc comments have been broken for a while, as many
> > documented symbols shifted from being direct function definitions to
> > macros wrapping _noprof implementations during the introduction of
> > allocation tagging (starting with commit 7bd230a26648 "mm/slab: enable
> > slab allocation tagging for kmalloc and friends").
> >
> > When the kernel-doc block remains above the internal implementation
> > function but uses the public API name, the documentation generator fails
> > to associate the documented symbol and generates warnings and fails to
> > emit the documentation.
> >
> > Fix this by:
> >
> > 1. Moving the kernel-doc comment blocks from slub.c to slab.h, placing
> >    them directly above the user-facing macros.
> >
> > 2. Converting the variadic macros for the documented APIs to use
> >    explicit arguments.
> >
> > No functional change intended.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> +Cc Jon
>
> I thought it was supposed to work because the kernel-doc scripts were at the
> time taught by commit 51a7bf0238c2 ("scripts/kernel-doc: drop "_noprof" on
> function prototypes") to handle _noprof. In the current form git grep finds:
>
> tools/lib/python/kdoc/kdoc_parser.py:        suffixes = [ '_noprof' ]
> tools/lib/python/kdoc/xforms_lists.py:        (KernRe("_noprof"), ""),
>
> Doesn't it work for you then?

Ah, I see. So it doesn't work anymore because we add the '_' prefix, too.

I guess the question is if we want to proliferate more kdoc parser
special cases, or just move the docs to the macros. The downside of
macros is that they lose the types in the displayed function
signature.

Preferences?
