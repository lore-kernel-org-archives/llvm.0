Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FFA15B992
	for <llvm@lists.linux.dev>; Fri,  9 Aug 2024 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723218160; cv=none; b=YnSLRPYuNaszbg/cOGqkEZgHgGmQl+9cZHOoI0EHZpBQxinPeekfdAh+nlTnbfA5YTsKAMJlW2qN0qtDlU36qYF4HAuyqiDAeDw/LReOSNguOSwvad643vDuZceuU+aKI/LC/ZisvkszALnuMD2IrPNiMEYGpXsJVJL0K4RVNs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723218160; c=relaxed/simple;
	bh=47MegqXO0E7Vr6IBuWT0dp3jago2unJ5qdItWmHiSQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrGdwADp/rs7jOVq8HoE2Q2SRiRadRKvHlUwVtlbYTi+S9linj3ju3kxpUoFBcGkqiwi4TGdT+UjhQ8PFWRqdiqsdi4ICqFXX5OAFNTzSzXHmfsRxmiBSYiksSqTMkP8ulrYsSMMogLBHWx+62/1I46a4zbtMxNk7ywXl3y6dj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXdZ2/Q9; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXdZ2/Q9"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso22330401fa.3
        for <llvm@lists.linux.dev>; Fri, 09 Aug 2024 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218157; x=1723822957; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSX5z71Ic2mcCJIyuQl3/ERa/3iXO0QhvWRXQN2FvGY=;
        b=AXdZ2/Q9xZ+33noPlIkFPtzheDX97lxAsOzZB2d1bPIU72nleLZzmIUZDhtGqUweGF
         cZQL2OXDR+M/AQWbw2IdqeDOF0PuZdUfVJGn+CI6lLzdxDv6Qn8sM6TGbo31ZBgmWkey
         HwUSKIXgHkZYZeb8+3gSgdjdpzTjIFMXoUGhTUsBOHnxz0f1z77PwiV/9yjRYRgOiRTI
         tOvDcX2iSGvN62ukfEZkzJR+lD/41sglNrxE6CmCsO6lhRLhKTXa4mKQQ2bv54MZf4N5
         ioZz9XS2iPwqT02FW3rUHLQ0rYbprluDZRi0j1Z1WeeBazVwxZ3ydroY4MM8CQQXmyPc
         1V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218157; x=1723822957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSX5z71Ic2mcCJIyuQl3/ERa/3iXO0QhvWRXQN2FvGY=;
        b=kqukGrTDPQyZqFaI4/Idmi4fvlxE3z/k0x+uMo3lK9eIrEhTkLhTiWEeVd+Jz+AABn
         pcoFtkIRUF8KdxAidluO8gqjZ0WI51229Vv4DJqiV5ZU/A+ViAmR/iGGgSrM4ARdI4tA
         H9+7hvq0MPLzUwrgr9BYHt+N92U4xMcJyb0l3gRk/n1UyrQ6VRlmMXcFpW7nFgLua/uU
         mcCWobZBtpCUauVtMfswQMH+/qu07kcCX/e1s4n3CuF/cW1MGwZZ3VFakyDlVlwMuasq
         KSUlJp1Ia6T4Lx8lDQkhEftNsq9wrMO1vFzIQpe/Q4PhYTEnbcC5hToQNQh3MHHYenyU
         dHwA==
X-Forwarded-Encrypted: i=1; AJvYcCXxydmKHakeCpLxSG4ZoiW0rF02tDHI4mOjF2R+Zx/STMowGsjct7EJm+qpnkOY1HdiZBMek9dSqn6KVQeirWhhwqn5Jg==
X-Gm-Message-State: AOJu0YwZI86mDPEgvtVhFoTLUqWFuvDMJL/svZ9/I1oYskd/A6+Jmkaj
	W1FAv62VSovqOjUJNpMgP1y/bIOU4cHgxHR+4AggLgtdmcv6L5LT2nWEwG7DtQM8fUyMctHMWQX
	KLvQzZJYDzRjbMC6UxgpA//zJ4rk=
X-Google-Smtp-Source: AGHT+IFf3tUCbIQMHNGwguaQ9im7C6T8tOEzS58zEtUlzxRikiSdKkWG25I/i2K77g4pYlFNNJcS+X4cmA9+McJ8CNw=
X-Received: by 2002:a05:6512:3d8a:b0:52e:f2a9:b21a with SMTP id
 2adb3069b0e04-530ee97a165mr1351764e87.19.1723218156526; Fri, 09 Aug 2024
 08:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808122331.342473-1-suhui@nfschina.com> <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
 <a08c6b03-6d23-4711-a891-14b0250b90be@stanley.mountain>
In-Reply-To: <a08c6b03-6d23-4711-a891-14b0250b90be@stanley.mountain>
From: Steve French <smfrench@gmail.com>
Date: Fri, 9 Aug 2024 10:42:25 -0500
Message-ID: <CAH2r5msS8_Jc0hRXqY==OGiaoJKyjqkh7HT0esSKcEvsxht46Q@mail.gmail.com>
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in cifs_free_subrequest()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Su Hui <suhui@nfschina.com>, David Howells <dhowells@redhat.com>, sfrench@samba.org, 
	pc@manguebit.com, ronniesahlberg@gmail.com, sprasad@microsoft.com, 
	tom@talpey.com, bharathsm@microsoft.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 10:11=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Fri, Aug 09, 2024 at 06:00:26PM +0300, Dan Carpenter wrote:
> > On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> > > Clang static checker (scan-build) warning:
> > >     cifsglob.h:line 890, column 3
> > >     Access to field 'ops' results in a dereference of a null pointer.
> > >
> > > Commit 519be989717c ("cifs: Add a tracepoint to track credits involve=
d in
> > > R/W requests") adds a check for 'rdata->server', and let clang throw =
this
> > > warning about NULL dereference.
> > >
> > > When 'rdata->credits.value !=3D 0 && rdata->server =3D=3D NULL' happe=
ns,
> > > add_credits_and_wake_if() will call rdata->server->ops->add_credits()=
.
> > > This will cause NULL dereference problem. Add a check for 'rdata->ser=
ver'
> > > to avoid NULL dereference.
> > >
> > > Signed-off-by: Su Hui <suhui@nfschina.com>
> >
> > Needs a Fixes tag.
> >
> > Also when you add a Fixes tag, then get_maintainer will add the David H=
owells
> > automatically.  I've added him manually.
> >
>
> Actually, David should have been CC'd but the fixes tag wouldn't have poi=
nted
> to his patch.
>
> This is an inconsistent NULL checking warning.  It's not clear to me if t=
he NULL
> checks should be removed or more added.  If David were trying to fix a NU=
LL
> pointer dereference and accidentally left one unchecked dereference out t=
hen the
> Fixes tag would point to his patch.  Since David was doing something unre=
lated

Looks like (if this is even possible for server to to be null) then I
will need to change
the fixes to commit 69c3c023af25. I will update the tag in the current
patch in for-next

Author: David Howells <dhowells@redhat.com>
Date:   Fri Oct 6 18:16:15 2023 +0100

    cifs: Implement netfslib hooks

    Provide implementation of the netfslib hooks that will be used by netfs=
lib
    to ask cifs to set up and perform operations.
--=20
Thanks,

Steve
