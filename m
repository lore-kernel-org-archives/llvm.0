Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE6C248BD1;
	Wed, 15 Jan 2025 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938517; cv=none; b=Gm9qIKbLshkDQy1V8ODVWt9EoM5w02CePrD59+0lY2GRDxiwRfA3gNPLbFhde/CEVnL6e212piHxR4EAS1hCxi/rWiC5jSRAY2Jt+wxSER4Ln1Az5atKXuWWE8YmA5ZqyWS4R07krB+6+JQLhp8OEpm74+4MqoRXO3F+XChSXhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938517; c=relaxed/simple;
	bh=lyd7zEr33mWz8zrx+UHujuU6H7PLeHkzFRXn0brnSdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHiDL3vphq3jgcsxby1qC5Dd5O65yQCqOtqq2LLimMHvFqz7Jw7WYKeZITCtY9a21L2QA9KFh5UBA6gtSusdpGMQGQg4lmpfMPF5JmaoStXTcXz9FFucoplS7VCv40yrrandOaRCB1JQ/Ht5C3lyiXhR97kyxjAyNuTF+4dK23k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=au99P/xe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="au99P/xe"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2166db59927so11412645ad.0;
        Wed, 15 Jan 2025 02:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736938515; x=1737543315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHfvlbvA+NRQ/YtCOxD4S8ER62bPooKhwLbssU4Sj9I=;
        b=au99P/xeFWmE7whya71hfPyB27o4EP9fFI52wbc8aVFYzVe2eqBGQnTteXtda2pVkw
         mGCEwNUwv/IPnFaq82hwtpLxYltxGqorteYTWHwGLo5IuZzDX9sgm5KodZet0FtClS8Y
         cacKF4Cval9CcBSqImaOOqwvJhUh3dQND+TCAUCHwpoj2tJ3NHwjwqWxqzKYYvZ3/A+y
         ImQjFKzSGq92qZjYU/MYDLPmVe9Yu66HpjkyuaroqQ60zqBsdNF1d1zZU9IkQ7dgc3xp
         nI+QCnvPyhe2mf1T3poVoLJeRBDNsluD/ZnADXIvKTnCNgu2EOGr/L8mIv2mkseTmfKt
         tX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736938515; x=1737543315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHfvlbvA+NRQ/YtCOxD4S8ER62bPooKhwLbssU4Sj9I=;
        b=AbXjqezIv28St3gCs6nsA3ajkZuKu07u0cbO9EJLh1DFgGpIpoRBX7YId9ZbohlaK2
         SMgvbBSXZtosEbUo1pmqDD/f/tK94DAeOD568cQyYqIfLPpwjAUY1+wOj9TPl8hsOc74
         wXwKZb30d0akdPfBv/K/1CAyNYY23WGmM8d4vb9/baQR9Jt28GDge1VbnbPDw6jUktFP
         7FXygzXwplyWdbPecZLYC3ALKbL3ZUfHRtAKhSCgz7+8Ez8++W4oaoEPgi4gEfsbiX9M
         XmtcRasbnlcXEk22TsTEgv54Qx/QU9vIhHm16hsKxR7svv2qwMLIGDV/bXWEKXqsdk16
         qBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVct9akwAOIi/2hCyZvHLs1rcVTf5rhyo+D9kK4OAtgOfMgTU3KiibB5uctmQFjaVjn4PDY@lists.linux.dev, AJvYcCXQSZywsR7jEFIoIqC26Oq9Mq2TO9XERYeFMdlzvyZI01R5OIPYTF8ThZFdUHbuDQOOMsOvmjfFeVpiDpnZdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfvSAWDFG8I5BBwhr7KqtsDcr373PmuF7sBNCdayO/N/Ep2qhU
	MTRWJfRuqSFt408N2BEJiT+F1wNA9C8sGYBuhg1WIaleUqK2zF8x9q4Nuk0BVRufwCKiJdvwaPw
	Ig6ArjBQa1/kTx7pVgWBalwFegH8=
X-Gm-Gg: ASbGncvSMlJgRT5B4t1/n/YqlEoRq9f/5RJJ5iYdRc3vNg9otmhc3cbdrTE42mCMsWz
	KCQ49u1Li6yBRSShAtR7XRcFhsonueoSTcTXjVQ==
X-Google-Smtp-Source: AGHT+IGFodW2OuJJDnW0zLMl1WF8rCBkDNMDqlgzq7tQ9GajbnzMlXfvVBJn937G24nnTBsxSCh/kYV/jLqnvTWnJY0=
X-Received: by 2002:a17:902:dacd:b0:215:a3fd:61f8 with SMTP id
 d9443c01a7336-21a83face65mr171789125ad.10.1736938515308; Wed, 15 Jan 2025
 02:55:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501150216.3RVz44uS-lkp@intel.com> <34e7c573-8af8-dab9-d435-ffa50e9efea2@huawei.com>
In-Reply-To: <34e7c573-8af8-dab9-d435-ffa50e9efea2@huawei.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Jan 2025 11:55:02 +0100
X-Gm-Features: AbW1kva4fgu_HpB69Vlu4M5GjirHHd_wyfbjW8BRRRNhO6ACBVwFtfou9JOufmc
Message-ID: <CANiq72n6jb62PzgP-3T6sBQRZCDb4Mi1wq6X8vEwRDT-2OvKrg@mail.gmail.com>
Subject: Re: [sysctl:sysctl-testing 8/16] mm/nommu.c:394:12: error: static
 declaration of 'sysctl_nr_trim_pages' follows non-static declaration
To: yukaixiong <yukaixiong@huawei.com>
Cc: Joel Granados <joel.granados@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 9:14=E2=80=AFAM yukaixiong <yukaixiong@huawei.com> =
wrote:
>
>          I have deleted the line : "extern int sysctl_nr_trim_pages;" in
> patch8 of v5. Why still produce this error? I don't understand!

As far as I understand, the report is against the tree mentioned in
the report, not against a patch series. So I would recommend checking
the tree to see what it contains (e.g. what version).

> The compile steps as below:
>
> 1. export ARCH=3Darm;export CROSS_COMPILE=3Darm-linux-gnueabihf-
> 2. cp ../stm32_config.log ./.config
> 3. make ARCH=3Darm olddefconfig
> 4. make -j200

Are you using Clang (ideally the same version) and `W=3D1` to match the rep=
ort?

I hope that helps.

Cheers,
Miguel
