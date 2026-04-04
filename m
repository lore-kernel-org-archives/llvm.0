Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24401A6805
	for <llvm@lists.linux.dev>; Sat,  4 Apr 2026 20:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775334529; cv=pass; b=qwJav/6evLvS8ibSOcCYAOYbxBlDnPRN+OgQYXsmk7tRvSTiSf0PG3OV2BRHQ/n5A0CB3RroKhPeCaoJrac6mEN4i9BJqABhF/COia43ISUMiPCx6juPsfZLu3YuC2zP8D1aXOU+/uxtrBcRuAKhK3xogoAoYqMBRNH9yKOEVl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775334529; c=relaxed/simple;
	bh=fuYkWQmMSCPcosnkt/+bxaLXK1ECUYr+DyPSImbwjCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tetNIqhgx3cryJUkaL0rjsjBaGCJRzvs4OLxCPaol9Jfk8Lo3+kY04yP+kbRtc9fHVWEiXmZ+TsVWs1cCm+peGkbbN4qyf/P9rvhc9is3MNBg4ic3k1FYdG8Xmu67Zc/zjgYe/Ti8yr/boYYn6cV2eA3tBihrKWPEOwrNSm6A+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGeIYU/Z; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGeIYU/Z"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2cad171900dso170340eec.0
        for <llvm@lists.linux.dev>; Sat, 04 Apr 2026 13:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775334527; cv=none;
        d=google.com; s=arc-20240605;
        b=kkllFffpFC0TeXP690PKRWHL91kVT1VDTmK/R2TsEewoUt3n2aK/5IUgivU25+fOYl
         AJplBhfFqURqsZ0t4CKjefJB/uhtkmMSzNl6hvuWPsN1YhoCqZrSw1sX5w4+0H5kL2bX
         yQI4iJzL/MxyFaJ3OEyAq8KgMv0aLXMfsiBQpMYgdBtLfYMDZvWiFZVZz/C382sut2Ep
         o5x/MKuvG9h7kg1keFef3nN1AVNEl9+1aqxyUsxZW9m29ebrjFzN+3+KC0Ln0HK3gARU
         A6ze72iJZ+yKVL2Nm163kxEc7gBpZK+jmtonbP9Mo6zAor6/WYNhfdRlIE6huRiCj7O/
         Ek4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuYkWQmMSCPcosnkt/+bxaLXK1ECUYr+DyPSImbwjCw=;
        fh=BRthaYltFDyu65x3kD+0Aa5zpKERE0l5JHimT2iWmCo=;
        b=FSuq35aQXaj42lvVirL+5DQ8Q91iMjDNttQy3ERD0Yw5Xz0Ok/uWMICuuwm+Pb2FeW
         aaRXL0VLrOHGp2vwyAwkTVtPeSFFGj8H98J+SE1lKdoQwcf9NgRw6Ny8G5fSt5Hp3vvI
         LPfzvUwKUofqjwqsl30OYQFqKdZnFzpuuIb5SOD9Vx0eOmNAUCiWC3aso/+Az9BCEnlP
         yb1s6EGESkk56IwDwhdYwcFJb+wXA2SHXNis9Qa/d6+qAzPZeFF7/S8FbMVikpcYM5Ah
         1UWBXq2ef6io3OW7SqXjEacd0PIT/4acyG7QMQD+Ge/6gXgh+VJ0A4DNlDB7trFPC3zo
         mT5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775334527; x=1775939327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuYkWQmMSCPcosnkt/+bxaLXK1ECUYr+DyPSImbwjCw=;
        b=qGeIYU/ZFuazR6T5m4SXmp8qXWMIured38Fiy/cBwn6z7s8tSS+gkbzqRGRxFkvA6W
         IM/bl9Va4wwQiMgHjkt3BZSl/pecbvm3z2T48xb3sa4+zOZBkX7pbqMoX10+Re90+Pzq
         khZSoGMHN1egcfNO7q0GNVR6bp/IeGpaDqw1ZVJC98DRzyvl3JQsH1Gjhojpleyrvu48
         MWQgZswu6rCQTKLIqs5HKZ14FiH6cC2HaLQXLHJEtsBKjQrVnfKrKfXgCrb5o4hsfK1v
         Tzld3KaWFS+8VeBERiSejjlWoUSlh0nIEXfOLnipjvKX3g/Npm5m17myPS00L7v4VNI5
         AF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775334527; x=1775939327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuYkWQmMSCPcosnkt/+bxaLXK1ECUYr+DyPSImbwjCw=;
        b=aWUVPvJBfr9XpNdUI+jka9SZh4uvUOLul2ZOV+wZ0Rc3Fx7FqoecDwxoN9joyf3TrF
         R32nExUcOjL8E0uPfaydd8tSp9biYidkkfSO9nfHek77YJ7ZvQfvjw5YJwxMFdhhyfX2
         2JmLlTDS+QWYtYzaqozqeYq75yx/xEuRZWougKPlQk7jNRqqZFG/AE4KCl3LZ6y59TCb
         IHnDJNMtAW972tfwLisG2F9T79BHI1R2AEltWp4awZuNnrJxTQ476/ii4eg46tBhXFih
         YLuRi6F0ZUWU8PfB3wCE5LaCh/Bb/JijvBh2sY2QDiF0sPRju4FGYie5yzqGG/zdw6pD
         MhIw==
