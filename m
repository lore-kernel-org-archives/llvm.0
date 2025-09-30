Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E68022F14D
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233455; cv=none; b=VZxjJvV2kJyUMez56CFgRdXyT093JklSSqvriqB7CuW8P1EnaDl/wneWpO9S1uK0PgZml/soeNnMbsR8xg5/H+z+YWSKHVSn7mxni4gkhvPfRjtuktPkroMglWHfdnEl3pPUaaUU6BATDcUssPekuQvGIL+2ixQ3G4bGQABGx7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233455; c=relaxed/simple;
	bh=kqh94AtRdnvNOtGrMAnDMgdoDLSE5h0RhP/RH4pYhF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHUONVjPhOynQFpcxuN3nGyTpdbHNUpf45+N8fJDkpi5n4c3CeD4LL2vitYkNw1eU05Jx58X3LjYNdYqF9DCKZxwDDCDYZcQBTKWZEQx5U292Y7nu/E/ChNJKQIUw/kO7HbzKqu9tqqWMClbrLvCAc+hcnIN9KavOznGzbwCwgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npijDF2l; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npijDF2l"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3d5088259eso394991366b.1
        for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759233452; x=1759838252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqh94AtRdnvNOtGrMAnDMgdoDLSE5h0RhP/RH4pYhF4=;
        b=npijDF2lEFwIkrk/QVzSiFKmBqzFyCM+5n4WBMkLm96/Nd4pPzoV5vy0xRuKY//Inh
         E4L8o2X00WseAIhlAKoAkBpYrWA8Xga8m76QMxJhJoig9tFMtKrm/IBmnrWPBU0m8SYc
         Z8g9FfsgiGxIsvThdxHOEjU+Kq59a1P1nWpgIGnJSV9GcPxpRwUqjy6BHZvZDquR0zNa
         LnKcApl+B1kBWYIgZ8f6OA8vYzjWaKHvWHgL9rXalpxh0h08IFNXlI8DgAs9aLwbB0Ge
         Egv1wKmkj1Nfq5skt9aMpl3gnZjAF2AX1cxNeZATFNTbSRInbbYCk/5JrrApczqdAEnM
         Q5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233452; x=1759838252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqh94AtRdnvNOtGrMAnDMgdoDLSE5h0RhP/RH4pYhF4=;
        b=sWJS5zTfojWe+Xe5lbMogOpJswHtXotALYWXtUZTlQVhvT+U4nnDQ0+KeewTq/r3Mm
         BsI5eOphQ/x/8o0tHoTI220O+5d9JHaWPcD0bTZjd2A/Y8mCZtNN/wsNdrEzRJGxcOEQ
         uPSU8oWiBbjTm3CXQKOclBKmAsYWKfq12XYv+AmyCBvyGAmEoYqwj0oKa6rUqGltm8pt
         heTO6ikAubOIeHdWnHsV2efi+NphC1KdNYgeJjPXTgsyCDdCxMKEYVT8cNwCzkcsPQIv
         L95Zn/0PdGsRNiDOQftUzwlNymIaI1pQ94AEUDrq2k1OEDbr4lQKabAO3+KJenBHI1fi
         VKPA==
X-Forwarded-Encrypted: i=1; AJvYcCUenR+/rxgVDLWK7bY1l83tCZbWQ+YSuJURjL4B2k3ZMiZUxpUJGD7bbYBxI50Wd6xAu47U@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo36EAnl7MaLgWLAsDUToQe11N6JRKR3ZuWgukHZipRKtdWoy4
	28UEaRdc/YYGb3E9YyFBr4DpISQh2If8ZahL1dMaavxsx2fcjQzMdDhExla4hR7mNhQMoz/gfIf
	89cKgj67JcFvlznBx5rZMjJLys84vxjQ=
X-Gm-Gg: ASbGnctzO0wAqvPlCmMN87CzFZ5EBPyShQ3AcCyTDGVujVW+Kt1jds/0bJYWPXucesq
	qItPX5LBmFux00z8JtZeammo+SoXsketBLPIkyh7AnHpmi1GswaNh2Cr+DVz1Ad3E0UBMDNAW3a
	P8x0ODYipeyMpHxGCUGCL1BJrDNXuJe4nHb9Jy4DrrKIv5uCGCNPsru6AIpBPSm8Yor5LcnJLCY
	qnsZuMLKJeqJREEVo/WC39VdxDF+DCeDDGdUt9ogJJBw+hHtItiQVArloSiqOQmSVOxqYv8g0J3
X-Google-Smtp-Source: AGHT+IFMtK7lQG2C6CXy0BdUz73VA5EZWA5GWFM67vubKVCmaj1C4S2cfo3XpGObqlbGqLwQb0CID+MEAVyWsVhI3os=
X-Received: by 2002:a17:907:1c95:b0:b46:1db9:cb7c with SMTP id
 a640c23a62f3a-b461db9dc6cmr76159766b.33.1759233451417; Tue, 30 Sep 2025
 04:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250930100656.80420-2-sidharthseela@gmail.com> <a21498ff-4dd0-4b3a-9b2e-9b932b5925ad@openvpn.net>
In-Reply-To: <a21498ff-4dd0-4b3a-9b2e-9b932b5925ad@openvpn.net>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Tue, 30 Sep 2025 17:27:20 +0530
X-Gm-Features: AS18NWCxdvM572oUhIGZSez5YvvgrvAB2_xyu9_VKgGBmy-3EY7uowJXb-VjjF4
Message-ID: <CAJE-K+BrTdtXTF6VgRzen=YVmuUgU8ktu_36nXqc2vTF=u_vLw@mail.gmail.com>
Subject: Re: [PATCH net v4] selftest:net: Fix uninit return values
To: Antonio Quartulli <antonio@openvpn.net>
Cc: sd@queasysnail.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	willemdebruijn.kernel@gmail.com, kernelxing@tencent.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 4:50=E2=80=AFPM Antonio Quartulli <antonio@openvpn.=
net> wrote:
> Hi,
> Thanks a lot for fixing this - I hadn't see the warnings with gcc.

I am glad, thankyou.

> ret goes uninitialized only under the "if (!sock)" condition, therefore
> I'd rather assign ret a meaningful value instead of -1.

Yes, you are right.

> How about adding "err =3D -ENOMEM;" directly inside the if block?
> Same here.
> ret goes uninitialized only under the "CMD_INVALID" case.
> How about adding "ret =3D -EINVAL;" inside the affected case?
> Both values are returned by ovpn_run_cmd() and then printed as
> strerror(-ret).
> If we blindly use -1 we will get "Operation not permitted" which will
> confuse the user IMHO.

Alright, understood, Thank you.

Sending in the changes in v5.


--=20
Thanks,
Sidharth Seela
www.realtimedesign.org
