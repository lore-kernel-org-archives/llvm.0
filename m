Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB73B52E1
	for <llvm@lists.linux.dev>; Fri, 10 Apr 2026 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812248; cv=pass; b=B/PxbyEgn22a+4wy07CLKtBI1lvW5p7atuqoKmXJQzBtMvckZaw1/Kb6DsPQcmzxlrgb2AnJZbo55zfnXdRt7UHwGuHKDtOaQZLhVVAhA5kgb0N/jizA0b5FoIMaQY27OmJNkkK3qW0EyGIEmlARKJCwcDReP56/WtKFxjy6AS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812248; c=relaxed/simple;
	bh=naitCC6swSoBy1VNvSZ66ZypJ+ORfAmYMB1nrf5YPCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ult3bkedHicWl0ZeMat3pjxrtMbm14Dkw632LWvMiJgst8vMQD7xn3lZkB/lPwM3Fn5Ilvy2VuYxAENetqy9nr2qQiqMSnGbLf7uS2lbI7WaqpvM5INIEEF1/SG7Cm2QVENWxyYknQNwOEm1Ro3v+qtnyMEge7BNxt4YeKY21fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JWFZME0b; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JWFZME0b"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-128e4d0cc48so9136863c88.1
        for <llvm@lists.linux.dev>; Fri, 10 Apr 2026 02:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775812246; cv=none;
        d=google.com; s=arc-20240605;
        b=i5pgW6jRymt/1XJSwSM6QdwV98C6Kil4Xg07jcg/GYoxsgMiBXjgEBwfJFo/xqPaGN
         oo4B4l9dU0b0yTKDBF1y2kvOATes4+CJT7chPQuX4wSnSBu1hGypJ58KTGQBvNZGtphJ
         3hhcMMpZ8yWYm2O2tHj+1T75ybMhTZEJCgbc5J20wFtuyyMJDpJ+p1mLki5WTSo/Gwe1
         gkpgjska0/otkXfb+Xgs/v7+eL0fgcgtzDqv5xPBy+Dso1+zc8nWrywTbX4BdCt4DCRv
         hg3oMjrgVPx3Dxna6IA8l8FyCbSMnxYhA/8OcMYadir4yALiwE23M3cwK+BIC5ncIqAH
         WfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=naitCC6swSoBy1VNvSZ66ZypJ+ORfAmYMB1nrf5YPCM=;
        fh=UC+iAUETeJx69W2+ASIVbfheOhl2PDM3ilvYHzzeem8=;
        b=PLYklGCj8fYmmnfDE9TTp83D1Lhp5mC5DuTNBd0X3/FfaOBLCt5RXrW/tr78IpXKVc
         FFGODMH7ycNwYO3WVU5vBrtRJ/mIhDXiCUkZpldCLwe+jX14G12zA9/z4Q+aGO7D+Wxu
         XMtoFsr/uIwSL2MAVpN4oMMac+EKtgbE0lqo0ZL+92QFXeChVXmnrg6iUXT85NQ1wa+q
         dNjacUgBNBGi3XMHOMplAPi38TnzGZgHUqfIOkWx0d+hWd4YBe0wup2RTPyrXIeksdpb
         mUGT17b74hXnFnZAps26dCNuShgDvqGoeufecJXv8ojKrX6jgu12iwOYpSGLBt5M9a8a
         hkww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775812246; x=1776417046; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=naitCC6swSoBy1VNvSZ66ZypJ+ORfAmYMB1nrf5YPCM=;
        b=JWFZME0bg0mxXaM7c/PhYvuXzkY6n5WNejaSUlZi+GtxXEAm1By/B5rFXqEvR2tYwk
         sl85/nx9WUoUmG67EShybVu6eEJatJmhLm86r3cjwY2tt2jMvf7sAlSAzXmeq37eNxY5
         Z+s/ouTAGYevf8GeNfd0fTOeglueG5mkx5/gW7DmrrZ2EeRO7tFzmq6HchWraRbga5ib
         MzEzR/zM+7CB5KkuQNdun2UGOIxiJvNbIMnzEbAPD3Cf/2Hiwt/XgGtVIqVt59bR+b3d
         Nv3ymwu8uoVKmRsdgLgfOxcdciQjB3r7tWWgISM0lMPdZ2VeFUFUr2qbm10R1jrfuz7B
         7lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775812246; x=1776417046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naitCC6swSoBy1VNvSZ66ZypJ+ORfAmYMB1nrf5YPCM=;
        b=TAREkCmC95CniyAmB2DyRUkZdVF7K7qty3n+HxFdXvhYhqBlyqM+ZdQJ+quzNE++UK
         R8KFPAPaaXPbwg9OPxvT8MHikWAQ7L2MVoXaKa1PfPD4j0JhWNREeSiyTnIGvywxaoCE
         oueAP041iN7FaI69cQ3LnhDJno9SahQg1ZSAjerWRlvH/pZVH8QQMZLIeTOe51dYROBF
         lB7cU57mt7B/L7b+lOsx4NdxNq/Ugn0pUbaNIsP42wHSitQm8IQxm5qxho3uZzRO1tD/
         bO1xJqbavDzQxc78A/1/G0OLcFPR8537baii/qm4sc5WXSwO9NKBG8vMMU41q4hyk9eh
         KbZw==
