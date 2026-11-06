Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793924426;
	b=Yc5sXEjNB/jyRIENGIy2Rf9axJAy5P/26Kgbo4h5ZFrNGapTrnergD4G2eNfMzOLAiCv
	 oVpDnxx7ZV8xBWUiyVLuf2ArCaaiT69yArVJu/X2+zeNHERO7mecHXW9qZBbTM+wn6pNK
	 wVqVSVbvAAZ3NzThc1CA7hbD4qjmMovmHV39TBVv9UyWlAEmoKMWf0dODRhH7D5umV7BC
	 YQdMJyfOkyVjdeEGgf2x6wTggXEccSMdRTiPRqK2YeOm3Vc9kOk5EnJKeZFCBpVADnq+A
	 O70mAeyy34yo5qmTaS+akioBcD4buTlgYeOvGPeTVg+Fus01+KZEFDfvugsvoZ7eO5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
	b=5ScBHueMn1ZVo1ek7I/OcXgYvSzzdwQKQ2Oe0ihqbdU0dqlNewAV6ewK7d9McMuNn2Nh
	 2e3Z7fYt1n1G1sbExEg5nbhDvEqwnG9Lc1DOVh1HAyN52nmqJCvel1W6yGB8GYUqfj9BO
	 Y/1Hankw+IHQQzP4dxeEwn4yPLNVm1zCT5eT7LZt74NjtoXCTXODj5pRlkWieXdZu9GQG
	 nxcoEVZZ1COfv73Y7cOpNZ/zXPy1WjLctum6pdyHjJRdg9vdyWTrOiQR+5OrfLi8WQBIn
	 N6EkR2FxOa6aLkktqRgYqTH5hTlZMtRMz+gqNWfgKq4DzVB4+JyuiYh0nlWzX60Gz4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AQQ7VH8A;
	arc=fail smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B68606A31B
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 00:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B68606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AQQ7VH8A
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491aaed7565so65793f8f.2
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 16:20:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924425; cv=none;
        d=google.com; s=arc-20260327;
        b=soGmCg/atsk0rxiT+0xHOYNfJKTEKrf6N23d2GeXUgVQ4CwWf8dERHXuh2lblTtKof
         z4kDtJcN/gg0UJMsfSeB5OKq444OEHbdy2rua7mJVi8jpnJR6DpdhVW9kkuICFPUDANm
         3wZ/sELvt+v1rSzDSjjpX4zF+d1a2IUDfP/bWZ/LUX5FTyQp+Upv/rDXqTT9hm5DLWNi
         ec98mJng5pWqmyPfxuKFxGmEaYJ8prXvtrm3aqatUu5DHbTeA1lsl44sNBNNSIKNWWOH
         i/W72kza94p+je+wAc+6/YghUwyMEsHdu/78rwfEp+WdgXysQByOFb0L3Lmwo+9SkoNO
         vnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        fh=7qpkSgKamJRchL39QpEj3iDmfq4ZZiiwLnehlrR5SAc=;
        b=sEPqr8FggwAbPCzt3vlHQQDOcj5LBi/iVn8EmjwhGDK6/iAvxHGqhDQ8pdYds0dyvN
         s1qTaJZBPZDDoWcB7FBYHrGC2lqvdic3sFx2cpXSkZHJNGTxKSqydraiFKW5c8f8VrsX
         9i2NtmrIejDaopZ71Tx9xXR/SfH1z/K3tA78QyGr1zQVV3D4c3S0nFPi9xla3XEqd6W2
         IVytkuS5zSBhAsWIUcPt/8Pnd6cmV0V4p2Pv2LBtdgTQ07vOqQwy3qWSjKC6C90M1Hut
         6ea/5UHm1oIrGNGi80u0V1qnuJ0RCYRN49aA0DkhyF8VCAtD8DlUTnZTIY+1oi2D2Sss
         V6UA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793924425; x=1794529225; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        b=AQQ7VH8AqKetxU94DLFuyCv1fGsUxzjs/JolTT6PFhGurjRKOXbHCIyDiTZCDMR+VD
         7c9FwShlPXFGHl8HRnmWJLy6IDBJQzHu5K9HMCGm2NVvOrAvIBNBKpVIV/n320dayzGR
         Ley+KdW4LC5PGqu1/EJvnEc0PyghwlzDLXxvo/AkXlu3kyTFxHZA4B3bID4bkiCYyN+G
         pOHk0jdgVMnhoNR9jhUSKxMZvBIAkKt47nevE3APAQF0AAIvW8D4DNs5v6Mj3cU+S66r
         KXD4KOvwKbtrrUZkirF57w/0P2mFdUvJqBjDvjWyMABBBGl2Isj2LT/0+2ejqAx868Cu
         GFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924425; x=1794529225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        b=S2ibF2o3DC4CSE39p7YBKVUc60mdoO5hAYPzPueRfzUWFiB0j3LQ1MyqI7gKGM6lgA
         /8TWq6wM264lMo0mz8d95lq0Z8KUSJSUZD5Zl7qHM/ScmR/5H7Z3cBSi83Jq8f9kOEsq
         mplgKSScFL/enaQuQpbk3TFqXxGrO1yTgAdodZV7YK5i1h9MM+UnlWdLlFyLwSkriIRY
         B2o8+jyMhR/3113hxBEZoj23bE9e3sU85vJmdC8IymyDsBZ0ctRKwxX9RBOYiI37IckK
         a1UYyyMwgDQIMuRRjoA0HWIAK+ETlTcYB087/tvkNTH0SCfzXs1sVsp629qRn1jDS4Zd
         PnSw==
