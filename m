Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2241799F
	for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752782100; cv=none; b=Bcro0p4jh8eb3r+v+vmMk8xZWF52qFztWxD7/Q0OSxjQKBUR0uRohU0AXBAPvS+8BgYiMmA+RYx7cYgWxP+inJDSvbZQVMtlcILmERJHteJV70PzJugZD3CQUxIsV/ai5cWLTo5u9j01NC891SULHzyYRxEARF6BzpAZl1r7Qk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752782100; c=relaxed/simple;
	bh=0h2lyjbgDtvP1+EvQ+MHIsDbe4vYkBlFtUjmlhCEO9E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uu61v+5XQCHgKwBVTTTBANPEHEKn6N3bL4SOPmuyC5POupMVYm+QX3aUEs65VqOrq8U4CdIyPSGWnRnPaOPo1lu5SLz0C1pSqHGwnC6sSedsTZXt4F4sZkJ2o6SpmA5WhQmSIAF5LKB6B9Id8tGIRnE56PrIzMgijGpAjQl/IlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEqCkonV; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEqCkonV"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55502821bd2so1733326e87.2
        for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 12:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752782097; x=1753386897; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h2lyjbgDtvP1+EvQ+MHIsDbe4vYkBlFtUjmlhCEO9E=;
        b=HEqCkonVg+t6ZM+ODUndaUJfwJBs72NtMF9AdsPEwa8SCMVtqDWCHvGwLAQK0LVOVW
         8kR35OYSCPOFU0xjXKtFoXu7/kMmI9+q8u7vooj9uK/bGjm/8h89yKiDZHjMSD2uNSgk
         8hKfQ5Z280C/fi8AbVws8n6XT245ULeAo4cyaD9yo+uCeFvuRiYRp0z+dpqYjmSO6hPE
         Zw0zpPqNTjfDMtlt1AaIv2BEvOEDIJvEgj+IH5XUZY5RUy8cTmGTyPScZOf5gfrDKpGK
         Cy0qjcqAtBm4Px2fBNhT85pJixvkw7fJJGCYgl+xDifnGuxn1TCHnLduOaytqjIFvakY
         Z5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752782097; x=1753386897;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0h2lyjbgDtvP1+EvQ+MHIsDbe4vYkBlFtUjmlhCEO9E=;
        b=I7sHcmdBEwmB4/56hRNr3b0XbG7CLJzNmydzo5hYG8TChyBXUOHN2frpjOcVRjcdyl
         hmRuZINxX+jSYDOYMMMdo2duO3mpQyuZc4Jq+lIi7b6kcNknRJVHVCefv5auEUAx57pG
         SlMFBEeKSnh/bWgKI4gBuXsjmqq1Rxu279yOHTHjgo6YZHd9VWdHw6M6NObSGPV1jtc6
         pu1yIWSEVvA/liom/+Hx60PcSiWTVO5UJQtAOHtHPNMn6eihvbjgGiOLyl6Y3PmU4+QU
         3rD/MWkiFdk0PWvT5h3G+Tz9zQC7iM7t9QsnZ7NZn8IJSgSqLy7LsLY4EBJvLJ7mJp3I
         Z9JQ==
X-Gm-Message-State: AOJu0YwMNYFpsGYubzZINk+FKKkqiEPM3LIKD9xgzWX81lZ7t0HlkIZ/
	JHrzWQmKx1oDirr8BIe3MGfMKbf5+01NPdnYnTo3qsTbTft/KiTsdbBilai4KAAlc5F7VR5a4ax
	MsplMP8LhDgTDMblkRRDOYSEXdR+k9sA=
X-Gm-Gg: ASbGncsJb98F1ya00+rEPPkFjjBFUVQx9l/Lg77sJ4EdVExt9lhzuQx0dq7hj5aUDXW
	aBxTNCALmZqdRQfrBEaNYQl/3Iz5TA0PMk3F26cfBNUrjyaAf02Nda4DXb3pphycZioonPApPQp
	qCcQ7UPxqlcgWwSl+wwZ7nbyyNR3c7GoQ3O6VsOnkc97eD336w0ZuRVn4SsngXCX5u3mRK+/4VJ
	P7rJ6o4
X-Google-Smtp-Source: AGHT+IH5XdDWVWpWrVPcDX70c4xbyQgsfeWH5fEbnmhuSk2PbnTVSy0Q1bW2+A1eBVnRRVZWV1n6Yevf79ZEWmEhn68=
X-Received: by 2002:a05:6512:130b:b0:54f:bf00:6f38 with SMTP id
 2adb3069b0e04-55a23f73fa4mr2436839e87.45.1752782096297; Thu, 17 Jul 2025
 12:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 17 Jul 2025 21:54:24 +0200
X-Gm-Features: Ac12FXzMWx-zp_KDt4TK2NERbagd_IBXht0pCDRnKjG5YQ0RlFh31OB6NloxM5o
Message-ID: <CA+icZUV_NGd5R3=YdE9zg7HeBK1adhj_j7Kpp5-GhOMJLsXyWw@mail.gmail.com>
Subject: [LLVM/Clang] Known issues with Linux v6.12.39 and CFI
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi LLVM/Clang folks,

Hope you are well.

Writing from a Windows host...

So, Debian/trixie aka version 13 is FROZEN and will be released soon.

I was using LLVM toolchains from kernel.org - my last Linux-kernel was
version 6.12.11 compiled with LLVM-19.1.6 released 17-Dec-2024,

Normally, I use Debian's kernel-config - modified to Clang-CFI and
using mostly ZSTD settings where possible (ZRAM, (de)compress
initramfs, etc.).

Are there additional patches necessary - kernel-side - planning with
v6.12.39 released some hours ago?
As you can see I did not follow Kernel development for a while - 6 months or so.

Best thanks and regards,
- Sedat -

Link: https://cdimage.debian.org/cdimage/
Link: https://mirrors.edge.kernel.org/pub/tools/llvm/files/
Link: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tag/?h=v6.12.11
Link: https://mirrors.edge.kernel.org/pub/tools/llvm/files/llvm-19.1.6-x86_64.tar.xz
Link: https://mirrors.edge.kernel.org/pub/tools/llvm/files/llvm-19.1.6-x86_64.tar.sign
