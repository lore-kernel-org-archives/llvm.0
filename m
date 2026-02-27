Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381533BBA4
	for <llvm@lists.linux.dev>; Fri, 27 Feb 2026 07:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176392; cv=pass; b=Q2pUAhdEMtyQqF7OcBFjdfMPTY2MHhm1s6zGvHz8WpyiC1EQ27hF+cN4M1XZtYqjZYEyX+yN3i08iPlYr0AOte2hge6b4Is+KFF/ba0fU2ekDyKW/VYt9G8LDhk/ZnS4792IQaBH5AgXNWWy2dBvPjjBTM8vy78ig3mA1P1BrxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176392; c=relaxed/simple;
	bh=SR/JluC8J7ZCDXxmWSfd3WPNhXumoMmMVukvPS59SxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8Xaqy34ZmAeNB6L3vLeI8mfjVhcm8ZzvASIhbbMtZ/FEa0z2RtpQBo5HoAeWG5fkSiX1FccQwkhkW0oVZsApWEK9plWqic0hgLKVh89Zyn2DEFhMEfqO/nKSutqR6LwP85a2YI/V19Cn2vxVV7x9Z/t1uAvkVnrKoJ3Uw9rdVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqBsUDHB; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqBsUDHB"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a01c80c34so2852111fa.0
        for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 23:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772176390; cv=none;
        d=google.com; s=arc-20240605;
        b=QxFMxXULAXG6yvUwbC32dqY/iSJ1PsmE8fnsISkDsWiP63007mqOqdWR+xLe6W4OHn
         JUWawcaAwJaKwwYaI7zngn0mm6IiojyUoOUJgdVxlbUc7Hi2pCh73Cs1YUKQQ8PKb4JV
         hS/o3BzNT/Q9+/RKIKf1csooQSiy39SOneN5LatkG4j2ODYEko5WFSH9BgzQqWbnAUKr
         vQmPa4U5zoYgzM610kN9DdozkNAqxUa/BIP6wsIRKAbOtG2BEdqXKoctCMGn/SImdhR3
         eakDjK9BXpA4uuDARp9bsTJgOqhk58NeCcnnHGyFFjIcrh+4yccxG9BwLEqfmLbOPetR
         Fkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SR/JluC8J7ZCDXxmWSfd3WPNhXumoMmMVukvPS59SxI=;
        fh=Q6SejEIvuZlSgvcOp7iDKvh/ooh724a4O4KoMpy5sSU=;
        b=gpPdZr/yvSMPtV+DOGtWDnIC3NdycicccsVsmWndJte0WkCTtSRL0z4m9y1L0xchOn
         qBqeKgxghh3Fs3KCGzPAWvT+HV13nnSwoeShs6VOr3jNWWzmju21e2h+scQN0JPsNcnu
         ZnBDIn2YT344XsnUfsIPdjrYhsUMDCgXaai4+jXg/jDwHjfUuXsLFaQSDjGv5rGC8oia
         92N48cPvi5eAnf9XIEr/r3ILbeodKwkriZaiAjvXoMAO+Aj5YvEpLmzbjgB+mCwYaJ18
         KUWeX7mVpEgPksC3LhNuphO7iHFq2GFqwlPvaxkmg3bOatse/c/69QVWmGs63cbKkI+e
         I/Sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772176390; x=1772781190; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR/JluC8J7ZCDXxmWSfd3WPNhXumoMmMVukvPS59SxI=;
        b=ZqBsUDHBiKl95ZCnFBqb6XmboWt5xXxJKGxWOW3Nw1Yw6QabyzpfeiBnu0yZUnXxfQ
         826kd95Gcrn8mKhYKadSIGODaTNBbFUvbJPNsSHrRPZtRoQrmjFcH1Edw/H+nv0bDeEt
         LBInewUgxexwusYNiNvH+r+NWVHtokMKaSKScza58YCslYFV+os9o4+W2tuxbjJNFFaW
         Qebf7vvV/cxMh5tOLt26N+2fnfgO2K3qtrUAXZOoL5Vjw2FgaBgMYiXXSE5O5Wuakae6
         8M0f44GdEs+1Ek0FBxWfyYmiZqzEEDzRtZtij5OQaGT5cPn1bYiqHsEObn9Fm7JDzkMd
         jkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772176390; x=1772781190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SR/JluC8J7ZCDXxmWSfd3WPNhXumoMmMVukvPS59SxI=;
        b=llR95A/XyZKW7OEhfpkU3yWhX7HY920vyg2l0JexDHibRCl+b1kO+/HinFlRednpUK
         iuUo0xPb8pY6ecOxLxCoiJTWh58OMltH254SQ5fdO1RptKz7NIAMPGnPo5FsuIGnEjmn
         bLzZElyG72BTRQ8UG6HHVCb1CEa9qDzLjL8Pj6OuPTo8LphqKIFnr3KYDkGYAFlCIOEG
         T7CqA0EGYtTvX/0v7RcNQEv/L55BPzb1wzSL/zFMucqwlj7vL0idrMWd72DaE9oJ/Me2
         Li4j7Ch0KDBeuRa3XvgJCRz8lDVmoUtsG0FutXiuyD5DBtmDwJPDNi2UfjD7ah6hp+SW
         u8uA==
