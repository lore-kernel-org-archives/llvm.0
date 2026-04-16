Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE7E3C4542
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347016; cv=pass; b=mVZKMcZEfQX0SusBf4vovQ0dwRlVDXRngPl4lpWt4o4lCuLEby8TQ8SgkD68TBm6qA8I2iShElmFBMJ2SlUgxh01R23UFwN/gPKu5bwXZ8OxfOTv3GDqyB7MAfLECNWVl55cbRct8MUbfc/BzhZSDPP4YyEXRg1tfP46d517GLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347016; c=relaxed/simple;
	bh=kxOvVjqTd7DGEEZRsCC5oBNM7Qjhq1uj+hNMJ9dzIwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMzMEaObpanHpSGotGkNM2U1DSx7gYap11naeSBULeyvETZAbnQrELoyiBfOJuzt1wt3V7vK0Sq/I/KiPzIpwQKKB7GU8XSUY8h3gvjhITfALcB0np00xSPq0btDHGQ/AvtvOYap2jJ8w7DAHTiIByhrj2PYR/Xb1LU7dW/4MyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ji1Rmc07; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ji1Rmc07"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c080efc1eso502742c88.0
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 06:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776347013; cv=none;
        d=google.com; s=arc-20240605;
        b=d1gV0umejqGg3t3Fk/sR/9ixuc/XKBtsoFQyJCA28ZvTmn1b9jvp7FicexIFsWiwBZ
         lUBlmyfoAxt7/FVXGksGA7clDJ/nSNLfKlnJ8v9hx8qbRCERdI4lEe51XY60Bt0mAdGJ
         jzvr1aPEFysO3eYNtQxPvJw3j1mvJdpz3Lwb2wuMvCas8TYeZ9UMtnmDyErMqRXeiUWT
         R4X5s7mp92soNKP2MlQAEoYZE3ZR6G3nFA9YMfdtC6SZG1M5Jivw0CUOj7sz0Aeo/Nax
         wu8dvEG5wa7PMbtRs5+ZWlwyUJZITlcXoUDbcA6/cQ79PjrraFNjqFJrHKKMe1N5Fcnw
         toNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tjOGwsDBOUpGKkFXC9SNbDoonfQ12TYXzDLlbb+FREQ=;
        fh=plyZ10qADoyLOwDvqvbiNqiuns+5iOz8SwBnOU3W9vk=;
        b=ejB1KRvTofRqeF2jhLOHek7Ns2Ypx8Euaernr5bORqeLtsyJ0Z5rmP9X3iIL0/Cimt
         WmIdWFinF1eUkgRgFfmdu7nskJQXTX4SyCIGOq/FwazCfleQREXCespCjhBCgZ8uCB8S
         Uhc6WBK6llCwzyXufTfTSkMCqR8Cg/X9Ykw6YG4koHVrgPTx/xul+MXxeaNZfv8SUmck
         aVSOVdoaY6OVdCkT8Rev6rQdbYriM9dBys1zmWvt5WDeUA4QdLieQggMUjcYiltMKIOG
         gv2IzeU+7j8TZwfQVrFcoEwMxDLg68uXOjr4qp3wDvRiKPWhHxnm16n7u+ZJkzNbOxRV
         yIQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776347013; x=1776951813; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjOGwsDBOUpGKkFXC9SNbDoonfQ12TYXzDLlbb+FREQ=;
        b=ji1Rmc07rbMwRuQtpqVwx4Ft7drvZkjthZXwfbg87qBws4CXXr7n3+VSCaH5YD/3U3
         JPJ5Y88yVMVWv5vlg++rmeYn9AxhZItxT+ZHnpNtxjA0X/QmCc06Rrcuw2VdoUfifNb6
         gt6kt30YwXz3+Au2Yf23QTnA63B11QsiOTwhRabMFwSg2RHYGxI0D1HTdZqfJ+WqKSwJ
         +W44BtBzmpiWDnpMmvB80bHEnI7pfIOjK7wWQLTi827rCry0nO5nGMa7U9TkjOjHzFyR
         xBlanjpWulQh8+nWkdsLYpoMAY7c36IjjfpJc2xJX5As3vJHVjX2HJ5cQ4oBXs8w9lgj
         W3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347013; x=1776951813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjOGwsDBOUpGKkFXC9SNbDoonfQ12TYXzDLlbb+FREQ=;
        b=NvNjpbxBETS7WnPQ4N3+JHPrez+0HuTCBZnRhtxx+vageJQvDS4c9MTEVLL9+chrtq
         1E7QsDLBMOrUfSLo0MqX/LEkNOE8h5Xx1KhaIPabe0DeT1q1QWac02y2okhUlmA757iy
         vV2P2MFoHSqU3EsRpgM1HPoIMbWVThnhHy6V8J6gGiKlBtREaf1GF/OvNYb7vCMsnh5l
         jomKn9LQhXlX8+WdWzyZzUVRkatx3OZLHOBjmtFHfKI4sY3PW4aa3D+vulqV7Q3+sM1g
         z+0grslqpAlqKlzx+BKJ/gBXh6XmaUiUAv6muga91JCm5HpvFppCH4Q37ALXOfaSUIrc
         CeLg==
