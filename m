Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B7C3F5BDC
	for <llvm@lists.linux.dev>; Thu,  9 Jul 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598757; cv=none; b=fUckwyo5zgN+OZlG9QwGZ59uZrwemLC0qkzvUcfybDrcYo+Ig5pXw1Gyc7Iqg5AxvOFNOUFVQta8nst0hD9xN0CrvTbL9dWvBJRgQG42kpd9NmRHldhY0mFjoCwUcB7Vx1fkJg60O8TwoIpxXu+GBlCVFNQUD1+dY7544oOCRcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598757; c=relaxed/simple;
	bh=nupF+JGOy5gLNRy3DmIcpq1wZn9qLlTFpEoyHXrL8JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/h+e4XfdPGM84wd5eVcNVdvcE5qUo0ORe7pudz+u/4uHvperdmSddo9m/jd8qzBV6uiaIcroT2F4Qtpbz+FowQiKT3a0Wm/6aSEuJvdd5um9iXgUD6rWG+KH5PhixcIiYzuKcQ0Pp/nJCSy0lxuVys3Xc/mVFlvDeT49V/gMAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WymrTgSe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WymrTgSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783598754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nupF+JGOy5gLNRy3DmIcpq1wZn9qLlTFpEoyHXrL8JI=;
	b=WymrTgSeaTZEhiBNKdwIEyPR8hw9boLs48HRhGuoBnRTZo08BpstFtyKwMJU2z2SO/f4o/
	drBZHECiD07/ZuFmfWVXMGqXymqz+K3dJfK65GOlM3dVX9NMNbDtyejSKNNlGIID69XbgX
	4A4HCKGccvaygX/V1NnW4vr4L02LuLk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-wjn_DqA1NMOkk4poKEB4iA-1; Thu, 09 Jul 2026 08:05:53 -0400
X-MC-Unique: wjn_DqA1NMOkk4poKEB4iA-1
X-Mimecast-MFC-AGG-ID: wjn_DqA1NMOkk4poKEB4iA_1783598752
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15ddb61f13so120059066b.0
        for <llvm@lists.linux.dev>; Thu, 09 Jul 2026 05:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598752; x=1784203552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nupF+JGOy5gLNRy3DmIcpq1wZn9qLlTFpEoyHXrL8JI=;
        b=CNW+vjID2Imv1o2q5zQOazSdtqCSVu3GQzb8wLEqPrYcyu9u+VuVyBS89cUZe0akYu
         45eNzEfEfV/PQzm0DGLbqW5HGCQa75BneolPtGJqieiS6by8EhVeXKlSLGPuIv/ZVUjo
         EbAdYo8fUbrCmkuEv0ZhwKMgXfoFtFoDbDIcVo1R8anO4AntG+hEvUCiFWToyaULECsG
         RhG3f/Lwb/epMP9ui6DKwr+kFkT4GScS9oy0Q4CoL9GBql5IEdnZY0gVRDN9jbW3MO7i
         Dyg91kYSyRJixmRMYeE0SYBFsJmPVzROikj+FF1fVr33OxBTkSVmoyU8YHI4gCQ+TpUI
         eWgw==
X-Forwarded-Encrypted: i=1; AHgh+RqRbU0bws62SHz0TNt6UT/KqzjWWcknkwTj8Nymo/ib1xFirp7EO6jAToQCIvPMyy+U685f@lists.linux.dev
X-Gm-Message-State: AOJu0YxIcfeBIU3+vBY4o+bvSg4T2LsXe+N/+o28mJd0NKjre4M9KIvF
	KeH/1aATZGB9TE07c9JZAreK5cW0s5TY/dNKQrmZk3dm/CBQXQNw8iHKbR9hfFatXSt3qA61vUd
	9+IoutbPI+sGjXnR+oCRxzPl1ItrZcMXhnf17NMDIKuJoDQsiD+cKVoE8CiBBtqTF6UdHCL1dDh
	6+cHXdLhRMiqJwc2xdUYNQXRA0e817Vg==
X-Gm-Gg: AfdE7ck9qyACicyzSD185EOG4EsHkGCuWESDBM0YVNFAekM3/icAYIgFJyd6wtaHAHS
	Q+Kq8f82J1QUAByW+5lUr3VkK0b2lbrB1JbscxhpOOqqAfU+briCWIX0BTJu94Wqz4NHlHZV/Er
	AKdzAJGnI/1nkKn/gCetvuDk+dX6YlEpIGI9L4vyNq39I/IfxoiTsV7Lu0KjA2zj2D0VU=
X-Received: by 2002:a17:906:f90a:b0:c12:1dd4:13ea with SMTP id a640c23a62f3a-c15ce145098mr197352766b.30.1783598752414;
        Thu, 09 Jul 2026 05:05:52 -0700 (PDT)
X-Received: by 2002:a17:906:f90a:b0:c12:1dd4:13ea with SMTP id
 a640c23a62f3a-c15ce145098mr197351166b.30.1783598751928; Thu, 09 Jul 2026
 05:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707005619.1229238-1-rosenp@gmail.com> <ak0T7zxwwSn_L57X@redhat.com>
 <ak8/8ixE7IS7kKdz@x1>
In-Reply-To: <ak8/8ixE7IS7kKdz@x1>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 9 Jul 2026 08:05:40 -0400
X-Gm-Features: AVVi8Cf6EcgENFDFDPWtf5ppg2jncu2WbpgZuy1VQEr2l6d4u0g-_cZiV4hXsgY
Message-ID: <CABx5tqLynfd-uku+iLNHrnLu4k0rXn=yBi2oU6b2HNEZT=0vaw@mail.gmail.com>
Subject: Re: [PATCHv2] clk: thead: allow COMPILE_TEST builds
To: Drew Fustini <fustini@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o7bZyWxezL__1unnsJrW9lEihfzZytfF334_qmUzvCE_1783598752
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Drew,

On Thu, Jul 9, 2026 at 2:30=E2=80=AFAM Drew Fustini <fustini@kernel.org> wr=
ote:
> On Tue, Jul 07, 2026 at 10:57:51AM -0400, Brian Masney wrote:
> > On Mon, Jul 06, 2026 at 05:56:19PM -0700, Rosen Penev wrote:
> > > Follow the pattern of many other directories in this Makefile (sunxi-=
ng,
> > > tenstorrent, ti, etc.) by using obj-y. This allows COMPILE_TEST to
> > > select the driver without having CONFIG_ARCH_THEAD enabled
> > >
> > > Tested with:
> > > make LLVM=3D1 ARCH=3Dloongarch drivers/clk/thead/
> > >
> > > Assisted-by: Codex:GPT-5.5
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> This doesn't apply to 7.2-rc or next for me due to the surrounding
> context, but I agree with the change itself.
>
> Acked-by: Drew Fustini <fustini@kernel.org>
>
> Brian - do you think this should be routed through my thead-clk tree or
> go through the main clk tree?

It'd be great if you could pick this up through the thead-clk tree.

Brian