X-Forwarded-Encrypted: i=1; AJvYcCXeN9q6F3BIio/tgWRle5xxiEjqDFbsYhCb/S2IoNd9gHPZzvWn+PtmzhKKkpPyK9p+tcQy@lists.linux.dev
X-Gm-Message-State: AOJu0YxESsOALHpaHX0Xwu8vKeeYNYSag3Cb28q6zUHXTODtZy2BpeMg
	Xx9yjK+ni67g/w6s2aWSvPUiR/315D9rRv64iVUHNyegEZY1zupl4WfTbBhhbpXrXucnrcavh+Q
	ugm7y37acYtsJ9JPRpionQrioU0AV5PMPw7X6gQMw
X-Gm-Gg: AeBDieuvK/Z3RIggTrAnM43XmcY9qZ0sPaTkTqNP6gn8PqdeDumQqXOFOgKJpzvORvX
	GC64+xlm9pmL8nm2ClyRySFDFkUAC30nQiRtyPJ0P0mhygeAteZtvd7CHOk1AsmDCAt8JQhsBZH
	Brva32XBvZ8HeZqlBLgyOpDZ9YqQKU5JFjdrLbgsCAMcbGXLsdNKCmBOyvdYIwgQUcomcmZM8Vx
	ReEL9WM+5lzPivSZejzxscK5F9+p/2vGV2beIjdiEVD097eNLcNkOFTGlQOp+1zoCxFWStlOtHi
	/pZCU5hWAj1/jnD4u6gsAFfsbyjDNmg4j8bVpR8pvfyjCxXR
X-Received: by 2002:a05:7022:250d:b0:11b:b3a1:714a with SMTP id
 a92af1059eb24-12c34e8f8a4mr1549057c88.12.1775812245709; Fri, 10 Apr 2026
 02:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <ac9d5O5XehnXRc5A@hyeyoo>
 <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org> <adM2XVZf1DekahlY@hyeyoo>
 <CANpmjNMeaWWuDMAj_n38U9XRqgZQz30ca82Vy10Bg=NoDfZ5ng@mail.gmail.com>
 <adT-gkVmVDDXR1h_@hyeyoo> <CANpmjNO1aNm3mKphDGWasK_NUfVY8q4K9GCjyREZFqrOu9WLcw@mail.gmail.com>
 <adhcKZGytWdaLxJu@hyeyoo>
In-Reply-To: <adhcKZGytWdaLxJu@hyeyoo>
From: Marco Elver <elver@google.com>
Date: Fri, 10 Apr 2026 11:10:07 +0200
X-Gm-Features: AQROBzC2BBHkcPy4ngHl5oxQazFqhMF2xdQ6OJLOxqq2BaVLmQUNSpLtUA2DJOM
Message-ID: <CANpmjNODn64zxhs8eQM5t_y6GUCbvBK+feAAM6GVDX3-Z8aTGg@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, 
	Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 04:10, Harry Yoo (Oracle) <harry@kernel.org> wrote:
[...]
> > Which is sad, because that means we need the macro workaround.
> >
> > Do you want to be credited with Co-authored-by
>
> I'd appreciate that. (I guess you meant Co-developed-by)

Thanks (and yes).

> > - in which case I need your Signed-off-by.
>
> Signed-off-by: Harry Yoo (Oracle) <harry@kernel.org>
>
> > > Not sure if it's safe to do that for exported functions though (since
> > > modules can be built w/ a different compiler).
> >
> > Kernel modules built with a different config (implicit if different
> > compiler) are not supported, and never have been. If it works, it's
> > just luck (I know people do this, but it's just a disaster waiting to
> > happen).
>
> And if GCC folks somehow fix this at some point, even kernel modules
> built with a different version of GCC might not be supported?

Yes, and different compiler version also implies different compiler
(so even GCC A.B != GCC X.Y), because newer compiler versions may
activate different codegen options (some of which we auto-enable if
available).
