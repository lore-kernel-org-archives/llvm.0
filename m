Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F44918A937
	for <llvm@lists.linux.dev>; Wed, 16 Oct 2024 05:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729056971; cv=none; b=X+0HWBS4Px1mXAI295+r1+lt4vTXff76GwSz0wh3wREw2L7KobycpmKOlJQMsPmx60Sjvn1fInVJ+ZO7VtU4CiQwxof5sYamJKu2S6I22TKCPSWPrl8OQDY4WpxhFKfrtONlWDVJ1iVqTUfWNy2S6lsnU4T2Kyfk121z7T61bJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729056971; c=relaxed/simple;
	bh=AkFlicyemJIypTbpaoNWqMseVAcg9/xRYW9x0I/QujU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTw1EDtqX3As/FhV4PJlIv0xx07/vkdi2F71ufzxDbYTbaGo5TX560Bcgt+IRs5lM2mPudVAd33A/1/wjrtpA4rAXbl8IkHf4xXkyuQlDmiperG03DaaJo8r/ghSchC49X0Xzq6WqGCu7CmfCJFkYWcacX6L7cytc3dzQg3ocVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EobLnUxb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EobLnUxb"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3677040e87.0
        for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 22:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729056968; x=1729661768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpFzgW48v/2WJ52rpa7W+YR88yLyOSmQvacK2YcE0vs=;
        b=EobLnUxbGUchDUEIR4pft3gyaqZ4nWwu+NzRf+aFEBZUCKkVg5ctAfoRwwYEkieErf
         zVRCYnN/AR/dHo8K87ZelefB+SqC6R87lPt8CABYIfPS24UhI5t/kKwEvMA0NpRjdoTJ
         qTIBQ4R8eWlCZQIkpVN6KRxWZ4lwqxvE2GsRILL+YhHaDWA1tR/EtE2p4VDwcwEO5xAm
         yuWLG97IqMe4eNiSeROsThveITKAH0g77ZHWg01eEut/O+izImQ7mZ2oEyHcacLObTIt
         DDUjQbnEoVU7uBbeO33FrIU05+bRy2t7+NOYemIidb/qpxLXtYrBZHQLybVJAsy0d2p5
         T6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729056968; x=1729661768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpFzgW48v/2WJ52rpa7W+YR88yLyOSmQvacK2YcE0vs=;
        b=aodUREv3kd6jrRT0HNnOXBQvXBv6CMv4LJ74SThv8ilnLnGghXb19NNwq70FzUYZl2
         q4JA1/jhfdZXqQwzXGaKVbh58/q2dbrwlw6NxOqbZhnb8uLvav8IRPDIPUa14wJdZN/6
         9enGGpIyMY3yzIKLYLZr65pHL+BTOqc3YXiVFoBqwYTcwvK/Jc5xEgz8fN+St6mm3MvK
         d3RVLpu/OiOBZgC+KzBOvpNow41Ba+5533fNXeVpeuthoEKuHsC5YHwnWHVMNI4+p4bD
         RzDM9JMkDBdrrqsamyRwZCjHAOn4kZvA+RXO/PBrKc+bJ8Kno0Lh8WuvNiwckbrhtuYh
         hwFw==
X-Forwarded-Encrypted: i=1; AJvYcCV6lgPnR7l8ZmY9NoFrjaRwLYpMxWOBpa/AeGH2wYezpy7s5a29qkmeJIefhbqAqgpSPSSz@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1ANy9hVm8Pg3gDLbInO1UVzBOO2GZ+okSDi2f/prGHmG+Vbfl
	UuIMwFSkJPUFcF9FcMbIqm0WSQd3BMtthtZoj9YBTfxqA2T2R7hvMNUSYCduZfUnTb0q/6Ifmyu
	m+ZAkW/WHmb/stzcOaQSA3r3XARU=
X-Google-Smtp-Source: AGHT+IHndmCm/EMXJXuOFINZjOEoWro6KrtmVvkmaBHgAUiFCfIOV+zT26SggvV9rS71zmBuYVLfzcWnox5WdYRK8qs=
X-Received: by 2002:a05:6512:3f29:b0:539:ee04:2321 with SMTP id
 2adb3069b0e04-539ee0424e1mr5151271e87.33.1729056967486; Tue, 15 Oct 2024
 22:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015102036.2882322-1-suhui@nfschina.com> <c0afa02b-991c-4601-bacb-13ace9cb96f2@stanley.mountain>
In-Reply-To: <c0afa02b-991c-4601-bacb-13ace9cb96f2@stanley.mountain>
From: Steve French <smfrench@gmail.com>
Date: Wed, 16 Oct 2024 00:35:56 -0500
Message-ID: <CAH2r5msLmsCn_uHqyzFy8CXy6uCheOECNSXLReJdS4u1C4aN0w@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: fix possible double free in smb2_set_ea()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Su Hui <suhui@nfschina.com>, sfrench@samba.org, pc@manguebit.com, 
	ronniesahlberg@gmail.com, sprasad@microsoft.com, stfrench@microsoft.com, 
	tom@talpey.com, bharathsm@microsoft.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next pending additional testing

On Tue, Oct 15, 2024 at 5:45=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Oct 15, 2024 at 06:20:37PM +0800, Su Hui wrote:
> > Clang static checker(scan-build) warning=EF=BC=9A
> > fs/smb/client/smb2ops.c:1304:2: Attempt to free released memory.
> >  1304 |         kfree(ea);
> >       |         ^~~~~~~~~
> >
> > There is a double free in such case:
> > 'ea is initialized to NULL' -> 'first successful memory allocation for
> > ea' -> 'something failed, goto sea_exit' -> 'first memory release for e=
a'
> > -> 'goto replay_again' -> 'second goto sea_exit before allocate memory
> > for ea' -> 'second memory release for ea resulted in double free'.
> >
> > Re-initialie 'ea' to NULL near to the replay_again label, it can fix th=
is
> > double free problem.
> >
> > Fixes: 4f1fffa23769 ("cifs: commands that are retried should have repla=
y flag set")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> > v2:
> > - Move 'ea =3D NULL' near to the replay_again label.(Dan's suggestion)
>
> Thanks!
>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> regards,
> dan carpenter
>
>


--=20
Thanks,

Steve
