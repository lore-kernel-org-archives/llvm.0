Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F32459F7
	for <llvm@lists.linux.dev>; Mon,  9 Jun 2025 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477086; cv=none; b=EmpsXQyu2ikZxmyW6WTgJFftJ8G2gS+yD45yFCYSKUvASkcehizdiq6HDfEGktyec7zyA8ny3EBSGDajAl96CQnpDKm+N6UiPiOKRlJ6p4jqdMmrtrqnNaVret1D4QeQhkSwzBMJBqRg2rIm0/+QNw33LhfvI/Rwi8shnHycv7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477086; c=relaxed/simple;
	bh=eACaxt02WUWamov4/PRFJ2M1YIB5DvQrMTadVks0Ha0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fnJk7ZkMVU1QAtMYbVQL836Y/qIRnGSq9XcpERiLmhCTl5mC0xZXGGoKnFnCH8hnWCY67ohiT0/jMDVoQX4pQ3u2+z8JDdnCTyYotqnMA0aI9ptsqgRIXYLh4ypBTonG0wiqiQL32tm+8W7MR14MiCw0mbdlRthdjDlL/cK2Trs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bq/FKNG+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bq/FKNG+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3131aa07b50so574514a91.1
        for <llvm@lists.linux.dev>; Mon, 09 Jun 2025 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749477084; x=1750081884; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eACaxt02WUWamov4/PRFJ2M1YIB5DvQrMTadVks0Ha0=;
        b=Bq/FKNG+N16hvDbLfztfZjmmEcHog+ApJCEj3ceV1x5qs8DIepmx5RbXyDIOaTjg5w
         cElzNvQU/VwmCG8WjVZlM0M4OzEhaR3DJzRUgG98b3g65CPqFV9+WGX39Dm6BVyJ65tv
         LMMpV3TlB4ZCgQpawU+cS31xE2xqCO2MRrUD/t86/HAmoxXU5p2BP7GboVpyZY+I7cuV
         VgywCK442lJSI2M8oD3R6A4JDGhE2aorgFjUND+xZ8jYn5wvPfb1SwBq9EnXn9UAHvc+
         4A2nY4OsXOq9UxNssOKfWewDwdIs3N6BCXicneZT5iEq2KtsVktw9zt6aLLZjZBS3h9/
         T9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477084; x=1750081884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eACaxt02WUWamov4/PRFJ2M1YIB5DvQrMTadVks0Ha0=;
        b=G/zgLxAT1JRuDfljl3DV7CFsZn2qQFZJFSjCNGYLhDnGRrxFuVVwOyw52/aIv5THP3
         uRJz+X/jtK/3P/KtE8ZaamrKCQI2kcTV1whyanbN4SA2RYonzmEPSBzYALJh3cY0QjgF
         7Q/RbPl4C2oR5Ol820aWZ4vU8Vz7mUaQ2hP2WBTNiPWTGZ/EDvwtDURf8i4cAJmVFVSo
         7lOHKnx/d24AKiLUFhZBMxKqZIeuve+VS8IHZaEfhMDsVm5B6w+p5gQ5imaw9SaTq8hw
         3DJlRzuXXBA6vSsbxM73LNtK6yHuNobsbyD4SChWX4gHM08HruseVu89x0q6IA0vWYEz
         Ee4g==
X-Forwarded-Encrypted: i=1; AJvYcCVIYX+EDdauyoLt4VY/YJP3TsyByOMAVnsw3+vLlyL2HjXYRT9cfsqKvYCrgKscor1ODMOj@lists.linux.dev
X-Gm-Message-State: AOJu0YybyXUKFuwmxP6CMSH6DkhVYAoI4VRcuUZo3wFyBmdgBZsjNcWk
	f5amP19cA/7Eovc/qcfxIzbE8JOwhabWh0nLZd8AjFO55Hj+si+4n+lxA6gACS6jkCJeFiwTtVZ
	3wakSCzdxm7stpfqVKKjjm9EYf61is2M=
X-Gm-Gg: ASbGncvNOXwJN+9rl4VA9D9oiAOG/ssfQJTCF31QAaU5AH+Tn10K3sFsC7M6rGllbnz
	oe2IoCSoo4dM5oLNJmI84ZABpjuDJHvJvQz3EF3tlWRkNbjMp1529pp9iqY6k4qr2nAnZJ/CxEE
	fKzUMODMPzpHHwGy3682ciwbwVqkV1dV5B8bKNj4hYFvo=
X-Google-Smtp-Source: AGHT+IGkkCxVNET2hTnCQKkB5ht2XhMJXmVkVA6QMXG//p+Iy2xKOFDBp1eOArmCKNe88x3UOn8NtAfKsUQfancfTHU=
X-Received: by 2002:a17:90b:1801:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-3134e2b90f8mr6572065a91.1.1749477084002; Mon, 09 Jun 2025
 06:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241029140036.577804-1-kernel@jfarr.cc> <20241029140036.577804-2-kernel@jfarr.cc>
 <paezt3cuux5kwv7dvyuo4rrff2felwzmjunkdpyxqjp3fbnyzn@rcdj4xq6djio>
In-Reply-To: <paezt3cuux5kwv7dvyuo4rrff2felwzmjunkdpyxqjp3fbnyzn@rcdj4xq6djio>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Jun 2025 15:51:12 +0200
X-Gm-Features: AX0GCFs-AANvO4jrbUE-NjAZoTdqBDYVE5mIEuWtE19UmN1xM-LkNwTb5ope6jY
Message-ID: <CANiq72=kjk5Kkebz2-QrOuwRKENAziTXhXrnKNL4eoOo4diO3A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Compiler Attributes: disable __counted_by for clang < 19.1.3
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Cc: Jan Hendrik Farr <kernel@jfarr.cc>, kees@kernel.org, nathan@kernel.org, ojeda@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	thorsten.blum@toblux.com, ardb@kernel.org, oliver.sang@intel.com, 
	gustavoars@kernel.org, kent.overstreet@linux.dev, arnd@arndb.de, 
	gregkh@linuxfoundation.org, akpm@linux-foundation.org, 
	tavianator@tavianator.com, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 3:14=E2=80=AFPM Dafna Hirschfeld
<dafna.hirschfeld@intel.com> wrote:
>
> Why is the define of __counted_by moved from here (compiler_attributes.h)
> to a different location (compiler_types.h) ?

`compiler_attributes.h` is supposed to have only things that do not
depend on the kernel configuration and so on.

It sounds like those out-of-tree headers should be fixed.

I hope that helps.

Cheers,
Miguel