X-Forwarded-Encrypted: i=1; AFNElJ8Uf4ITlAwnegw7ApGFY3TZ7nORl4nzqpMYUX8Zc5oo81RchunjOyN/XmMCWpZcFCsDkd8p@lists.linux.dev
X-Gm-Message-State: AOJu0YyLwWdsuBm+M0B7AqKkqJbXSkZVaxhqHtB+3rHkYJjBQvRuR33R
	wRk5eCHQWDdDD4UeC55R8mijZtNsJXEt7quMV1b9P8UXcqDhXaSfP2Zv+BCkqfXGiFK92J2h8BI
	PPwF6yPo/iyWDovyOqC5uy2Y2pIEcT0BdOX2ikuz6
X-Gm-Gg: AeBDiesoWBnSAjM93A/YotJL8ml4Tlm5vtwSLqGWmFwyhytWqLvEyVZe5EWHdeaTVbF
	y/IZvPr/XiIwAroF6W8jpTuhgM3gUYwFFaFUtjt+6CYyvMLcIH20G2b8ebQtZ2OtASuuTADoKvp
	hpsZF28ohscl9FqIgcueeQu7K+bz9zsmcodDnaSkOijz3qGx4Tdh/MJBrJuhuMi1hKPIaBDDCcK
	yxU3eVuLfqH579XsGYVpN0U76E3MwjBBotBpzc6Jx+F8LIee1+5MB2Juwkyn5hfF8CRFIXjobla
	RHTYdsacZjWouof9R/6Eh8gIDUJb2wAe+9tlbzduJwwkISe59gUiMAbp5Q==
X-Received: by 2002:a05:7022:ef0e:b0:12c:43:3ffc with SMTP id
 a92af1059eb24-12c62f5a7fcmr1810164c88.0.1776347012365; Thu, 16 Apr 2026
 06:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415143735.2974230-1-elver@google.com>
In-Reply-To: <20260415143735.2974230-1-elver@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 16 Apr 2026 15:42:55 +0200
X-Gm-Features: AQROBzAfkSpT2OeUn44qCzMc1NnP0-wCVBwGgeL2FJ0Hvp5au7FJaosCLAeJDF0
Message-ID: <CANpmjNPfunKnU=S9Gty-7MaO-3eJ2PUR=LZNd37pmgRwQDruCA@mail.gmail.com>
Subject: Re: [PATCH v2] slab: support for compiler-assisted type-based slab
 cache partitioning
