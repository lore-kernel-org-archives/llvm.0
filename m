Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8822FCBF5
	for <llvm@lists.linux.dev>; Thu, 23 Oct 2025 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761231911; cv=none; b=NFS7MfCzxBYAXFTyOGvRxiSbrnsJ5FcPnsHH8xDZD1FaUArv+66Prx+Jbc6slJcMEGoCrN3uk2DNssY4SgzQFw25D6WCnM5zotjluYpG32geb8J1YZWThNuu+5cuQn7sIH3BF9oI/SGt8NKlSOzhTQtKQMuLgdqYq4wMoeoEi/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761231911; c=relaxed/simple;
	bh=GHxA3c0yV6CEoBK6kR7057V7T1cFgVLHP2eCafXealQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHXIDwutPi2TdXUBPRYIDEx6WXk2bUR87qZDF9yQbm0JPZI4tVc1AmoBTKtscJskW+rbWIdacMa75gEjwjLhuzx1YEWx5BvOwH9p2HwaZ06nfuKOMl37MkyUbX6dIHuGK8GPICH6/fg/kERr26/lUPI4fWITtH8tqhxOHWkf2T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGGOd1hx; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGGOd1hx"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so1973013a12.3
        for <llvm@lists.linux.dev>; Thu, 23 Oct 2025 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761231908; x=1761836708; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0g9O1UAQmliCyOFgls7R54UMarfOxqkSzanB1NMWGZc=;
        b=MGGOd1hxVYtyhx/O1i8+layHzLpRoXv4VAu0oHNJ0QV3l//Bk5My7z+qKxy/YqF2I6
         o3/nDttwUViDuSZwzvnLz0By+7vk/s0eda+MZYbbTl68+orY8leYXzufNQrceQr3qKDR
         bX0Lhsef85tCDYy+2lbCBnD3rgMZFM6I7y3FqcACo5KYcX1sBIzRFsU6FIdksLAGhO7T
         TOHL4NtJ6BXKedEdmd6LBB1H2Du7xs7XP9npXPN06SmFNTdAJaIn35iYj7oSiQmBoRo3
         ltRmeNcAwFNCLFdTHWzQ3kGVx4WFnV37nxtCZH6t4IkQhWFrlCsV2oeZiKe6uvH07z/I
         LmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231908; x=1761836708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g9O1UAQmliCyOFgls7R54UMarfOxqkSzanB1NMWGZc=;
        b=wHzAsbLJigUqzGOGYF96jtHL14xp7sC2vYL1lN/cOoUTchPs5YdYgwgUJV/3JtP7wH
         eJebW2KHYtkWt+m9o9NWEvpmE3gGK+xfnHzatPegB1ogqO391xv66lBlRfjm6ylB0QMf
         Z3adl0Gmybvk6TsRY+OZ+bu0VHNHSW8EgdIQLGwxKL7rmJc/zRROHfSNAfmvNZuPwk3V
         0ugzl8q9jLKSXi/eOX0NJTl2L1MAYCxitwz9gp60lkt+iYEmRYl8O/VunSfevlWCa3pU
         4viw+M8MaNTFDmfGXKI8MNXyObz4YnXTaiXDKw02foBpAKK53awPhsg2w6SkL6aBCEn6
         JJYw==
X-Forwarded-Encrypted: i=1; AJvYcCVlCUVwy+ztIOCmhHDQzgbiiSxgJSQD6329Etc6X7NRUYLEQpafZ8IY0xXaqH6cXN3EIm4M@lists.linux.dev
X-Gm-Message-State: AOJu0YxMM4c355+Iu867CqvAHohQV6ZmgaqhKz2aniCFqS6N1BaRzhGl
	QCZt9sXiQclhYHT5X1Gs1XFhg6d2kRkfkqcSZ70J3gU/vg8I7Sk2OtyDVPAPuIcMPJMxVolJ1zh
	pU6Y9OsaruLiYawPpYdKoqjwtnMRGoqg=
X-Gm-Gg: ASbGnctcKvL8eLC6iguIMM/KAaP8MHvhkw7updsm6AMgCBWRIiWVxNHTa/7p3pcbA76
	Y3V6FeXbKkUp9uRZ3qhrjVj5IlUGhJfiCJ6pb4hD1kYEUR0LzwzTbdIQRLdkFL5pXqvUDJ+aGfO
	sTSDABa8LsLYVN/TLZwSFKAzEgOT9qU6veSGEQqw+HkzaJtFjf3KW4UMWY4tmJnKBPulKEdlm07
	594NdmgHsYQh+fsy0OOEKVB5QhHuwS/XuvWBd/Eu/ze+K+JTx9brryf70k8esGrvzPS0Van+/dh
	ryRndo3X8ibaSF5fp5p3pBqcL5eXBg==
X-Google-Smtp-Source: AGHT+IHB8B5L3u8WbMDNbmjmms33DeNsuKSJCMufZx22juNs/gndSdpSi8DIUT2dxhoELBY0BdEhQ4H+/Q41jUC1tb8=
X-Received: by 2002:a05:6402:1810:b0:634:4d7a:4d94 with SMTP id
 4fb4d7f45d1cf-63c1f6d9335mr18957800a12.34.1761231907807; Thu, 23 Oct 2025
 08:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250929115405.25695-2-sidharthseela@gmail.com>
 <486e0d6b-799e-4fec-9e6d-3ddfdd64418c@arm.com> <cb30af9e-c22b-485a-a83c-f395880cd799@linuxfoundation.org>
In-Reply-To: <cb30af9e-c22b-485a-a83c-f395880cd799@linuxfoundation.org>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Thu, 23 Oct 2025 20:34:55 +0530
X-Gm-Features: AS18NWA765vw_3LiOpRHjjahBitbX6N7WFYKyQWJzAW1GbNsAm0JUy1d7Tv4rWQ
Message-ID: <CAJE-K+D6ODXnMtS+pbQ-GpyTy8PLyycqK19P_EgnZzKbKwoOog@mail.gmail.com>
Subject: Re: [PATCH v1] selftests: cachestat: Fix warning on declaration under label
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Dev Jain <dev.jain@arm.com>, nphamcs@gmail.com, hannes@cmpxchg.org, 
	nathan@kernel.org, shuah@kernel.org, morbo@google.com, justinstitt@google.com, 
	nick.desaulniers+lkml@gmail.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Make sure to not use "---" in your commit logs. Everything after
> this line gets thrown away. I had to go fix it manually.
Sorry, I will make sure that doesn't happen again.

-- 
Thanks,
Sidharth Seela
