Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AC217B505
	for <llvm@lists.linux.dev>; Sun, 22 Dec 2024 19:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734897478; cv=none; b=LyHbBWIJaw0pVEwDjBYKmRLkRAZtenpkFj+4y7Ut8I+lbdG+LbqN/cUpD8TLcWAwTRWGdjpPTJiiqGM+yJH1RTK1YwbaqMDwTF4kaUmC4ezZ+jotiVJrDzY1OLkIVBtKBtbheMrjodS/K30DcosypIGT5Ub0fGTA+qRojH7fIlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734897478; c=relaxed/simple;
	bh=Ym0YS7VRHCQq1T01V9ORnrgYAQXt4I2mDPawVCDwCr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkRmS6Wt4J82ngWRHS0AMQVnu771VtFAyGYnXcCyh6fqQnwEv/1SGj7EYlz9D1ShEypKMG3B0k6ML/WlBPh9UokmRt6k3Ub6NcYXwMISdddx27t+v93EshjV+UZoCrh6bu2HWXxU+3ozkIf5ZZm2zQRpGv8O7L5CMGtIqvQC1ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVR3JpYN; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVR3JpYN"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so605645a91.0
        for <llvm@lists.linux.dev>; Sun, 22 Dec 2024 11:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734897476; x=1735502276; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym0YS7VRHCQq1T01V9ORnrgYAQXt4I2mDPawVCDwCr8=;
        b=cVR3JpYN5p4PktADyPAtVdkVorOqV4/AomjkZsjNjO9gPQXoAmTVXhYbB5Ok2JLGe5
         s0epaxh+e6dFJYZoaYw6v4OHhnn55vUFizbFVespbwVBTNfzP218l/RV9vNtQRLeVqxI
         LC3kM9lHGvZYeiU1uZVhP7UnSg5RgEBWPIBhN66V7ey19uMtJ1UFIiOx/aW018r5MW+P
         bSBomo15gdZ8hOx6ZbIGO07iXErQj4vj4BiExXTTl1MdZ1S76JJNRKhy3yinLZ6MO+Zm
         H4hcH1j9emRDB29eWDepry8TkqQKUeBG5ptnesDo/yuGWWvkiNfS2VqJ+pgkn3Yw7XVy
         B2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734897476; x=1735502276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ym0YS7VRHCQq1T01V9ORnrgYAQXt4I2mDPawVCDwCr8=;
        b=jb5lc4NvPIxxpr3RqmcW/zTDlooWgo8ziIYNWrq7/Fs+j80Li+rv2pdwws/8iDhTlR
         20UCds3zqd/GILG2amoENb637WqKBd7RrJw9AW0Cek9rWa0ZOM9o490qaxCGDU7IWSVQ
         KZnkcOa8Q6qjaVMvPkTXqujrNo1H4XayK2QxHNQplgue9LWiorj1wsnynS7wLN9DzvCg
         ca6DEKtHSFfuaTdIX0QR+bh7soH52rBZTiDJr/vVfPhiU3zMk50cifzID7qQGnkfPTxj
         OW/LvZWS30e4w8qqmWop0rcrFCP8XOzmrv5VvLGIHEZ5nnyh/AxnWkiPXh1m/Fig985k
         QoHw==
X-Gm-Message-State: AOJu0YySmlQIQL5qi94MKA/V/fcUmksyWZmR5uwFoq2fRRpjiU/Hpq/H
	tp02qLXew1e7zJ9jVB0MIyLgxErSp7+JGRqDFQREvcoE4BGxCktE9uB/4tVOuA6LAuyhlPfm9HO
	Fosbsui4kcgG4IOvH95/7mfXY5gI=
X-Gm-Gg: ASbGncsK4s/u9kHq5xx2dkMkKNrL2w0M/qAe7Xyzi4w/w12mRcFAIHSXVcE02imO16F
	8GFJa9AGt8d0X7bV5JSYGQD+4AFio9r1DroTbow==
X-Google-Smtp-Source: AGHT+IH3U1piM2Qqej3jM7EP73l/tBc4khwq7vdqtDr69Rvk4mHpvI1hjxmFKaoLiiPaIEdK6UMGi2vL+1gEbqNH/yI=
X-Received: by 2002:a17:90b:520e:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2f452d28f04mr6062541a91.0.1734897475870; Sun, 22 Dec 2024
 11:57:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241217212035.GA2842889@ax162>
In-Reply-To: <20241217212035.GA2842889@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Dec 2024 20:57:43 +0100
Message-ID: <CANiq72=DX4PjE8p1rmnOPYV105ApX88PMsDk02UjKs3Qy7DHAw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 19.1.6 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, conor@kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Tue, Dec 17, 2024 at 10:20=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I have built and uploaded LLVM 19.1.6 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 19.x
> series is no longer supported.

Works for Rust -- thanks as usual!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