X-Forwarded-Encrypted: i=1; AJvYcCWRmv+XIm/xJUZFK3mfzQzFCCxNUnAvrhh88vyb6rLH+rJHbHeb0PiG96CgRuZbK3FneonY@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0Iz7ly7suBQdrR+GS8n0KrVdI9TDZ3xpPv/OnSDZ+uNWuNPxl
	KHhVTj3RITkAqcTQozqDlD/QP3UUvBJHZlY39PX9V0+fFpkDGe/txTFt1nQZFc8kdkkCAhhSQG0
	NLE2PK9VublXaQ5QrnCDHrLB7s1KO6SI=
X-Gm-Gg: ATEYQzwy6Ir/E0HZFPRcNmdNNaSEMlnT7varNH53q7a/0OAUAu5ivVTPI+ylt2YEKNa
	j14chXrelkRU1MRU+8x/N+IypxxKggaiEpqRpZAy8PyhPYG6XrSW6gQnmMtzLLTR1X/5JmNxBDE
	RMwWEgps93GkoWEsT09LcK8FiD5FZO7ulAFd4Y/YUbwtv6f88V/jUzTPOj/QoPh5eKViXoZvnkm
	UVMdz+oNXh+AmwMlOKP9Hq48AHY6apQgamVqtmLT0zk4QvSb4ORwPjeVvwQOMjhAD31q85r+9z2
	4zT0HFGoJyTfY4/+1hpPQvJLJsiX0Foty49DymitNUFlLYF5puHRs5RJ9o7+d4fsU42dWSIPxRB
	uEPa4KqKUUszWtkOtzHhBoOJo7S/eMmTgFNEKeA==
X-Received: by 2002:a05:651c:4108:b0:387:6d8:8d61 with SMTP id
 38308e7fff4ca-389ff136a1emr7706981fa.10.1772176389390; Thu, 26 Feb 2026
 23:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226111721.25454-1-yuuchihsu@gmail.com> <20260226171401.7461b9da@kernel.org>
In-Reply-To: <20260226171401.7461b9da@kernel.org>
From: Sam Su <yuuchihsu@gmail.com>
Date: Fri, 27 Feb 2026 15:12:58 +0800
X-Gm-Features: AaiRm51KmbDywbvnGCMuI-OEwTFm7sEujKELuXZNIkIKm0lI0JiZrT3nt3bzA3I
Message-ID: <CAPAzCqE3k9PehK9gec7pcfq-Tnjsx-reD63GUaO+MEnP8LZ0Vg@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: fix ARM64 alignment fault in fib_multipath_hash_from_keys()
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E6=96=BC 2026=E5=B9=B42=E6=9C=8827=E6=97=
=A5=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, 26 Feb 2026 19:17:21 +0800 Yung Chih Su wrote:
> > Fixes: [4ee2a8cace3fb9a34aea6a56426f89d26dd514f3] ("net: ipv4: Add a sy=
sctl to set multipath hash seed")
>
> Please use the traditional abbreviated format of the Fixes tag

Hi Jakub,

Got it, my apologies for the formatting mistake.
I will format it strictly as 12-char abbreviated without brackets in
the upcoming v2 patch:
Fixes: 4ee2a8cace3f ("net: ipv4: Add a sysctl to set multipath hash seed")

I am currently preparing the v2 patch which will also include Eric
Dumazet's suggestion regarding the WRITE_ONCE() and READ_ONCE() on the
sysctl read/write side.
 I will send out the v2 after my local testing is done.

Thanks for the review!

Best regards,
Yung Chih
