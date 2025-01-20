Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062091E3791;
	Mon, 20 Jan 2025 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384744; cv=none; b=YzGCPMW3JIvCl/LGT6jlIdbXvzOkNlx5Y4/R0J4vIvPaUOeaAcoU59dVKJPu1eqFNUelh91nIuhWjBwLYKg4D3CjY32nlWQm6kcD0OiFdZgKzS47OE5dRotXvka+3Qw17733Vv4CBzovSI1/hjgeEsZ3YeDWD6FyIM9D0yregcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384744; c=relaxed/simple;
	bh=RaoPLZgBBcEooKgsdoQLHlLpw1nH3ifRWIG6rLpPJTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNK4peoSuF7cSVynR4BZwU6dcRsIdvHxkJafeX5nzssLexTfdMlSCj5yfEsZKVVUMe11LZCqpk9xEP+3fxi8NRlDUkbqwatSMmqE7ayUnJoToxo/iM0fl2ibwLl9qPb/EsSVjrphaju4ZRETIwY+4zRdepWDO0xQPbNkYh9gtYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5Lm4fDW; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5Lm4fDW"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b700c13edaso237260185a.3;
        Mon, 20 Jan 2025 06:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737384742; x=1737989542; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RaoPLZgBBcEooKgsdoQLHlLpw1nH3ifRWIG6rLpPJTw=;
        b=i5Lm4fDWUV/3i+M00gLebg5BK3pwMYEW0ZCMb+d05CTV5TtGl1UNwdIXDyylU8NuXi
         mqmNKzjECLcm0lFYK+rkLbwIoaLvSY9ZDe0tn6XQRAjSVgjIq+AgNAU+AxjR7anORhtD
         a+jBihS3/A0ZoMAjMHPrCsyGCvlVTfKr0hTyKphK/w8vXru0ORqSCXV61dMlxamcLBwt
         o5qck/nJgHjoKuojNRj4GqhQREcJz16k9vOKCqKX9hfQXVprO7Ex6/cDn7E4IK13isWv
         Xmr7vKqoDXL/ahq6RzAKZ52ou2fh8izDMrlRoEPwtDex4VgBKk8lRbYiXcq05wqO+sYG
         xG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737384742; x=1737989542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaoPLZgBBcEooKgsdoQLHlLpw1nH3ifRWIG6rLpPJTw=;
        b=iC6pdCXbxpxwPVqLfQZ+U+5YszScWYyxyKp3zh7JFOpcy5WLDfhB/qApbCHXdiSect
         eslp/UH9bohaz6F1s+n7h6oM5JaF1yZty3q9yztjwxzdUrpc6/jmqxnItKIlOHYYM/y8
         Sj6Y9ZwIC4aoF5ECJcnrFs+0AW0JvSgsHU+CV54Gdb699cKsVLJGLy1zYe0CqwMG/+mF
         dqPppbJLvwV4vFNQK6V0Rtqt2vjg5cePgQZ1VYsa7JVl8Iu0pETyvMYYgxUV/Kndz72V
         LLTsbqSF4T6gKtvG5sXqYa7eR1gJNiWVlz1J2DhL/n7ft7Fq5WBRiwCD0undUXsn/8iQ
         KMQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMVicxZdQrfqokP2bhyunIizTR6em9E9OEMVUNYZmEswRbAygweMLJkA8cSZWXJfccY8jr@lists.linux.dev, AJvYcCWXiq+dteEiD/ij171+DFQorh7hH7nYcP3+QcinA/BMzUKiIXO3yDfESabkDZE8EKo+q780Mxl8CkE0sLE43Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTucxATSSHZOpZx65xA+gQZe8kW3G86U2s/ImjDRDYt91YHqCe
	FrvhgWa2lF3uZ13BgK6fjDDrNnp3grrrgz6KOlSxIfRjfO5gp94+mRvBUARLzcZthMveTLiYuny
	/wNz3FnuRGveLHXlj3OuNegcUqOo=
X-Gm-Gg: ASbGncuv09YuhHClAOWzGqhrKgWDUM22ETTz5BKnSAnBlh1Dad25k943DgZxSIjyQIB
	O9Zs5HbX+3nWeg1fMtZdwmwFaT7KTNCJ6yEnWgBVGVJGeasa77A==
X-Google-Smtp-Source: AGHT+IHOF0iYDhGjtFKqesVYQBZBSHpK7503kzLt5SvCMsKCp7E3yKYcupA24HXi8d4YnPAe8EWaZTKUvZZ9YqwhU+U=
X-Received: by 2002:a05:6214:2e46:b0:6d8:8874:212a with SMTP id
 6a1803df08f44-6e1b215c658mr202738456d6.17.1737384741795; Mon, 20 Jan 2025
 06:52:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501201840.XmpHXpQ4-lkp@intel.com> <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
 <Z45Q9zJ8mvE_ut2R@bogus> <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
 <Z45TSqieqbzufJWS@bogus>
In-Reply-To: <Z45TSqieqbzufJWS@bogus>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 20 Jan 2025 15:52:09 +0100
X-Gm-Features: AbW1kva789wojAAtxN-QuKAicW-A4-9ej12ZeSdKMsHOp6_3zetnfg6annpaois
Message-ID: <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>
Subject: Re: [linux-next:master 9185/10024] drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2:
 error: write to reserved register 'R7'
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 20 gen 2025 alle ore 14:44 Sudeep Holla
<sudeep.holla@arm.com> ha scritto:
>
> On Mon, Jan 20, 2025 at 02:37:19PM +0100, Christian Marangi (Ansuel) wrote:
> > Il giorno lun 20 gen 2025 alle ore 14:34 Sudeep Holla
> > <sudeep.holla@arm.com> ha scritto:
> > >
> > > On Mon, Jan 20, 2025 at 02:01:30PM +0100, Ulf Hansson wrote:
> > > > + Sudeep,
> > > >
> > > > On Mon, 20 Jan 2025 at 11:37, Christian Marangi (Ansuel)
> > > > <ansuelsmth@gmail.com> wrote:
>
> [...]
>
> > > > >
> > > > > Mhhhh.... Any idea how to fix this? Maybe we have to exclude some flags?
> > > > > Error is "error: write to reserved register 'R7'" and I guess it's very specific
> > > > > to some kind of ARM ERRATA.
> > > >
> > > > I don't know to be honest. The arm-scmi transport driver
> > > > (drivers/firmware/arm_scmi/transports/smc.c) is having similar calls
> > > > with 9 parameters to arm_smccc_1_1_invoke(). Not sure why it's a
> > > > problem here and not there?
> > > >
> > >
> > > I think it is known issue and must be solved with the below patch if my
> > > understanding is right.
> > >
> >
> > If it's a known issue and affects also other use of smcc why we need
> > specific fix in the driver makefile instead of a more generic one.
> >
>
> IIUC, arm_smccc_1_1_invoke() is a macro which can be used anywhere.
> There are reasons why we can't move it to a module and export it.
>
> > Do you have a link for the known issue?
> >
>
> Nothing handy, but quick google search gave me this:
> https://bugs.llvm.org/show_bug.cgi?id=45826
>

If only these test report were easy to report instead of me having to build
the massive llvm-20 dev version...

Any hint if anyone knows if precompiled cross tool are present around the web
(with llvm-20?)