To: elver@google.com, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 16:37, Marco Elver <elver@google.com> wrote:
>
> Rework the general infrastructure around RANDOM_KMALLOC_CACHES into more
> flexible PARTITION_KMALLOC_CACHES, with the former being a partitioning
> mode of the latter.
>
> Introduce a new mode, TYPED_KMALLOC_CACHES, which leverages a feature
> available in Clang 22 and later, called "allocation tokens" via
> __builtin_infer_alloc_token [1]. Unlike RANDOM_KMALLOC_CACHES, this mode
> deterministically assigns a slab cache to an allocation of type T,
> regardless of allocation site.
>
> The builtin __builtin_infer_alloc_token(<malloc-args>, ...) instructs
> the compiler to infer an allocation type from arguments commonly passed
> to memory-allocating functions and returns a type-derived token ID. The
> implementation passes kmalloc-args to the builtin: the compiler performs
> best-effort type inference, and then recognizes common patterns such as
> `kmalloc(sizeof(T), ...)`, `kmalloc(sizeof(T) * n, ...)`, but also
> `(T *)kmalloc(...)`. Where the compiler fails to infer a type the
> fallback token (default: 0) is chosen.
>
> Note: kmalloc_obj(..) APIs fix the pattern how size and result type are
> expressed, and therefore ensures there's not much drift in which
> patterns the compiler needs to recognize. Specifically, kmalloc_obj()
> and friends expand to `(TYPE *)KMALLOC(__obj_size, GFP)`, which the
> compiler recognizes via the cast to TYPE*.
>
> Clang's default token ID calculation is described as [1]:
>
>    typehashpointersplit: This mode assigns a token ID based on the hash
>    of the allocated type's name, where the top half ID-space is reserved
>    for types that contain pointers and the bottom half for types that do
>    not contain pointers.
>
> Separating pointer-containing objects from pointerless objects and data
> allocations can help mitigate certain classes of memory corruption
> exploits [2]: attackers who gains a buffer overflow on a primitive
> buffer cannot use it to directly corrupt pointers or other critical
> metadata in an object residing in a different, isolated heap region.
>
> It is important to note that heap isolation strategies offer a
> best-effort approach, and do not provide a 100% security guarantee,
> albeit achievable at relatively low performance cost. Note that this
> also does not prevent cross-cache attacks: while waiting for future
> features like SLAB_VIRTUAL [3] to provide physical page isolation, this
> feature should be deployed alongside SHUFFLE_PAGE_ALLOCATOR and
> init_on_free=1 to mitigate cross-cache attacks and page-reuse attacks as
> much as possible today.
>
> With all that, my kernel (x86 defconfig) shows me a histogram of slab
> cache object distribution per /proc/slabinfo (after boot):
>
>   <slab cache>      <objs> <hist>
>   kmalloc-part-15    1465  ++++++++++++++
>   kmalloc-part-14    2988  +++++++++++++++++++++++++++++
>   kmalloc-part-13    1656  ++++++++++++++++
>   kmalloc-part-12    1045  ++++++++++
>   kmalloc-part-11    1697  ++++++++++++++++
>   kmalloc-part-10    1489  ++++++++++++++
>   kmalloc-part-09     965  +++++++++
>   kmalloc-part-08     710  +++++++
>   kmalloc-part-07     100  +
>   kmalloc-part-06     217  ++
>   kmalloc-part-05     105  +
>   kmalloc-part-04    4047  ++++++++++++++++++++++++++++++++++++++++
>   kmalloc-part-03     183  +
>   kmalloc-part-02     283  ++
>   kmalloc-part-01     316  +++
>   kmalloc            1422  ++++++++++++++
>
> The above /proc/slabinfo snapshot shows me there are 6673 allocated
> objects (slabs 00 - 07) that the compiler claims contain no pointers or
> it was unable to infer the type of, and 12015 objects that contain
> pointers (slabs 08 - 15). On a whole, this looks relatively sane.
>
> Additionally, when I compile my kernel with -Rpass=alloc-token, which
> provides diagnostics where (after dead-code elimination) type inference
> failed, I see 186 allocation sites where the compiler failed to identify
> a type (down from 966 when I sent the RFC [4]). Some initial review
> confirms these are mostly variable sized buffers, but also include
> structs with trailing flexible length arrays.
>
> Link: https://clang.llvm.org/docs/AllocToken.html [1]
> Link: https://blog.dfsec.com/ios/2025/05/30/blasting-past-ios-18/ [2]
> Link: https://lwn.net/Articles/944647/ [3]
> Link: https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/ [4]
> Link: https://discourse.llvm.org/t/rfc-a-framework-for-allocator-partitioning-hints/87434
> Acked-by: GONG Ruiqi <gongruiqi1@huawei.com>
> Co-developed-by: Harry Yoo (Oracle) <harry@kernel.org>
> Signed-off-by: Harry Yoo (Oracle) <harry@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>

Sashiko found 2 latent issues in the diff context :
https://sashiko.dev/#/patchset/20260415143735.2974230-1-elver%40google.com
The fix is here:
https://lore.kernel.org/all/20260416132837.3787694-1-elver@google.com/

The irony is that TYPED_KMALLOC_CACHES would have helped mitigate this
kind of overflow bug.
