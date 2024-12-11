Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AD0239BA8
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733914028; cv=none; b=B0jypiLwEUbx8Y48neN2iZcIE1JnN3GstUwv32bF/Bi/CmlLiWe6PK1UOLUtzniQ02yRZvifPcKITOOdg1/k3qa4RMfRe9KwOl93b4GY82dvCBVdvulrTP/5r3YyNiJwaAA3axE0HWwPz2lM61sf65OxFw5+F7T1vayOPtys3tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733914028; c=relaxed/simple;
	bh=nKjcDcJB4jySgsM+5Bv4lh0SR2eEjEafuclhhXKVV5Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=S9HO1aJFOAAV1q3mZfXTYKSmZLWYLBJEXZJeRiQte1/049oWsM0bchDpa+bYKbzD//lKsySKPDeIZm9aMSm+04wPYapixiI/h2HQw9+VkWzgEih31Go9/Iplgp61pcU3GB6lG4YtchF9eEYSuRM3VjZcDJiS6TJp0xg3SGkr9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b=MooBv+qx; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="MooBv+qx"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd51285746so2163663a12.3
        for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1733914026; x=1734518826; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nKjcDcJB4jySgsM+5Bv4lh0SR2eEjEafuclhhXKVV5Y=;
        b=MooBv+qx9NMWCB4uutTCMngKl7jPiJ9yc6U6fdxkSzzT/uSViTH3OHdMC8pKxXgns1
         Vmw0z6a3gPcCtW4tu2cobI1gzFb2QedSewxn2Q01yQBNUYP0YvdNSZ1QK4gPbNhf6Eo1
         Mhgbd8cFd6yRR6MrwiAjjGViOr/HdJ9FCUbmQ2umw4EV9xUXznGLMr1X15Craf3pPnTf
         RulKjHqekdrKVQZiARQ1EA4bDUMsKOsaChUUcPxidI0zJ6mA5RrnpGuBACVFnon5Xatt
         +vhomtQ6w+Kkots6QDUGrExsKFvhIslUrw3y50siOd2yZ2ropcPMZZQ8kh8Tnrop9IOA
         4jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733914026; x=1734518826;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKjcDcJB4jySgsM+5Bv4lh0SR2eEjEafuclhhXKVV5Y=;
        b=Yh19hot9reeGTd15lYIwsCdjgZnLN5xyxGWOrgRty4XRtcJEsPOuw5ZY1oK5H0tgL3
         bqWiDjM0VKdc3KvO8wm5hv6AEGaZdkjbAyzBI6kvhIT/jQyngvptmUL3Cyf5P4qsWj7z
         aFb83fOR1uJyTsrDgjXhL/GqV0589k+6aAo7dX+CNpTrNuxoZIg5cluhPW0FF83sH67v
         bQvsrZUsUWFvkWQDx0JWak7ORHZWXkckKnKXLBAaYlExRpSXgD0i/7kh+og7QV5BZIKK
         n6/QTH1gfM7zfpZJXOtki4pk+JeNUw6PS3h3EqaV488rC0vnO3WPEyRfw2wiBMykKL/w
         o2JA==
X-Forwarded-Encrypted: i=1; AJvYcCW4BKre4IboVMEHjE8gQNr+YY5IvivuYK8KADnVJTmW5HTHghpxe6C39+CPxnHAB9Mrn+iW@lists.linux.dev
X-Gm-Message-State: AOJu0YwLJpmK1ovxgvdyBAWiPhWZHHpcpYLFm8B011/8ISRUMAN67N53
	ompfiRITzI3Kl06k4U+iV6PVgVBCtMnNcu81nCnFX0CmiMbdyp410H6cjW01wGxwRi8YJxrFKV7
	ofdh9U7yrPeQVFu32IlMM0VRzQo25YfCaQE6E
X-Gm-Gg: ASbGncvEuGoSqGl32Ce9SdusR8DYiWb/MV9EO+G9qEWiRU8tDwTPxP43qFUqSgNq9uL
	FDREc4CwBlE84YSFcHrDzRiz9JRqT7TdeUYCHIc6lRnCBIbxHGb9KnoC45Wbn33mMxgwFIg==
X-Google-Smtp-Source: AGHT+IEfc10uei7wMAJXp3wNIDyhS3tTRIVNGgwU+Xml++f4NrLtyZznzfdG3yC/KG2xrJEx7qUX2s8l+mP+Egmyjxk=
X-Received: by 2002:a17:90b:1b47:b0:2ee:5bc9:75b5 with SMTP id
 98e67ed59e1d1-2f127f8debbmr3550949a91.4.1733914026227; Wed, 11 Dec 2024
 02:47:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 11 Dec 2024 10:46:55 +0000
Message-ID: <CAHbf0-FQCNkOg4F=cjOCGsD0QzxrSj99ssYaH+9A=GnSn+PqrQ@mail.gmail.com>
Subject: Re: [PATCH] bpf: replace deprecated strncpy with strscpy
To: justinstitt@google.com
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-hardening@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, martin.lau@linux.dev, 
	morbo@google.com, Nathan Chancellor <nathan@kernel.org>, ndesaulniers@google.com, 
	sdf@google.com, song@kernel.org, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi

I'm not sure if it was this patch or an older one but I'm seeing the
following warning when compiling/linking with Clang 19.1.5

vmlinux.o: warning: objtool: ___bpf_prog_run+0x44: sibling call from
callable instruction

Cheers

Mike
