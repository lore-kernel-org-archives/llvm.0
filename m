Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263409;
	b=JVn9T387whRWu9uK3LUdvF0k3cz+8H/0WeHtO9OnBLraz2pQ4YBIuxW9U3W7TgTO00U0
	 7SVBoc1SVifl7eiK2ppf3OCcfX5ztLmBIyGT/XMLvUqPCRhoQfEehYrTIDIuKkO4V4G6V
	 4/257Cvemjy5lA/EXwLCAxVTuE4Ffhka4s14d8MtVZuaJ09Xchs4c6RsoWJlU1AWNpqQz
	 4XEQHrJ+/qrXW2Nynq03zvUztD/zEnJ+ALfSAiLUCdNNrFNAQTLV5re2BWVQM1dRJ2l2t
	 EsYktsAKmQoN8IZtHKjBe7JpwHX9zdrCLAxVEgl6utCrItfFmvQO5Y366jTk7e0mJew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
	b=F2LO4eZznqxL2Tlq/RPqJ5aaQuAfN57oZAPWF5i1IvPAsTixv1uID8+p8pkPyHGExiuH
	 25H3FrSP++0GNA4wwcvP1dFgaFSANAB06MebczvMR9R5OOhtTlOj3ErQdT/6S8HuJnBXY
	 l6w6BHL4J5oDGwmxMPDRcrlz7DZKDGp7fTrmyCG1NZ9Xf6g4rK6wMCR0kA0e8Z2Hz7fDX
	 30TMS9s2ytSpCO30FRdsnJpU8c4jiP5nmUNbCxmYv9skPgu5SJEd59gnSxEg3PTdWIPCY
	 6GAd6eakBwNZ36/n7oFahzMYCq0k5UZpNDBwJ848zGUmvLV4jPnLJnK90sLuuxkJmFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZP90t9oh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538FF606A334
	for <llvm@lists.linux.dev>; Mon,  9 Nov 2026 22:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538FF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZP90t9oh
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-535f598d126so39601cf.1
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 14:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794263408; cv=none;
        d=google.com; s=arc-20260327;
        b=krvqzCFMMlWNmIbJRVWhvn6V8jPeZXhnj+j52ahv7h9jaqj1shVH2DxGKPqEU52sB7
         yEXN9ZDggAC7HlKZW7r5P3vUgzNzlHfHyJmpCG8qREJZ/KcVOMye+D7tE284OWBbSOzD
         mGoZrowPYXAKoVxZX+R3+BEdtKZKm4uhPN7w4P19/rHvZQVVbyE4LaUeUdR8OPGu/p26
         /ssNIl/ge68XpIAbePTuvF1h1lVFnizGXTCzgazo8uOatmI7Hxlno0dSuGYwRZJSdYRZ
         a9nWm9Q9EBrVkHtyw7ixKOmZrcUFn65qqvGXcI0mP9KYgZx6VdVc2aOu6CTStQk4m9hp
         E1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        fh=v52XSpBlc4S/xDPGHnek7VMlBMJnKaXRlPAJLThggdk=;
        b=clt9pRNdU/XhClWLpKQWMyE2yUneWH9LJhJ4QIeyPz/tOcF1Q4rjdkqmzkUaiT7GNg
         NqYYD2too3NwHEXEKmPWYfCHGetvBZhKOILdy3dyuQ0tBF8HuJE6f76xtfyNstSLipQj
         vCvHvKH75sf4OFxr9GpsRFas1X5HY8heHsw/8Fe8ZTpVx6J5UZWjk8D+QWp/2aKeMxiJ
         tT43AGSaFwO3BfGbHMXd3DBqmJzQoRtdDTo+o0o0e2Oum2Gt+csUCeiaZ+hWDfTZXGok
         g/tL5e/2G1oGMvvVBTmHmUYHbCM/uVMva+I2LEUKn6OQzM/3yRUx7+6gRZEht1Lndff7
         /FyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263408; x=1794868208; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=ZP90t9ohYibqkOp9Ohy3ox8XtEh149CAjReevbDrcEGSs7rdWPli/f26c+TCc2ar41
         7Po2ccGGcka/LYJu71k+QmIf6Vrutw7FTWWW6EZUryewggAsDLhDDbw/HbTJUBioynma
         weamWxMNU3YSowEX3kJlnQKFzpR8zFsHVd8fgvlEcSez5YHCYTwJ51HUIyZO0Ilh32Z6
         HnMHgvWtg4zv7yPqxqutPGfmtCobQFKY/NbtrPbG+NXWqLRwcVqCPyToE1w8Gedy7Jkc
         dmLUY6g06mye5MECRaC+ZFebseRoVBGZxEX8ESPvlox5eHTAQSdv/41DIFfNTEaEQTbB
         OT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263408; x=1794868208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=NFP+aIPuaFYIqYcrShHJsuP9LG48DXvo6Ll/K7Rj+5I4Mj1yg9yfZsjpcWQXMlLHQp
         3xZM/r4iLo4MdqFmaF9SZAXkuMMo1qaIzWOlw/KJG0NWH9KgpI/mykTxNjq5Dl+gDpKT
         y2xg41sIBkK0buCAb+mluwSORMjdzepqb+uyhAOQjvFRCODvtY6GzxyHGTT+ZyqOosLc
         hNGKyWFp1Ik86vLo/GHgjIxk5u7clB9BSq6LQDmJZ5U+xfNRreItcqL2NKs7WozUDEGr
         gOIzHp2SVm98zMUPj8cOiYMyAK7eN9apB9uscie/z6fch/ZO01r1T58P1fv9wxIeuk2K
         pxMA==