X-Forwarded-Encrypted: i=1; AKwUvBwANr2canakpu2IH1vvm8KLpE+EhWUjwTUF1WnBgOSR2u9r46Q3/1lpqZI7nxr1/lzAbz4e@lists.linux.dev
X-Gm-Message-State: APuU4Z89NLCRKpa7CzlUQPPZu0XBNmbnCLP+W3DpE9GYW+o/ldbraDva
	TGzAt9sk4l1VyLdkY1wSoBp+0PvmILDjA9hl0ljEyDtALHVvmKAjy8RKFzUvnErdHVdYeG9ADV4
	Nz5drzYyQ9UWc99OxMwsx/2ZhMHPcBZQ/XfWVRM5O
X-Gm-Gg: AYBFou1jfwD8MWZqksMW3sO3kEUYB+242HOKP59pChezTQ0+w8kvRzF3jDAOTDGo9mL
	6swtoN46eg2ArotjNjwCHI+G37KJw4Va00LRTLJAw1eXlDpAo/bvuW1h/GrN6AbbgZcwP1CEUZ+
	0fkWX8oIGNUdgiAl3xjEnki0Fzsx2qBRaSwfpuIJctEqUA/Wcs4/wmp9Fd4CbRRyuqT54oRHtJv
	JHOAWjTpWUdISB/DDiBixodVuwkOHhe//X/hnQGkvvuo1PGYz4BPidVd2NRf4a/KvahJJEYlVoO
	/TbiestXIKnRUSVWyXTZRq0oECe5ArCOV3pZpcoyvIpUroE4Sn3wUqE+rbtrm6h8ZkMZTz9GvnH
	9dAmFV/i4WA7WIxDtoEbPje98CkmrBaFnazOFBjoguuniKxxop1gsewI0vye7Kyeaa8JRiwOZew
	jUh+kkDi+wJvYuqf9BoqPwysIF/VxmOcfKUfXBeNM8zZ/bfJfMPjEOOZmWMOgW3rEQLhJ8nHZ6+
	Fpcr7xF/d5qSTx5OlT57g5qpvn2HEoXo0cN
X-Received: by 2002:a05:6000:4a03:b0:48e:412:3829 with SMTP id
 ffacd0b85a97d-492764aede3mr2311906f8f.15.1793924423911; Thu, 05 Nov 2026
 16:20:23 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
 <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com> <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
In-Reply-To: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 16:20:12 -0800
X-Gm-Features: AclHuK9ycOqos5AEuWbFkVouFGAMYO4MjJByfnQj2RCd2P8bwTy6_fG6ZmWTcd0
Message-ID: <CAKwvOdme+2Lrm7Ds8vp71WVzDXfW61o2eFRjjtTptpskLTuyeQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>, Rong Xu <xur@google.com>, Yabin Cui <yabinc@google.com>, 
	Yi Kong <yikong@google.com>, Han Shen <shenhan@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, "Sriraman (Sri) Tallam" <tmsriram@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:17=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > > While I haven't looked into this specific bug yet and am unsure if it
> > > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > > to disable Profi for now.
> >
> > Interesting. I can suggest that to the team digging into it and see if
> > it solves the problem. My AI agent says it will though. It claims that
> > the default flipped recently and "-fno-sample-profile-use-profi" will
> > restore the old (tested) behavior.
> >
> > Should I send a patch adding that flag?
>
> I went ahead and posted the patch:
>
> https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2=
e1bafce6370@changeid
>
> Obviously that patch and this patch conflict because they touch the
> same lines of code. If folks think we should still move forward with
> both patches, I'm happy to rebase.
>
>
> > > Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> > > reservations about adding it for the following reasons:
> > > 1.  It is heuristic-based and not enabled by default. I am unsure how
> > > thoroughly it has been tested, so we should assess it further before
> > > enabling it.
> >
> > FWIW, we did find that Android seems to enable this globally across
> > its userspace, which suggests it has been fairly well tested. You can
> > see the change here, which landed about 1.5 years ago.
> >
> > https://android-review.git.corp.google.com/c/platform/build/soong/+/352=
4291
> >
> > A few notes:
> >
> > * That change _also_ adds
> > "--salvage-stale-profile-max-callsites=3D2000". Internally, there has
> > been debate about whether adding that would be a good idea, too.
>
> The conclusion of the internal debate is that, yes, we should add

After Doug sent this email, him, I, Yabin, Rong, and a few others met
and decided we probably want

-fno-sample-profile-use-profi

...but then I stepped out of that meeting and ran into Yi who
extensively tested AutoFDO for Android userspace and suggested _the
opposite_.

i.e. Rong suggested:
yes: -fno-sample-profile-use-profi
no: --mllvm=3D-salvage-stale-profile

Yi suggested:
no: -fno-sample-profile-use-profi
yes: --mllvm=3D-salvage-stale-profile

Yi, can you share with the list why you hold that opinion?

I suspect we'll want to disable "profi" for now, but likely will end
up revisiting these pairs of flags in the near future.

> `--salvage-stale-profile-max-callsites=3D2000` too. So if we decide to
> move forward with this patch, I'll send a v2 that adds that flag as
> well. For now I'll hold off until there is consensus. :-)
>
> -Doug



--=20
Thanks,
~Nick Desaulniers