X-Forwarded-Encrypted: i=1; AJvYcCW4K7dGJga/yoWXSR9bQuvOBpCSD6wcGk2qZ/uSUkrmETx6V9rPEK5k5W72LVHygQ1naUEc@lists.linux.dev
X-Gm-Message-State: AOJu0YzUrvQlhPaTcVdKp+/4fRZWqnBZGeOdlH/gCWMVbZ6jrFg7SVrZ
	qkbG8oS5jv8brel21ptLbAJPsNLam9NEbv3LaA0/qhcRw+nFCOc6RXHjAqwAFn2J/7Kp7gSawVA
	iSFamC33sJmY9dyPPCjh47BuVfQMOLD8=
X-Gm-Gg: AeBDieuZCqrCv1+UeCbpXZfh/53P7p6tFB9Exukvbyw/eEnEjq+Ea+2Lk8c3qyiZjCE
	iQ10XU6ZtzHrN0b8avhzLFjoTdt12s4DrMt2HE8sZot+AWtx+5jSDEvHFLZSckSGuQGaDExMvxT
	Bm+wdCREFfg0ke535lrrGX8t238IDymB/ARzWDq7vHsoF4VIFvzQksfb9cYatSVSVNcg1ugdpGS
	U7yO7QCZOr7kJ6n7dIDURJQGhtJcUiqXe8GdSEahIp62JPZ3NLIV2Lf5KMMnbkLxtPiIudb8iLZ
	XzFHKwsY3fOGPWXN0UyKhqqPup185jsbmaILwfR1/th8G57ft2pYpDRvQ0ouom5Rs48ZIL/+ULI
	KVCtfpzW04ogcGaTTqV8gu2pdyvMhyE6xHg==
X-Received: by 2002:a05:7301:129a:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-2cbfce5068dmr1382909eec.8.1775334526875; Sat, 04 Apr 2026
 13:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403145308.1042622-1-mkchauras@gmail.com> <20260403145308.1042622-2-mkchauras@gmail.com>
 <DHJM52JEY7D3.MGKXTZB319ZL@garyguo.net> <adCHe9rU_azp8svx@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <adCHe9rU_azp8svx@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 22:28:34 +0200
X-Gm-Features: AQROBzCykZ4QROsJXifMoD7BMVI05gD2ToHAxvSrZBE2nSQXFDkyMtGKnsPYJAc
Message-ID: <CANiq72=chqViRu08TxDBA9k3fpL6vAVzvBnTrkfY7jM=FD1afA@mail.gmail.com>
Subject: Re: [PATCH V8 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 5:39=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Yeah makes sense. Will send out new revision.

In addition to what Gary said, I am not sure if you will need to use
`abspath` anymore in the new one, but in any case, if you do, please
clarify if/why it wouldn't work without an absolute one.

Thanks!

Cheers,
Miguel