X-Forwarded-Encrypted: i=1; AL+hErEYiyDYHfcEZ7o5HJHwKLSHH19ctGbBccCm534mwZWI60fAzcfATLMcaLGHLhRDVXY/I8Y3@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZmvjRssBhvw3CRoNf59aqz8AuygdbpArG1asdU8tvh1O0hzfM
	qWUCLG0Cuw70ZNJtCVeoSoY9XxeWRnBjSVOM8q8xmdQigNMHHU/bCSpbxGxjgsGPQLCItasBGur
	PANAaFTLms9UJT7WTkJnlfj/0NGuTPgaY4aYzoYAy
X-Gm-Gg: AYBFou1wd7VyBY2peqqsiavgkPtGyFs2Z2X6L/Oz8oy4s0cU9NVTxQzX5dJtElFG3O+
	oB7lvr97HTHK4CkLZVqWB0Ad1yYyIhcEK1STzVYZRO6MmJCV3rfP0SuZ8XR055RzmB2IRTQg8ys
	EXEwDRmFFH94E2Brt8Bq7QyZf6My9/0PoauFLbZskJKwkKWvZ415uLCHYfltxGL9sWji57XL9Bs
	ZsYm7WM6YoHdBr7Yt9B8m1JlZMhVEGVOyBrQTPIpZ0xC0dQCxmJjbecZdH2eXr4lJj1euXgguce
	daDaEi6amOnEuvpGPy1PkZuvAZ6XNkXPasTLwMwRUKXZ1rxdbQcFuroEVn8thbXZWOczJSbaM40
	hSNDoLssVUbgeMiZAg2ZuOfT2Ts6/sACTVRX7JLXLKC/4zssUczoEE/oloRlaJfKrIPY=
X-Received: by 2002:a05:622a:1b16:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-555290bb288mr6464421cf.0.1794263407457; Mon, 09 Nov 2026
 14:30:07 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-7-irogers@google.com>
 <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
In-Reply-To: <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 14:29:55 -0800
X-Gm-Features: AclHuK-dlWDp0B4FdK6V9QBR5LM_sA67_T-19O3ovPwDJ5RdBpzojQ18ICzxF_E
Message-ID: <CAP-5=fXd640kfaR+soPdiEV2mfqCPGDANCt04KzaXBphYP4Htg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
To: Juergen Gross <jgross@suse.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 10:56=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 08.11.26 23:39, Ian Rogers wrote:
> > hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
> > with kobject_create_and_add() (which allocates a dynamic kobject using
> > dynamic_kobj_ktype), and hypervisor_subsys_init() in
> > drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype wit=
h
> > &hyp_sysfs_kobj_type, which had no .release callback.
> >
> > Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
> > kobject release behavior.
> >
> > Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   drivers/xen/sys-hypervisor.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.=
c
> > index 91923242a5ae..0e8a2cd69fd6 100644
> > --- a/drivers/xen/sys-hypervisor.c
> > +++ b/drivers/xen/sys-hypervisor.c
> > @@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops =3D {
> >       .store =3D hyp_sysfs_store,
> >   };
> >
> > +static void hyp_sysfs_release(struct kobject *kobj)
> > +{
> > +     kfree(kobj);
> > +}
> > +
> >   static const struct kobj_type hyp_sysfs_kobj_type =3D {
> > +     .release =3D hyp_sysfs_release,
> >       .sysfs_ops =3D &hyp_sysfs_ops,
> >   };
> >
>
> Wouldn't it make sense to have a common function for just kfree(kobj)?
>
> In your series there are 3 instances of .release just doing kfree(kobj).
>
> In case this is not wanted or with using the suggested common .release
> helper you can add my
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks Juergen!

lib/kobject.c already has a static dynamic_kobj_release() that does
this (and there are ~15 other places in the tree open-coding a static
kfree(kobj) release wrapper), so include/linux/kobject.h +
lib/kobject.c would be the natural home if we exported one.

I kept them as local static functions here for two reasons:

1. Patches 2/9, 3/9, and 6/9 carry Fixes: tags, and keeping the small
   local callbacks avoids a dependency on a new driver-core export for
   backports.
2. Since kobjects are normally embedded in a larger struct and freed via
   container_of(), I wasn't sure whether Greg and Danilo would view an
   exported kfree(kobj) release helper (especially alongside
   __must_init) as an invitation for misuse on embedded kobjects.

Unless Greg or Danilo would like dynamic_kobj_release() (or similar)
exported now, I'll plan to keep the local callbacks for this series
and can send a follow-up cleanup for the tree-wide callers if
driver-core maintainers think a shared helper makes sense.

Thanks,
Ian

>
>
> Juergen
